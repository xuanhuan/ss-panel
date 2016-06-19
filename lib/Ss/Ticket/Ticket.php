<?php
    namespace Ss\Ticket;
    
    class ticket{
        
        public $id;
        public $db;
        
        function addticket($uid,$content,$create_time,$anwser_time){
            $this->db->insert("ticket", [
                'uid'=> $uid,
                'content'=> $content,
                'create_time'=> $create_time,
                '$anwser_time'=> $anwser_time
            ]);
            return 1;
        }
        
    }