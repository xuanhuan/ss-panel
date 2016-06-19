<?php
/**
 * User check
 */

namespace Ss\User;


class UserCheck {

    private $db;

    function __construct(){
        global $db;
        $this->db  = $db;
    }

    //is username used
    function IsUsernameUsed($username){
        if($this->db->has("user",[
            "user_name" => $username
        ])){
            return 1;
        }else{
            return 0;
        }
    }

    //is email used
    function IsEmailUsed($email){
        if($this->db->has("user",[
            "email" => $email
        ])){
            return 1;
        }else{
            return 0;
        }
    }


    //
    function IsEmailLegal($email){
        if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return 1;
        }else{
            return 0;
        }
    }

    //login check
    function login_check($username,$passwd){
        if($this->db->has("user",[
            "AND" => [
                "OR" => [
                    "user_name" => $username,
                    "email" => $username
                ],
                "pass" => $passwd
            ]
        ])){
            return 1;
        }else{
            return 0;
        }
    }

    //email Login
    function EmailLogin($email,$passwd){
        if($this->db->has("user",[
            "AND" => [
                 "email" => $email,
                "pass" => $passwd
            ]
        ])){
            return 1;
        }else{
            return 0;
        }
    }

    function UsernameEmailCheck($username,$email){
        if($this->db->has("user",[
            "AND" => [
                    "user_name" => $username,
                    "email" => $email
            ]
        ])){
            return 1;
        }else{
            return 0;
        }
    }
    
    
    function save_ip($uid){
         $ip = get_user_ip();

         $location = resolve_ip($ip);
         $this->db->insert('login_ip', ['uid'=>$uid, 'ip'=>$ip, 'location'=>$location, 'time'=>time()]);
         if($this->db->count('login_ip', ['uid' => $uid]) > 10){
             $id = $this->db->select('login_ip','id' ,['uid' => $uid, 'ORDER'=>'id', 'LIMIT' => 1])[0];
             #var_dump($id);
             $this->db->delete('login_ip', ['id' => $id]);
         }
     }
}

function resolve_ip($ip){
    //返回ip对应的地址
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, "http://ipapi.ipip.net/find?addr=".$ip);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch,  CURLOPT_HTTPHEADER, array('Token:00000000000000000000'));
    
    $output = json_decode(curl_exec($ch), true);
    if($output['ret'] == 'ok'){
        $info = $output['data'][0].$output['data'][1].$output['data'][2].$output['data'][3].
        ' '.$output['data'][4];
    }
    else 
        $info = '查询失败'.$output['msg'];
    return $info;
}

function get_user_ip(){
    $user_IP = ($_SERVER["HTTP_VIA"]) ? $_SERVER["HTTP_X_FORWARDED_FOR"] : $_SERVER["REMOTE_ADDR"];
    $user_IP = ($user_IP) ? $user_IP : $_SERVER["REMOTE_ADDR"]; 
    return $user_IP;
 }