<?php
$config = array (	
		//应用ID,您的APPID。
		'app_id' => "2016082700327061",

		//商户私钥
		'merchant_private_key' => "MIIEpQIBAAKCAQEA0vKl+qLO4AoPKYwFCBtXc8yOZLXc8L6NjfG/Xp7vro2EPofHq4OhL4uOq6aDERgdGiSqYof13Z4FDnp8q52WRVgoaazlsNDa2J6R+Ts18AOzuCkiJU8pIghwoY3KtkFxJajVBaSN885Zw8Tj92XuDR1AmpMV/pP1K40lFFJmvgp7856p/vVLBbesXBi1AItjznGIK8cxx2nX5wJnqPKHNmE+9tTXnNsbAiln33sOCTNl5JlpeP5LqFbI3BCIQRE58YI6t0eCQbIb9oCIZLsn1bBkGyd4X/S1ZaeiV4mtiab7h+FMSuWzu2Za1lrB9HrcM20EEcCpbbdoOhKiSIrTIQIDAQABAoIBAGXn6t8Fv8LjmSeNCPE9pCXA8Bke8jkrFN85piVjyo4ct4ItvfvRfxCk7qtlqXOcnpJ+nAE1hUUmjXLNIWUWn/2n9P34FI4yl0aGdCZewFPOtgeFd4VmlIxoX2DsSr15J9v1j9NGB318dkjo2OgvSaz0ML17yOhPOeVsLjl/BTtQnL6cDdj9fM9zqGcMEQYdduJUjXWby3bB3kqBAs7d3mN7EfCSU+e0qXD23z3fHVYSgY26HmJfCpuqMELZs9Va4zHaObdX1KW/q/MTHsRWctFPepVlchJyi56TnbVuridmYXYquWfZOHcF0m25eybzgj8D5G9SuVfeTB0iWdbicQECgYEA6to8CNiiC1kDQy17iqgGoP81kOWzVKh8EB4H4ehGldrQge6gIx+oipSuR2DLNmZiDZI4wQWjntQALNsx44M54tYpQUmQlnjH9OZcskpv0WE+75P8/67HBMd/WaWairpbe51bURPXuOeT9i1C7ATFvNIn9Dj4wHgj0BgGBJKgJekCgYEA5fFepcQzLn4X/4aeAXplBhYBt3l+bWrkrvEv+dXBFdzdDtUA84rwYTmhrcxbdtJlg6kPqynbnw+/RieqjG1ASnygMtNsPVe93EMnSD9yg0C1BZ1SMZoD8ywF1e5p4iuZcN8zmwEVi7FTNMurUM5vzOpjuma2LidbOCyKgX84qHkCgYEAnHETXLEyAG0jBzTc/tg+0jAu9n6MnvA89F+M0KdxnZFNI8BZXAxSsT2pelK4C1zYJEIrHCktfTerhjXdXbikbr5KbPscHaAHUtPBG+MJ6WfmDKF//rHmUQCzjHwMHi1Vk1qW4cNeCAX7QhmUYrQrJES56K2qxktBT/UwzQr/M0ECgYEAiaOCcR1ROao2uTieSeo2oH75xhaOa/aJLoKmohimPGz5UZCEwkNPghMaSUtDEIv+QeInw+AJW1v0tYy21NnsmumghuvxJYLo3fjAgcmgxRotgU/bTF+Rr7SRRa4xaTWJ4ntoi4cJm5WoZbjoMjVvzKwcyA4FTPk37BcVTVCW3JkCgYEAvUQpnR3FcpEQXB0Wjs37cOIf5+bmJb6NriEh5jJl7+7D53RG/tlbyupNkDOjZYlI8shVXVjlibpviT2L2ftXlYW6+VU3t7jab+XAC1AfsAV6d4ecBlW2amSZcPHLFIT1QjYOd97/m0KUlrBdmZmhvqT2n9JQDh0caj3IchrAPNQ=",
		
		//异步通知地址
		'notify_url' => "http://外网可访问网关地址/alipay.trade.page.pay-PHP-UTF-8/notify_url.php",
		
		//同步跳转
		'return_url' => "http://外网可访问网关地址/alipay.trade.page.pay-PHP-UTF-8/return_url.php",

		//编码格式
		'charset' => "UTF-8",

		//签名方式
		'sign_type'=>"RSA2",

		//支付宝网关
		'gatewayUrl' => "https://openapi.alipaydev.com/gateway.do",

		//支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
		'alipay_public_key' => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1Jm6gbSr+GyrDyL9d6W/rjTv+foMXEFDgN6cTQ1RulE4xxZPhwwdLla6jkCa/2SKznUhMJHxb37HZqj24wyLyIAVcvFDDN65qYpsQFMYkv199Yugxg+g9jO/5UdjvJ5WsWFxB5w9Jg5VsVwsOso31D0f2ex0NaxEBWpbgbNkbIK68rJ3Mf0XT/VJOMQKenhVs5hK+umCmXBgIVx/HWtMRycBppi8VZiuBDFTRrydyNhZf/mcUIfaMHkMoo7LAQOKajTtDGxhzaWG03eemXQ4kqUqlb21ePukXumhUYHDCmDSte4PodqA+pjBA8bkFgOH2tMIxrtpCXcne95MqzMS5wIDAQAB",
);