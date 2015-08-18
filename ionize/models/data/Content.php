<?php namespace Model\Data;

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Content
{
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * public $id integer Content ID or NULL
	 */	
	public $id = NULL;
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
	 * public $childrens array Child Content instances array
	 */
	public static $childrens = array();
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
	
	private $benchmark = NULL;
	private $cache = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $cache_time = 60 * 60 * 24 * 7;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/* ------------------------------------------------------------------------------------------------------------- */
	/* Magick Methods ---------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * __get()
	 *
	 * @param	object	$data	Content object for initialization
	 * @return	void
	 */
	public function __construct( $data = NULL )
	{
		$codeigniter =& get_instance();
		$this->benchmark =& $codeigniter->benchmark;
		$this->cache =& $codeigniter->cache;
		
		$this->benchmark->mark('Content_class_construct_start');
		
		// Generating class from data
		if( $data != NULL ) $this->initialize( $data );
		
		// Saving instance reference
		self::$instance = $this;
		
		$this->benchmark->mark('Content_class_construct_end');
		return $this;
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
	 * During serialization save only the id, raw_data and _data properties
	 *
	 * @return	array
	 */
	public function __sleep()
	{
		$serialize_array = array('id','raw_data','_data');
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
	
		$this->benchmark->mark('Content_class___wakeup_start');
		
		// Initialize class by raw data
		$class = $this->initialize( $this->raw_data );
		
		// Saving instance reference
		self::$instance = $this;
		
		$this->benchmark->mark('Content_class___wakeup_end');
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * __toString()
	 *
	 * If the Class called as String then the output pull be json string
	 *
	 * @return	json
	 */
	public function __toString()
    {
    	$this->benchmark->mark('Content_class___toString_start');
 		$json_data = json_encode($this->_data);
 		$this->benchmark->mark('Content_class___toString_end');
        return $json_data;
    }
    /* ------------------------------------------------------------------------------------------------------------- */
    
    // experimental
    public function __debugInfo()
    {
    	$debug = array();
    	$class_fullname = get_class($this);
    	
    	$codeigniter =& get_instance();
    	$cache_key = md5($class_fullname."::{$this->id}").'.DebugInfo';
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
			
			$codeigniter->cache->file->save($chache_key, serialize($debug), 60*60*24*7*4*12);
		}
		return $debug;
    }
    
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
		if($this->id != NULL)
		{
			// If cache not available then create cache from data
			$cache = $this->cache->file->get(md5($this->id).'.Content');
			if($cache == FALSE)
			{
				$this->benchmark->mark('Content_class___destruct_start');
				$this->cache->file->save(md5($this->id).'.Content', serialize($this), $this->cache_time);
				$this->benchmark->mark('Content_class___destruct_end');
			}
		}
   	}
   	/* ------------------------------------------------------------------------------------------------------------- */
   	
	/* ------------------------------------------------------------------------------------------------------------- */
	/* Public Functions -------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */

    public function initialize( $data )
    {
    	$this->benchmark->mark('Content_class_initialize_start');
    	
    	// Saving data to properties
    	$this->raw_data = $this->_data = (array) $data;
    	
    	// Creating content ID property
    	if($this->id == NULL) $this->id = $data->id_content;
    	
    	// Declarating Children Contents
    	if($this->children != "")
    	{
			$children = explode(',',$this->children);
			if(count($children) > 0)
			{
				foreach($children as $index => $id_content)
				{
					$child_content =& \Model\Data\Content::get_instance()->getByID( $id_content );
					self::$childrens[] = $child_content;
				}
			}
    	}
    	
    	// Create reference to datas for static
    	self::$data = $this->_data;
    	
    	$this->benchmark->mark('Content_class_initialize_end');
    	return $this;
    }
    /* ------------------------------------------------------------------------------------------------------------- */
    
    public static function get_instance()
    {
    	return self::$instance;
    }
    /* ------------------------------------------------------------------------------------------------------------- */
	
	public function getID()
	{
		if($this->id != NULL) return $this->id;
		else
		{
			log_message('ERROR', 'Model\Data\Content->getID(): Data must be loaded first before geting ID');
			throw new RuntimeException('Model\Data\Content->getID(): Data must be loaded first before geting ID');
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getByID( $id = NULL, $forceSelect = FALSE )
	{
		$this->benchmark->mark('Content_class_getByID_start');
		if( $forceSelect === FALSE )
		{
			// Restoring cached data
			$cache = $this->cache->file->get(md5($id).'.Content');
			if($cache != FALSE)
			{
				log_message('DEBUG', 'Model\Data\Content->getByID(): Load Content Data from Cache: #'.$id);
				$this->benchmark->mark('Content_class_getByID_end');
				return unserialize($cache);
			}
			// If cache was unsuccesfull then select the content
			else return $this->getByID( $id, TRUE );
		}
		else if(is_numeric($id))
		{
			$content = \Model\Database\Content::get_instance();
			$query = $content->where('id_content', $id)->get();
			if($query->num_rows() > 0)
			{
				log_message('DEBUG', 'Model\Data\Content->getByID(): Load Content Data from Database: #'.$id);
				$this->benchmark->mark('Content_class_getByID_end');
				return $this->initialize( $query->row() );
			}
		}
		else
		{
			log_message('ERROR', 'Model\Data\Content->getByID(): ID parameter must be numeric type');
			$this->benchmark->mark('Content_class_getByID_end');
			
			// Throwning Exception about invalid parameter
			throw new \InvalidArgumentException('Model\Data\Content->getByID(): ID parameter must be numeric type');
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Content.php */
/* Location: ./ionize/models/data/Content.php */
