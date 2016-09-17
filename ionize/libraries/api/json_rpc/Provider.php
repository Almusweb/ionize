<?php
namespace Libraries\Api\JSON_RPC;

use \Exception;

abstract class Provider extends \IO_Controller
{
	protected $request = NULL;
	protected $response = NULL;
	protected $errors = [];
	
	private $responded = FALSE;

	public function __construct()
	{
		parent::__construct();
		
		$this->load->library(['api/json_rpc/Request'=>NULL,'api/json_rpc/Response'=>NULL]);
		
		$inputRaw = file_get_contents('php://input');
		
		$this->request = new Request( $inputRaw );
		$this->response = new Response( $this->request, $this->errors );
		
		Info(get_class($this).' Initialized');
	}
	
	public function index()
	{
		$returns = NULL;
		$methodName = $this->request->method;
		
		try
		{
			if( !empty( $methodName ) )
			{
				if( method_exists( $this, $methodName ) ) $returns = $this->$methodName();	
				else $this->response->setError(-32601, "Missing '{$methodName}' method!");
			
				if( $returns === NULL )
					$this->response->setError(-32603, "Empty return at '{$methodName}' method!");
			}
			else $this->response->setError(-32601, "Empty method name!");
		}
		catch( Exception $e)
		{
			$this->response->setError(-32603, "Exception in '{$methodName}' method: ".$e->getMessage());
		}
		
		$this->respond();
	}
	
	private function respond()
	{
		if($this->responded == false)
		{
			$this->output->set_content_type('application/json');
			$this->output->set_output( $this->response );
			Debug($this->response, '$this->response');
			
			$this->responded = true;
		}
		
		return $this->responded;
	}
}
