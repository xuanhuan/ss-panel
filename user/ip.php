<?php
ini_set("display_errors", "On");

error_reporting(E_ALL);
session_start();
include '_main.php';
var_dump($U->get_user_ip_list());