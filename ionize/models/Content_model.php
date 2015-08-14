<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Content_model extends Base
{
	public $table 			= 'contents';
	public $id_field 		= 'id_content';
	
	public $lang_table 		= 'contents_translations';
	public $id_lang_field 	= 'id_translation';
	
	public $view 			= 'content';
}
