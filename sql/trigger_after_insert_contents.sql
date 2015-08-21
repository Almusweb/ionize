DELIMITER $$

DROP TRIGGER IF EXISTS `contents_after_insert`;
CREATE TRIGGER `contents_after_insert`
AFTER INSERT ON `contents`
FOR EACH ROW
BEGIN

	

END;
$$
DELIMITER ;