<?php
namespace Ionize\Pages;

require_once APPPATH.'traits'.DIRECTORY_SEPARATOR.'MagicGet'.PHPEXT;
require_once APPPATH.'traits'.DIRECTORY_SEPARATOR.'ionize'.DIRECTORY_SEPARATOR.'Tag'.PHPEXT;

class Page
{
	use \Traits\MagicGet;
	use \Traits\Ionize\Tag;

	private $data = NULL;

	public function __construct( \Model\Data\Contents\Content $content = NULL )
	{
		if( $content != NULL )
		{
			$this->data = $content;
		}

		Info(get_class().' Initialized');
	}

}