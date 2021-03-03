<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require('./assets/vendors/vendor/autoload.php');

use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Reader\IReader;
class admin extends CI_Controller {
	var $en_data;

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
			if($value->module=="Administrator"){
				$access_rights=true;
			}
		}
		if($access_rights==false){
			redirect($this->session->userdata('base_link'));
		}
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
		$data['sub_menu']=$this->submenu('Administrator');
		$this->load->view('admin/home',$data);
	}

	public function user(){
		$data['sub_menu']=$this->submenu('Administrator');
		$this->db->select('a.id,c.name as default_module,a.username,a.employee_id,a.name,a.position,a.email,a.contact,a.is_active,a.sales_person,b.name as group,a.company');
		$this->db->from('user_account as a');
		$this->db->join('user_group as b', 'a.group_id=b.id', 'left');
		$this->db->join('user_group as c', 'a.default_module = c.code', 'left');
		$this->db->where('a.is_active', 1);
		$data['table_data']=$this->db->get()->result();

		$this->db->select('id,name');
		$this->db->from('user_group');
		$data['group']=$this->db->get()->result();


		$this->load->view('admin/user',$data);
	}

	public function permission(){
		$data_input=$this->input->post();
		// echo var_dump($data_input);

		$data['id']=$data_input['id'];
		
		$this->db->select('*');
		$this->db->from('tr_menu_access');
		$this->db->where('is_active', 1);
		$this->db->where('group_id', $data_input['id']);
		$data['access']=$this->db->get()->result();

		$this->db->select('a.module,a.menu,b.sub_menu,b.id,b.url,b.create,b.edit,b.delete,b.view,b.approve');
		$this->db->from('ms_menu as a');
		$this->db->where('a.is_active', 1);
		$this->db->join('ms_submenu as b', 'a.id=b.menu_id', 'left');
		$this->db->where('b.is_active', 1);
		$data['table']=$this->db->get()->result();

		$this->db->select('distinct(module)');
		$this->db->from('ms_menu');
		$this->db->where('is_active', 1);
		$data['select1']=$this->db->get()->result();
		
		$this->db->select('*');
		$this->db->from('ms_menu');
		$this->db->where('is_active', 1);
		$data['select2']=$this->db->get()->result();

		$data['sub_menu']=$this->submenu('Administrator');

		// echo json_encode($data["access"]);
		$this->load->view('admin/permission', $data);
	}

	public function permission_change(){
		$data_input=$this->input->post();
		// echo var_dump($data_input);

		$arrayName = array(
			'is_active' => 0,
			'create'=>0,
			'edit'=>0,
			'view'=>0,
			'delete'=>0,
			'approve'=>0
		 );
		$this->db->where('group_id', $data_input['id']);
		$this->db->update('tr_menu_access', $arrayName);
		if(!empty($data_input['view'])){
			for ($i=0; $i <count($data_input['view']) ; $i++) { 
				$this->db->select('id');
				$this->db->from('tr_menu_access');
				$this->db->where('group_id', $data_input['id']);
				$this->db->where('sub_menu_id', $data_input['view'][$i]);
				$kunci=$this->db->get()->row();
				if(empty($kunci->id)){
					$insertdata = array(
						'group_id' => $data_input['id'],
						'sub_menu_id'=>$data_input['view'][$i],
						'view'=>1,
						'is_active'=>1 
					);
					$this->db->insert('tr_menu_access', $insertdata);
				}else{
					$insertdata = array(
						'view'=>1,
						'is_active'=>1 
					);
					$this->db->where('group_id', $data_input['id']);
					$this->db->where('sub_menu_id', $data_input['view'][$i]);
					$this->db->update('tr_menu_access', $insertdata);
				}
				
			}
		}

		if(!empty($data_input['delete'])){
			for ($i=0; $i <count($data_input['delete']) ; $i++) { 
				$this->db->select('id');
				$this->db->from('tr_menu_access');
				$this->db->where('group_id', $data_input['id']);
				$this->db->where('sub_menu_id', $data_input['delete'][$i]);
				$kunci=$this->db->get()->row();
				if(empty($kunci->id)){
					$insertdata = array(
						'group_id' => $data_input['id'],
						'sub_menu_id'=>$data_input['delete'][$i],
						'delete'=>1,
						'is_active'=>1 
					);
					$this->db->insert('tr_menu_access', $insertdata);
				}else{
					$insertdata = array(
						'delete'=>1,
						'is_active'=>1 
					);
					$this->db->where('group_id', $data_input['id']);
					$this->db->where('sub_menu_id', $data_input['delete'][$i]);
					$this->db->update('tr_menu_access', $insertdata);
				}
				
			}
		}	

		if(!empty($data_input['edit'])){
			for ($i=0; $i <count($data_input['edit']) ; $i++) { 
				$this->db->select('id');
				$this->db->from('tr_menu_access');
				$this->db->where('group_id', $data_input['id']);
				$this->db->where('sub_menu_id', $data_input['edit'][$i]);
				$kunci=$this->db->get()->row();
				if(empty($kunci->id)){
					$insertdata = array(
						'group_id' => $data_input['id'],
						'sub_menu_id'=>$data_input['edit'][$i],
						'edit'=>1,
						'is_active'=>1 
					);
					$this->db->insert('tr_menu_access', $insertdata);
				}else{
					$insertdata = array(
						'edit'=>1,
						'is_active'=>1 
					);
					$this->db->where('group_id', $data_input['id']);
					$this->db->where('sub_menu_id', $data_input['edit'][$i]);
					$this->db->update('tr_menu_access', $insertdata);
				}
				
			}
		}

		if(!empty($data_input['create'])){
			for ($i=0; $i <count($data_input['create']) ; $i++) { 
				$this->db->select('id');
				$this->db->from('tr_menu_access');
				$this->db->where('group_id', $data_input['id']);
				$this->db->where('sub_menu_id', $data_input['create'][$i]);
				$kunci=$this->db->get()->row();
				if(empty($kunci->id)){
					$insertdata = array(
						'group_id' => $data_input['id'],
						'sub_menu_id'=>$data_input['create'][$i],
						'create'=>1,
						'is_active'=>1 
					);
					$this->db->insert('tr_menu_access', $insertdata);
				}else{
					$insertdata = array(
						'create'=>1,
						'is_active'=>1 
					);
					$this->db->where('group_id', $data_input['id']);
					$this->db->where('sub_menu_id', $data_input['create'][$i]);
					$this->db->update('tr_menu_access', $insertdata);
				}
				
			}
		}
		if(!empty($data_input['approve'])){
			for ($i=0; $i <count($data_input['approve']) ; $i++) { 
				$this->db->select('id');
				$this->db->from('tr_menu_access');
				$this->db->where('group_id', $data_input['id']);
				$this->db->where('sub_menu_id', $data_input['approve'][$i]);
				$kunci=$this->db->get()->row();
				if(empty($kunci->id)){
					$insertdata = array(
						'group_id' => $data_input['id'],
						'sub_menu_id'=>$data_input['approve'][$i],
						'approve'=>1,
						'is_active'=>1 
					);
					$this->db->insert('tr_menu_access', $insertdata);
				}else{
					$insertdata = array(
						'approve'=>1,
						'is_active'=>1 
					);
					$this->db->where('group_id', $data_input['id']);
					$this->db->where('sub_menu_id', $data_input['approve'][$i]);
					$this->db->update('tr_menu_access', $insertdata);
				}
				
			}
		}

		header("Location: ".base_url()."admin/role?res=success");
	}

	public function user_add(){
		$data_input=$this->input->post();
		if(empty($data_input['id'])){
			$insert_array = array(
				'employee_id' => $data_input['employee_id'],
				'name'=>$data_input['name'],
				'username'=>$data_input['username'],
				'position'=>$data_input['position'],
				'email'=>$data_input['email'],
				'password'=>md5($data_input['password']),
				'group_id'=>$data_input['group_id'],
				'contact'=>$data_input['contact'],
				'company'=>$data_input['company'],
				'default_module'=>$data_input['default'],
				'sales_person'=>$data_input['sales']??"",
				'is_active'=>1
			);
			$this->db->insert('user_account', $insert_array);
		}else{
			$insert_array = array(
				'employee_id' => $data_input['employee_id'],
				'name'=>$data_input['name'],
				'username'=>$data_input['username'],
				'position'=>$data_input['position'],
				'email'=>$data_input['email'],
				'password'=>md5($data_input['password']),
				'group_id'=>$data_input['group_id'],
				'contact'=>$data_input['contact'],
				'company'=>$data_input['company'],
				'default_module'=>$data_input['default'],
				'sales_person'=>$data_input['sales']??"",
				'is_active'=>1
			);
			$this->db->where('id', $data_input['id']);
			$this->db->update('user_account', $insert_array);
		}
		
		header("Location: ".base_url()."admin/user");
	}

	public function user_remove(){
		$data_input=$this->input->post();
		$update = array('is_active' => 0, );
		$this->db->where('id', $data_input['id']);
		$this->db->update('user_account', $update);
		header("Location: ".base_url()."admin/user");
	}

	public function user_detail(){
		$data_input=$this->input->post();
		$this->db->select('id,employee_id,name,username,position,email,group_id,contact,company,default_module,sales_person,password');
		$this->db->from('user_account');
		$this->db->where('id', $data_input['id']);
		$res=$this->db->get()->row();
		$string=json_encode($res);
		$plainText = $string;
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $plainText);
		echo $phpEncryptedText;
	}

	public function role(){
		$data=null;
		$this->db->select('*');
		$this->db->from('ms_document_type');
		$data['document']=$this->db->get()->result();

			
		$this->db->select('*');
		$this->db->from('user_group');
		$this->db->where('is_active', 1);
		$data['group_header']=$this->db->get()->result();

		$this->db->select('*');
		$this->db->from('user_group_detail');
		$this->db->where('is_active', 1);
		$data['group_detail']=$this->db->get()->result();

		$data['sub_menu']=$this->submenu('Administrator');

		$this->load->view('admin/role',$data);
	}

	public function role_select(){
		$data_input=$this->input->post();
		$this->db->select('*');
		$this->db->from('user_group');
		$this->db->where('is_active', 1);
		$this->db->where('id', $data_input['id']);
		$data['group_header']=$this->db->get()->row();

		$this->db->select('*');
		$this->db->from('user_group_detail');
		$this->db->where('is_active', 1);
		$this->db->where('user_group_id', $data_input['id']);
		$data['group_detail']=$this->db->get()->result();

		$response = array(
							'group_header' => $data['group_header'],
							'group_detail' => $data['group_detail'],
							);

		$response=json_encode($response);
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;
	}

	public function role_delete(){
		$data_input=$this->input->post();
		$update = array(
			'is_active' => 0, 
		);
		$this->db->where('id', $data_input['id_delete']);
		$this->db->update('user_group', $update);
		header("Location: ".base_url()."admin/role");
	}

	public function role_add(){
		$data_input=$this->input->post();
		// echo var_dump($data_input);
		if(empty($data_input['id'])){
			$array_insert = array(
				'code' => $data_input['code'],
				'name' => $data_input['name'],
				'is_active'=>1
			);
			$this->db->insert('user_group', $array_insert);
			$this->db->select('id');
			$this->db->from('user_group');
			$this->db->where('code', $data_input['code']);
			$this->db->order_by('created_date', 'desc');
			$result_data=$this->db->get()->row();
			
			foreach ($data_input['file_type'] as $key) {
				$array_insert2 = array(
					'user_group_id' => $result_data->id,
					'document_access' => $key ,
					'is_active'=>1
				);
				$this->db->insert('user_group_detail', $array_insert2);
			}
			
		}else{
			$array_insert = array(
				'code' => $data_input['code'],
				'name' => $data_input['name'],
				'is_active'=>1
			);
			$this->db->where('id', $data_input['id']);
			$this->db->update('user_group', $array_insert);

			foreach ($data_input['file_type'] as $key) {
				$this->db->select('*');
				$this->db->from('user_group_detail');
				$this->db->where('user_group_id', $data_input['id']);
				$this->db->where('document_access', $key);
				$result_data=$this->db->get()->row();
				if(empty($result_data)){
					$array_insert2 = array(
						'user_group_id' => $data_input['id'],
						'document_access' => $key ,
						'is_active'=>1
					);
					$this->db->insert('user_group_detail', $array_insert2);
				}else{
					$array_insert2 = array(
						'user_group_id' => $data_input['id'],
						'document_access' => $key ,
						'is_active'=>1
					);
					$this->db->where('id', $result_data->id);
					$this->db->update('user_group_detail', $array_insert2);
				}
				
			}
		}
		header("Location: ".base_url()."admin/role");

	}

	public function document(){
		$this->db->select('*');
		$this->db->from('ms_document_type');
		$this->db->where('is_active', 1);
		$data['document_table']=$this->db->get()->result();
		$data['sub_menu']=$this->submenu('Administrator');
		$this->load->view('admin/document_type', $data);
	}

	public function document_select(){
		$data_input=$this->input->post();
		$this->db->select('*');
		$this->db->from('ms_document_type');
		$this->db->where('is_active', 1);
		$this->db->where('id', $data_input['id']);
		$data=$this->db->get()->row();
		$response=json_encode($data);
		$phpEncryptedText = $this->userPHPEncrypt($this->session->userdata('token'), $response);
		echo $phpEncryptedText;
	}

	public function document_add(){
		$data_input=$this->input->post();
		if(empty($data_input['id'])){
			$insert_array = array(
				'file_type' => $data_input['file'],
				'is_active'=> 1,

			);
			$this->db->insert('ms_document_type', $insert_array);
		}else{
			$insert_array = array(
				'file_type' => $data_input['file'],
				'is_active'=> 1,

			);
			$this->db->where('id', $data_input['id']);
			$this->db->update('ms_document_type', $insert_array);
		}
		
		header("Location: ".base_url()."admin/document");
	}
	public function document_remove(){
		$data_input=$this->input->post();
		$insert_array = array(
			'is_active'=> 0,
		);
		$this->db->where('id', $data_input['id']);
		$this->db->update('ms_document_type', $insert_array);
		header("Location: ".base_url()."admin/document");
	}

	private function check_session(){
		echo var_dump($this->session);
	}

	public function general(){

		$this->db->select('*');
		$this->db->from('general_setting');
		$this->db->where('id', 1);
		$data['header']=$this->db->get()->row();

		$this->db->select('*');
		$this->db->from('general_setting_detail');
		$this->db->where('general_id', 1);
		$this->db->where('is_active', 1);
		$this->db->order_by('order', 'asc');
		$data['detail']=$this->db->get()->result();
		$data['sub_menu']=$this->submenu('Administrator');
		$this->load->view('admin/general',$data);
	}

	public function general_edit(){
		$data_input=$this->input->post();
		// echo var_dump($data_input);
		// echo var_dump($_FILES);
		// exit();
		
		// $uploadOk = 1;
		// $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
		if(empty($_FILES["logo"]['name'])){
			$updatearray = array(
				'name' =>$data_input['name'] ,
				'address'=>$data_input['address'],
				'city'=>$data_input['city'],
				'phone'=>$data_input['phone'],
				'fax'=>$data_input['fax'],
				'npwp'=>$data_input['npwp'],
				'skep'=>$data_input['skep'],
			);
		}else{
			$target_dir = "images/";
			$target_file = $target_dir . basename($_FILES["logo"]["name"]);
			move_uploaded_file($_FILES["logo"]["tmp_name"], $target_file);
			// exit();
			$updatearray = array(
				'name' =>$data_input['name'] ,
				'address'=>$data_input['address'],
				'city'=>$data_input['city'],
				'phone'=>$data_input['phone'],
				'fax'=>$data_input['fax'],
				'npwp'=>$data_input['npwp'],
				'skep'=>$data_input['skep'],
				'logo'=>$_FILES["logo"]["name"], 
			);
		}
		
		$this->db->where('id', 1);
		$this->db->update('general_setting', $updatearray);
		header("Location: ".base_url()."admin/general");
	}

	public function general_edit_detail(){
		$data_input=$this->input->post();
		// echo var_dump($data_input);
		// echo "<br>";
		// echo var_dump($_FILES);
		if(empty($_FILES['header']["tmp_name"])){
			
		}else{
			$target_dir = "images/";
			$target_file = $target_dir . basename($_FILES["header"]["name"]);
			move_uploaded_file($_FILES["header"]["tmp_name"], $target_file);
			$updatearray = array(
				'header_image' => $_FILES['header']["name"], 
			);
			$this->db->where('id', 1);
			$this->db->update('general_setting', $updatearray);
		}

		for ($i=0; $i <5 ; $i++) { 
			if(empty($_FILES['file']['tmp_name'][$i])){
				$update_detail = array(
					'name'=>$data_input['name'][$i],
					'job'=>$data_input['title'][$i],
					'contact'=>$data_input['contact'][$i],
				);
				$this->db->where('general_id', 1);
				$this->db->where('order', $i+1);
				$this->db->update('general_setting_detail', $update_detail);
			}else{
				$target_dir = "images/";
				$target_file = $target_dir . basename($_FILES["file"]["name"]);
				move_uploaded_file($_FILES["file"]["tmp_name"], $target_file);
				$update_detail = array(
					'name'=>$data_input['name'][$i],
					'job'=>$data_input['title'][$i],
					'contact'=>$data_input['contact'][$i],
					'signature'=>$_FILES['file']['name'][$i]
				);
				$this->db->where('general_id', 1);
				$this->db->where('order', $i+1);
				$this->db->update('general_setting_detail', $update_detail);
			}
		}
		header("Location: ".base_url()."admin/general");
	}

	public function currency(){
		$this->db->select('*');
		$this->db->from('currency');
		$this->db->where('is_active', 1);
		$data['currencies']=$this->db->get()->result();
		$data['sub_menu']=$this->submenu('Administrator');
		$this->load->view('admin/currency', $data);
	}

	public function currency_add(){
		$data_input=$this->input->post();

		if(empty($data_input['id'])){
			$insert_array = array(
				'currency_code' => $data_input['code'],
				'desc'=>$data_input['desc'],
				'is_active'=>1 
			);
			$this->db->insert('currency', $insert_array);
		}else{
			if(empty($data_input['code'])){
				if(empty($data_input['desc'])){
					$insert_array = array(
						'is_active'=>0 
					);
					$this->db->where('id', $data_input['id']);
					$this->db->update('currency', $insert_array);
				}
			}else{
				$insert_array = array(
					'currency_code' => $data_input['code'],
					'desc'=>$data_input['desc'],
					'is_active'=>1 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('currency', $insert_array);
			}
			
		}
		
		header("Location: ".base_url()."admin/currency");
	}


	public function part(){
		$this->db->select('*');
		$this->db->from('part_type');
		$this->db->where('is_active', 1);
		$data['table']=$this->db->get()->result();

		$this->load->view('admin/part',$data);
	}

	public function part_add(){
		$data_input=$this->input->post();

		if(empty($data_input['id'])){
			$insert_array = array(
				'code' => $data_input['code'],
				'name' => $data_input['name'],
				'desc' => $data_input['desc'],
				'is_active' => 1 
			);
			$this->db->insert('part_type', $insert_array);
		}else{
			if(empty($data_input['code'])){
				if(empty($data_input['name'])){
					if(empty($data_input['desc'])){
						$insert_array = array(
							'is_active' => 0 
						);
						$this->db->where('id', $data_input['id']);
						$this->db->update('part_type', $insert_array);
					}
				}
			}else{
				$insert_array = array(
					'code' => $data_input['code'],
					'name' => $data_input['name'],
					'desc' => $data_input['desc'],
					'is_active' => 1 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('part_type', $insert_array);
			}
			
		}
		header("Location: ".base_url()."admin/part");
	}
	public function uom(){
		$this->db->select('*');
		$this->db->from('unit_of_measures');
		$this->db->where('is_active', 1);
		$data['table']=$this->db->get()->result();

		$this->load->view('admin/unit_measurements', $data);
	}

	public function uom_add(){
		$data_input=$this->input->post();

		if(empty($data_input['id'])){
			$insert_array = array(
				'code' => $data_input['code'],
				'desc' => $data_input['desc'],
				'is_active' => 1 
			);
			$this->db->insert('unit_of_measures', $insert_array);
		}else{
			if(empty($data_input['code'])){
				if(empty($data_input['desc'])){
					$insert_array = array(
						'is_active' => 0 
					);
					$this->db->where('id', $data_input['id']);
					$this->db->update('unit_of_measures', $insert_array);
				}
				
			}else{
				$insert_array = array(
					'code' => $data_input['code'],
					'desc' => $data_input['desc'],
					'is_active' => 1 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('unit_of_measures', $insert_array);
			}
			
		}
		header("Location: ".base_url()."admin/uom");
	}

	public function numbering(){
		$this->db->select('*');
		$this->db->from('doc_numbering');
		$this->db->where('is_active', 1);
		$data['table']=$this->db->get()->result();
		$data['sub_menu']=$this->submenu('Administrator');
		$this->load->view('admin/numbering', $data);
	}

	public function numbering_add(){
		$data_input=$this->input->post();

		if(empty($data_input['id'])){
			$insert_array = array(
				'document' => $data_input['document'],
				'periodic' => $data_input['periodic'],
				'pattern' => $data_input['pattern'],
				'last_number' => $data_input['last_number'],
				'is_active' => 1 
			);
			$this->db->insert('doc_numbering', $insert_array);
		}else{
			if(empty($data_input['document'])){
				if(empty($data_input['periodic'])){
					if(empty($data_input['pattern'])){
						if(empty($data_input['last_number'])){
							$insert_array = array(
								'is_active' => 0 
							);
							$this->db->where('id', $data_input['id']);
							$this->db->update('doc_numbering', $insert_array);
						}
					}
					
				}
				
			}else{
				$insert_array = array(
					'document' => $data_input['document'],
					'periodic' => $data_input['periodic'],
					'pattern' => $data_input['pattern'],
					'last_number' => $data_input['last_number'],
					'is_active' => 1 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('doc_numbering', $insert_array);
			}
			
		}
		header("Location: ".base_url()."admin/numbering");
	}


	public function pic(){
		$this->db->select('*');
		$this->db->from('ms_pic');
		$this->db->where('is_active', 1);
		$data['table']=$this->db->get()->result();
		$data['sub_menu']=$this->submenu('Administrator');
		$this->load->view('admin/pic', $data);
	}

	public function pic_add(){
		$data_input=$this->input->post();

		if(empty($data_input['id'])){
			$insert_array = array(
				'code' => $data_input['code'],
				'name' => $data_input['name'],
				'is_active' => 1 
			);
			$this->db->insert('ms_pic', $insert_array);
		}else{
			if(empty($data_input['code'])){
				if(empty($data_input['name'])){
					$insert_array = array(
						'is_active' => 0 
					);
					$this->db->where('id', $data_input['id']);
					$this->db->update('ms_pic', $insert_array);
					
				}
				
			}else{
				$insert_array = array(
					'code' => $data_input['code'],
					'name' => $data_input['name'],
					'is_active' => 1 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('ms_pic', $insert_array);
			}
			
		}
		header("Location: ".base_url()."admin/pic");
	}

	public function product(){
		$this->db->select('*');
		$this->db->from('ms_product');
		$this->db->where('is_active', 1);
		$data['table']=$this->db->get()->result();

		$this->load->view('admin/product', $data);
	}

	public function product_add(){
		$data_input=$this->input->post();

		if(empty($data_input['id'])){
			$insert_array = array(
				'code' => $data_input['code'],
				'name' => $data_input['name'],
				'is_active' => 1 
			);
			$this->db->insert('ms_product', $insert_array);
		}else{
			if(empty($data_input['code'])){
				if(empty($data_input['name'])){
					$insert_array = array(
						'is_active' => 0 
					);
					$this->db->where('id', $data_input['id']);
					$this->db->update('ms_product', $insert_array);
					
				}
				
			}else{
				$insert_array = array(
					'code' => $data_input['code'],
					'name' => $data_input['name'],
					'is_active' => 1 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('ms_product', $insert_array);
			}
			
		}
		header("Location: ".base_url()."admin/product");
	}

	public function destination(){
		$this->db->select('*');
		$this->db->from('ms_destination');
		$this->db->where('is_active', 1);
		$data['table']=$this->db->get()->result();

		$this->load->view('admin/destination', $data);
	}

	public function destination_add(){
		$data_input=$this->input->post();

		if(empty($data_input['id'])){
			$insert_array = array(
				'destination' => $data_input['destination'],
				'desc' => $data_input['desc'],
				'is_active' => 1 
			);
			$this->db->insert('ms_destination', $insert_array);
		}else{
			if(empty($data_input['destination'])){
				if(empty($data_input['desc'])){
					$insert_array = array(
						'is_active' => 0 
					);
					$this->db->where('id', $data_input['id']);
					$this->db->update('ms_destination', $insert_array);
					
				}
				
			}else{
				$insert_array = array(
					'destination' => $data_input['destination'],
					'desc' => $data_input['desc'],
					'is_active' => 1 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('ms_destination', $insert_array);
			}
			
		}
		header("Location: ".base_url()."admin/destination");
	}

	public function warehouse(){
		$this->db->select('*');
		$this->db->from('ms_warehouse');
		$this->db->where('is_active', 1);
		$data['table']=$this->db->get()->result();
		$data['sub_menu']=$this->submenu('Administrator');
		$this->load->view('admin/warehouse', $data);
	}

	public function warehouse_add(){
		$data_input=$this->input->post();

		if(empty($data_input['id'])){
			$insert_array = array(
				'code' => $data_input['code'],
				'name' => $data_input['name'],
				'address'=>$data_input['address'],
				'phone'=>$data_input['phone'],
				'fax'=>$data_input['fax'],
				'email'=>$data_input['email'],
				'note'=>$data_input['note'],
				'is_active' => 1 
			);
			$this->db->insert('ms_warehouse', $insert_array);
		}else{
			if(empty($data_input['code'])){
				if(empty($data_input['name'])){
					if(empty($data_input['address'])){
						if(empty($data_input['phone'])){
							if(empty($data_input['fax'])){
								if(empty($data_input['email'])){
									if(empty($data_input['note'])){
										$insert_array = array(
											'is_active' => 0 
										);
										$this->db->where('id', $data_input['id']);
										$this->db->update('ms_warehouse', $insert_array);
									}
								}
							}
						}
					}
				}
				
			}else{
				$insert_array = array(
					'code' => $data_input['code'],
					'name' => $data_input['name'],
					'address'=>$data_input['address'],
					'phone'=>$data_input['phone'],
					'fax'=>$data_input['fax'],
					'email'=>$data_input['email'],
					'note'=>$data_input['note'],
					'is_active' => 1 
				);
				$this->db->where('id', $data_input['id']);
				$this->db->update('ms_warehouse', $insert_array);
			}
			
		}
		header("Location: ".base_url()."admin/warehouse");
	}

	public function import(){
		$data['sub_menu']=$this->submenu('Administrator');
		$this->load->view('admin/import',$data);
	}

	public function import_data(){
		$data_input=$this->input->post();
		if($data_input['module']=="material"){
			$cekpertama=explode('.', $_FILES['file']['name']);
			if($cekpertama[1]!="xlsx"){
				$response = array(
					'response' => 'failed',
				);
				echo json_encode($response);
				header("Location: ".base_url()."admin/import?res=failed");
				exit();
			}
			$spreadsheet = new Spreadsheet();
			$sheet = $spreadsheet->getActiveSheet();
			$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader("Xlsx");
			$spreadsheet = $reader->load($_FILES['file']['tmp_name']);
			$i=1;
			$cellValue="1";
			while (!empty($cellValue)) {
				$cellValue = $spreadsheet->getActiveSheet()->getCell('A'.$i)->getValue();
				$i+=1;
			}
			$berakhir=$i-1;
			$tempat_save = array();
			for ($i=2; $i < $berakhir ; $i++) {
				$data_addendum = array(
					'vendor_outsource'=>$spreadsheet->getActiveSheet()->getCell('B'.$i)->getValue(),
					'part_code'=>$spreadsheet->getActiveSheet()->getCell('C'.$i)->getValue(),
					'product_name'=>$spreadsheet->getActiveSheet()->getCell('D'.$i)->getValue(),
					'product_code'=>$spreadsheet->getActiveSheet()->getCell('I'.$i)->getValue(),
					'unit_measures'=>$spreadsheet->getActiveSheet()->getCell('R'.$i)->getValue(),
					'dimension_type'=>$spreadsheet->getActiveSheet()->getCell('S'.$i)->getValue(),
					'material_group'=>$spreadsheet->getActiveSheet()->getCell('T'.$i)->getValue(),
					'weight_factor'=>$spreadsheet->getActiveSheet()->getCell('Z'.$i)->getValue(),
					'length'=>$spreadsheet->getActiveSheet()->getCell('Y'.$i)->getValue(),
					'width'=>$spreadsheet->getActiveSheet()->getCell('AO'.$i)->getValue(),
					'thick'=>$spreadsheet->getActiveSheet()->getCell('AN'.$i)->getValue(),
					'volume_formula'=>$spreadsheet->getActiveSheet()->getCell('AP'.$i)->getValue(),
					'area_formula'=>$spreadsheet->getActiveSheet()->getCell('AS'.$i)->getValue(),
					'code'=>$spreadsheet->getActiveSheet()->getCell('C'.$i)->getValue(),
					'is_active'=>1
				);
				array_push($tempat_save, $data_addendum);
			}
			foreach ($tempat_save as $key => $value) {
				if($value['code']=="A36"){
					$this->db->select('material_id');
					$this->db->from('master_material');
					$this->db->like('material_id', 'PLS', 'AFTER');
					$this->db->order_by('material_id', 'desc');
					$this->db->limit(1);
					$terakhir=$this->db->get()->row();
					if(empty($terakhir->material_id)){
						$terakhir->material_id='PLS00'.$terakhir->material_id;
					}else{
						$terakhir->material_id=str_replace('PLS', '', $terakhir->material_id);
						$terakhir->material_id=((int)$terakhir->material_id)+1;
						if($terakhir->material_id>99){
							$terakhir->material_id='PLS'.$terakhir->material_id;
						}else if($terakhir->material_id>9){
							$terakhir->material_id='PLS0'.$terakhir->material_id;
						}else{
							$terakhir->material_id='PLS00'.$terakhir->material_id;
						}	
					}
					
					$weight_formula=$value['volume_formula'];
					// echo $weight_formula;
					// echo "<br>";
					if(strpos($value['volume_formula'], 'length')>=0){
						$weight_formula=str_replace('length', $value['length'], $weight_formula);
					}
					if(strpos($value['volume_formula'], 'width')>=0){
						$weight_formula=str_replace('width', $value['width'], $weight_formula);
					}
					if(strpos($value['volume_formula'], 'thick')>=0){
						$weight_formula=str_replace('thick', $value['thick'], $weight_formula);
					}
					// echo $weight_formula;
					$weight_formula=eval('return '.$weight_formula.';');
					$weight_formula=floatval($weight_formula)/1000000;
					if($value['weight_factor']==""){
						$value['weight_factor']=1;
					}
					
					$weight_formula=$weight_formula*$value['weight_factor'];

					$insert_array = array(
						'material_id'=>$terakhir->material_id,
						'vendor_outsource'=>$value['vendor_outsource'],
						'part_code'=>$value['part_code'],
						'product_name'=>$value['product_name'],
						'product_code'=>$value['product_code'],
						'unit_measures'=>$value['unit_measures'],
						'dimension_type'=>$value['dimension_type'],
						'material_group'=>$value['material_group'],
						'weight_factor'=>$value['weight_factor'],
						'length'=>$value['length'],
						'width'=>$value['width'],
						'thick'=>$value['thick'],
						'volume_formula'=>$value['volume_formula'],
						'area_formula'=>$value['area_formula'],
						'weight'=>$weight_formula,
						'is_active'=>1
					);
					$this->db->insert('master_material', $insert_array);
				}else if($value['code']=="S45C"){
					$this->db->select('material_id');
					$this->db->from('master_material');
					$this->db->like('material_id', 'RBS', 'AFTER');
					$this->db->order_by('material_id', 'desc');
					$this->db->limit(1);
					$terakhir=$this->db->get()->row();
					if(empty($terakhir->material_id)){
						$terakhir->material_id='RBS00'.$terakhir->material_id;
					}else{
						$terakhir->material_id=str_replace('RBS', '', $terakhir->material_id);
						$terakhir->material_id=((int)$terakhir->material_id)+1;
						if($terakhir->material_id>99){
							$terakhir->material_id='RBS'.$terakhir->material_id;
						}else if($terakhir->material_id>9){
							$terakhir->material_id='RBS0'.$terakhir->material_id;
						}else{
							$terakhir->material_id='RBS00'.$terakhir->material_id;
						}	
					}
					
					$weight_formula=$value['volume_formula'];
					// echo $weight_formula;
					// echo "<br>";
					if(strpos($value['volume_formula'], 'length')>=0){
						$weight_formula=str_replace('length', $value['length'], $weight_formula);
					}
					if(strpos($value['volume_formula'], 'width')>=0){
						$weight_formula=str_replace('width', $value['width'], $weight_formula);
					}
					if(strpos($value['volume_formula'], 'thick')>=0){
						$weight_formula=str_replace('thick', $value['thick'], $weight_formula);
					}
					// echo $weight_formula;
					$weight_formula=eval('return '.$weight_formula.';');
					$weight_formula=floatval($weight_formula)/1000000;
					if($value['weight_factor']==""){
						$value['weight_factor']=1;
					}
					
					$weight_formula=$weight_formula*$value['weight_factor'];

					$insert_array = array(
						'material_id'=>$terakhir->material_id,
						'vendor_outsource'=>$value['vendor_outsource'],
						'part_code'=>$value['part_code'],
						'product_name'=>$value['product_name'],
						'product_code'=>$value['product_code'],
						'unit_measures'=>$value['unit_measures'],
						'dimension_type'=>$value['dimension_type'],
						'material_group'=>$value['material_group'],
						'weight_factor'=>$value['weight_factor'],
						'length'=>$value['length'],
						'width'=>$value['width'],
						'thick'=>$value['thick'],
						'volume_formula'=>$value['volume_formula'],
						'area_formula'=>$value['area_formula'],
						'weight'=>$weight_formula,
						'is_active'=>1
					);
					$this->db->insert('master_material', $insert_array);
				}else if($value['code']=="SS41"){
					$this->db->select('material_id');
					$this->db->from('master_material');
					$this->db->like('material_id', 'ROS', 'AFTER');
					$this->db->order_by('material_id', 'desc');
					$this->db->limit(1);
					$terakhir=$this->db->get()->row();
					if(empty($terakhir->material_id)){
						$terakhir->material_id='ROS00'.$terakhir->material_id;
					}else{
						$terakhir->material_id=str_replace('ROS', '', $terakhir->material_id);
						$terakhir->material_id=((int)$terakhir->material_id)+1;
						if($terakhir->material_id>99){
							$terakhir->material_id='ROS'.$terakhir->material_id;
						}else if($terakhir->material_id>9){
							$terakhir->material_id='ROS0'.$terakhir->material_id;
						}else{
							$terakhir->material_id='ROS00'.$terakhir->material_id;
						}	
					}
					
					$weight_formula=$value['volume_formula'];
					// echo $weight_formula;
					// echo "<br>";
					if(strpos($value['volume_formula'], 'length')>=0){
						$weight_formula=str_replace('length', $value['length'], $weight_formula);
					}
					if(strpos($value['volume_formula'], 'width')>=0){
						$weight_formula=str_replace('width', $value['width'], $weight_formula);
					}
					if(strpos($value['volume_formula'], 'thick')>=0){
						$weight_formula=str_replace('thick', $value['thick'], $weight_formula);
					}
					// echo $weight_formula;
					$weight_formula=eval('return '.$weight_formula.';');
					$weight_formula=floatval($weight_formula)/1000000;
					if($value['weight_factor']==""){
						$value['weight_factor']=1;
					}
					
					$weight_formula=$weight_formula*$value['weight_factor'];

					$insert_array = array(
						'material_id'=>$terakhir->material_id,
						'vendor_outsource'=>$value['vendor_outsource'],
						'part_code'=>$value['part_code'],
						'product_name'=>$value['product_name'],
						'product_code'=>$value['product_code'],
						'unit_measures'=>$value['unit_measures'],
						'dimension_type'=>$value['dimension_type'],
						'material_group'=>$value['material_group'],
						'weight_factor'=>$value['weight_factor'],
						'length'=>$value['length'],
						'width'=>$value['width'],
						'thick'=>$value['thick'],
						'volume_formula'=>$value['volume_formula'],
						'area_formula'=>$value['area_formula'],
						'weight'=>$weight_formula,
						'is_active'=>1
					);
					$this->db->insert('master_material', $insert_array);
				}
			}
			// echo json_encode($tempat_save);
			header("Location: ".base_url()."admin/import?res=success");
		}else if ($data_input['module']=="master_part"){
			$cekpertama=explode('.', $_FILES['file']['name']);
			if($cekpertama[1]!="xlsx"){
				$response = array(
					'response' => 'failed',
				);
				header("Location: ".base_url()."admin/import?res=failed");
				exit();
			}
			$spreadsheet = new Spreadsheet();
			$sheet = $spreadsheet->getActiveSheet();
			$reader = \PhpOffice\PhpSpreadsheet\IOFactory::createReader("Xlsx");
			$spreadsheet = $reader->load($_FILES['file']['tmp_name']);
			$i=1;
			$cellValue="1";
			while (!empty($cellValue)) {
				$cellValue = $spreadsheet->getActiveSheet()->getCell('A'.$i)->getValue();
				$i+=1;
			}
			$berakhir=$i-1;
			$tempat_save = array();
			for ($i=2; $i < $berakhir ; $i++) {
				$data_addendum = array(
					'vendor_outsource'=>$spreadsheet->getActiveSheet()->getCell('B'.$i)->getValue(),
					'part_code'=>$spreadsheet->getActiveSheet()->getCell('C'.$i)->getValue(),
					'product_name'=>$spreadsheet->getActiveSheet()->getCell('D'.$i)->getValue(),
					'product_code'=>$spreadsheet->getActiveSheet()->getCell('I'.$i)->getValue(),
					'unit_measures'=>$spreadsheet->getActiveSheet()->getCell('R'.$i)->getValue(),
					'dimension_type'=>$spreadsheet->getActiveSheet()->getCell('S'.$i)->getValue(),
					'material_group'=>$spreadsheet->getActiveSheet()->getCell('T'.$i)->getValue(),
					'weight_factor'=>$spreadsheet->getActiveSheet()->getCell('Z'.$i)->getValue(),
					'length'=>$spreadsheet->getActiveSheet()->getCell('Y'.$i)->getValue(),
					'width'=>$spreadsheet->getActiveSheet()->getCell('AO'.$i)->getValue(),
					'thick'=>$spreadsheet->getActiveSheet()->getCell('AN'.$i)->getValue(),
					'volume_formula'=>$spreadsheet->getActiveSheet()->getCell('AP'.$i)->getValue(),
					'area_formula'=>$spreadsheet->getActiveSheet()->getCell('AS'.$i)->getValue(),
					'code'=>$spreadsheet->getActiveSheet()->getCell('C'.$i)->getValue(),
					'is_active'=>1
				);
				array_push($tempat_save, $data_addendum);
			}
			foreach ($tempat_save as $key => $value) {
				if($value['code']=="A36"){
					$this->db->select('material_id');
					$this->db->from('master_part_material');
					$this->db->like('material_id', 'PLS', 'AFTER');
					$this->db->order_by('material_id', 'desc');
					$this->db->limit(1);
					$terakhir=$this->db->get()->row();
					if(empty($terakhir->material_id)){
						$terakhir->material_id='PLS00'.$terakhir->material_id;
					}else{
						$terakhir->material_id=str_replace('PLS', '', $terakhir->material_id);
						$terakhir->material_id=((int)$terakhir->material_id)+1;
						if($terakhir->material_id>99){
							$terakhir->material_id='PLS'.$terakhir->material_id;
						}else if($terakhir->material_id>9){
							$terakhir->material_id='PLS0'.$terakhir->material_id;
						}else{
							$terakhir->material_id='PLS00'.$terakhir->material_id;
						}	
					}
					
					$weight_formula=$value['volume_formula'];
					// echo $weight_formula;
					// echo "<br>";
					if(strpos($value['volume_formula'], 'length')>=0){
						$weight_formula=str_replace('length', $value['length'], $weight_formula);
					}
					if(strpos($value['volume_formula'], 'width')>=0){
						$weight_formula=str_replace('width', $value['width'], $weight_formula);
					}
					if(strpos($value['volume_formula'], 'thick')>=0){
						$weight_formula=str_replace('thick', $value['thick'], $weight_formula);
					}
					// echo $weight_formula;
					$weight_formula=eval('return '.$weight_formula.';');
					$weight_formula=floatval($weight_formula)/1000000;
					if($value['weight_factor']==""){
						$value['weight_factor']=1;
					}
					
					$weight_formula=$weight_formula*$value['weight_factor'];

					$insert_array = array(
						'material_id'=>$terakhir->material_id,
						'vendor_outsource'=>$value['vendor_outsource'],
						'part_code'=>$value['part_code'],
						'product_name'=>$value['product_name'],
						'product_code'=>$value['product_code'],
						'unit_measures'=>$value['unit_measures'],
						'dimension_type'=>$value['dimension_type'],
						'material_group'=>$value['material_group'],
						'weight_factor'=>$value['weight_factor'],
						'length'=>$value['length'],
						'width'=>$value['width'],
						'thick'=>$value['thick'],
						'volume_formula'=>$value['volume_formula'],
						'area_formula'=>$value['area_formula'],
						'weight'=>$weight_formula,
						'is_active'=>1
					);
					$this->db->insert('master_part_material', $insert_array);
				}else if($value['code']=="S45C"){
					$this->db->select('material_id');
					$this->db->from('master_part_material');
					$this->db->like('material_id', 'RBS', 'AFTER');
					$this->db->order_by('material_id', 'desc');
					$this->db->limit(1);
					$terakhir=$this->db->get()->row();
					if(empty($terakhir->material_id)){
						$terakhir->material_id='RBS00'.$terakhir->material_id;
					}else{
						$terakhir->material_id=str_replace('RBS', '', $terakhir->material_id);
						$terakhir->material_id=((int)$terakhir->material_id)+1;
						if($terakhir->material_id>99){
							$terakhir->material_id='RBS'.$terakhir->material_id;
						}else if($terakhir->material_id>9){
							$terakhir->material_id='RBS0'.$terakhir->material_id;
						}else{
							$terakhir->material_id='RBS00'.$terakhir->material_id;
						}	
					}
					
					$weight_formula=$value['volume_formula'];
					// echo $weight_formula;
					// echo "<br>";
					if(strpos($value['volume_formula'], 'length')>=0){
						$weight_formula=str_replace('length', $value['length'], $weight_formula);
					}
					if(strpos($value['volume_formula'], 'width')>=0){
						$weight_formula=str_replace('width', $value['width'], $weight_formula);
					}
					if(strpos($value['volume_formula'], 'thick')>=0){
						$weight_formula=str_replace('thick', $value['thick'], $weight_formula);
					}
					// echo $weight_formula;
					$weight_formula=eval('return '.$weight_formula.';');
					$weight_formula=floatval($weight_formula)/1000000;
					if($value['weight_factor']==""){
						$value['weight_factor']=1;
					}
					
					$weight_formula=$weight_formula*$value['weight_factor'];

					$insert_array = array(
						'material_id'=>$terakhir->material_id,
						'vendor_outsource'=>$value['vendor_outsource'],
						'part_code'=>$value['part_code'],
						'product_name'=>$value['product_name'],
						'product_code'=>$value['product_code'],
						'unit_measures'=>$value['unit_measures'],
						'dimension_type'=>$value['dimension_type'],
						'material_group'=>$value['material_group'],
						'weight_factor'=>$value['weight_factor'],
						'length'=>$value['length'],
						'width'=>$value['width'],
						'thick'=>$value['thick'],
						'volume_formula'=>$value['volume_formula'],
						'area_formula'=>$value['area_formula'],
						'weight'=>$weight_formula,
						'is_active'=>1
					);
					$this->db->insert('master_part_material', $insert_array);
				}else if($value['code']=="SS41"){
					$this->db->select('material_id');
					$this->db->from('master_part_material');
					$this->db->like('material_id', 'ROS', 'AFTER');
					$this->db->order_by('material_id', 'desc');
					$this->db->limit(1);
					$terakhir=$this->db->get()->row();
					if(empty($terakhir->material_id)){
						$terakhir->material_id='ROS00'.$terakhir->material_id;
					}else{
						$terakhir->material_id=str_replace('ROS', '', $terakhir->material_id);
						$terakhir->material_id=((int)$terakhir->material_id)+1;
						if($terakhir->material_id>99){
							$terakhir->material_id='ROS'.$terakhir->material_id;
						}else if($terakhir->material_id>9){
							$terakhir->material_id='ROS0'.$terakhir->material_id;
						}else{
							$terakhir->material_id='ROS00'.$terakhir->material_id;
						}	
					}
					
					$weight_formula=$value['volume_formula'];
					// echo $weight_formula;
					// echo "<br>";
					if(strpos($value['volume_formula'], 'length')>=0){
						$weight_formula=str_replace('length', $value['length'], $weight_formula);
					}
					if(strpos($value['volume_formula'], 'width')>=0){
						$weight_formula=str_replace('width', $value['width'], $weight_formula);
					}
					if(strpos($value['volume_formula'], 'thick')>=0){
						$weight_formula=str_replace('thick', $value['thick'], $weight_formula);
					}
					// echo $weight_formula;
					$weight_formula=eval('return '.$weight_formula.';');
					$weight_formula=floatval($weight_formula)/1000000;
					if($value['weight_factor']==""){
						$value['weight_factor']=1;
					}
					
					$weight_formula=$weight_formula*$value['weight_factor'];

					$insert_array = array(
						'material_id'=>$terakhir->material_id,
						'vendor_outsource'=>$value['vendor_outsource'],
						'part_code'=>$value['part_code'],
						'product_name'=>$value['product_name'],
						'product_code'=>$value['product_code'],
						'unit_measures'=>$value['unit_measures'],
						'dimension_type'=>$value['dimension_type'],
						'material_group'=>$value['material_group'],
						'weight_factor'=>$value['weight_factor'],
						'length'=>$value['length'],
						'width'=>$value['width'],
						'thick'=>$value['thick'],
						'volume_formula'=>$value['volume_formula'],
						'area_formula'=>$value['area_formula'],
						'weight'=>$weight_formula,
						'is_active'=>1
					);
					$this->db->insert('master_part_material', $insert_array);
				}
			}
			header("Location: ".base_url()."admin/import?res=success");
		}
		// redirect('','refresh')

		
	}
}
