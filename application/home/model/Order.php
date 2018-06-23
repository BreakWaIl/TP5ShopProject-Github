<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2018/6/22
 * Time: 19:15
 */
namespace app\home\model;
use think\Model;

class Order extends Model
{
    protected $pk = 'id';
    protected $autoWriteTimestamp = true;

    //定义验证规则
    protected $rule = [
        'receiver' => 'require',
        'address' => 'require',
        'tel' => 'require',
        'zcode' => 'require',
    ];

    //定义验证信息
    protected $message = [
        'receiver.require' => '收货人必填',
        'address.require' => '收货地址必填',
        'tel.require' => '手机号必填',
        'zcode.require' => '邮编必填'
    ];
}