<?php
ini_set("display_errors", "On");
error_reporting(E_ALL | E_STRICT);


    //校验字符串
    $CheckKey = 0XA59B;
    $key = md5('1', true);
    $CheckSumValue = array(
        '0' => 8,
        '1' => 15,
        '2' => 14,
        '3' => 9,
        '4' => 1,
        '5' => 0,
        '6' => 7,
        '7' => 13,
        '8' => 2,
        '9' => 10,
        'A' => 5,
        'B' => 6,
        'C' => 3,
        'D' => 12,
        'E' => 4,
        'F' => 11
    );
    
    $CheckSumList = 'D0A2FCB9187563E4';
    $CheckSumList = str_split($CheckSumList);

function RedeemCodeCreator($id, $year, $month, $day){
    global $CheckSumList, $CheckKey, $key, $CheckSumValue;
    
    //创建过期时间戳，时分秒 月日年
    $time = mktime(0, 0, 0, $month, $day, $year);
    $time=intval($time/86400) + 1;
    # key size use either 16, 24 or 32 byte keys for AES-128, 192
    # and 256 respectively
    
    $plaintext = sprintf('%02X%04X%04XA10',$CheckKey, $time,$id);
    //    echo '真实兑换码'.$plaintext;
    $CheckSum = 0;
    foreach(str_split($plaintext) as $ch)
    {
        $CheckSum +=  $CheckSumValue[$ch];
    }
    //添加校验位
    $plaintext .= $CheckSumList[$CheckSum%16];
    //加密
    $ciphertext = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $plaintext, MCRYPT_MODE_ECB);
    //编码加密后的字串使其可显示
    $ciphertext_base64 = urlsafe_b64encode($ciphertext);
    
    return $ciphertext_base64;
}


function RedeemCodeChecker($code){
    global $key, $CheckKey, $CheckSumValue;
    //解码base64
    $ciphertext_dec = urlsafe_b64decode($code);
    //验证base64解码后的位数，必须为16位
    if (strlen($ciphertext_dec) == 16){
        $plaintext_dec = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, $ciphertext_dec, MCRYPT_MODE_ECB);
        //判断是否存在校验字符串
        if (hexdec(substr($plaintext_dec, 0, 4)) == $CheckKey){
            $splitedtext = str_split($plaintext_dec);
            $i = 0;
            $CheckSum = 0;
            while($i <= 15){
                $CheckSum += $CheckSumValue[$splitedtext[$i]];
                echo $CheckSumValue[$splitedtext[$i]].'<br>';
                $i++;
            }
        }
        
    }
    else
    return false;
    
    
}


$id = 1;
    $ciphertext_base64=RedeemCodeCreator($id, 2016, 6, 1);
RedeemCodeChecker($ciphertext_base64);



function urlsafe_b64encode($string) {
   $data = base64_encode($string);
   $data = str_replace(array('+','/','='),array('-','_',''),$data);
   return $data;
 }

function urlsafe_b64decode($string) {
   $data = str_replace(array('-','_'),array('+','/'),$string);
   $mod4 = strlen($data) % 4;
   if ($mod4) {
       $data .= substr('====', $mod4);
   }
   return base64_decode($data);
 }

?>
