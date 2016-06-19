<?php

require_once '../lib/config.php';
require_once '_check.php';
$Plan = new Ss\Plan\Plan();
$UserInfo = new Ss\User\UserInfo($uid);

if(isset($_POST['id']) && isset($_POST['method'])){
    $id = intval($_POST['id']);
    $plan = $Plan -> get_plan_info($id);
    $method = $_POST['method'];
    
    if ($plan){
        $user_info = $UserInfo->UserArray();
        if($method == 'buy'){
            if($user_info['money'] < $plan['money']){
                die(json_encode(['code'=>0, 'info'=>'您的余额不足，请充值后再购买，或者直接购买兑换码兑换']));
            }
            switch ($plan['type']) {
                case 'Tc'://普通流量
                    $UserInfo->update_transfer($plan['data']*1024*1024*1024+$user_info['transfer_enable']);
                    $UserInfo->Changeplan('B');
                    $UserInfo->update_plan_end_time(365);   //流量用户默认加一年
                    
                    $info ='购买成功！<br>您成功添加了'.$plan['data'].'GB的流量<br>当前流量：'.$UserInfo->get_transfer()/1073741824.0.' GB';
                    break;
                    
                case 'Ta'://高级流量
                    //高级流量不计算剩余流量
                    $UserInfo->update_transfer($plan['data']*1024*1024*1024);
                    $UserInfo->Changeplan('D');
                    $UserInfo->update_plan_end_time(365);   //流量用户默认加一年
                    
                    $info ='成功！<br>您成功添加了'.$plan['data'].'GB的流量<br>当前流量：'.$UserInfo->get_transfer()/1073741824.0.' GB';
                    break;
                    
                case 'Ca'://高级周期
                    $UserInfo->Changeplan('E');
                    $UserInfo->update_plan_end_time($plan['data']);
                    
                    $info ='成功！<br>您已修改为高级节点无限流量套餐！<br>到期日期：<code>'.date('Y-m-d H:i:s', $UserInfo->get_plan_end_time()).'</code>';
                    break;
                    
                case 'Cc'://普通周期
                    $UserInfo->Changeplan('C');
                    $UserInfo->update_plan_end_time($plan['data']);
                    $info ='成功！<br>您已修改为普通节点无限流量套餐！<br>到期日期：<code>'.date('Y-m-d H:i:s', $UserInfo->get_plan_end_time()).'</code>';
                    break;
            }
            $UserInfo->AddMoney(-$plan['money']);
            if ($oo->get_enable() == 0){
                $UserInfo->set_enable(1);
            }
            echo json_encode(array('code'=>1, 'info'=>$info));
            exit;
        }
        else
        {
            $code = 1;
            switch ($plan['type']) {
                case 'Ta':
                    $info = '本兑套餐包含：高级流量'.$plan['data'].'GB<br>价值为：'.$plan['money'].'喵币';
                    $plan['plan'] = 'D';
                    break;
                case 'Tc':
                    $info='本兑包含：普通流量'.$plan['data'].'GB<br>价值为：'.$plan['money'].'喵币';
                    $plan['plan'] = 'B';
                    break;
                case 'Ca':
                    $info='本兑包含：高级用户，不限流量<br>使用期限：'.$plan['data'].'天<br>价值为：'.$plan['money'].'喵币';
                    $plan['plan'] = 'E';
                    break;
                case 'Cc':
                    $info='本套餐包含：普通用户，不限流量<br>使用期限：'.$plan['data'].'天<br>价值为：'.$plan['money'].'喵币';
                    $plan['plan'] = 'C';
                    break;
            }
            if($user_info['money'] < $plan['money']){
                $code = 0;
                $info .= '<br><span style="color:red">您目前的喵币余额不足，请先充值再购买，或者直接购买兑换码兑换！</span>';
            }
            echo json_encode(['code'=>$code, 'info'=>$info]);
            exit;
        }
        die('hi');
    }
    else
    die(json_encode(['code'=>0, 'info'=>'不存在的计划']));
}
echo json_encode(['code'=>0, 'info'=>'无效的请求']);