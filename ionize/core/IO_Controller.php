<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class IO_Controller extends CI_Controller
{
	public $language = 'en_US';
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct()
	{
		parent::__construct();
		
		$http = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https' : 'http';
		$this->data['base_url'] = sprintf("%s://%s%s",$http,$_SERVER['SERVER_NAME'],$_SERVER['REQUEST_URI']);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: IO_Controller.php */
/* Location: ./ionize/core/IO_Controller.php */
