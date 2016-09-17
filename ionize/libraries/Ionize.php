<?php

// Load the MagicGet Trait
require_once APPPATH.'traits'.DIRECTORY_SEPARATOR.'MagicGet'.PHPEXT;

// Load the Ionize Autoloader class
include_once APPPATH.'core/IO_Autoloader.php';

// Load required classes for loading the main content
use \Ionize\Pages\{Pages, Page};
use \Ionize\Articles\{Articles, Article};

/**
 * Class Ionize
 *
 * @method \Ionize\Partial partial() partial()
 * @method \Ionize\Archive archive() archive()
 * @method \Ionize\Navigation navigation() navigation()
 * @method \Ionize\Article article() article()
 * @method \Ionize\Page page() page()
 * @method \Ionize\Writer writer() writer()
 * @method \Ionize\Media media() media()
 * @method \Ionize\Element element() element()
 * @method \Ionize\Item item() item()
 * @method \Ionize\Pagination pagination() pagination()
 * @method \Ionize\Category category() category()
 * @method \Ionize\User user() user()
 * @method \Ionize\Form form() form()
 */
class Ionize
{
	use \Traits\MagicGet;

	private static $instance = NULL;
	private static $_loaded_ionize_elements = array();

	private $theme = NULL;

	private $content = NULL;
	private $contents = array();

	private $acceptedExtensions = array('php');

	/**
	* Ionize constructor
	*/
	public function __construct()
	{
		self::$instance = $this;
		
		$this->theme = Ionize\Theme::getInstance();
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	/**
	* Static getInstance method
	*
	* @return Ionize|null
	*/
	public static function getInstance() : Ionize
	{
		return self::$instance;
	}
	/* ------------------------------------------------------------------------------------------------------------- */


	public function setContent( \Model\Data\Contents\Content $content = NULL ) : Ionize
	{
		$this->content = $content;
		
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	/**
	 * Rendering the webpage
	 *
	 * Getting the layout/view and render the contents of the page
	 *
	 * @returns String Source Code of the webpage
	 */
	public function render() : String
	{
		$layout_file = $this->getLayoutFile('default'); // @todo detect layout type by user agent
		Debug($layout_file, '$layout_file');
		
		$template = $this->parseNativeView( $this->content->view, $this->content->getData() );
		Debug($template, '$template');
		
		extract( $this->content->getData() );
		
		ob_start();
		
		if(file_exists($layout_file)) include( $layout_file );
		else echo $template;
		
		$source_code = ob_get_contents();
		ob_end_clean();

		Debug($source_code, '$source_code');
		return $source_code;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Getting the layout file
	 
	 * @returns String Absolute path of the layout file 
	 */
	private function getLayoutFile( $layout ) : String
	{
		$layouts_path = $this->theme->path.'layouts'.DS;
		Debug($layouts_path, '$layouts_path');
	
		foreach($this->acceptedExtensions as $i => $ext)
			if( file_exists($layouts_path . $layout . '.' . $ext) ) { $layout = $layout . '.' . $ext; break; }
		
		$layout_content = file_get_contents($layouts_path . $layout);
		Debug($layout_content, '$layout_content');
		
		return $layouts_path . $layout;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Getting the layout file
	 
	 * @returns String Absolute path of the layout file 
	 */
	private function getViewFile( $view ) : String
	{
		$views_path = $this->theme->path.'views'.DIRECTORY_SEPARATOR;
		Debug($views_path, '$views_path');
	
		foreach($this->acceptedExtensions as $i => $ext)
			if( file_exists($views_path . $view . '.' . $ext) ) { $view = $view . '.' . $ext; break; }
		
		$view_content = file_get_contents($views_path . $view);
		Debug($view_content, '$view_content');
		
		return $views_path . $view;
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	/**
	* Parse theme view file
	*
	* @param string $view
	* @param array $data
	* @param string $layout
	* @return string
	*/
	public function parseNativeView( $view, $data=array() )
	{
		$view_file = $this->getViewFile( $view );
	
		ob_start();
		extract($data);
		
		include( $view_file );

		$source_code = ob_get_contents();
		ob_end_clean();

		return $source_code;
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	/**
	* Parse theme view file
	*
	* @param string $view
	* @param array $data
	* @param string $layout
	*/
	public function parseIonizeView( $view, $data=array() )
	{
		// @todo Make Ionize Parser
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	/**
	* Parse theme view file
	*
	* @param string $template
	* @param string $view
	* @param array $data
	* @param string $layout
	*/
	public function parseTemplateView( $template, $view, $data=array() )
	{
		// @todo Handle template engines
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	/**
	* Static Magic Method
	*
	* @param string $name
	* @param array $arguments
	* @return mixed
	*/
	public static function __callStatic( $name, $arguments=array() )
	{
		if(method_exists(get_class(), $name))
		{
			return call_user_func_array(array(get_class(),$name),$arguments);
		}
		else
		{
			$loaded = FALSE;

			$class_name = ucwords(strtolower($name));
			$namespaced_name = "\\Ionize\\{$class_name}";
			$filepath = APPPATH."libraries/ionize/{$class_name}".PHPEXT;

			if(file_exists($filepath))
			{
				require_once($filepath);

				$class = new $namespaced_name( $arguments );

				$loaded = TRUE;

				return $class;
			}

			if($loaded == FALSE)
			{
				$namespaced_name = "\\Ionize\\{$class_name}\\{$class_name}";
				$filepath = APPPATH."libraries/ionize/".strtolower($class_name)."/{$class_name}".PHPEXT;

				if(file_exists($filepath))
				{
					require_once($filepath);

					$class = new $namespaced_name( $arguments );

					$loaded = TRUE;

					return $class;
				}
			}

			if($loaded == FALSE)
				throw new \Exception('Unable to load the specified class: '.$namespaced_name.' in path: '.$filepath);
		}
	}
}
