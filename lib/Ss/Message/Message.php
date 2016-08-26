<?php
namespace Ss\message;

class message
{
    
    
    private $db;
    
    public function __construct()
    {
        global $db;
        $this -> db = $db;
    }
    
    function get_user_message_list($uid){
        return $this->db->select('message', '*', ['uid' => $uid]);
    }
    
    function get_single_message($uid, $id){
        return $this->db->select('message', '*', ['uid'=>$uid, 'id'=>$id])[0];
    }
    
    function send_user_message($uid, $title, $text){
        $this->db->insert('message', ['$uid' => $uid, 'title'=>$title, 'text'=>$text, 'time'=>time()]);
    }
    
    function had_read($uid, $id){
        $this -> db ->update('message', ['had_read' => 1], ['$id' => $id, 'uid'=>$uid]);
    }
    
    function delete_message($uid, $id){
        $this->db ->delete('message', ['id'=>$id, 'uid'=>$uid]);
    }
}

?>