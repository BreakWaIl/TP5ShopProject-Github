<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2018/6/22
 * Time: 23:00
 */
namespace app\admin\controller;
use app\home\model\Order;

class OrderController extends CommonController
{
    //查询物流
    public function queryLogistics()
    {
        //判断是否为ajax请求
        if(request()->isAjax()){
            //物流加密logistics_key
            $logistics_key = config('logistics_key');
            $number = input('number');
            $company = input('company');
            //使用file_get_contents(url)模拟get请求
            $url = "http://www.kuaidi100.com/applyurl?key={$logistics_key}&com={$company}&nu={$number}&show=0";
            echo file_get_contents($url);
        }
    }

    //更新物流信息
    public function upd()
    {
        //判断是否为post请求
        if(request()->isPost()){
            //接收提交的数据
            $postData = input('post.');
            //进行规则验证
            $result = $this->validate($postData,'Order.logistics',[],true);
            //对验证进行判断
            if($result !== true){
                $this->error(implode(',',$result));
            }
            //进行物流信息更新
            $orderModel = new Order();
            //更改发货状态 为已发货
            $postData['send_status'] = 1;
            if($orderModel->isUpdate(true)->save($postData) !== false){
                $this->success('分配物流成功',url('admin/order/index'));
            }else{
                $this->error('分配物流失败');
            }
        }
        //获取当前id
        $id = input('id');
        //根据id查找数据
        $data = Order::find($id);
        //分配数据 变量至模板
        return $this->fetch('',[
            'data' => $data,
        ]);

    }

    public function index()
    {
        //接收查询关键字
        $keyword = trim(input('keyword'));
        //拼接查询条件
        $where = '';
        if($keyword){
            //使用or连接查询条件 只要满足一个即可
            $where .="receiver like '%{$keyword}%' or tel like '%{$keyword}%' or order_id like '%{$keyword}%' or address like '%{$keyword}%'";
        }
        $lists = Order::alias('t1')
            ->field('t1.*,t2.username')
            ->where($where)
            ->join("sh_member t2",'t1.member_id = t2.member_id','left')
            ->paginate(1);
        //判断是否为ajax请求
        if(request()->isAjax()){
            //获取分页信息和页码
            $result = [
                //获取分页页码
                'pagelist' => $lists->render(),
                //获取分页详情
                'tbody' => $this->fetch('order/tbody',['lists'=>$lists])
            ];
            return json($result);
        }
        return $this->fetch('',['lists'=>$lists]);
    }
}