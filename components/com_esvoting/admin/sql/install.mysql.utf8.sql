DROP TABLE IF EXISTS `#__esdelegationcategory`;
DROP TABLE IF EXISTS `#__esdelegation`;
DROP TABLE IF EXISTS `#__esgroup`;
DROP TABLE IF EXISTS `#__esgroupmembership`;
DROP TABLE IF EXISTS `#__esvote`;
DROP TABLE IF EXISTS `#__esvote2`;
DROP TABLE IF EXISTS `#__esvote3`;
DROP TABLE IF EXISTS `#__esvoteitem`;
DROP TABLE IF EXISTS `#__esvotes`;
DROP TABLE IF EXISTS `#__escomment`;
DROP TABLE IF EXISTS `#__escommentrating`;
 
CREATE TABLE `#__esdelegationcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` BLOB,
   PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

INSERT INTO `#__esdelegationcategory` (`name`, `description`) VALUES
	('Система', 'Вопросы регулирования, организации и развития системы принятия решений.'),
	('Государство', 'Конституционное законодательсво и государственное строительство'),
	('Законодательство', 'Гражданское, уголовное, арбитражное и процессуальное законодательство.'),
	('Бюджет и налоги', 'Бюджет и налоги'),
	('Финансы', 'Финансовый рынок'),
	('Экономика','Экономическая политика, инновации и предпринимательсво'),
	('Собственность', 'Вопросы собственности'),
	('Промышленность', 'Промышленность'),
	('Строительство', 'Земельные отношения и стротительсво'),
	('Наука и наукоёмкие технологии', 'Наука и наукоёмкие технологии'),
	('Энергетика', 'Энергетика'),
	('Транспорт', 'Транспорт'),
	('Оборона', 'Оборона'),
	('Образование','Образование'),
	('Сельское хозяйство','Аграрные вопросы'),
	('Природопользование','Природные ресурсы, природопользование и экология'),
	('Культура','Культура'),
	('Спорт', 'Физическая культура и спорт'),
	('Безопасность', 'Безопасность и противодействие с коррупции.'),
	('Международные дела', 'Взаимодейсвие с другими государствами и международными организациями.'),
	('Межрегиональные дела', 'Взаимодейсвие с другими регионами и государственными организациями РФ.'),
	('Межобщественные дела','Взаимодействие с общественными объединениями и религиозных организациями'),
	('Межнациональные дела','Дела национальносетй'),
	('Местное самоуправление', 'Местное самоуправление'),
	('Социальная политика', 'Труд, социальная политика, дела ветеранов.'),
	('Семья','Вопросы семьи, женщин и детей'),
	('Молодёжь','Дела молодёжи'),
	('Охрана здоровья','Охрана здоровья');
	
CREATE TABLE `#__esdelegation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `delegateid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
   PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

	INSERT INTO `#__esdelegation` (`userid`, `delegateid`, `categoryid`, `rating`) VALUES
	(46,47,1,0),
	(46,47,2,0),
	(46,47,3,0);

CREATE TABLE `#__esgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` BLOB,
  `isopen` tinyint(1) NOT NULL,
   PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `#__esgroupmembership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
   PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `#__esvote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timebegin` TIMESTAMP,
  `timeend` TIMESTAMP,
  `caption` BLOB,
  `desctription` BLOB,
  `url` BLOB,
  `isregisteredusers` tinyint(1) NOT NULL,
  `isunregisteredusers` tinyint(1) NOT NULL,
  `isopenresul` tinyint(1) NOT NULL,
  `isopenprocess` tinyint(1) NOT NULL,
  `isdelegated` tinyint(1) NOT NULL,
  `isk` tinyint(1) NOT NULL,
  `graphtype` tinyint(1) NOT NULL,
  `type` tinyint(1) NOT NULL,
   PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `#__esvoteitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voteid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `text` BLOB,
   PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `#__esvote2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voteid` int(11) NOT NULL,
  `maxvalue` int(11) NOT NULL,
  `ismultiselect` tinyint(1) NOT NULL,
   PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `#__esvote3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voteid` int(11) NOT NULL,
  `minvalue` FLOAT NOT NULL,
  `maxvalue` FLOAT NOT NULL,
   PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `#__esvotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `voteid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `value` FLOAT NOT NULL,
   PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `#__escomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `voteid` int(11) NOT NULL,
  `time` TIMESTAMP,
   PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

CREATE TABLE `#__escommentrating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `commentid` int(11) NOT NULL,
   PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
