<?php

defined('BASEPATH') OR exit('No direct script access allowed');

if ( ! function_exists('current_language'))
{
	function current_language()
	{
		// Load codeigniter and the Ionize config
		$ci =& get_instance(); $ci->config->load('ionize');
		
		// Return language code
		return ($ci->session->language == NULL ? $ci->config->item('language') : $ci->session->language);
	}
}
