<?php

namespace Model\Data\Contents;

use Model\Data\Base;
use Model\Database\Contents as Database;

class Contents extends Base
{
	/**
	 * @var $classes Content[] array of existing content class instances
	 */
	private static $classes = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $cache_name = 'Model.Data.Contents.Content';
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


	public function setLanguage( string $language ) : Contents
	{
		$this->db->group_start()->where('language', $language)->group_end();
		$this->cache_name .= '.'.$language; 
		
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getByID( int $id_content ) : Content
	{
		$this->cache_name .= '#'.$id_content;
		
		$serializedContent = get_instance()->cache->file->get($this->cache_name);
		if ( $serializedContent != FALSE )
		{
			$content = unserialize($serializedContent);
			debug($content, '$content from cache');
			
			if($content instanceof Content) return $content;
		}
	
		$this->db->group_start();
		$this->db->where('id_content', $id_content);
		$this->db->group_end();
		
		$query = $this->db->get();
		if( $query != FALSE )
		{
			$result = $query->custom_result_object('Model\\Data\\Contents\\Content');
			Debug($result, '$result');
			
			$saveCache = get_instance()->cache->file->save($this->cache_name, serialize($result[0]), 3600);
			return $result[0];
		}
		else throw new \Exception('404 - Content Not Found!');
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
