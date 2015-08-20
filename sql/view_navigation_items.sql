CREATE OR REPLACE VIEW `navigation_items`
AS
	SELECT
		n.`code` AS navigation_code,
		nc.*
	
	FROM navigations n
	INNER JOIN navigations_contents nc ON (nc.id_navigation = n.id_navigation)

ORDER BY
	n.ordering ASC