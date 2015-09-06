<?php
require_once '../lib/config.php';
require_once '_check.php';
//权限检查
$level_add = 0; //每一个阶段增加的
$per_add = 0;   //随机增加的数值
$sign_day = 0;
if(!$oo->is_able_to_check_in()){
    $transfer_to_add = 0;
}else {
    $oo->update_sign_day();
    $sign_day = $oo->get_sign_day(); //获得已经签到的天数
    if($sign_day < 10 ){
        $level_add = 0;
        $transfer_to_add = rand($check_min, $check_max);
    }
    elseif($sign_day >= 10 && $sign_day < 20 ){
        $level_add = 100;
    }
    elseif($sign_day >=20 && $sign_day < 30 ){
        $level_add = 200;
    }
    elseif($sign_day >= 30 && $sign_day < 40 ){
        $level_add = 300;
    }

    elseif($sign_day >= 40 && $sign_day < 50 ){
        $level_add = 400;
    }

    elseif($sign_day >= 50 && $sign_day < 60 ){
        $level_add = 500;
    }

    elseif($sign_day >= 60 && $sign_day < 70 ){
        $level_add = 600;
    }

    elseif($sign_day >= 70 && $sign_day < 80 ){
        $level_add = 700;
    }

    elseif($sign_day >= 80 && $sign_day < 90 ){
        $level_add = 800;
    }

    elseif($sign_day >= 90 && $sign_day < 100 ){
        $level_add = 900;
    }
    $per_add = rand($check_min, $check_max);    //随机值get
    $transfer_to_add = $per_add + $level_add; //汇总
	$sign_day= $oo->get_sign_day();
    $oo->update_last_check_in_time();
    $oo->add_transfer($transfer_to_add*$tomb);
}

$a['msg'] = "获得了".$per_add."MB流量+连续签到".$sign_day."天".$level_add."MB流量"; //per_add+level_add
echo json_encode($a);
