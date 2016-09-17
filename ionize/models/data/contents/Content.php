<?php
namespace Model\Data\Contents;

include_once APPPATH.'traits'.DIRECTORY_SEPARATOR.'MagicGet'.PHPEXT;

use Model\Data\Base;

/**
 * Class Content
 */
class Content extends Base
{
	use \Traits\MagicGet;
	
	const id_property = 'id_content';
	const code_property = 'name';

	private $id_content = NULL;
	private $name = NULL;
	
	public function __construct()
	{
		parent::__construct();
	}
}
