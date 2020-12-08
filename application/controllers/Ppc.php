<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ppc extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

	public function __construct(){
		parent::__construct();
		if($this->session->userdata('logged_in')!=TRUE)redirect('login');
		// if($this->sesi_login->log_session() !=TRUE)redirect('Login');
	}
	
	public function index()
	{
		$this->load->view('ppic/home');
	}

	public function dkm(){

		$this->db->select('*');
		$this->db->from('dkm');
		$this->db->where('is_active', 1);
		$data['table']=$this->db->get()->result();

		$this->load->view('ppic/dkm', $data);
	}
}
