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
 */
class Output extends IO_Controller
{
	private $url = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $url_string = '';
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $contents = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $urls = NULL;
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
		// Get instance of the urls handler class
		$this->urls = Model\Data\Urls\Urls::getInstance();
		
		// Get the related contents from the URL and language
		$url = $this->urls->setBaseURL( $this->base_url )->setLanguage( $this->language )->getByURL( $this->url_string );
		
		if( $url->id_url != NULL )
		{
			// Get instance of the contents handler class
			$this->contents = Model\Data\Contents\Contents::getInstance();

			// Get the related contents from the URL and language
			$content = $this->contents->setLanguage( $this->language )->getByID( $url->id_content );
		
			// Load Theme handler class
			$ionize = Ionize::getInstance();
		
			// Add conttents data to the Ionize
			$ionize->setContent( $content );
		
			// Render the webpage
			$output = $ionize->render();
			Debug($output, '$output');
		
			// Set the output
			$this->output->set_output( $output );
		}
		else show_404();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
