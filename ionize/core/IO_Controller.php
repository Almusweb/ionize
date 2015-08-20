<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class IO_Controller extends CI_Controller
{
	protected $language = 'en_US';
	/* ------------------------------------------------------------------------------------------------------------- */
	
	protected $io_config = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	protected $settings = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	protected $hhvm = FALSE;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct()
	{
		parent::__construct();
		
		$http = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https' : 'http';
		$this->data['base_url'] = sprintf("%s://%s%s",$http,$_SERVER['SERVER_NAME'],$_SERVER['REQUEST_URI']);
		
		// Detect Facebook HipHop
		$this->hhvm = (defined('HHVM_VERSION') ? HHVM_VERSION : FALSE);
		
		// Load the ionize config
		$this->config->load('ionize', TRUE);
		$this->io_config = (object) $this->config->config['ionize'];
		
		$this->settings = \Model\Data\Settings::get_instance();
		$this->session->language = $this->settings->language;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: IO_Controller.php */
/* Location: ./ionize/core/IO_Controller.php */
