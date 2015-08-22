<?php namespace Model\Database;

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class User extends \Model\Base
{
	public static $instance = NULL;

	/* ------------------------------------------------------------------------------------------------------------- */
	public $table 			= 'users';
	public $id_field 		= 'id_user';
	
	public $lang_table 		= '';
	public $id_lang_field 	= '';
	
	public $view 			= 'user';
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct()
	{
		parent::__construct();
		
		// Saving instance reference
		self::$instance = $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public static function get_instance()
	{
		return self::$instance;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Content_model.php */
/* Location: ./ionize/models/database/Content.php */
