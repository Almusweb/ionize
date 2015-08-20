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
	public static $data = array();
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
		$codeigniter->benchmark->mark('Navigation_class_construct_start');
		
		// Set the cache time from the config file
		$codeigniter->config->load('ionize', TRUE);
		$this->cache_time = $codeigniter->config->config['ionize']['data_model_cache'];
		
		// Generating class from data
		if( $data != NULL ) $this->initialize( $data );
		
		// Saving instance reference
		self::$instance = $this;
		
		$codeigniter->benchmark->mark('Navigation_class_construct_end');
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
		$codeigniter->benchmark->mark('Navigation_class___wakeup_start');
		
		// Initialize class by raw data
		$class = $this->initialize( $this->_data );
		
		// Saving instance reference
		self::$instance = $this;
		
		$codeigniter->benchmark->mark('Navigation_class___wakeup_end');
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
				$codeigniter->benchmark->mark('Navigation_class___destruct_start');
				$codeigniter->cache->file->save(md5($this->id).'.Navigation', serialize($this), $this->cache_time);
				$codeigniter->benchmark->mark('Navigation_class___destruct_end');
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
		$codeigniter->benchmark->mark('Navigation_class_initialize_start');
		
		// Saving data to properties
		$this->_data = (array) $data;
		
		if(is_object($data))
		{
			// Creating content ID property
			if($this->id == NULL) $this->id = $data->id_navigation;
		
			// Get the Items
			$this->getItems();
		}
		elseif(is_array($data))
		{
			foreach($data as $index => $navigation)
			{
				$this->_data[($navigation->code)] = new Navigation( $navigation );
				unset($this->_data[$index]);
			}
		}
		
		$codeigniter->benchmark->mark('Navigation_class_initialize_end');
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
	
	private function getItems( $forceSelect = FALSE )
	{
		$codeigniter =& get_instance();
		$codeigniter->benchmark->mark('Content_class_getItems_start');
		if( $forceSelect === FALSE && $this->cache_time > 0 )
		{
	
			$codeigniter->benchmark->mark('Content_class_getItems_end');
		}
		else
		{
			$navigation = \Model\Database\Navigation::get_instance();
			$query = $navigation->get_items( $this->id );
		
			if($query->num_rows() > 0)
			{
				foreach($query->result() as $row)
				{
					if(!is_null($row->id_content))
					{
						// Checking the current content if is the current content we want						
						if(\Output::$current_content->getID() == $row->id_content) $content = \Output::$current_content;
						else
						{
							$content = new Content(); $content->getById( $row->id_content );
						}
						
						$this->items[] =& $content;
					}
				}
			}
			
			$codeigniter->benchmark->mark('Content_class_getItems_start');
		}
	}
}
/* End of file: Navigation.php */
/* Location: ./ionize/models/data/Navigation.php */
