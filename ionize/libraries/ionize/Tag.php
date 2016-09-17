<?php
namespace Ionize;

use \InvalidArgumentException;
use \Exception;

class Tag
{
	/**
	 * @var Tag
	 */
	private $parent = NULL;


	private $handler = NULL;

	private $name = NULL;
	private $attributes = array();

	private $source = NULL;
	private $tagSource = NULL;
	private $attrSource = NULL;

	private $nativeCodeOpening = '';
	private $nativeCodeClosing = '';
	private $nativeCodeIteratorName = '';

	public function __construct( $source=NULL, $parent=NULL )
	{
		if( $parent != NULL ) $this->parent = $parent;
		if( $source != NULL ) $this->parse( $source );

		Info(get_class().'#'.$this->name.' Initialized');
	}

	public function parse( $source )
	{
		$this->source = $source;
		$source = str_replace(['<','/>','</','>'],'', $source);
		$this->tagSource = $this->attrSource = $source;

		$this->parseName();
		$this->parseAttributes();

		// Loading the handler
		$handler = $this->getHandler();
		$attr = json_encode($this->attributes);

		if($handler == NULL && $this->parent != NULL)
		{
			$propertyName = strtolower($this->name);
			$handlerName = $this->parent->name;
			$value = $this->parent->$propertyName;

			$iteratorName = $this->parent->getNativeCodeIteratorName();
			if(!empty($iteratorName)) $nativeItem = "\${$iteratorName}";
			else $nativeItem = "Ionize::{$handlerName}()";

			$this->nativeCodeOpening = "<?php echo {$nativeItem}->item('{$propertyName}', '{$attr}'); ?>";
		}
		else
		{
			if( strpos($this->source, '/>') !== FALSE )
			{
				$this->nativeCodeOpening = "<?php echo Ionize::{$this->name}('{$attr}')->getOutput(); ?>";
			}
			elseif( \singular($this->name) == $this->name )
			{
				if($this->parent != NULL)
				{
					$iteratorName = $this->nativeCodeIteratorName = $this->parent->getNativeCodeIteratorName();
					if(!empty($iteratorName))
					{
						$this->nativeCodeOpening = "<?php if(\${$iteratorName}->attr('{$attr}') != FALSE): ?>";
						$this->nativeCodeClosing = "<?php endif; ?>";
					}
				}

				if(empty($this->nativeCodeOpening))
				{
					$this->nativeCodeOpening = "<?php if(Ionize::{$this->name}()->attr('{$attr}')->getOutput() != FALSE): ?>";
					$this->nativeCodeClosing = "<?php endif; ?>";
				}
			}
			else
			{
				$iteratorName = $this->nativeCodeIteratorName = \singular($this->name);
				$this->nativeCodeOpening = "<?php foreach(Ionize::{$this->name}()->attr('{$attr}')->getItems() as \${$iteratorName}): ?>";
				$this->nativeCodeClosing = "<?php endforeach; ?>";
			}
		}

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
	    }

	    return $this;
    }

	private function parseAttributes()
	{
		preg_match_all('/([a-zA-Z\-\_]+)=[\'"]([^(\'|")]+)[\'"]/i', $this->attrSource, $matches);
		//Debug($matches, '$attrMatches');

		foreach($matches[0] as $index => $src)
		{
			$name = $matches[1][$index]; $value = $matches[2][$index];
			$this->attributes[ $name ] = $value;
		}

		Debug($this->attributes, '$this->attributes');

		return $this;
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
		return $this->nativeCodeOpening;
	}

	public function getNativeCodeClosing()
	{
		return $this->nativeCodeClosing;
	}

	public function getNativeCodeIteratorName()
	{
		return $this->nativeCodeIteratorName;
	}

	public function __get(string $name)
	{
		Debug($this->handler,'$this->handler');

		// If tag has the property
		if(property_exists($this, $name)) return $this->$name;

		// If tag handler has the property
		else if($this->handler != NULL) return $this->handler->$name;

		// If parent  has the property
		else if($this->parent != NULL) return $this->parent->$name;

		// Else throw exception
		else throw new InvalidArgumentException(get_class($this)."#{$this->name} class does not have '".$name."' property!");
	}
}