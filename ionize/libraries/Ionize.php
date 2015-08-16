<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Ionize extends Tagmanager
{
	private static $_loaded = array();
	private static $_classes = array();
	/* ------------------------------------------------------------------------------------------------------------- */
		
	private static $_directory = APPPATH.'libraries/Ionize';
	/* ------------------------------------------------------------------------------------------------------------- */

	public function __construct()
	{
		
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public static function base_url()
	{
		return site_url().'/';
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public static function theme_url()
	{
		return site_url('themes/'.Theme::$folder).'/';
	}
	
	/* ------------------------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public static function Partial()
	{
		if(!in_array('Partial', self::$_loaded)) self::_load_library('Partial');
		return self::$_classes['Partial'];
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private static function _load_library($name)
	{
		include_once(self::$_directory.'/'.$name.'.php');
		self::$_classes[$name] = new $name();
		self::$_loaded[] = $name;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
