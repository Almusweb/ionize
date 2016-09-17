<?php

include_once APPPATH.'controllers'.DS.'Admin'.PHPEXT;

class Dashboard extends Admin
{
	public function index()
	{
		$this->layout = 'admin_default';
		$this->render();
	}
}
