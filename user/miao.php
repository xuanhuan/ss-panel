<?php
ini_set("display_errors", "On");
error_reporting(E_ALL | E_STRICT);
session_start();
require_once '_main.php';

$plan = new Ss\Plan\Plan();

$plan_A = $plan->get_plan_list('A');
$plan_B = $plan->get_plan_list('B');
$plan_C = $plan->get_plan_list('C');
$plan_D = $plan->get_plan_list('D');
$plan_E = $plan->get_plan_list('E');
$plan_F = $plan->get_plan_list('F');

$smarty->assign('plan_A', $plan_A);
$smarty->assign('plan_B', $plan_B);
$smarty->assign('plan_C', $plan_C);
$smarty->assign('plan_D', $plan_D);
$smarty->assign('plan_E', $plan_E);
$smarty->assign('plan_F', $plan_F);

$smarty->display('user/miao.tpl');
?>