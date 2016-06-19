<?php
error_reporting(E_ALL);
ini_set("display_errors", "On");

session_start();
require_once '../lib/config.php';
require_once '_check.php';
$notice = new Ss\Notice\Notice();


if (empty($_POST['item']) || empty($_POST['introduction']) || empty($_POST['value'])){
    die(json_encode(array('code' => '0', 'info'=>'无效的请求')));
}

$item = preg_replace("/[^a-zA-Z0-9_]/", "", $_POST['item']); //过滤用户输入
$introduction = $_POST['introduction'];
$value = $_POST['value'];


$notice->update_notice($item, $introduction, $value);
echo json_encode(['code'=>1, 'info'=>'修改成功']);
exit;
