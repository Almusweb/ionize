CREATE OR REPLACE VIEW `navigation`
AS
	SELECT
		id_navigation,
		ordering,
		code,
		name
	
	FROM navigations n

ORDER BY
	n.ordering ASC