<?php
namespace Ionize;

/**
 * Theme class
 *
 * Getting the content by URL calling the theme parser for determinate the theme view files and execute them.
 *
 * @package Ionize
 * @subpackage Core
 *
 * @author	Ádám Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Theme
{
	protected $config = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	protected $active = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	protected $layout = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	protected $data = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private static $instance = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	/**
	 * Theme constructor
	 */
	public function __construct()
	{
		// Initialize if necessary
		if($this->active == NULL) $this->initialize();

		// Save the instance
		self::$instance =& $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	/**
	 * @return \Ionize\Theme|NULL
	 */
	public static function getInstance()
	{
		if( self::$instance instanceof \Ionize\Theme ) return self::$instance;
		else return new self;
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	/**
	 * @return $this
	 */
	public function initialize()
	{
		// Load Ionize configuration file
		$ci = get_instance(); $ci->config->load('ionize', TRUE);
		$this->config = (object) $ci->config->config['ionize'];

		// Save the active Theme name
		$this->active = $this->config->theme;

		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	/**
	 * @param \Contents\Content[] $contents
	 */
	public function render( array $contents = array() )
	{
		if(count($contents) > 0)
		{
			$main_content = $contents[0];
			$view_name = $main_content->getView();

			$view_path = $this->getView( $view_name );
			if($view_path != FALSE)
			{
				$this->getLayout( $main_content );
				$this->assignData('contents', $contents);
				return $this->parseView( $view_path );
			}
		}
		else show_404();
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	/**
	 * @param string|string[] $name property name
	 * @param mixed $value property value
	 * @return bool
	 */
	public function assignData( $name, $value=NULL )
	{
		if(is_array($name))
		{
			foreach($name as $n => $v) $this->assignData($n, $v);
			return TRUE;
		}
		
		$this->data[$name] = $value;
		return TRUE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getLayout()
	{
		
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getView( $view_name )
	{
		$themes_path = key($this->config->themes_basepath) . DIRECTORY_SEPARATOR .'themes' . DIRECTORY_SEPARATOR;
		$view_path = $this->active . DIRECTORY_SEPARATOR . 'views' . DIRECTORY_SEPARATOR . $view_name;

		$file_path = $themes_path . $view_path;
		if(strpos('.php', $file_path) == FALSE) $file_path = $file_path.'.php';

		if(file_exists($file_path)) return $themes_path . $view_path;
		else show_error('Theme view file is missing: ' . $themes_path . $view_path, 500);

		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	public function parseView( $file_path )
	{
		$method = $this->config->theme_parser;
		$ionize = \Ionize::getInstance();

		switch( $method )
		{
			case "ionize":
				return $ionize->parseIonizeView( $file_path, $this->data, $this->layout);
				break;

			case "native":
				return $ionize->parseNativeView( $file_path, $this->data, $this->layout);
				break;

			default:
				return $ionize->parseTemplateView( $method, $file_path, $this->data, $this->layout);
				break;
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
