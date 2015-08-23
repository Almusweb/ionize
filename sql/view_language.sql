CREATE OR REPLACE VIEW `language`
AS
	SELECT
		`l`.`id_language` 			AS `id_language`,
		`l`.`code` 							AS `language`,
		`l`.`ordering` 					AS `ordering`,

		`l`.`url` 							AS `code`,
		`l`.`name` 							AS `name`,
		
		`l`.`default`						AS `default`

	FROM languages l

	ORDER BY l.ordering ASC