<?php
ini_set("display_errors", "On");
error_reporting(E_ALL | E_STRICT);

require_once '../lib/config.php';

$Users = new Ss\User\User();
$us = $Users->AllUser();
$smarty->assign('us',$us);

foreach ($us as $rs){
$time = $rs['plan_end_time'];
$now = time();
if ($time<=$now){
    if( $rs['plan'] == 'A'){
        $Users->db->update("user",[
            "enable"=>'0'
        ],[
            "uid" => $rs['uid']
        ]);
    }
    if( $rs['plan'] == 'C'){
        $Users->db->update("user",[
            "plan"=>'A',
            "u"=>'0',
            "d"=>'0',
            "transfer_enable" => "10737418240"
        ],[
            "uid" => $rs['uid']
        ]);
    }
    if( $rs['plan'] == 'E'){
        $Users->db->update("user",[
            "plan"=>'A',
            "u"=>'0',
            "d"=>'0',
            "transfer_enable" => "21474836480"
        ],[
            "uid" => $rs['uid']
        ]);
    }
}
if( $rs['plan'] == 'D' and $rs['transfer_enable']<='0'){
        $Users->db->update("user",[
            "plan"=>'A',
            "u"=>'0',
            "d"=>'0',
            "transfer_enable" => "10737418240"
        ],[
            "uid" => $rs['uid']
        ]);
    }
if($rs['plan'] == 'E'||$rs['plan'] == 'C'){
    $Users->db->update("user",[
    "transfer_enable" => "1072668082176"
        ],[
        "uid" => $rs['uid']
        ]);
}
} 

