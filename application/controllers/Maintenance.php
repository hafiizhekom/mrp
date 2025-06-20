<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class maintenance extends CI_Controller {


	public function __construct(){
		parent::__construct();
		if($this->session->userdata('logged_in')!=TRUE)redirect('login');
		$access_rights=false;
		foreach ($this->session->userdata('menu_access') as $key => $value){
			if($value->module=="Maintenance"){
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
		
		$data['sub_menu']=$this->submenu('Maintenance');
		$this->load->view('maintenance/home',$data);
	}

	public function equipment($param=null){
		
		if($param=="type"){
			$data=null;
			$this->db->select('*');
			$this->db->from('equipment_type');
			$this->db->where('is_active', 1);
			$data['table']=$this->db->get()->result();
			$data['sub_menu']=$this->submenu('Maintenance');
			$this->load->view('maintenance/equipment_type', $data);
		}else if($param=="group"){
			$data=null;
			$this->db->select('*');
			$this->db->from('equipment_groups');
			$this->db->where('is_active', 1);
			$data['table']=$this->db->get()->result();
			$data['sub_menu']=$this->submenu('Maintenance');
			$this->load->view('maintenance/equipment_group', $data);
		}else if($param=="type_add"){
			$data_input=$this->input->post();
			if(empty($data_input['id'])){
				$insert_table = array(
					'name' => $data_input['name'],
					'code' => $data_input['code'],
					'description'=>$data_input['desc'],
					'is_active'=>1 
				);
				$this->db->insert('equipment_type', $insert_table);
			}else{
				if(empty($data_input['name'])){
					if(empty($data_input['code'])){
						if(empty($data_input['desc'])){
							$insert_table = array(
								'is_active'=>0 
							);
							$this->db->where('id', $data_input['id']);
							$this->db->update('equipment_type', $insert_table);
						}
					}
				}else{
					$insert_table = array(
						'name' => $data_input['name'],
						'code' => $data_input['code'],
						'description'=>$data_input['desc'],
						'is_active'=>1 
					);
					$this->db->where('id', $data_input['id']);
					$this->db->update('equipment_type', $insert_table);
				}
				
			}
			
			header("Location: ".base_url()."maintenance/equipment/type");
		}else if($param=="group_add"){
			$data_input=$this->input->post();
			if(empty($data_input['id'])){
				$insert_table = array(
					'name' => $data_input['name'],
					'code' => $data_input['code'],
					'desc'=>$data_input['desc'],
					'is_active'=>1 
				);
				$this->db->insert('equipment_groups', $insert_table);
			}else{
				if(empty($data_input['name'])){
					if(empty($data_input['code'])){
						if(empty($data_input['desc'])){
							$insert_table = array(
								'is_active'=>0 
							);
							$this->db->where('id', $data_input['id']);
							$this->db->update('equipment_groups', $insert_table);
						}
					}
				}else{
					$insert_table = array(
						'name' => $data_input['name'],
						'code' => $data_input['code'],
						'desc'=>$data_input['desc'],
						'is_active'=>1 
					);
					$this->db->where('id', $data_input['id']);
					$this->db->update('equipment_groups', $insert_table);
				}
				
			}
			
			header("Location: ".base_url()."maintenance/equipment/group");
		}else if($param=="create"){
			$this->db->select('*');
			$this->db->from('equipment_groups');
			$this->db->where('is_active', 1);
			$data['group']=$this->db->get()->result();

			$this->db->select('*');
			$this->db->from('equipment_type');
			$this->db->where('is_active', 1);
			$data['type']=$this->db->get()->result();

			$this->db->select('*');
			$this->db->from('unit_of_measures');
			$this->db->where('is_active', 1);
			$data['unit']=$this->db->get()->result();
			$data['sub_menu']=$this->submenu('Maintenance');
			$this->load->view('maintenance/equipment_single', $data);
		}else if($param=="add_single"){
			$data_input=$this->input->post();

			if(empty($data_input['id'])){
				$insert_table = array(
					'name' => $data_input['name'] ,
					'size' => $data_input['size'],
					'unit' => $data_input['unit'],
					'brand' => $data_input['brand'],
					'type'  => $data_input['type'],
					'group' => $data_input['group'],
					'minimum_stock' => $data_input['minimum_stock'],
					'is_active'=>1
				);
				$this->db->insert('equipment', $insert_table);

				$this->db->select('id');
				$this->db->from('equipment');
				$this->db->limit(1);
				$this->db->order_by('id', 'desc');
				$kode=$this->db->get()->row();

				
				for ($i=0; $i < count($data_input['detail_number']) ; $i++) { 
					$insert_detail = array(
						'equipment_id' => $kode->id,
						'inventory_number'=>$data_input['detail_number'][$i],
						'date_received'=>$data_input['detail_date'][$i],
						'status'=>$data_input['detail_status'][$i],
						'condition'=>$data_input['detail_condition'][$i],
						'remark'=>$data_input['detail_remark'][$i],
						'is_active'=>1 
					);
					$this->db->insert('equipment_detail', $insert_detail);
				}
			}else{

			}
			header("Location: ".base_url()."maintenance/equipment");
			
		}else{
			header("Location: ".base_url()."maintenance");
		}
	}
}
