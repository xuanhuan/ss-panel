<?php
include_once 'lib/config.php';
$varsarray = get_defined_vars();
$c = new \Ss\User\Invite();
$smarty->assign('c',$c);
$datas = $c->CodeArray();
$smarty->assign('datas',$datas);
$smarty->assign('a',$a=1);
//把随机字符串保存到session
$_SESSION['randomChar']=$randomChar;
$smarty->assign('randomChar',$randomChar);
$smarty->assign("tos_content",Ss\ac::get('tos_content',get_defined_vars()));// 用户协议 
//注册
$smarty->display("index.tpl");

