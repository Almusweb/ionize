<?php
/**
 * Ionize Outout class
 *
 * Getting the content by URL calling the theme parser for determinate the theme view files and execute them.
 *
 * @package Ionize
 * @subpackage Core
 *
 * @author	Ádám Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 *
 * @property \CI_Uri $uri
 * @property \CI_Router $router
 * @property \CI_Benchmark $benchmark
 * @property \CI_Config $config
 * @property \CI_Input $input
 * @property \CI_Loader $load
 * @property \CI_Output $output
 *
 * @property \Model\Data\Contents\Contents $contents
 * @property \\Ionize\Theme $theme
 */
class Output extends IO_Controller
{
	private $url = array();
	private $url_string = '';
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct()
	{
		parent::__construct();
		
		$this->url = $this->uri->segment_array();
		
		// Possible Language code detection
		if(isset($this->url[0]) && strlen($this->url[0]) == 2)
		{
			$this->language = $this->url[0];
			unset($this->url[0]);
		}
		
		$this->url_string = '/'.implode('/',$this->url);
		//$this->output->enable_profiler( TRUE );
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function index()
	{
		$this->render();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function render()
	{
		// Load Contents handler class
		$this->load->model('data/contents/Contents', 'contents');
		
		// Get the related contents from the URL and language
		$contents = $this->contents->setLanguage( $this->language )->getByURL( $this->url_string );
		
		// Load Theme handler class
		$this->load->library(['ionize/Theme'=>'theme']);
		//$theme = \Ionize\Theme::getInstance();

		// Assign global variables to theme renderer
		$this->theme->assignData( $this->data );

		// Render the contents
		$output = $this->theme->render( $contents );

		// Set the output
		$this->output->set_output( $output );
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
