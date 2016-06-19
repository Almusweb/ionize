<?php

class Components extends IO_Controller
{
    private $path = NULL;

    public function __construct()
    {
        parent::__construct();

        // Getting the components folder path in the theme
        $this->path  = key($this->ionize->themes_basepath) . DIRECTORY_SEPARATOR .'themes' . DIRECTORY_SEPARATOR;
        $this->path .= $this->ionize->theme . DIRECTORY_SEPARATOR . 'components' . DIRECTORY_SEPARATOR;

        // Checking the components folder existance
        if(!file_exists($this->path)) $this->path = NULL;
    }

    public function get( $component=NULL, $source=NULL, $type='.' )
    {
	    Debug("$component / $source / $type",'Components->get()');
	    $url_string = $this->uri->uri_string();

	    $component_path = $this->path . $component . DIRECTORY_SEPARATOR;
	    Debug($component_path, '$component_path');

		$bower_file = $component_path . 'bower.json';
	    Debug($bower_file, '$bower_file');

	    $url_string = str_replace("components/{$component}/", '', $url_string);

	    // If need a specific component file
	    if(strpos($url_string, '.') !== FALSE)
	    {
		    $file_path = $url_string;

		    $component_file = $component_path . $file_path;
		    if(file_exists($component_file))
		    {
			    $output = file_get_contents($component_file);
			    $extension = substr($component_file, strrpos($component_file, '.') + 1);

			    $this->output->set_content_type(".{$extension}");
			    $this->output->set_output($output);
		    }
		    else show_404();
	    }
	    // If bower file is exists
	    else if( file_exists($bower_file) )
	    {
		    $bower_config = json_decode( file_get_contents($bower_file), FALSE );
		    Debug($bower_config, '$bower_config');

		    if(isset($bower_config->main))
		    {
			    if(is_string($bower_config->main)) $main_file = $bower_config->main;

			    if( is_array($bower_config->main) )
				    foreach($bower_config->main as $main) if(strpos($main, ".$source") !== FALSE) $main_file = $main;
		    }
		    // else @todo

		    if(!empty($main_file))
		    {
			    $component_file = $component_path . $main_file;
			    if( strpos($component_file, $source) !== FALSE )
			    {
				    if( $type != '.' ) $type = '.'.$type.'.';
				    $component_file = str_replace(".{$source}", "{$type}{$source}", $component_file);
			    }
			    // else @todo
			    Debug($component_file, '$component_file');

			    $output = file_get_contents($component_file);
			    $this->output->set_content_type(".$source");
			    $this->output->set_output($output);
		    }
		    else show_404();
	    }
	    // If component file is in the root fo the component folder
	    else
	    {
			$component_file = $component_path . $component . '.' . $source;
		    if(file_exists($component_file))
		    {
			    $output = file_get_contents($component_file);
			    $this->output->set_content_type(".$source");
			    $this->output->set_output($output);
		    }
		    else show_404();
	    }
    }
}