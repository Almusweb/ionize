<?php
namespace Contents;

include_once APPPATH.'traits/MagicGet.php';

/**
 * Class Content
 * @package Contents
 */
class Content
{
	use \Traits\MagicGet;
	
	private $id_property = 'id_content';
	private $code_property = 'name';

	private $id_content = NULL;
	private $name = NULL;
	
	private $id_type = NULL;
	private $type = NULL;
	
	private $ordering = NULL;
	
	private $id_language = NULL;
	private $language = NULL;
	
	private $publish_on = NULL;
	private $publish_on_unix = NULL;
	
	private $publish_off = NULL;
	private $publish_off_unix = NULL;
	
	private $logical_date = NULL;
	private $logical_date_unix = NULL;
	
	private $created = NULL;
	private $created_unix = NULL;
	
	private $updated = NULL;
	private $updated_unix = NULL;
	
	private $extends_data = NULL;

	private $default_layout = NULL;
	private $default_list_view = NULL;
	private $default_single_view = NULL;
	private $default_item_view = NULL;

	private $layout = NULL;
	private $list_view = NULL;
	private $single_view = NULL;
	private $item_view = NULL;
	private $view = NULL;
	
	private $short_url = NULL;
	private $long_url = NULL;
	
	private $title = NULL;
	private $subtitle = NULL;
	private $preview = NULL;
	private $window = NULL;
	
	private $content = NULL;
	private $keywords = NULL;
	private $description = NULL;
	private $extends_data_lang = NULL;
	
	private $indexed = NULL;
	private $has_url = NULL;
	private $has_children = NULL;
	private $flag = NULL;
	private $priority = NULL;
	private $children = NULL;
	
	private $id_author = NULL;
	private $author_login = NULL;
	private $author_name = NULL;
	private $author_forname = NULL;
	private $author_lastname = NULL;
	private $author_email = NULL;
	private $author_extends_data = NULL;
	
	private $id_updater = NULL;	
	private $updater_login = NULL;
	private $updater_name = NULL;
	private $updater_forname = NULL;
	private $updater_lastname = NULL;
	private $updater_email = NULL;
	private $updater_extends_data = NULL;
	
	private $default_language = NULL;
	private $homepage = NULL;

	public function getView()
	{
		if( !empty($this->view) ) return $this->view;
		else return $this->default_single_view;
	}
}
