<?php
namespace Ionize;

include_once APPPATH.'traits'.DIRECTORY_SEPARATOR.'MagicGet'.PHPEXT;

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
	use \Traits\MagicGet;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	protected $config = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	protected $active = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	protected $layout = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	protected $data = array();
	/* ------------------------------------------------------------------------------------------------------------- */

	protected $view = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	protected $basepath = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */

	protected $path = NULL;
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

		// Save the theme paths
		$this->basepath = key($this->config->themes_basepath) . DIRECTORY_SEPARATOR .'themes' . DIRECTORY_SEPARATOR;
		$this->path = $this->basepath . $this->active . DIRECTORY_SEPARATOR;

		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	
}
