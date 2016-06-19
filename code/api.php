<?php

include 'phpqrcode.php'; 
if(isset($_GET['text'])){
    $text = $_GET['text'];
    QRcode::png($text, false, QR_ECLEVEL_L, 15);
}
