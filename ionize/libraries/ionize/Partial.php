<?php
namespace Ionize;

require_once APPPATH.'traits'.DIRECTORY_SEPARATOR.'ionize'.DIRECTORY_SEPARATOR.'Tag'.PHPEXT;

class Partial
{
	use \Traits\Ionize\Tag;

	/**
	 * Partial constructor
	 *
	 * @param null|array $arguments
	 */
    public function __construct( $arguments=NULL )
    {
	    if( $arguments != NULL )
	    {
			foreach($arguments as $index => $argument)
			{
				if(is_numeric($index))
				{
					$args = json_decode($argument);
					foreach($args as $name => $value)
						if(method_exists($this, $name)) $this->output = $this->$name( $value );
				}
				else if(method_exists($this, $index)) $this->output = $this->$index( $argument );
			}

		    Info($arguments, get_class().' Initialized with Arguments');
	    }

	    else Info(get_class().' Initialized');
    }

	/**
	 * Parsing theme view
	 *
	 * adding a view relative path from views folder
	 *
	 * @param string $file
	 * @return string
	 */
	public function view( string $file ) : string
    {
        $theme = \Ionize\Theme::getInstance();
        $view_path = $theme->getView( $file );

        return $theme->parseView($view_path);
    }
}