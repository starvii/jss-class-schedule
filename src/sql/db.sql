-- --------------------------------------------------------
-- 主机:                           10.0.0.20
-- 服务器版本:                        5.5.44-MariaDB - MariaDB Server
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 db_schedule 的数据库结构
DROP DATABASE IF EXISTS `db_schedule`;
CREATE DATABASE IF NOT EXISTS `db_schedule` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `db_schedule`;


-- 导出  表 db_schedule.lesson-teacher 结构
DROP TABLE IF EXISTS `lesson-teacher`;
CREATE TABLE IF NOT EXISTS `lesson-teacher` (
  `id` varbinary(16) NOT NULL COMMENT '1.程序中可使用MangoDB的ObjectId生成方式生成（不可见，12bytes）    2.ObjectID的base64值（可见字符，16bytes）    3.MySQL UUID, UNHEX((REPLACE(UUID(), ''-'', ''''))) （不可见，16bytes）    4.MySQL SHORTUUID, UNHEX(HEX(UUID_SHORT())) （不可见，7bytes）',
  `teacher_id` varbinary(16) NOT NULL COMMENT '教师ID',
  `lesson_id` varbinary(16) NOT NULL COMMENT '课程ID',
  `cmt` text COLLATE utf8_bin NOT NULL COMMENT '备注',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `createtime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `available` (`available`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  db_schedule.lesson-teacher 的数据：19 rows
/*!40000 ALTER TABLE `lesson-teacher` DISABLE KEYS */;
INSERT INTO `lesson-teacher` (`id`, `teacher_id`, `lesson_id`, `cmt`, `available`, `createtime`, `updatetime`) VALUES
	(_binary 0x56A64540000008, _binary 0x6631, _binary 0x3130314C3032, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A64540000009, _binary 0x6631, _binary 0x3130314C3033, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A6454000000A, _binary 0x6632, _binary 0x3130314C3034, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A6454000000B, _binary 0x6A7373, _binary 0x3130314C3035, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A6454000000C, _binary 0x6A7373, _binary 0x3130314C3036, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A6454000000D, _binary 0x6A7373, _binary 0x3130314C3037, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A6454000000E, _binary 0x6A7373, _binary 0x3130314C3038, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A6454000000F, _binary 0x6A7373, _binary 0x3130314C3039, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A64540000010, _binary 0x6632, _binary 0x3130314C3130, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A64540000011, _binary 0x6632, _binary 0x3130314C3131, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A64540000012, _binary 0x717879, _binary 0x3130314C3031, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A64540000013, _binary 0x6631, _binary 0x3130314C3132, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A64540000014, _binary 0x6631, _binary 0x3130314C3133, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A64540000015, _binary 0x717879, _binary 0x3130314C3134, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A64540000016, _binary 0x717879, _binary 0x3130314C3135, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A64540000017, _binary 0x7A6666, _binary 0x3130314C3136, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A64540000018, _binary 0x7A6666, _binary 0x3130314C3137, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A64540000019, _binary 0x7A6666, _binary 0x3130314C3138, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35'),
	(_binary 0x56A6454000001A, _binary 0x7A6666, _binary 0x3130314C3139, '', 1, '2016-01-27 17:49:09', '2016-01-26 00:58:35');
/*!40000 ALTER TABLE `lesson-teacher` ENABLE KEYS */;


-- 导出  表 db_schedule.lesson_dependencies 结构
DROP TABLE IF EXISTS `lesson_dependencies`;
CREATE TABLE IF NOT EXISTS `lesson_dependencies` (
  `id` varbinary(16) NOT NULL COMMENT '1.程序中可使用MangoDB的ObjectId生成方式生成（不可见，12bytes）    2.ObjectID的base64值（可见字符，16bytes）    3.MySQL UUID, UNHEX((REPLACE(UUID(), ''-'', ''''))) （不可见，16bytes）    4.MySQL SHORTUUID, UNHEX(HEX(UUID_SHORT())) （不可见，7bytes）',
  `obj_id` varbinary(16) NOT NULL COMMENT '目标课程ID，目标课程必须安排在依赖课程之后',
  `dep_id` varbinary(16) NOT NULL COMMENT '依赖课程ID，依赖课程必须排在目标课程之前',
  `cmt` text COLLATE utf8_bin NOT NULL COMMENT '备注',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `createtime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `obj_id` (`obj_id`),
  KEY `available` (`available`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  db_schedule.lesson_dependencies 的数据：17 rows
/*!40000 ALTER TABLE `lesson_dependencies` DISABLE KEYS */;
INSERT INTO `lesson_dependencies` (`id`, `obj_id`, `dep_id`, `cmt`, `available`, `createtime`, `updatetime`) VALUES
	(_binary 0x56A78B6D000000, _binary 0x3130315232, _binary 0x3130315231, '', 1, '2016-01-27 01:19:23', '2016-01-27 01:19:23'),
	(_binary 0x56A78B6D000001, _binary 0x3130315233, _binary 0x3130315232, '', 1, '2016-01-27 01:21:46', '2016-01-27 01:21:46'),
	(_binary 0x56A78B6D000002, _binary 0x3130315234, _binary 0x3130315233, '', 1, '2016-01-27 01:22:39', '2016-01-27 01:22:39'),
	(_binary 0x56A78B6D000003, _binary 0x3130314C3033, _binary 0x3130314C3032, '', 1, '2016-01-27 01:23:34', '2016-01-27 01:23:34'),
	(_binary 0x56A78B6D000006, _binary 0x3130314C3034, _binary 0x3130314C3033, '', 1, '2016-01-27 01:30:14', '2016-01-27 01:30:14'),
	(_binary 0x56A78B6D000007, _binary 0x3130314C3036, _binary 0x3130314C3035, '', 1, '2016-01-27 01:31:04', '2016-01-27 01:31:04'),
	(_binary 0x56A78B6D000008, _binary 0x3130314C3037, _binary 0x3130314C3036, '', 1, '2016-01-27 01:31:23', '2016-01-27 01:31:23'),
	(_binary 0x56A78B6D000009, _binary 0x3130314C3038, _binary 0x3130314C3037, '', 1, '2016-01-27 01:31:38', '2016-01-27 01:31:38'),
	(_binary 0x56A78B6D00000A, _binary 0x3130314C3039, _binary 0x3130314C3038, '', 1, '2016-01-27 01:31:55', '2016-01-27 01:31:55'),
	(_binary 0x56A78B6D00000B, _binary 0x3130314C3130, _binary 0x3130314C3039, '', 1, '2016-01-27 01:32:06', '2016-01-27 01:32:06'),
	(_binary 0x56A78B6D00000C, _binary 0x3130314C3131, _binary 0x3130314C3130, '', 1, '2016-01-27 01:32:19', '2016-01-27 01:32:19'),
	(_binary 0x56A78B6D00000E, _binary 0x3130314C3133, _binary 0x3130314C3132, '', 1, '2016-01-27 01:37:28', '2016-01-27 01:37:28'),
	(_binary 0x56A78B6D00000F, _binary 0x3130314C3134, _binary 0x3130314C3133, '', 1, '2016-01-27 01:38:41', '2016-01-27 01:38:41'),
	(_binary 0x56A78B6D000010, _binary 0x3130314C3135, _binary 0x3130314C3134, '', 1, '2016-01-27 01:39:16', '2016-01-27 01:39:16'),
	(_binary 0x56A78B6D000011, _binary 0x3130314C3137, _binary 0x3130314C3136, '', 1, '2016-01-27 01:39:40', '2016-01-27 01:39:40'),
	(_binary 0x56A78B6D000012, _binary 0x3130314C3138, _binary 0x3130314C3137, '', 1, '2016-01-27 01:39:54', '2016-01-27 01:39:54'),
	(_binary 0x56A78B6D000013, _binary 0x3130314C3139, _binary 0x3130314C3138, '', 1, '2016-01-27 01:40:07', '2016-01-27 01:40:07');
/*!40000 ALTER TABLE `lesson_dependencies` ENABLE KEYS */;


-- 导出  表 db_schedule.lesson_trees 结构
DROP TABLE IF EXISTS `lesson_trees`;
CREATE TABLE IF NOT EXISTS `lesson_trees` (
  `id` varbinary(16) NOT NULL COMMENT '1.程序中可使用MangoDB的ObjectId生成方式生成（不可见，12bytes）    2.ObjectID的base64值（可见字符，16bytes）    3.MySQL UUID, UNHEX((REPLACE(UUID(), ''-'', ''''))) （不可见，16bytes）    4.MySQL SHORTUUID, UNHEX(HEX(UUID_SHORT())) （不可见，7bytes）',
  `pid` varbinary(16) NOT NULL COMMENT '父节点ID',
  `path` varbinary(65084) NOT NULL COMMENT '本课程/章节的路径，所有祖先节点，16进制表示（为防止id中的字符造成干扰），由[/]进行分隔。索引只需要索引前32位即可。',
  `num` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '章节编号，如1，1.1，1.1.2等',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '课程/章节名称',
  `type` enum('COURSE','CHART','LESSON','EXPERIMENT','VISIT','OTHER') COLLATE utf8_bin NOT NULL COMMENT '类型：科目，章节，课程，实验，见习，其他',
  `lesson_time` tinyint(1) unsigned NOT NULL COMMENT '课时数',
  `cmt` text COLLATE utf8_bin NOT NULL COMMENT '备注',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `createtime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `available` (`available`),
  KEY `path` (`path`(32)),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  db_schedule.lesson_trees 的数据：157 rows
/*!40000 ALTER TABLE `lesson_trees` DISABLE KEYS */;
INSERT INTO `lesson_trees` (`id`, `pid`, `path`, `num`, `name`, `type`, `lesson_time`, `cmt`, `available`, `createtime`, `updatetime`) VALUES
	(_binary 0x43303031, _binary '', _binary '', '', '变态心理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303032, _binary '', _binary '', '', '病理生理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303033, _binary '', _binary '', '', '超声诊断学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303034, _binary '', _binary '', '', '大学生心理健康', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303035, _binary '', _binary '', '', '电子商务', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303036, _binary '', _binary '', '', '儿科护理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303037, _binary '', _binary '', '', '儿童心理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303038, _binary '', _binary '', '', '耳鼻咽喉科学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303039, _binary '', _binary '', '', '法理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303130, _binary '', _binary '', '', '犯罪学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303131, _binary '', _binary '', '', '分子生物学检验技术', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303132, _binary '', _binary '', '', '妇产科护理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303133, _binary '', _binary '', '', '妇幼保健', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303134, _binary '', _binary '', '', '概率论及数理统计', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303135, _binary '', _binary '', '', '高级会话', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303136, _binary '', _binary '', '', '高级日语', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303137, _binary '', _binary '', '', '高级写作', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303138, _binary '', _binary '', '', '高级英语', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303139, _binary '', _binary '', '', '高级英语视听说', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303230, _binary '', _binary '', '', '高级英语语法', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303231, _binary '', _binary '', '', '管理心理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303232, _binary '', _binary '', '', '国际法', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303233, _binary '', _binary '', '', '国际经济法', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303234, _binary '', _binary '', '', '汉英翻译', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303235, _binary '', _binary '', '', '行政法专题', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303236, _binary '', _binary '', '', '核医学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303237, _binary '', _binary '', '', '护理教育学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303238, _binary '', _binary '', '', '护理领导', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303239, _binary '', _binary '', '', '护理伦理', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303330, _binary '', _binary '', '', '护理心理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303331, _binary '', _binary '', '', '护理学导论', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303332, _binary '', _binary '', '', '护理研究', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303333, _binary '', _binary '', '', '护理研究和循征护理（美）', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303334, _binary '', _binary '', '', '护理专业英语', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303335, _binary '', _binary '', '', '环境经济学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303336, _binary '', _binary '', '', '环境科学概论', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303337, _binary '', _binary '', '', '环境与资源保护法', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303338, _binary '', _binary '', '', '婚姻继承法', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303339, _binary '', _binary '', '', '基本检验技术与仪器学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303430, _binary '', _binary '', '', '基础护理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303431, _binary '', _binary '', '', '基础日语', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303432, _binary '', _binary '', '', '基础医学概论', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303433, _binary '', _binary '', '', '基础英语', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303434, _binary '', _binary '', '', '急救护理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303435, _binary '', _binary '', '', '急重症护理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303436, _binary '', _binary '', '', '计算机程序设计基础', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303437, _binary '', _binary '', '', '技能学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303438, _binary '', _binary '', '', '健康教育学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303439, _binary '', _binary '', '', '健康评估', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303530, _binary '', _binary '', '', '教育心理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303531, _binary '', _binary '', '', '精神科护理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303532, _binary '', _binary '', '', '康复护理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303533, _binary '', _binary '', '', '课堂评估', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303534, _binary '', _binary '', '', '口腔科学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303535, _binary '', _binary '', '', '口译基础', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303536, _binary '', _binary '', '', '跨文化交际', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303537, _binary '', _binary '', '', '劳动与社会保障法', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303538, _binary '', _binary '', '', '老年护理（美）', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303539, _binary '', _binary '', '', '老年护理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303630, _binary '', _binary '', '', '临床免疫学检验', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303631, _binary '', _binary '', '', '临床生物化学检验', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303632, _binary '', _binary '', '', '临床实验室质量管理', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303633, _binary '', _binary '', '', '临床心理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303634, _binary '', _binary '', '', '临床药物治疗学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303635, _binary '', _binary '', '', '临床医学概论', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303636, _binary '', _binary '', '', '流行病学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303637, _binary '', _binary '', '', '旅游英语', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303638, _binary '', _binary '', '', '马克思主义基本原理概论', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303639, _binary '', _binary '', '', '毛泽东思想和中国特色社会主义理论体系概论', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303730, _binary '', _binary '', '', '民事诉讼法', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303731, _binary '', _binary '', '', '内科护理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303732, _binary '', _binary '', '', '女性健康', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303733, _binary '', _binary '', '', '皮肤性病学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303734, _binary '', _binary '', '', '日本概况', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303735, _binary '', _binary '', '', '日本文学作品选读', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303736, _binary '', _binary '', '', '日刊选读', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303737, _binary '', _binary '', '', '日语', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303738, _binary '', _binary '', '', '日语翻译', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303739, _binary '', _binary '', '', '日语会话', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303830, _binary '', _binary '', '', '日语口译', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303831, _binary '', _binary '', '', '日语实践', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303832, _binary '', _binary '', '', '日语视听', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303833, _binary '', _binary '', '', '日语听说', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303834, _binary '', _binary '', '', '日语写作', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303835, _binary '', _binary '', '', '日语阅读', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303836, _binary '', _binary '', '', '商法', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303837, _binary '', _binary '', '', '社会心理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303838, _binary '', _binary '', '', '社区护理（美）', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303839, _binary '', _binary '', '', '社区护理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303930, _binary '', _binary '', '', '社区急救', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303931, _binary '', _binary '', '', '社区康复学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303932, _binary '', _binary '', '', '生理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303933, _binary '', _binary '', '', '生态学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303934, _binary '', _binary '', '', '生物化学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303935, _binary '', _binary '', '', '实用仪器分析', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303936, _binary '', _binary '', '', '睡眠医学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303937, _binary '', _binary '', '', '司法文书写作', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303938, _binary '', _binary '', '', '司法心理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43303939, _binary '', _binary '', '', '思想道德修养与法律基础', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313030, _binary '', _binary '', '', '体育', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313031, _binary '', _binary '', '', '外科护理学', 'COURSE', 0, '', 1, '2016-01-25 17:26:45', '2016-01-25 17:26:45'),
	(_binary 0x43313032, _binary '', _binary '', '', '外周血细胞形态学检查技术', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313033, _binary '', _binary '', '', '卫生法规', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313034, _binary '', _binary '', '', '卫生法学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313035, _binary '', _binary '', '', '卫生学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313036, _binary '', _binary '', '', '文献检索', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313037, _binary '', _binary '', '', '五官科护理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313038, _binary '', _binary '', '', '写作基础', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313039, _binary '', _binary '', '', '心理学研究方法', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313130, _binary '', _binary '', '', '心理咨询学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313131, _binary '', _binary '', '', '刑法', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313132, _binary '', _binary '', '', '学术论文写作', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313133, _binary '', _binary '', '', '眼科学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313134, _binary '', _binary '', '', '眼应用光学基础', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313135, _binary '', _binary '', '', '药理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313136, _binary '', _binary '', '', '药事管理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313137, _binary '', _binary '', '', '药物商品学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313138, _binary '', _binary '', '', '医学检验专业英语', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313139, _binary '', _binary '', '', '医学伦理学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313230, _binary '', _binary '', '', '医学免疫学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313231, _binary '', _binary '', '', '医学微生物学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313232, _binary '', _binary '', '', '医药市场营销', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313233, _binary '', _binary '', '', '英美概况', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313234, _binary '', _binary '', '', '英美文学史', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313235, _binary '', _binary '', '', '英语', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313236, _binary '', _binary '', '', '英语教学法', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313237, _binary '', _binary '', '', '英语口语', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313238, _binary '', _binary '', '', '英语听力', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313239, _binary '', _binary '', '', '影像诊断学', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313330, _binary '', _binary '', '', '语言测试', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313331, _binary '', _binary '', '', '灾难护理（美）', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313332, _binary '', _binary '', '', '中国近代史纲要', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313333, _binary '', _binary '', '', '专业英语', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x43313334, _binary '', _binary '', '', '综合阅读', 'COURSE', 0, '', 255, '2016-01-27 00:04:24', '2016-01-27 00:04:24'),
	(_binary 0x3130315231, _binary 0x43313031, _binary 0x3433333133303331, '1', '胸外科', 'CHART', 0, '', 1, '2016-01-25 17:26:45', '2016-01-27 17:56:03'),
	(_binary 0x3130315232, _binary 0x43313031, _binary 0x3433333133303331, '2', '腹外科', 'CHART', 0, '', 1, '2016-01-25 17:26:45', '2016-01-27 17:56:03'),
	(_binary 0x3130314C3031, _binary 0x43313031, _binary 0x3433333133303331, '3', '周围血管疾病', 'LESSON', 3, '', 1, '2016-01-25 17:26:45', '2016-01-27 17:56:03'),
	(_binary 0x3130315233, _binary 0x43313031, _binary 0x3433333133303331, '4', '泌尿外科', 'CHART', 0, '', 1, '2016-01-25 17:26:45', '2016-01-27 17:56:03'),
	(_binary 0x3130315234, _binary 0x43313031, _binary 0x3433333133303331, '5', '骨外科', 'CHART', 0, '', 1, '2016-01-25 17:26:45', '2016-01-27 17:56:03'),
	(_binary 0x3130314C3032, _binary 0x3130315231, _binary 0x34333331333033312F33313330333135323331, '1.1', '胸部损伤病人的护理', 'LESSON', 2, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3033, _binary 0x3130315231, _binary 0x34333331333033312F33313330333135323331, '1.2', '肺癌、食管癌疾病病人的护理', 'LESSON', 3, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3034, _binary 0x3130315231, _binary 0x34333331333033312F33313330333135323331, '1.3', '心脏疾病病人的护理', 'LESSON', 3, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3035, _binary 0x3130315232, _binary 0x34333331333033312F33313330333135323332, '2.1', '腹外疝、腹部损伤、腹膜炎', 'LESSON', 3, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3036, _binary 0x3130315232, _binary 0x34333331333033312F33313330333135323332, '2.2', '胃十二指肠疾病', 'LESSON', 3, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3037, _binary 0x3130315232, _binary 0x34333331333033312F33313330333135323332, '2.3', '小肠疾病病人的护理', 'LESSON', 2, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3038, _binary 0x3130315232, _binary 0x34333331333033312F33313330333135323332, '2.4', '阑尾炎/结、直肠和肛管', 'LESSON', 3, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3039, _binary 0x3130315232, _binary 0x34333331333033312F33313330333135323332, '2.5', '门静脉高压症', 'LESSON', 2, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3130, _binary 0x3130315232, _binary 0x34333331333033312F33313330333135323332, '2.6', '肝脏疾病', 'LESSON', 2, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3131, _binary 0x3130315232, _binary 0x34333331333033312F33313330333135323332, '2.7', '胆道疾病', 'LESSON', 3, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3132, _binary 0x3130315233, _binary 0x34333331333033312F33313330333135323333, '4.1', '泌尿系统主要症状和检查', 'LESSON', 2, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3133, _binary 0x3130315233, _binary 0x34333331333033312F33313330333135323333, '4.2', '泌尿损伤/尿石症', 'LESSON', 3, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3134, _binary 0x3130315233, _binary 0x34333331333033312F33313330333135323333, '4.3', '泌尿系统梗阻', 'LESSON', 2, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3135, _binary 0x3130315233, _binary 0x34333331333033312F33313330333135323333, '4.4', '泌尿系统肿瘤/肾上腺', 'LESSON', 2, '', 1, '2016-01-25 17:26:45', '2016-01-27 18:00:08'),
	(_binary 0x3130314C3136, _binary 0x3130315234, _binary 0x34333331333033312F33313330333135323334, '5.1', '骨科病人的一般护理/骨折病人的护理', 'LESSON', 3, '', 1, '2016-01-25 17:26:45', '2016-01-27 17:59:21'),
	(_binary 0x3130314C3137, _binary 0x3130315234, _binary 0x34333331333033312F33313330333135323334, '5.2', '骨折病人的护理', 'LESSON', 3, '', 1, '2016-01-25 17:26:45', '2016-01-27 17:59:21'),
	(_binary 0x3130314C3138, _binary 0x3130315234, _binary 0x34333331333033312F33313330333135323334, '5.3', '关节脱位/颈肩腰腿痛', 'LESSON', 3, '', 1, '2016-01-25 17:26:45', '2016-01-27 17:59:21'),
	(_binary 0x3130314C3139, _binary 0x3130315234, _binary 0x34333331333033312F33313330333135323334, '5.4', '骨感染/骨肿瘤', 'LESSON', 2, '', 1, '2016-01-25 17:26:45', '2016-01-27 17:59:21');
/*!40000 ALTER TABLE `lesson_trees` ENABLE KEYS */;


-- 导出  表 db_schedule.main_courses 结构
DROP TABLE IF EXISTS `main_courses`;
CREATE TABLE IF NOT EXISTS `main_courses` (
  `id` varbinary(16) NOT NULL COMMENT '1.程序中可使用MangoDB的ObjectId生成方式生成（不可见，12bytes）    2.ObjectID的base64值（可见字符，16bytes）    3.MySQL UUID, UNHEX((REPLACE(UUID(), ''-'', ''''))) （不可见，16bytes）    4.MySQL SHORTUUID, UNHEX(HEX(UUID_SHORT())) （不可见，7bytes）',
  `semester_id` varbinary(16) NOT NULL COMMENT '学期ID',
  `dept_id` varbinary(16) NOT NULL COMMENT '二级学院（系）ID',
  `class_id` varbinary(16) NOT NULL COMMENT '教学班级ID',
  `course_time` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '课程安排时间，WED1-2，MON3-5，6-8，6-9，10-12等',
  `course_id` varbinary(16) NOT NULL COMMENT '课程ID',
  `course_span` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '课程跨度，如1-12w等。空则默认为整个学期',
  `cmt` text COLLATE utf8_bin NOT NULL COMMENT '备注',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `createtime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `course_time` (`course_time`),
  KEY `dept` (`dept_id`),
  KEY `class` (`class_id`),
  KEY `available` (`available`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  db_schedule.main_courses 的数据：0 rows
/*!40000 ALTER TABLE `main_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_courses` ENABLE KEYS */;


-- 导出  表 db_schedule.teachers 结构
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` varbinary(16) NOT NULL COMMENT '1.程序中可使用MangoDB的ObjectId生成方式生成（不可见，12bytes）    2.ObjectID的base64值（可见字符，16bytes）    3.MySQL UUID, UNHEX((REPLACE(UUID(), ''-'', ''''))) （不可见，16bytes）    4.MySQL SHORTUUID, UNHEX(HEX(UUID_SHORT())) （不可见，7bytes）',
  `type` enum('IN','EX') COLLATE utf8_bin NOT NULL COMMENT '教师类型， in表示学校教师，ex表示医院教师',
  `code` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '教师编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '教师姓名',
  `cmt` text COLLATE utf8_bin NOT NULL COMMENT '备注',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `createtime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `available` (`available`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  db_schedule.teachers 的数据：6 rows
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` (`id`, `type`, `code`, `name`, `cmt`, `available`, `createtime`, `updatetime`) VALUES
	(_binary 0x6631, 'EX', 'f1', '附一', '', 1, '2016-01-27 17:50:00', '2016-01-24 22:56:30'),
	(_binary 0x6632, 'EX', 'f2', '附二', '', 1, '2016-01-27 17:50:00', '2016-01-24 22:56:28'),
	(_binary 0x6A7373, 'IN', 'jss', '江思思', '', 1, '2016-01-27 17:50:00', '2016-01-26 23:37:50'),
	(_binary 0x717879, 'IN', 'qxy', '邱贤云', '', 1, '2016-01-27 17:50:00', '2016-01-26 23:37:52'),
	(_binary 0x7A6666, 'IN', 'zff', '章飞飞', '', 1, '2016-01-27 17:50:00', '2016-01-26 23:37:55'),
	(_binary 0x7A7868, 'IN', 'zxh', '祝雪花', '', 1, '2016-01-27 17:50:00', '2016-01-24 22:55:55');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;


-- 导出  表 db_schedule.type_key_value 结构
DROP TABLE IF EXISTS `type_key_value`;
CREATE TABLE IF NOT EXISTS `type_key_value` (
  `id` varbinary(16) NOT NULL COMMENT '1.程序中可使用MangoDB的ObjectId生成方式生成（不可见，12bytes）    2.ObjectID的base64值（可见字符，16bytes）    3.MySQL UUID, UNHEX((REPLACE(UUID(), ''-'', ''''))) （不可见，16bytes）    4.MySQL SHORTUUID, UNHEX(HEX(UUID_SHORT())) （不可见，7bytes）',
  `type` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `key` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '关键字',
  `value` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '值',
  `data` text COLLATE utf8_bin NOT NULL COMMENT '长数据',
  `cmt` text COLLATE utf8_bin NOT NULL COMMENT '备注',
  `available` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `createtime` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_key` (`type`,`key`),
  KEY `type` (`type`),
  KEY `name` (`key`),
  KEY `available` (`available`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  db_schedule.type_key_value 的数据：7 rows
/*!40000 ALTER TABLE `type_key_value` DISABLE KEYS */;
INSERT INTO `type_key_value` (`id`, `type`, `key`, `value`, `data`, `cmt`, `available`, `createtime`, `updatetime`) VALUES
	(_binary 0x4A31, '教学日历', '2015-2016-2', '温州医科大学2015-2016学年第二学期教学日历表', '{ 20160222 - 20160704 } - { SAT, SUN, 20160404, 20160502, 20160609 }', '', 1, '2016-01-27 17:50:20', '2016-01-27 23:09:44'),
	(_binary 0x5A5931, '专业', '护理学（本科）-2015级', '', '', '', 1, '2016-01-27 17:50:20', '2016-01-24 23:17:33'),
	(_binary 0x5A5932, '专业', '护理学（中外）-2015级', '', '', '', 1, '2016-01-27 17:50:20', '2016-01-24 23:17:35'),
	(_binary 0x5A59330D0A, '专业', '护理专升本-2015级', '', '', '', 1, '2016-01-27 17:50:20', '2016-01-24 23:20:23'),
	(_binary 0x5A5934, '专业', '护理学（专科含高职）-2015级', '', '', '', 1, '2016-01-27 17:50:20', '2016-01-24 23:20:54'),
	(_binary 0x5A5935, '专业', '眼视光技术-2015级', '', '', '', 1, '2016-01-27 17:50:20', '2016-01-24 23:21:14'),
	(_binary 0x00, 'comment', 'table_comment', 'about table content', '\r\nlesson-teacher 课程-教师对应表，标识某项课程由哪些教师来讲解\r\nlesson_dependencies 课程依赖表，标识课程安排顺序\r\nlesson_tree 课程树，保存科目、章节、课程之间的树状关系\r\nmain_course 科目表，保存每个教学班上课的科目情况\r\nteachers 教师表，保存教师基本信息\r\ntype_key_value 存放简单数据，如学期、科目、教学班等基本信息\r\n', '', 255, '2000-01-01 00:00:00', '2016-01-29 00:21:46');
/*!40000 ALTER TABLE `type_key_value` ENABLE KEYS */;


-- 导出  视图 db_schedule.specialty 结构
DROP VIEW IF EXISTS `specialty`;
-- 创建临时表以解决视图依赖性错误
CREATE TABLE `specialty` (
	`id` VARBINARY(16) NOT NULL COMMENT '1.程序中可使用MangoDB的ObjectId生成方式生成（不可见，12bytes）    2.ObjectID的base64值（可见字符，16bytes）    3.MySQL UUID, UNHEX((REPLACE(UUID(), \'-\', \'\'))) （不可见，16bytes）    4.MySQL SHORTUUID, UNHEX(HEX(UUID_SHORT())) （不可见，7bytes）',
	`key` VARCHAR(100) NOT NULL COMMENT '关键字' COLLATE 'utf8_bin',
	`value` VARCHAR(255) NOT NULL COMMENT '值' COLLATE 'utf8_bin',
	`createtime` TEXT NOT NULL COMMENT '备注' COLLATE 'utf8_bin',
	`updatetime` TIMESTAMP NOT NULL
) ENGINE=MyISAM;


-- 导出  视图 db_schedule.specialty 结构
DROP VIEW IF EXISTS `specialty`;
-- 移除临时表并创建最终视图结构
DROP TABLE IF EXISTS `specialty`;
CREATE ALGORITHM=UNDEFINED DEFINER=`db_schedule`@`%` SQL SECURITY DEFINER VIEW `specialty` AS select `type_key_value`.`id` AS `id`,`type_key_value`.`key` AS `key`,`type_key_value`.`value` AS `value`,`type_key_value`.`cmt` AS `createtime`,`type_key_value`.`updatetime` AS `updatetime` from `type_key_value` where ((`type_key_value`.`available` = 1) and (`type_key_value`.`type` = '专业'));
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
