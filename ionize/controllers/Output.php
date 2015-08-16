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
			
			$cache_key = $this->language.'.'.str_replace('/','.',$this->request_url).'.View';
			$cache_info = $this->cache->file->get_metadata($cache_key);
			
			$cache = $this->cache->file->get($cache_key);
			if($cache != FALSE && $this->renderer->checkViewUpdated( $content, $cache_info ) == FALSE)
			{
				echo $cache;
			}
			else
			{
				// Rendering content by Content class
				$parsed_view = $this->renderer->parseView( $content );
				$cache = $this->cache->file->save($cache_key, $parsed_view, $this->setting->cache_time );
				echo $parsed_view;
			}
			
			$this->benchmark->mark('Output_controller_render_end');
		}
		return FALSE;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private function _getContent()
	{
		$this->benchmark->mark('Output_controller__get_content_start');
		
		$cache_key = $this->language.'.'.str_replace('/','.',$this->request_url).'.Content';
		
		$cache = $this->cache->file->get($cache_key);
		if($cache != FALSE)
		{
			$this->benchmark->mark('Output_controller__get_content_end');
			
			$content = unserialize($cache);
			$content->restoreSerialized();
			
			return $this->render( $content );
		}
		
		$this->benchmark->mark('Output_controller__get_content_query_start');
		if(trim($this->request_url) == "") $this->contents->where('homepage','1');
		else $this->contents->where("(short_url = '{$this->request_url}' OR long_url = '{$this->request_url}')",NULL);
		$content = $this->contents->limit(1)->where('language', $this->language)->get();
		$this->benchmark->mark('Output_controller__get_content_query_end');
		
		if($content->num_rows() == 1)
		{
			// Parsing content data and creating content class
			$content = new Content( $content->row() );
			
			$cache = $this->cache->file->save($cache_key, $content->getSerialized(), $this->setting->cache_time );
			
			$this->benchmark->mark('Output_controller__get_content_end');
			return $this->render( $content );
		}
		//else $this->error_404();
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