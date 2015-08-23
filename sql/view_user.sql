CREATE OR REPLACE VIEW `user`
AS
	SELECT
		`u`.`id_user` 													AS `id_user`,
		`u`.`login` 														AS `login`,

		`u`.`encryption` 												AS `encryption`,
		`u`.`password` 													AS `password`,

		`u`.`name` 																AS `name`,
		`u`.`email` 															AS `email`,
		`u`.`forname` 														AS `forname`,
		`u`.`lastname` 														AS `lastname`,

		`u`.`gender` 															AS `gender`,

		`u`.`birthday` 														AS `birthday`,
		UNIX_TIMESTAMP(`u`.`birthday`) 						AS `birthday_unix`,

		`u`.`activated` 													AS `activated`,
		UNIX_TIMESTAMP(`u`.`activated`) 					AS `activated_unix`,

		`u`.`registered` 													AS `registered`,
		UNIX_TIMESTAMP(`u`.`registered`) 					AS `registered_unix`,

		COALESCE(`ur`.`id_role`,`dr`.`id_role`)		AS `id_role`,
		COALESCE(`ur`.`code`,`dr`.`code`)					AS `role`,
		COALESCE(`ur`.`name`,`dr`.`name`)					AS `role_name`,
		COALESCE(`ur`.`level`,`dr`.`level`)				AS `role_level`,
		COALESCE(`ur`.`level`,`dr`.`level`)				AS `level`,

		`u`.`id_language` 												AS `id_language`,
		`u`.`language` 														AS `language`,

		`u`.`last_login` 													AS `last_login`,
		UNIX_TIMESTAMP(`u`.`last_login`) 					AS `last_login_unix`,

		`u`.`last_ip` 														AS `last_ip`,
		`u`.`login_try` 													AS `login_try`,

		`u`.`extends_data` 												AS `extends_data`,

		`u`.`deactivated` 												AS `deactivated`,
		UNIX_TIMESTAMP(`u`.`deactivated`) 				AS `deactivated_unix`

	FROM users u

	-- Get the User Role
	LEFT JOIN roles ur ON (
		`ur`.`id_role` = `u`.`id_role`
	)

	-- Get the default Role (Guest)
	LEFT JOIN roles dr ON (
		`dr`.`level` <= 100
	)

WHERE
	u.deleted IS NULL;