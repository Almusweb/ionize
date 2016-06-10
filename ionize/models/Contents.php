<?php /* ----------------------------------------------------------------------------------------------------------- */
namespace Model;
/* ----------------------------------------------------------------------------------------------------------------- */
/**
 * Contents model
 *
 * @author Ádám Liszkai <contact@liszkaiadam.hu>
 */
class Contents extends Base
{
	public $table = "contents";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $id_field = "id_content";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $lang_table = "contents_translations";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $id_lang_field = "id_translate";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $view = "content";
	/* ------------------------------------------------------------------------------------------------------------- */
	
	public $database = "default";
	/* ------------------------------------------------------------------------------------------------------------- */
}
/* ----------------------------------------------------------------------------------------------------------------- */
/* End of file: Contents.php */
/* Location: ./ionize/models/Contents.php */
