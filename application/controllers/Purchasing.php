<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class purchasing extends CI_Controller {

	public function __construct(){
		parent::__construct();
		if($this->session->userdata('logged_in')!=TRUE)redirect('login');
		// if($this->sesi_login->log_session() !=TRUE)redirect('Login');
	}
	
	public function index()
	{
		$this->load->view('purchasing/home');
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

	public function material(){
		$data_input=$this->input->post();
		$this->db->select('*');
		$this->db->from('ms_document_type');
		$this->db->where('is_active', 1);
		$data['table']=$this->db->get()->result();
		// echo json_encode($data['table']);
		$this->load->view('purchasing/material', $data);
	}

}
