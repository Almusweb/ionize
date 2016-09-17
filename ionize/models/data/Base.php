<?php
namespace Model\Data;

// Load the Ionize Autoloader class
include_once APPPATH.'core'.DS.'IO_Autoloader.php';

abstract class Base
{
	private static $instances = array();

	public function __construct()
	{
		//parent::__construct();

		// Save the instance by Called class
		self::$instances[ get_called_class() ] = $this;

		// logging
		log_message('info', get_class($this), " class Initialized");
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	public static function getInstance()
	{
		$class_name = get_called_class();

		if( !isset( self::$instances[ $class_name ] ) ) self::$instances[ $class_name ] = new $class_name();
		return self::$instances[ $class_name ];
	}
}
