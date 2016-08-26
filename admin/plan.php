<?php
session_start();
require_once '_main.php';

$plan = new Ss\Plan\Plan();
$entire_plan['A'] = $plan->get_plan_list('A');
$entire_plan['B'] = $plan->get_plan_list('B');
$entire_plan['C'] = $plan->get_plan_list('C');
$entire_plan['D'] = $plan->get_plan_list('D');
$entire_plan['E'] = $plan->get_plan_list('E');
$entire_plan['F'] = $plan->get_plan_list('F');

foreach ($entire_plan as &$plan_list) {
    foreach ($plan_list as &$single_plan) {
        switch ($single_plan['type']) {
            case "Tc":
                $single_plan['type']='普通流量';
                $single_plan['data'] .='GB';
                break;
            case "Ta":
                $single_plan['type']='高级流量';
                $single_plan['data'] .='GB';
                break;
            case "Cc":
                $single_plan['type']='普通周期';
                $single_plan['data'] .='天';
                break;
            case "Ca":
                $single_plan['type']='高级周期';
                $single_plan['data'] .='天';
                break;
            case "M":
                $single_plan['type']='钱';
                $single_plan['data'] .='元';
                break;
            default:
                $single_plan['type']='未定义类型';
                break;
        }
    }
}


$smarty->assign('plan_A', $entire_plan['A']);
$smarty->assign('plan_B', $entire_plan['B']);
$smarty->assign('plan_C', $entire_plan['C']);
$smarty->assign('plan_D', $entire_plan['D']);
$smarty->assign('plan_E', $entire_plan['E']);
$smarty->assign('plan_F', $entire_plan['F']);

$smarty->display('admin/plan.tpl');
?>