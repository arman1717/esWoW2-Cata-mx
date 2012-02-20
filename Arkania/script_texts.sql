-- ======================= --
--   PSDB [script_texts]   --
-- ======================= --

ALTER TABLE `script_texts` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;
/*Borra el contenido de la columna `content_loc7` antes de actualizar */
UPDATE `script_texts` SET `content_loc7`=NULL WHERE `content_loc7`IS NOT NULL;

UPDATE `script_texts` SET `content_loc7`='¿Qué clase de truco es este, $R? Si lo que busca es hacer trampas, ¡te advierto que no caeré tan facil!' WHERE `npc_entry`='0' AND `entry`='-1000210';
UPDATE `script_texts` SET `content_loc7`='Muy bien. Dejame ver que tienes que ensenñarme, $N.' WHERE `npc_entry`='0' AND `entry`='-1000209';
UPDATE `script_texts` SET `content_loc7`='Hey, Gracias.' WHERE `npc_entry`='4979' AND `entry`='-1603502';
UPDATE `script_texts` SET `content_loc7`='$N utilicemos la antecámara a la derecha.' WHERE `npc_entry`='16295' AND `entry`='-1000141';
UPDATE `script_texts` SET `content_loc7`='¡Vamos!' WHERE `npc_entry`='16295' AND `entry`='-1000140';
UPDATE `script_texts` SET `content_loc7`='¡Puedo ver la luz al final del túnel!' WHERE `npc_entry`='16295' AND `entry`='-1000142';
UPDATE `script_texts` SET `content_loc7`='Ahora hay jinetes del Enclave, $C. No hay escapatoria... ¡Cuidado! ¡Emboscada Troll!' WHERE `npc_entry`='16295' AND `entry`='-1000143';
UPDATE `script_texts` SET `content_loc7`='El capitán Helios, he sido rescatado de las catacumbas Amani. ¡Debemos informar de ello, señor!' WHERE `npc_entry`='16295' AND `entry`='-1000145';
UPDATE `script_texts` SET `content_loc7`='Gracias por salvar mi vida y devolverme a la seguridad, $N' WHERE `npc_entry`='16295' AND `entry`='-1000144';
UPDATE `script_texts` SET `content_loc7`='Liatha, conseguiré a alguien que venga a ver esas heridas. Gracias por traerla a lugar seguro' WHERE `npc_entry`='16295' AND `entry`='-1000146';
UPDATE `script_texts` SET `content_loc7`='¡Que empiece la prueba, Furiasangre, atacad!' WHERE `npc_entry`='17807' AND `entry`='-1000637';
UPDATE `script_texts` SET `content_loc7`='¡Campeón Pautaluz, enorgulléceme!' WHERE `npc_entry`='17807' AND `entry`='-1000638';
UPDATE `script_texts` SET `content_loc7`='¡Enséñale a este advenedizo como lucha un Caballero de sangre pura, Hojágil!' WHERE `npc_entry`='17807' AND `entry`='-1000639';
UPDATE `script_texts` SET `content_loc7`='¡Enseña a $N el significado de dolor, Golpesol!' WHERE `npc_entry`='17807' AND `entry`='-1000640';
UPDATE `script_texts` SET `content_loc7`='Otra alma para mi maestro.' WHERE `npc_entry`='26668' AND `entry`='-1575021';
UPDATE `script_texts` SET `content_loc7`='Duerme ahora, en la fria oscuridad' WHERE `npc_entry`='29309' AND `entry`='-1619015';
UPDATE `script_texts` SET `content_loc7`='¡Por Lich King!' WHERE `npc_entry`='29309' AND `entry`='-1619016';
UPDATE `script_texts` SET `content_loc7`='¡Tu no lo vales!' WHERE `npc_entry`='29310' AND `entry`='-1619006';
UPDATE `script_texts` SET `content_loc7`='¡Ignis el Maestro de la Caldera empieza a lanzar chorros de fuego!' WHERE `npc_entry`='33118' AND `entry`='-1603229';
UPDATE `script_texts` SET `content_loc7`='Tajoescama toma una respiración profunda...' WHERE `npc_entry`='33186' AND `entry`='-1603267';
UPDATE `script_texts` SET `content_loc7`='¡Tajoescama en tierra permanentemente!' WHERE `npc_entry`='33186' AND `entry`='-1603268';
UPDATE `script_texts` SET `content_loc7`='¡Torreta Arpón está lista para usarse!' WHERE `npc_entry`='33287' AND `entry`='-1603266';
UPDATE `script_texts` SET `content_loc7`='¡Esté atento! ¡Las máquinas topo emergerán pronto con esos enanos repugnantes del hierro a bordo!' WHERE `npc_entry`='33287' AND `entry`='-1603263';
UPDATE `script_texts` SET `content_loc7`='¡Listos para salir, mantened a los enanos lejos de nuestras espaldas!' WHERE `npc_entry`='33287' AND `entry`='-1603264';
UPDATE `script_texts` SET `content_loc7`='¡Fuejo afuera! ¡Vaya a reconstruir esas torretas!' WHERE `npc_entry`='33287' AND `entry`='-1603265';
UPDATE `script_texts` SET `content_loc7`='Denos un momento para prepararse para montar las torretas.' WHERE `npc_entry`='33287' AND `entry`='-1603262';
UPDATE `script_texts` SET `content_loc7`='¡Correrá la sangre!' WHERE `npc_entry`='37972' AND `entry`='-1631119';
UPDATE `script_texts` SET `content_loc7`='%s se rie' WHERE `npc_entry`='37973' AND `entry`='-1631130';
