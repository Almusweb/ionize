<?php

class Admin extends IO_Controller
{
	protected $variables = array();
	protected $layout = 'admin_default';
	protected $template = NULL;
	
	public function __construct()
	{
		parent::__construct();
	
		if($this->user == FALSE && $this->uri->segment(2) != 'auth') redirect('admin/auth/login');
	}
	
	public function index()
	{
		redirect('admin/dashboard');
	}
	
	protected function render()
	{
		$this->variables['template'] = $this->template;
		$this->load->view("layouts/{$this->layout}", $this->variables);
	}
}
