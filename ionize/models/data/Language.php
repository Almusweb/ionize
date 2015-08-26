<?php namespace Model\Data;

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Language implements \DataModel
{
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * private $id integer Id of the language
	 */
	private $id = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * public $instance Model\Data\Language Static Reference for this class 
	 */
	public static $instance = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * public $classes array of loaded Model\Data\Language
	 */
	public static $classes = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * private $_data array Parsed Content data
	 */
	private $_data = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * private $_lang_data array Parsed Content data
	 */
	private $items = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * private $cache_time int Cache time in seconds
	 */
	private $cache_time = 604800;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/* ------------------------------------------------------------------------------------------------------------- */
	/* Magick Methods ---------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct( $data = NULL )
	{
		$codeigniter =& get_instance();
		$codeigniter->benchmark->mark('Model\Data\Language_class_construct_start');
		
		// Set the cache time from the config file
		$codeigniter->config->load('ionize', TRUE);
		$this->cache_time = $codeigniter->config->config['ionize']['data_model_cache'];
		
		$codeigniter->benchmark->mark('Model\Data\Language_class_construct_end');
		
		// Generating class
		$this->initialize( $data );
		
		// If language not saved then save it to session
		if(is_null($codeigniter->session->language))
		{
			$settings = Settings::get_instance();
			$codeigniter->session->language = $settings->language;
		}
		
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
		if ($key == "url")
		{
			$content =& \Output::$current_content;
			$content_data = $content->getData( $this->language );
			if($content_data != FALSE) return $content_data['url'];
			else return '#';
		}
		if ($key == 'items') return $this->items;
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
		$codeigniter->benchmark->mark('Model\Data\Language_class___wakeup_start');
		
		// Initialize class by raw data
		$class = $this->initialize();
		
		// Saving instance reference
		self::$instance = $this;
		
		$codeigniter->benchmark->mark('Model\Data\Language_class___wakeup_end');
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
				$codeigniter->benchmark->mark('Model\Data\Language_class___destruct_start');
				$codeigniter->cache->file->save(md5($this->language).'.Settings', serialize($this), $this->cache_time);
				$codeigniter->benchmark->mark('Model\Data\Language_class___destruct_end');
			}
		}
   	}
   	/* ------------------------------------------------------------------------------------------------------------- */
   	
	/* ------------------------------------------------------------------------------------------------------------- */
	/* Public Functions -------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */

	public function initialize( $data = NULL, $forceSelect = FALSE )
	{
		$codeigniter =& get_instance();
		$codeigniter->benchmark->mark('Model\Data\Language_class_initialize_start');
		
		if(is_object($data))
		{
			$this->_data = (array) $data;
			$this->id = $data->id_language;
			
			self::$classes[ $this->id ] =& $this;
		}
		else if( $data == NULL && count($this->_data) == 0 || $forceSelect )
		{
			$codeigniter->benchmark->mark('Model\Data\Language_class_initialize_query_start');
			$languages = \Model\Database\Language::get_instance(); $query = $languages->get();
			$codeigniter->benchmark->mark('Model\Data\Language_class_initialize_query_end');
			
			if($query->num_rows() > 0)
			{
				$this->_data = $query->result();
				foreach($query->result() as $index => $row)
				{
					if(!array_key_exists($row->id_language, self::$classes))
					{
						$language = new Language( $row );
					}
					
					$this->items[] = $this->_data[ $row->code ] =& self::$classes[ $row->id_language ];
					unset($this->_data[ $index ]);
				}
			}
		}
		
		$codeigniter->benchmark->mark('Model\Data\Language_class_initialize_end');
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
		if( $type == 'active' ) return $this->isActive();
		return (strtolower($type) === "language" ? TRUE : FALSE);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function isActive()
	{
		return ($this->language === current_language() ? TRUE : FALSE);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
}
/* End of file: Settings.php */
/* Location: ./ionize/models/data/Settings.php */
