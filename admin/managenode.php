<?php
error_reporting(E_ALL);
ini_set("display_errors", "On");
require_once '_main.php';
$Node = new Ss\Node\ServerManager();
$smarty->display('admin/managenode.tpl');