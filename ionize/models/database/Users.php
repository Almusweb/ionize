<?php
namespace Model\Database;

/**
 * Users model
 *
 * @author Ádám Liszkai <contact@liszkaiadam.hu>
 */
class Users extends Base
{
	public $table = "users";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $id_field = "id_user";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $view = "user";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $database = "default";
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* ----------------------------------------------------------------------------------------------------------------- */
/* End of file: Users.php */
/* Location: ./ionize/models/Users.php */
