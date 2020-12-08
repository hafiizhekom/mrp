<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ppic extends CI_Controller {

	public function __construct(){
		parent::__construct();
		if($this->session->userdata('logged_in')!=TRUE)redirect('login');
		// if($this->sesi_login->log_session() !=TRUE)redirect('Login');
	}
	
	public function index()
	{
		redirect('ppc');
	}
}
