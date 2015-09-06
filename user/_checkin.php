<?php
require_once '../lib/config.php';
require_once '_check.php';
//权限检查
if(!$oo->is_able_to_check_in()){
    $transfer_to_add = 0;
}else {
    if($oo->get_sign_day() < 10 ){
        $transfer_to_add = rand($check_min, $check_max);
    }
    // 以下设定为 连续签到10-20天奖励100MB/20-30天奖励300MB/30天以上奖励500MB 请按需修改
    elseif($oo->get_sign_day() >= 10 && $oo->get_sign_day() < 20 ){
        $transfer_to_add = rand($check_min, $check_max)+100; //
    }
    elseif($oo->get_sign_day() >=20 && $oo->get_sign_day() < 30 ){
        $transfer_to_add = rand($check_min, $check_max)+300;
    }
    elseif($oo->get_sign_day() >= 30){
        $transfer_to_add = rand($check_min, $check_max)+500;
    }
    $oo->update_sign_day();
    $oo->update_last_check_in_time();
    $oo->add_transfer($transfer_to_add*$tomb);
}

$a['msg'] = "获得了".$transfer_to_add."MB流量";
echo json_encode($a);
