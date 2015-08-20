<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Navigation extends Tagmanager implements IonizeLibrary
{

	private $navigation = NULL;

	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct( \Model\Data\Navigation $navigation = NULL )
	{
		parent::__construct();
		
		$this->initialize( $navigation );
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	public function initialize( $data = NULL )
	{
		if($data != NULL) $this->navigation = $data;
	
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */

	public function items()
	{
		if($this->navigation != NULL)
		{
			$return_array = array(); $navigation_items = $this->navigation->items;
			
			// Iterating trough array of data models
			foreach($navigation_items as $index => $item)
			{
				// Setting the default values to the item
				$item_data = array
				(
					'data'		=>	$item,
					'title'		=>	'#missing_title',
					'url'		=>	'#',
				);
				
				// If item is content then override the values
				if( $item->is('content') == TRUE )
				{
					$item_data['title'] = ($item->navigation != "" ? $item->navigation : $item->title);
					$item_data['url'] = site_url($item->url);
				}
				
				// Add item to the output as an object
				$return_array[] = (object) $item_data;
			}
			
			return $return_array;
		}
		else return array();
	} 
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Navigation.php */
/* Location: ./ionize/libraries/Ionize/Navigation.php */
