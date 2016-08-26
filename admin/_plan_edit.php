<?php
error_reporting(E_ALL);
ini_set("display_errors", "On");
session_start();
require_once '../lib/config.php';
require_once '_check.php';
require_once '../lib/Ss/AES/aes.class.php';
require_once '../lib/Ss/AES/aesctr.class.php';

$plan = new Ss\Plan\Plan();

if (is_array($_GET) && count($_GET) > 0){
    if (!isset($_GET['id']) || !isset($_GET['method']))
    bad_requerst();
    
    $id = intval($_GET['id']);
    $method = $_GET['method'];
}

else 
    bad_requerst();
    
if ($method == 'add' || $method == 'edit'){
    if(!isset($_GET['plan'])||!isset($_GET['plan_id'])||!isset($_GET['type'])||
    !isset($_GET['data'])||!isset($_GET['money'])||!isset($_GET['url'])){
        echo 'Bad Request';
    }
    else{
        $planinfo['plan'] = $_GET['plan'];
        $planinfo['plan_id'] = intval($_GET['plan_id']);
        $planinfo['type'] = $_GET['type'];
        $planinfo['data'] = intval($_GET['data']);
        $planinfo['url'] = addslashes(strip_tags($_GET['url']));
        $planinfo['money'] = filter_var($_GET['money'],FILTER_VALIDATE_FLOAT);
        if (!$planinfo['money'])
            bad_requerst();
        if (strlen($planinfo['plan']) == 1 && $planinfo['plan'] >= 'A' && $planinfo['plan'] <= 'F'){
            if ($method == 'add'){
                if($plan->has_plan($planinfo['plan'], $planinfo['plan_id'])){
                    echo json_encode(array('code' => 0, 'info' => '添加失败，该类计划中已存在id为'.$planinfo['plan_id'].'的记录'));
                }
                else
                    if(!$plan->add_plan($planinfo)){
                        echo json_encode(array('code'=>1, 'info'=>'成功'), JSON_UNESCAPED_UNICODE);
                    }
                    else{
                        echo json_encode(array('code'=>0, 'info'=>'未知原因，添加失败'), JSON_UNESCAPED_UNICODE);
                    }
            }
            
            if ($method == 'edit'){
                $planinfo['id'] = $id;
                $plan->update_plan($planinfo);
                echo json_encode(array('code'=>1, 'info'=>'计划修改成功'), JSON_UNESCAPED_UNICODE);
            }
        }
        else
        bad_requerst();
    }
}
    
if ($method == 'delete'){
    if ($plan -> delete_plan($id)){
        echo json_encode(array('code'=>1, 'info'=>'删除成功'), JSON_UNESCAPED_UNICODE);
    }
    else {
        echo json_encode(array('code' => 0, 'info' => '删除失败，可能是尝试删除不存在的记录'));
    }
}


function bad_requerst(){
    die('{"info":"bad requrest"}');
}