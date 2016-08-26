<?php
error_reporting(E_ALL);
ini_set("display_errors", "On");
require_once 'lib/config.php';
$smarty->assign("tos_content",Ss\ac::get('tos_content',get_defined_vars()));// 用户协议 
$smarty->display('tos.tpl');
?>