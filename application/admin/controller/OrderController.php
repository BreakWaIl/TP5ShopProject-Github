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
    public function index()
    {
        $lists = Order::alias('t1')
            ->field('t1.*,t2.username')
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