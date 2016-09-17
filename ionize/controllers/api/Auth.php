<?php

/**
 * Ionize Api Auth class
 *
 * this class will handle Auth JSON-RPC methods
 *
 * @package Ionize
 * @subpackage Core
 *
 * @author	Ádám Liszkai <contact@liszkaiadam.hu>
 * @link	http://ionizecms.com
 * @since	Version 2.0.0
 *
 * @property \Libraries\Api\JSON_RPC\Request $request
 * @property \Libraries\Api\JSON_RPC\Response $response
 */
class Auth extends Libraries\Api\JSON_RPC\Provider
{
	/**
	 * @var array List of custom JSON-RPC errorCodes => messages
	 */
	protected $errors = [
		403=>'Authentication Failed',
	];

	/**
	 * Check login information
	 *
	 * JSON-RPC login check method, which will store the user if it's passes on the auth.
	 * 
	 * @returns bool returning the sucess of the authentication
	 */
	protected function login() : bool
	{
		// Getting the params from the request
		$params = $this->request->params;
	
		// Checking the method paramterers existance
		if(!empty($params->user) && !empty($params->password))
		{
			$users = Model\Data\Users\Users::getInstance();
			
			// Disable cache so the class will have the lattest password data
			$users->cacheEnabled( FALSE );
			
			/**
			 * @throws 403 if multiple users found
			 */
			$foundedUsers = $users->getByLogin( $params->user );
			
			if(count($foundedUsers) === 1)
			{
				$user = $foundedUsers[0];
				
				if($user->authenticate($params->password))
				{
					$this->response->setResult( $user->getData() );
					
					return TRUE;
				}
			}
			
			// User not found or authentication failed with the password
			$this->response->setError(403,"User '{$params->user}' not found and/or authentication Failed!");
		}	
		else $this->response->setError(403,"Missing/Empty user and/or password parameter!");
		
		return FALSE;
	}
}

/* Location: ./ionize/controllers/api/Auth.php */
/* End of file: Auth.php */
