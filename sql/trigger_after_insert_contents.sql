DELIMITER $$

DROP TRIGGER IF EXISTS `contents_after_insert`;
CREATE TRIGGER `contents_after_insert`
AFTER INSERT ON `contents`
FOR EACH ROW
BEGIN

	DECLARE $id_content, $id_language INTEGER;
	DECLARE $language VARCHAR(30);
	DECLARE $done BOOLEAN DEFAULT FALSE;

	DECLARE LANGUAGES_CURSOR CURSOR FOR SELECT `id_language`, `code` FROM `languages`;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET $done = TRUE;

	OPEN LANGUAGES_CURSOR; CURSOR_LOOP: LOOP
		-- Fetch data from the languages
		FETCH LANGUAGES_CURSOR INTO $id_language, $language;
		-- If done with the fetch
		IF $done = TRUE THEN LEAVE CURSOR_LOOP; END IF;
		
		-- Create translations for all language
		INSERT INTO `contents_translations`(`id_content`,`id_language`,`language`) VALUES(NEW.`id_content`, $id_language, $language);

	END LOOP CURSOR_LOOP; CLOSE LANGUAGES_CURSOR;

END;
$$
DELIMITER ;