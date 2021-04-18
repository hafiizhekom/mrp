<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ppc extends CI_Controller {


	public function __construct(){
		parent::__construct();
		$this->en_data = array(
            'SALT' =>"salted",
            'ITERATIONS' => '999',
            'IV' => 1111111111111111
        );
		if($this->session->userdata('logged_in')!=TRUE)redirect('login');
		$access_rights=false;
		foreach ($this->session->userdata('menu_access') as $key => $value){
			if($value->module=="PPC"){
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

	public function submenu_access($param,$url){
		$this->db->select('a.view,a.create,a.delete,a.approve,a.edit,b.sub_menu,c.module,c.menu,b.url,a.commercial_sheet');
		$this->db->from('tr_menu_access as a');
		$this->db->join('ms_submenu as b', 'a.sub_menu_id=b.id', 'left');
		$this->db->join('ms_menu as c', 'c.id=b.menu_id', 'left');
		$this->db->join('user_account as d', 'd.group_id = a.group_id', 'left');
		$this->db->where('c.module', $param);
		$this->db->where('d.id',$this->session->userdata('id') );
		$this->db->where('b.url', $url);
		$this->db->where('a.is_active', 1);
		$this->db->order_by('a.id', 'asc');
		$this->db->limit(1);
		return $this->db->get()->row();
	}


	public function index()
	{
		$data['sub_menu']=$this->submenu("PPC");
		$this->load->view('ppic/home',$data);
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

	public function dkm($param=null){
		if($param=="delete"){
			$data_input=$this->input->post();

			$arrayName = array('is_active' => 0);
			$this->db->where('id', $data_input['id']);
			$this->db->update('dkm', $arrayName);
			redirect('ppc/dkm','refresh');
		}else if($param=="create"){
			$data_input=$this->input->post();

			if(empty($data_input['id'])){
				$this->db->select('*');
				$this->db->from('bill_quotation');
				$this->db->where('is_active', 1);
				$this->db->order_by('id', 'desc');
				$data['boq']=$this->db->get()->result();	
				// echo $this->db->last_query();
				// exit();
				$this->db->select('*');
				$this->db->from('master_material');
				$this->db->where('is_active', 1);
				$data['material']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('doc_numbering');
				$this->db->where('is_active', 1);
				$this->db->where('document', 'DKM');
				$data['dkm_no']=$this->db->get()->row();



				$this->db->select('count(*) as angka');
				$this->db->from('dkm');
				$angka=$this->db->get()->row();
				// echo strpos($data['job_no']->pattern, "XXX");
				// exit();
				if(strpos($data['dkm_no']->pattern, "XXXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="000".$nomor;
					}else if($nomor<=99){
						$nomor="00".$nomor;
					}else if($nomor<=999){
						$nomor="0".$nomor;
					}
					$data['dkm_no']->pattern=str_replace("XXXX", $nomor, $data['dkm_no']->pattern);
				}
				if(strpos($data['dkm_no']->pattern, "XXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="00".$nomor;
					}else if($nomor<=99){
						$nomor="0".$nomor;
					}else if($nomor<=999){
						$nomor=$nomor;
					}
					$data['dkm_no']->pattern=str_replace("XXX", $nomor, $data['dkm_no']->pattern);
				}
				if(strpos($data['dkm_no']->pattern, "XX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="0".$nomor;
					}else if($nomor<=99){
						$nomor=$nomor;
					}
					$data['dkm_no']->pattern=str_replace("XX", $nomor, $data['dkm_no']->pattern);
				}
				if(strpos($data['dkm_no']->pattern, "X")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor=$nomor;
					}
					$data['dkm_no']->pattern=str_replace("X", $nomor, $data['dkm_no']->pattern);
				}
				
				if(strpos($data['dkm_no']->pattern, "FF")){
					$data['dkm_no']->pattern=str_replace("FF",date('m'), $data['dkm_no']->pattern);
				}
				if(strpos($data['dkm_no']->pattern, "YYYY")){
					$data['dkm_no']->pattern=str_replace("YYYY",date('Y'), $data['dkm_no']->pattern);
				}
				if(strpos($data['dkm_no']->pattern, "YY")){
					$data['dkm_no']->pattern=str_replace("YY",date('y'), $data['dkm_no']->pattern);
				}
				if(strpos($data['dkm_no']->pattern, "ff")){
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
					$data['dkm_no']->pattern=str_replace("ff",$roman, $data['dkm_no']->pattern);
				}


				$this->load->view('ppic/dkm_form', $data);
			}else{

				$this->db->select('*');
				$this->db->from('dkm');
				$this->db->where('is_active', 1);
				$this->db->where('id', $data_input['id']);
				$this->db->limit(1);
				$data['header']=$this->db->get()->row();	
				// echo var_dump($data['header']);
				// exit();
				$this->db->select('*');
				$this->db->from('dkm_detail');
				$this->db->where('is_active', 1);
				$this->db->where('id_dkm', $data_input['id']);
				$data['detail']=$this->db->get()->result();	

				$this->db->select('*');
				$this->db->from('bill_quotation');
				$this->db->where('is_active', 1);
				$this->db->order_by('id', 'desc');
				$data['boq']=$this->db->get()->result();	


				$this->db->select('*');
				$this->db->from('master_material');
				$this->db->where('is_active', 1);
				$data['material']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('doc_numbering');
				$this->db->where('is_active', 1);
				$this->db->where('document', 'DKM');
				$data['dkm_no']=$this->db->get()->row();



				$this->db->select('count(*) as angka');
				$this->db->from('dkm');
				$angka=$this->db->get()->row();
				// echo strpos($data['job_no']->pattern, "XXX");
				// exit();
				if(strpos($data['dkm_no']->pattern, "XXXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="000".$nomor;
					}else if($nomor<=99){
						$nomor="00".$nomor;
					}else if($nomor<=999){
						$nomor="0".$nomor;
					}
					$data['dkm_no']->pattern=str_replace("XXXX", $nomor, $data['dkm_no']->pattern);
				}
				if(strpos($data['dkm_no']->pattern, "XXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="00".$nomor;
					}else if($nomor<=99){
						$nomor="0".$nomor;
					}else if($nomor<=999){
						$nomor=$nomor;
					}
					$data['dkm_no']->pattern=str_replace("XXX", $nomor, $data['dkm_no']->pattern);
				}
				if(strpos($data['dkm_no']->pattern, "XX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="0".$nomor;
					}else if($nomor<=99){
						$nomor=$nomor;
					}
					$data['dkm_no']->pattern=str_replace("XX", $nomor, $data['dkm_no']->pattern);
				}
				if(strpos($data['dkm_no']->pattern, "X")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor=$nomor;
					}
					$data['dkm_no']->pattern=str_replace("X", $nomor, $data['dkm_no']->pattern);
				}
				
				if(strpos($data['dkm_no']->pattern, "FF")){
					$data['dkm_no']->pattern=str_replace("FF",date('m'), $data['dkm_no']->pattern);
				}
				if(strpos($data['dkm_no']->pattern, "YYYY")){
					$data['dkm_no']->pattern=str_replace("YYYY",date('Y'), $data['dkm_no']->pattern);
				}
				if(strpos($data['dkm_no']->pattern, "YY")){
					$data['dkm_no']->pattern=str_replace("YY",date('y'), $data['dkm_no']->pattern);
				}
				if(strpos($data['dkm_no']->pattern, "ff")){
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
					$data['dkm_no']->pattern=str_replace("ff",$roman, $data['dkm_no']->pattern);
				}


				$this->load->view('ppic/dkm_form', $data);
			}

			
		}else{
			

			$this->db->select('d.name as customer_name,e.name as project_name,c.qn_number,b.job_number,c.rev_no,c.rev_date,a.note,dkm.id,dkm.date,dkm.dkm_number');
			$this->db->from('dkm as dkm');
			$this->db->join('bill_quotation as a', 'dkm.bill_quotation_id = a.bill_no', 'left');
			$this->db->join('job_order as b', 'a.job_id = b.job_number', 'left');
			$this->db->join('quotation as c', 'c.id = b.quotation_id', 'left');
			$this->db->join('customer as d', 'd.id = c.customer_id', 'left');
			$this->db->join('project as e', 'e.id = c.project_id', 'left');
			$this->db->where('dkm.is_active', 1);
			$data['table']=$this->db->get()->result();

			$this->load->view('ppic/dkm', $data);
		}
		
	}

	public function dkm_select(){
		$data_input=$this->input->post();

		$this->db->select('d.name as customer_name,e.name as project_name,c.qn_number,b.job_number,c.rev_no,c.rev_date,a.note');
		$this->db->from('bill_quotation as a');
		$this->db->join('job_order as b', 'a.job_id = b.job_number', 'left');
		$this->db->join('quotation as c', 'c.id = b.quotation_id', 'left');
		$this->db->join('customer as d', 'd.id = c.customer_id', 'left');
		$this->db->join('project as e', 'e.id = c.project_id', 'left');
		$this->db->where('a.is_active', 1);
		$this->db->where('a.bill_no', $data_input['id']);
		$data=$this->db->get()->row();
		// echo $this->db->last_query();
		$response=json_encode($data);
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;

	}
	public function dkm_select2(){
		$this->db->select('*');
		$this->db->from('master_material');
		$this->db->where('is_active', 1);
		$data['material']=$this->db->get()->result();
		$response=json_encode($data['material']);
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;
	}

	public function dkm_add(){
		$data_input=$this->input->post();

		// echo var_dump($data_input);
		if(empty($data_input['id'])){
			$insert_table = array(
				'bill_quotation_id' => $data_input['boq_number'],
				'dkm_number'=>$data_input['dkm_number'],
				'date'=>$data_input['date'],
				'note'=>$data_input['note'],
				'is_active'=>1 
			);
			$this->db->insert('dkm', $insert_table);

			$this->db->select('id');
			$this->db->from('dkm');
			$this->db->where('is_active', 1);
			$this->db->order_by('id', 'desc');
			$this->db->limit(1);
			$kode=$this->db->get()->row();

			for ($i=0; $i <count($data_input['detail_desc']) ; $i++) { 
				$insert_detail = array(
					'id_dkm' => $kode->id,
					'material'=>$data_input['detail_material'][$i],
					'desc'=>$data_input['detail_desc'][$i],
					'pcs'=>$data_input['detail_pcs'][$i],
					'unit'=>$data_input['detail_unit'][$i],
					'weight'=>$data_input['detail_weight'][$i],
					'planning'=>$data_input['detail_planing'][$i],
					'input'=>$data_input['detail_input'][$i],
					'output'=>$data_input['detail_output'][$i],
					'is_active'=>1 
				);
				$this->db->insert('dkm_detail', $insert_detail);
			}
		}else{
			$insert_table = array(
				'bill_quotation_id' => $data_input['boq_number'],
				'dkm_number'=>$data_input['dkm_number'],
				'date'=>$data_input['date'],
				'note'=>$data_input['note'],
				'is_active'=>1 
			);
			$this->db->where('id', $data_input['id']);
			$this->db->update('dkm', $insert_table);
			$kode = NULL;
			$kode->id=$data_input['id'];

			$arrayName = array('is_active' => 0);
			$this->db->where('id_dkm', $data_input['id']);
			$this->db->update('dkm_detail', $arrayName);

			for ($i=0; $i <count($data_input['detail_desc']) ; $i++) { 
				$insert_detail = array(
					'id_dkm' => $kode->id,
					'material'=>$data_input['detail_material'][$i],
					'desc'=>$data_input['detail_desc'][$i],
					'pcs'=>$data_input['detail_pcs'][$i],
					'unit'=>$data_input['detail_unit'][$i],
					'weight'=>$data_input['detail_weight'][$i],
					'planning'=>$data_input['detail_planing'][$i],
					'input'=>$data_input['detail_input'][$i],
					'output'=>$data_input['detail_output'][$i],
					'is_active'=>1 
				);
				$this->db->insert('dkm_detail', $insert_detail);
			}
		}
		
		// exit();
		redirect('ppc/dkm','refresh');
	}

	public function packing(){
		// $data=null;
		$this->db->select('*');
		$this->db->from('packing_list');
		$table=$this->db->get()->result();

		$data = array(
			'table' => $table,
		 );

		$this->load->view('ppic/packing', $data);
	}

	public function schedule($param=null){
		$data['sub_menu']=$this->submenu("PPC");
		$data['sub_menu_access']=$this->submenu_access('PPC','ppc/schedule');
		if($param=="monitoring"){
			$this->load->view('ppic/monitoring', $data);
		}else if($param=="create"){
			$data_input=$this->input->post();
			if(!empty($data_input['id'])){
				$this->db->select('s.id,s.job_id,s.period_start,s.period_end,s.date,s.current_phase,s.rev_date,s.rev_ms,s.revision,c.name as customer_name,d.name as project_name');
				$this->db->from('schedule as s');
				$this->db->join('job_order as a', 's.job_id=a.job_number', 'left');
				$this->db->join('quotation as b', 'a.quotation_id = b.qn_number', 'left');
				$this->db->join('customer as c', 'b.customer_id=c.id', 'left');
				$this->db->join('project as d', 'b.project_id = d.id', 'left');
				$this->db->where('a.is_active', 1);
				$this->db->where('s.id', $data_input['id']);
				$data['header']=$this->db->get()->row();

				$this->db->select('*');
				$this->db->from('schedule_detail');
				$this->db->where('schedule_id', $data_input['id']);
				$this->db->where('is_active', 1);
				$data['detail']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('job_order');
				$this->db->where('is_active', 1);
				$data['job']=$this->db->get()->result();

			}else{
				$this->db->select('*');
				$this->db->from('job_order');
				$this->db->where('is_active', 1);
				$data['job']=$this->db->get()->result();
			}
			

			$this->load->view('ppic/schedule_form', $data);
		}else if($param=="add"){
			$data_input=$this->input->post();
			// var_dump($data_input);
			if(!empty($data_input['id'])){
				$insertheader = array(
					'job_id' =>$data_input['job_no']??"",
					'date'=>$data_input['date']??"",
					'period_start'=>$data_input['start_date']??"",
					'period_end'=>$data_input['end_date']??"",
					'rev_ms'=>$data_input['revision_ms']??"",
					'current_phase'=>$data_input['current_phase'],
					'created_by'=>$this->session->userdata('id'),
					'is_active'=>1 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('schedule', $insertheader);

				$arraydelete = array('is_active' => 0, );
				$this->db->where('schedule_id', $data_input['id']);
				$this->db->update('schedule_detail', $arraydelete);

				if(count($data_input['detail_process'])>0){
					for ($i=0; $i < count($data_input['detail_process']) ; $i++) { 
						$detail = array(
							'schedule_id' => $data_input['id']??"",
							'process'=>$data_input['detail_process'][$i]??"",
							'sub_process'=>$data_input['detail_subprocess'][$i]??"",
							'department'=>$data_input['detail_department'][$i]??"",
							'weight'=>$data_input['detail_weight'][$i]??"",
							'days'=>$data_input['detail_day'][$i]??"",
							'weeks'=>$data_input['detail_week'][$i]??"",
							'start_date'=>$data_input['detail_startdate'][$i]??"",
							'end_date'=>$data_input['detail_enddate'][$i]??"",
							'remarks'=>$data_input['detail_remark'][$i]??"",
							'is_active'=>1 
						);
						$this->db->insert('schedule_detail', $detail);
					}
				}
				header("Location:".base_url()."ppc/schedule?res=success");	
			}else{
				$insertheader = array(
					'job_id' =>$data_input['job_no']??"",
					'date'=>$data_input['date']??"",
					'period_start'=>$data_input['start_date']??"",
					'period_end'=>$data_input['end_date']??"",
					'rev_ms'=>$data_input['revision_ms']??"",
					'current_phase'=>$data_input['current_phase'],
					'created_by'=>$this->session->userdata('id'),
					'is_active'=>1 
				);
				$this->db->insert('schedule', $insertheader);

				$this->db->select('*');
				$this->db->from('schedule');
				$this->db->where('is_active', 1);
				$this->db->limit(1);
				$header=$this->db->get()->row();

				if(count($data_input['detail_process'])>0){
					for ($i=0; $i < count($data_input['detail_process']) ; $i++) { 
						$detail = array(
							'schedule_id' => $header->id,
							'process'=>$data_input['detail_process'][$i]??"",
							'sub_process'=>$data_input['detail_subprocess'][$i]??"",
							'department'=>$data_input['detail_department'][$i]??"",
							'weight'=>$data_input['detail_weight'][$i]??"",
							'days'=>$data_input['detail_day'][$i]??"",
							'weeks'=>$data_input['detail_week'][$i]??"",
							'start_date'=>$data_input['detail_startdate'][$i]??"",
							'end_date'=>$data_input['detail_enddate'][$i]??"",
							'remarks'=>$data_input['detail_remark'][$i]??"",
							'is_active'=>1 
						);
						$this->db->insert('schedule_detail', $detail);
					}
				}	
			}
			

			header("Location:".base_url()."ppc/schedule?res=success");

		}else{

			$this->db->select('a.id,b.job_number,cust.name as customer,proj.name as project,a.period_start,a.period_end,user.name as creator');
			$this->db->from('schedule as a');
			$this->db->join('job_order as b', 'a.job_id=b.job_number', 'left');
			$this->db->join('quotation as c', 'b.quotation_id=c.id', 'left');
			$this->db->join('customer as cust', 'cust.id=c.customer_id', 'left');
			$this->db->join('project as proj', 'proj.id=c.project_id', 'left');
			$this->db->join('user_account as user', 'user.id=a.created_by', 'left');
			$this->db->where('a.is_active', 1);
			$data['table']=$this->db->get()->result();

			$this->load->view('ppic/schedule', $data);
		}
	}

	public function schedule_select(){
		$data_input=$this->input->post();

		$this->db->select('c.name as customer_name,d.name as project_name');
		$this->db->from('job_order as a');
		$this->db->join('quotation as b', 'a.quotation_id = b.qn_number', 'left');
		$this->db->join('customer as c', 'b.customer_id=c.id', 'left');
		$this->db->join('project as d', 'b.project_id = d.id', 'left');
		$this->db->where('a.is_active', 1);
		$this->db->where('a.job_number', $data_input['job_no']);
		$header=$this->db->get()->row();

		$response = array(
			'header'=>$header,
			'status'=>'success' 
		);
		$response=json_encode($response);
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;

	}

	public function mpk($param=null){
		if($param=="create"){

			$this->db->select('a.*');
			$this->db->from('schedule as b');
			$this->db->join('job_order as a', 'a.job_number=b.job_id', 'left');
			$this->db->where('a.is_active', 1);
			$data['jono']=$this->db->get()->result();

			$this->db->select('*');
			$this->db->from('doc_numbering');
			$this->db->where('is_active', 1);
			$this->db->where('document', 'MPK');
			$data['mpk_no']=$this->db->get()->row();



			$this->db->select('count(*) as angka');
			$this->db->from('mpk');
			$angka=$this->db->get()->row();
			// echo strpos($data['job_no']->pattern, "XXX");
			// exit();
			if(strpos($data['mpk_no']->pattern, "XXXX")>=0){
				$nomor=$angka->angka+1;
				if($nomor<=9){
					$nomor="000".$nomor;
				}else if($nomor<=99){
					$nomor="00".$nomor;
				}else if($nomor<=999){
					$nomor="0".$nomor;
				}
				$data['mpk_no']->pattern=str_replace("XXXX", $nomor, $data['mpk_no']->pattern);
			}
			if(strpos($data['mpk_no']->pattern, "XXX")>=0){
				$nomor=$angka->angka+1;
				if($nomor<=9){
					$nomor="00".$nomor;
				}else if($nomor<=99){
					$nomor="0".$nomor;
				}else if($nomor<=999){
					$nomor=$nomor;
				}
				$data['mpk_no']->pattern=str_replace("XXX", $nomor, $data['mpk_no']->pattern);
			}
			if(strpos($data['mpk_no']->pattern, "XX")>=0){
				$nomor=$angka->angka+1;
				if($nomor<=9){
					$nomor="0".$nomor;
				}else if($nomor<=99){
					$nomor=$nomor;
				}
				$data['mpk_no']->pattern=str_replace("XX", $nomor, $data['mpk_no']->pattern);
			}
			if(strpos($data['mpk_no']->pattern, "X")>=0){
				$nomor=$angka->angka+1;
				if($nomor<=9){
					$nomor=$nomor;
				}
				$data['mpk_no']->pattern=str_replace("X", $nomor, $data['mpk_no']->pattern);
			}
			
			if(strpos($data['mpk_no']->pattern, "FF")){
				$data['mpk_no']->pattern=str_replace("FF",date('m'), $data['mpk_no']->pattern);
			}
			if(strpos($data['mpk_no']->pattern, "YYYY")){
				$data['mpk_no']->pattern=str_replace("YYYY",date('Y'), $data['mpk_no']->pattern);
			}
			if(strpos($data['mpk_no']->pattern, "YY")){
				$data['mpk_no']->pattern=str_replace("YY",date('y'), $data['mpk_no']->pattern);
			}
			if(strpos($data['mpk_no']->pattern, "ff")){
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
				$data['mpk_no']->pattern=str_replace("ff",$roman, $data['mpk_no']->pattern);
			}


			$this->load->view('ppic/mpk_form',$data);
		}else if($param=="add"){
			$data_input=$this->input->post();
			var_dump($data_input);
			exit();
			redirect('ppc/mpk','refresh');
		}else{
			$this->load->view('ppic/mpk');
		}
	}

	public function mpk_select(){
		$data_input=$this->input->post();

		$this->db->select('b.assembly_mark,b.desc,b.qty,b.total_area as area,b.total_weight as weight');
		$this->db->from('bill_quotation as a');
		$this->db->join('bill_quotation_assembly as b', 'a.id = bill_id', 'left');
		$this->db->where('b.is_active', 1);
		$this->db->where('a.job_id', $data_input['job_no']);
		$assembly_list=$this->db->get()->result();

		$this->db->select('d.name as customer_name,e.name as project_name,a.job_id as job_order,c.qn_number as quotation,sc.id');
		$this->db->from('bill_quotation as a');
		$this->db->join('job_order as b', 'a.job_id = b.job_number', 'left');
		$this->db->join('quotation as c', 'b.quotation_id=c.qn_number', 'left');
		$this->db->join('customer as d', 'c.customer_id = d.id', 'left');
		$this->db->join('project as e', 'c.project_id = e.id', 'left');
		$this->db->join('schedule as sc', 'sc.job_id=a.job_id', 'left');
		$this->db->where('a.job_id', $data_input['job_no']);
		$header=$this->db->get()->row();

		$this->db->select('*');
		$this->db->from('schedule_detail');
		$this->db->where('schedule_id', $header->id);
		$this->db->where('is_active', 1);
		$detail=$this->db->get()->result();

		$this->db->select('process,count(sub_process) as colspan');
		$this->db->from('schedule_detail');
		$this->db->where('schedule_id', $header->id);
		$this->db->where('is_active', 1);
		$this->db->group_by('process');
		$detail_header=$this->db->get()->result();

		$mpk_no=$data_input['mpk'];
		$jo_no=explode("-", $header->job_order);
		$jo_no=$jo_no[1]."-".$jo_no[2];
		$mpk_no=str_replace("JO_NO", $jo_no, $mpk_no);


		$response = array(
			'assembly_list' => $assembly_list,
			'header'=>$header,
			'mpk_no'=>$mpk_no,
			'detail'=>$detail,
			'detail_header'=>$detail_header,
			'status'=>'success' 
		);
		$response=json_encode($response);
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;
	}


	
}
