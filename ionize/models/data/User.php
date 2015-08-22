<?php namespace Model\Data;

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class User
{
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * public $id integer Content ID or NULL
	 */	
	public $id = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * public $instance Model\Data\User Static Reference for this class 
	 */
	public static $instance = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * private $_data array Parsed Content data
	 */
	private $_data = array();
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
		$codeigniter->benchmark->mark('Model\Data\User_class_construct_start');
		
		// Generating class from data
		if( $data != NULL ) $this->initialize( $data );
		else if ( $codeigniter->session->logged_in === TRUE )
		{
			$logged_user = unserialize($codeigniter->session->user);
			$this->initialize( $logged_user->getData() );
		}
		
		// Saving instance reference
		self::$instance = $this;
		
		$codeigniter->benchmark->mark('Model\Data\User_class_construct_end');
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
		$codeigniter->benchmark->mark('Model\Data\User_class___wakeup_start');
		
		// Initialize class by raw data
		$class = $this->initialize( $this->_data );
		
		// Saving instance reference
		self::$instance = $this;
		
		$codeigniter->benchmark->mark('Model\Data\User_class___wakeup_end');
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
		$codeigniter =& get_instance();	
		$codeigniter->benchmark->mark('Model\Data\User_class___toString_start');
 		$json_data = json_encode($this->_data);
 		$codeigniter->benchmark->mark('Model\Data\User_class___toString_end');
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
		if($this->id != NULL)
		{
			$codeigniter =& get_instance();	
		
			// If cache not available then create cache from data
			$cache = $codeigniter->cache->file->get(md5($this->id).'.User');
			if($cache == FALSE)
			{
				$codeigniter->benchmark->mark('Model\Data\User_class___destruct_start');
				$codeigniter->cache->file->save(md5($this->id).'.User', serialize($this), $this->cache_time);
				$codeigniter->benchmark->mark('Model\Data\User_class___destruct_end');
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
		$codeigniter->benchmark->mark('Model\Data\User_class_initialize_start');
		
		// Creating content ID property
		if($this->id == NULL) $this->id = $data->id_user;
		
		$this->_data = (array) $data;
		
		// Disable password on the datamodel
		unset($this->_data['password']);
		unset($this->_data['encryption']);
		
		$codeigniter->benchmark->mark('Model\Data\User_class_initialize_end');
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public static function get_instance()
	{
		return self::$instance;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getLoggedIn()
	{
		$codeigniter =& get_instance();	
		if($codeigniter->session->logged_in == TRUE)
		{
			$logged_user = unserialize($codeigniter->session->user);
			return $logged_user;
		}
		else return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getID()
	{
		if($this->id != NULL) return $this->id;
		else
		{
			$error_message = 'Model\Data\User->getID(): Data must be loaded first before geting ID';
			if(ENVIRONMENT == 'development') throw new \RuntimeException($error_message);
			else log_message('ERROR', $error_message);
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getData()
	{
		if(count($this->_data) > 0) return $this->_data;
		else
		{
			$error_message = 'Model\Data\User->getData(): Data must be loaded first before geting Userdata';
			if(ENVIRONMENT == 'development') throw new \RuntimeException($error_message);
			else log_message('ERROR', $error_message); 
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function tryLogin( $username, $password )
	{
		$codeigniter =& get_instance();	
		$codeigniter->benchmark->mark('Model\Data\User_class_tryLogin_start');
		
		$return = FALSE;
		
		$user = \Model\Database\User::get_instance();
		$query = $user->where('username', $username)->get();
		if($query->num_rows() > 0)
		{
			$user_data = $query->row();
			
			$login_success = FALSE;
			switch($user_data->encryption)
			{
				case "text": 	if($user_data->password == $password) $login_success = TRUE;					break;
				case "md5": 	if($user_data->password == hash('md5',$password)) $login_success = TRUE; 		break;
				case "sha256": 	if($user_data->password == hash('sha256',$password)) $login_success = TRUE; 	break;
			}
			
			$update = array();
			
			if($login_success)
			{
				$update['login_try'] = 0;
				$update['last_login'] = date('Y-m-d H:i:s');
				
				if($user_data->encryption == 'text')
				{
					$update['password'] = hash('md5',$user_data->password);
					$update['encryption'] = 'md5';
				}
				
				$this->initialize( $user_data );
				$codeigniter->session->logged_in = TRUE;
				$codeigniter->session->user = serialize($this);
			}
			else
			{
				$update['login_try'] = $user_data->login_try+1;
			}
			
			$user->where('id_user', $user_data->id_user)->update($update);
		}
		
		$codeigniter->benchmark->mark('Model\Data\User_class_tryLogin_end');
		return $return;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getByID( $id = NULL, $forceSelect = FALSE )
	{
		$codeigniter =& get_instance();	
		$codeigniter->benchmark->mark('Model\Data\User_class_getByID_start');
		if( $forceSelect === FALSE )
		{
			// Restoring cached data
			$cache = $codeigniter->cache->file->get(md5($id).'.User');
			if($cache != FALSE)
			{
				log_message('DEBUG', 'Model\Data\User->getByID(): Load Content Data from Cache: #'.$id);
				$this->benchmark->mark('Model\Data\User_class_getByID_end');
				return unserialize($cache);
			}
			// If cache was unsuccesfull then select the content
			else return $this->getByID( $id, TRUE );
		}
		else if(is_numeric($id))
		{
			$user = \Model\Database\User::get_instance();
			$query = $user->where('id_user', $id)->get();
			if($query->num_rows() > 0)
			{
				log_message('DEBUG', 'Model\Data\User->getByID(): Load Content Data from Database: #'.$id);
				$codeigniter->benchmark->mark('Model\Data\User_class_getByID_end');
				return $this->initialize( $query->row() );
			}
		}
		else
		{
			$error_message = 'Model\Data\User->getByID(): ID parameter must be numeric type';
			if(ENVIRONMENT == 'development') throw new \InvalidArgumentException($error_message);
			else log_message('ERROR', $error_message);
		}
		$codeigniter->benchmark->mark('Model\Data\User_class_getByID_end');
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getByLogin( $login = NULL, $forceSelect = FALSE )
	{
		$codeigniter =& get_instance();	
		$codeigniter->benchmark->mark('Model\Data\User_class_getByLogin_start');
		if(is_string($login))
		{
			$user = \Model\Database\User::get_instance();
			$query = $user->where('login', $login)->get();
			if($query->num_rows() > 0)
			{
				log_message('DEBUG', 'Model\Data\User->getByLogin(): Load Content Data from Database: '.$login);
				$codeigniter->benchmark->mark('Model\Data\User_class_getByLogin_end');
				return $this->initialize( $query->row() );
			}
		}
		else
		{
			$error_message = 'Model\Data\User->getByLogin(): Login parameter must be string type';
			if(ENVIRONMENT == 'development') throw new \InvalidArgumentException($error_message);
			else log_message('ERROR', $error_message);
		}
		$codeigniter->benchmark->mark('Model\Data\User_class_getByLogin_end');
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getByEmail( $email = NULL, $forceSelect = FALSE )
	{
		$codeigniter =& get_instance();	
		$codeigniter->benchmark->mark('Model\Data\User_class_getByEmail_start');
		if(is_string($email))
		{
			$user = \Model\Database\User::get_instance();
			$query = $user->where('email', $email)->get();
			if($query->num_rows() > 0)
			{
				log_message('DEBUG', 'Model\Data\User->getByEmail(): Load Content Data from Database: '.$email);
				$this->benchmark->mark('Model\Data\User_class_getByEmail_end');
				return $this->initialize( $query->row() );
			}
		}
		else
		{
			$error_message = 'Model\Data\User->getByEmail(): Email parameter must be string type';
			if(ENVIRONMENT == 'development') throw new \InvalidArgumentException($error_message);
			else log_message('ERROR', $error_message);
		}
		$this->benchmark->mark('Model\Data\User_class_getByEmail_end');
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Content.php */
/* Location: ./ionize/models/data/Content.php */
