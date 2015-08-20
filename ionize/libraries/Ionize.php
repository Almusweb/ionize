<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Ionize extends Tagmanager
{

	public static $title = NULL;
	public static $site_title = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	private static $_loaded = array();
	private static $_loaded_classes = array();
	private static $_classes = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private static $_directory = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	public function __construct()
	{
		self::$_directory = APPPATH.'libraries/Ionize';
		
		$directory_map = directory_map( self::$_directory );
		foreach($directory_map as $file_name)
		{
			if(substr($file_name, -4) === ".php")
			{
				self::$_classes[] = str_replace('.php','',$file_name);
			}
		}
		
		echo "<pre>".print_r(Renderer::getCurrentContent(), true)."</pre>";
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public static function __callStatic($name, $arguments)
    {             
        if(in_array($name, self::$_classes))
        {
            if(!in_array($name, self::$_loaded)) self::_load_library($name);
			return call_user_func_array(array(self::$_loaded_classes[$name],'initialize'),$arguments);
		}
    }
    
	/* ------------------------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */
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
	
	public static function site_title()
	{
		return \Model\Data\Settings::get_instance()->site_title;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public static function title()
	{
		return '#title';
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/* ------------------------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private static function _load_library($name)
	{
		include_once(self::$_directory.'/'.$name.'.php');
		self::$_loaded_classes[$name] = new $name();
		self::$_loaded[] = $name;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
