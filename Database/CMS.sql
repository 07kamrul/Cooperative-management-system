-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: finance
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_amount`
--

DROP TABLE IF EXISTS `accounts_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_amount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `profile_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_amount_profile_id_8529c86a_fk_accounts_profile_id` (`profile_id`),
  CONSTRAINT `accounts_amount_profile_id_8529c86a_fk_accounts_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `accounts_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_amount`
--

LOCK TABLES `accounts_amount` WRITE;
/*!40000 ALTER TABLE `accounts_amount` DISABLE KEYS */;
INSERT INTO `accounts_amount` VALUES (1,'2020-07-15',2000,'Pending',2),(2,'2020-06-30',20000,'Pending',2),(3,'2020-05-30',5000,'Complete',2),(4,'2020-06-10',10,'Complete',2),(5,'2020-06-10',10,'Pending',2),(6,'2020-06-10',10,'Pending',2),(7,'2020-06-10',10,'Complete',2),(8,'2020-06-30',0,'Complete',2),(9,'2020-06-30',5000,'Complete',3),(10,'2020-07-15',3500,'Complete',3),(11,'2020-05-30',2000,'Complete',3),(12,'2020-07-03',6000,'Pending',3),(13,'2020-07-12',2222,'Pending',5);
/*!40000 ALTER TABLE `accounts_amount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_deposite`
--

DROP TABLE IF EXISTS `accounts_deposite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_deposite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `profile_id` int DEFAULT NULL,
  `diposite_pic` varchar(100),
  PRIMARY KEY (`id`),
  KEY `accounts_deposite_profile_id_78ad4e50_fk_accounts_profile_id` (`profile_id`),
  CONSTRAINT `accounts_deposite_profile_id_78ad4e50_fk_accounts_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `accounts_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_deposite`
--

LOCK TABLES `accounts_deposite` WRITE;
/*!40000 ALTER TABLE `accounts_deposite` DISABLE KEYS */;
INSERT INTO `accounts_deposite` VALUES (1,'2020-08-29',10000,5,'diposite.jpg'),(2,'2020-08-29',10000,5,'diposite.jpg'),(3,'2020-08-29',200000,5,'diposite.jpg');
/*!40000 ALTER TABLE `accounts_deposite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_member`
--

DROP TABLE IF EXISTS `accounts_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity` varchar(1000) DEFAULT NULL,
  `amount_id` int DEFAULT NULL,
  `profile_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_member_amount_id_b591e225_fk_accounts_amount_id` (`amount_id`),
  KEY `accounts_member_profile_id_1f34d7f8_fk_accounts_profile_id` (`profile_id`),
  CONSTRAINT `accounts_member_amount_id_b591e225_fk_accounts_amount_id` FOREIGN KEY (`amount_id`) REFERENCES `accounts_amount` (`id`),
  CONSTRAINT `accounts_member_profile_id_1f34d7f8_fk_accounts_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `accounts_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_member`
--

