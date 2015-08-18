<?php namespace Model\Data;

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Settings
{
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * protected $raw_data array Content RAW data from database
	 */
	protected $raw_data = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * public $data array Content parsed data from $_data
	 */
	public static $data = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * public $data array Content parsed data from $_data
	 */
	public static $lang = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * public $instance Model\Data\Content Static Reference for this class 
	 */
	public static $instance = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * private $_data array Parsed Content data
	 */
	private $_data = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * private $_lang_data array Parsed Content data
	 */
	private $_lang_data = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $benchmark = NULL;
	private $cache = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $cache_time = 60 * 60 * 24 * 7;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/* ------------------------------------------------------------------------------------------------------------- */
	/* Magick Methods ---------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct()
	{
		$codeigniter =& get_instance();
		$this->benchmark =& $codeigniter->benchmark;
		$this->cache =& $codeigniter->cache;
		
		$this->benchmark->mark('Settings_class_construct_start');
		
		if($codeigniter->session->language != "")
		{
			$cache = $this->cache->file->get(md5($codeigniter->session->language).'.Settings');
			if($cache == FALSE)
			{
				$settings = unserialize($cache);
				
				// Restore datas from cached class
				$this->_data 		= $settings->_data;
				$this->_raw_data 	= $settings->_raw_data;
				$this->_lang_data 	= $settings->_lang_data;
			}
		}
		
		// Generating class
		$this->initialize();
		
		// Saving instance reference
		self::$instance = $this;
		
		$this->benchmark->mark('Settings_class_construct_end');
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * __get()
	 *
	 * @param	string	$key	Content data key
	 * @return	mixed
	 */
	public function __get($key)
	{
		if (isset($this->_data[$key])) return $this->_data[$key];
		return NULL;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * __set()
	 *
	 * @param	string	$key	Content data key
	 * @param	mixed	$value	Content data value
	 * @return	void
	 */
	public function __set($key, $value)
	{
		$this->_data[$key] = $value;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * __sleep()
	 *
	 * During serialization save only the id, raw_data, _data and _lang_data properties
	 *
	 * @return	array
	 */
	public function __sleep()
	{
		$serialize_array = array('raw_data','_data','_lang_data');
		return $serialize_array;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * __wakeup()
	 *
	 * After unserialize reinitialize the class
	 *
	 * @return	void
	 */
	public function __wakeup()
	{
		$codeigniter =& get_instance();
		$this->benchmark =& $codeigniter->benchmark;
		$this->cache =& $codeigniter->cache;
	
		$this->benchmark->mark('Settings_class___wakeup_start');
		
		// Initialize class by raw data
		$class = $this->initialize();
		
		// Saving instance reference
		self::$instance = $this;
		
		$this->benchmark->mark('Settings_class___wakeup_end');
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	// experimental
	public function __debugInfo()
	{
		$debug = array();
		$class_fullname = get_class($this);
		
		$codeigniter =& get_instance();
		$cache_key = md5($class_fullname."::{$this->language}").'.DebugInfo';
		$cache_info = $codeigniter->cache->file->get($cache_key);
		if($cache_info != FALSE)
		{
			return unserialize($cache_info);
		}
		else
		{
			$class = new \ReflectionClass( $class_fullname );
			$class_name = $class->getShortName();
			
			$filter_properties = array('instance');
			$properties = $class->getProperties(\ReflectionMethod::IS_STATIC+\ReflectionMethod::IS_PUBLIC);
		
			// Properties
			foreach($properties as $prop)
			{
				if(!in_array($prop->name, $filter_properties))
				{
					$prefix = implode(':',\Reflection::getModifierNames($prop->getModifiers()));
					$name = "$prefix:\${$prop->name}";
				
					$debug[$name] = ($prop->isStatic() ? $this::${$prop->name} : $this->{$prop->name});
				}
			}
			
			// Methods
			$filter_methods = array('__construct', '__destruct', '__call', '__callStatic', '__get', '__set', '__isset',
									'__unset', '__sleep', '__wakeup', '__toString', '__invoke', '__set_state', '__clone',
									'__debugInfo');
		   			
			$methods = $class->getMethods(\ReflectionMethod::IS_STATIC+\ReflectionMethod::IS_PUBLIC);
			foreach($methods as $method)
			{
				if(!in_array($method->name, $filter_methods))
				{
					$prefix = implode(':',\Reflection::getModifierNames($method->getModifiers()));
					$name = "$prefix:{$method->name}";
				
					$params = $method->getParameters(); $parameters = array();
					foreach($params as $i => $param) $parameters[] = "\${$param->name}";
				
					$class_call = "$class_name->"; if($method->isStatic()) $class_call = "\\$class_fullname::";
					$debug[$name] = "{$class_call}{$method->name}(".implode(', ', $parameters).")";
				}
			}
			
			$codeigniter->cache->file->save($cache_key, serialize($debug), 60*60*24*7*4*12);
		}
		return $debug;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * __destruct()
	 *
	 * Saving the Content data to the cache folder
	 *
	 * @return	void
	 */
	function __destruct()
	{
		// If has data to cache
		if($this->language != NULL)
		{
			// If cache not available then create cache from data
			$cache = $this->cache->file->get(md5($this->language).'.Settings');
			if($cache == FALSE)
			{
				$this->benchmark->mark('Settings_class___destruct_start');
				$this->cache->file->save(md5($this->language).'.Settings', serialize($this), $this->cache_time);
				$this->benchmark->mark('Settings_class___destruct_end');
			}
		}
   	}
   	/* ------------------------------------------------------------------------------------------------------------- */
   	
	/* ------------------------------------------------------------------------------------------------------------- */
	/* Public Functions -------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */

	public function initialize( $forceSelect = FALSE )
	{
		$this->benchmark->mark('Settings_class_initialize_start');
		
		if( count($this->_data) == 0 || $forceSelect )
		{
			$settings = \Model\Database\Settings::get_instance();
			$query = $settings->select('*')->order_by('id_language ASC')->get();
		
			if($query->num_rows() > 0)
			{
				$this->_raw_data = $query->result();
				foreach($query->result() as $row)
				{
					if(empty($row->id_language))
					{
						// Adding items to Settings
						$this->_data[$row->name] = $row->value;
					}
					else
					{
						// If Language settings array not created then create it
						if(!array_key_exists($row->language, $this->_lang_data))
						{
							$this->_lang_data[$row->language]=array();
						}
					
						// Adding items to Language settings
						$this->_lang_data[$row->language][$row->name] = $row->value;
					}
				}
			
				// Adding Current Language Settings to the global settings
				if($this->language != NULL && array_key_exists($this->language, $this->_lang_data))
					$this->_data = array_merge($this->_data, $this->_lang_data[$this->language]);
			}
		}
		
		// Create reference to datas for static
		self::$data = $this->_data;
		self::$lang = $this->_lang_data;
		
		$this->benchmark->mark('Settings_class_initialize_end');
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public static function get_instance()
	{
		return self::$instance;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Settings.php */
/* Location: ./ionize/models/data/Settings.php */
