<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @package	Ionize
 * @author	Adam Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 */
class Output extends IO_Controller
{
	public function index()
	{
		$homepage = $this->contents->where('homepage','1')->where('language', $this->language)->get();
		if($homepage->num_rows() > 0) $this->render( $homepage->row()->id_content );
		else redirect( 'setup' );
	}
	/* ------------------------------------------------------------------------------------------------------------- */	
	
	public function render( $id_content=NULL )
	{
		if($id_content == NULL) return $this->_get_content();
		else
		{
			echo "render";
		}
		return FALSE;		
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private function _get_content()
	{
		echo "get_content";
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
