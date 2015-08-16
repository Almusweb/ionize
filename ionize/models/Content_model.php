<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Content_model extends Base_model
{
	public $table 			= 'contents';
	public $id_field 		= 'id_content';
	
	public $lang_table 		= 'contents_translations';
	public $id_lang_field 	= 'id_translation';
	
	public $view 			= 'content';
}
/* End of file: Content_model.php */
/* Location: ./ionize/models/Content_model.php */