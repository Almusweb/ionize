<?php
namespace Libraries\Api\JSON_RPC;

use \InvalidArgumentException;
include_once "Error".PHPEXT;

class Request
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
	 * @var string $method Kérés metódusa
	 */
	protected $method = NULL;
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var array $params Kérés paramétereinek tömbje
	 */
	protected $params = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * @var array $errors Kérés hibáinak tömbje
	 */
	protected $errors = array();
	/* ------------------------------------------------------------------------------------------------------------- */
	
	/**
	 * Konstruktor metódus
	 * 
	 * Beolvassa a php://input -ot és feldolgozza az esetlegesen érkező hibákat
	 * 
	 * @since: 2016.05.04
	 */
	public function __construct( $inputRaw = NULL )
	{
		if( $inputRaw != NULL ) $this->parse( $inputRaw );
		Info($inputRaw, get_class($this).' Initialized with');
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public function parse( $inputRaw )
	{
		$inputJSON = \json_decode($inputRaw, FALSE);
		
		if(!empty($inputJSON))
		{
			if(isset($inputJSON->id)) $this->id = $inputJSON->id;
				
			if(isset($inputJSON->jsonrpc)) $this->version = $inputJSON->jsonrpc;
			else $this->errors[] = new Error(Error::INVALID_JSON, "Missing 'jsonrpc' param in the Request!");
				
			if(isset($inputJSON->method)) $this->method = $inputJSON->method;
			else $this->errors[] = new Error(Error::INVALID_JSON, "Missing 'method' param in the Request!");
				
			if(isset($inputJSON->params)) $this->params = $inputJSON->params;
			//else $this->errors[] = new Error(Error::$INVALID_JSON, "Missing 'params' param in the Request!");
				
			// Ha eddig nem volt probléma, akkor ellenőrzöm a tartalmakat is
			if(count($this->errors) <= 0)
			{
				// Ellenőrzöm, hogy JSON-RPC 2.0-ról van-e szó
				if( empty($this->version) && $this->version != '2.0' )
					$this->errors[] = new Error(Error::NOT_VALID, "Not valid 'jsonrpc' param in the Request!");
						
				// Ellenőrzöm, hogy a paraméterek tényleg tömb-e
				if( !is_array($this->params) )
					if( !is_object($this->params) )
						$this->errors[] = new Error(Error::NOT_VALID, "Not valid 'params' param in the Request!");
					
			}
		}
	}
	
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
			'id'		=>	$this->id,
			'jsonrpc'	=>	$this->version,
			'method'	=>	$this->method,
			'params'	=>	$this->params,
		];
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
}
/* ----------------------------------------------------------------------------------------------------------------- */
/* End of file: Request.php */
/* Location: ./server/models/utility/Request.php */
