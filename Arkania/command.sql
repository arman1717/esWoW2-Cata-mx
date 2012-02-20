-- ================= --
--   PSDB [command]  --
-- ================= --

ALTER TABLE `command` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;

UPDATE `command` SET `name`='reload creature_text',`security`=3,`help`='Sintaxis: .reload creature_text\r\nRecarga la tabla creature_text.' WHERE `command`.`name`='reload creature_text';
UPDATE `command` SET `name`='reload smart_scripts',`security`=3,`help`='Sintaxis: .reload smart_scripts\r\nRecarga la tabla smart_scripts..' WHERE `command`.`name`='reload smart_scripts';
