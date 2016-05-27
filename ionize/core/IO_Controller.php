<?php
/* ----------------------------------------------------------------------------------------------------------------- */

// Load the module controller class
include_once APPPATH.'core/HMVC/Controller.php';

/* ----------------------------------------------------------------------------------------------------------------- */

/**
 * Ionize Controller class
 *
 * Loading the configuration, the language and the settings for fourther work. Also extending HMVC Controller
 * so the extends of this class will have work as a HMVC module controller.
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
 */
class IO_Controller extends HMVC_Controller
{
	/**
	 * @var string $language ISO 639-1 Alpha2 language code
	 */
	protected $language = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var object $ionize Ionize configuration
	 */
	protected $ionize = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var \Libraries\Settings $settings Instance of settings
	 */
	protected $settings = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var FALSE|string $hhvm HHVM version number if available or FALSE
	 */
	protected $hhvm = FALSE;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var array $data Array of the elements for the output view file
	 */
	public $data = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Magick Constructor
	 *
	 * where the initializations happening, loading the configuration and the settings
	 *
	 * @since: 2016.05.27.
	 */
	public function __construct()
	{
		parent::__construct();
		
		$http = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off' ? 'https' : 'http';
		$this->data['base_url'] = sprintf("%s://%s%s",$http,$_SERVER['SERVER_NAME'],$_SERVER['REQUEST_URI']);
		
		// Detect HHVM
		$this->hhvm = (defined('HHVM_VERSION') ? HHVM_VERSION : FALSE);
		
		// Load the ionize config
		$this->config->load('ionize', TRUE);
		$this->ionize = (object) $this->config->config['ionize'];
		
		// Initialize the Language
		$this->initalizeLanguage();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private function initalizeLanguage()
	{
		$http_accept_language = $_SERVER["HTTP_ACCEPT_LANGUAGE"];
		$available_languages = array_flip( $this->ionize->languages );

		$languages = array();
		preg_match_all('~([\w-]+)(?:[^,\d]+([\d.]+))?~', strtolower($http_accept_language), $matches, PREG_SET_ORDER);
		
		// Moving trough all match
		foreach($matches as $match)
		{
			// Creating array from the ISO3166/ALPHA2-ISO639/ALPHA2 format
		    list($a, $b) = explode('-', $match[1]) + array('', '');
		    
		    // If the second segment exists then calculate with that
		    $value = isset($match[2]) ? (float) $match[2] : 1.0;

			// If that language available
		    if(isset($available_languages[$match[1]]))
		    {
		    	// then add to the possible languages
		        $languages[$match[1]] = $value;
		        continue;
		    }
			
			// If the country and the langauge code is same then downgrade the priority
		    if(isset($available_languages[$a])) $languages[$a] = $value - 0.1;

		}
		
		// Order by priorty
		arsort($languages);
		
		// Saving the language from the browser language
		$this->language = key($languages);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* ----------------------------------------------------------------------------------------------------------------- */
/* End of file: IO_Controller.php */
/* Location: ./ionize/core/IO_Controller.php */
