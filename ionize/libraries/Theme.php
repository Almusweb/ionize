<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Theme
{
	/* ------------------------------------------------------------------------------------------------------------- */
	private $codeigniter = NULL;
	private $config = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	private $check_folders = array
	(
		'config','.cache','.compile','language','libraries','views'
	);
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $default_lang_file = "<?php defined('BASEPATH') OR exit('No direct script access allowed');\n\n\n";
	/* ------------------------------------------------------------------------------------------------------------- */

	public static $folder = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	public $languages = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	public function __construct()
	{
		// Create pointer to codeigniter and the config class
		$this->codeigniter =& get_instance();
		$this->config =& $this->codeigniter->config;
		
		// Load the ionize config
		$this->config->load('ionize', TRUE);
		
		// Load the theme folder and the languages
		self::$folder = $this->config->config['ionize']['theme'];
		$this->languages = $this->config->item('languages');
		
		// Check the Theme folder
		$this->_checkTheme();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public static function getRoute()
	{
		return FCPATH.'themes/'.self::$folder.'/';
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public static function getRelativeRoute()
	{
		return '../../themes/'.self::$folder.'/';
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private function _checkTheme()
	{
		$theme_route = $this->getRoute();
		if( file_exists( $theme_route ))
		{
			if( ! file_exists( $theme_route.'.check_result' ) )
			{
				// Checking the theme folders and create the missing folders
				foreach($this->check_folders as $folder) $this->_checkThemeFolder($theme_route, $folder);
			
				// Checking the theme language folders and create the missing folders and default language file
				foreach($this->languages as $language) $this->_checkThemeLanguage($theme_route.'language/', $language);
				
				// Create theme check file to cache the check
				file_put_contents( $theme_route.'.check_result', md5( $theme_route ) );
			}
		}
		else show_error(lang('error_theme_not_exists').'<br/><br/>'.$theme_route, 500);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private function _checkThemeFolder($route, $folder)
	{
		if( ! file_exists( $route.$folder ))
		{
			mkdir( $route.$folder, 0777 );		
			chmod( $route.$folder, 0777 );
		}
		return TRUE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private function _checkThemeLanguage($route, $language)
	{
		if( ! file_exists( $route.$language ))
		{
			mkdir( $route.$language, 0777 );
			file_put_contents( $route.$language.'/Theme_lang.php', $this->default_lang_file );
			chmod( $route.$language, 0777 );
		}
		return TRUE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Theme.php */
/* Location: ./ionize/libraries/Theme.php */
