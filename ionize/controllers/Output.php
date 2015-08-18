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

	/* ------------------------------------------------------------------------------------------------------------- */	
	
	public function __construct()
	{
		parent::__construct();
		
		//echo '<pre>'.(defined('HHVM_VERSION') ? 'Using HHVM' : 'Not using HHVM').'</pre>';
		
		$this->request_url = $this->uri->uri_string();
		//$this->output->cache(120);
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
			
			$cache_key = md5($this->language.'.'.$this->request_url).'.Output';
			$cache_info = $this->cache->file->get_metadata($cache_key);
			
			$cached_view = $this->cache->file->get($cache_key);
			if($cached_view != FALSE && $this->renderer->checkViewUpdated( $content, $cache_info ) == FALSE)
			{
				// Rendering content by cached view
				$this->output->set_output($cached_view);
			}
			else
			{
				// Rendering content by Content class
				$parsed_view = $this->renderer->parseView( $content );
				$cache = $this->cache->file->save($cache_key, $parsed_view, 3600);
				
				$this->output->set_output($parsed_view);
			}
			
			$this->benchmark->mark('Output_controller_render_end');
		}
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private function _getContent()
	{
		$this->benchmark->mark('Output_controller__get_content_start');
		
		$cache_key = md5($this->language.'.'.$this->request_url).'.Rawdata';
		$cache_data = $this->cache->file->get($cache_key);
		if($cache_data != FALSE)
		{
			$content_data = unserialize($cache_data); // Restoring data by URL
			
			// Restoring Content Data class by Cached Content ID
			$content = \Model\Data\Content::get_instance()->getByID( $content_data->id_content );
			
			$this->benchmark->mark('Output_controller__get_content_end');
			return $this->render( $content );
		}
		
		$this->benchmark->mark('Output_controller__get_content_query_start');
		if(trim($this->request_url) == "") $this->content_model->where('homepage','1');
		else $this->content_model->where("(short_url = '{$this->request_url}' OR long_url = '{$this->request_url}')",NULL);
		$content = $this->content_model->limit(1)->where('language', $this->language)->get();
		$this->benchmark->mark('Output_controller__get_content_query_end');
		
		if($content->num_rows() == 1)
		{
			// Parsing content data and creating content class
			$content_data = $content->row();
			$content = new \Model\Data\Content( $content_data );
			
			// Saving the url cache data
			$this->cache->file->save($cache_key, serialize($content_data), 3600);
			
			$this->benchmark->mark('Output_controller__get_content_end');
			return $this->render( $content );
		}
		else $this->error_404();
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
