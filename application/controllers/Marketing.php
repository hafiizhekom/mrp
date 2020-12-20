<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Marketing extends CI_Controller {


	public function __construct(){
		parent::__construct();
		$this->en_data = array(
            'SALT' =>"salted",
            'ITERATIONS' => '999',
            'IV' => 1111111111111111
        );
		if($this->session->userdata('logged_in')!=TRUE)redirect('login');
		// if($this->sesi_login->log_session() !=TRUE)redirect('Login');
	}

	private function userPHPEncrypt($passphrase, $plainText)
	{
		$en_data=$this->en_data;
	    $key = \hash_pbkdf2("sha256", $passphrase, $en_data['SALT'], $en_data['ITERATIONS'], 64);
	    $encryptedData = \openssl_encrypt($plainText, 'AES-256-CBC', \hex2bin($key), OPENSSL_RAW_DATA, $en_data['IV']);
	    return \base64_encode($encryptedData);
	}

	private function userPHPDecrypt($passphrase, $encryptedTextBase64)
	{
		$en_data=$this->en_data;
	    $encryptedText = \base64_decode($encryptedTextBase64);
	    $key = \hash_pbkdf2("sha256", $passphrase, $en_data['SALT'], $en_data['ITERATIONS'], 64);
	    $decryptedText = \openssl_decrypt($encryptedText, 'AES-256-CBC', \hex2bin($key), OPENSSL_RAW_DATA, $en_data['IV']);
	    return $decryptedText;
	}
	
	public function index()
	{
		$this->load->view('marketing/home');
	}

	public function customer($param=null){
		if($param==null){
			$this->db->select('*');
			$this->db->from('customer');
			$this->db->where('is_active', 1);
			$data['table']=$this->db->get()->result();

			$this->db->select('*');
			$this->db->from('customer_contact');
			$this->db->where('is_active', 1);
			$data['contact']=$this->db->get()->result();

			$this->load->view('marketing/customer', $data);
		}else{
			if($param=="create"){
				$data=null;
				$this->load->view('marketing/customer_form', $data);
			}else if($param=="edit"){
				$data_input=$this->input->post();
				
				$this->db->select('*');
				$this->db->from('customer');
				$this->db->where('is_active', 1);
				$this->db->where('id', $data_input['id']);
				$data['table']=$this->db->get()->row();

				$this->db->select('*');
				$this->db->from('customer_contact');
				$this->db->where('is_active', 1);
				$this->db->where('customer_id', $data_input['id']);
				$data['contact']=$this->db->get()->result();

				$this->load->view('marketing/customer_form', $data);

			}else if($param=="delete"){
				$data_input=$this->input->post();
				$remove_table = array(
					'is_active' => 0
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('customer', $remove_table);
				header("Location: ".base_url()."marketing/customer");
			}else if($param=="add"){
				$data_input=$this->input->post();
				// echo var_dump($data_input);
				if(empty($data_input['id_header'])){
					$insert_table = array(
						'code' => $data_input['code'],
						'name'=>$data_input['name'],
						'address'=>$data_input['address'],
						'city'=>$data_input['city'],
						'postal_code'=>$data_input['postal'],
						'country'=>$data_input['country'],
						'phone'=>$data_input['phone'],
						'fax'=>$data_input['fax'],
						'email'=>$data_input['email'],
						'bank_account'=>$data_input['bank'],
						'npwp'=>$data_input['npwp'],
						'nppkp'=>$data_input['nppkp'],
						'tkip'=>$data_input['tkip'],
						'credit_limit'=>$data_input['credit_limit'],
						'payment_term'=>$data_input['payment_term'],
						'attention'=>$data_input['attention'],
						'code_for_so'=>$data_input['code_for_so'],
						'note'=>$data_input['note'],
						'is_active'=>1 
					);
					$this->db->insert('customer', $insert_table);
					$this->db->select('id');
					$this->db->from('customer');
					$this->db->order_by('id', 'desc');
					$this->db->limit(1);
					$row_header=$this->db->get()->row();
					
					for ($i=0; $i <count($data_input['contact_name']) ; $i++) { 
						$insert_detail = array(
							'customer_id' => $row_header->id,
							'name'=>$data_input['contact_name'][$i],
							'phone'=>$data_input['contact_phone'][$i],
							'handphone'=>$data_input['contact_handphone'][$i],
							'email'=>$data_input['contact_email'][$i],
							'position'=>$data_input['contact_position'][$i],
							'is_active'=>1 
						);
						$this->db->insert('customer_contact', $insert_detail);
					}
				}else{
					// var_dump($data_input);
					// exit();
					$insert_table = array(
						'code' => $data_input['code'],
						'name'=>$data_input['name'],
						'address'=>$data_input['address'],
						'city'=>$data_input['city'],
						'postal_code'=>$data_input['postal'],
						'country'=>$data_input['country'],
						'phone'=>$data_input['phone'],
						'fax'=>$data_input['fax'],
						'email'=>$data_input['email'],
						'bank_account'=>$data_input['bank'],
						'npwp'=>$data_input['npwp'],
						'nppkp'=>$data_input['nppkp'],
						'tkip'=>$data_input['tkip'],
						'credit_limit'=>$data_input['credit_limit'],
						'payment_term'=>$data_input['payment_term'],
						'attention'=>$data_input['attention'],
						'code_for_so'=>$data_input['code_for_so'],
						'note'=>$data_input['note'],
						'is_active'=>1 
					);
					$this->db->where('id', $data_input['id_header']);
					$this->db->update('customer', $insert_table);
						$insert_detail = array(
							'is_active'=>0 
						);
					$this->db->where('customer_id', $data_input['id_header']);
					$this->db->update('customer_contact', $insert_detail);

					for ($i=0; $i <count($data_input['contact_name']) ; $i++) { 
						if(empty($data_input['contact_id'][$i])){
							$insert_detail = array(
								'customer_id' => $data_input['id_header'],
								'name'=>$data_input['contact_name'][$i],
								'phone'=>$data_input['contact_phone'][$i],
								'handphone'=>$data_input['contact_handphone'][$i],
								'email'=>$data_input['contact_email'][$i],
								'position'=>$data_input['contact_position'][$i],
								'is_active'=>1 
							);
							$this->db->insert('customer_contact', $insert_detail);
						}else{
							$insert_detail = array(
								'customer_id' => $data_input['id_header'],
								'name'=>$data_input['contact_name'][$i],
								'phone'=>$data_input['contact_phone'][$i],
								'handphone'=>$data_input['contact_handphone'][$i],
								'email'=>$data_input['contact_email'][$i],
								'position'=>$data_input['contact_position'][$i],
								'is_active'=>1 
							);
							$this->db->where('id', $data_input['contact_id'][$i]);
							$this->db->update('customer_contact', $insert_detail);
						}
						
					}
				}
				
				header("Location: ".base_url()."marketing/customer");
			}
		}
		
	}

	public function customer_check(){
		$data_input=$this->input->post();

		$this->db->select('*');
		$this->db->from('customer');
		$this->db->where('code', $data_input['id']);
		$result=$this->db->get()->result();

		echo json_encode($result);
	}

	public function sot($param=null){
		if($param=="add"){
			$data_input=$this->input->post();
			if(empty($data_input['id'])){
				$insert_table = array(
					'po_type' => $data_input['po'],
					'desc'=>$data_input['desc'],
					'is_active'=>1, 
				);
				$this->db->insert('sales_order_type', $insert_table);
			}else{
				$insert_table = array(
					'po_type' => $data_input['po'],
					'desc'=>$data_input['desc'],
					'is_active'=>1, 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('sales_order_type', $insert_table);
			}
			
			header("Location: ".base_url()."marketing/sot");
		}else if($param=="delete"){
			$data_input=$this->input->post();
			$insert_table = array(
				'is_active'=>0, 
			);
			$this->db->where('id', $data_input['id']);
			$this->db->update('sales_order_type', $insert_table);
			header("Location: ".base_url()."marketing/sot");
		}else{
			$this->db->select('*');
			$this->db->from('sales_order_type');
			$this->db->where('is_active', 1);
			$data['table']=$this->db->get()->result();

			$this->load->view('marketing/sales_order', $data);
		}
		
	}

	public function kom($param=null){
		if($param=="add"){
			$data_input=$this->input->post();
			if(empty($data_input['id'])){
				$insert_table = array(
					'po_type' => $data_input['po'],
					'desc'=>$data_input['desc'],
					'is_active'=>1, 
				);
				$this->db->insert('sales_order_type', $insert_table);
			}else{
				$insert_table = array(
					'po_type' => $data_input['po'],
					'desc'=>$data_input['desc'],
					'is_active'=>1, 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('sales_order_type', $insert_table);
			}
			
			header("Location: ".base_url()."marketing/kom");
		}else if($param=="delete"){
			$data_input=$this->input->post();
			$insert_table = array(
				'is_active'=>0, 
			);
			$this->db->where('id', $data_input['id']);
			$this->db->update('sales_order_type', $insert_table);
			header("Location: ".base_url()."marketing/kom");
		}else{
			$this->db->select('*');
			$this->db->from('kickoff_meeting_template');
			$this->db->where('is_active', 1);
			$data['table']=$this->db->get()->result();

			$this->db->select('*');
			$this->db->from('user_group');
			$this->db->where('is_active', 1);
			$this->db->where('id >', 3);
			$this->db->where('id <=', 12);
			$data['group']=$this->db->get()->result();

			$this->load->view('marketing/kickoff_meeting_template', $data);
		}
		
	}


	public function sow($param=null){
		if($param=="add"){
			$data_input=$this->input->post();
			if(empty($data_input['id'])){
				$insert_table = array(
					'type' => $data_input['type'],
					'kickoff_meeting' => $data_input['kom'],
					'desc'=>$data_input['desc'],
					'order'=>$data_input['order'],
					'is_active'=>1, 
				);
				$this->db->insert('scopeofwork', $insert_table);
			}else{
				$insert_table = array(
					'type' => $data_input['type'],
					'kickoff_meeting' => $data_input['kom'],
					'desc'=>$data_input['desc'],
					'order'=>$data_input['order'],
					'is_active'=>1, 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('scopeofwork', $insert_table);
			}
			
			header("Location: ".base_url()."marketing/sow");
		}else if($param=="delete"){
			$data_input=$this->input->post();
			$insert_table = array(
				'is_active'=>0, 
			);
			$this->db->where('id', $data_input['id']);
			$this->db->update('scopeofwork', $insert_table);
			header("Location: ".base_url()."marketing/sow");
		}else{
			$this->db->select('*');
			$this->db->from('scopeofwork');
			$this->db->where('is_active', 1);
			$data['table']=$this->db->get()->result();

			$this->load->view('marketing/scope_of_works', $data);
		}
	}

	public function quotation($param=null){
		if($param=="create"){
			$data_input=$this->input->post();
			if(empty($data_input['id'])){
				$this->db->select('*');
				$this->db->from('customer');
				$this->db->where('is_active', 1);
				$data['customer']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('currency');
				$this->db->where('is_active', 1);
				$data['currency']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('unit_of_measures');
				$this->db->where('is_active', 1);
				$data['measures']=$this->db->get()->result();


				$this->db->select('*');
				$this->db->from('doc_numbering');
				$this->db->where('is_active', 1);
				$this->db->where('document', 'Quotation');
				$data['quotation_no']=$this->db->get()->row();

				$this->db->select('count(*) as angka');
				$this->db->from('quotation');
				$angka=$this->db->get()->row();

				if(strpos($data['quotation_no']->pattern, "XXXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="000".$nomor;
					}else if($nomor<=99){
						$nomor="00".$nomor;
					}else if($nomor<=999){
						$nomor="0".$nomor;
					}
					$data['quotation_no']->pattern=str_replace("XXXX", $nomor, $data['quotation_no']->pattern);
				}if(strpos($data['quotation_no']->pattern, "XXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="00".$nomor;
					}else if($nomor<=99){
						$nomor="0".$nomor;
					}
					$data['quotation_no']->pattern=str_replace("XXX", $nomor, $data['quotation_no']->pattern);
				}if(strpos($data['quotation_no']->pattern, "XX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="0".$nomor;
					}else if($nomor<=99){
						$nomor=$nomor;
					}
					$data['quotation_no']->pattern=str_replace("XX", $nomor, $data['quotation_no']->pattern);
				}if(strpos($data['quotation_no']->pattern, "X")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor=$nomor;
					}
					$data['quotation_no']->pattern=str_replace("X", $nomor, $data['quotation_no']->pattern);
				}
				if(strpos($data['quotation_no']->pattern, "FF")){
					$data['quotation_no']->pattern=str_replace("FF",date('m'), $data['quotation_no']->pattern);
				}
				if(strpos($data['quotation_no']->pattern, "YYYY")){
					$data['quotation_no']->pattern=str_replace("YYYY",date('Y'), $data['quotation_no']->pattern);
				}
				if(strpos($data['quotation_no']->pattern, "YY")){
					$data['quotation_no']->pattern=str_replace("YY",date('y'), $data['quotation_no']->pattern);
				}
				if(strpos($data['quotation_no']->pattern, "ff")){
					if(date('m')=="01"){
						$roman="I";
					}else if(date('m')=="02"){
						$roman="II";
					}else if(date('m')=="03"){
						$roman="III";
					}else if(date('m')=="04"){
						$roman="IV";
					}else if(date('m')=="05"){
						$roman="V";
					}else if(date('m')=="06"){
						$roman="VI";
					}else if(date('m')=="07"){
						$roman="VII";
					}else if(date('m')=="08"){
						$roman="VIII";
					}else if(date('m')=="09"){
						$roman="IX";
					}else if(date('m')=="10"){
						$roman="X";
					}else if(date('m')=="11"){
						$roman="XI";
					}else if(date('m')=="12"){
						$roman="XII";
					}
					$data['quotation_no']->pattern=str_replace("ff",$roman, $data['quotation_no']->pattern);
				}

				$this->load->view('marketing/quotation_form', $data);
			}else{

				$this->db->select('*');
				$this->db->from('quotation');
				$this->db->where('id', $data_input['id']);
				$this->db->where('is_active', 1);
				$data['header']=$this->db->get()->row();


				$this->db->select('*');
				$this->db->from('quotation_detail');
				$this->db->where('quotation_id', $data_input['id']);
				$this->db->where('is_active', 1);
				$data['detail']=$this->db->get()->result();


				$this->db->select('*');
				$this->db->from('quotation_calc');
				$this->db->where('quotation_id', $data_input['id']);
				$this->db->where('is_active', 1);
				$data['detail_calc']=$this->db->get()->row();

				$this->db->from('customer');
				$this->db->where('is_active', 1);
				$data['customer']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('currency');
				$this->db->where('is_active', 1);
				$data['currency']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('unit_of_measures');
				$this->db->where('is_active', 1);
				$data['measures']=$this->db->get()->result();


				$this->db->select('*');
				$this->db->from('doc_numbering');
				$this->db->where('is_active', 1);
				$this->db->where('document', 'Quotation');
				$data['quotation_no']=$this->db->get()->row();

				$this->db->select('count(*) as angka');
				$this->db->from('quotation');
				$angka=$this->db->get()->row();

				if(strpos($data['quotation_no']->pattern, "XXXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="000".$nomor;
					}else if($nomor<=99){
						$nomor="00".$nomor;
					}else if($nomor<=999){
						$nomor="0".$nomor;
					}
					$data['quotation_no']->pattern=str_replace("XXXX", $nomor, $data['quotation_no']->pattern);
				}if(strpos($data['quotation_no']->pattern, "XXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="00".$nomor;
					}else if($nomor<=99){
						$nomor="0".$nomor;
					}
					$data['quotation_no']->pattern=str_replace("XXX", $nomor, $data['quotation_no']->pattern);
				}if(strpos($data['quotation_no']->pattern, "XX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="0".$nomor;
					}else if($nomor<=99){
						$nomor=$nomor;
					}
					$data['quotation_no']->pattern=str_replace("XX", $nomor, $data['quotation_no']->pattern);
				}if(strpos($data['quotation_no']->pattern, "X")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor=$nomor;
					}
					$data['quotation_no']->pattern=str_replace("X", $nomor, $data['quotation_no']->pattern);
				}
				if(strpos($data['quotation_no']->pattern, "FF")){
					$data['quotation_no']->pattern=str_replace("FF",date('m'), $data['quotation_no']->pattern);
				}
				if(strpos($data['quotation_no']->pattern, "YYYY")){
					$data['quotation_no']->pattern=str_replace("YYYY",date('Y'), $data['quotation_no']->pattern);
				}
				if(strpos($data['quotation_no']->pattern, "YY")){
					$data['quotation_no']->pattern=str_replace("YY",date('y'), $data['quotation_no']->pattern);
				}
				if(strpos($data['quotation_no']->pattern, "ff")){
					if(date('m')=="01"){
						$roman="I";
					}else if(date('m')=="02"){
						$roman="II";
					}else if(date('m')=="03"){
						$roman="III";
					}else if(date('m')=="04"){
						$roman="IV";
					}else if(date('m')=="05"){
						$roman="V";
					}else if(date('m')=="06"){
						$roman="VI";
					}else if(date('m')=="07"){
						$roman="VII";
					}else if(date('m')=="08"){
						$roman="VIII";
					}else if(date('m')=="09"){
						$roman="IX";
					}else if(date('m')=="10"){
						$roman="X";
					}else if(date('m')=="11"){
						$roman="XI";
					}else if(date('m')=="12"){
						$roman="XII";
					}
					$data['quotation_no']->pattern=str_replace("ff",$roman, $data['quotation_no']->pattern);
				}

				$this->load->view('marketing/quotation_form', $data);
			}

			
		}else if($param=="add"){
			$data_input=$this->input->post();
			if(empty($data_input['id'])){
				$insert_table = array(
					'customer_id' =>$data_input['customer'],
					'project_id'=>$data_input['project'],
					'pic_id'=>$data_input['pic'],
					'qn_number'=>$data_input['qn_number'],
					'order_type'=>$data_input['order_type'],
					'qn_date'=>$data_input['qn_date'],
					'inquiry_reff'=>$data_input['inq_ref'],
					'rev_no'=>$data_input['rev_no'],
					'rev_date'=>$data_input['rev_date'],
					'status'=>"on progress",
					'delivery_date'=>$data_input['delivery_date'],
					'delivery_to'=>$data_input['delivery_to'],
					'currency'=>$data_input['currency'],
					'vat'=>$data_input['vat'],
					'construction_fee'=>$data_input['contruction_fee'],
					'terms'=>$data_input['terms'],
					'lead_time'=>$data_input['lead'],
					'quotation_valid'=>$data_input['valid'],
					'subject'=>$data_input['subject'],
					'note'=>$data_input['note'],
					'attachment'=>$data_input['attachment'],
					'material'=>$data_input['material'],
					'sandblasting'=>$data_input['sandblasting'],
					'painting'=>$data_input['painting'],
					'asbuiltdrawing'=>$data_input['drawing'],
					'galvanished'=>$data_input['galvanished'],
					'erection'=>$data_input['erection'],
					'packing'=>$data_input['packing'],
					'ndt'=>$data_input['ndt'],
					'certificate'=>$data_input['certificate'],
					'delivery'=>$data_input['delivery'],
					'is_active'=>1 
				);
				$this->db->insert('quotation', $insert_table);

				$this->db->select('id');
				$this->db->from('quotation');
				$this->db->where('is_active', 1);
				$this->db->order_by('id', 'desc');
				$this->db->limit(1);
				$kode=$this->db->get()->row();

				$insert_detail_calc = array(
					'quotation_id' => $kode->id,
					'grand_summary'=>$data_input['summary'],
					'rounding_discount'=>$data_input['discount'],
					'construction_fee'=>$data_input['construction'],
					'grand_total_vat'=>$data_input['total_vat'],
					'is_active'=>1 
				);
				$this->db->insert('quotation_calc', $insert_detail_calc);

				for ($i=0; $i <count($data_input['detail_id']) ; $i++) { 
					$insert_detail = array(
						'quotation_id' =>$kode->id ,
						'description'=>$data_input['detail_desc'][$i],
						'qty'=>$data_input['detail_qty'][$i],
						'unit'=>$data_input['detail_unit'][$i],
						'price'=>$data_input['detail_price'][$i],
						'total_price'=>$data_input['detail_totalprice'][$i],
						'is_active'=>1 
					);
					$this->db->insert('quotation_detail', $insert_detail);
				}
				header("Location: ".base_url()."marketing/quotation?res=success");
			}else{
				$insert_table = array(
					'customer_id' =>$data_input['customer'],
					'project_id'=>$data_input['project'],
					'pic_id'=>$data_input['pic'],
					'qn_number'=>$data_input['qn_number'],
					'order_type'=>$data_input['order_type'],
					'qn_date'=>$data_input['qn_date'],
					'inquiry_reff'=>$data_input['inq_ref'],
					'rev_no'=>$data_input['rev_no'],
					'rev_date'=>$data_input['rev_date'],
					'status'=>"on progress",
					'delivery_date'=>$data_input['delivery_date'],
					'delivery_to'=>$data_input['delivery_to'],
					'currency'=>$data_input['currency'],
					'vat'=>$data_input['vat'],
					'construction_fee'=>$data_input['contruction_fee'],
					'terms'=>$data_input['terms'],
					'lead_time'=>$data_input['lead'],
					'quotation_valid'=>$data_input['valid'],
					'subject'=>$data_input['subject'],
					'note'=>$data_input['note'],
					'attachment'=>$data_input['attachment'],
					'material'=>$data_input['material'],
					'sandblasting'=>$data_input['sandblasting'],
					'painting'=>$data_input['painting'],
					'asbuiltdrawing'=>$data_input['drawing'],
					'galvanished'=>$data_input['galvanished'],
					'erection'=>$data_input['erection'],
					'packing'=>$data_input['packing'],
					'ndt'=>$data_input['ndt'],
					'certificate'=>$data_input['certificate'],
					'delivery'=>$data_input['delivery'],
					'is_active'=>1 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('quotation', $insert_table);

				$kode->id=$data_input['id'];

				$insert_detail_calc = array(
					'grand_summary'=>$data_input['summary'],
					'rounding_discount'=>$data_input['discount'],
					'construction_fee'=>$data_input['construction'],
					'grand_total_vat'=>$data_input['total_vat'],
					'is_active'=>1 
				);
				$this->db->where('quotation_id', $kode->id);
				$this->db->update('quotation_calc', $insert_detail_calc);

				$arrayName = array('is_active' =>0 );
				$this->db->where('quotation_id', $kode->id);
				$this->db->update('quotation_detail', $arrayName);

				for ($i=0; $i <count($data_input['detail_id']) ; $i++) { 
					$insert_detail = array(
						'quotation_id' =>$kode->id ,
						'description'=>$data_input['detail_desc'][$i],
						'qty'=>$data_input['detail_qty'][$i],
						'unit'=>$data_input['detail_unit'][$i],
						'price'=>$data_input['detail_price'][$i],
						'total_price'=>$data_input['detail_totalprice'][$i],
						'is_active'=>1 
					);
					$this->db->insert('quotation_detail', $insert_detail);
				}
				header("Location: ".base_url()."marketing/quotation?res=success");
			}
			
		}else if($param=="delete"){
			$data_input=$this->input->post();
			$arrayName = array('is_active' => 0 );
			$this->db->where('id', $data_input['id']);
			$this->db->update('quotation', $arrayName);
			redirect('marketing/quotation','refresh');
		}else{
			$this->db->select('a.*,b.name as customer_name,c.name as project_name,DATE_ADD(a.delivery_date, INTERVAL a.quotation_valid DAY) as due_date');
			$this->db->from('quotation as a');
			$this->db->join('customer as b', 'a.customer_id = b.id', 'left');
			$this->db->join('project as c', 'a.project_id = c.id', 'left');
			$this->db->where('a.is_active', 1);
			$data['table']=$this->db->get()->result();
			// echo $this->db->last_query();
			// exit();
			$this->load->view('marketing/quotation', $data);
		}
	}

	public function quotation_select(){
		$data_input=$this->input->post();
		$this->db->select('*');
		$this->db->from('project');
		$this->db->where('is_active', 1);
		$this->db->where('customer_id', $data_input['id']);
		$response=$this->db->get()->result();
		$response=json_encode($response);
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;
	}

	public function quotation_select2(){
		$data_input=$this->input->post();
		$this->db->select('*');
		$this->db->from('customer_contact');
		$this->db->where('is_active', 1);
		$this->db->where('customer_id', $data_input['id']);
		$response=$this->db->get()->result();
		$response=json_encode($response);
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;
	}

	public function quotation_select3(){
		$data_input=$this->input->post();
		$this->db->select('*');
		$this->db->from('project_contact');
		$this->db->where('is_active', 1);
		$this->db->where('id', $data_input['id']);
		$response=$this->db->get()->row();
		$response=json_encode($response);
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;
	}

	public function measure_list(){
		$data_input=$this->input->post();
		$this->db->select('*');
		$this->db->from('unit_of_measures');
		$this->db->where('is_active', 1);
		$response=$this->db->get()->result();
		$response=json_encode($response);
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;
	}

	public function project($param=null){
		if($param=="create"){
			$this->db->select('*');
			$this->db->from('customer');
			$this->db->where('is_active', 1);
			$data['customer']=$this->db->get()->result();
			$this->load->view('marketing/project_form', $data);
		}else if($param=="edit"){
			$data_input=$this->input->post();
			$this->db->select('*');
			$this->db->from('project');
			$this->db->where('id', $data_input['id']);
			$this->db->where('is_active', 1);
			$data['project']=$this->db->get()->row();

			$this->db->select('*');
			$this->db->from('customer');
			$this->db->where('is_active', 1);
			$data['customer']=$this->db->get()->result();

			$this->db->select('*');
			$this->db->from('project_contact');
			$this->db->where('project_id', $data_input['id']);
			$this->db->where('is_active', 1);
			$data['project_contact']=$this->db->get()->result();

			$this->load->view('marketing/project_form', $data);
		}else if($param=="add"){
			$data_input=$this->input->post();
			// echo var_dump($data_input);
			// exit();
			if(empty($data_input['id'])){
				if(empty($data_input['is_finished'])){
					$finished=0;
				}else{
					$finished=1;
				}
				$insert_table = array(
					'customer_id'=>$data_input['customer'],
					'name'=>$data_input['name'],
					'location'=>$data_input['location'],
					'note'=>$data_input['note'],
					'start_date'=>$data_input['start_date'],
					'end_date'=>$data_input['end_date'],
					'is_finished'=>$finished,
					'is_active'=>1, 
				);
				$this->db->insert('project', $insert_table);
				$this->db->select('id');
				$this->db->from('project');
				$this->db->where('is_active', 1);
				$this->db->order_by('id', 'desc');
				$header=$this->db->get()->row();

				for ($i=0; $i <count($data_input['contact_id']) ; $i++) { 
					$insert_detail = array(
						'project_id'=>$data_input['contact_id'][$i],
						'name'=>$data_input['contact_name'][$i],
						'handphone'=>$data_input['contact_handphone'][$i],
						'email'=>$data_input['contact_email'][$i],
						'position'=>$data_input['contact_position'][$i],
						'is_active'=>1, 
					);
					$this->db->insert('project_contact', $insert_detail);
				}
				
			}else{
				if(empty($data_input['is_finished'])){
					$finished=0;
				}else{
					$finished=1;
				}
				$insert_table = array(
					'customer_id'=>$data_input['customer'],
					'name'=>$data_input['name'],
					'location'=>$data_input['location'],
					'note'=>$data_input['note'],
					'start_date'=>$data_input['start_date'],
					'end_date'=>$data_input['end_date'],
					'is_finished'=>$finished,
					'is_active'=>1, 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('project', $insert_table);

				$insert_detail = array('is_active' =>0 , );
				$this->db->where('project_id', $data_input['id']);
				$this->db->update('project_contact', $insert_detail);

				for ($i=0; $i <count($data_input['contact_id']) ; $i++) { 
					if(empty($data_input['contact_id'][$i])){
						$insert_detail = array(
							'project_id'=>$data_input['id'],
							'name'=>$data_input['contact_name'][$i],
							'handphone'=>$data_input['contact_handphone'][$i],
							'email'=>$data_input['contact_email'][$i],
							'position'=>$data_input['contact_position'][$i],
							'is_active'=>1, 
						);
						$this->db->insert('project_contact', $insert_detail);
					}else{
						$insert_detail = array(
							'project_id'=>$data_input['id'],
							'name'=>$data_input['contact_name'][$i],
							'handphone'=>$data_input['contact_handphone'][$i],
							'email'=>$data_input['contact_email'][$i],
							'position'=>$data_input['contact_position'][$i],
							'is_active'=>1, 
						);
						$this->db->where('id', $data_input['contact_id'][$i]);
						$this->db->update('project_contact', $insert_detail);
					}
					
				}

			}
			
			header("Location: ".base_url()."marketing/project");
		}else if($param=="delete"){
			$data_input=$this->input->post();
			$insert_table = array(
				'is_active'=>0, 
			);
			$this->db->where('id', $data_input['id']);
			$this->db->update('project', $insert_table);
			header("Location: ".base_url()."marketing/project");
		}else{
			$this->db->select('a.id,c.name as customer_name,a.name,a.location,a.start_date,a.end_date,a.is_finished');
			$this->db->from('project as a');
			$this->db->join('customer as c', 'a.customer_id = c.id', 'left');
			$this->db->where('a.is_active', 1);
			$data['table']=$this->db->get()->result();

			$this->db->select('*');
			$this->db->from('project_contact');
			$this->db->where('is_active', 1);
			$data['contact']=$this->db->get()->result();

			$this->load->view('marketing/project', $data);
		}
	}

	public function joborder($param=null){
		if($param=="add"){
			$data_input=$this->input->post();
			// echo var_dump($data_input);
			// exit();
			if(empty($data_input['id'])){
				$insert_header = array(
					'quotation_id' => $data_input['qn_number'],
					'job_number'=>$data_input['job_number'],
					'delivery_date'=>$data_input['delivery_date'],
					'is_internal'=>$data_input['is_internal']??"",
					'delivery_destination'=>$data_input['delivery_destination'],
					'currency'=>$data_input['currency'],
					'vat'=>10,
					'construction_fee'=>$data_input['construction_fee'],
					'terms'=>$data_input['terms'],
					'note'=>$data_input['note'],
					'status'=>'On Going',
					'fabricator'=>$data_input['fabrication'],
					'material'=>$data_input['material'],
					'sandblasting'=>$data_input['sandblasting'],
					'painting'=>$data_input['painting'],
					'asbuiltdrawing'=>$data_input['drawing'],
					'galvanished'=>$data_input['galvanished'],
					'erection'=>$data_input['erection'],
					'packing'=>$data_input['packing'],
					'NDT'=>$data_input['ndt'],
					'certificate'=>$data_input['certificate'],
					'delivery'=>$data_input['delivery'],
					'is_active'=>1, 
				);
				$this->db->insert('job_order', $insert_header);

				$this->db->select('id');
				$this->db->from('job_order');
				$this->db->where('is_active', 1);
				$this->db->order_by('id', 'desc');
				$this->db->limit(1);
				$kode_job=$this->db->get()->row();

				$this->db->select('id');
				$this->db->from('quotation');
				$this->db->where('is_active', 1);
				$this->db->where('qn_number', $data_input['qn_number']);
				$this->db->order_by('id', 'desc');
				$this->db->limit(1);
				$kode=$this->db->get()->row();


				$insert_detail_calc = array(
					'grand_summary'=>$data_input['summary'],
					'rounding_discount'=>$data_input['discount'],
					'construction_fee'=>$data_input['construction'],
					'grand_total_vat'=>$data_input['total_vat'],
					'is_active'=>1 
				);
				$this->db->where('quotation_id', $kode->id);
				$this->db->update('quotation_calc', $insert_detail_calc);

				$update_table_detail = array('is_active' => 0, );
				$this->db->where('quotation_id', $kode->id);
				$this->db->update('quotation_detail', $update_table_detail);

				for ($i=0; $i <count($data_input['detail_id']) ; $i++) { 
					if($data_input['detail_id'][$i]!=""){
						$insert_detail = array(
							'quotation_id' =>$kode->id ,
							'description'=>$data_input['detail_desc'][$i],
							'qty'=>$data_input['detail_qty'][$i],
							'unit'=>$data_input['detail_unit'][$i],
							'price'=>$data_input['detail_price'][$i],
							'total_price'=>$data_input['detail_totalprice'][$i],
							'is_active'=>1 
						);
						$this->db->insert('quotation_detail', $insert_detail);
					}else{
						$insert_detail = array(
							'quotation_id' =>$kode->id ,
							'description'=>$data_input['detail_desc'][$i],
							'qty'=>$data_input['detail_qty'][$i],
							'unit'=>$data_input['detail_unit'][$i],
							'price'=>$data_input['detail_price'][$i],
							'total_price'=>$data_input['detail_totalprice'][$i],
							'is_active'=>1 
						);
						$this->db->where('id', $data_input['detail_id'][$i]);
						$this->db->update('quotation_detail', $insert_detail);
					}
					
				}

				for ($i=0; $i <count($data_input['inv_id']) ; $i++) { 
					if($data_input['inv_id'][$i]!=""){
						$insert_detail = array(
							'job_id' =>$kode_job->id ,
							'invoice_date'=>$data_input['inv_date'][$i],
							'invoice_number'=>$data_input['inv_number'][$i],
							'value'=>$data_input['inv_value'][$i],
							'payment_date'=>$data_input['inv_paydate'][$i],
							'status'=>$data_input['inv_paystatus'][$i],
							'note'=>$data_input['inv_note'][$i],
							'is_active'=>1 
						);
						$this->db->insert('job_detail_inv', $insert_detail);
					}else{
						$insert_detail = array(
							'job_id' =>$kode_job->id ,
							'invoice_date'=>$data_input['inv_date'][$i],
							'invoice_number'=>$data_input['inv_number'][$i],
							'value'=>$data_input['inv_value'][$i],
							'payment_date'=>$data_input['inv_paydate'][$i],
							'status'=>$data_input['inv_paystatus'][$i],
							'note'=>$data_input['inv_note'][$i],
							'is_active'=>1 
						);
						
						$this->db->where('id', $data_input['inv_id'][$i]);
						$this->db->update('job_detail_inv', $insert_detail);
					}
					
				}

				for ($i=0; $i <count($data_input['disc_id']) ; $i++) { 
					if($data_input['disc_id'][$i]!=""){
						$insert_detail = array(
							'job_id' =>$kode_job->id,
							'name'=>$data_input['disc_name'][$i],
							'position'=>$data_input['disc_position'][$i],
							'note'=>$data_input['disc_note'][$i],
							'discount'=>$data_input['disc_discount'][$i],
							'is_active'=>1 
						);
						$this->db->insert('job_detail_discount', $insert_detail);
					}else{
						$insert_detail = array(
							'job_id' =>$kode_job->id ,
							'name'=>$data_input['disc_name'][$i],
							'position'=>$data_input['disc_position'][$i],
							'note'=>$data_input['disc_note'][$i],
							'discount'=>$data_input['disc_discount'][$i],
							'is_active'=>1 
						);
						
						$this->db->where('id', $data_input['disc_id'][$i]);
						$this->db->update('job_detail_discount', $insert_detail);
					}
					
				}
				header("Location: ".base_url()."marketing/joborder?res=success");
			}else{
				$insert_header = array(
					'quotation_id' => $data_input['qn_number'],
					'job_number'=>$data_input['job_number'],
					'jo_date'=>$data_input['jo_date'],
					'delivery_date'=>$data_input['delivery_date'],
					'is_internal'=>$data_input['is_internal']??"",
					'delivery_destination'=>$data_input['delivery_destination'],
					'currency'=>$data_input['currency'],
					'vat'=>10,
					'construction_fee'=>$data_input['construction_fee'],
					'terms'=>$data_input['terms'],
					'note'=>$data_input['note'],
					'status'=>'On Going',
					'fabricator'=>$data_input['fabrication'],
					'material'=>$data_input['material'],
					'sandblasting'=>$data_input['sandblasting'],
					'painting'=>$data_input['painting'],
					'asbuiltdrawing'=>$data_input['drawing'],
					'galvanished'=>$data_input['galvanished'],
					'erection'=>$data_input['erection'],
					'packing'=>$data_input['packing'],
					'NDT'=>$data_input['ndt'],
					'certificate'=>$data_input['certificate'],
					'delivery'=>$data_input['delivery'],
					'is_active'=>1, 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('job_order', $insert_header);

				$kode_job->id=$data_input['id'];


				$this->db->select('id');
				$this->db->from('quotation');
				$this->db->where('is_active', 1);
				$this->db->where('qn_number', $data_input['qn_number']);
				$this->db->order_by('id', 'desc');
				$this->db->limit(1);
				$kode=$this->db->get()->row();


				$insert_detail_calc = array(
					'grand_summary'=>$data_input['summary'],
					'rounding_discount'=>$data_input['discount'],
					'construction_fee'=>$data_input['construction'],
					'grand_total_vat'=>$data_input['total_vat'],
					'is_active'=>1 
				);
				$this->db->where('quotation_id', $kode->id);
				$this->db->update('quotation_calc', $insert_detail_calc);

				$update_table_detail = array('is_active' => 0, );
				$this->db->where('quotation_id', $kode->id);
				$this->db->update('quotation_detail', $update_table_detail);

				for ($i=0; $i <count($data_input['detail_id']) ; $i++) { 
					if($data_input['detail_id'][$i]!=""){
						$insert_detail = array(
							'quotation_id' =>$kode->id ,
							'description'=>$data_input['detail_desc'][$i],
							'qty'=>$data_input['detail_qty'][$i],
							'unit'=>$data_input['detail_unit'][$i],
							'price'=>$data_input['detail_price'][$i],
							'total_price'=>$data_input['detail_totalprice'][$i],
							'is_active'=>1 
						);
						$this->db->insert('quotation_detail', $insert_detail);
					}else{
						$insert_detail = array(
							'quotation_id' =>$kode->id ,
							'description'=>$data_input['detail_desc'][$i],
							'qty'=>$data_input['detail_qty'][$i],
							'unit'=>$data_input['detail_unit'][$i],
							'price'=>$data_input['detail_price'][$i],
							'total_price'=>$data_input['detail_totalprice'][$i],
							'is_active'=>1 
						);
						$this->db->where('id', $data_input['detail_id'][$i]);
						$this->db->update('quotation_detail', $insert_detail);
					}
					
				}

				$arrayName = array('is_active' =>0 , );
				$this->db->where('job_id', $data_input['id']);
				$this->db->update('job_detail_inv', $arrayName);

				for ($i=0; $i <count($data_input['inv_id']) ; $i++) { 
					if($data_input['inv_id'][$i]!=""){
						$insert_detail = array(
							'job_id' =>$kode_job->id,
							'invoice_date'=>$data_input['inv_date'][$i],
							'invoice_number'=>$data_input['inv_number'][$i],
							'value'=>$data_input['inv_value'][$i],
							'payment_date'=>$data_input['inv_paydate'][$i],
							'status'=>$data_input['inv_paystatus'][$i]??"",
							'note'=>$data_input['inv_note'][$i],
							'is_active'=>1 
						);
						$this->db->insert('job_detail_inv', $insert_detail);
					}else{
						$insert_detail = array(
							'job_id' =>$kode_job->id ,
							'invoice_date'=>$data_input['inv_date'][$i],
							'invoice_number'=>$data_input['inv_number'][$i],
							'value'=>$data_input['inv_value'][$i],
							'payment_date'=>$data_input['inv_paydate'][$i],
							'status'=>$data_input['inv_paystatus'][$i]??"",
							'note'=>$data_input['inv_note'][$i],
							'is_active'=>1 
						);
						
						$this->db->where('id', $data_input['inv_id'][$i]);
						$this->db->update('job_detail_inv', $insert_detail);
					}
					
				}

				$arrayName = array('is_active' =>0 , );
				$this->db->where('job_id', $data_input['id']);
				$this->db->update('job_detail_discount', $arrayName);

				for ($i=0; $i <count($data_input['disc_id']) ; $i++) { 
					if($data_input['disc_id'][$i]!=""){
						$insert_detail = array(
							'job_id' =>$kode_job->id,
							'name'=>$data_input['disc_name'][$i],
							'position'=>$data_input['disc_position'][$i],
							'note'=>$data_input['disc_note'][$i],
							'discount'=>$data_input['disc_discount'][$i],
							'is_active'=>1 
						);
						$this->db->insert('job_detail_discount', $insert_detail);
					}else{
						$insert_detail = array(
							'job_id' =>$kode_job->id ,
							'name'=>$data_input['disc_name'][$i],
							'position'=>$data_input['disc_position'][$i],
							'note'=>$data_input['disc_note'][$i],
							'discount'=>$data_input['disc_discount'][$i],
							'is_active'=>1 
						);
						
						$this->db->where('id', $data_input['disc_id'][$i]);
						$this->db->update('job_detail_discount', $insert_detail);
					}
					
				}
				header("Location: ".base_url()."marketing/joborder?res=success");
			}
			
		}else if($param=="create"){
			$data_input=$this->input->post();
			if(empty($data_input['id'])){
				$this->db->select('*');
				$this->db->from('quotation');
				$this->db->where('is_active', 1);
				$this->db->order_by('id', 'desc');
				$data['quotation']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('doc_numbering');
				$this->db->where('is_active', 1);
				$this->db->where('document', 'Job Order');
				$data['job_no']=$this->db->get()->row();

				$this->db->select('count(*) as angka');
				$this->db->from('job_order');
				$angka=$this->db->get()->row();
				// echo strpos($data['job_no']->pattern, "XXX");
				// exit();
				if(strpos($data['job_no']->pattern, "XXXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="000".$nomor;
					}else if($nomor<=99){
						$nomor="00".$nomor;
					}else if($nomor<=999){
						$nomor="0".$nomor;
					}
					$data['job_no']->pattern=str_replace("XXXX", $nomor, $data['job_no']->pattern);
				}
				if(strpos($data['job_no']->pattern, "XXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="00".$nomor;
					}else if($nomor<=99){
						$nomor="0".$nomor;
					}else if($nomor<=999){
						$nomor=$nomor;
					}
					$data['job_no']->pattern=str_replace("XXX", $nomor, $data['job_no']->pattern);
				}
				if(strpos($data['job_no']->pattern, "XX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="0".$nomor;
					}else if($nomor<=99){
						$nomor=$nomor;
					}
					$data['job_no']->pattern=str_replace("XX", $nomor, $data['job_no']->pattern);
				}
				if(strpos($data['job_no']->pattern, "X")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor=$nomor;
					}
					$data['job_no']->pattern=str_replace("X", $nomor, $data['job_no']->pattern);
				}
				
				if(strpos($data['job_no']->pattern, "FF")){
					$data['job_no']->pattern=str_replace("FF",date('m'), $data['job_no']->pattern);
				}
				if(strpos($data['job_no']->pattern, "YYYY")){
					$data['job_no']->pattern=str_replace("YYYY",date('Y'), $data['job_no']->pattern);
				}
				if(strpos($data['job_no']->pattern, "YY")){
					$data['job_no']->pattern=str_replace("YY",date('y'), $data['job_no']->pattern);
				}
				if(strpos($data['job_no']->pattern, "ff")){
					if(date('m')=="01"){
						$roman="I";
					}else if(date('m')=="02"){
						$roman="II";
					}else if(date('m')=="03"){
						$roman="III";
					}else if(date('m')=="04"){
						$roman="IV";
					}else if(date('m')=="05"){
						$roman="V";
					}else if(date('m')=="06"){
						$roman="VI";
					}else if(date('m')=="07"){
						$roman="VII";
					}else if(date('m')=="08"){
						$roman="VIII";
					}else if(date('m')=="09"){
						$roman="IX";
					}else if(date('m')=="10"){
						$roman="X";
					}else if(date('m')=="11"){
						$roman="XI";
					}else if(date('m')=="12"){
						$roman="XII";
					}
					$data['job_no']->pattern=str_replace("ff",$roman, $data['job_no']->pattern);
				}


				$this->load->view('marketing/joborder_form', $data);
			}else{

				$this->db->select('*');
				$this->db->from('job_order');
				$this->db->where('is_active', 1);
				$this->db->where('id', $data_input['id']);
				$data['header']=$this->db->get()->row();

				$this->db->select('*');
				$this->db->from('quotation');
				$this->db->where('is_active', 1);
				$this->db->where('id', $data_input['id']);
				$data['quotation_header']=$this->db->get()->row();

				$this->db->select('*');
				$this->db->from('job_detail_inv');
				$this->db->where('is_active', 1);
				$this->db->where('job_id', $data_input['id']);
				$this->db->order_by('id', 'desc');
				$data['detail_inv']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('job_detail_discount');
				$this->db->where('is_active', 1);
				$this->db->where('job_id', $data_input['id']);
				$this->db->order_by('id', 'desc');
				$data['detail_discount']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('quotation');
				$this->db->where('is_active', 1);
				$this->db->order_by('id', 'desc');
				$data['quotation']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('doc_numbering');
				$this->db->where('is_active', 1);
				$this->db->where('document', 'Job Order');
				$data['job_no']=$this->db->get()->row();

				$this->db->select('count(*) as angka');
				$this->db->from('job_order');
				$angka=$this->db->get()->row();
				// echo strpos($data['job_no']->pattern, "XXX");
				// exit();
				if(strpos($data['job_no']->pattern, "XXXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="000".$nomor;
					}else if($nomor<=99){
						$nomor="00".$nomor;
					}else if($nomor<=999){
						$nomor="0".$nomor;
					}
					$data['job_no']->pattern=str_replace("XXXX", $nomor, $data['job_no']->pattern);
				}
				if(strpos($data['job_no']->pattern, "XXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="00".$nomor;
					}else if($nomor<=99){
						$nomor="0".$nomor;
					}else if($nomor<=999){
						$nomor=$nomor;
					}
					$data['job_no']->pattern=str_replace("XXX", $nomor, $data['job_no']->pattern);
				}
				if(strpos($data['job_no']->pattern, "XX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="0".$nomor;
					}else if($nomor<=99){
						$nomor=$nomor;
					}
					$data['job_no']->pattern=str_replace("XX", $nomor, $data['job_no']->pattern);
				}
				if(strpos($data['job_no']->pattern, "X")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor=$nomor;
					}
					$data['job_no']->pattern=str_replace("X", $nomor, $data['job_no']->pattern);
				}
				
				if(strpos($data['job_no']->pattern, "FF")){
					$data['job_no']->pattern=str_replace("FF",date('m'), $data['job_no']->pattern);
				}
				if(strpos($data['job_no']->pattern, "YYYY")){
					$data['job_no']->pattern=str_replace("YYYY",date('Y'), $data['job_no']->pattern);
				}
				if(strpos($data['job_no']->pattern, "YY")){
					$data['job_no']->pattern=str_replace("YY",date('y'), $data['job_no']->pattern);
				}
				if(strpos($data['job_no']->pattern, "ff")){
					if(date('m')=="01"){
						$roman="I";
					}else if(date('m')=="02"){
						$roman="II";
					}else if(date('m')=="03"){
						$roman="III";
					}else if(date('m')=="04"){
						$roman="IV";
					}else if(date('m')=="05"){
						$roman="V";
					}else if(date('m')=="06"){
						$roman="VI";
					}else if(date('m')=="07"){
						$roman="VII";
					}else if(date('m')=="08"){
						$roman="VIII";
					}else if(date('m')=="09"){
						$roman="IX";
					}else if(date('m')=="10"){
						$roman="X";
					}else if(date('m')=="11"){
						$roman="XI";
					}else if(date('m')=="12"){
						$roman="XII";
					}
					$data['job_no']->pattern=str_replace("ff",$roman, $data['job_no']->pattern);
				}


				$this->load->view('marketing/joborder_form', $data);
			}
			

		}else if($param=="delete"){
			$data_input=$this->input->post();
			$arrayName = array('is_active' => 0);
			$this->db->where('id', $data_input['id']);
			$this->db->update('job_order', $arrayName);
			redirect('marketing/joborder','refresh');
		}else{
			$this->db->select('a.*,c.name as customer_name,b.qn_number,d.name as project_name,b.order_type,DATE_ADD(b.delivery_date, INTERVAL b.quotation_valid DAY) as due_date,e.name as marketing,calc.grand_total_vat');
			$this->db->from('job_order as a');
			$this->db->where('a.is_active', 1);
			$this->db->join('quotation as b', 'a.quotation_id = b.id', 'left');
			$this->db->join('customer as c', 'c.id = b.customer_id', 'left');
			$this->db->join('project as d', 'd.id = b.project_id', 'left');
			$this->db->join('project_contact as e', 'e.id =b.pic_id ', 'left');
			$this->db->join('quotation_calc as calc', 'b.id = calc.quotation_id', 'left');
			$data['table']=$this->db->get()->result();

			foreach ($data['table'] as $key => $value) {
				$grand_total_vat=floatval(trim(str_replace("IDR","",$value->grand_total_vat)));
				$this->db->select('*');
				$this->db->from('job_detail_inv');
				$this->db->where('is_active', 1);
				$this->db->where('job_id', $value->id);
				$result=$this->db->get()->result();
				$progress=0;
				foreach ($result as $key2 => $value2) {
					$progress+=floatval(trim($value2->value));
				}
				if($grand_total_vat!=0){
					$value->progress=round($progress/$grand_total_vat*100)."%";
				}else{
					$value->progres="0%";
				}
				
			}


			$this->load->view('marketing/joborder', $data);
		}
	}

	public function job_select1(){
		$data_input=$this->input->post();
		$this->db->select('b.*,c.name as customer_name,d.name as project_name');
		$this->db->from('quotation as b');
		$this->db->join('customer as c', 'b.customer_id = c.id', 'left');
		$this->db->join('project as d', 'b.project_id = d.id', 'left');
		$this->db->where('b.qn_number', $data_input['qn_number']);
		$res=$this->db->get()->row();

		$this->db->select('b.*');
		$this->db->from('quotation as a');
		$this->db->join('quotation_detail as b', 'a.id=b.quotation_id', 'left');
		$this->db->where('a.qn_number', $data_input['qn_number']);
		$this->db->where('b.is_active', 1);
		$detail_data=$this->db->get()->result();

		$this->db->select('b.*');
		$this->db->from('quotation as a');
		$this->db->join('quotation_calc as b', 'a.id=b.quotation_id', 'left');
		$this->db->where('a.qn_number', $data_input['qn_number']);
		$this->db->where('b.is_active', 1);
		$detail_calc=$this->db->get()->row();

		$this->db->select('*');
		$this->db->from('unit_of_measures');
		// $this->db->where('a.qn_number', $data_input['qn_number']);
		$this->db->where('is_active', 1);
		$measures=$this->db->get()->result();

		$array = array(
			'res' => $res,
			'detail'=>$detail_data, 
			'unit'=>$measures,
			'calc'=>$detail_calc
		);

		$response=json_encode($array);
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;
	}

	public function document(){
		$this->db->select('*');
		$this->db->from('job_order');
		$this->db->where('is_active', 1);
		$data['jo']=$this->db->get()->result();

		$this->load->view('marketing/document_form', $data);
	}
}
