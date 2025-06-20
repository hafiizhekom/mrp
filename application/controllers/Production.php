<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class production extends CI_Controller {

	public function __construct(){
		parent::__construct();
		if($this->session->userdata('logged_in')!=TRUE)redirect('login');
		$access_rights=false;
		foreach ($this->session->userdata('menu_access') as $key => $value){
			if($value->module=="Production"){
				$access_rights=true;
			}
		}
		if($access_rights==false){
			redirect($this->session->userdata('base_link'));
		}
		// if($this->sesi_login->log_session() !=TRUE)redirect('Login');
	}
	
	public function submenu($param){
		$this->db->select('a.view,a.create,a.delete,a.approve,a.edit,b.sub_menu,c.module,c.menu,b.url');
		$this->db->from('tr_menu_access as a');
		$this->db->join('ms_submenu as b', 'a.sub_menu_id=b.id', 'left');
		$this->db->join('ms_menu as c', 'c.id=b.menu_id', 'left');
		$this->db->join('user_account as d', 'd.group_id = a.group_id', 'left');
		$this->db->where('c.module', $param);
		$this->db->where('d.id',$this->session->userdata('id') );
		$this->db->where('a.is_active', 1);
		$this->db->where('a.view', 1);
		$this->db->order_by('a.id', 'asc');
		return $this->db->get()->result();
	}


	public function index()
	{
		
		$data['sub_menu']=$this->submenu('Production');
		$this->load->view('production/home',$data);
	}

	public function bsk($param=null){
		$data['sub_menu']=$this->submenu('Production');
		if($param=="create"){
			$this->load->view('Production/bsk_form', $data);
		}else{
			$this->load->view('Production/bsk', $data);
		}
	}
}
