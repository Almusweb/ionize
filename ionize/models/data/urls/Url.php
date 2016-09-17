<?php
namespace Model\Data\Urls;

include_once APPPATH.'traits'.DIRECTORY_SEPARATOR.'MagicGet'.PHPEXT;

use Model\Data\Base;

/**
 * Class Url
 */
class Url extends Base
{
	use \Traits\MagicGet;
	
	const id_property = 'id_url';

	protected $id_url = NULL;
	
	public function __construct()
	{
		parent::__construct();
	}
}
