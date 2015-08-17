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
			
			foreach($data as $name => $value) $this->$name = $value;
			foreach($data as $name => $value) self::$data[$name] = $value;
			$this->_data = self::$data;
			
			$this->id = self::$data['id'] = $this->id_content;
			
			$this->has_children = self::$data['has_children'] = ($this->has_children == 1 ? TRUE : FALSE);
			$this->homepage = self::$data['homepage'] = ($this->homepage == 1 ? TRUE : FALSE);
			$this->has_url = self::$data['has_url'] = ($this->has_url == 1 ? TRUE : FALSE);
			
			if($this->has_children == 1)
			{
				
			}
			// @todo: internal data of content
			//$this->contents->
		}
		//$this->benchmark->mark('Content_class_construct_end');
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __call($method,$arguments)
	{
		// if method is a variable
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __sleep()
	{
		$this->_data = self::$data;
		
		$serialize_array = array('_data','raw_data','id');
		foreach($this->raw_data as $name => $value) $serialize_array[] = $name;
		
		return $serialize_array;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __wakeup()
	{
		self::$data = $this->_data;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getSerialized()
	{
		return serialize($this);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function save()
	{
		
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function assign()
	{
		
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Content.php */
/* Location: ./ionize/models/Content.php */
