<?php
/* ----------------------------------------------------------------------------------------------------------------- */

/**
 * Class IO_Autoloader
 *
 * loads resources from namespaces
 */
class IO_Autoloader
{
	private static $ci = NULL;

	public static function run( string $class_name ) : bool
	{
		if ( ! class_exists($class_name))
		{
			if( self::$ci == NULL ) self::$ci =& get_instance();

			Debug($class_name, 'IO_Autoloader::run');
			$segments = explode('\\', $class_name);

			if(count($segments) < 2) Debug(debug_backtrace(), 'Backtrace');

			$class_type = strtolower($segments[0]);
			unset($segments[0]);

			$class_name = end($segments);
			$endIndex = key($segments);

			foreach($segments as $idx => $segment)
				if( $endIndex != $idx ) $segments[$idx] = strtolower($segment);

			$filename = implode(DIRECTORY_SEPARATOR, $segments);

			if($class_type == 'model')
			{
				Debug($filename, 'include model');
				self::$ci->load->model($filename, FALSE);
			}

			if($class_type == 'libraries' || $class_type == 'ionize')
			{
				if($class_type == 'ionize') $filename = 'ionize'.DIRECTORY_SEPARATOR.$filename;
			
				Debug($filename, 'include library');
				self::$ci->load->library($filename, FALSE);
			}

			return TRUE;
		}

		return FALSE;
	}
}
/* ----------------------------------------------------------------------------------------------------------------- */

spl_autoload_register('\\IO_Autoloader::run');

/* ----------------------------------------------------------------------------------------------------------------- */
/* End of file: IO_Autoloader.php */
/* Location: ./ionize/core/IO_Autoloader.php */
