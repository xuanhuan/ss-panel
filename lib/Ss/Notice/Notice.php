<?php

namespace Ss\Notice;

class Notice
{
    private $db;
    public function __construct()
    {
        global $db;
        $this->db = $db;
    }
    
    //仅获取内容
    function notice($item){
        return stripslashes($this->db->select('notice', 'value', ['item'=>$item])[0]);
    }
    
    function get_notice_list(){
        return $this->db->select('notice', '*');
    }
    
    //获取完整的
    function get_notice($item){
        return $this->db->select('notice', '*', ['item'=>$item])[0];
    }
    
    
    function update_notice($item, $introduction, $value){
        //首先去除可能存在的引号，再添加引号
        // $introduction = $this->db->quote($introduction);
        // $value = $this->db->quote($value);

        if ($this->db->has('notice', ['item' => $item])){
            $this->db->update('notice', ['introduction' => $introduction, 'value'=>$value], ['item'=>$item]);
        }
        else
        $this->db->insert('notice', ['item' => $item, 'introduction' => $introduction,
            'value'=>$value]);
    }
    
    function has_notice($item){
        return $this->db->has('notice', ['item'=> $item]);
    }
    
}