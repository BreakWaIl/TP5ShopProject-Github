<?php 
namespace app\home\controller; //所在的命名空间
use app\home\model\Goods;
use app\home\model\Order;
use app\home\model\OrderGoods;
use think\Controller;
use think\Db;
use think\Exception;

class OrderController extends Controller
{
    public function orderInfo()
    {
        //判断是否登陆
        if(!session('member_id')){
            $this->error('请先登陆');
        }
        //判断是否为post提交 执行写入订单操作
        if(request()->isPost()){
            $this->_writeOrder();
            die;
        }
        $goodsModel = new Goods();
        $getCartGoodsData = $goodsModel->getCartGoodsData();
//        halt($getCartGoodsData);exit;
        return $this->fetch('',['cartData'=>$getCartGoodsData]);
    }

    private function _writeOrder()
    {
        //接收用户提交的数据
        $postData = input('post.');
        //数据验证
        $result = $this->validate($postData,'order',[],true);
        if($result !== true){
            $this->error(implode(',',$result));
        }
        $goodsModel = new Goods();
        $getCartGoodsData = $goodsModel->getCartGoodsData();
        //计算总价
        $total_Price = 0;
        foreach($getCartGoodsData as $cart)
        {
            $total_Price += ($cart['goodsInfo']['goods_price']+$cart['attrInfo']['attr_total_price'])*$cart['goods_number'];
        }
        //准备订单入库数据
        $orderData = $postData;
        $orderData['total_price'] = $total_Price;
        $orderData['member_id'] = session('member_id');
        $orderData['order_id'] = date('Ymd').time().uniqid();
        //开启事务进行判断
        Db::startTrans();
        try{
            //对订单入库进行判断
            $order = Order::create($orderData);
            if(!$order){
                throw new \Exception('订单入库失败');
            }
            //入库订单商品表
            foreach ($getCartGoodsData as $cart){
                $orderGoods = OrderGoods::create([
                    'order_id' => $orderData['order_id'],
                    'goods_id' => $cart['goods_id'],
                    'goods_attr_id' => $cart['goods_attr_ids'],
                    'goods_number' => $cart['goods_number'],
                    'goods_price' => ($cart['goodsInfo']['goods_price']+$cart['attrInfo']['attr_total_price'])*$cart['goods_number']
                ]);
                //下单减库存 防止超卖
                $condition = [
                    'goods_id' => $cart['goods_id'],
                    'goods_number' => ['>=',$cart['goods_number']]
                ];
                $num = Goods::where($condition)->setDec('goods_number',$cart['goods_number']);
                if(!$orderGoods || !$num)
                {
                    //说明入库失败 或者 减库存失败
                    throw new \Exception('下单失败，或超卖');
                }
            }
            //提交事物 清空购物车
            Db::commit();
            $cart = new \cart\Cart();
            $cart->clearCart();
        }catch(\Exception $e){
            Db::rollback();
            $this->error($e->getMessage());
        }
        //跳转第三方支付接口进行支付操作
//        echo '支付';die;
        $this->_aliPayMoney($orderData['order_id'],$total_Price);
//        halt($orderData['order_id']);
    }

    //支付宝支付
    private function _aliPayMoney($order_id,$total_price,$title='TP5商城支付宝支付测试',$content='TP5商城支付宝支付测试')
    {
        $payData = [
            //网站生成订单号
            'WIDout_trade_no' => $order_id,
            //订单名称
            'WIDsubject' => $title,
            //订单总额
            'WIDtotal_amount' => $total_price,
            'WIDbody' => $content
        ];
        //引入pagepay/pagepay.php 文件
        include "../extend/alipay/pagepay/pagepay.php";
    }

    //同步跳转
    public function returnurl()
    {
        require_once ("../extend/alipay/config.php");
        require_once '../extend/alipay/apgepay/service/AlipayTradeService.php';
        $arr = input('get.');
        $alipayServie = new \AlipayTradeService($config);
        $result = $alipayServie->check($arr);
        if($result){
            //验证成功
//            halt($arr);
            //商户订单号
            $out_trade_no = htmlspecialchars($_GET['out_trade_no']);
            //支付宝交易号
            $trade_no = htmlspecialchars($_GET['trade_no']);
            //更新支付状态
            $data = [
                'pay_status' => 1, //改为已支付
                'ali_order_id' => $trade_no //改为支付宝订单号
            ];
//            echo "验证成功<br/>支付宝交易号:".$trade_no;
            //更新操作
            if(Order::where('order_id',$out_trade_no)->update($data)){
                $this->success("支付成功",url("home/order/selfOrder"));
            }else{
                $this->error("支付失败",url("home/index/index"));
            }
        }else{
            //验证失败
            echo '验证失败';
        }
    }

    //异步回调
    public function notifyurl()
    {
        require_once ("../extend/alipay/config.php");
        require_once '../extend/alipay/apgepay/service/AlipayTradeService.php';
        $arr = input('post.');
        $alipayServie = new \AlipayTradeService($config);
        $result = $alipayServie->check($arr);
        if($result){
            //验证成功
//            halt($arr);
            //商户订单号
            $out_trade_no = htmlspecialchars($arr['out_trade_no']);
            //支付宝交易号
            $trade_no = htmlspecialchars($arr['trade_no']);
            //更新支付状态
            $data = [
                'pay_status' => 1, //改为已支付
                'ali_order_id' => $trade_no //改为支付宝订单号
            ];
//            echo "验证成功<br/>支付宝交易号:".$trade_no;
            //更新操作
            if(Order::where('order_id',$out_trade_no)->update($data)){
                echo 'success';
            }
        }else{
            //验证失败
            echo '验证失败';
        }
    }

    //个人订单查看
    public function selfOrder()
    {
        $member_id = session('member_id');
        if(!$member_id){
            $this->error('请登录');
        }
        $lists = Order::Where('member_id',$member_id)->select();
        return $this->fetch('',['lists'=>$lists]);
    }

    //支付未付款订单
    public function payMoney()
    {
        $id = input('id');
        $data = Order::find($id);
        if($data){
            $this->_aliPayMoney($data['order_id'],$data['total_price']);
        }else{
            $this->error('支付异常');
        }
    }


}