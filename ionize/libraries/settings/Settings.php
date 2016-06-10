<?php

namespace Settings;

class Settings
{
	private static $instance;
	
	private $items = array();
	
	public function __construct()
	{
		// If no settings present then load them
		if(count($items) == 0) $this->initialize();
		
		self::$instance = $this;
	}
	
	public static function getInstance()
	{
		if( self::$instance instanceof Settings ) return self::$instance;
		else return new self;
	}
	
	private function initialize()
	{
		
	}
}
