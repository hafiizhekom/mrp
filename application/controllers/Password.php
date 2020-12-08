<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Password extends CI_Controller {

	public function __construct(){
		parent::__construct();
		if($this->session->userdata('logged_in')!=TRUE)redirect('login');
		// if($this->sesi_login->log_session() !=TRUE)redirect('Login');
	}
	
	public function index()
	{
		$this->load->view('login/changepassword');
	}

	public function edit(){
		$data_input=$this->input->post();
		// echo var_dump($data_input);
		$this->db->select('*');
		$this->db->from('user_account');
		$this->db->where('is_active', 1);
		$this->db->where('id', $this->session->userdata('id'));
		$user=$this->db->get()->row();
		if($user->password==md5($data_input['old'])){
			$update = array('password' => md5($data_input['confirm']) );
			$this->db->where('id', $this->session->userdata('id'));
			$this->db->update('user_account', $update);
			redirect('password?res=success');
			// header("Location: ".base_url()."password?res=success");
		}else{
			redirect('password?res=failed');
			// header("Location: ".base_url()."password?res=failed");
		}
	}
}
