<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Renderer extends Theme
{
	/* ------------------------------------------------------------------------------------------------------------- */
	private $codeigniter = NULL;

	/* ------------------------------------------------------------------------------------------------------------- */

	public static $_loaded_views = array();
	public static $_data = array();

	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct()
	{
		parent::__construct();
		
		// Create pointer to codeigniter class
		$this->codeigniter =& get_instance();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function parseView( $context )
	{
		$this->codeigniter->benchmark->mark('Renderer_library_parse_view_start');
		
		// Assing the data
		self::$_data[(Model\Data\Content::$data['type'])] = Model\Data\Content::$data;
		
		echo "<pre>".print_r($context, true)."</pre>";
		
		// Parse view file
		$view_path = Theme::getRelativeRoute().'views/'.$context->view;
		$extension = "";
		
		if( file_exists( str_replace('../../', FCPATH, $view_path))) $extension = $extension;
		else if( file_exists( str_replace('../../', FCPATH, $view_path.'.php'))) $extension = '.php';
		else if( file_exists( str_replace('../../', FCPATH, $view_path.'.tpl'))) $extension = '.tpl';
		else
		{
			$this->error_file_exists($view_path);
			return FALSE;
		}
		
    	$parsed_view = $this->codeigniter->load->view($view_path, self::$_data, TRUE);
    	
    	// Save the loaded view file
    	self::$_loaded_views[] = $context->view.$extension;
		
		// Cache the loaded view files list
		$view_cache_file = Theme::getRoute().'.cache/'.str_replace('/','.',$context->view.'.Views');
		file_put_contents($view_cache_file, serialize(self::$_loaded_views));
		chmod( $view_cache_file , 0777 );
		
		$this->codeigniter->benchmark->mark('Renderer_library_parse_view_end');
		return $parsed_view;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function checkViewUpdated( $context, $metadata )
	{
		$view_cache_file = Theme::getRoute().'.cache/'.str_replace('/','.',$context->view.'.Views');
		if( file_exists($view_cache_file) )
		{
			$view_files = unserialize( file_get_contents( $view_cache_file ));
			foreach($view_files as $file)
			{
				$modified = filemtime( Theme::getRoute().'views/'.$file );
				if($modified > $metadata['mtime']) return TRUE;
			}
			return FALSE;
		}
		else return TRUE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function error_file_exists($file_path)
	{
		show_error("Missing view file: $file_path");
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Renderer.php */
/* Location: ./ionize/libraries/Renderer.php */
