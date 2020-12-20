<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Engineering extends CI_Controller {

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
		$this->load->view('engineering/home');
	}

	public function boq($param=null){
		if($param=="remove"){
			$data_input=$this->input->post();
			$update = array('is_active' => 0 );
			$this->db->where('id', $data_input['id']);
			$this->db->update('bill_quotation', $update);
			header("Location: ".base_url()."engineering/boq");
		}else if($param=="create"){
			$data_input=$this->input->post();

			if(empty($data_input['id'])){
				$this->db->select('*');
				$this->db->from('job_order');
				$this->db->where('is_active', 1);
				$this->db->order_by('id', 'desc');
				$data['joborder']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('doc_numbering');
				$this->db->where('is_active', 1);
				$this->db->where('document', 'BOQ');
				$data['boq_no']=$this->db->get()->row();

				$this->db->select('*');
				$this->db->from('master_part_material');
				$this->db->where('is_active',1);
				$data['material']=$this->db->get()->result();

				$this->db->select('count(*) as angka');
				$this->db->from('bill_quotation');
				$angka=$this->db->get()->row();

				if(strpos($data['boq_no']->pattern, "XXXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="000".$nomor;
					}else if($nomor<=99){
						$nomor="00".$nomor;
					}else if($nomor<=999){
						$nomor="0".$nomor;
					}
					$data['boq_no']->pattern=str_replace("XXXX", $nomor, $data['boq_no']->pattern);
				}
				if(strpos($data['boq_no']->pattern, "FF")){
					$data['boq_no']->pattern=str_replace("FF",date('m'), $data['boq_no']->pattern);
				}
				if(strpos($data['boq_no']->pattern, "YYYY")){
					$data['boq_no']->pattern=str_replace("YYYY",date('Y'), $data['boq_no']->pattern);
				}
				if(strpos($data['boq_no']->pattern, "YY")){
					$data['boq_no']->pattern=str_replace("YY",date('y'), $data['boq_no']->pattern);
				}
				if(strpos($data['boq_no']->pattern, "ff")){
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
					$data['boq_no']->pattern=str_replace("ff",$roman, $data['boq_no']->pattern);
				}
				// echo json_encode($data);
				// exit();
				$this->load->view('engineering/boq_form', $data);
			}else{

				$this->db->select('*');
				$this->db->from('bill_quotation');
				$this->db->where('is_active', 1);
				$this->db->where('id', $data_input['id']);
				$data['header']=$this->db->get()->row();

				$this->db->select('*');
				$this->db->from('bill_quotation_material');
				$this->db->where('is_active', 1);
				$this->db->where('bill_id', $data_input['id']);
				$data['material_detail']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('bill_quotation_assembly');
				$this->db->where('is_active', 1);
				$this->db->where('bill_id', $data_input['id']);
				$data['assembly_detail']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('job_order');
				$this->db->where('is_active', 1);
				$this->db->order_by('id', 'desc');
				$data['joborder']=$this->db->get()->result();

				$this->db->select('*');
				$this->db->from('doc_numbering');
				$this->db->where('is_active', 1);
				$this->db->where('document', 'BOQ');
				$data['boq_no']=$this->db->get()->row();

				$this->db->select('*');
				$this->db->from('master_part_material');
				$this->db->where('is_active',1);
				$data['material']=$this->db->get()->result();

				$this->db->select('count(*) as angka');
				$this->db->from('bill_quotation');
				$angka=$this->db->get()->row();

				if(strpos($data['boq_no']->pattern, "XXXX")>=0){
					$nomor=$angka->angka+1;
					if($nomor<=9){
						$nomor="000".$nomor;
					}else if($nomor<=99){
						$nomor="00".$nomor;
					}else if($nomor<=999){
						$nomor="0".$nomor;
					}
					$data['boq_no']->pattern=str_replace("XXXX", $nomor, $data['boq_no']->pattern);
				}
				if(strpos($data['boq_no']->pattern, "FF")){
					$data['boq_no']->pattern=str_replace("FF",date('m'), $data['boq_no']->pattern);
				}
				if(strpos($data['boq_no']->pattern, "YYYY")){
					$data['boq_no']->pattern=str_replace("YYYY",date('Y'), $data['boq_no']->pattern);
				}
				if(strpos($data['boq_no']->pattern, "YY")){
					$data['boq_no']->pattern=str_replace("YY",date('y'), $data['boq_no']->pattern);
				}
				if(strpos($data['boq_no']->pattern, "ff")){
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
					$data['boq_no']->pattern=str_replace("ff",$roman, $data['boq_no']->pattern);
				}
				// echo json_encode($data);
				// exit();
				$this->load->view('engineering/boq_form', $data);
			}
		}else{
			$this->db->select('a.id,d.name as customer_name,e.name as project_name,b.job_number,c.qn_number,a.date,a.status,g.name as marketing');
			$this->db->from('bill_quotation as a');
			$this->db->join('job_order as b', 'a.job_id = b.job_number', 'left');
			$this->db->join('quotation as c', 'b.quotation_id = c.id', 'left');
			$this->db->join('customer as d', 'c.customer_id = d.id', 'left');
			$this->db->join('project as e', 'c.project_id = e.id', 'left');
			$this->db->join('user_account as g', 'a.modified_by=g.email', 'left');
			$this->db->where('a.is_active', 1);
			$data['table']=$this->db->get()->result();

			$this->load->view('engineering/bill_of_quotation', $data);
		}
	}

	public function select_boq(){
		$data_input=$this->input->post();

		$this->db->select('c.name as customer_name,d.name as project_name,b.rev_no,date(b.rev_date) as rev_date');
		$this->db->from('job_order as a');
		$this->db->join('quotation as b', 'a.quotation_id = b.id', 'left');
		$this->db->join('customer as c', 'b.customer_id = c.id', 'left');
		$this->db->join('project as d', 'b.project_id = d.id', 'left');
		$this->db->where('a.job_number', $data_input['id']);
		$res=$this->db->get()->row();
		$response=json_encode($res);
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;
	}

	public function master($param=null){
		if($param=="delete"){
			$data_input=$this->input->post();
			$table = array('is_active' => 0);
			$this->db->where('id', $data_input['id']);
			$this->db->update('master_part_material', $table);
			header("Location: ".base_url()."engineering/master");
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

			if(!empty($data_input['id'])){
				$this->db->select('*');
				$this->db->from('master_part_material');
				$this->db->where('is_active', 1);
				$this->db->where('id', $data_input['id']);
				$data['master_part']=$this->db->get()->row();
			}

			$this->load->view('engineering/part_form',$data);
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
					'is_active'=>1 
				);

				$this->db->insert('master_part_material', $insert_table);
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
					'weight_factor'=>$data_input['weight_factor']??"",
					'material_density'=>$data_input['material_density']??"",
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
					'is_active'=>1 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('master_part_material', $insert_table);
			}
			
			header("Location: ".base_url()."engineering/master");
		}else{
			$this->db->select('*');
			$this->db->from('master_part_material');
			$this->db->where('is_active', 1);
			$data['table']=$this->db->get()->result();
			$this->load->view('engineering/part_list',$data);
		}
		
	}

	public function material_check(){
		$data_input=$this->input->post();

		$this->db->select('*');
		$this->db->from('master_part_material');
		$this->db->like('material_id', $data_input['id'], 'BOTH');
		$result=$this->db->get()->result();
		echo json_encode($result);
	}

	public function material_list(){
		$data_input=$this->input->post();
		$this->db->select('*');
		$this->db->from('master_part_material');
		$this->db->where('is_active', 1);
		$response=$this->db->get()->result();
		$response=json_encode($response);
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;
	}

	public function material_list_full(){
		$data_input=$this->input->post();
		$this->db->select('*');
		$this->db->from('master_part_material');
		$this->db->where('is_active', 1);
		$this->db->where('material_id', $data_input['id']);
		$res=$this->db->get()->row();
		$array = array(
			'res' => $res,
			'index'=>$data_input['index'] 
		);
		$response=json_encode($array);
		
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;
	}

	public function boq_add(){
		$data_input=$this->input->post();
		// echo var_dump($data_input);
		// exit();
		if(empty($data_input['id'])){
			$insert_table = array(
				'job_id' => $data_input['job_number'],
				'status'=>'On Going',
				'bill_no'=>$data_input['boq_no'],
				'date'=>$data_input['date'],
				'note'=>$data_input['note'],
				'created_by'=>$this->session->userdata('email'),
				'is_active'=>1 
			);
			$this->db->insert('bill_quotation', $insert_table);

			$this->db->select('id');
			$this->db->from('bill_quotation');
			$this->db->where('is_active', 1);
			$this->db->order_by('id', 'desc');
			$this->db->limit(1);
			$kode=$this->db->get()->row();

			for ($i=0; $i <count($data_input['assembly_mark']) ; $i++) { 
				$insert_assembly = array(
					'bill_id' => $kode->id,
					'assembly_mark'=>$data_input['assembly_mark'][$i],
					'desc'=>$data_input['assembly_desc'][$i],
					'qty'=>$data_input['assembly_qty'][$i],
					'total_area'=>$data_input['assembly_totalarea'][$i],
					'total_weight'=>$data_input['assembly_totalweight'][$i],
					'is_active'=>1 
				);
				$this->db->insert('bill_quotation_assembly', $insert_assembly);
			}

			for ($i=0; $i <count($data_input['material_id']) ; $i++) { 

				$insert_assembly = array(
					'bill_id' => $kode->id,
					'material'=>$data_input['material_id'][$i],
					'assembly_id'=>$data_input['material_assemblymark'][$i],
					'qty'=>$data_input['material_qty'][$i],
					'desc'=>$data_input['material_desc'][$i],
					'part_mark'=>$data_input['material_part'][$i],
					'length'=>$data_input['material_length'][$i],
					'width'=>$data_input['material_width'][$i],
					'thick'=>$data_input['material_thick'][$i],
					'pcs_area'=>$data_input['material_areaunit'][$i],
					'total_area'=>$data_input['material_areatotal'][$i],
					'pcs_weight'=>$data_input['material_weightunit'][$i],
					'total_weight'=>$data_input['material_total'][$i],
					'note'=>$data_input['note'][$i],
					'is_active'=>1 
				);
				$this->db->insert('bill_quotation_material', $insert_assembly);
			}
		}else{
			$insert_table = array(
				'job_id' => $data_input['job_number'],
				'status'=>'On Going',
				'bill_no'=>$data_input['boq_no'],
				'date'=>$data_input['date'],
				'note'=>$data_input['note'],
				'modified_by'=>$this->session->userdata('email'),
				'is_active'=>1 
			);
			$this->db->where('id', $data_input['id']);
			$this->db->update('bill_quotation', $insert_table);

			$update_status = array('is_active' => 0 );
			$this->db->where('bill_id', $data_input['id']);
			$this->db->update('bill_quotation_assembly', $update_status);

			for ($i=0; $i <count($data_input['assembly_mark']) ; $i++) {
				if($data_input['assembly_id'][$i]==""){
					$insert_assembly = array(
						'bill_id' => $data_input['id'],
						'assembly_mark'=>$data_input['assembly_mark'][$i],
						'desc'=>$data_input['assembly_desc'][$i],
						'qty'=>$data_input['assembly_qty'][$i],
						'total_area'=>$data_input['assembly_totalarea'][$i],
						'total_weight'=>$data_input['assembly_totalweight'][$i],
						'is_active'=>1 
					);
					$this->db->insert('bill_quotation_assembly', $insert_assembly);
				}else{
					$insert_assembly = array(
						'bill_id' => $data_input['id'],
						'assembly_mark'=>$data_input['assembly_mark'][$i],
						'desc'=>$data_input['assembly_desc'][$i],
						'qty'=>$data_input['assembly_qty'][$i],
						'total_area'=>$data_input['assembly_totalarea'][$i],
						'total_weight'=>$data_input['assembly_totalweight'][$i],
						'is_active'=>1 
					);
					$this->db->where('id', $data_input['assembly_id'][$i]);
					$this->db->update('bill_quotation_assembly', $insert_assembly);	
				} 
				
			}


			for ($i=0; $i <count($data_input['material_id']) ; $i++) { 
				if($data_input['material_idhidden'][$i]==""){
					$insert_assembly = array(
						'bill_id' => $data_input['id'],
						'material'=>$data_input['material_id'][$i],
						'assembly_id'=>$data_input['material_assemblymark'][$i],
						'qty'=>$data_input['material_qty'][$i],
						'desc'=>$data_input['material_desc'][$i],
						'part_mark'=>$data_input['material_part'][$i],
						'length'=>$data_input['material_length'][$i],
						'width'=>$data_input['material_width'][$i],
						'thick'=>$data_input['material_thick'][$i],
						'pcs_area'=>$data_input['material_areaunit'][$i],
						'total_area'=>$data_input['material_areatotal'][$i],
						'pcs_weight'=>$data_input['material_weightunit'][$i],
						'total_weight'=>$data_input['material_total'][$i],
						'note'=>$data_input['note'][$i],
						'is_active'=>1 
					);
					$this->db->insert('bill_quotation_material', $insert_assembly);
				}else{
					$insert_assembly = array(
						'bill_id' => $data_input['id'],
						'material'=>$data_input['material_id'][$i],
						'assembly_id'=>$data_input['material_assemblymark'][$i],
						'qty'=>$data_input['material_qty'][$i],
						'desc'=>$data_input['material_desc'][$i],
						'part_mark'=>$data_input['material_part'][$i],
						'length'=>$data_input['material_length'][$i],
						'width'=>$data_input['material_width'][$i],
						'thick'=>$data_input['material_thick'][$i],
						'pcs_area'=>$data_input['material_areaunit'][$i],
						'total_area'=>$data_input['material_areatotal'][$i],
						'pcs_weight'=>$data_input['material_weightunit'][$i],
						'total_weight'=>$data_input['material_total'][$i],
						'note'=>$data_input['note'][$i],
						'is_active'=>1 
					);
					$this->db->where('id', $data_input['material_idhidden'][$i]);
					$this->db->update('bill_quotation_material', $insert_assembly);	
				}
				
			}
		}
		
		header("Location: ".base_url()."engineering/boq");
		// echo var_dump($data_input);
	}
}
