<?php
//引入配置文件
error_reporting(E_ALL);
ini_set("display_errors", "On");
session_start();
require_once '../lib/config.php';
//引入AES
require_once '../lib/Ss/AES/aes.class.php';
require_once '../lib/Ss/AES/aesctr.class.php';
require_once '../lib/config.php';
require_once '_check.php';
$sub  = $_POST['code_sub'];
$type = $_POST['code_type'];
$num  = $_POST['code_num'];
$c = new \Ss\User\InviteCode();
$c->AddCode($sub,$type,$num);
echo json_encode(array("status"=>true,"msg"=>"成功"));
?>