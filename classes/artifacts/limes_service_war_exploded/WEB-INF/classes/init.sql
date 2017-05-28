CREATE DATABASE IF NOT EXISTS `windsays` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `windsays`;


CREATE TABLE IF NOT EXISTS `task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '姓名',
  `task_con` varchar(500) NOT NULL DEFAULT '' COMMENT '内容',
    `adress` varchar(50) NOT NULL DEFAULT '' COMMENT '主题',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '生成时间',
  `update_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务提交表';


