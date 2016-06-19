<?php
error_reporting(E_ALL);
ini_set("display_errors", "On");
session_start();
require_once '_main.php';

$plan_class = new Ss\Plan\Plan();
$code = new Ss\Code\Code();

$method = $_GET['method'];

if($method == 'get_plan_list'){
    $plan = $_GET['plan'];
    $plan_id = array();
    $plan = $plan_class -> get_plan_list($plan);
    foreach ($plan as $value) {
        $plan_id[] = array('id'=>$value['id'],'plan_id' => $value['plan_id']);
    }
    echo json_encode($plan_id);
}

if ($method == 'get_plan_info' ){
    $id = intval($_GET['id']);
    $plan_info = $plan_class->get_plan_info($id);
    switch ($plan_info['type']) {
        case 'M':
            $info = '此套餐包含喵币'.$plan_info['data'].'元';
            break;
        case 'Ca':
            $info = '此套餐包含高级节点'.$plan_info['data'].'天使用权';
            break;
        case 'Cc':
            $info = '此套餐包含普通节点'.$plan_info['data'].'天使用权';
            break;
        case 'Ta':
            $info = '此套餐包含高级流量'.$plan_info['data'].'G';
            break;
        case 'Tc':
            $info = '此套餐包含普通流量'.$plan_info['data'].'G';
            break;
        default:
            $info = '无效的计划类型';
            break;
    }
    $info.=',价格：￥'.$plan_info['money'].' 元';
    $plan_info['info'] = $info;
    echo json_encode($plan_info);
}

if ($method == 'generate'){
    if(isset($_GET['id'])&&isset($_GET['amount'])&&isset($_GET['time'])){
        $id = intval($_GET['id']);
        $amount = intval($_GET['amount']);
        $ret = $code->generate_code($id, $amount, ['year'=>2016, 'month'=>9, 'day'=>'15']);
        if ($ret['info']!=''){
            die('无效的编号');
        }
        $plan_info = $plan_class->get_plan_info($id);
        $filename='兑换码.txt';
        header("Content-Type: application/octet-stream");
        header('Content-Disposition: attachment; filename="' . $filename . '"');
        echo "***********************************\r\n";
        printf("申请人：%s\r\n", $U->GetUserName());
        printf("生成时间：%s\r\n", date('Y/m/d H:i:s',time()));
        if($plan_info['type']=='Ca'){
        echo "高级节点计划   plan id为".$plan_info['plan_id']."\r\n";
        echo $plan_info['data']."天 价格为".$plan_info['money']."\r\n";}
        if($plan_info['type']=='Cc'){
        echo "普通节点计划   plan id为".$plan_info['plan_id']."\r\n";
        echo $plan_info['data']."天 价格为".$plan_info['money']."\r\n";}
        if($plan_info['type']=='Ta'){
        echo "高级节点流量   plan id为".$plan_info['plan_id']."\r\n";
        echo $plan_info['data']."GB流量 价格为".$plan_info['money']."\r\n";}
        if($plan_info['type']=='Tc'){
        echo "普通节点流量   plan id为".$plan_info['plan_id']."\r\n";
        echo $plan_info['data']."GB流量 价格为".$plan_info['money']."\r\n";}
        if($plan_info['type']=='M'){
        echo "喵币充值   plan id为".$plan_info['plan_id']."\r\n";
        echo "喵币".$plan_info['data']."个 价格为".$plan_info['money']."\r\n";}
        echo "\n生成数量".$amount."个\r\n";
        echo "***********************************\r\n\r\n";
        foreach($ret['code'] as $co){
            echo $co."\r\n";
        }
        exit;
    }
    else
        die('bad');
}
?>
