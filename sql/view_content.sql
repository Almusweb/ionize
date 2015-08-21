CREATE OR REPLACE VIEW `content`
AS
	SELECT

		`cnt`.`id_content` 						AS `id_content`,
		`cnt`.`code` 									AS `name`,

		GROUP_CONCAT(DISTINCT `cntp`.`id_parent` ORDER BY `cntp`.`ordering` ASC SEPARATOR ',') AS id_parents,
		`cntp`.`ordering`							AS `ordering`,

		GROUP_CONCAT(DISTINCT `cntc`.`id_content` ORDER BY `cntc`.`ordering` ASC SEPARATOR ',') AS id_childrens,

		`cnt`.`id_type` 							AS `id_type`,
		`ctp`.`code`									AS `type`,

		`cnt`.`publish_on` 						AS `publish_on`,
		UNIX_TIMESTAMP(`cnt`.`publish_on`)
		AS `publish_on_unix`,

		`cnt`.`publish_off` 					AS `publish_off`,
		UNIX_TIMESTAMP(`cnt`.`publish_off`)
		AS `publish_off_unix`,

		COALESCE(`cnt`.`logical_date`,`cnt`.`created`)
		AS `logical_date`,

		UNIX_TIMESTAMP(COALESCE(`cnt`.`logical_date`,`cnt`.`created`))
		AS `logical_date_unix`,

		COALESCE(`cnt`.`extends_data`,'[]') 
		AS `extends_data`,

		`ctp`.`default_list_view` 		AS `default_list_view`,
		`ctp`.`default_single_view` 	AS `default_single_view`,
		`ctp`.`default_item_view` 		AS `default_item_view`,

		`cnt`.`list_view` 						AS `list_view`,
		`cnt`.`single_view` 					AS `single_view`,
		`cnt`.`item_view` 						AS `item_view`,

		(CASE
			WHEN COALESCE(cntc.id_content,0,1) = 1 AND cnt.site_root = 0 THEN COALESCE(cnt.list_view,ctp.default_list_view)
			WHEN COALESCE(cntc.id_content,0,1) = 0 AND cnt.site_root = 0 THEN COALESCE(cnt.single_view,ctp.default_single_view)
			WHEN cnt.site_root = 1 THEN 'page_home'
			ELSE NULL
		END)													AS `view`,

		`lng`.`id_language`						AS `id_language`,
		`lng`.`code`									AS `language`,
		
		`ctr`.`title`									AS `title`,
		`ctr`.`subtitle`							AS `subtitle`,
		`ctr`.`preview`								AS `preview`,
		`ctr`.`window`								AS `window`,
		`ctr`.`short_url`							AS `short_url`,
		`ctr`.`long_url`							AS `long_url`,

		`ctr`.`full_url`							AS `url`,

		`ctr`.`content`								AS `content`,
		`ctr`.`keywords`							AS `keywords`,
		`ctr`.`description`						AS `description`,

		COALESCE(`ctr`.`extends_data`,'[]') 
		AS `extends_data_lang`,

		`cnt`.`indexed` 							AS `indexed`,
		COALESCE(`cnt`.`has_url`,0) 	AS `has_url`,
		COALESCE(cntc.id_content,0,1) AS `has_children`,
		`cnt`.`flag` 									AS `flag`,
		`cnt`.`priority` 							AS `priority`,

		`ath`.`id_user`								AS `id_author`,
		`cnt`.`created` 							AS `created`,
		UNIX_TIMESTAMP(`cnt`.`created`)
		AS `created_unix`,

		`ath`.`login`									AS `author_login`,
		`ath`.`name`									AS `author_name`,
		`ath`.`forname`								AS `author_forname`,
		`ath`.`lastname`							AS `author_lastname`,
		`ath`.`email`									AS `author_email`,
		COALESCE(`ath`.`extends_data`,'[]')
		AS `author_extends_data`,

		`upd`.`id_user`								AS `id_updater`,
		`cnt`.`updated` 							AS `updated`,
		UNIX_TIMESTAMP(`cnt`.`updated`)
		AS `updated_unix`,

		`upd`.`login`									AS `updater_login`,
		`upd`.`name`									AS `updater_name`,
		`upd`.`forname`								AS `updater_forname`,
		`upd`.`lastname`							AS `updater_lastname`,
		`upd`.`email`									AS `updater_email`,
		COALESCE(`upd`.`extends_data`,'[]')
		AS `updater_extends_data`,

		`cnt`.`default_language` 			AS `default_language`,
		`cnt`.`site_root` 						AS `homepage`

	FROM contents_translations `ctr`

	LEFT JOIN languages lng ON (
		`ctr`.id_language = lng.id_language
	)

	LEFT JOIN contents cnt ON (
		`ctr`.id_content = cnt.id_content
	)

	LEFT JOIN contents_relations cntp ON (
		cntp.id_content = cnt.id_content
	)

  LEFT JOIN contents_relations cntc ON (
		cntc.id_parent = cnt.id_content
	)

	LEFT JOIN contents_types ctp ON (
		cnt.id_type = ctp.id_type
	)	

	LEFT JOIN users ath ON (
		cnt.id_author = ath.id_user
	)

	LEFT JOIN users upd ON (
		cnt.id_updater = upd.id_user
	)

	WHERE
		cnt.deleted IS NULL

	GROUP BY id_translation