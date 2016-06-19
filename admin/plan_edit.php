<?php
error_reporting(E_ALL);
ini_set("display_errors", "On");
session_start();
require_once '../lib/config.php';
require_once '_check.php';
require_once '_main.php';
$plan = new Ss\Plan\Plan();

if (is_array($_GET) && count($_GET) == 2){
    if (!isset($_GET['id']) || !isset($_GET['method']))
    die('呵呵哒！ Bad Request!');
        $id = intval($_GET['id']);
        $method = $_GET['method'];        
}

else
    die('Bad Request!');
    
    $planinfo = array();
    
if ($method == 'edit'){
    $planinfo = $plan -> db -> select('plan', '*',['id' => $id])[0];
    $smarty->assign('title', $planinfo['plan'].'类套餐的'.$planinfo['plan_id'].'号计划');
    $smarty->assign('rs',$planinfo);
    $smarty->assign('submit','修改');
}
if ($method == 'add'){
    $planinfo = array('id'=>0,'plan'=>'', 'type'=>'', 'data'=>'', 'url'=>'', 'plan_id'=>'', 'money'=>'');
    $smarty->assign('title', '套餐');
    $smarty->assign('rs',$planinfo);
    $smarty->assign('submit','添加');
}
$smarty->assign('method',$method);
$smarty->display('admin/plan_edit.tpl');
