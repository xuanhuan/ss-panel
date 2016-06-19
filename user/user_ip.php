<?php
ini_set("display_errors", "On");
error_reporting(E_ALL | E_STRICT);
require_once '_main.php';

$ip= new ss\User\UserInfo();
$datas = $U->get_user_ip_list();
$smarty->assign('U',$U);
$smarty->assign('datas',$datas);
$smarty->assign('a',$a=1);
$smarty->display('user/user_ip.tpl');

