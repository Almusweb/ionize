<?php
namespace Ionize\Articles;

require_once APPPATH.'traits'.DIRECTORY_SEPARATOR.'MagicGet.php';
require_once APPPATH.'traits'.DIRECTORY_SEPARATOR.'ionize'.DIRECTORY_SEPARATOR.'Tag'.PHPEXT;

class Article
{
	use \Traits\MagicGet;
	use \Traits\Ionize\Tag;

	public function __construct( $content=NULL )
	{
		if($content != NULL)
		{
			$this->data = $content;
		}

		Info(get_class().' Initialized');
	}

}