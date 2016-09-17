<?php

include_once APPPATH.'controllers'.DS.'Admin'.PHPEXT;

class Auth extends Admin
{
	public function login()
	{
		if($this->user != FALSE) redirect('admin/dashboard');
	
		$this->layout = 'admin_login';
		$this->render();
	}
}
