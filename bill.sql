-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: bill
-- ------------------------------------------------------
-- Server version	5.7.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `year` int(6) NOT NULL,
  `month` int(2) NOT NULL,
  `day` int(2) NOT NULL,
  `io` varchar(15) NOT NULL,
  `form` varchar(255) NOT NULL,
  `main` varchar(255) DEFAULT '',
  `content` text,
  `sum` double DEFAULT NULL,
  `user_id` int(6) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=349 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (240,2019,2,24,'out','微信','','截至190224 15:51',369,35,1550937600),(241,2019,2,24,'out','微信','洗衣店','+',5,37,1550937600),(242,2019,2,24,'out','微信','洗衣店','洗衣服',7,37,1550937600),(243,2019,2,24,'out','微信','你好','使用',9,37,1550937600),(244,2019,2,24,'out','微信','了','卡',48,37,1550937600),(245,2019,2,24,'out','微信','','晚餐',10,35,1550937600),(246,2019,2,24,'out','微信','','怡宝',2,35,1550937600),(247,2019,2,25,'out','微信','','豆浆',2,35,1551024000),(248,2019,2,25,'out','微信','','面',5,35,1551024000),(249,2019,2,25,'out','微信','',NULL,5,37,1551024000),(250,2019,2,25,'out','微信','','午餐',12,35,1551024000),(251,2019,2,25,'out','微信','',NULL,4,37,1551024000),(252,2019,2,25,'out','微信','',NULL,47,37,1551024000),(253,2019,2,25,'out','微信','',NULL,47,37,1551024000),(254,2019,2,25,'out','微信','','晚餐',12,35,1551024000),(255,2019,2,25,'out','微信','',NULL,5,37,1551024000),(256,2019,2,25,'out','微信','','组',6,37,1551024000),(257,2019,2,25,'out','微信','','no',4,37,1551024000),(258,2019,2,25,'out','微信','k','no',4,37,1551024000),(259,2019,2,26,'out','微信','食堂','早餐',5,35,1551110400),(260,2019,2,26,'out','微信','','午餐',9,35,1551110400),(261,2019,2,26,'out','微信','',NULL,47,35,1551110400),(262,2019,2,26,'get','微信','',NULL,47,35,1551110400),(263,2019,2,26,'get','微信','',NULL,47,35,1551110400),(264,2019,2,26,'get','微信','',NULL,47,35,1551110400),(265,2019,2,26,'out','微信','',NULL,47,35,1551110400),(266,2019,2,26,'out','微信','',NULL,47,35,1551110400),(267,2019,2,26,'out','微信','','晚餐',10,35,1551110400),(268,2019,2,26,'out','支付宝','',NULL,5,35,1551110400),(269,2019,2,27,'out','微信','赵辰阳','电费',10,35,1551196800),(270,2019,2,27,'out','微信','','早餐',4,35,1551196800),(271,2019,2,27,'out','微信','','午餐',13,35,1551196800),(272,2019,2,27,'out','微信','叶荣盼','书',83,35,1551196800),(273,2019,2,27,'out','微信','','晚餐',9,35,1551196800),(274,2019,2,28,'out','微信','','早餐',5,35,1551283200),(275,2019,2,28,'out','微信','','农夫山泉',2,35,1551283200),(276,2019,2,28,'out','微信','','午餐',10,35,1551283200),(277,2019,2,28,'out','微信','吃饭',NULL,24,40,1551283200),(278,2019,2,28,'out','微信','','晚餐',8,35,1551283200),(279,2019,2,28,'out','微信','无','无',0,44,1551283200),(280,2019,2,28,'out','校园卡','浙江大学','饮食',25,44,1551283200),(281,2019,3,1,'out','微信','','早餐',5,35,1551369600),(282,2019,3,1,'out','微信','','launch',8,35,1551369600),(283,2019,3,1,'out','微信','','晚餐',10,35,1551369600),(284,2019,3,1,'out','微信','','晚餐',10,35,1551369600),(285,2019,3,1,'get','微信','','晚餐多提交了一次',10,35,1551369600),(286,2019,3,1,'out','微信','','车费',7,35,1551369600),(287,2019,3,1,'out','支付宝','','车费',8,35,1551369600),(288,2019,3,2,'out','微信','','早餐',8,35,1551456000),(289,2019,3,2,'out','微信','','瓜子',6.5,35,1551456000),(290,2019,3,2,'out','微信','','午餐晚餐的泡面',10,35,1551456000),(291,2019,3,2,'out','微信','','电吹风',50,35,1551456000),(292,2019,3,1,'out','支付宝','文具店','制图工具',20,44,1551369600),(293,2019,3,1,'out','校园卡','浙江大学','食物',10,44,1551369600),(294,2019,3,1,'out','支付宝','外卖','食物',18,44,1551369600),(295,2019,3,1,'out','支付宝','文印店','打印',20,44,1551369600),(296,2019,3,3,'out','微信','','早餐',6,35,1551542400),(297,2019,3,3,'out','微信','','昨天的电吹风',5,35,1551542400),(298,2019,3,3,'out','微信','','午餐',8,35,1551542400),(299,2019,3,3,'out','微信','','洗衣服',7,35,1551542400),(300,2019,3,3,'out','微信','','晚餐',10,35,1551542400),(301,2019,3,4,'out','微信','','早餐',5,35,1551628800),(302,2019,3,4,'out','微信','','早餐',6,35,1551628800),(303,2019,3,4,'out','微信','','晚餐',10,35,1551628800),(304,2019,3,5,'out','微信','','早餐',5,35,1551715200),(305,2019,3,5,'out','微信','','午餐',10,35,1551715200),(306,2019,3,5,'out','微信','','晚餐',5,35,1551715200),(307,2019,3,6,'out','微信','','早餐',5,35,1551801600),(308,2019,3,6,'out','微信','','农夫山泉',2,35,1551801600),(309,2019,3,6,'out','微信','','午餐',12,35,1551801600),(310,2019,3,6,'out','校园卡','浙江大学食堂','生存',23,44,1551801600),(311,2019,3,6,'out','支付宝','南田文印店','打印文件',1.5,44,1551801600),(312,2019,3,6,'out','微信','','晚餐',10,35,1551801600),(313,2019,3,7,'out','微信','','早餐',5,35,1551888000),(314,2019,3,7,'out','微信','','午餐',6,35,1551888000),(315,2019,3,7,'out','微信','','晚餐',10,35,1551888000),(316,2019,3,7,'out','微信','','牙膏 牙刷 两袋纸',46,35,1551888000),(317,2019,3,8,'out','微信','','早餐',5,35,1551974400),(318,2019,3,8,'out','微信','','午餐',10,35,1551974400),(319,2019,3,8,'out','微信','','晚餐',8,35,1551974400),(320,2019,3,8,'out','微信','','笔芯',2,35,1551974400),(321,2019,3,9,'out','微信','','早餐',8,35,1552060800),(322,2019,3,9,'out','微信','','洗衣服',7,35,1552060800),(323,2019,3,9,'out','微信','','午餐',7,35,1552060800),(324,2019,3,9,'out','微信','','晚餐',10,35,1552060800),(325,2019,3,10,'out','微信','','早餐',6,35,1552147200),(326,2019,3,10,'out','微信','','午餐',8,35,1552147200),(327,2019,3,10,'out','微信','','晚餐',12,35,1552147200),(328,2019,3,11,'out','微信','','早餐',8,35,1552233600),(329,2019,3,11,'out','微信','','农夫山泉和水',6,35,1552233600),(330,2019,3,11,'out','微信','','晚餐',12,35,1552233600),(331,2019,3,11,'out','微信','','早餐',5,35,1552233600),(332,2019,3,12,'out','微信','','午餐',12,35,1552320000),(333,2019,3,12,'out','微信','','晚餐',12,35,1552320000),(334,2019,3,13,'out','微信','','早餐',5,35,1552406400),(335,2019,3,13,'out','微信','','午餐',12,35,1552406400),(336,2019,3,13,'out','微信','',NULL,0,35,1552406400),(337,2019,3,13,'out','微信','','洗衣服',7,35,1552406400),(338,2019,3,13,'out','微信','','本子 修正带',16,35,1552406400),(339,2019,3,13,'out','微信','','热狗',3,35,1552406400),(340,2019,3,13,'out','微信','','晚餐',12,35,1552406400),(341,2019,3,14,'out','微信','','早餐',7,35,1552492800),(342,2019,3,14,'out','微信','','午餐',12,35,1552492800),(343,2019,3,14,'out','微信','','洗衣服',7,35,1552492800),(344,2019,3,14,'out','微信','','早餐',12,35,1552492800),(345,2019,3,15,'out','微信','','早餐',5,35,1552579200),(346,2019,3,19,'out','微信','','晚餐',8,35,1552924800),(347,2019,3,20,'out','微信','',NULL,1,35,1553011200),(348,2019,3,19,'out','微信','',NULL,2,35,1552924800);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feed_back`
--

DROP TABLE IF EXISTS `feed_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_back` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `content` text,
  `user_id` int(6) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feed_back`
