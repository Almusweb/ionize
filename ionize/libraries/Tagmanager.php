<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
abstract class Tagmanager
{
	public $codeigniter = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $_definition = array
	(
		'ion:base_url'		=>	'Ionize::base_url()',
		'ion:theme_url'		=>	'Ionize::theme_url()',
	);
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct()
	{
		//parent::__construct();
		$this->codeigniter =& get_instance();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function error_file_exists($file_path)
	{
		
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Tagmanager.php */
/* Location: ./ionize/libraries/Tagmanager.php */
