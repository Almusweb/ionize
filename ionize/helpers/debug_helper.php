<?php

/**
 * Debug metódus
 *
 * @description: Képernyőre kiír ha debug mód van, illetve logol automatikusan
 * @created: 2014.12.02 13:30 - Liszkai Ádám
 *
 * @param $msg string Logolni kívánt üzenet
 * @param $label string Logolni kívánt üzenet előtagja
 * @param $type string Logolás típusa
 */
if( !function_exists('Debug') )
{
	function Debug($msg, $label=NULL, $type="debug", $row_color=NULL)
	{
		$debug_enable = ( isset($_GET['debug']) && ENVIRONMENT != 'production' ? TRUE : FALSE );
		
		if($msg === TRUE) $msg = "TRUE";
		if($msg === FALSE) $msg = "FALSE";
		
		if($debug_enable == TRUE && !defined('ARGV'))
		{
			echo "<pre>".'['.date("H:i:s").'] '.($label!=NULL?'<b>'.ucfirst($label).'</b>: ':'').(is_string($msg)?htmlspecialchars($msg):print_r($msg, true))."</pre>";
			ob_flush(); flush(); // Kimenet küldése
		}
	
		if(defined('ARGV'))
		{
			$color = "\033[1;37m";
			if(strtoupper($type)=="DEBUG") $color = "\033[1;30m";
			if(strtoupper($type)=="INFO") $color = "\033[1;37m";
			if(strtoupper($type)=="ERROR") $color = "\033[0;31m";
			
			if($row_color != NULL) $color = "\033[".$row_color."m";
			
			fputs(STDOUT, $color.($msg!="\n"?'['.date("Y-m-d H:i:s").'] ':'').($label!=NULL?ucfirst($label).': ':'').(is_string($msg)?ucfirst($msg):print_r($msg, true))."\033[0m\t\n");
		}
		
		log_message($type,($label!=NULL?ucfirst($label).': ':'').(is_string($msg)?ucfirst($msg):print_r($msg, true)));
	}
}

if( !function_exists('Info') )
{
	function Info($msg, $label=NULL, $type="info", $row_color=NULL)
	{
		Debug($msg, $label, $type, $row_color);
	}
}
