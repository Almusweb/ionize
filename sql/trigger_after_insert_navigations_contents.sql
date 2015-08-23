DELIMITER $$

DROP TRIGGER IF EXISTS `navigations_contents_after_insert`;
CREATE TRIGGER `navigations_contents_after_insert`
AFTER INSERT ON `navigations_contents`
FOR EACH ROW
BEGIN

	

END;
$$
DELIMITER ;