<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Json{

	public function post()
	{
		$post = (object) json_decode(file_get_contents('php://input'));
		return $post;
	}

	public function response($result)
	{
		echo json_encode($result);
		exit;
	}

}

/* End of file Json.php */
/* Location: ./application/libraries/Json.php */