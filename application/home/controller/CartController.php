<?php 
namespace app\home\controller; //所在的命名空间
use cart\Cart;
use think\Controller;
use think\Db;    //引入Controller请求类

class CartController extends Controller
{

    public function ajaxaddcart()
    {
        if(request()->isAjax())
        {
            //判断用户是否登陆
            if(!session('member_id')==1)
            {
                return json_encode(['code'=>-1,'message'=>'请先登陆']);
            }
        }
        //获取商品id
        $goods_id = input('goods_id');
        //获取商品属性id
        $goods_attr_ids = input('goods_attr_ids');
        //获取商品数量
        $goods_number = input('goods_number');
        //实例化扩展下cart
        $cart = new \cart\Cart();
        $cart->addCart($goods_id,$goods_attr_ids,$goods_number);
        //成功返回添加成功
        return json(['code'=>200,'message'=>'添加成功']);
    }

    //显示购物车列表
    public function cartList()
    {
        //判断用户是否登陆
        if(!session('member_id')){
//            $this->redirect('home/public/login','请登录');
            $this->error('请登录',url('home/public/login'));
        }
        //获取当前购物车数据
        $cart = new \cart\Cart();
        $cartInfo = $cart->getCart();
        //构造数组，查询数据
        $cartData = [];
        foreach ($cartInfo as $key => $goods_number)
        {
            $arr = explode('-',$key);
            $cartData[] = [
                'goods_id' => $arr[0],
                'goods_attr_ids' => $arr[1]?:'',
                'goods_number' => $goods_number
            ];
        }
        //循环$cartData,在每个元素加个下标goodsInfo和attrInfo，存储对应的商品属性和信息
        foreach ($cartData as $k => $data)
        {
            //获取商品信息
            $cartData[$k]['goodsInfo'] = Db::name('goods')->find($data['goods_id']);
            //获取商品属性信息
            $cartData[$k]['attrInfo'] = Db::name('goods_attr')
                ->field("sum(t1.attr_price) attr_total_price ,group_concat(t2.attr_name,':',t1.attr_value,'￥',t1.attr_price separator '<br/>') as singleAttr")
                ->alias('t1')
                ->join('sh_attribute t2','t1.attr_id = t2.attr_id','left')
                ->where("t1.goods_attr_id",'in',$data['goods_attr_ids'])
                ->find();
        }
//        halt($cartData);
        return $this->fetch('',[
            'cartData'=>$cartData
        ]);
    }

    //实现ajax删除购物车商品
    public function ajaxDelCartGoods()
    {
        if(request()->isAjax())
        {
            $cart = new \cart\Cart();
            $status = $cart->delCart(input('goods_id'),input('goods_attr_ids'));
            if($status){
                return json(['code'=>200,'message'=>'删除成功']);
            }else{
                return json(['code'=>-1,'message'=>'删除失败']);
            }
        }
    }

    //实现ajax清空购物车商品
    public function ajaxClearCartGoods()
    {
        //判断是否为ajax请求
        if(request()->isAjax()){
            $cart = new \cart\Cart();
            if($cart->clearCart()){
                return json(['code'=>200,'message'=>'购物车已被清空']);
            }else{
                return json(['code'=>-1,'message'=>'购物车清空失败']);
            }
        }
    }

    //实现商品数量的更改
    public function changeCartNum()
    {
        //获取商品id
        $goods_id = input('goods_id');
        //获取商品属性id
        $goods_attr_ids = input('goods_attr_ids');
        //获取商品数量
        $goods_number = input('goods_number');
        $cart = new \cart\Cart();
        if($cart->changCartNum($goods_id,$goods_attr_ids,$goods_number)){
            return json(['code'=>200,'message'=>'商品数量变更成功']);
        }else{
            return json(['code'=>-1,'message'=>'商品数量变更失败']);
        }
    }
}