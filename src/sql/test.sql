/* 所有非数值id字段程序中以 objectId base64 形式出现（16字符） */
/* MySQL数据库中以 HEX(UUID_SHORT()) 形式出现（大约14字符） */



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



















BEGIN

DECLARE pid BIGINT UNSIGNED;
DECLARE ppath BLOB;  

PREPARE stmt1 FROM "
SELECT t.`id`, t.`path` FROM lesson_trees t WHERE t.`available` > 0 AND t.`name` = ? LIMIT 1 INTO @pid, @ppath;
";
EXECUTE stmt1 USING @pname;

IF LENGTH(@ppath) > 0 THEN
	SET @path = CONCAT(@ppath, '/', HEX(@pid));
ELSE
	SET @path = HEX(@pid);
END IF;

# 调试输出
# SELECT @pname, @pid, @ppath, @path;

PREPARE stmt2 FROM "

INSERT INTO lesson_trees t
(`id`, `pid`, `path`, `num`, `name`, `type`, `lesson_time`, `cmt`, `available`, `createtime`)
VALUES (
UNHEX(HEX(UUID_SHORT())), # ID 使用uuid_short生成 
?, # pid 来自查询
?, # path 父节点的 path + 父节点id
?, # num 外部输入
?, # name 外部输入
?, # type 外部输入
?, # lesson_time 外部输入
'', # cmt 外部输入
255, 
NOW())

";

EXECUTE stmt2 USING @pid, @path, @num, @name, @type, @lesson_time;


END







/* 修改path */
SET @p = '43313031';
SELECT id, path
	FROM lesson_trees t
WHERE t.path like concat(@p, '%') limit 1 into @tid, @path;

#select @tid, @path;

SET @pos = locate('/', @path);
SET @subpath = unhex(substr(@path from @pos + 1));

#select @subpath;

SET @fullpath = concat(unhex(@p), '/', @subpath);
#select @fullpath as `fullpath`;

UPDATE lesson_trees t
	SET
		t.path = @fullpath
	WHERE id = @tid;

commit;

select @fullpath as fullpath, path from lesson_trees where id = @tid;

