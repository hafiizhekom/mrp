<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class login extends CI_Controller {

	
	public function index()
	{
		$this->load->view('login/view');
	}

	public function check(){
		$data_input=$this->input->post();

		$this->db->select('*');
		$this->db->from('user_account');
		$this->db->where('username', $data_input['username']);
		$this->db->where('password', md5($data_input['password']));
		$return=$this->db->get()->row();

		$this->db->select('c.module');
		$this->db->from('tr_menu_access as a');
		$this->db->join('ms_submenu as b', 'b.id = a.sub_menu_id', 'left');
		$this->db->join('ms_menu as c', 'c.id=b.menu_id', 'left');
		$this->db->where('a.group_id', $return->group_id??"");
		$this->db->where('a.is_active', 1);
		$this->db->group_by('c.module');
		$menu_access=$this->db->get()->result();
		// echo var_dump($return);
		// exit();
		if($return!=null){


			
			if($return->default_module=="ADM"||$return->default_module=="DEV"){
				$newdata = array(
			        'email'  => $return->email,
			        'id'     => $return->id,
			        'logged_in' => TRUE,
			        'token'=>$this->generateRandomString(),
			        'link'=>base_url()."admin",
			        'base_link'=>"admin",
			        'menu_access'=>$menu_access,
				);
				$this->session->set_userdata($newdata);
				redirect("admin");
			}else if($return->default_module=="ENG"){
				$newdata = array(
			        'email'  => $return->email,
			        'id'     => $return->id,
			        'logged_in' => TRUE,
			        'token'=>$this->generateRandomString(),
			        'link'=>base_url()."engineering",
			        'base_link'=>"engineering",
			        'menu_access'=>$menu_access,
				);
				$this->session->set_userdata($newdata);
				redirect("engineering");
			}else if($return->default_module=="MKT"){
				$newdata = array(
			        'email'  => $return->email,
			        'id'     => $return->id,
			        'logged_in' => TRUE,
			        'token'=>$this->generateRandomString(),
			        'link'=>base_url()."marketing",
			        'base_link'=>"marketing",
			        'menu_access'=>$menu_access,
				);
				$this->session->set_userdata($newdata);
				redirect("marketing");
			}else if($return->default_module=="PUR"){
				$newdata = array(
			        'email'  => $return->email,
			        'id'     => $return->id,
			        'logged_in' => TRUE,
			        'token'=>$this->generateRandomString(),
			        'link'=>base_url()."purchasing",
			        'base_link'=>"purchasing",
			        'menu_access'=>$menu_access,
				);
				$this->session->set_userdata($newdata);
				redirect("purchasing");
			}else if($return->default_module=="PPIC"){
				$newdata = array(
			        'email'  => $return->email,
			        'id'     => $return->id,
			        'logged_in' => TRUE,
			        'token'=>$this->generateRandomString(),
			        'link'=>base_url()."ppc",
			        'base_link'=>"ppc",
			        'menu_access'=>$menu_access,
				);
				$this->session->set_userdata($newdata);
				redirect("ppc");
			}else if($return->default_module=="PROD"){
				$newdata = array(
			        'email'  => $return->email,
			        'id'     => $return->id,
			        'logged_in' => TRUE,
			        'token'=>$this->generateRandomString(),
			        'link'=>base_url()."production",
			        'base_link'=>"production",
			        'menu_access'=>$menu_access,
				);
				$this->session->set_userdata($newdata);
				redirect("production");
			}else if($return->default_module=="LOG"){
				$newdata = array(
			        'email'  => $return->email,
			        'id'     => $return->id,
			        'logged_in' => TRUE,
			        'token'=>$this->generateRandomString(),
			        'link'=>base_url()."logistic",
			        'base_link'=>"logistic",
			        'menu_access'=>$menu_access,
				);
				$this->session->set_userdata($newdata);
				redirect("logistic");
			}else if($return->default_module=="QC"){
				$newdata = array(
			        'email'  => $return->email,
			        'id'     => $return->id,
			        'logged_in' => TRUE,
			        'token'=>$this->generateRandomString(),
			        'link'=>base_url()."qc",
			        'base_link'=>"qc",
			        'menu_access'=>$menu_access,
				);
				$this->session->set_userdata($newdata);
				redirect("qc");
			}else if($return->default_module=="FIN"){
				$newdata = array(
			        'email'  => $return->email,
			        'id'     => $return->id,
			        'logged_in' => TRUE,
			        'token'=>$this->generateRandomString(),
			        'link'=>base_url()."marketing",
			        'base_link'=>"marketing",
			        'menu_access'=>$menu_access,
				);
				$this->session->set_userdata($newdata);
				redirect("marketing");
			}else if($return->default_module=="MNT"){
				$newdata = array(
			        'email'  => $return->email,
			        'id'     => $return->id,
			        'logged_in' => TRUE,
			        'token'=>$this->generateRandomString(),
			        'link'=>base_url()."maintenance",
			        'base_link'=>"maintenance",
			        'menu_access'=>$menu_access,
				);
				$this->session->set_userdata($newdata);
				redirect("maintenance");
			}
			
			
		}else{
			redirect("login?res=failed");
		}
	}

	public function log_out(){
		$this->session->sess_destroy();
		redirect("login");
	}
	private function generateRandomString($length = 10) {
	    return substr(str_shuffle(str_repeat($x='0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', ceil($length/strlen($x)) )),1,$length);
	}
}
