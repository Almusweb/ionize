<?php
namespace Model\Data\Users;

include_once APPPATH.'traits'.DIRECTORY_SEPARATOR.'MagicGet'.PHPEXT;

use Model\Data\Base;

class User extends Base
{
	use \Traits\MagicGet;
	
	const id_property = 'id_user';
	const code_property = 'login';

	protected $id_user = NULL;
	protected $login = NULL;
	
	private $encryption = NULL;
	private $password = NULL;
	private $hash = NULL;

	protected $name = NULL;
	protected $email = NULL;
	protected $forname = NULL;
	protected $lastname = NULL;
	protected $gender = NULL;
	
	protected $birthday = NULL;
	protected $birthday_unix = NULL;
	
	protected $data = NULL;
	
	protected $registered = NULL;
	protected $registered_unix = NULL;
	
	protected $activated = NULL;
	protected $activated_unix = NULL;
	
	protected $deactivated = NULL;
	protected $deactivated_unix = NULL;
	
	public function __construct()
	{
		parent::__construct();
		
		if($this->birthday !== NULL) $this->birthday_unix = strtotime($this->birthday);
		if($this->registered !== NULL) $this->registered_unix = strtotime($this->registered);
		if($this->activated !== NULL) $this->activated_unix = strtotime($this->activated);
		if($this->deactivated !== NULL) $this->deactivated_unix = strtotime($this->deactivated);
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function authenticate( string $password ) : bool
	{
		$hashedPasswd = $this->hash.$password.$this->hash; 
		$passwordMatch = FALSE;
	
		switch($this->encryption)
		{
			case "MD5": if(md5($hashedPasswd) === $this->password) $passwordMatch = TRUE; break;
			//case "SHA256": if(md5($hashedPasswd) === $user->password) $passwordMatch = TRUE; break;
		}
		
		if($passwordMatch)
			get_instance()->session->set_userdata('user', serialize($this));
	
		return $passwordMatch;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __toString() : string
	{
		return json_encode( $this->__toArray() );
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __toArray() : array
	{
		return [
			'id'				=>	$this->id_user,
			'login'				=>	$this->login,
			'name'				=>	$this->name,
			'email'				=>	$this->email,
			'forname'			=>	$this->forname,
			'lastname'			=>	$this->lastname,
			'gender'			=>	$this->gender,
			'birthday'			=>	$this->birthday,
			'birthday_unix'		=>	$this->birthday_unix,
			'data'				=>	json_decode($this->data, TRUE),
			'registered'		=>	$this->registered,
			'registered_unix'	=>	$this->registered_unix,
			'activated'			=>	$this->activated,
			'activated_unix'	=>	$this->activated_unix,
			'deactivated'		=>	$this->deactivated,
			'deactivated_unix'	=>	$this->deactivated_unix,
		];
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __debugInfo() : array
	{
		return $this->__toArray();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __sleep() : array
	{
		$properties = array_keys($this->__toArray());
		$properties[] = 'id_user';
		unset($properties[0]);
		
		return $properties;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
