<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Output extends IO_Controller
{
	public $request_url = NULL;

	public static $current_content = NULL;

	/* ------------------------------------------------------------------------------------------------------------- */	
	
	public function __construct()
	{
		parent::__construct();
				
		$this->request_url = $this->uri->uri_string();
		$this->output->cache( $this->io_config->output_cache );
		
		//$this->output->enable_profiler(TRUE);
	}

	/* ------------------------------------------------------------------------------------------------------------- */	

	public function index()
	{
		// @todo: check install
	
		$this->render( NULL );
	}
	/* ------------------------------------------------------------------------------------------------------------- */	
	
	public function render( $content=NULL )
	{
		if($content == NULL) return $this->_getContent();
		else
		{
			$this->benchmark->mark('Output_controller_render_start');
			
			// Create a reference to the current content
			self::$current_content =& $content;
			
			// Load the languages
			$this->_getLanguages();
			
			// Load the navigations
			$this->_getNavigations();
			
			if($this->io_config->views_cache > 0)
			{
				// Check the Output cache file
				$cache_key = md5($this->language.'.'.$this->request_url).'.Output';
				$cache_info = $this->cache->file->get_metadata($cache_key);
			
				$cached_view = $this->cache->file->get($cache_key);
				if($cached_view != FALSE && $this->renderer->checkViewUpdated( $content, $cache_info ) == FALSE)
				{					
					// Rendering content by cached view
					$this->output->set_output($cached_view);
					
					return; // Exit the code
				}
			}
			
			// Rendering content by Content class
			$parsed_view = $this->renderer->parseView( $content );
			
			// Save Output cache if enabled
			if($this->io_config->views_cache > 0)
				$this->cache->file->save($cache_key, $parsed_view, $this->io_config->views_cache);
			
			// Set Output to the parsed view
			$this->output->set_output($parsed_view);
			
			$this->benchmark->mark('Output_controller_render_end');
		}
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private function _getContent()
	{
		$this->benchmark->mark('Output_controller__getContent_start');
		$this->benchmark->mark('Output_controller__getContent_query_start');
		
		// Delete cache if disabled
		if($this->io_config->select_cache == FALSE) $this->content_model->cache_delete('output', 'render');
		
		// Start Content Select Cache if enabled
		if($this->io_config->select_cache == TRUE) $this->content_model->cache_on();
		
		// Detect the current Content
		if($this->request_url == "")
		{
			$this->content_model->where('homepage','1');
		}
		else
		{
			$this->content_model->where("url",'/'.$this->request_url);
		}
		
		// Get the current Content
		$content = $this->content_model->get();
				
		// End Content Select Cache if enabled
		if($this->io_config->select_cache == TRUE) $this->content_model->cache_off();
		
		$this->benchmark->mark('Output_controller__getContent_query_end');
		
		// If Content available
		if($content->num_rows() == 1)
		{
			// Parsing content data and creating content class
			$content_data = $content->row();
			$content = new \Model\Data\Content( $content_data, TRUE );
			
			$this->benchmark->mark('Output_controller__getContent_end');
			return $this->render( $content );
		}
		else
		{
			$this->benchmark->mark('Output_controller__getContent_end');
			return $this->error_404();
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private function _getNavigations()
	{
		$this->benchmark->mark('Output_controller__getNavigations_start');
		$this->benchmark->mark('Output_controller__getNavigations_query_start');
		
		if($this->io_config->select_cache == FALSE) $this->navigation_model->cache_delete('output', 'render');
		if($this->io_config->select_cache == TRUE) $this->navigation_model->cache_on();
		
		$query = $this->navigation_model->get();
		
		if($this->io_config->select_cache == TRUE) $this->navigation_model->cache_off();
		$this->benchmark->mark('Output_controller__getNavigations_query_end');
		
		$navigations = NULL;
		if($query->num_rows() > 0)
		{
			$navigations = new \Model\Data\Navigation( $query->result() );
			$this->renderer->assign('navigations', $navigations);
		}
		
		$this->benchmark->mark('Output_controller__getNavigations_start');
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private function _getLanguages()
	{
		$this->benchmark->mark('Output_controller__getLanguages_start');
		$this->renderer->assign('languages', $this->language_data);
		$this->benchmark->mark('Output_controller__getLanguages_end');
	}
	
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function error_404()
	{
		show_404();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Output.php */
/* Location: ./ionize/controllers/Output.php */
