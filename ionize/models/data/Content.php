<?php namespace Model\Data;

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Content implements \DataModel
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
	 * @var $items array Child Content instances array
	 * @access protected
	 */
	protected $items = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var $items_shor array sort
	 * @access protected
	 */
	protected $items_sort = array();
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
	public function __construct( $data = NULL, $loadItems = TRUE )
	{
		$codeigniter =& get_instance();		
		$codeigniter->benchmark->mark('Model\Data\Content_class_construct_start');
		
		// Set the cache time from the config file
		$codeigniter->config->load('ionize', TRUE);
		$this->cache_time = $codeigniter->config->config['ionize']['data_model_cache'];
		
		// Generating class from data
		if( $data != NULL )
		{
			if(is_numeric($data)) $this->getByID($data, FALSE, $loadItems);
			else $this->initialize( $data, $loadItems );
		}
		
		$codeigniter->benchmark->mark('Model\Data\Content_class_construct_end');
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
		// If key is items then return sorted items array
		if( $key == 'items' ) return $this->items_sort;
		
		// If key is items then return sorted items array
		if( $key == 'items_sort' ) return $this->items_sort;
	
		$language = current_language();
		if( isset($this->_data[$language][$key]) )
		{
			// If key exists in translated data then return it
			return $this->_data[$language][$key];
		}
		
		// If not found then NULL
		return NULL;
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
		$serialize_array = array('id','_data');
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
		$codeigniter->benchmark->mark('Model\Data\Content_class___wakeup_start');
		
		// Get the current language
		$language = current_language();
		
		// Initialize class by raw data
		$class = $this->initialize( $this->_data[ $language ] );
		
		$codeigniter->benchmark->mark('Model\Data\Content_class___wakeup_end');
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
			$cache = $codeigniter->cache->file->get(md5($this->id).'.Content');
			if($cache == FALSE)
			{
				$codeigniter->benchmark->mark('Model\Data\Content_class___destruct_start');
				$codeigniter->cache->file->save(md5($this->id).'.Content', serialize($this), $this->cache_time);
				$codeigniter->benchmark->mark('Model\Data\Content_class___destruct_end');
			}
		}
   	}
   	/* ------------------------------------------------------------------------------------------------------------- */
   	
	/* ------------------------------------------------------------------------------------------------------------- */
	/* Public Functions -------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */

	/**
	 * Class Initialization
	 *
	 * @access public
	 * @return \Model\Data\Content
	 */
	public function initialize( $data, $loadItems = TRUE )
	{
		$codeigniter =& get_instance();
		$codeigniter->benchmark->mark('Model\Data\Content_class_initialize_start');
		
		// Saving data to properties
		$this->_data[$data->language] = (array) $data;
		
		// Creating content ID property
		if($this->id == NULL) $this->id = $data->id_content;
		
		// Adding reference to the global static
		self::$classes[ $this->id ] =& $this;
		
		// If has childrens then load it
		if($this->has_children && $loadItems === TRUE)
		{
			$childrens = explode(',',$this->id_childrens);
			
			// Get childrens from the database or the loaded classes
			$this->getByID($childrens, FALSE, TRUE);
		}
		
		// If has parents then register as a chilren
		if(!is_null($data->id_parents))
		{
			$parents = explode(',', $data->id_parents);			
			foreach($parents as $id_parent)
			{
				// If parent already loaded
				if(array_key_exists($id_parent, self::$classes))
				{
					// Get parent class as a reference
					$parent =& self::$classes[$id_parent];
					
					// Then register item as a child Content
					$parent->registerItem( $id_parent, $this );
				}
				// If not loaded
				else
				{
					// Then load it by ID and dont load the childrens because it can make recursion
					$this->getByID($id_parent, FALSE, FALSE);
					
					// Get parent class as a reference
					$parent =& self::$classes[$id_parent];
					
					// And register item as a child Content
					$parent->registerItem( $id_parent, $this );
				}
			}
		}
		
		// Saving instance reference
		self::$instance = $this;
		
		$codeigniter->benchmark->mark('Model\Data\Content_class_initialize_end');
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Get Instance
	 *
	 * @access public
	 * @return \Model\Data\Content
	 */
	public static function get_instance()
	{
		return self::$instance;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Type check
	 *
	 * @access public
	 * @return boolean
	 */
	public function is( $type )
	{
		if(strtolower($type) === "active") if($this->isActive() === TRUE) return TRUE;
		return (strtolower($type) === "content" ? TRUE : FALSE);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Activity check
	 *
	 * @access public
	 * @return boolean
	 */
	public function isActive()
	{
		if($this->id == \Output::$current_content->getID()) return TRUE;
		else return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Get Content ID
	 *
	 * @access public
	 * @return int
	 */
	public function getID()
	{
		if($this->id != NULL) return $this->id;
		else
		{
			log_message('ERROR', 'Model\Data\Content->getID(): Data must be loaded first before geting ID');
			throw new \RuntimeException('Model\Data\Content->getID(): Data must be loaded first before geting ID');
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Get Content By ID
	 *
	 * @access public
	 * @return void
	 */
	public function getByID( $id = NULL, $forceSelect = FALSE, $getItems = TRUE )
	{
		$codeigniter =& get_instance();
		$codeigniter->benchmark->mark('Model\Data\Content_class_getByID_start');
		
		// If ID is numeric then return with an array
		if(is_numeric($id))
		{
			if($this->id == $id)
			{
				self::$classes[ $id ] =& $this;
				return self::$classes[ $id ];
			}
			return $this->getByID( array($id), $forceSelect, $getItems );
		}
		
		// If select is forces then skipp cache check
		if( $forceSelect === FALSE )
		{
			if(is_array($id))
			{
				foreach($id as $index => $id_content)
				{
					// Restoring cached data
					$cache = $codeigniter->cache->file->get(md5($id_content).'.Content');
					if($cache != FALSE)
					{
						log_message('DEBUG', 'Model\Data\Content->getByID(): Load Content Data from Cache: #'.$id_content);
						$codeigniter->benchmark->mark('Model\Data\Content_class_getByID_end');
						
						// Unset item from the array and restore class from cache
						unset($id[$index]); unserialize($cache);
					}
				}
				
				// If something not loaded then get from the database
				if(count($id) > 0) $this->getByID( $id, TRUE, $getItems );
			}
		}
		// If id is and array of ids
		else if(is_array($id))
		{
			// Get Database model instance
			$content = \Model\Database\Content::get_instance();
			$query = $content->where_in('id_content', $id)->get();
			
			// If query has results
			if($query->num_rows() > 0)
			{
				log_message('DEBUG', 'Model\Data\Content->getByID(): Load Content Data from Database: #'.implode(',#',$id));
			
				foreach($query->result() as $row)
				{
					if(!array_key_exists($row->id_content, self::$classes) && $this->id != $row->id_content)
					{
						log_message('DEBUG', 'Model\Data\Content->getByID(): Create Content #'.$row->id_content);
						
						// Create content from database data
						$content = new Content( $row, $getItems );
					}
					else
					{
						// Get content from the classes
						$content = self::$classes[ $row->id_content ];
						
						// And add translate (bacause if it's exists the other row must be translate)
						$content->addTranslate( $row->language, $row );
					}
				}
				
				$codeigniter->benchmark->mark('Model\Data\Content_class_getByID_end');
			}
		}
		else
		{
			$error_message = 'Model\Data\Content->getByID(): ID parameter must be array type';
			log_message('ERROR', $error_message); throw new \InvalidArgumentException($error_message);
		}
		$codeigniter->benchmark->mark('Model\Data\Content_class_getByID_end');
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
		$codeigniter->benchmark->mark('Model\Data\Content_class_registerItem_start');
	
		// If parent is the current class
		if( $id_parent == $this->id )
		{
			// Get the item ID
			$id_item = $item->getID();
		
			// If reference not exists
			if(!array_key_exists($id_item, $this->items))
			{
				log_message('DEBUG', 'Model\Data\Content->registerItem(): Adding #'.$id_item.' to #'.$this->id);
			
				// Add reference to the items
				$this->items[ $id_item ] =& $item;
				
				// If item has ordering
				if(!is_null($item->ordering))
				{
					// Add reference to the sorted items
					$this->items_sort[ ($item->ordering) ] =& $item;
				}
				
				$codeigniter->benchmark->mark('Model\Data\Content_class_registerItem_end');
				return TRUE;
			}
			else
			{
				$codeigniter->benchmark->mark('Model\Data\Content_class_registerItem_end');
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
			$codeigniter->benchmark->mark('Model\Data\Content_class_registerItem_end');
			return FALSE;
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Add Translate to the Content
	 *
	 * @access public
	 * @return boolean
	 */
	public function addTranslate( $language, $data )
	{
		// If language data not exists
		if(!array_key_exists($language, $this->_data))
		{
			// Register language data
			$this->_data[ $language ] = $data;
			
			return TRUE;
		}
		else
		{
			// This never should happend
			$error_message = 'Model\Data\Content->addTranslate(): Translate already registered, duplicate data detected!';
			log_message('ERROR', $error_message); throw new \RuntimeException($error_message);
			
			return FALSE;
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Content.php */
/* Location: ./ionize/models/data/Content.php */
