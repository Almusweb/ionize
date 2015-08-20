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
		/*
		$homepage = $this->contents->where('homepage','1')->where('language', $this->language)->get();
		if($homepage->num_rows() > 0) $this->render( $homepage->row()->id_content );
		else redirect( 'setup' );
		*/
		$this->render( NULL );
	}
	/* ------------------------------------------------------------------------------------------------------------- */	
	
	public function render( $content=NULL )
	{
		if($content == NULL) return $this->_getContent();
		else
		{
			$this->benchmark->mark('Output_controller_render_start');
			
			self::$current_content = $content;
			
			$cache_key = md5($this->language.'.'.$this->request_url).'.Output';
			$cache_info = $this->cache->file->get_metadata($cache_key);
			
			$this->_getNavigations();
			
			$cached_view = ($this->io_config->views_cache > 0 ? $this->cache->file->get($cache_key) : FALSE);
			if($cached_view != FALSE && $this->renderer->checkViewUpdated( $content, $cache_info ) == FALSE)
			{
				// Rendering content by cached view
				$this->output->set_output($cached_view);
			}
			else
			{
				// Rendering content by Content class
				$parsed_view = $this->renderer->parseView( $content );
				
				if($this->io_config->views_cache > 0)
					$this->cache->file->save($cache_key, $parsed_view, $this->io_config->views_cache);
				
				$this->output->set_output($parsed_view);
			}
			
			$this->benchmark->mark('Output_controller_render_end');
		}
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private function _getContent()
	{
		$this->benchmark->mark('Output_controller__getContent_start');
		$this->benchmark->mark('Output_controller__getContent_query_start');
		
		if($this->io_config->select_cache == FALSE) $this->content_model->cache_delete('output', 'render');
		if($this->io_config->select_cache == TRUE) $this->content_model->cache_on();
		if(trim($this->request_url) == "")
		{
			$this->content_model->where('homepage','1');
		}
		else
		{
			$url = $this->request_url;
			$this->content_model->where("(short_url = '{$url}' OR long_url = '{$url}')",NULL);
		}
		$content = $this->content_model->limit(1)->where('language', $this->language)->get();
		if($this->io_config->select_cache == TRUE) $this->content_model->cache_off();
		
		$this->benchmark->mark('Output_controller__getContent_query_end');
		
		if($content->num_rows() == 1)
		{
			// Parsing content data and creating content class
			$content_data = $content->row();
			$content = new \Model\Data\Content( $content_data );
			
			$this->benchmark->mark('Output_controller__getContent_end');
			return $this->render( $content );
		}
		else $this->error_404();
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
	
	public function error_404()
	{
		show_404();
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* End of file: Output.php */
/* Location: ./ionize/controllers/Output.php */
