<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Partial extends Tagmanager implements IonizeLibrary
{
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function initialize( $data = NULL )
	{
		return $this;	
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function View( $file )
	{	
		$file_path = Theme::getRoute().'views/'.$file;
		$extension = "";
	
		if( file_exists( $file_path ) ) $extension = $extension;
		else if( file_exists( $file_path.'.php' ) ) $extension = '.php';
		else if( file_exists( $file_path.'.tpl' ) ) $extension = '.tpl';
		else
		{
			$this->error_file_exists($file_path);
			return FALSE;
		}
		
		// Saving the loaded view file
		Renderer::$_loaded_views[] = $file.$extension;
		
		// Load the view file
		$view_file = Theme::getRelativeRoute().'views/'.$file.$extension;
		return $this->codeigniter->load->view($view_file, Renderer::$_data, TRUE);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Partial.php */
/* Location: ./ionize/libraries/Ionize/Partial.php */
