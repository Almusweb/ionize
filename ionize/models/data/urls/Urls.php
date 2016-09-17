<?php

namespace Model\Data\Urls;

use Model\Data\Base;
use Model\Database\Urls as Database;

class Urls extends Base
{
	/**
	 * @var $classes Content[] array of existing content class instances
	 */
	private static $classes = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $cache_name = 'Model.Data.Urls.Url';
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var $db \Model\Database\Contents|NULL database handler class
	 */
	private $db = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct()
	{
		$this->db = Database::getInstance();
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	public function setBaseURL( string $base_url ) : Urls
	{
		$this->db->group_start();
		$this->db->where('base_short_url', $base_url)->or_where('base_long_url', $base_url);
		$this->db->group_end();
		
		$this->cache_name .= str_replace(['://','/'],['#',':'],$base_url);
		
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	public function setDomain( string $domain ) : Urls
	{
		$this->db->group_start()->where('domain', $domain)->group_end();
		$this->cache_name .= '.'.$domain; 
		
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	public function setLanguage( string $language ) : Urls
	{
		$this->db->group_start()->where('language', $language)->group_end();
		$this->cache_name .= '.'.$language; 
		
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getByURL( string $url_string ) : Url
	{
		$this->cache_name .= str_replace('/',':',$url_string);
		
		$serialized = get_instance()->cache->file->get($this->cache_name);
		if ( $serialized != FALSE )
		{
			$url = unserialize($serialized);
			debug($url, '$url from cache');
			
			if($url instanceof Url) return $url;
		}
	
		$this->db->group_start();
		$this->db->where('short_url', $url_string)->or_where('long_url', $url_string);
		$this->db->group_end();
		
		$query = $this->db->get();
		if( $query != FALSE )
		{
			$result = $query->custom_result_object('Model\\Data\\Urls\\Url');
			Debug($result, '$result');
			
			if(isset($result[0]))
			{
				$saveCache = get_instance()->cache->file->save($this->cache_name, serialize($result[0]), 3600);
				return $result[0];
			}
			return new Url();
		}
		else throw new \Exception('404 - URL Not Found!');
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
