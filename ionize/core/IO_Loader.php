<?php
/* ----------------------------------------------------------------------------------------------------------------- */

// Load the module loader class
include_once APPPATH.'core/HMVC/Loader.php';

// Load the Ionize Autoloader class
include_once APPPATH.'core/IO_Autoloader.php';

/* ----------------------------------------------------------------------------------------------------------------- */

/**
 * Extending the Loader class
 *
 * Adding auto-namespace and abstract detection and loading for the models and libraries
 *
 * @package Ionize
 * @subpackage Core
 *
 * @author	Ádám Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class IO_Loader extends HMVC_Loader
{
	public function __construct()
	{
		parent::__construct();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Model Loader
	 * Loads and instantiates models.
	 *
	 * @param string $model
	 *        	Model name
	 * @param string $name
	 *        	An optional object name to assign to
	 * @param bool $db_conn
	 *        	An optional database connection configuration to initialize
	 * @return object
	 */
	public function model( $model, $name = NULL, $db_conn = FALSE )
	{
		if ( empty($model) )
		{
			return $this;
		}
		elseif ( is_array($model) )
		{
			foreach ( $model as $key => $value )
				is_int($key) ? $this->model($value, '', $db_conn) : $this->model($key, $value, $db_conn);
			
			return $this;
		}
		
		$path = '';
		
		// Is the model in a sub-folder? If so, parse out the filename and path.
		if ( ($last_slash = strrpos($model, '/')) !== FALSE )
		{
			// The path is in front of the last slash
			$path = substr($model, 0, ++ $last_slash);
			
			// And the model name behind it
			$model = substr($model, $last_slash);
		}
		
		if ( !empty($name) && in_array($name, $this->_ci_models, TRUE) )
		{
			return $this;
		}
		
		$CI = & get_instance();/* ----------------------------------------------------------------------------------------------------------------- */
		if ( $name != FALSE && isset($CI->$name) )
		{
			throw new RuntimeException('The model name you are loading is the name of a resource that is already being used: ' . $name);
		}
		
		if ( $db_conn !== FALSE && ! class_exists('CI_DB', FALSE) )
		{
			if ( $db_conn === TRUE ) $db_conn = '';
			$this->database($db_conn, FALSE, TRUE);
		}
		
		// If CodeIgniter model is not loaded then load it
		if ( ! class_exists('CI_Model', FALSE) ) load_class('Model', 'core');
		
		// If class is not exist then load it
		$namespace = 'Model\\'; $parts = explode('/', $path);
		foreach ( $parts as $dir ) $namespace .= (empty($dir) ? '' : ucfirst($dir).'\\');
		
		if ( ! class_exists($model, FALSE) || (class_exists($model, FALSE) && ! class_exists($namespace . $model, FALSE)) )
		{
			foreach ( $this->_ci_model_paths as $mod_path )
			{
				if ( ! file_exists($mod_path . 'models/' . $path . $model . '.php') )
				{
					continue;
				}

				Debug($mod_path . 'models/' . $path . $model . '.php', 'Require_once');
				require_once ($mod_path . 'models/' . $path . $model . '.php');
				
				if ( class_exists($namespace . $model, TRUE) )
				{
					$model = $namespace . $model;
				}
				elseif ( ! class_exists($model, FALSE) )
				{
					throw new RuntimeException($mod_path . "models/" . $path . $model . ".php exists, but doesn't declare class " . $model . " or " . $namespace . $model);
				}
				
				break;
			}
			
			if ( ! class_exists($model, FALSE) && ! class_exists($namespace . $model, FALSE) )
			{
				if ( ! class_exists($namespace . $model, FALSE) )
				{
					throw new RuntimeException('Unable to locate the model you have specified: ' . $namespace . $model . ' in file: '.$mod_path . 'models/' . $path . $model . '.php');
				}
				else throw new RuntimeException('Unable to locate the model you have specified: ' . $model . ' in file: '.$mod_path . 'models/' . $path . $model . '.php');
			}
		}
		elseif ( ! is_subclass_of($model, 'CI_Model') )
		{
			throw new RuntimeException("Class " . $model . " already exists and doesn't extend CI_Model");
		}
		
		$class = new ReflectionClass($model);
		$abstract = $class->isAbstract();
		
		if ( ! $abstract )
		{
			if ( !empty($name) )
			{
				$this->_ci_models[] = $name;
				$CI->$name = new $model();

				return $CI->$name;
			}

			if ( $class->hasMethod('getInstance') )
			{
				return $model::getInstance();
			}

			return new $model();
		}

		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Internal CI Library Loader
	 *
	 * @used-by	CI_Loader::library()
	 * @uses	CI_Loader::_ci_init_library()
	 *
	 * @param	string	$class		Class name to load
	 * @param	mixed	$params		Optional parameters to pass to the class constructor
	 * @param	string	$object_name	Optional object name to assign to
	 * @return	void
	 */
	protected function _ci_load_library($class, $params = NULL, $object_name = NULL)
	{
		// Get the class name, and while we're at it trim any slashes.
		// The directory path can be included as part of the class name,
		// but we don't want a leading slash
		$class = str_replace('.php', '', trim($class, '/'));
	
		// Was the path included with the class name?
		// We look for a slash to determine this
		if (($last_slash = strrpos($class, '/')) !== FALSE)
		{
			// Extract the path
			$subdir = substr($class, 0, ++$last_slash);
	
			// Get the filename from the path
			$class = substr($class, $last_slash);
		}
		else
		{
			$subdir = '';
		}
	
		// Is this a stock library? There are a few special conditions if so ...
		if (file_exists(BASEPATH.'libraries/'.ucfirst($subdir).ucfirst($class).'.php'))
		{
			return $this->_ci_load_stock_library(ucfirst($class), ucfirst($subdir), $params, NULL);
		}
		
		// If class is not exist then load it
		$namespace = 'Libraries\\'; $parts = explode('/', $subdir);
		foreach ( $parts as $dir ) $namespace .= (empty($dir) ? '' : ucfirst($dir).'\\');
		
		// Let's search for the requested library file and load it.
		foreach ($this->_ci_library_paths as $path)
		{
			// BASEPATH has already been checked for
			if ($path === BASEPATH)
			{
				continue;
			}
			
			$filepath = $path.'libraries/'.$subdir.$class.'.php';
			//Debug( $filepath, '$filepath' );
			
			// Safety: Was the class already loaded by a previous call?
			if (class_exists($class, FALSE) || class_exists($namespace.$class, FALSE) || class_exists(str_replace('Libraries\\','',$namespace).$class, FALSE))
			{
				if( ! class_exists($namespace.$class) && class_exists(str_replace('Libraries\\','',$namespace).$class) ) $namespace = str_replace('Libraries\\','',$namespace);
				else if( ! class_exists($namespace.$class) ) $namespace = '';
				
				// Before we deem this to be a duplicate request, let's see
				// if a custom object name is being supplied. If so, we'll
				// return a new instance of the object
				if ($object_name !== NULL)
				{
					$CI =& get_instance();
					if ( ! isset($CI->$object_name))
					{
						//Debug($namespace.$class, 'Init Library');
						return $this->_ci_init_library($class, $namespace, $params, $object_name);
					}
				}
	
				log_message('debug', $class.' class already loaded. Second attempt ignored.');
				return;
			}
			// Does the file exist? No? Bummer...
			elseif ( ! file_exists($filepath))
			{
				continue;
			}
			
			//Debug( $filepath, 'Include Once' );
			include_once($filepath);
			
			if( ! class_exists($namespace.$class) )
			{
				$namespace = str_replace('Libraries\\','', $namespace);
				if( ! class_exists($namespace.$class) ) $namespace = '';
			}
			//Debug( $namespace.$class, 'Loaded Class' );
			
			//Debug($namespace.$class, 'Init Library');
			return $this->_ci_init_library($namespace.$class, '', $params, $object_name);
		}
	
		// One last attempt. Maybe the library is in a subdirectory, but it wasn't specified?
		if ($subdir === '')
		{
			//Debug(ucfirst($class).'/'.ucfirst($class), 'Load Library');
			return $this->_ci_load_library($class.'/'.$class, $params, $object_name);
		}
	
		// If we got this far we were unable to find the requested class.
		log_message('error', 'Unable to load the requested class: '.$class);
		show_error('Unable to load the requested class: '.$class);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Internal CI Stock Library Loader
	 *
	 * @used-by	CI_Loader::_ci_load_library()
	 * @uses	CI_Loader::_ci_init_library()
	 *
	 * @param	string	$library	Library name to load
	 * @param	string	$file_path	Path to the library filename, relative to libraries/
	 * @param	mixed	$params		Optional parameters to pass to the class constructor
	 * @param	string	$object_name	Optional object name to assign to
	 * @return	void
	 */
	protected function _ci_load_stock_library($library_name, $file_path, $params, $object_name)
	{
		//Debug([$library_name, $file_path, $params, $object_name], 'Load Stock Library:');
	
		$prefix = 'CI_';

		if (class_exists($prefix.$library_name, FALSE))
		{
			if (class_exists(config_item('subclass_prefix').$library_name, FALSE))
			{
				$prefix = config_item('subclass_prefix');
			}

			// Before we deem this to be a duplicate request, let's see
			// if a custom object name is being supplied. If so, we'll
			// return a new instance of the object
			if ($object_name !== NULL)
			{
				$CI =& get_instance();
				if ( ! isset($CI->$object_name))
				{
					return $this->_ci_init_library($library_name, $prefix, $params, $object_name);
				}
			}

			log_message('debug', $library_name.' class already loaded. Second attempt ignored.');
			return;
		}

		$paths = $this->_ci_library_paths;
		array_pop($paths); // BASEPATH
		array_pop($paths); // APPPATH (needs to be the first path checked)
		array_unshift($paths, APPPATH);
		
		if($object_name == NULL) $object_name = strtolower($library_name);

		foreach ($paths as $path)
		{
			if (file_exists($path = $path.'libraries/'.$file_path.$library_name.'.php'))
			{
				// Override
				include_once($path);
				if (class_exists($prefix.$library_name, FALSE))
				{
					return $this->_ci_init_library($library_name, $prefix, $params, $object_name);
				}
				else
				{
					log_message('debug', $path.' exists, but does not declare '.$prefix.$library_name);
				}
			}
		}

		include_once(BASEPATH.'libraries/'.$file_path.$library_name.'.php');

		// Check for extensions
		$subclass = config_item('subclass_prefix').$library_name;
		foreach ($paths as $path)
		{
			if (file_exists($path = $path.'libraries/'.$file_path.$subclass.'.php'))
			{
				include_once($path);
				if (class_exists($subclass, FALSE))
				{
					$prefix = config_item('subclass_prefix');
					break;
				}
				else
				{
					log_message('debug', $path.' exists, but does not declare '.$subclass);
				}
			}
		}

		return $this->_ci_init_library($library_name, $prefix, $params, $object_name);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Internal CI Library Instantiator
	 *
	 * @used-by	CI_Loader::_ci_load_stock_library()
	 * @used-by	CI_Loader::_ci_load_library()
	 *
	 * @param	string		$class		Class name
	 * @param	string		$prefix		Class name prefix
	 * @param	array|null|bool	$config		Optional configuration to pass to the class constructor:
	 *						FALSE to skip;
	 *						NULL to search in config paths;
	 *						array containing configuration data
	 * @param	string		$object_name	Optional object name to assign to
	 * @return	void
	 */
	protected function _ci_init_library($class, $prefix, $config = FALSE, $object_name = NULL)
	{
		//Debug([$class, $prefix, $config, $object_name], 'Init Library:');
	
		// Is there an associated config file for this class? Note: these should always be lowercase
		if ($config === NULL)
		{
			// Fetch the config paths containing any package paths
			$config_component = $this->_ci_get_component('config');
	
			if (is_array($config_component->_config_paths))
			{
				$found = FALSE;
				foreach ($config_component->_config_paths as $path)
				{
					// We test for both uppercase and lowercase, for servers that
					// are case-sensitive with regard to file names. Load global first,
					// override with environment next
					if (file_exists($path.'config/'.strtolower($class).'.php'))
					{
						include($path.'config/'.strtolower($class).'.php');
						$found = TRUE;
					}
					elseif (file_exists($path.'config/'.ucfirst(strtolower($class)).'.php'))
					{
						include($path.'config/'.ucfirst(strtolower($class)).'.php');
						$found = TRUE;
					}
	
					if (file_exists($path.'config/'.ENVIRONMENT.'/'.strtolower($class).'.php'))
					{
						include($path.'config/'.ENVIRONMENT.'/'.strtolower($class).'.php');
						$found = TRUE;
					}
					elseif (file_exists($path.'config/'.ENVIRONMENT.'/'.ucfirst(strtolower($class)).'.php'))
					{
						include($path.'config/'.ENVIRONMENT.'/'.ucfirst(strtolower($class)).'.php');
						$found = TRUE;
					}
	
					// Break on the first found configuration, thus package
					// files are not overridden by default paths
					if ($found === TRUE)
					{
						break;
					}
				}
			}
		}
	
		$class_name = $prefix.$class;
	
		// Is the class name valid?
		if ( ! class_exists($class_name, FALSE))
		{
			log_message('error', 'Non-existent class: '.$class_name);
			show_error('Non-existent class: '.$class_name);
		}
	
		// Set the variable name we will assign the class to
		// Was a custom class name supplied? If so we'll use it
		/* if (empty($object_name))
		{
			$object_name = strtolower($class);
			if (isset($this->_ci_varmap[$object_name]))
			{
				$object_name = $this->_ci_varmap[$object_name];
			}
		} */
	
		// Don't overwrite existing properties
		$CI =& get_instance();
		if (isset($CI->$object_name))
		{
			if ($CI->$object_name instanceof $class_name)
			{
				log_message('debug', $class_name." has already been instantiated as '".$object_name."'. Second attempt aborted.");
				return;
			}
	
			show_error("Resource '".$object_name."' already exists and is not a ".$class_name." instance.");
		}
	
		// Save the class name and object name
		$this->_ci_classes[$object_name] = $class;
		
		$class = new ReflectionClass($class_name);
		$abstract = $class->isAbstract();
		
		if ( ! $abstract )
		{
			if(!empty($object_name))
			{
				// Instantiate the class
				$CI->$object_name = isset($config)
				? new $class_name($config)
				: new $class_name();
			}
		}
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	
}
/* ----------------------------------------------------------------------------------------------------------------- */
/* End of file IO_Loader.php */
/* Location: ./ionize/core/IO_Loader.php */
