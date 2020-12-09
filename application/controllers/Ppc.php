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
		// if($this->sesi_login->log_session() !=TRUE)redirect('Login');
	}
	
	public function index()
	{
		$this->load->view('ppic/home');
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


				$this->db->select('*');
				$this->db->from('master_part_material');
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
				$this->db->from('master_part_material');
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
		$this->db->from('master_part_material');
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
}
