<?php /* ----------------------------------------------------------------------------------------------------------- */
namespace Traits;
/* ----------------------------------------------------------------------------------------------------------------- */
use \InvalidArgumentException;
/* ----------------------------------------------------------------------------------------------------------------- */
trait MagicGet
{
	/**
	 * Magic Get metódus
	 *
	 * @param string $name
	 * @return mixed
	 */
	public function __get( $name )
	{
		if( $name == 'id' && isset($this->id_property) ) return $this->{$this->id_property};
		if( $name == 'code' && isset($this->code_property) ) return $this->{$this->code_property};
		
		// Checking the property is exists?
		if ( property_exists($this, $name) ) return $this->$name;

		// Maybe capitalized?
		else if ( property_exists($this, strtoupper($name)) ) return $this->{strtoupper($name)};
	
		// Else throw exception
		else throw new InvalidArgumentException(get_class($this)." class does not have '".$name."' property!");
	}
	/* ------------------------------------------------------------------------------------------------------------- */
	
	
	/**
	 * Tömb kérése az osztályból
	 *
	 * @return array
	 */
	public function getData()
	{
		$return = array();
		foreach(get_object_vars( $this ) as $name => $value)
			$return[ strtolower($name) ] = $value;
	
			return $return;
	}
	/* ------------------------------------------------------------------------------------------------------------- */
}
