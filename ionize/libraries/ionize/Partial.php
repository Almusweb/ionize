<?php
namespace Ionize;

class Partial
{

    public function __construct( $arguments=NULL )
    {
	    if( $arguments != NULL )
	    {
		    // @todo Handling arguments
	    }
    }

	public function view( $file )
    {
        $theme = \Ionize\Theme::getInstance();
        $view_path = $theme->getView( $file );

        return $theme->parseView($view_path);
    }
}