<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

    // 应用公共文件
    error_reporting(E_ERROR | E_WARNING | E_PARSE);

    //防止XSS攻击的函数
    function removeXSS($val)
    {
        static $obj = null;
        if($obj === null){
            require '../extend/HTMLPurifier/library/HTMLPurifier.includes.php';
            $obj = new HTMLPurifier();
        }
        return $obj->purify($val);
    }

    //发送短信的方法
    function sendSms($to,$datas,$tempId)
    {
        include_once("../extend/sendSms/CCPRestSmsSDK.php");
        //主帐号,对应开官网发者主账号下的 ACCOUNT SID
        $accountSid= '8a216da86010e690016034c5b116101e';
        //主帐号令牌,对应官网开发者主账号下的 AUTH TOKEN
        $accountToken= 'fb547fb7d10f4536ae401c9f20cad0f8';
        //应用Id，在官网应用列表中点击应用，对应应用详情中的APP ID
        //在开发调试的时候，可以使用官网自动为您分配的测试Demo的APP ID
        $appId='8a216da86010e690016036638281119b';
        //请求地址
        //沙盒环境（用于应用开发调试）：sandboxapp.cloopen.com
        //生产环境（用户应用上线使用）：app.cloopen.com
        $serverIP='app.cloopen.com';
        //请求端口，生产环境和沙盒环境一致
        $serverPort='8883';
        //REST版本号，在官网文档REST介绍中获得。
        $softVersion='2013-12-26';
        // 初始化REST SDK
        //global $accountSid,$accountToken,$appId,$serverIP,$serverPort,$softVersion;
        $rest = new REST($serverIP,$serverPort,$softVersion);
        $rest->setAccount($accountSid,$accountToken);
        $rest->setAppId($appId);

        //发送模板短信
        // echo "Sending TemplateSMS to $to <br/>";
        $result = $rest->sendTemplateSMS($to,$datas,$tempId);
        // halt($result);
        return json($result);
        //Demo调用
        //给手机号17887932352发送验证码为1234，两分钟内有效，1号模板
        //【云通讯】您使用的是云通讯短信模板，您的验证码是1234，请于2分钟内正确输入
        // sendSms(17887932352,array('1234',2),'1')
    }

    //封装发送邮件的函数
    function sendEmail($to,$title,$content)
    {
        // 实例化
        include "../extend/sendEmail/class.phpmailer.php";
        $pm = new PHPMailer();
        // 服务器相关信息
        $pm->Host = 'smtp.163.com'; // SMTP服务器 从163邮箱网站中获取
        $pm->IsSMTP(); // 设置使用SMTP服务器发送邮件
        $pm->SMTPAuth = true; // 需要SMTP身份认证
        $pm->Username = '17887932352@163'; // （邮箱@前面的一部分）登录SMTP服务器的用户名
        $pm->Password = 'liyang0692'; //授权码 登录SMTP服务器的密码

        // 发件人信息
        $pm->From = '17887932352@163.com';   //注册时候的邮箱
        $pm->FromName = '17887932352';  //当前邮箱用户的别名

        // 收件人信息
        $pm->AddAddress($to); // 添加一个收件人 别名为悠然
        //$pm->AddAddress('13761388072@163.com', '13761388072'); // 添加另一个收件人

        $pm->IsHTML(true); //支持富文本html
        $pm->CharSet = 'utf-8'; // 内容编码
        $pm->Subject = $title; // 邮件标题
        $pm->MsgHTML($content); // 邮件内容

        halt($pm->Send()); //成功返回true 失败返回false
        // 发送邮件
        if($pm->Send()){
            return true;
        }else {
            return false;
        }
    }

