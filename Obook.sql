-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mobshopdb
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_customer` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_username` varchar(45) NOT NULL,
  `u_password` varchar(45) NOT NULL,
  `u_email` varchar(45) NOT NULL,
  `u_address` varchar(45) NOT NULL,
  `u_mobile` varchar(45) NOT NULL,
  `u_secret` varchar(45) DEFAULT NULL,
  `u_activation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_username` (`u_username`),
  UNIQUE KEY `u_email` (`u_email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customer`
--

LOCK TABLES `tbl_customer` WRITE;
/*!40000 ALTER TABLE `tbl_customer` DISABLE KEYS */;
INSERT INTO `tbl_customer` VALUES (1,'John','abc111','John@gmail.com','Colombo','01123431231','abc','1'),(2,'Mark','a1234a','Mark@yahoo.com','Kandy','0323321343','','0'),(3,'Muqsith','muq@111','Muqsith@hotmail.com','Waththala','07712875487','','0'),(4,'Sai','sai1111','sai@gmail.com','Kotahena','01121234322','','0'),(5,'Zakir','zkr111','zakir@yahoo.com','Dehiwala','0112331212','','0'),(6,'Mufeed','mufxxd111','mufeed@gmail.com','Dehiwala','0112121211121','','1'),(21,'Alex','alex@123','alex@aaa.com','Colombo','111','','1'),(30,'Ray','aa2da61894bef09f64566577d34401a17c665d33','ray@aaa.com','Colombo','111','','1'),(31,'Kate','5c3a3f0252a60ececc1b4ce8d4592ef89145061f','katy@yahoo.com','kandy','0778565132','b810fceb76655418c570bbb0a6b2a98e','1');
/*!40000 ALTER TABLE `tbl_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(45) DEFAULT NULL,
  `p_price` varchar(45) DEFAULT NULL,
  `p_image` varchar(1000) NOT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (1,'100 Poems','Rs.5500','http://192.168.8.107:80/obook/img/100 Poems.jpg'),(2,'A Wrinkle in Time','Rs.1200','http://192.168.8.107:80/obook/img/A Wrinkle in Time.jpg'),(3,'After I Beleive','Rs.1700','http://192.168.8.107:80/obook/img/After I Beleive.jpg'),(4,'Catch-22','Rs.3200','http://192.168.8.107:80/obook/img/Catch-22.jpg'),(5,'DaVicnci Code','Rs.2000','http://192.168.8.107:80/obook/img/Da Vicnci Code.jpg'),(6,'Gainman','Rs.2500','http://192.168.8.107:80/obook/img/Gainman.jpg'),(7,'Genesis','Rs.1500','http://192.168.8.107:80/obook/img/Genesis.jpg'),(8,'I\'ll be There','Rs.1000','http://192.168.8.107:80/obook/img/I\'ll be There.jpg'),(9,'Jack Hudges','Rs.4000','http://192.168.8.107:80/obook/img/Jack Hudges.jpg'),(10,'Nineteen Eighty ','Rs.3000','http://192.168.8.107:80/obook/img/Nineteen Eighty four.jpg'),(11,'Physik','Rs.2000','http://192.168.8.107:80/obook/img/Physik.jpg'),(12,'Ray Bradebury','Rs.4000','http://192.168.8.107:80/obook/img/Ray Bradebury.jpg'),(13,'Silmarillion','Rs.2400','http://192.168.8.107:80/obook/img/Silmarillion.jpg'),(14,'Snake Skin','Rs.3200','http://192.168.8.107:80/obook/img/Snake Skin.jpg'),(15,'Somewhere intime','Rs.5000','http://192.168.8.107:80/obook/img/Somewhere in time.jpg'),(16,'Stars','Rs.4000','http://192.168.8.107:80/obook/img/Stars.jpg'),(17,'Stylvia Day','Rs.4500','http://192.168.8.107:80/obook/img/Stylvia Day.jpg'),(18,'Book of Karma','Rs.2300','http://192.168.8.107:80/obook/img/The Book of Karma.jpg'),(19,'Followship Ring','Rs.4300','http://192.168.8.107:80/obook/img/The Followship of the Ring.jpg'),(20,'The Gold Finch','Rs.3200','http://192.168.8.107:80/obook/img/The Gold Finch.jpg'),(21,'The Hobbit (2)','Rs.3400','http://192.168.8.107:80/obook/img/The Hobbit (2).jpg'),(22,'The Hobbit','Rs.2700','http://192.168.8.107:80/obook/img/The Hobbit.jpg'),(23,'Man world end','Rs.4500','http://192.168.8.107:80/obook/img/The Man who watched the world end.jpg'),(24,'Minimalist Home','Rs.5500','http://192.168.8.107:80/obook/img/The Minimalist Home.jpg'),(25,'The Silent','Rs.3000','http://192.168.8.107:80/obook/img/The Silent.jpg'),(26,'The Subtle Art','Rs.3500','http://192.168.8.107:80/obook/img/The Subtle Art.png '),(27,'Tommy Orange','Rs.4300','http://192.168.8.107:80/obook/img/Tommy Orange.jpg'),(28,'Transformers','Rs.3200','http://192.168.8.107:80/obook/img/Transformers.jpg ');
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-27 13:25:20
