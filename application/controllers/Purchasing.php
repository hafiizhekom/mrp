<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class purchasing extends CI_Controller {

	public function __construct(){
		parent::__construct();
		if($this->session->userdata('logged_in')!=TRUE)redirect('login');
		$access_rights=false;
		foreach ($this->session->userdata('menu_access') as $key => $value){
			if($value->module=="Purchasing"){
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
		$data['sub_menu']=$this->submenu('Purchasing');
		$this->load->view('purchasing/home',$data);
	}

	public function vendor($param=null){
		if($param=="create"){
			$this->db->select('*');
			$this->db->from('currency');
			$this->db->where('is_active', 1);
			$data['currency']=$this->db->get()->result();

			$this->load->view('purchasing/vendor_add', $data);
		}else if($param=="add"){
			$data_input=$this->input->post();
			// echo var_dump($data_input);
			if(empty($data_input['id'])){
				$insert_table = array(
					'ppn' => $data_input['ppn'], 
					'outsource'=>$data_input['outsource'],
					'vendor_code'=>$data_input['code'],
					'supplier_name'=>$data_input['supplier_name'],
					'address'=>$data_input['address'],
					'city'=>$data_input['city'],
					'country'=>$data_input['country'],
					'post_code'=>$data_input['post'],
					'phone'=>$data_input['phone'],
					'fax'=>$data_input['fax'],
					'currency'=>$data_input['currency'],
					'attn'=>$data_input['attn'],
					'email'=>$data_input['email'],
					'bank_name'=>$data_input['bank'],
					'bank_account'=>$data_input['account'],
					'npwp'=>$data_input['npwp'],
					'tkip'=>$data_input['tkip'],
					'delivery_terms'=>$data_input['delivery'],
					'payment_terms'=>$data_input['payment'],
					'notes'=>$data_input['notes'],
					'is_active'=>1
				);
				$this->db->insert('ms_vendor', $insert_table);

				$this->db->select('id');
				$this->db->from('ms_vendor');
				$this->db->where('is_active', 1);
				$this->db->order_by('id', 'desc');
				$key=$this->db->get()->row();

				for ($i=0; $i <count($data_input['contact_name']) ; $i++) { 
					$insert_detail = array(
						'vendor_id' => $key->id,
						'name'=>$data_input['contact_name'][$i],
						'phone'=>$data_input['contact_phone'][$i],
						'handphone'=>$data_input['contact_handphone'][$i],
						'email'=>$data_input['contact_email'][$i],
						'position'=>$data_input['contact_position'][$i],
						'is_active'=>1 
					);
					$this->db->insert('vendor_cs', $insert_detail);
				}
			}
			redirect("purchasing/vendor");
			
			
		}else{
			$this->db->select('*');
			$this->db->from('ms_vendor');
			$this->db->where('is_active',1);
			$data['table']=$this->db->get()->result();

			$this->db->select('*');
			$this->db->from('vendor_cs');
			$this->db->where('is_active', 1);
			$data['contact']=$this->db->get()->result();

			$this->load->view('purchasing/vendor', $data);
		}
	}

	public function material($param=null){
		if($param=="delete"){
			$data_input=$this->input->post();
			$table = array('is_active' => 0);
			$this->db->where('id', $data_input['id']);
			$this->db->update('master_material', $table);
			header("Location: ".base_url()."purchasing/material");
		}else if($param=="create"){
			$data_input=$this->input->post();

			$this->db->select('*');
			$this->db->from('ms_warehouse');
			$this->db->where('is_active', 1);
			$data['warehouse']=$this->db->get()->result();

			$this->db->select('*');
			$this->db->from('ms_product');
			$this->db->where('is_active', 1);
			$data['product']=$this->db->get()->result();

			$this->db->select('*');
			$this->db->from('ms_pic');
			$this->db->where('is_active', 1);
			$data['pic']=$this->db->get()->result();

			$this->db->select('*');
			$this->db->from('unit_of_measures');
			$this->db->where('is_active', 1);
			$data['unit']=$this->db->get()->result();

			$this->db->select('*');
			$this->db->from('ms_vendor');
			$this->db->where('is_active', 1);
			$data['vendor']=$this->db->get()->result();

			if(!empty($data_input['id'])){
				$this->db->select('*');
				$this->db->from('master_material');
				$this->db->where('is_active', 1);
				$this->db->where('id', $data_input['id']);
				$data['master_part']=$this->db->get()->row();
			}

			$this->load->view('purchasing/material_form',$data);
		}else if($param=="create_add"){
			$data_input=$this->input->post();

			// echo var_dump($data_input);
			if(empty($data_input['id'])){
				$insert_table = array(
					'material_id' => $data_input['material_id'],
					'part_code'=>$data_input['part_code'],
					'product_code'=>$data_input['product_code'],
					'product_category'=>$data_input['product']??"",
					'warehouse_location'=>$data_input['warehouse']??"",
					'packing_type'=>$data_input['packing_type'],
					'pic'=>$data_input['pic']??"",
					'iqc_check'=>$data_input['iqc_check']??"",
					'note'=>$data_input['note']??"",
					'unit_measures'=>$data_input['unit']??"",
					'dimension_type'=>$data_input['dimension_type']??"",
					'material_group'=>$data_input['material_group']??"",
					'material_type'=>$data_input['material_type']??"",
					'material_density'=>$data_input['material_density']??"",
					'weight_factor'=>$data_input['weight_factor']??"",
					'surface_area'=>$data_input['surface_area']??"",
					'hs_number'=>$data_input['hs_number'],
					'point_factor'=>$data_input['paint_factor'],
					'length'=>$data_input['length'],
					'width'=>$data_input['width'],
					'thick'=>$data_input['thick'],
					'weight'=>$data_input['weight'],
					'wielding_type'=>$data_input['wielding_type'],
					'drawing_number'=>$data_input['drawing_number'],
					'volume_formula'=>$data_input['volume_formula'],
					'area_formula'=>$data_input['area_formula'],
					'minimum_order_qty'=>$data_input['minimum_qty']??'',
					'minimum_stock'=>$data_input['stock']??'',
					'process_cost'=>$data_input['cost']??'',
					'process_cost_supplier_name'=>$data_input['supplier']??'',
					'lead_time'=>$data_input['lead_time']??'',
					'currency'=>$data_input['currency']??'',
					'is_active'=>1 
				);

				$this->db->insert('master_material', $insert_table);
			}else{
				$insert_table = array(
					'material_id' => $data_input['material_id'],
					'part_code'=>$data_input['part_code'],
					'product_code'=>$data_input['product_code'],
					'product_category'=>$data_input['product']??"",
					'warehouse_location'=>$data_input['warehouse']??"",
					'packing_type'=>$data_input['packing_type'],
					'pic'=>$data_input['pic']??"",
					'iqc_check'=>$data_input['iqc_check']??"",
					'note'=>$data_input['note']??"",
					'unit_measures'=>$data_input['unit']??"",
					'dimension_type'=>$data_input['dimension_type']??"",
					'material_group'=>$data_input['material_group']??"",
					'material_type'=>$data_input['material_type']??"",
					'material_density'=>$data_input['material_density']??"",
					'weight_factor'=>$data_input['weight_factor']??"",
					'surface_area'=>$data_input['surface_area']??"",
					'hs_number'=>$data_input['hs_number'],
					'point_factor'=>$data_input['paint_factor'],
					'length'=>$data_input['length'],
					'width'=>$data_input['width'],
					'thick'=>$data_input['thick'],
					'weight'=>$data_input['weight'],
					'wielding_type'=>$data_input['wielding_type'],
					'drawing_number'=>$data_input['drawing_number'],
					'volume_formula'=>$data_input['volume_formula'],
					'area_formula'=>$data_input['area_formula'],
					'minimum_order_qty'=>$data_input['minimum_qty']??'',
					'minimum_stock'=>$data_input['stock']??'',
					'process_cost'=>$data_input['cost']??'',
					'process_cost_supplier_name'=>$data_input['supplier']??'',
					'lead_time'=>$data_input['lead_time']??'',
					'currency'=>$data_input['currency']??'',
					'is_active'=>1 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('master_material', $insert_table);
			}
			
			header("Location: ".base_url()."purchasing/material");
		}else{
			$this->db->select('*');
			$this->db->from('master_material');
			$this->db->where('is_active', 1);
			$data['table']=$this->db->get()->result();
			$this->load->view('purchasing/material',$data);
		}
		
	}

	public function material_check(){
		$data_input=$this->input->post();

		$this->db->select('*');
		$this->db->from('master_material');
		$this->db->like('material_id', $data_input['id'], 'BOTH');
		$result=$this->db->get()->result();
		echo json_encode($result);
	}

	public function spb($param=null){
		if($param=="create"){
			$this->db->select('*');
			$this->db->from('user_account');
			$data['user']=$this->db->get()->result();

			$this->load->view('purchasing/spb_form', $data);

		}else{
			$this->db->select('*');
			$this->db->from('spb');
			$this->db->where('is_active', 1);
			$data['table']=$this->db->get()->result();

			$this->load->view('purchasing/spb', $data);	
		}
		
	}

}	
