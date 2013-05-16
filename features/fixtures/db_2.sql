-- MySQL dump 10.13  Distrib 5.6.10, for osx10.8 (x86_64)
--
-- Host: 22.22.22.22    Database: db_2
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.12.04.1-log

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
-- Table structure for table `table_3`
--

DROP TABLE IF EXISTS `table_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_3` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(50) DEFAULT NULL,
  `words` text,
  `pasword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_3`
--

LOCK TABLES `table_3` WRITE;
/*!40000 ALTER TABLE `table_3` DISABLE KEYS */;
INSERT INTO `table_3` VALUES (1,'Georgia','adipiscing ligula. Aenean gravida nunc','UUU76CLC3OJ'),(2,'Ukraine','nec luctus','OXZ06QMX9MN'),(3,'Congo','ante ipsum primis','NSO34ICD4NG'),(4,'Slovakia','ante','TGC31CJU7VS'),(5,'Portugal','mollis vitae, posuere at,','XOM42AUS3WV'),(6,'Seychelles','ac turpis egestas. Fusce','PMR37UQW8ZR'),(7,'Mozambique','semper egestas, urna justo faucibus lectus, a sollicitudin orci','IDQ26DRY1MQ'),(8,'Lebanon','nibh sit amet orci.','HSO81FFW0VT'),(9,'Togo','Donec felis orci, adipiscing non, luctus sit amet, faucibus','MQW87NBM6TK'),(10,'Saint Pierre and Miquelon','lobortis augue','GNN52BKJ2PG'),(11,'Gabon','Ut nec urna et arcu','FFL68HMP8NB'),(12,'Ireland','sit amet orci.','ELN49BYE1IO'),(13,'Iraq','Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit','TIV95GQJ5DZ'),(14,'Haiti','et pede. Nunc sed orci lobortis augue','UXN93BKJ1JN'),(15,'Czech Republic','ipsum non arcu. Vivamus sit amet risus.','QPX39SIM9YW'),(16,'Mauritania','tellus','YSW76KSA4DJ'),(17,'Mauritania','vulputate, nisi sem semper erat,','UEZ48XVT6DG'),(18,'Mozambique','orci. Donec','EEX09UVO1OO'),(19,'Niue','ornare, lectus ante dictum mi, ac mattis velit','FFV93VLE7GY'),(20,'Grenada','eu, odio. Phasellus at augue','YNG17EFP9BE'),(21,'China','dignissim pharetra. Nam ac nulla. In tincidunt','VIQ05MBX3MC'),(22,'Aruba','pede ac urna. Ut tincidunt vehicula risus. Nulla','KDF36MLJ6RZ'),(23,'Nicaragua','sagittis semper. Nam tempor diam dictum sapien.','VHW66MSD9TA'),(24,'Finland','Sed dictum. Proin','IYD70ICT8NC'),(25,'Korea','Aenean eget','CXF91BPU5HY'),(26,'Mali','diam','VGB12FXH5ZB'),(27,'Guam','eu nulla at sem molestie sodales.','VSG96MWU5LP'),(28,'Bermuda','arcu. Sed eu nibh vulputate mauris sagittis placerat.','QUM40OQG7OO'),(29,'France','justo. Proin non massa non ante','RCU48AKK4GF'),(30,'Angola','mattis. Integer eu lacus. Quisque imperdiet, erat nonummy','DLI72VGH3XO'),(31,'Bouvet Island','ullamcorper magna. Sed eu eros.','KAS00NOX5YH'),(32,'Algeria','purus ac tellus.','AYH13QYP4EX'),(33,'Sri Lanka','auctor','YNO35HLP7AM'),(34,'Gambia','elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis','IEH31PNM2LC'),(35,'Paraguay','amet, consectetuer adipiscing elit. Curabitur sed tortor.','NRL41AWR3HH'),(36,'Brazil','a, magna. Lorem ipsum','LHO74WDP4RB'),(37,'Panama','augue id','JTE84QJP6FH'),(38,'Yemen','dictum augue malesuada malesuada. Integer id','DVI51XIP7ME'),(39,'Cuba','luctus lobortis.','XHL20PEL2OB'),(40,'Turkey','mi enim, condimentum eget, volutpat ornare, facilisis eget,','XHW01FPG1XW'),(41,'Tonga','arcu et pede. Nunc sed','DPH08TIX3MJ'),(42,'Mozambique','a,','NVT41PLG8AN'),(43,'United States','augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna','VIL99TZU4HS'),(44,'Sudan','non nisi. Aenean eget metus. In nec orci.','LVN96GJU8UB'),(45,'Oman','non magna. Nam ligula elit, pretium et, rutrum','PSZ40LKY1KT'),(46,'Norway','Cras eu tellus eu augue porttitor interdum.','MMN93BWY2FS'),(47,'Brunei Darussalam','nec','UUI44IWO7HM'),(48,'Turks and Caicos Islands','eu dolor egestas rhoncus. Proin nisl sem,','PJR08FAE2XD'),(49,'Mauritius','egestas. Aliquam','SDQ49YXK2UY'),(50,'Angola','porttitor','YSR51JPY6PD'),(51,'Timor-leste','luctus ut, pellentesque eget, dictum','LPC17SQQ6OB'),(52,'Venezuela','magna. Cras convallis convallis','ZJM91ELF5BE'),(53,'Cape Verde','ornare, libero at auctor ullamcorper, nisl arcu','BDO47QQM3GD'),(54,'Aruba','In mi pede, nonummy ut, molestie in, tempus eu,','ADF05SYQ8JV'),(55,'Ireland','Integer aliquam adipiscing lacus. Ut','PBH62VDZ4TL'),(56,'Swaziland','Etiam','XVU99AXM7VD'),(57,'Myanmar','sem elit, pharetra','AQZ67GGY1JX'),(58,'Monaco','euismod urna.','LDY39TGY7DL'),(59,'Liberia','id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim','CFN18MTP7AN'),(60,'Sweden','non, bibendum sed, est.','LNU86SFR4LP'),(61,'Denmark','libero mauris, aliquam eu, accumsan sed,','SPP88DYR6SG'),(62,'Haiti','aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet','GCF66ZOI7TZ'),(63,'Cayman Islands','cursus et,','KTQ13GYD3XV'),(64,'Andorra','quam quis diam. Pellentesque habitant morbi tristique','KJV64AIC0WL'),(65,'Philippines','a sollicitudin orci sem eget massa.','WTZ25QKW8JA'),(66,'Ethiopia','ipsum ac mi','HXW62SIT7QW'),(67,'Saint Helena','sit amet ornare lectus justo','LCS38SPJ3ZG'),(68,'Croatia','taciti sociosqu ad litora','MQC75ZMV6VO'),(69,'Iran, Islamic Republic of','diam vel arcu. Curabitur ut','EZT60LYX1NH'),(70,'Korea, Republic of','sagittis placerat. Cras dictum ultricies ligula.','RWU14WZB8MW'),(71,'Macedonia','Curabitur ut odio vel','YUW07PSV0QS'),(72,'China','urna et','RRO35INA2NB'),(73,'Azerbaijan','ante','PIJ51GQW8IR'),(74,'Tunisia','augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna','CDK77YCI2QI'),(75,'Macedonia','aliquet. Proin','PDI14RRO9HL'),(76,'Serbia and Montenegro','Cras pellentesque. Sed dictum. Proin eget odio.','RPN77XNN8PV'),(77,'Chad','enim. Mauris quis','SJO25WLZ5DO'),(78,'Lesotho','imperdiet non, vestibulum nec, euismod','HAC96PTI5GV'),(79,'Hungary','fermentum metus. Aenean sed pede nec ante blandit viverra.','PCV24JOZ2ZZ'),(80,'Sierra Leone','ridiculus mus.','HNN55PNF2GN'),(81,'Reunion','urna. Vivamus molestie dapibus ligula. Aliquam','DJA74WZY2NY'),(82,'Jordan','luctus vulputate, nisi sem semper erat,','GQL51YCT5PY'),(83,'Romania','purus. Duis elementum, dui quis accumsan convallis, ante lectus','LJV57WHF7GE'),(84,'Ukraine','Vivamus sit amet risus. Donec egestas. Aliquam nec','JIA69LDD3GW'),(85,'Tokelau','venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer','QSG00BRV9YB'),(86,'Northern Mariana Islands','ut, molestie in,','PAH93HPH7TL'),(87,'Belize','orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero','ZVB65IRP3JK'),(88,'Ghana','nulla. Cras eu tellus','ZNR55YOX2DF'),(89,'Zambia','augue eu tellus. Phasellus elit pede, malesuada vel, venenatis','CWX06ZRE2JT'),(90,'Palestinian Territory, Occupied','a, aliquet vel, vulputate eu, odio. Phasellus at','AAQ05HPC2DZ'),(91,'Libyan Arab Jamahiriya','id ante dictum','MDU59SQR6IV'),(92,'Yemen','Ut tincidunt orci quis lectus. Nullam suscipit,','RJT63KRY6GA'),(93,'Turkey','eget laoreet posuere, enim','KRE88ZMU6CL'),(94,'Holy See (Vatican City State)','pharetra nibh. Aliquam ornare, libero','JCW04QSW0KU'),(95,'Portugal','Integer eu lacus. Quisque imperdiet, erat nonummy','QBU07ZYN9KI'),(96,'New Zealand','et tristique pellentesque, tellus sem mollis','AYC30ZLN6EJ'),(97,'Northern Mariana Islands','eu nulla at sem molestie sodales.','JGZ93TAA7YO'),(98,'Palestinian Territory, Occupied','erat, in consectetuer ipsum','IWS38UTW7EJ'),(99,'Guadeloupe','in faucibus orci luctus','AXX31WJM6KN');
/*!40000 ALTER TABLE `table_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_4`
--

DROP TABLE IF EXISTS `table_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_4` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_4`
--

LOCK TABLES `table_4` WRITE;
/*!40000 ALTER TABLE `table_4` DISABLE KEYS */;
INSERT INTO `table_4` VALUES (1,'','Paterson','Chami'),(2,'','Lawndale','Google'),(3,'','Niagara Falls','Lavasoft'),(4,'','Crown Point','Google'),(5,'','Yonkers','Microsoft'),(6,'','Kona','Cakewalk'),(7,'','McAlester','Lycos'),(8,'','Texarkana','Borland'),(9,'','Huntsville','Chami'),(10,'','Elmira','Chami'),(11,'','Monroe','Yahoo'),(12,'','Princeton','Altavista'),(13,'','Elmira','Chami'),(14,'','Lomita','Adobe'),(15,'','Pittsburgh','Lycos'),(16,'','Normal','Apple Systems'),(17,'','New Brunswick','Finale'),(18,'','Woodruff','Lavasoft'),(19,'','Portland','Sibelius'),(20,'','Woodward','Adobe'),(21,'','Moscow','Lycos'),(22,'','Somerville','Cakewalk'),(23,'','Hartford','Borland'),(24,'','Murray','Finale'),(25,'','Medford','Chami'),(26,'','San Rafael','Borland'),(27,'','Tyler','Cakewalk'),(28,'','Carolina','Cakewalk'),(29,'','Bethany','Yahoo'),(30,'','West Hollywood','Borland'),(31,'','Hoboken','Adobe'),(32,'','Bellingham','Cakewalk'),(33,'','Revere','Yahoo'),(34,'','Baldwin Park','Yahoo'),(35,'','Edmond','Adobe'),(36,'','Menomonee Falls','Macromedia'),(37,'','Glens Falls','Apple Systems'),(38,'','Mechanicville','Adobe'),(39,'','East St. Louis','Finale'),(40,'','Peekskill','Lavasoft'),(41,'','Gilbert','Lycos'),(42,'','Wichita Falls','Google'),(43,'','Rolling Hills','Google'),(44,'','Shawnee','Microsoft'),(45,'','Highland Park','Apple Systems'),(46,'','Barre','Adobe'),(47,'','Altoona','Finale'),(48,'','DuBois','Lycos'),(49,'','Alameda','Borland'),(50,'','Valparaiso','Lavasoft'),(51,'','Joliet','Macromedia'),(52,'','Hayward','Sibelius'),(53,'','Orem','Adobe'),(54,'','Nanticoke','Microsoft'),(55,'','Benton Harbor','Microsoft'),(56,'','Pawtucket','Finale'),(57,'','Guayanilla','Sibelius'),(58,'','Ventura','Apple Systems'),(59,'','Auburn','Borland'),(60,'','Wynne','Lavasoft'),(61,'','Ypsilanti','Borland'),(62,'','Fayetteville','Google'),(63,'','Hannibal','Macromedia'),(64,'','Sonoma','Adobe'),(65,'','Wheaton','Borland'),(66,'','La Mirada','Chami'),(67,'','Layton','Apple Systems'),(68,'','Forrest City','Lycos'),(69,'','West Valley City','Macromedia'),(70,'','Las Cruces','Google'),(71,'','Hattiesburg','Google'),(72,'','Irving','Finale'),(73,'','Shawnee','Sibelius'),(74,'','Santa Clara','Sibelius'),(75,'','Carrollton','Adobe'),(76,'','Villa Park','Macromedia'),(77,'','Beacon','Chami'),(78,'','Glendora','Sibelius'),(79,'','Fitchburg','Google'),(80,'','Saint Joseph','Borland'),(81,'','Spartanburg','Sibelius'),(82,'','Altoona','Lycos'),(83,'','Indio','Lycos'),(84,'','Gardena','Finale'),(85,'','Frisco','Altavista'),(86,'','Hanahan','Finale'),(87,'','Orangeburg','Google'),(88,'','Fredericksburg','Lycos'),(89,'','Lebanon','Adobe'),(90,'','Guayanilla','Adobe'),(91,'','City of Industry','Microsoft'),(92,'','Bentonville','Finale'),(93,'','Saint Joseph','Cakewalk'),(94,'','South Portland','Borland'),(95,'','Columbia','Apple Systems'),(96,'','Providence','Google'),(97,'','Farrell','Finale'),(98,'','Attleboro','Chami'),(99,'','Agat','Apple Systems'),(100,'','Walla Walla','Lycos');
/*!40000 ALTER TABLE `table_4` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-16  9:27:29
