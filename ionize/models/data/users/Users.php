<?php

namespace Model\Data\Users;

use Model\Data\Base;
use Model\Database\Users as Database;

use \UnexpectedValueException;

class Users extends Base
{
	/**
	 * @var $classes User[] array of existing User class instances
	 */
	private static $classes = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $cache_name = 'Model.Data.Users.User';
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $readCache = TRUE;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var $db \Model\Database\Users|NULL database handler class
	 */
	private $db = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct()
	{
		$this->db = Database::getInstance();
	}
	/* ------------------------------------------------------------------------------------------------------------- */


	public function setLanguage( string $language ) : Users
	{
		$this->db->group_start()->where('language', $language)->group_end();
		$this->cache_name .= '.'.$language; 
		
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function cacheEnabled( bool $enabled ) : bool
	{
		$prevValue = $this->readCache;
		$this->readCache = $enabled;
		
		return $prevValue;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getByID( int $id_User ) : User
	{
		$this->cache_name .= '#'.$id_User;
		
		$serializedUser = get_instance()->cache->file->get($this->cache_name);
		if ( $serializedUser != FALSE && $this->readCache )
		{
			$User = unserialize($serializedUser);
			debug($User, '$User from cache');
			
			if($User instanceof User) return $User;
		}
	
		$this->db->group_start();
		$this->db->where('id_user', $id_user);
		$this->db->group_end();
		
		$result = $this->get();
		
		if(isset($result[0]) && count($result) === 1)
		{
			$saveCache = get_instance()->cache->file->save($this->cache_name, serialize($result[0]), 3600);
			return $result[0];
		}
		elseif(count($result) > 1) throw new UnexpectedValueException('Multiple User found By Unique ID!');
		else throw new UnexpectedValueException('User Not Found!');
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getByLogin( string $userLogin ) : array
	{
		$this->cache_name .= '#'.$userLogin;
		
		$serializedUser = get_instance()->cache->file->get($this->cache_name);
		if ( $serializedUser != FALSE && $this->readCache )
		{
			$user = unserialize($serializedUser);
			debug($user, '$User from cache');
			
			if($user instanceof User) return [$user];
		}
	
		$this->db->group_start();
		$this->db->where('login', $userLogin);
		$this->db->or_where('email', $userLogin);
		$this->db->group_end();
		
		$result = $this->get();
		
		if(count($result) > 1) throw new UnexpectedValueException('Multiple User found By Unique ID!');
		elseif(isset($result[0]) && count($result) === 1)
		{
			$saveCache = get_instance()->cache->file->save($this->cache_name, serialize($result[0]), 3600);
			return $result;
		}
		
		return [];
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private function get() : array
	{		
		$query = $this->db->get();
		if( $query != FALSE )
		{
			$result = $query->custom_result_object('Model\\Data\\Users\\User');
			Debug($result, '$result');
			
			return $result;
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
