<?php
namespace Ss\Plan;
error_reporting(E_ALL);
ini_set("display_errors", "On");


class Plan{
    public $db;
    
    function __construct(){
        global $db;
        $this->db = $db;
    }
    
    function get_plan_info($id){
        return $this->db->select('plan', '*', ['id'=>$id])[0];
    }
    
    function get_plan($plan, $plan_id){
        return $this->db->select('plan', '*', ['AND'=> ['plan'=>$plan, 'plan_id'=>$plan_id]])[0];
    }
    
    
    function get_plan_list($plan){
        return $this->db->select('plan', '*', [
            'plan' => $plan,'ORDER'=>'plan_id'
            ]);
    }
    
    function add_plan($planinfo){
        $this-> db-> insert('plan', [
            'plan' => $planinfo['plan'],
            'plan_id' => $planinfo['plan_id'],
            'money' => $planinfo['money'],
            'data' => $planinfo['data'],
            'type' => $planinfo['type'],
            'url' => $planinfo['url']
            ]);
    }
    
    function update_plan($planinfo){
        $this-> db-> update('plan', [
            'plan' => $planinfo['plan'],
            'plan_id' => $planinfo['plan_id'],
            'money' => $planinfo['money'],
            'data' => $planinfo['data'],
            'type' => $planinfo['type'],
            'url' => $planinfo['url']
            ],[
                'id' => $planinfo['id']
                ]);
    }
    
    function has_plan($plan, $plan_id){
        return $this->db->has('plan', ['AND' => ['plan'=>$plan, 'plan_id'=>$plan_id]]);
    }
    
    function has_plan_by_id($id){
        return $this -> db -> has('plan', ['id'=>$id]);
    }
    
    function delete_plan($id){
        return $this -> db -> delete('plan', [
            'id' => $id
            ]);
    }
}