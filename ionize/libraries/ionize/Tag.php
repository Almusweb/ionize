<?php
namespace Ionize;

class Tag
{
	private $parent = NULL;
	private $handler = NULL;

	private $name = NULL;
	private $attributes = array();

	private $tagSource = NULL;
	private $attrSource = NULL;

	public function __construct( $source=NULL, $parent=NULL )
	{
		if( $parent != NULL ) $this->parent = $parent;
		if( $source != NULL ) $this->parse( $source );

		Info(get_class().'#'.$this->name.' Initialized');
	}

	public function parse( $source )
	{
		$source = str_replace(['<','/>','</','>'],'', $source);
		$this->tagSource = $this->attrSource = $source;

		$this->parseName();
		$this->parseAttributes();

		return $this;
	}


	private function parseName()
    {
	    preg_match('/ion:([a-z:]+)?([^>]*)/i', $this->tagSource, $matches);

	    // If there is a match to the pattern
	    if(isset($matches[1]) && !empty($matches[1]))
	    {
		    // Format the tag name to match the class names
		    $this->name = ucfirst(strtolower($matches[1]));

		    // Delete tag name from the Attributes source
		    $this->attrSource = trim(str_replace('ion:'.$this->name,'', $this->attrSource));

		    // Loading the handler
		    $this->getHandler();
	    }
    }

	private function parseAttributes()
	{
		//preg_match_all('/([a-z]+=)?[\\\'"]([\\w/]*)[\\\'"]/i', $this->attrSource, $matches);




	}

	private function getHandler()
	{
		// Getting cached handler if already determined
		if($this->handler != NULL) return $this->handler;

		// else load the class and save the Instance
		else
		{
			// Checking the file existent
			$filename = $this->name.PHPEXT;
			if(file_exists(dirname(__FILE__).DIRECTORY_SEPARATOR.$filename))
			{
				// Full className
				$className = "Ionize\\{$this->name}";

				// Require class
				require_once $this->name.PHPEXT;

				// Save a new Instance
				$this->handler = new $className( $this->attributes );
			}

			return $this->handler;
		}
	}

	public function getNativeCodeOpening()
	{
		return '';
	}

	public function getNativeCodeClosing()
	{
		return '';
	}
}