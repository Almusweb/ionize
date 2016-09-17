<?php

class Theme extends IO_Controller
{
	private $base_path = NULL;
	private $folders = ['assets','components','elements','scripts','workers'];
	private $url_string = NULL;
	
	private $assets_path = NULL;
	private $components_path = NULL;
	private $elements_path = NULL;
	private $scripts_path = NULL;
	private $workers_path = NULL;

    public function __construct()
    {
		parent::__construct();
		
		// Getting the scriptss folder path in the theme
        $this->base_path  = key($this->ionize->themes_basepath) . DS .'themes' . DS . $this->ionize->theme . DS;
        
        $this->url_string = $this->uri->uri_string();
	    $this->url_string = preg_replace('/('.implode('|', $this->folders).')/i', '', $this->url_string, 1);
	   	Debug($this->url_string, '$this->url_string');
        
        // Checking all theme folders
        $folders = array();
        foreach($this->folders as $folder)
        {
        	$folder_variable = "{$folder}_path";
        
		    $this->{$folder_variable} = $this->base_path . $folder . DS;
		    if(!file_exists($this->{$folder_variable})) $this->{$folder_variable} = NULL;   
		    else $folders[$folder] =& $this->{$folder_variable};
        }        
        $this->folders = $folders;
    }
    
    public function asset()
    {
    	$contentFile = FALSE;
    	
    	$segments = explode('.', $this->url_string);
    	$extension = end($segments);
    	
    	$fileName = $this->url_string;
    	
    	if( $extension == 'random' )
    	{
    		$this->load->helper('directory');
    		$path = str_replace('.random', '', $this->url_string);
    		
    		$map_theme = directory_map($this->assets_path.$path, 1);
    		if(empty($map_theme)) $map_theme = array();
    		Debug($map_theme, '$map_theme');
    		
    		$map_ionize = directory_map(APPPATH.'assets'.DS.$path, 1);
    		if(empty($map_ionize)) $map_ionize = array();
    		Debug($map_ionize, '$map_ionize');
    		
    		$map = array_merge($map_theme, $map_ionize);
    		Debug($map, '$map');
    		
    		if(count($map)>0)
    		{
    			shuffle($map);
    			$fileName = str_replace('.random', $map[0], $fileName);
    			Debug($fileName, '$fileName');
    		}
    	}
    	
		if(file_exists($this->assets_path.$fileName)) $contentFile = $this->assets_path.$fileName;
		elseif(file_exists(APPPATH.'assets'.DS.$fileName)) $contentFile = APPPATH.'assets'.DS.$fileName;
	    
	    if( $contentFile != FALSE )
	    {
	    	$content = file_get_contents($contentFile);
	    	$this->output->set_content_type( $extension );
	    	$this->output->set_output( $content );
	    }
	    else show_404();
    }
    
    public function component()
    {
    	if(file_exists($this->components_path.$this->url_string))
	    {
	    	$content = file_get_contents($this->components_path.$this->url_string);
	    	$tmp = explode('.', $this->url_string);
	    	
	    	$this->output->set_content_type( end($tmp) );
	    	$this->output->set_output( $content );
	    }
	    elseif(file_exists(APPPATH.'components'.DS.$this->url_string))
	    {
	    	$content = file_get_contents(APPPATH.'components'.DS.$this->url_string);
	    	$tmp = explode('.', $this->url_string);
	    	
	    	$this->output->set_content_type( end($tmp) );
	    	$this->output->set_output( $content );
	    }
	    else show_404();
    }
    
    public function element()
    {
    	if(file_exists(APPPATH.'elements'.DS.$this->url_string))
	    {
	    	$content = file_get_contents(APPPATH.'elements'.DS.$this->url_string);
	    	$tmp = explode('.', $this->url_string);
	    	
	    	$this->output->set_content_type( end($tmp) );
	    	$this->output->set_output( $content );
	    }
    	else if(file_exists($this->elements_path.$this->url_string))
	    {
	    	$content = file_get_contents($this->elements_path.$this->url_string);
	    	$tmp = explode('.', $this->url_string);
	    	
	    	$this->output->set_content_type( end($tmp) );
	    	$this->output->set_output( $content );
	    }
	    else show_404();
    }
    
    public function script()
    {
    	if(file_exists($this->scripts_path.$this->url_string))
	    {
	    	$script_content = file_get_contents($this->scripts_path.$this->url_string);
	    	$tmp = explode('.', $this->url_string);
	    	
	    	$this->output->set_content_type( $tmp[1] );
	    	$this->output->set_output( $script_content );
	    }
	    else show_404();
    }
    
    public function manifest()
    {
    	// @todo
    }
    
    public function worker()
    {
    	// @todo
    }
    
    public function serviceWorker()
    {
    	// @todo
    }
}
