<?php
error_reporting(E_ALL);
ini_set("display_errors", "On");

require_once '_main.php';

$Notice = new Ss\Notice\Notice();
$notice = ['item' => '', 'introduction'=>'', 'value'=>''];

if (isset($_GET['item']))
{
    $item = preg_replace("/[^a-zA-Z0-9_]/", "", $_GET['item']); //过滤用户输入
    if ($Notice->has_notice($item)){
        $notice = $Notice->get_notice($item);
        $header = '修改'.$notice['introduction'];
    }
}
else
    $header = '添加公告';

$smarty->assign('header', $header);
$smarty->assign('item', $notice['item']);
$smarty->assign('introduction', $notice['introduction']);
$smarty->assign('value', $notice['value']);
$smarty->display("admin/notice.tpl");
?>