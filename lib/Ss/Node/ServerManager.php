<?php


namespace Ss\Node;

class ServerManager{
    public $db;
    function __construct(){
        global $db;
        $this -> db = $db;
    }
    
    function has_node($node_id){
        if($this -> db -> has('ss_node', ['id' => $node_id])){
            return true;
        }
        else
            return false;
    }
    
    function get_server_full_info($node_id){
        return $this->db->select('node_info', '*', ['node_id' => $node_id])[0];
    }
    
    function get_all_server_full_info(){
        return $this->db->select('node_info', '*');
    }
    
    function get_server_info($node_id){
        return $this->db->select('node_info', ['load_1', 'cpu', 'upload', 'download'], ['id'=>$node_id])[0];
    }
    
    function get_all_server_info(){
        return $this->db->select("node_info",['id','load_1', 'cpu', 'upload', 'download']);
    }
    
    function update_server_info($node_id, $load, $cpu, $upload, $download){
        if($this->db->has('node_info', ['node_id' => $node_id]))
        $this->db->update('node_info', ['load_1'=>$load, 'cpu'=>$cpu, 
            'upload'=>$upload, 'download'=>$download, 'last_com_time'=>time()], 
            ['id[=]'=>$node_id]);
            
        else
            $this->db->insert('node_info', ['node_id'=>$node_id, 'load_1'=>$load, 'cpu'=>$cpu, 
            'upload'=>$upload, 'download'=>$download, 'last_com_time'=>time()]);

    }
    
    function update_server_full_info($node_id, $load, $cpu, $upload, $download, $mem, $connections, $status, $uptime){
        if($this->db->has('node_info', ['node_id' == $node_id]))
            $this->db->update('node_info', ['load_1'=>$load, 'cpu'=>$cpu, 'upload'=>$upload,
                'download' => $download, 'memory'=>$mem, 'connections'=>$connections, 'uptime'=>$uptime,
                'status' => $status, 'last_com_time' => time()], ['node_id' => $node_id]);
        else
            $this->db->insert('node_info', ['load_1'=>$load, 'cpu'=>$cpu, 'upload'=>$upload,
                'download' => $download, 'memory'=>$mem, 'connections'=>$connections, 'uptime'=>$uptime,
                'status' => $status, 'last_com_time' => time()]);
    }
    
    function get_command($node_id){
        return $this->db->select('node_info', 'command', ['node_id' => $node_id])[0];
    }
    
    
    function set_command($node_id, $command){
        /*command 应当为下列之一
        * run       启动ss
        * restart   重启ss
        * stop      停止ss
        * reboot    重启服务器
        * shutdown  关闭服务器
        * NULL      无命令
        */
        $this->db->update('node_info', ['command' => $command], ['node_id' => $node_id]);
    }
}


