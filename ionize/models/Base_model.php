<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
abstract class Base_model extends CI_Model
{
	/* ------------------------------------------------------------------------------------------------------------- */	
	public $id = NULL;
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
	public $insert_id = 0;
	public $affected_rows = 0;
	/* ------------------------------------------------------------------------------------------------------------- */
	private $where_count = 0;
	/* ------------------------------------------------------------------------------------------------------------- */
	public function __construct()
	{
		parent::__construct();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	public function __call($name, $arguments)
	{
		$this->benchmark->mark('Base_model_load_database_start');
		
		if( ! property_exists($this, $this->database) ) $this->{$this->database} = NULL;		
		if($this->{$this->database} == NULL) $this->{$this->database} = $this->load->database($this->database, TRUE);
		
		$this->benchmark->mark('Base_model_load_database_end');
	}	
	/* ------------------------------------------------------------------------------------------------------------- */		
	public function select($select)
	{
		$this->{$this->database}->select($select);
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	public function set($name, $value = '', $escape = NULL)
	{
		$this->{$this->database}->set($name, $value, $escape);
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */	
	public function like($name, $value, $format=TRUE)
	{
		$this->{$this->database}->like($name, $value, $format);
		$this->where_count = $this->where_count+1;
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	public function or_like($name, $value, $format=TRUE)
	{
		$this->{$this->database}->or_like($name, $value, $format);
		$this->where_count = $this->where_count+1;
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	public function where($name, $value=NULL, $format=TRUE)
	{
		$this->{$this->database}->where($name, $value, $format);
		$this->where_count = $this->where_count+1;
		return $this;
	}	
	/* ------------------------------------------------------------------------------------------------------------- */	
	public function or_where($name, $value)
	{
		$this->{$this->database}->or_where($name,$value);
		$this->where_count = $this->where_count+1;
		return $this;
	}	
	/* ------------------------------------------------------------------------------------------------------------- */	
	public function between($start_date, $end_date)
	{
		$this->start_date = $start_date;
		$this->end_date = $end_date;
		$this->where_count = $this->where_count+1;
		return $this;
	}	
	/* ------------------------------------------------------------------------------------------------------------- */	
	public function order_by($param)
	{
		$this->{$this->database}->order_by($param);
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	public function limit($value, $offset = 0)
	{
		$this->{$this->database}->limit($value, $offset);
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	public function query($query)
	{
		$this->where_count = 0;
		return $this->{$this->database}->query($query);
	}
	/* ------------------------------------------------------------------------------------------------------------- */	
	public function get( $table = NULL, $limit = NULL, $offset = NULL )
	{
		$this->benchmark->mark('Base_model_get_start');
		if(is_null($table)) $table = $this->view;
		
		$this->benchmark->mark('Base_model_get_query_start');
				 $this->{$this->database}->from($table);
		$query = $this->{$this->database}->get();
		$this->benchmark->mark('Base_model_get_query_end');
		
		$this->last_query = $this->{$this->database}->last_query();
		
		$this->benchmark->mark('Base_model_get_end');
		$this->where_count = 0;
		
		if($query != FALSE) return $query;
		return FALSE;
	}	
	/* ------------------------------------------------------------------------------------------------------------- */	
	public function create($data=NULL)
	{
		return $this->insert($data);
	}	
	/* ------------------------------------------------------------------------------------------------------------- */	
	public function insert($data=NULL)
	{
		if(is_array($data))
		{
			// Frissítem az adatbázist
			$query = $this->{$this->database}->insert($this->table, $data);
			//Debug( trim(preg_replace('/\s+/', ' ', $this->{$this->database}->last_query())), 'last query' );
			$insert_id = $this->insert_id = $this->{$this->database}->insert_id();			
			
			$this->where($this->id_field, $insert_id);
			$query = $this->get();
				
			return $query;
		}
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	public function insert_lang($data=NULL)
	{
		if(is_array($data))
		{
			// Frissítem az adatbázist
			$query = $this->{$this->database}->insert($this->lang_table, $data);
			//Debug( trim(preg_replace('/\s+/', ' ', $this->{$this->database}->last_query())), 'last query' );
			$insert_id = $this->insert_id = $this->{$this->database}->insert_id();
			
			return $insert_id;
		}
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */	
	public function update($data=NULL)
	{
		if(is_array($data))
		{
			if(count($this->where_count)<1)$this->{$this->database}->where($this->id_field,$this->id);			
			return $this->{$this->database}->update($this->table, $data);
		}
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	public function update_lang($data=NULL)
	{
		if(is_array($data))
		{
			if(count($this->where_count)<1)$this->{$this->database}->where($this->id_lang_field,$this->id);
			return $this->{$this->database}->update($this->lang_table, $data);
		}
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */	
	public function delete($id=NULL)
	{
		if(!is_null($id))
			return $this->where($this->id_field, $id)->update(array('deleted' => date('Y-m-d H:i:s')));
		
		elseif(count($this->where_count)>0)
			return $this->update(array('deleted' => date('Y-m-d H:i:s')));
		
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Base.php */
/* Location: ./ionize/models/Base.php */
