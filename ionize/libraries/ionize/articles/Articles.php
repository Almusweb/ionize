<?php
namespace Ionize\Articles;

require_once APPPATH.'traits'.DIRECTORY_SEPARATOR.'MagicGet'.PHPEXT;
require_once APPPATH.'traits'.DIRECTORY_SEPARATOR.'ionize'.DIRECTORY_SEPARATOR.'Tag'.PHPEXT;
require_once 'Article'.PHPEXT;

class Articles
{
	use \Traits\MagicGet;
	use \Traits\Ionize\Tag;

	private $parent = NULL;

	public function __construct( $attributes=NULL, $parent=NULL )
	{
		$ionize = \Ionize::getInstance();
		Debug($ionize, '$ionize');

		if(count($ionize->contents) > 0) $this->output = TRUE;

		foreach($ionize->contents as $content)
			$this->addItem( new Article( $content ) );

		Info(get_class().' Initialized');
	}
}