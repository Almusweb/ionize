CREATE OR REPLACE VIEW `navigation`
AS
	SELECT

		n.`id_navigation`,
		n.`ordering` AS navigation_ordering,
		n.`code`,
		n.`name`,

		nc.`id_item`,
		
		nc.`level`,
		nc.`ordering`,

		nc.`id_url`,
		nc.`id_content`,
		
		nc.`id_parent`,
		
		ncp.`id_item` AS `parent_item`,
		ncp.`level` AS `parent_level`,
		ncp.`ordering` AS `parent_ordering`,

		ncp.`id_content` AS `parent_content`,
		ncp.`id_url` AS `parent_link`
	
	FROM navigations n
	INNER JOIN navigations_contents nc ON (nc.id_navigation = n.id_navigation)

	LEFT JOIN navigations_contents ncp ON (nc.id_parent = ncp.id_content)

ORDER BY
	n.`ordering` ASC, nc.`level` ASC, ncp.`ordering` ASC, nc.`ordering` ASC