--

LOCK TABLES `feed_back` WRITE;
/*!40000 ALTER TABLE `feed_back` DISABLE KEYS */;
INSERT INTO `feed_back` VALUES (18,'h',35,1550923739);
/*!40000 ALTER TABLE `feed_back` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `user_id` int(6) NOT NULL,
  `content` text NOT NULL,
  `tag` varchar(255) DEFAULT '',
  `create_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (12,37,'卡',' tag',1551872839),(2,37,'c',' t tt',1551870533),(3,37,'c',' t tt',1551870542),(4,37,'j',' t tt',1551870555),(5,37,'','',1551870793),(6,37,'','',1551870805),(7,37,'','',1551872005),(8,37,'','',1551872047),(9,37,'这是内容','',1551872205),(10,43,'搜索不到我','',1551872205),(13,37,'k',' tag',1551872863),(14,37,' jjs',' kj',1551872969),(15,37,'yu',' jk',1551873034),(16,37,'可',' 呢',1551873148),(17,37,'可',' 就',1551873165),(18,37,'卡卡',' 卡',1551873393),(19,37,'们',' 你',1551873411),(20,37,'我',' 你',1551873443),(21,37,'他',' 他',1551873458),(22,37,'真相',' 我',1551873528),(23,37,'我我',' 辣椒',1551873608),(24,37,'呢',' 卡',1551873853),(25,37,'么么呢',' 卡',1551873867),(26,37,'第一',' 卡卡',1551874102),(27,37,'就','',1551874112),(28,37,'我',' 就',1551874127),(29,37,'卡','',1551874143),(30,37,'卡',' 就',1551874163),(31,37,'呢',' 如',1551874171);
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` int(2) DEFAULT '0',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (35,'shudal','2e1502e1e5c1a317452297f06a8c878fe0196345','shudal','shudal@qq.com',1,1550915055),(38,'1849045415','a94a8fe5ccb19ba61c4c0873d391e987982fbbd3','nick','shudal@foxmail.com',0,1550982422),(37,'test1','a94a8fe5ccb19ba61c4c0873d391e987982fbbd3','test1','1849045415@qq.com',1,1550924049),(43,'test2','a94a8fe5ccb19ba61c4c0873d391e987982fbbd3','t','2246188564@qq.com',0,1551279218),(40,'wzcy2046','4aa87b01a3cc4504302c0f7802da5429dd6ce602','赵辰阳','wzcy2046@sina.com',1,1551170010),(44,'Sinklight','7c4a8d09ca3762af61e59520943dc26494f8941b','Sinklight','3326603149@qq.com',1,1551351963),(45,'kkkkk','7c4a8d09ca3762af61e59520943dc26494f8941b','杨友森','765894616@qq.com',0,1551354466),(46,'kkkkk','7c4a8d09ca3762af61e59520943dc26494f8941b','杨友森','765894616@qq.com',0,1551354468);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_meta` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(6) NOT NULL,
  `start_day` int(3) DEFAULT '1',
  `month_used` double DEFAULT NULL,
  `cleared` int(2) DEFAULT '0',
  `month_fee` int(5) DEFAULT '1000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
INSERT INTO `user_meta` VALUES (1,2,21,426,2,1000),(2,1,20,426,2,1500),(3,35,20,2,3,1500),(4,36,1,426,0,1000),(5,37,1,426,0,1000),(6,39,1,0,0,1000),(7,40,1,24,0,1000),(8,44,1,117.5,0,1000);
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_online`
--

DROP TABLE IF EXISTS `user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_online` (
  `token` varchar(255) DEFAULT NULL,
  `timeout` char(12) DEFAULT NULL,
  `user_id` int(6) NOT NULL,
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_online`
--

LOCK TABLES `user_online` WRITE;
/*!40000 ALTER TABLE `user_online` DISABLE KEYS */;
INSERT INTO `user_online` VALUES ('fcb4f6f8303ebf44de2ae4ad16427c50','1554127611',35,83,1551103690),('69a401ac0c7ba52290bb5da90c962bdf','1554128142',35,85,1551104142),('ed69ad7f110500baa8ec3ac213339a8e','1554128320',35,86,1551104320),('21e1fd2b9699918f76dc14dfd6bea155','1554130664',35,87,1551106669),('9afb61c93a890f69ca2d37dd6e9cdc1b','1554176552',35,88,1551157236),('ed0c272b0a05187dcb4533421198283c','1554181304',35,89,1551157304),('689b06df7effccc8158ed5e06c68efbd','1554181447',35,90,1551157447),('ec4f087ae1a1fa6937f89ed15ce2aab4','1554191705',35,92,1551168436),('9b0724fb9f77dfd240e4a75904617376','1554193279',35,93,1551169353),('3d2ced012cae945fb7d83dacfa80c489','1554196758',35,97,1551242764),('ded73cfdc2457ec9dd5c2c456f1e5654','1554352443',35,102,1551350740),('1b9fb7014c2977f2eecf9260694dac02','1554364797',40,103,1553143080),('881453b20257f9ee97d0ce390241ddbe','1554376007',44,104,1551352210),('8376d2243d8cb08aaca12e27cb175606','1554377103',44,105,1551353216),('08e7675cc6a9ba616afda53d69268fcf','1554379623',44,106,1551355715),('e3fd9568fe8328230330db9fcea669de','1554380079',35,107,1551359884),('2dede8c863e31ac99da7157427e169a5','1554384345',35,108,1551360364),('8b0906911cc5fb793371ef22bac3c847','1554385112',35,109,1551361119),('6910cd6bac87b2f8e801e7dbd8640bf3','1554385393',35,110,1551361455),('b3f83ac4c1b31986637895b9c5bfe8bf','1554385701',44,111,1553143080),('153a11dec617ccfd6ee0f2b9f26f98a6','1554387040',35,112,1551363043),('1ba3ac2f822c2a19361c8d4861b20243','1554550045',35,115,1551790133),('5d4148e76bdc68116801b7f738c157bb','1554819388',35,118,1551796094),('1a9d9d8d80c070d46d59a3b0a98b3dd3','1554820265',35,119,1551796273),('edfce255a152e08dd0369f0fe660e6b4','1554985391',35,122,1552261856),('0cf5c61e2e8c5b2b68b08fee645d1210','1556115224',35,124,1553149624);
/*!40000 ALTER TABLE `user_online` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-21 14:34:34
