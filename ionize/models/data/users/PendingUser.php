<?php
namespace Model\Data\Contents;

use Model\Data\Base;

class PendingUser implements PendingUser extends Base
{
	private $id_user = NULL;
	private $login = NULL;
	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function authenticate(): User
	{
		
	}
}
