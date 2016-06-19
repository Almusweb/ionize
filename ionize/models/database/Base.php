<?php /* ----------------------------------------------------------------------------------------------------------- */
namespace Model\Database;
/* ----------------------------------------------------------------------------------------------------------------- */
use \CI_Model as CodeIgniter_Model;
/* ----------------------------------------------------------------------------------------------------------------- */
use \InvalidArgumentException;
use \BadMethodCallException;
/* ----------------------------------------------------------------------------------------------------------------- */

/**
 * Main database handler class
 *
 * It's load automatcley the database and use the predefined table, view, procedure or etc for getting result
 *
 * @package 	Framework
 * @subpackage	Models
 * @category	Database
 *
 * @since 2015.10.12
 *
 * @author Ádám Liszkai <contact@liszkaiadam.hu>
 *
 * @method \CI_DB_query_builder_result query() query($sql, $binds = FALSE, $return_object = NULL)
 * @method string get_compiled_select() get_compiled_select($table = '', $reset = TRUE)
 *
 * @method \CI_DB_query_builder select() select($select = '*', $escape = NULL)
 * @method \CI_DB_result get_where() get_where($table = '', $where = NULL, $limit = NULL, $offset = NULL)
 * @method \CI_DB_query_builder set() set($key, $value = '', $escape = NULL)
 *
 * @method \CI_DB_query_builder where() where($key, $value = NULL, $escape = NULL)
 * @method \CI_DB_query_builder or_where() or_where($key, $value = NULL, $escape = NULL)
 *
 * @method \CI_DB_query_builder where_in() where_in($key = NULL, $values = NULL, $escape = NULL)
 * @method \CI_DB_query_builder or_where_in() or_where_in($key = NULL, $values = NULL, $escape = NULL)
 * @method \CI_DB_query_builder where_not_in() where_not_in($key = NULL, $values = NULL, $escape = NULL)
 * @method \CI_DB_query_builder or_where_not_in() or_where_not_in($key = NULL, $values = NULL, $escape = NULL)
 *
 * @method \CI_DB_query_builder like() like($field, $match = '', $side = 'both', $escape = NULL)
 * @method \CI_DB_query_builder not_like() not_like($field, $match = '', $side = 'both', $escape = NULL)
 * @method \CI_DB_query_builder or_like() or_like($field, $match = '', $side = 'both', $escape = NULL)
 * @method \CI_DB_query_builder or_not_like() or_not_like($field, $match = '', $side = 'both', $escape = NULL)
 *
 * @method \CI_DB_query_builder group_start() group_start($not = '', $type = 'AND ')
 * @method \CI_DB_query_builder or_group_start() or_group_start()
 * @method \CI_DB_query_builder not_group_start() not_group_start()
 * @method \CI_DB_query_builder or_not_group_start() or_not_group_start()
 * @method \CI_DB_query_builder group_end() group_end()
 *
 * @method \CI_DB_query_builder group_by() group_by($by, $escape = NULL)
 * @method \CI_DB_query_builder having() having($key, $value = NULL, $escape = NULL)
 * @method \CI_DB_query_builder or_having() or_having($key, $value = NULL, $escape = NULL)
 * @method \CI_DB_query_builder order_by() order_by($orderby, $direction = '', $escape = NULL)
 * @method \CI_DB_query_builder limit() limit($value, $offset = 0)
 * @method \CI_DB_query_builder offset() offset($offset)
 *
 * @method int count_all_results() count_all_results($table = '', $reset = TRUE)
 * @method int insert_batch() insert_batch($table = '', $set = NULL, $escape = NULL)
 * @method \CI_DB_query_builder set_insert_batch($key, $value = '', $escape = NULL)
 * @method string get_compiled_insert($table = '', $reset = TRUE)
 *ark->mark('Base_model_'.$this->database.'_database_get_start
 * @method int update_batch() update_batch($table = '', $set = NULL, $index = NULL)
 * @method \CI_DB_query_builder set_update_batch() set_update_batch($key, $index = '', $escape = NULL)
 *
 * @method \CI_DB_result empty_table() empty_table($table = '')
 * @method \CI_DB_result truncate() truncate($table = '')
 *
 * @method string get_compiled_delete() get_compiled_delete($table = '', $reset = TRUE)
 * @method string dbprefix() dbprefix($table = '')
 * @method string set_dbprefix() set_dbprefix($prefix = '')
 *
 * @property \CI_DB $mysql
 * @property \CI_DB $default
 * @property \CI_DB $firebird
 * @property \CI_DB $firebird_dev
 * @property \CI_DB $firebird_2016
 * @property \CI_DB $firebird_2015
 * @property \CI_DB $firebird_2014
 * @property \CI_DB $firebird_2013
 */
