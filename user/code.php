<?php
ini_set("display_errors", "On");

error_reporting(E_ALL | E_STRICT);
session_start();
require_once '_main.php';

$Code = new Ss\Code\Code();
$UserInfo = new Ss\User\UserInfo($uid);

#$plan_end_time_str= $oo->get_plan_end_time_str();
$smarty->display('user/code.tpl');