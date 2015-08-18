<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Content //extends CI_Model
{
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $id = NULL;
	
	/* ------------------------------------------------------------------------------------------------------------- */
	
	protected $raw_data = array();
	
	public static $data = array();
	protected $_data = array();
	
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct( $data = NULL )
	{
		//$this->benchmark->mark('Content_class_construct_start');
		if( $data != NULL )
		{
			$this->raw_data = $data;
			$this->_data = (array) $data;
						
			$this->id = $this->_data['id'] = $this->id_content;
			
			$this->has_children = $this->_data['has_children'] = ($this->has_children == 1 ? TRUE : FALSE);
			$this->homepage = $this->_data['homepage'] = ($this->homepage == 1 ? TRUE : FALSE);
			$this->has_url = $this->_data['has_url'] = ($this->has_url == 1 ? TRUE : FALSE);
			
			if($this->has_children == 1)
			{
				
			}
			// @todo: internal data of content
			// $this->contents->
			
			// Copy datas from dinamic to static
			self::$data = $this->_data;
		}
		//$this->benchmark->mark('Content_class_construct_end');
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
	 * @return	void
	 */
	public function __wakeup()
	{
		self::$data = $this->_data;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * __toString()
	 *
	 * @return	json
	 */
	public function __toString()
    {
        return json_encode($this->_data);
    }
	/* ------------------------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */
	
	
	
	/* ------------------------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */
	/* ------------------------------------------------------------------------------------------------------------- */
	
	function __destruct()
	{
		$changed = array();
		
    	foreach($this->raw_data as $name => $value)
    		if( $this->_data[$name] != $value ) $changed[$name] = $this->_data[$name];
    	
    	if(count($changed) > 0)
    	{
    		echo "<pre>Changed content:".print_r($changed, true)."</pre>";
    		// @todo permission check and database save
    	}
   	}
   	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Content.php */
/* Location: ./ionize/models/Content.php */
