<?php namespace Model\Data;

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Settings implements \DataModel
{
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
	 * public $instance Model\Data\Settings Static Reference for this class 
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
	
	/**
	 * private $cache_time int Cache time in seconds
	 */
	private $cache_time = 604800;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/* ------------------------------------------------------------------------------------------------------------- */
	/* Magick Methods ---------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct()
	{
		$codeigniter =& get_instance();
		$codeigniter->benchmark->mark('Model\Data\Settings_class_construct_start');
		
		// Set the cache time from the config file
		$codeigniter->config->load('ionize', TRUE);
		$this->cache_time = $codeigniter->config->config['ionize']['data_model_cache'];
		
		if($codeigniter->session->language != "")
		{
			$cache = $codeigniter->cache->file->get(md5($codeigniter->session->language).'.Settings');
			if($cache != FALSE)
			{
				$settings = unserialize($cache);
				
				// Restore datas from cached class
				$this->_data 		= $settings->_data;
				$this->_raw_data 	= $settings->_raw_data;
				$this->_lang_data 	= $settings->_lang_data;
			}
		}
		
		$codeigniter->benchmark->mark('Model\Data\Settings_class_construct_end');
		
		// Generating class
		$this->initialize();
		
		// Saving instance reference
		self::$instance = $this;
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
		$serialize_array = array('_data','_lang_data');
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
		$codeigniter->benchmark->mark('Model\Data\Settings_class___wakeup_start');
		
		// Initialize class by raw data
		$class = $this->initialize();
		
		// Saving instance reference
		self::$instance = $this;
		
		$codeigniter->benchmark->mark('Model\Data\Settings_class___wakeup_end');
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
		if($this->language != NULL && $this->cache_time > 0)
		{
			$codeigniter =& get_instance();
			// If cache not available then create cache from data
			$cache = $codeigniter->cache->file->get(md5($this->language).'.Settings');
			if($cache == FALSE)
			{
				$codeigniter->benchmark->mark('Model\Data\Settings_class___destruct_start');
				$codeigniter->cache->file->save(md5($this->language).'.Settings', serialize($this), $this->cache_time);
				$codeigniter->benchmark->mark('Model\Data\Settings_class___destruct_end');
			}
		}
   	}
   	/* ------------------------------------------------------------------------------------------------------------- */
   	
	/* ------------------------------------------------------------------------------------------------------------- */
	/* Public Functions -------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */

	public function initialize( $forceSelect = FALSE )
	{
		$codeigniter =& get_instance();
		$codeigniter->benchmark->mark('Model\Data\Settings_class_initialize_start');
		
		if( count($this->_data) == 0 || $forceSelect )
		{
			$codeigniter->benchmark->mark('Model\Data\Settings_class_initialize_query_start');
			$settings = \Model\Database\Settings::get_instance();
			$query = $settings->select('*')->order_by('id_language ASC')->get();
			$codeigniter->benchmark->mark('Model\Data\Settings_class_initialize_query_end');
		
			if($query->num_rows() > 0)
			{
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
		
		$codeigniter->benchmark->mark('Model\Data\Settings_class_initialize_end');
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public static function get_instance()
	{
		return self::$instance;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function is( $type )
	{
		return (strtolower($type) === "settings" ? TRUE : FALSE);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Settings.php */
/* Location: ./ionize/models/data/Settings.php */
