<?php
ini_set("display_errors", "On");
error_reporting(E_ALL | E_STRICT);
require_once '_main.php';
$node = new Ss\Node\Node();
$nodeinfo = $node->get_all_server_info(); 
echo json_encode($nodeinfo);
?>