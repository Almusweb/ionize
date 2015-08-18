<?php namespace Model\Database;

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Content extends \Model\Base
{
	public static $instance = NULL;

	/* ------------------------------------------------------------------------------------------------------------- */
	public $table 			= 'contents';
	public $id_field 		= 'id_content';
	
	public $lang_table 		= 'contents_translations';
	public $id_lang_field 	= 'id_translation';
	
	public $view 			= 'content';
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
