<?php
namespace Ionize;

require_once APPPATH.'traits'.DIRECTORY_SEPARATOR.'MagicGet.php';

class Article
{
	use \Traits\MagicGet;

	private $id = NULL;
	private $title = NULL;
	private $content = NULL;

}