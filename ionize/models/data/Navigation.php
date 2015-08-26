<?php namespace Model\Data;

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Navigation implements \DataModel
{
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var $id integer Content ID or NULL
	 * @access private
	 */	
	private $id = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var $data array Content parsed data from $_data
	 * @access public static
	 */
	public static $classes = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var $instance \Data\Content Static Reference for this class 
	 * @access public static
	 */
	public static $instance = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var $_data array Parsed Content data
	 * @access private
	 */
	private $_data = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var $childrens array Child Content instances array
	 * @access protected
	 */
	protected $items = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var $cache_time int Cache time in seconds
	 * @access private
	 */
	private $cache_time = 604800;
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
		$codeigniter->benchmark->mark('Model\Data\Navigation_class_construct_start');
		
		// Set the cache time from the config file
		$codeigniter->config->load('ionize', TRUE);
		$this->cache_time = $codeigniter->config->config['ionize']['data_model_cache'];
		
		// Generating class from data
		if( $data != NULL ) $this->initialize( $data );
		
		// Saving instance reference
		self::$instance = $this;
		
		$codeigniter->benchmark->mark('Model\Data\Navigation_class_construct_end');
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
		if ($key == 'items') return $this->items;
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
		$serialize_array = array('id','_data','items');
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
		$codeigniter->benchmark->mark('Model\Data\Navigation_class___wakeup_start');
		
		// Initialize class by raw data
		$class = $this->initialize( $this->_data );
		
		// Saving instance reference
		self::$instance = $this;
		
		$codeigniter->benchmark->mark('Model\Data\Navigation_class___wakeup_end');
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
 		$json_data = json_encode($this->_data);
		return $json_data;
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
		if($this->id != NULL && $this->cache_time > 0)
		{
			$codeigniter =& get_instance();
			// If cache not available then create cache from data
			$cache = $codeigniter->cache->file->get(md5($this->id).'.Navigation');
			if($cache == FALSE)
			{
				$codeigniter->benchmark->mark('Model\Data\Navigation_class___destruct_start');
				$codeigniter->cache->file->save(md5($this->id).'.Navigation', serialize($this), $this->cache_time);
				$codeigniter->benchmark->mark('Model\Data\Navigation_class___destruct_end');
			}
		}
   	}
   	/* ------------------------------------------------------------------------------------------------------------- */
   	
	/* ------------------------------------------------------------------------------------------------------------- */
	/* Public Functions -------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */

	public function initialize( $data )
	{
		$codeigniter =& get_instance();
		$codeigniter->benchmark->mark('Model\Data\Navigation_class_initialize_start');	
		
		if(is_object($data))
		{
			$this->_data = (array) $data;
			$this->id = $data->id_navigation;
		}
		if(is_array($data))
		{
			foreach($data as $index => $dat)
			{
				if(!array_key_exists($dat->code, self::$classes) && $dat->level == 0)
				{
					$navigation = array
					(
						'id_navigation' => $dat->id_navigation,
						'ordering'		=> $dat->navigation_ordering,
						'code'			=> $dat->code,
						'name'			=> $dat->name
					);
				
					$navigation = new Navigation( (object) $navigation );
					self::$classes[($dat->code)] =& $navigation;
					$this->_data[($dat->code)] =& $navigation;
					//continue;
				}
				
				if(!array_key_exists($dat->id_item, Navigation\Item::$classes))
				{
					$item = new Navigation\Item( $dat );
				}
				
				if(is_null($dat->id_parent))
				{
					$this->_data[($dat->code)]->items[] = Navigation\Item::$classes[$dat->id_item];
				}
			}
		}
		
		$codeigniter->benchmark->mark('Model\Data\Navigation_class_initialize_end');
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
		return (strtolower($type) === "navigation" ? TRUE : FALSE);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getID()
	{
		if($this->id != NULL) return $this->id;
		else
		{
			log_message('ERROR', 'Model\Data\Navigation->getID(): Data must be loaded first before geting ID');
			throw new RuntimeException('Navigation Data must be loaded first before geting ID');
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getByID( $id = NULL, $forceSelect = FALSE )
	{
		$codeigniter =& get_instance();
		$codeigniter->benchmark->mark('Content_class_getByID_start');
		if( $forceSelect === FALSE && $this->cache_time > 0 )
		{
			// Restoring cached data
			$cache = $codeigniter->cache->file->get(md5($id).'.Navigation');
			if($cache != FALSE)
			{
				log_message('DEBUG', 'Model\Data\Navigation->getByID(): Load Content Data from Cache: #'.$id);
				$codeigniter->benchmark->mark('Content_class_getByID_end');
				return unserialize($cache);
			}
			// If cache was unsuccesfull then select the content
			else return $this->getByID( $id, TRUE );
		}
		else if(is_numeric($id))
		{
			$navigation = \Model\Database\Navigation::get_instance();
			$query = $navigation->where('id_navigation', $id)->get();
			if($query->num_rows() > 0)
			{
				log_message('DEBUG', 'Model\Data\Navigation->getByID(): Load Content Data from Database: #'.$id);
				$codeigniter->benchmark->mark('Content_class_getByID_end');
				return $this->initialize( $query->row() );
			}
		}
		else
		{
			log_message('ERROR', 'Model\Data\Content->getByID(): ID parameter must be numeric type');
			$codeigniter->benchmark->mark('Content_class_getByID_end');
			
			// Throwning Exception about invalid parameter
			throw new \InvalidArgumentException('Navigation ID parameter must be numeric type');
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getByCode( $code = NULL, $forceSelect = FALSE )
	{
		$codeigniter =& get_instance();
		$codeigniter->benchmark->mark('Content_class_getByCode_start');
		if(is_numeric($id))
		{
			$content = \Model\Database\Navigation::get_instance();
			$query = $content->where('code', $code)->get();
			if($query->num_rows() > 0)
			{
				log_message('DEBUG', 'Model\Data\Navigation->getByCode(): Load Content Data from Database: #'.$id);
				$codeigniter->benchmark->mark('Content_class_getByCode_end');
				return $this->initialize( $query->row() );
			}
		}
		else
		{
			log_message('ERROR', 'Model\Data\Content->getByCode(): ID parameter must be numeric type');
			$codeigniter->benchmark->mark('Content_class_getByID_end');
			
			// Throwning Exception about invalid parameter
			throw new \InvalidArgumentException('Navigation ID parameter must be numeric type');
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Navigation.php */
/* Location: ./ionize/models/data/Navigation.php */
