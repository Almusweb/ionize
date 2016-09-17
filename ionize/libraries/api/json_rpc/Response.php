<?php 
namespace Libraries\Api\JSON_RPC;

use \InvalidArgumentException;
include_once "Error".PHPEXT;

class Response
{
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var string $id Kérés azonosítója
	 */
	protected $id = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var string $version JSON-RPC verziószáma
	 */
	protected $version = '2.0';
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var array $result Válasz adatai
	 */
	protected $result = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var array $errors Válasz hibáinak tömbje
	 */
	protected $errors = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var Request $request A kérés objektuma
	 */
	private $request = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var array $customErrors Custom errors from the Api Controller
	 */
	private $customErrors = [];
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Konstruktor metódus
	 * 
	 * @since: 2016.05.04
	 */
	public function __construct( Request $request = NULL, array $customErrors = [] )
	{
		// Megnézem van-e átadva paraméter
		if($request != NULL)
		{
			// Elmentem a kérés objektumot
			$this->request =& $request;
			
			// Ha voltak a kérésben hibák
			if(count($this->request->errors) > 0)
			{
				$this->errors = $this->request->errors;
				$this->id = NULL;
			}
			else $this->id = $this->request->id;
			
			// Saving the Custom Errors from the API
			$this->customErrors = $customErrors;
		
			Info($request, get_class($this).' Initialized width');
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function setError( int $errorCode, string $data = "" ) : Response
	{
		$error = FALSE;
		
		if(isset(Error::ERROR_CODES[$errorCode]))
		{
			$errorCode = Error::ERROR_CODES[$errorCode];
			$error = new Error(constant(__NAMESPACE__."\\Error::{$errorCode}"), $data);
		}
		
		if( $error == FALSE && $errorCode >= -32768 && $errorCode <= -32000 )
			$error = new Error(Error::INTERNAL_ERROR, 'JSON-RPC Reserved Undefined ErrorCode:'.$errorCode);
		
		if( $error == FALSE && isset($this->customErrors[$errorCode]))
			$error = new Error(['code'=>$errorCode,'message'=>$this->customErrors[$errorCode]], $data);
	
		if( $error == FALSE ) $this->errors[] = new Error(Error::INTERNAL_ERROR, 'Missing ErrorCode:'.$errorCode);
		else $this->errors[] = $error;
		
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function addResult( $item ) : Response
	{
		$this->result[] = $item;
	
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function setResult( array $result) : Response
	{
		$this->result = $result;
		
		return $this;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function getResult() : array
	{
		return $this->result;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __get( $name )
	{
		// Ha létezik a változó akkor visszaadom
		if(property_exists($name, $this)) return $this->$name;
		
		// Dobok hibát ha nem lérezne a változó
		else throw new InvalidArgumentException("Property '{$name}' does not exists in class: ".get_class($this));
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __toString() : string
	{
		return json_encode( $this->__toArray() );
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __toArray() : array
	{
		$errors = array();
	
		foreach($this->errors as $error)
			$errors[] = $error->__toArray();
	
		return [
			'id'		=>	count($this->errors) > 0 ? null : $this->id,
			'jsonrpc'	=>	$this->version,
			'result'	=>	count($this->errors) > 0 ? [] : $this->result,
			'error'		=>	$errors,
		];
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* ----------------------------------------------------------------------------------------------------------------- */
/* End of file: Request.php */
/* Location: ./server/models/utility/Request.php */
