<?php namespace Model;

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
abstract class Base extends \CI_Model
{
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $id = NULL;
	public static $instance = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $table = "";
	public $lang_table = "";
	public $view = "";
	public $id_field = "";
	public $id_lang_field = "";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $database = "default";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $last_query = "";
	public $last_result = "";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $insert_id = 0;
	public $affected_rows = 0;
	public $where_count = 0;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $filter_methods = array('where','or_where','where_in','or_where_in','limit','or_limit','like','or_like');
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct()
	{
		parent::__construct();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __call($method,$arguments)
	{
		$this->database_initialize();
		
		if(method_exists($this, $method))
		{
			return call_user_func_array(array($this,$method),$arguments);
		}
		
		if (method_exists($this->{$this->database}, $method))
		{
			if(in_array($method, $this->filter_methods)) $this->where_count++;
			call_user_func_array(array($this->{$this->database},$method),$arguments);
			return $this;
		}
		
		// Throw Bad Method Call Expetion if nothing cant called
		throw new BadMethodCallException();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private function database_initialize()
	{
		$this->benchmark->mark('Base_model_'.$this->database.'_database_initialize_start');
		
		// Creating property if not exits
		if( ! property_exists($this, $this->database) ) $this->{$this->database} = NULL;
		
		// If property is Empty then load database instance
		if($this->{$this->database} == NULL) $this->{$this->database} = $this->load->database($this->database, TRUE);
		
		$this->benchmark->mark('Base_model_'.$this->database.'_database_initialize_end');
	}
	
	/* ------------------------------------------------------------------------------------------------------------- */
	private function get( $table = NULL, $limit = NULL, $offset = NULL )
	{
		if(is_null($table)) $table = ($this->view != "" ? $this->view : $this->table);
		$query = $this->{$this->database}->get($table, $limit, $offset);
		
		$this->last_query = $this->{$this->database}->last_query();
		$this->where_count = 0;
		
		if($query != FALSE) return $query;
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Base.php */
/* Location: ./ionize/models/Base.php */
