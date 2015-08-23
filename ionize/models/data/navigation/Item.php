<?php namespace Model\Data\Navigation;

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Item implements \DataModel
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
	 * @var $items array Child Items
	 * @access protected
	 */
	protected $items = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var $items_sort array of ordered Child Items
	 * @access protected
	 */
	protected $items_sort = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var $item Item class
	 * @access protected
	 */
	protected $item = NULL;
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
		$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class_construct_start');
		
		// Set the cache time from the config file
		$codeigniter->config->load('ionize', TRUE);
		$this->cache_time = $codeigniter->config->config['ionize']['data_model_cache'];
		
		// Generating class from data
		if( $data != NULL ) $this->initialize( $data );
		
		// Saving instance reference
		self::$instance = $this;
		
		$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class_construct_end');
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
		if ($key == 'items') return $this->items;
		if ($key == 'item') return $this->item;
	
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
		$serialize_array = array('id','_data','items','items_sort');
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
		$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class___wakeup_start');
		
		// Initialize class by raw data
		$class = $this->initialize( $this->_data );
		
		// Saving instance reference
		self::$instance = $this;
		
		$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class___wakeup_end');
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
			$cache = $codeigniter->cache->file->get(md5($this->id).'.Navigation.Item');
			if($cache == FALSE)
			{
				$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class___destruct_start');
				$codeigniter->cache->file->save(md5($this->id).'.Navigation.Item', serialize($this), $this->cache_time);
				$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class___destruct_end');
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
		$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class_initialize_start');	
		
		if(is_object($data))
		{
			$this->_data = (array) $data;
			$this->id = $data->id_item;
			
			if(!is_null($data->id_content))
			{
				if(!array_key_exists($data->id_content, \Model\Data\Content::$classes))
				{
					$content = new \Model\Data\Content( $data->id_content, FALSE );
				}
				
				$this->item =& \Model\Data\Content::$classes[$data->id_content];
			}
			
			self::$classes[ $this->id ] =& $this;
			
			if(!is_null($data->id_parent))
			{
				$this->registerItem( $data->id_parent, $this );
			}
		}
		
		$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class_initialize_end');
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
		return (strtolower($type) === "navigation_item" ? TRUE : FALSE);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function hasItems()
	{
		return (count($this->items) > 0 ? TRUE : FALSE);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getID()
	{
		if($this->id != NULL) return $this->id;
		else
		{
			$error_message = 'Model\Data\Navigation\Item->getID(): Data must be loaded first before geting ID';
			log_message('ERROR', $error_message); throw new RuntimeException($error_message);
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getByID( $id = NULL, $forceSelect = FALSE )
	{
		$codeigniter =& get_instance();
		$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class_getByID_start');
		if( $forceSelect === FALSE && $this->cache_time > 0 )
		{
			// Restoring cached data
			$cache = $codeigniter->cache->file->get(md5($id).'.Navigation');
			if($cache != FALSE)
			{
				log_message('DEBUG', 'Model\Data\Navigation\Item->getByID(): Load Content Data from Cache: #'.$id);
				$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class_getByID_end');
				return unserialize($cache);
			}
			// If cache was unsuccesfull then select the content
			else return $this->getByID( $id, TRUE );
		}
		else if(is_numeric($id))
		{
			$navigation = \Model\Database\Navigation::get_instance();
			$query = $navigation->where('id_item', $id)->get_item();
			if($query->num_rows() > 0)
			{
				log_message('DEBUG', 'Model\Data\Navigation\Item->getByID(): Load Content Data from Database: #'.$id);
				$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class_getByID_end');
				return $this->initialize( $query->row() );
			}
		}
		else
		{
			$error_message = 'Model\Data\Navigation\Item->getByID(): ID parameter must be numeric type';
			log_message('ERROR', $error_message); throw new \InvalidArgumentException($error_message);
		}
		$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class_getByID_end');
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Register item to the parent
	 *
	 * @access public
	 * @return boolean
	 */
	public function registerItem( $id_parent, $item )
	{
		$codeigniter =& get_instance();
		$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class_registerItem_start');
	
		// If parent is the current class
		if( $id_parent == $this->id )
		{
			// Get the item ID
			$id_item = $item->getID();
		
			// If reference not exists
			if(!array_key_exists($id_item, $this->items))
			{
				log_message('DEBUG', 'Model\Data\Navigation\Item->registerItem(): Adding #'.$id_item.' to #'.$this->id);
			
				// Add reference to the items
				$this->items[ $id_item ] =& $item;
				
				// If item has ordering
				if(!is_null($item->ordering))
				{
					// Add reference to the sorted items
					$this->items_sort[ ($item->ordering) ] =& $item;
				}
				
				$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class_registerItem_end');
				return TRUE;
			}
			else
			{
				$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class_registerItem_end');
				return FALSE;
			}
		}
		// if parent is not the current class
		else if(array_key_exists($id_parent, self::$classes))
		{
			// Get parent Content from the classes
			$parent =& self::$classes[ $id_parent ];
			
			// Register item on the parent class
			$parent->registerItem( $id_parent, $item );
		}
		else
		{
			$codeigniter->benchmark->mark('Model\Data\Navigation\Item_class_registerItem_end');
			return FALSE;
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Navigation.php */
/* Location: ./ionize/models/data/Navigation.php */
