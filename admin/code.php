<?php
//开启session
error_reporting(E_ALL);
ini_set("display_errors", "On");
session_start();
require_once '_main.php';

$code = new Ss\Code\Code();
$smarty->assign('used', $code->get_used_id());
$smarty->display('admin/code.tpl');
?>