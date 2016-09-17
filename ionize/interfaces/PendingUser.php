<?php

interface PendingUser
{
	private $id_user;
	private $login;
	private $encryption;
	private $password;
	private $hash;
	
	public function authenticate(): Model\Data\Users\User;
}
