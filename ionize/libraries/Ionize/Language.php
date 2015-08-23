<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Language extends Tagmanager implements IonizeLibrary
{

	private $language = NULL;

	/* ------------------------------------------------------------------------------------------------------------- */

	public function initialize( $data = NULL )
	{
		if($data != NULL) $this->language = $data;
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	public function items( $items = NULL )
	{
		if($this->language != NULL) $items = $this->language->items;
	
		if($items != NULL)
		{
			$return_array = array();
			
			foreach($items as $navigation_item)
			{
				$item = $navigation_item;
				$return_array[] = $item;
			}
		
			return $return_array;
		}
		else return array();
	} 
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Navigation.php */
/* Location: ./ionize/libraries/Ionize/Navigation.php */
