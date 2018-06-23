<?php
/**
 * Created by PhpStorm.
 * User: lee
 * Date: 2018/6/23
 * Time: 11:57
 */
namespace app\admin\validate;
use think\Validate;

class Order extends Validate
{
    //定义验证规则
    protected $rule = [
        'company' => 'require',
        'number' => 'require'
    ];

    //定义提示信息
    protected $message = [
        'company.require' => '物流公司信息必填',
        'number.reqire' => '物流单号必填'
    ];

    //定义验证场景
    protected $scene = [
        'logistics' => ['company','number']
    ];
}