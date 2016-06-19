<?php
namespace SS\Code;
ini_set("display_errors", "On");

error_reporting(E_ALL | E_STRICT);

class Code{
    
    private $config;
    private $plan;
    private $db;
    
    
    private $CheckKey, $key, $CheckSumValue, $CheckSumList;
    
    public function __construct(){
        global $db, $generate_key, $check_key;
        $this -> config = require('config.php');
        $this -> db = $db;
        $this -> plan = new \Ss\Plan\Plan();
        $this -> CheckKey = $check_key;
        $this -> key = $generate_key;
        $this -> CheckSumValue = array(
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
    
        $this ->CheckSumList = 'D0A2FCB9187563E4';
        $this ->CheckSumList = str_split($this->CheckSumList);
    }
    
    public function generate_code($id, $amount, $expires){
        //先判断是否存在
        $plan_info = $this->plan->get_plan_info($id);
        if(empty($plan_info)){
            return array('info' => '计划不存在');
        }

        while($amount-- > 0){
            $code['code'][] = $this -> generator($this->config['used']++, $expires['year'], $expires['month'], $expires['day'],$plan_info);
        }
        $code['info'] = '';
        return $code;
    }
    
    public function check_code($code){
        if($code_dec = $this->decoder($code)){
            if($code_dec['time']>= time()|1){
                if(!$this->has_id($code_dec['id'])){
                    if ($this->plan->has_plan($code_dec['plan'], $code_dec['plan_id'])){
                        //检查是否存在对应的计划
                        $code_dec['status']='valid';
                        return $code_dec;
                    }
                    else
                        return array('status'=>'invalid','info'=>'将要兑换的计划不存在，可能已被删除,请联系管理员');
                }
                //存在id则说明过期
                return array('status'=>'invalid','info'=>'兑换码已经被使用，兑换时间为:'.date('Y-m-d H:i:s',$this->get_used_code_info($code_dec['id'])['redeem_time']));
            }
            else
                return array('status'=>'invalid','info'=>'兑换码已过期');
        }
    }
    
    public function get_used_code_info($id){
        return $this->db->select('pay_code', '*',['code_id' => $id])[0];
    }
    
    //查找是否存在id
    public function has_id($id){
        return $this -> db -> has('pay_code', ['code_id'=>$id]);
    }
    
    //返回已使用的id数
    public function get_used_id(){
        return $this->config['used'];
    }
    
    public function set_used_id($id, $uid){
        $this->db->insert('pay_code', ['code_id'=>$id, 'redeem_time'=>time(), 'uid'=>$uid]);
    }
    
    public function __destruct(){
        chdir(__DIR__);
        $out = '<?php return '.var_export($this->config, true).'?>';
        file_put_contents('config.php', $out);
    }
    
    private function decoder($code){
        //解码base64
        $ciphertext_dec = urlsafe_b64decode($code);
        //验证base64解码后的位数，必须为16位
        if (strlen($ciphertext_dec) == 16){
            $plaintext_dec = mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $this->key, $ciphertext_dec, MCRYPT_MODE_ECB);
            //判断是否存在校验字符串
            //echo $plaintext_dec;
            if (hexdec(substr($plaintext_dec, 0, 4)) == $this->CheckKey){
                $splitedtext = str_split($plaintext_dec);
                $i = 0;
                $CheckSum = 0;
                while($i < 15){
                    $CheckSum += $this->CheckSumValue[$splitedtext[$i]];
                    $i++;
                }
                //验证校验位
                if ($this->CheckSumList[$CheckSum % 16] == $splitedtext[15]){
                    //取出时间戳
                    $time = hexdec(substr($plaintext_dec, 4, 4)) * 86400 - 1;
                    return array(
                        'time' => $time,
                        'plan' => substr($plaintext_dec, 12, 1),
                        'plan_id' => hexdec(substr($plaintext_dec, 13, 2)),
                        'id'   => hexdec(substr($plaintext_dec, 8, 4))
                        );
                    
                }
            }
            
        }
        return false;
    }
    
    private function generator($id, $year, $month, $day, $plan){
        //创建过期时间戳，时分秒 月日年
        $time = mktime(0, 0, 0, $month, $day, $year);
        $time=intval($time/86400) + 2;
        # key size use either 16, 24 or 32 byte keys for AES-128, 192
        # and 256 respectively
        
        /*从高位到低位分别是
         * 四位校验key
         * 四位时间戳，精度为日
         * 四位兑换码id
         * 计划（A-F）
         * 两位计划id
         * 共计15位
         */
        // echo $plan['plan'];
        $plaintext = sprintf('%04X%04X%04X%s%02X',$this->CheckKey, $time,$id, $plan['plan'], $plan['plan_id']);
            // echo '真实兑换码'.$plaintext.'<br>';
        $CheckSum = 0;
        
        foreach(str_split($plaintext) as $ch)
        {
            $CheckSum +=  $this->CheckSumValue[$ch];
        }
        //添加校验位
        $plaintext .= $this->CheckSumList[$CheckSum%16];
        //加密
        $ciphertext = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $this ->key, $plaintext, MCRYPT_MODE_ECB);
        //编码加密后的字串使其可显示
        $ciphertext_base64 = urlsafe_b64encode($ciphertext);
        
        return $ciphertext_base64;
    }
}

// $test = new RedeemCode();
// echo 'used'.$test->get_used_id().'<br>';
// $test -> generate_code(16, 2, ['year'=>2016,'month'=>6, 'day'=>6]);
// echo $test->get_used_id();


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