LOCK TABLES `accounts_member` WRITE;
/*!40000 ALTER TABLE `accounts_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_profile`
--

DROP TABLE IF EXISTS `accounts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `father_name` varchar(200) DEFAULT NULL,
  `mother_name` varchar(200) DEFAULT NULL,
  `nationality` varchar(200) DEFAULT NULL,
  `gender` varchar(200) DEFAULT NULL,
  `occupation` varchar(200) DEFAULT NULL,
  `nid` varchar(200) DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `marital_status` varchar(200) DEFAULT NULL,
  `religion` varchar(200) DEFAULT NULL,
  `permanent_address` varchar(200) DEFAULT NULL,
  `present_address` varchar(200) DEFAULT NULL,
  `nominee_name` varchar(200) DEFAULT NULL,
  `relation` varchar(200) DEFAULT NULL,
  `nominee_father_name` varchar(200) DEFAULT NULL,
  `nominee_mother_name` varchar(200) DEFAULT NULL,
  `nominee_phone` varchar(15) DEFAULT NULL,
  `nominee_dob` date DEFAULT NULL,
  `nominee_gender` varchar(200) DEFAULT NULL,
  `nominee_marital_status` varchar(200) DEFAULT NULL,
  `nominee_religion` varchar(200) DEFAULT NULL,
  `nominee_nid` varchar(200) DEFAULT NULL,
  `nominee_present_address` varchar(200) DEFAULT NULL,
  `nominee_permanent_address` varchar(200) DEFAULT NULL,
  `account_no` varchar(200) DEFAULT NULL,
  `bank_name` varchar(200) DEFAULT NULL,
  `branch_address` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
INSERT INTO `accounts_profile` VALUES (2,'Md. Kamrul Hasan','profile.jpg','Late Md. Abul Kashem','Hajera Begum','Bangladeshi','Male',NULL,'0',0,'01758290421','mdkamrulhasanewu@gmail.com','1996-07-01','Single','Islam','Road-07, House-05, Senpara Parbata, Mirpur-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Male','Single','Islam','123456789',NULL,NULL,'0',NULL,NULL,2,'2020-06-28'),(3,'Md. Kaiyum Hasan','profile.jpg','Late Md. Abul Kashem','Hajera Begum','Bangladeshi','Male',NULL,'0',0,'01758290421','mdkamrulhasanewu@gmail.com',NULL,'Single','Islam','Road-07, House-05, Senpara Parbata, Mirpur-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Male','Single','Islam','0',NULL,NULL,'01224.3365.654',NULL,NULL,3,'2020-05-01'),(5,'Test','56985369_577127742776580_2587267618842869760_n_td5Ns0p.png','Late Md. Abul Kashem','Hajera Begum','Bangladeshi','Male',NULL,NULL,420,'01758290421','mdkamrulhasanewu@gmail.com',NULL,'Single','Islam','Road-07, House-05, Senpara Parbata, Mirpur-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Male','Single','Islam',NULL,NULL,NULL,NULL,NULL,NULL,7,NULL),(6,'Qamrul','profile.jpg','Late Md. Abul Kashem','Hajera Begum','Bangladeshi','Male',NULL,'3706038407',2,'01758290421','mdkamrulhasanewu@gmail.com',NULL,'Single','Islam','Road-07, House-05, Senpara Parbata, Mirpur-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Male','Single','Islam',NULL,NULL,NULL,NULL,NULL,NULL,6,NULL),(7,'Samia','71909_DSC_0066.JPG','Late Md. Abul Kashem','Hajera Begum','Bangladeshi','Male',NULL,'3706038407',6,'01758290421','mdkamrulhasanewu@gmail.com','1996-07-01','Single','Islam','Road-07, House-05, Senpara Parbata, Mirpur-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Male','Single','Islam',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL);
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_totalcost`
--

DROP TABLE IF EXISTS `accounts_totalcost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_totalcost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_totalcost`
--

LOCK TABLES `accounts_totalcost` WRITE;
/*!40000 ALTER TABLE `accounts_totalcost` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_totalcost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'admin'),(2,'members');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(43,2,28),(41,2,32),(44,2,36),(42,2,40);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add amount',7,'add_amount'),(26,'Can change amount',7,'change_amount'),(27,'Can delete amount',7,'delete_amount'),(28,'Can view amount',7,'view_amount'),(29,'Can add profile',8,'add_profile'),(30,'Can change profile',8,'change_profile'),(31,'Can delete profile',8,'delete_profile'),(32,'Can view profile',8,'view_profile'),(33,'Can add member',9,'add_member'),(34,'Can change member',9,'change_member'),(35,'Can delete member',9,'delete_member'),(36,'Can view member',9,'view_member'),(37,'Can add total cost',10,'add_totalcost'),(38,'Can change total cost',10,'change_totalcost'),(39,'Can delete total cost',10,'delete_totalcost'),(40,'Can view total cost',10,'view_totalcost'),(41,'Can add deposite',11,'add_deposite'),(42,'Can change deposite',11,'change_deposite'),(43,'Can delete deposite',11,'delete_deposite'),(44,'Can view deposite',11,'view_deposite');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$dFa7aRtejeDe$A009JhkEAgsmVcF7c631pPvEW5ry/G/7Byrjr8C0slw=','2020-07-30 19:48:20.340563',1,'admin','','','admin@gmail.com',1,1,'2020-06-28 17:38:32.000000'),(2,'pbkdf2_sha256$150000$XKVVw4SeHQtR$l+88t3fC5C6+7jYvG4HO77yEcTwxsIJye11WXqOV5z0=',NULL,0,'kamrul.hasan','','','',0,1,'2020-06-30 05:34:05.940125'),(3,'pbkdf2_sha256$150000$NKWQlE9d8cTq$9YLlzzKuN+6R9Z/3EM/Ypq393XPXKsPCdCqbctqtSqc=',NULL,0,'kaiyum.hossain','','','',0,1,'2020-07-02 15:59:45.767989'),(4,'pbkdf2_sha256$150000$GkfmTnkxMdxM$DDnwQMqmg4lAN0+EbKDYfZjvtT/sjDu2Lq0C7i2EFyY=','2020-08-28 19:28:32.613650',0,'samia','','','',0,1,'2020-07-05 18:03:59.000000'),(5,'pbkdf2_sha256$150000$RTvkQ1KvwfMY$EjBPFz9//QPbQvEEXw0enOly4hX5UBWmDbfsbjQS45I=',NULL,0,'diykcraft','','','',0,1,'2020-07-05 19:20:35.314051'),(6,'pbkdf2_sha256$150000$orzjzf2MfBmT$cNXFSz9IgyIUvwU3pFMb5GLgGfWgUNb5Yw+ESpbOtbQ=',NULL,0,'qamrul','','','',0,1,'2020-07-05 20:03:03.667321'),(7,'pbkdf2_sha256$216000$Uzdn3h0zq39t$UmnG29yijuGo0F4431FwV9ldkEUbz+0qAuMBcnDLQ4w=','2020-09-30 07:05:55.280270',0,'test','','','',1,1,'2020-07-11 18:55:38.000000'),(10,'pbkdf2_sha256$150000$OBblLog77L7T$sHrtNkL6gt61yM7S4skqDqSe70KYUH3PPm8fiiUMIaM=',NULL,0,'hello','','','',0,1,'2020-08-13 16:58:41.405660'),(11,'pbkdf2_sha256$150000$TLIWlQBGGwCg$eKcwiWD7aKh8cHROgEZqwYhJBXgA9WxVuc/wmKBHhvM=',NULL,0,'hey','','','',0,1,'2020-08-13 17:01:39.367762'),(12,'pbkdf2_sha256$150000$ucEuZpzVW0R7$d/i+y6lEzA4dI/zKJcRpGkuNhJ78qrnvFEPL+ACRoHI=',NULL,0,'hi','','','',0,1,'2020-08-13 17:08:16.579579'),(13,'pbkdf2_sha256$150000$qNBf4OQBZ9mD$9IxmEIxW3TE6Fw0xYzzi1QPs+j8zncA37EXOy2qLRts=',NULL,0,'hihello','','','',0,1,'2020-08-13 17:09:03.378218');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1),(5,4,2),(3,7,1),(4,7,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-06-28 17:40:07.120523','1','Md. Kamrul Hasan',1,'[{\"added\": {}}]',8,1),(2,'2020-06-28 17:43:10.480492','1','Md. Kamrul Hasan',2,'[{\"changed\": {\"fields\": [\"joining_date\"]}}]',8,1),(3,'2020-06-28 18:03:21.531306','1','Md. Kamrul Hasan',2,'[{\"changed\": {\"fields\": [\"user\"]}}]',8,1),(4,'2020-06-28 19:59:27.802434','1','Kamrul Hasan',2,'[{\"changed\": {\"fields\": [\"profile_pic\"]}}]',8,1),(5,'2020-06-28 20:04:43.756521','1','Kamrul Hasan',2,'[{\"changed\": {\"fields\": [\"profile_pic\"]}}]',8,1),(6,'2020-06-28 20:05:00.019603','1','Kamrul Hasan',2,'[{\"changed\": {\"fields\": [\"profile_pic\"]}}]',8,1),(7,'2020-06-30 05:16:28.127892','1','Kamrul Hasan',1,'[{\"added\": {}}]',7,1),(8,'2020-06-30 05:16:38.346745','1','Kamrul Hasan',1,'[{\"added\": {}}]',9,1),(9,'2020-06-30 05:29:01.532872','1','Kamrul Hasan',2,'[]',9,1),(10,'2020-06-30 05:31:37.446677','1','Kamrul Hasan',3,'',8,1),(11,'2020-06-30 05:34:06.050670','2','kamrul.hasan',1,'[{\"added\": {}}]',4,1),(12,'2020-06-30 05:34:49.714958','2','Md. Kamrul Hasan',1,'[{\"added\": {}}]',8,1),(13,'2020-06-30 05:35:25.157875','2','Md. Kamrul Hasan',1,'[{\"added\": {}}]',7,1),(14,'2020-06-30 05:49:07.503492','1','Md. Kamrul Hasan',2,'[{\"changed\": {\"fields\": [\"date\"]}}]',7,1),(15,'2020-07-01 19:03:02.548795','8','Md. Kamrul Hasan',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',7,1),(16,'2020-07-01 19:03:43.176949','7','Md. Kamrul Hasan',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',7,1),(17,'2020-07-01 19:18:55.799324','4','Md. Kamrul Hasan',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',7,1),(18,'2020-07-02 15:59:45.929461','3','kaiyum.hossain',1,'[{\"added\": {}}]',4,1),(19,'2020-07-02 16:00:19.632893','3','Md. Kaiyum Hasan',1,'[{\"added\": {}}]',8,1),(20,'2020-07-02 16:03:37.686014','9','Md. Kaiyum Hasan',1,'[{\"added\": {}}]',7,1),(21,'2020-07-02 16:03:54.619385','10','Md. Kaiyum Hasan',1,'[{\"added\": {}}]',7,1),(22,'2020-07-02 16:10:07.823098','9','Md. Kaiyum Hasan',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',7,1),(23,'2020-07-02 16:14:11.962027','11','Md. Kaiyum Hasan',1,'[{\"added\": {}}]',7,1),(24,'2020-07-02 16:16:01.880053','11','Md. Kaiyum Hasan',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',7,1),(25,'2020-07-03 18:45:43.858732','12','Md. Kaiyum Hasan',1,'[{\"added\": {}}]',7,1),(26,'2020-07-03 19:31:58.145470','12','Md. Kaiyum Hasan',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',7,1),(27,'2020-07-03 20:12:38.478092','12','Md. Kaiyum Hasan',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',7,1),(28,'2020-07-03 20:12:55.487057','12','Md. Kaiyum Hasan',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',7,1),(29,'2020-07-03 20:13:02.946389','12','Md. Kaiyum Hasan',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',7,1),(30,'2020-07-03 20:34:32.874244','2','Md. Kamrul Hasan',2,'[{\"changed\": {\"fields\": [\"nominee_nid\"]}}]',8,1),(31,'2020-07-03 20:40:28.235168','3','Md. Kaiyum Hasan',2,'[{\"changed\": {\"fields\": [\"account_no\"]}}]',8,1),(32,'2020-07-04 06:55:10.789214','12','Md. Kaiyum Hasan',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',7,1),(33,'2020-07-04 18:07:10.171257','12','Md. Kaiyum Hasan',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',7,1),(34,'2020-07-11 19:25:53.019152','4','Test',1,'[{\"added\": {}}]',8,1),(35,'2020-07-11 19:53:13.903593','4','Test',3,'',8,1),(36,'2020-07-11 19:53:54.929748','5','Test',1,'[{\"added\": {}}]',8,1),(37,'2020-07-11 19:54:56.525943','13','Test',1,'[{\"added\": {}}]',7,1),(38,'2020-07-11 19:56:33.365336','5','Md. Kamrul Hasan',2,'[{\"changed\": {\"fields\": [\"name\", \"phone\", \"email\", \"permanent_address\"]}}]',8,1),(39,'2020-07-11 19:57:15.124984','5','Test',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',8,1),(40,'2020-07-16 19:20:33.090416','1','admin',1,'[{\"added\": {}}]',3,1),(41,'2020-07-16 19:21:30.495486','2','general_members',1,'[{\"added\": {}}]',3,1),(42,'2020-07-16 19:22:06.964405','1','admin',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(43,'2020-07-16 19:22:14.507020','7','test',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(44,'2020-07-23 19:57:46.242117','2','members',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',3,1),(45,'2020-07-23 20:15:45.445970','7','test',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(46,'2020-07-23 20:16:35.001844','7','test',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(47,'2020-07-23 20:17:36.201460','7','test',2,'[{\"changed\": {\"fields\": [\"is_staff\", \"groups\"]}}]',4,1),(48,'2020-07-30 18:57:06.879171','4','samia',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,7),(50,'2020-08-28 21:20:20.730260','5','Test',2,'[{\"changed\": {\"fields\": [\"member_id\"]}}]',8,7);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'accounts','amount'),(11,'accounts','deposite'),(9,'accounts','member'),(8,'accounts','profile'),(10,'accounts','totalcost'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-06-28 17:37:36.559322'),(2,'auth','0001_initial','2020-06-28 17:37:36.914586'),(3,'accounts','0001_initial','2020-06-28 17:37:38.149364'),(4,'admin','0001_initial','2020-06-28 17:37:38.557451'),(5,'admin','0002_logentry_remove_auto_add','2020-06-28 17:37:39.364601'),(6,'admin','0003_logentry_add_action_flag_choices','2020-06-28 17:37:39.377290'),(7,'contenttypes','0002_remove_content_type_name','2020-06-28 17:37:39.913114'),(8,'auth','0002_alter_permission_name_max_length','2020-06-28 17:37:40.037065'),(9,'auth','0003_alter_user_email_max_length','2020-06-28 17:37:40.123929'),(10,'auth','0004_alter_user_username_opts','2020-06-28 17:37:40.137594'),(11,'auth','0005_alter_user_last_login_null','2020-06-28 17:37:40.237145'),(12,'auth','0006_require_contenttypes_0002','2020-06-28 17:37:40.241049'),(13,'auth','0007_alter_validators_add_error_messages','2020-06-28 17:37:40.253737'),(14,'auth','0008_alter_user_username_max_length','2020-06-28 17:37:40.445032'),(15,'auth','0009_alter_user_last_name_max_length','2020-06-28 17:37:40.602168'),(16,'auth','0010_alter_group_name_max_length','2020-06-28 17:37:40.655064'),(17,'auth','0011_update_proxy_permissions','2020-06-28 17:37:40.676539'),(18,'sessions','0001_initial','2020-06-28 17:37:40.893209'),(19,'accounts','0002_profile_joining_date','2020-06-28 17:42:45.147385'),(20,'accounts','0003_auto_20200630_1114','2020-06-30 05:15:06.250452'),(21,'accounts','0004_auto_20200704_0239','2020-07-03 20:39:52.865046'),(22,'accounts','0005_auto_20200717_0011','2020-07-16 18:11:40.468809'),(23,'accounts','0006_deposite','2020-08-23 16:44:39.286023'),(24,'accounts','0007_deposite_diposite_pic','2020-08-28 19:45:50.446868');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('497jsklwl8a0cdhubnbdaoyra9ic45i0','ODk1M2MxMWRkZjYyZDk4NDU3NGU1MGNhNjJlNGU5ZTkzYTRlMjE5ZDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OGZhZjNlZGI4YzVkYzJkYmZiYjZmOWU0MmU3N2E4ZjcyOGVhN2U5In0=','2020-08-18 13:39:50.510186'),('4h5lqvui7ysigmd45h5sssvfsqefn1sl','ODk1M2MxMWRkZjYyZDk4NDU3NGU1MGNhNjJlNGU5ZTkzYTRlMjE5ZDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OGZhZjNlZGI4YzVkYzJkYmZiYjZmOWU0MmU3N2E4ZjcyOGVhN2U5In0=','2020-09-11 19:54:04.052359'),('4zqr7ytto3a1255httpmgp6k3m8aghf4','ODk1M2MxMWRkZjYyZDk4NDU3NGU1MGNhNjJlNGU5ZTkzYTRlMjE5ZDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OGZhZjNlZGI4YzVkYzJkYmZiYjZmOWU0MmU3N2E4ZjcyOGVhN2U5In0=','2020-09-06 15:53:39.742117'),('96o9tx9t0xrhqcih0zmrlgt78yg06x05','.eJxVjEEOwiAQRe_C2hCKUMCl-56BzMCMVA0kpV0Z765NutDtf-_9l4iwrSVunZY4Z3ERTpx-N4T0oLqDfId6azK1ui4zyl2RB-1yapme18P9OyjQy7cOzjjvGZJ1A3p71po0Wk46KcMKeSRCxcGRD4DMCXRWAUNWfjSZwiDeH_OBOK0:1kNWBX:l6o8kX9O1tcIqiGIafkEk2CtZZbf0dr3HuywfrKSdC8','2020-10-14 07:05:55.287098'),('ctpuqnf80gnplhy40w9mglojejgaw5fc','MDllZjQ0ZDlhNmJlODU4OWVkODJmNzU1NDY0NDRhNmVjYjUxNzFlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMDRmOTdlOTA1YTNmOGIxNDc2MTA5NWE1NjlhMDZmYjA2NGRiMzdlIn0=','2020-07-14 09:46:15.275738'),('lduwhp6t7oxka1p5cfxlscuxf8p0x2nt','NzZjMDBmY2IxODgxYzRjNGExNDk4ZjVkNDZlOTZmYWFiMTVmMTgwYTp7fQ==','2020-07-25 19:15:57.608539'),('mj2lvufbu16zv02l17ufoim6kfjna76k','ODk1M2MxMWRkZjYyZDk4NDU3NGU1MGNhNjJlNGU5ZTkzYTRlMjE5ZDp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0OGZhZjNlZGI4YzVkYzJkYmZiYjZmOWU0MmU3N2E4ZjcyOGVhN2U5In0=','2020-08-06 19:02:41.868200'),('vzz8dsalxoxvedhb47abcpk3n9e8qj5z','MDllZjQ0ZDlhNmJlODU4OWVkODJmNzU1NDY0NDRhNmVjYjUxNzFlMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMDRmOTdlOTA1YTNmOGIxNDc2MTA5NWE1NjlhMDZmYjA2NGRiMzdlIn0=','2020-07-12 17:39:06.689477');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-30 21:06:18
