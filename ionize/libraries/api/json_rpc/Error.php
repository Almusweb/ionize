<?php
namespace Libraries\Api\JSON_RPC;

class Error
{
	const INVALID_JSON		= ['code' => -32700, 'message' => 'Parse error'];
	/* ------------------------------------------------------------------------------------------------------------- */
	
	const NOT_VALID			= ['code' => -32600, 'message' => 'Invalid Request'];
	/* ------------------------------------------------------------------------------------------------------------- */
	
	const METHOD_NOT_FOUND	= ['code' => -32601, 'message' => 'Method not found'];
	/* ------------------------------------------------------------------------------------------------------------- */
	
	const INVALID_PARAMS	= ['code' => -32602, 'message' => 'Invalid params'];
	/* ------------------------------------------------------------------------------------------------------------- */
	
	const INTERNAL_ERROR	= ['code' => -32603, 'message' => 'Internal error'];
	/* ------------------------------------------------------------------------------------------------------------- */
	
	const ERROR_CODES = [
		-32700 => 'INVALID_JSON',
		-32600 => 'NOT_VALID',
		-32601 => 'METHOD_NOT_FOUND',
		-32602 => 'INVALID_PARAMS',
		-32603 => 'INTERNAL_ERROR'
	];
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $code = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $message = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	private $data = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __construct( array $errorInfo=[], string $data="" )
	{
		if(count($errorInfo)>0)
		{
			$this->code = $errorInfo['code'];
			$this->message = $errorInfo['message'];
			$this->data = $data;
		}
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function __get( $name )
	{
		// Ha létezik a változó akkor visszaadom
		if(property_exists($this, $name)) return $this->$name;
		
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
		return [
			'code'		=>	$this->code,
			'message'	=>	$this->message,
			'data'		=>	$this->data,
		];
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
