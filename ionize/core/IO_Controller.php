<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class IO_Controller extends CI_Controller
{
	public $data = array();

	public $language = 'en_US';
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct()
	{
		parent::__construct();
		
		$http = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https' : 'http';
		$this->data['base_url'] = sprintf("%s://%s%s",$http,$_SERVER['SERVER_NAME'],$_SERVER['REQUEST_URI']);
		
		$elapsed_time = $this->benchmark->elapsed_time('total_execution_time_start', 'total_execution_time_end', 8);
		$this->data['elapsed_time'] = round((((double) $elapsed_time) * 1000), 3) .'ms';
		$this->data['memory_usage']	= round(memory_get_usage() / 1024 / 1024, 3).'MB';
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: IO_Controller.php */
/* Location: ./ionize/core/IO_Controller.php */
