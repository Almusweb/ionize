<?php

class Api extends IO_Controller
{
	public function __construct()
	{
		parent::__construct();
	}
	
	public function index()
	{
		show_404();
	}
}
