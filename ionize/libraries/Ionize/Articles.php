<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Articles extends Tagmanager implements IonizeLibrary
{

	private $content = NULL;

	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function initialize( $data = NULL )
	{
		// If nothing added then load the current content
		if($data == NULL) $this->content =& Output::$current_content;
		
		// If object then it should be content
		elseif( is_object($data) ) $this->content =& $data;
		
		// If numeric then get the content by ID
		elseif( is_numeric($data) )
		{
			// @todo: get content by id
		}
		
		// If string then get the content by CODE
		elseif( is_string($data) )
		{
			// @todo: get content by code
		}
		
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function get()
	{
		if($this->content != NULL)
		{
			return $this->content->items;
		}
		else return array();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Article.php */
/* Location: ./ionize/libraries/Ionize/Article.php */
