<?php

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
	private static $instance = NULL;
	private static $_loaded_ionize_elements = array();

	protected $contents = array();
	private $acceptedExtensions = ['php','tpl'];

	/**
	* Ionize constructor
	*/
	public function __construct()
	{
		self::$instance = $this;
	}

	/**
	* Static getInstance method
	*
	* @return Ionize|null
	*/
	public static function getInstance()
	{
		if( self::$instance instanceof \Ionize\Ionize ) return self::$instance;
		else return new self;
	}

	/**
	* Parse theme view file
	*
	* @param string $view
	* @param array $data
	* @param string $layout
	* @return string
	*/
	public function parseNativeView( $view, $data=array(), $layout=NULL )
	{
		ob_start();
		extract($data);

		if(isset($contents)) $this->contents = $contents;

		foreach($this->acceptedExtensions as $i => $ext)
			if( file_exists($view.'.'.$ext) ) { $view = $view.'.'.$ext; break; }

		include( $view );

		$source_code = ob_get_contents();
		ob_end_clean();

		return $source_code;
	}

	/**
	* Parse theme view file
	*
	* @param string $view
	* @param array $data
	* @param string $layout
	*/
	public function parseIonizeView( $view, $data=array(), $layout=NULL )
	{
		get_instance()->benchmark->mark('Ionize_parseIonizeView_start');

		foreach($this->acceptedExtensions as $i => $ext)
			if( \file_exists($view.'.'.$ext) ) { $view = $view.'.'.$ext; break; }

		$viewtime = \filemtime($view);
		Debug($viewtime, '$viewtime');

		$compiled_view = str_replace('views'.DIRECTORY_SEPARATOR,'compile'.DIRECTORY_SEPARATOR, $view);
		Debug($compiled_view, 'check compiled file existence');

		if( \file_exists($compiled_view) )
		{
			$cachetime = file_get_contents($compiled_view.'.time');

			if($cachetime == $viewtime)
			{
				get_instance()->benchmark->mark('Ionize_parseIonizeView_end');
				return $this->parseNativeView($compiled_view, $data, $layout);
			}
		}

		// Parsing the template
		{
			get_instance()->benchmark->mark('Ionize_parseIonizeView_parse_start');

			require_once('ionize/Parser.php');
			$ionizeParser = new \Ionize\Parser();

			$view_source = file_get_contents($view);
			$parsed_source = $ionizeParser->parse( $view_source );

			$permissionMasking = umask(0);

			// Create Folder if needed
			{
				$segments = explode(DIRECTORY_SEPARATOR, $compiled_view);
				unset($segments[count($segments)-1]);

				$path = implode(DIRECTORY_SEPARATOR, $segments);
				if(!file_exists($path)) mkdir($path, 0777, TRUE);
			}

			file_put_contents($compiled_view, $parsed_source);
			chmod($compiled_view, 0777);

			file_put_contents($compiled_view.'.time', $viewtime);
			chmod($compiled_view.'.time', 0777);

			umask($permissionMasking);

			get_instance()->benchmark->mark('Ionize_parseIonizeView_parse_end');
			get_instance()->benchmark->mark('Ionize_parseIonizeView_end');
			return $this->parseNativeView($compiled_view, $data, $layout);
		}
	}

	/**
	* Parse theme view file
	*
	* @param string $template
	* @param string $view
	* @param array $data
	* @param string $layout
	*/
	public function parseTemplateView( $template, $view, $data=array(), $layout=NULL )
	{
		// @todo Handle template engines
	}

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
			$class_name = ucwords(strtolower($name));

			if( !isset(self::$_loaded_ionize_elements[ $class_name ]) )
			{
				$namespaced_name = "\\Ionize\\{$class_name}";
				require_once("ionize/{$class_name}.php");

				$class = new $namespaced_name( $arguments );
				self::$_loaded_ionize_elements[ $class_name ] = $class;

				return $class;
			}
			else return self::$_loaded_ionize_elements[ $class_name ];
		}
	}
}