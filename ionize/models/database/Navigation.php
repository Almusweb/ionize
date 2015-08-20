<?php namespace Model\Database;

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Navigation extends \Model\Base
{
	public static $instance = NULL;

	/* ------------------------------------------------------------------------------------------------------------- */
	public $table 			= 'navigations';
	public $id_field 		= 'id_navigation';
	
	public $lang_table 		= '';
	public $id_lang_field 	= '';
	
	public $view 			= 'navigation';
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct()
	{
		parent::__construct();
		
		// Saving instance reference
		self::$instance = $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function get_items( $identify )
	{
		if(is_numeric($identify))
		{
			return $this->where('id_navigation', $identify)->get('navigation_items');
		}
		elseif(is_string($identify))
		{
			return $this->where('navigation', $identify)->get('navigation_items');
		}
		else
		{
			$error_message = 'Model\Database\Navigation->get_items(): Identify must be numeric or string type';
			log_message('ERROR', $error_message); throw new \InvalidArgumentException($error_message);
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public static function get_instance()
	{
		return self::$instance;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Navigation.php */
/* Location: ./ionize/models/database/Navigation.php */
