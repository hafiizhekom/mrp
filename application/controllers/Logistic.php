<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class logistic extends CI_Controller {


	public function __construct(){
		parent::__construct();
		if($this->session->userdata('logged_in')!=TRUE)redirect('login');
		$access_rights=false;
		foreach ($this->session->userdata('menu_access') as $key => $value){
			if($value->module=="Logistic"){
				$access_rights=true;
			}
		}
		if($access_rights==false){
			redirect($this->session->userdata('base_link'));
		}
		// if($this->sesi_login->log_session() !=TRUE)redirect('Login');
	}

	public function submenu($param){
		$this->db->select('b.sub_menu,c.module,c.menu,b.url');
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
		$data['sub_menu']=$this->submenu("Logistic");
		$this->load->view('logistic/home',$data);
	}

	public function consumable($param=null){
		if($param=="add"){
			$data_input=$this->input->post();
			if(empty($data_input['id'])){
				$insert_table = array(
					'code' => $data_input['code'],
					'qualification'=>$data_input['qualification'],
					'name'=>$data_input['name'],
					'unit'=>$data_input['unit'],
					'minimal_stock'=>$data_input['minimal'],
					'size'=>$data_input['size'],
					'is_active'=>1

				);

				$this->db->insert('ms_consumable', $insert_table);
			}else{
				if(empty($data_input['code'])){
					if(empty($data_input['qualification'])){
						if(empty($data_input['name'])){
							if(empty($data_input['unit'])){
								if(empty($data_input['size'])){
									$insert = array('is_active' => 0 );
									$this->db->where('id', $data_input['id']);
									$this->db->update('ms_consumable', $insert);
								}
							}
						}
					}
				}else{
					$insert_table = array(
						'code' => $data_input['code'],
						'qualification'=>$data_input['qualification'],
						'name'=>$data_input['name'],
						'unit'=>$data_input['unit'],
						'minimal_stock'=>$data_input['minimal'],
						'size'=>$data_input['size'],
						'is_active'=>1

					);
					$this->db->where('id', $data_input['id']);
					$this->db->update('ms_consumable', $insert_table);
				}
			}
			
			header("Location: ".base_url()."logistic/consumable");
		}else{
			$this->db->select('*');
			$this->db->from('ms_consumable');
			$this->db->where('is_active', 1);
			$data['table']=$this->db->get()->result();

			$this->load->view('logistic/consumable',$data);
		}
		
	}
}
