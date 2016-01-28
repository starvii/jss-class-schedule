INSERT INTO `lesson-teacher`(id, teacher_id, lesson_id)
VALUES (
	UNHEX(HEX(UUID_SHORT())),
	(SELECT `id` FROM teachers t1 WHERE t1.name = '章飞飞' LIMIT 1), 
	(SELECT `id` FROM lesson_trees t2 WHERE t2.name = '骨感染/骨肿瘤' LIMIT 1)
);



--完整UUID
SELECT UNHEX((REPLACE(UUID(), '-', '')));
--短UUID
SELECT UNHEX(HEX(UUID_SHORT()));







--使用mysql自带 prepare statement
PREPARE stmt1 FROM "INSERT INTO lesson_dependencies(id, obj_id, dep_id, createtime)
VALUES (UNHEX(HEX(UUID_SHORT())), 
(SELECT `id` FROM lesson_trees t1 WHERE t1.available = 1 AND t1.`name` = ? LIMIT 1), 
(SELECT `id` FROM lesson_trees t1 WHERE t1.available = 1 AND t1.`name` = ? LIMIT 1), 
NOW())";

SET @obj = '骨感染/骨肿瘤';

SET @dep = '关节脱位/颈肩腰腿痛';


EXECUTE stmt1 USING @obj, @dep;






-- varbinary 最长长度为65084
-- 查找树
SELECT * FROM `lesson_trees` t WHERE t.`available` = 1 AND LOCATE('/', t.path) > 0
AND LEFT(t.path, LOCATE('/', t.path) - 1) = HEX('C101') OR t.id = 'C101' OR t.pid = 'C101'
ORDER BY t.`num`

-- 优化查找树（可以使用索引）
SELECT * FROM `lesson_trees` t WHERE t.`available` = 1 AND t.path LIKE '43313031%';

-- 创建短索引（转为16进制后长度翻倍）
ALTER TABLE `lesson_trees` ADD INDEX `path` (`path`(32));