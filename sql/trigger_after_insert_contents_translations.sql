DELIMITER $$

DROP TRIGGER IF EXISTS `contents_translations_after_insert`;
CREATE TRIGGER `contents_translations_after_insert`
AFTER INSERT ON `contents_translations`
FOR EACH ROW
BEGIN

	

END;
$$
DELIMITER ;