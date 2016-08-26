<?php
error_reporting(E_ALL);
ini_set("display_errors", "On");
require_once 'lib/config.php';

if (isset($_REQUEST['id'])&&isset($_REQUEST['method'])&&isset($_REQUEST['id'])){
    $node_id = $_REQUEST['id'];
    $node = new \Ss\Node\ServerManager();
    
    if($_REQUEST['method'] == 'command' && !empty($_REQUEST['command'])){
        if($_REQUEST['command'] == 'done')
            $node->set_command($node_id, 'NULL');
    }
    
    
    elseif ($_REQUEST['method'] == 'updateall'){
        if(!isset($_REQUEST['load'])||!isset($_REQUEST['cpu'])||!isset($_REQUEST['upload'])||
            !isset($_REQUEST['download'])||!isset($_REQUEST['memory'])||!isset($_REQUEST['uptime'])||
            !isset($_REQUEST['connections'])||!isset($_REQUEST['status'])){
                die('Bad Requesrt');
            }
        $node->update_server_full_info($node_id, $_REQUEST['load'], $_REQUEST['cpu'], $_REQUEST['upload'],
            $_REQUEST['download'], $_REQUEST['memory'], $_REQUEST['connections'], $_REQUEST['status'], $_REQUEST['uptime']);
        $command= $node->get_command($node_id); //获取待执行命令
        echo json_encode($command);
        exit;
    }
    
    
    
    elseif($_REQUEST['method'] == 'update'){
        $node->update_server_info($node_id, $_REQUEST['load'],$_REQUEST['cpu'],$_REQUEST['upload'], $_REQUEST['download']);
        $command= $node->get_command($node_id); //获取待执行命令
        echo json_encode($command);
        exit;
    }
    elseif ($_REQUEST['method'] == 'show') {
        var_dump($node->get_server_info());
        exit;
    }
}

die('Bad Requesrt');