abstract class Base extends CodeIgniter_Model
{
	private static $instance = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $id = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $table = "";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $id_field = "";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $lang_table = "";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $id_lang_field = "";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $view = "";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $procedure = "";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $params = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $database = "default";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $last_query = "";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $last_result = "";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	protected $insert_id = 0;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	protected $affected_rows = 0;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	protected $where_count = 0;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $filter_methods = array('where','or_where','where_in','or_where_in','limit','or_limit','like','or_like');
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Adatbáziskapcsolat beállítása
	 *
	 */
	public function __construct()
	{
		parent::__construct();
		
		// Save the instance by Called class
		self::$instance[ get_called_class() ] = $this;
		
		// logging
		log_message('info', get_class($this), " class Initialized");
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public static function getInstance()
	{
		$class_name = get_called_class();
		
		//if( !isset( self::$instance[ $class_name ] ) ) self::$instance[ $class_name ] = new get_class();
		return self::$instance[ $class_name ];
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Magick hívásmetódus
	 *
	 * Meghívja a Codeigniter Active Record metódusait, kivéve ha a metódus itt szerepel az osztályban.
	 *
	 * @param string $method
	 * @param array $arguments
	 *
	 * @throws \BadMethodCallException
	 */
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
	
	/**
	 * Adatbázis csatlakozás ha még nem volt csatlakozva
	 *
	 */
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
	
	public function params( $value )
	{
		if(is_array($value)) foreach( $value as $i => $val ) $this->params( $val );
		else $this->params[] = $value;
		
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 *
	 *
	 * @param string $table
	 * @param integer $limit
	 * @param integer $offset
	 *
	 * @return \CI_DB_result
	 */
	public function get( $table = NULL, $limit = NULL, $offset = NULL )
	{
		$this->benchmark->mark('Base_model_'.$this->database.'_database_get_start');
		
		if(is_null($table)) $table = ($this->view != "" ? $this->view : $this->table);
		if(!empty($this->procedure)) $table = $this->procedure;
		if(count($this->params) > 0) $table = $table."('".implode("','",$this->params)."')";
		
		$this->database_initialize();
		
		$query = $this->{$this->database}->get($table, $limit, $offset);
		
		$this->last_query = $this->{$this->database}->last_query();
		Debug(trim(preg_replace('/\s+/', ' ', $this->last_query)), 'Query on '.ucfirst($this->database));
		
		$this->where_count = 0;
		$this->params = array();
		
		$this->benchmark->mark('Base_model_'.$this->database.'_database_get_end');
		
		if($query != FALSE) return $query;
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function insert( $table = NULL, $set = NULL, $escape = NULL )
	{
		$this->benchmark->mark('Base_model_'.$this->database.'_database_insert_start');
		
		// Ha az első paraméter tömb akkor az a $set értéke
		if(is_array($table)) { $set = $table; $table = NULL; }
		
		// Ha a tábla Tömb akkor a beállított táblát kell használni
		if(is_null($table)) $table = $this->table;
		
		$query = $this->{$this->database}->insert($table, $set, $escape);
		$this->last_query = $this->{$this->database}->last_query();
		
		Debug(trim(preg_replace('/\s+/', ' ', $this->last_query)), 'Last Query on '.ucfirst($this->database));
		
		$this->where_count = 0;
		
		$this->benchmark->mark('Base_model_'.$this->database.'_database_insert_end');
		
		if($query != FALSE) return $query;
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function update($table = NULL, $set = NULL, $where = NULL, $limit = NULL)
	{
		$this->benchmark->mark('Base_model_'.$this->database.'_database_update_start');
		
		// Ha az első paraméter tömb akkor az a $set értéke
		if(is_array($table)) { $set = $table; $table = NULL; }
		
		// Ha a tábla Tömb akkor a beállított táblát kell használni
		if(is_null($table)) $table = $this->table;
		
		$query = $this->{$this->database}->update($table, $set, $where, $limit);
		$this->last_query = $this->{$this->database}->last_query();
		
		Debug(trim(preg_replace('/\s+/', ' ', $this->last_query)), 'Last Query on '.ucfirst($this->database));
		
		$this->where_count = 0;
		
		$this->benchmark->mark('Base_model_'.$this->database.'_database_update_end');
		
		if($query != FALSE) return $query;
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Delete
	 *
	 * Compiles a delete string and runs the query
	 *
	 * @param	mixed	$table the table(s) to delete from. String or array
	 * @param	mixed	$where the where clause
	 * @param	mixed	$limit the limit clause
	 * @param	bool	$reset_data
	 *
	 * @return	false|\CI_DB_result
	 */
	public function delete($table = NULL)
	{
		$this->benchmark->mark('Base_model_'.$this->database.'_database_delete_start');
		
		// Ha a tábla Tömb akkor a beállított táblát kell használni
		if(is_null($table)) $table = $this->table;
		
		if($this->where_count > 0)
		{
			$query = $this->{$this->database}->delete($table);
			$this->last_query = $this->{$this->database}->last_query();
			
			Debug(trim(preg_replace('/\s+/', ' ', $this->last_query)), 'Last Query on '.ucfirst($this->database));
			
			$this->where_count = 0;
		}
		else $query = FALSE;
		
		$this->benchmark->mark('Base_model_'.$this->database.'_database_delete_end');
		
		if($query != FALSE) return $query;
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function affected_rows()
	{
		return $this->{$this->database}->affected_rows();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Base.php */
/* Location: ./models/Base.php */
