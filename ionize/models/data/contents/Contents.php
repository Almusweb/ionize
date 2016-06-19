<?php

namespace Model\Data\Contents;

class Contents
{
	private static $classes = array();
	private $db = NULL;

	public function __construct()
	{
		$ci =& get_instance();
	
		$ci->load->model('data/contents/Content', NULL);
		$ci->load->model('database/Contents', NULL);
		
		$this->db = \Model\Database\Contents::getInstance();
	}

	public function setLanguage($language )
	{
		$this->db->group_start()->where('language', $language)->group_end();
		
		
		return $this;
	}
	
	public function getByURL( $url_string )
	{
		$this->db->group_start();
		$this->db->where('long_url', $url_string)->or_where('short_url', $url_string);
		$this->db->group_end();
		
		$query = $this->db->get();
		if( $query != FALSE )
		{
			$result = $query->custom_result_object('Model\\Data\\Contents\\Content');
			Debug($result, '$result');
			
			return $result;
		}
		else return FALSE;
	}
}
