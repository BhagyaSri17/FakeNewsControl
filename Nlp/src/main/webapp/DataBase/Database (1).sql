-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: dsbssn
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `friend_search`
--

DROP TABLE IF EXISTS `friend_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_search` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` text,
  `keyword` text,
  `date` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_search`
--

LOCK TABLES `friend_search` WRITE;
/*!40000 ALTER TABLE `friend_search` DISABLE KEYS */;
INSERT INTO `friend_search` VALUES (33,'Vikram','sathish','21/03/2025   11:56:46'),(34,'Vikram','divya','21/03/2025   11:56:57'),(35,'Sathish','ganesh','21/03/2025   11:58:04'),(36,'Sathish','priya','21/03/2025   11:58:16'),(37,'Ganesh','sai kumar','21/03/2025   11:59:00'),(38,'Ganesh','ramya','21/03/2025   11:59:12'),(39,'Vamsi','ganesh','21/03/2025   11:59:55'),(40,'Vamsi','vikram','21/03/2025   12:00:05'),(41,'sai kumar','ramya','21/03/2025   12:01:50'),(42,'sai kumar','vikram','21/03/2025   12:02:02'),(43,'sai kumar','vikram','21/03/2025   12:03:25'),(44,'Arjun','sai kumar','21/03/2025   12:05:39'),(45,'Arjun','manasa','21/03/2025   12:05:51'),(46,'divya','vamsi','21/03/2025   12:11:00'),(47,'divya','arjun','21/03/2025   12:11:14'),(48,'manasa','sathish','21/03/2025   12:12:18'),(49,'manasa','priya','21/03/2025   12:12:31'),(50,'priya','vamsi','21/03/2025   12:14:56'),(51,'priya','manasa','21/03/2025   12:15:12'),(52,'priya','divya','21/03/2025   12:16:48'),(53,'Ramya','arjun','21/03/2025   12:17:33'),(54,'Ramya','manasa','21/03/2025   12:17:46'),(55,'divya','arjun','21/03/2025   12:18:44'),(56,'divya','vamsi','21/03/2025   12:18:59');
/*!40000 ALTER TABLE `friend_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negative`
--

DROP TABLE IF EXISTS `negative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `negative` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tname` text,
  `totaluser` text,
  `negative` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negative`
--

LOCK TABLES `negative` WRITE;
/*!40000 ALTER TABLE `negative` DISABLE KEYS */;
/*!40000 ALTER TABLE `negative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negative_post_tracker`
--

DROP TABLE IF EXISTS `negative_post_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `negative_post_tracker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `negativeCount` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negative_post_tracker`
--

LOCK TABLES `negative_post_tracker` WRITE;
/*!40000 ALTER TABLE `negative_post_tracker` DISABLE KEYS */;
INSERT INTO `negative_post_tracker` VALUES (3,'Vikram',0),(4,'sathish',0),(5,'manasa',0),(6,'arjun',0),(7,'Vamsi',0),(8,'ramya',0),(9,'priya',1),(10,'ganesh',0),(11,'divya',0),(12,'sai kumar',0);
/*!40000 ALTER TABLE `negative_post_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `user_id` text,
  `message` text,
  `is_read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postive`
--

DROP TABLE IF EXISTS `postive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postive` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tname` text,
  `totaluser` text,
  `postive` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postive`
--

LOCK TABLES `postive` WRITE;
/*!40000 ALTER TABLE `postive` DISABLE KEYS */;
/*!40000 ALTER TABLE `postive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_res`
--

DROP TABLE IF EXISTS `req_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `req_res` (
  `id` int NOT NULL AUTO_INCREMENT,
  `requestfrom` text,
  `requestto` text,
  `status` text,
  `dt` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_res`
--

LOCK TABLES `req_res` WRITE;
/*!40000 ALTER TABLE `req_res` DISABLE KEYS */;
INSERT INTO `req_res` VALUES (9,'Vikram','Sathish','Accepted','21/03/2025   11:56:49'),(10,'Vikram','Divya','Accepted','21/03/2025   11:56:59'),(11,'Sathish','Ganesh','Accepted','21/03/2025   11:58:06'),(12,'Sathish','Priya','Accepted','21/03/2025   11:58:19'),(13,'Ganesh','sai kumar','Accepted','21/03/2025   11:59:03'),(14,'Ganesh','Ramya','Accepted','21/03/2025   11:59:15'),(15,'Vamsi','Ganesh','Accepted','21/03/2025   11:59:58'),(16,'Vamsi','Vikram','Accepted','21/03/2025   12:00:08'),(17,'sai kumar','Ramya','Accepted','21/03/2025   12:01:53'),(18,'sai kumar','Vikram','Accepted','21/03/2025   12:03:27'),(19,'Arjun','sai kumar','Accepted','21/03/2025   12:05:41'),(20,'Arjun','Manasa','Accepted','21/03/2025   12:05:54'),(21,'divya','Vamsi','Accepted','21/03/2025   12:11:05'),(22,'divya','Arjun','Accepted','21/03/2025   12:11:16'),(23,'manasa','Sathish','Accepted','21/03/2025   12:12:20'),(24,'manasa','Priya','Accepted','21/03/2025   12:12:34'),(25,'priya','Vamsi','Accepted','21/03/2025   12:14:58'),(26,'priya','Divya','Accepted','21/03/2025   12:16:50'),(27,'Ramya','Arjun','Accepted','21/03/2025   12:17:35'),(28,'Ramya','Manasa','Accepted','21/03/2025   12:17:47');
/*!40000 ALTER TABLE `req_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retweets`
--

DROP TABLE IF EXISTS `retweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retweets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tname` text,
  `t_user` text,
  `t_comment` text,
  `r_user` text,
  `r_tweet` text,
  `date` text,
  `sentiment` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retweets`
--

LOCK TABLES `retweets` WRITE;
/*!40000 ALTER TABLE `retweets` DISABLE KEYS */;
INSERT INTO `retweets` VALUES (38,'Moon','Manasa','21/03/2025   20:40:26','Arjun','A fellow moon gazer! Nothing beats the serenity of the night sky.','21/03/2025   20:42:27','Neutral'),(39,'Blossoms of Unity','Sathish','21/03/2025   21:25:23','ganesh','\"Feeling disconnected from nature and from each other. Pollution, deforestation, and climate change are destroying our planet and our sense of community. When will we take action? #LostConnections #NatureInCrisis #SustainabilityFail\"','21/03/2025   21:33:52','Negative'),(40,'EarthQuake','Vamsi','21/03/2025   17:22:19','divya','\"The earth may shake, but our spirit remains unshaken. Strength, unity, and hope will guide us through. #TogetherWeStand\"','21/03/2025   22:25:46','Negative'),(41,'Small Steps, Big Impact','Ganesh','22/03/2025   21:33:36','Vamsi','\"Not everyone has the luxury to keep moving forward. Some people are stuck no matter how hard they try.\"','22/03/2025   21:36:02','Negative'),(42,'Innovation for a Better Future','Ganesh','23/03/2025   22:29:27','Vamsi','\"Technology is advancing rapidly, but we must balance innovation with ethics, privacy, and human well-being.\"','23/03/2025   22:50:18','Neutral'),(43,'Medical Breakthroughs Saving Lives','priya','23/03/2025   22:24:44','Manasa','\"While medical advancements are promising, rising costs, ethical concerns, and unequal access still leave millions without proper healthcare.\"','23/03/2025   22:52:22','Negative'),(44,'Gene Therapy  A New Hope','Vikram','23/03/2025   21:48:03','Sathish','Gene therapy is a groundbreaking advancement, but ensuring affordability, safety, and ethical use is key to making it truly accessible for all.','23/03/2025   22:55:02','Neutral'),(45,'5G is Changing the Game','Ramya','23/03/2025   22:19:16','sai kumar','Consider highlighting both the benefits and potential challenges of 5G, such as security and accessibility, to provide a more balanced perspective.','23/03/2025   23:12:30','Neutral'),(47,'Difficult Roads Lead to Beautiful Destinations','Ganesh','23/03/2025   14:20:22','Sathish','Every challenge along the way shapes the journey, making the destination even more meaningful.','23/03/2025   23:21:55','Neutral'),(48,'Friends for Life','priya','24/03/2025   08:45:31','Sathish','\"School friendships are the bonds that last a lifetime, filled with laughter, support, and unforgettable memories!\"','24/03/2025   08:56:04','Neutral'),(49,'AI   Healthcare  A Healthier Tomorrow','Vikram','23/03/2025   22:15:03','Sathish','AI in healthcare is revolutionizing patient care, making treatments faster, smarter, and more accessible for a healthier future!','24/03/2025   08:57:28','Neutral'),(50,'Exams Stress','Sathish','24/03/2025   08:55:06','priya','Exams are just a part of the journey. Your effort matters more than the result!','24/03/2025   11:06:40','Neutral'),(51,'Team Spirit','Vamsi','24/03/2025   08:49:00','priya','Team sprit helps to complete work fastly.','24/03/2025   11:09:30','Neutral'),(52,'Learning is Fun','Sathish','24/03/2025   08:42:34','Ganesh','Every day at school is a new adventure in learning!','24/03/2025   12:10:36','Neutral'),(55,' Happiness is in the Little Things','Sathish','24/03/2025   16:51:12','Vikram','True happiness lies in appreciating life\'s small, beautiful moments','24/03/2025   16:55:03','Positive'),(56,'Your Hard Work Pays Off','Vikram','24/03/2025   16:47:19','Sathish','Dedication and persistence always lead to success keep going','24/03/2025   16:56:37','Positive'),(57,'A Fresh Start Every Day','Ramya','24/03/2025   16:44:07','Ganesh','Every sunrise brings new opportunities embrace the fresh start','24/03/2025   16:57:57','Positive');
/*!40000 ALTER TABLE `retweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server`
--

DROP TABLE IF EXISTS `server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server`
--

LOCK TABLES `server` WRITE;
/*!40000 ALTER TABLE `server` DISABLE KEYS */;
INSERT INTO `server` VALUES (2,'server','server');
/*!40000 ALTER TABLE `server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweet_likes`
--

DROP TABLE IF EXISTS `tweet_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tweet_id` int DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `liked_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet_likes`
--

LOCK TABLES `tweet_likes` WRITE;
/*!40000 ALTER TABLE `tweet_likes` DISABLE KEYS */;
INSERT INTO `tweet_likes` VALUES (40,107,'arjun','2025-03-21 11:25:37'),(42,116,'Arjun','2025-03-21 15:12:06'),(43,114,'Manasa','2025-03-21 15:17:03'),(44,117,'ganesh','2025-03-21 16:00:36'),(45,165,'Sathish','2025-03-23 17:54:18'),(46,164,'Sathish','2025-03-23 17:54:21'),(47,161,'Sathish','2025-03-23 17:54:23'),(48,160,'Sathish','2025-03-23 17:54:25'),(49,159,'Sathish','2025-03-23 17:54:29'),(50,158,'Sathish','2025-03-23 17:54:32'),(51,156,'Sathish','2025-03-23 17:54:36'),(52,157,'Sathish','2025-03-23 17:54:40');
/*!40000 ALTER TABLE `tweet_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweet_notifications`
--

DROP TABLE IF EXISTS `tweet_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweet_notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tweet_id` int DEFAULT NULL,
  `from_user` varchar(50) DEFAULT NULL,
  `to_user` varchar(50) DEFAULT NULL,
  `notification_type` varchar(20) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'unread',
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweet_notifications`
--

LOCK TABLES `tweet_notifications` WRITE;
/*!40000 ALTER TABLE `tweet_notifications` DISABLE KEYS */;
INSERT INTO `tweet_notifications` VALUES (38,107,'arjun','manasa','like','arjun liked your tweet','read','2025-03-21 11:25:37'),(40,116,'Arjun','Manasa','like','Arjun liked your tweet','read','2025-03-21 15:12:06'),(41,114,'Manasa','priya','like','Manasa liked your tweet','unread','2025-03-21 15:17:03'),(42,117,'ganesh','Sathish','like','ganesh liked your tweet','unread','2025-03-21 16:00:36'),(43,165,'Sathish','Ganesh','like','Sathish liked your tweet','unread','2025-03-23 17:54:18'),(44,164,'Sathish','priya','like','Sathish liked your tweet','unread','2025-03-23 17:54:21'),(45,161,'Sathish','Manasa','like','Sathish liked your tweet','unread','2025-03-23 17:54:23'),(46,160,'Sathish','Vikram','like','Sathish liked your tweet','unread','2025-03-23 17:54:25'),(47,159,'Sathish','Vikram','like','Sathish liked your tweet','unread','2025-03-23 17:54:29'),(48,158,'Sathish','Vikram','like','Sathish liked your tweet','unread','2025-03-23 17:54:32'),(49,156,'Sathish','Vikram','like','Sathish liked your tweet','unread','2025-03-23 17:54:36'),(50,157,'Sathish','Vikram','like','Sathish liked your tweet','unread','2025-03-23 17:54:40');
/*!40000 ALTER TABLE `tweet_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tweets`
--

DROP TABLE IF EXISTS `tweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tweets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tweeter` text,
  `tname` text,
  `description` text,
  `date` text,
  `rank` int DEFAULT NULL,
  `is_notified` varchar(5) DEFAULT 'No',
  `tweet_status` varchar(20) DEFAULT 'Posted',
  `sentiment` varchar(10) DEFAULT NULL,
  `image_path` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tweets`
--

LOCK TABLES `tweets` WRITE;
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
INSERT INTO `tweets` VALUES (108,'Vamsi','EarthQuake','\"Just experienced the scariest earthquake of my life! The ground was shaking like crazy and I thought it was the end. My heart is still racing and I\'m shaken to the core. When will it stop?! #earthquake #scary #traumatic.\"','21/03/2025   17:22:19',1,'Yes','Posted','Negative','Gallery/WhatsApp Image 2025-03-21 at 5.14.45 PM.jpeg'),(114,'priya','Whispers of the Mist: A New Beginning','\"Breathe in the beauty of nature. Let the misty mountains remind you that every day is a fresh start. #NatureVibes #PeacefulMind.\"','21/03/2025   17:52:02',0,'Yes','Posted','Neutral','Gallery/WhatsApp Image 2025-03-21 at 5.22.30 PM.jpeg'),(115,'Vikram','Strength in Adversity: Rising Together After the Earthquake','Earthquakes remind us of the awe-inspiring power of nature! Let\'s appreciate the earth\'s resilience and our own capacity to adapt and support each other. Stay safe, stay strong! #earthquake #resilience #nature\"','21/03/2025   17:59:17',0,'Yes','Posted','Neutral','Gallery/WhatsApp Image 2025-03-21 at 5.14.46 PM.jpeg'),(116,'Manasa','Moon','My heart beats to the rhythm of the moon.','21/03/2025   20:40:26',1,'Yes','Posted','Neutral','Gallery/moontweet.webp'),(117,'Sathish','Blossoms of Unity','\"Blossoming Connections! Nature has a way of nurturing our souls & connecting us to the world around us. Let\'s cultivate love, care & respect for our planet & each other! #BlossomingConnections #NatureLover #Sustainability\"','21/03/2025   21:25:23',1,'Yes','Posted','Neutral','Gallery/Blossoms of Unity.jpeg'),(123,'Ganesh','Small Steps, Big Impact','\"Every small effort you make today leads to a brighter tomorrow. Keep moving forward, one step at a time! #GrowthMindset #KeepGoing\"','22/03/2025   21:33:36',1,'Yes','Posted','Neutral','Gallery/Small Steps, Big Impact.webp'),(126,'sai kumar','Lost in Failure','\"Some people rise after failure, but what if I\'m just meant to stay down? Maybe success isn\'t for everyone...  #Failure #LostHope\"','22/03/2025   22:21:11',0,'Yes','Posted','Negative','Gallery/Lost in Failure.webp'),(128,'Arjun','Seasons Out of Sync','Winters are too warm, summers too harsh. Nature is screaming for help, yet we call it an unusual season instead of a crisis. #ClimateChangeIsReal','22/03/2025   22:31:02',0,'Yes','Posted','Negative','Gallery/Seasons Out of Sync.webp'),(130,'Arjun','The Inevitable Flow of Change','\"Change happens whether we embrace it or resist it. Nothing stays the same forever.  #ChangeIsConstant #LifeGoesOn\"','22/03/2025   22:37:21',0,'Yes','Posted','Negative','Gallery/The Inevitable Flow of Change.webp'),(132,'Ramya','Paths of Life','\"Not every journey is the same. Some are simple, some are complicated, but each one takes us somewhere.  #Journey #LifePaths\"','22/03/2025   23:22:17',0,'Yes','Posted','Neutral','Gallery/Paths of Life.webp'),(134,'Arjun','Seasons Out of Sync','Winters are too warm, summers too harsh. Nature is screaming for help, yet we call it an unusual season instead of a crisis. #ClimateChangeIsReal','22/03/2025   23:42:15',0,'Yes','Posted','Negative','Gallery/Seasons Out of Sync.webp'),(135,'Manasa','The Natural Cycle of Change','\"Change brings new opportunities and growth. Just like the seasons, we evolve and adapt with time.  #EmbraceChange #SeasonsOfLife\"','22/03/2025   23:42:35',0,'No','Posted','Neutral','Gallery/The Natural Cycle of Change.webp'),(137,'Ramya','The Unstoppable Flow of Time','Time moves forward without waiting for anyone. ','23/03/2025   11:52:33',0,'Yes','Posted','Negative','Gallery/The Unstoppable Flow of Time.webp'),(138,'Divya','Every Step Counts','\"Small efforts today lead to big changes tomorrow. Keep going!  #GrowthMindset\"','23/03/2025   12:39:01',0,'Yes','Posted','Neutral','Gallery/Every Step Counts.webp'),(140,'divya','New Day, New Possibilities','Description: \"Every sunrise is a reminder that you have another chance to shine. #NewBeginnings\"\r\n','23/03/2025   14:02:54',0,'Yes','Posted','Neutral','Gallery/New Day, New Possibilities.webp'),(141,'Vikram','Believe in Yourself','You are capable of more than you think. Keep believing, keep going!  #StayStrong\"','23/03/2025   14:09:23',0,'No','Posted','Neutral','Gallery/Believe in Yourself.webp'),(142,'Ganesh','Difficult Roads Lead to Beautiful Destinations','\"The journey may be tough, but the view at the top is worth it.#KeepMovingForward\"\r\n','23/03/2025   14:20:22',1,'No','Posted','Positive','Gallery/Difficult Roads Lead to Beautiful Destinations.webp'),(147,'Sathish',' Every Story Has Two Sides','\"Perspectives shape reality. What we see depends on where we stand.#DifferentViews\"','23/03/2025   15:11:48',0,'Yes','Posted','Neutral','Gallery/Every Story Has Two Sides.webp'),(151,'Arjun','Time','\"The clock shows time\"','23/03/2025   19:32:15',0,'No','Posted','Neutral','Gallery/The Unstoppable Flow of Time.webp'),(152,'sai kumar','Agriculture','Farmer do agriculture without thinking about profits.','23/03/2025   19:51:49',0,'Yes','Posted','Neutral','Gallery/The Natural Cycle of Change.webp'),(153,'sai kumar','Lost in the Storm','\"Some days feel like an endless storm with no sign of the sun. #FeelingLost\"','23/03/2025   20:05:05',0,'Yes','Posted','Negative','Gallery/Lost in Failure.webp'),(154,'Sathish','Space Tech Advancements!','New-age technology is taking us beyond Earth! Space missions, satellite advancements, and AI-driven explorations are unlocking the secrets of the universe. #SpaceTech #Innovation','23/03/2025   21:40:00',0,'Yes','Posted','Neutral','Gallery/Space Tech Advancements.jpg'),(155,'Sathish','The Era of Ultra-Fast Connectivity','5G technology is bringing lightning-fast internet speeds, making remote work, gaming, and smart cities more efficient than ever! #5GRevolution #SmartWorld','23/03/2025   21:43:24',0,'Yes','Posted','Neutral','Gallery/The Era of Ultra-Fast Connectivity.jpg'),(156,'Vikram','Gene Therapy  A New Hope','Gene therapy is offering new treatments for genetic disorders, opening doors to a healthier future! #GeneTherapy #MedicalInnovation','23/03/2025   21:48:03',1,'No','Posted','Neutral','Gallery/compressed_dna_lab.jpg'),(157,'Vikram','3D Printing Saving Lives','From prosthetic limbs to organ implants, 3D printing is revolutionizing the medical field and transforming lives! #3DPrinting #FutureOfMedicine','23/03/2025   21:55:58',0,'No','Posted','Negative','Gallery/compressed_prosthetic_hand.jpg'),(158,'Vikram','AI in Healthcare Smarter Diagnoses','Artificial Intelligence is helping doctors detect diseases faster and more accurately! A new era of smart healthcare is here. #AIinMedicine #SmartHealthcare','23/03/2025   22:03:56',0,'No','Posted','Neutral','Gallery/compressed_ai_medical_scans.jpg'),(159,'Vikram','Innovation for a Better Future','Technology is evolving rapidly, making life smarter and easier! From AI to automation, the future is full of possibilities. #TechForGood #Innovation','23/03/2025   22:10:31',1,'No','Posted','Positive','Gallery/Space Tech Advancements.jpg'),(160,'Vikram','AI + Healthcare  A Healthier Tomorrow','AI is transforming the medical field with faster diagnoses and personalized treatments. A smarter, healthier future awaits! #AIinMedicine #SmartHealthcare','23/03/2025   22:15:03',0,'No','Posted','Neutral','Gallery/AI + Healthcare  A Healthier Tomorrow.jfif'),(161,'Manasa','Space Exploration Reaching New Heights',' From Mars missions to space tourism, humanity is reaching for the stars! The dream of interplanetary travel is closer than ever. #SpaceTech #FutureOfSpace','23/03/2025   22:16:40',0,'No','Posted','Negative','Gallery/Space Tech Advancements.jpg'),(162,'Ramya','5G is Changing the Game','Lightning-fast internet, smart cities, and real-time connectivity 5G is revolutionizing the way we live and work! The future is here. #5GRevolution #SmartLiving','23/03/2025   22:19:16',1,'No','Posted','Neutral','Gallery/5G is Changing the Game.jfif'),(164,'priya','Medical Breakthroughs Saving Lives','Every day, new advancements in medicine bring hope to millions. 3D-printed organs, AI in diagnostics, and gene therapy are transforming healthcare! #MedicalInnovation #HealthcareForAll','23/03/2025   22:24:44',1,'No','Posted','Neutral','Gallery/Medical Breakthroughs Saving Lives.jfif'),(165,'Ganesh','Innovation for a Better Future','Technology is evolving rapidly, making life smarter and easier! From AI to automation, the future is full of possibilities. #TechForGood #Innovation','23/03/2025   22:29:27',1,'No','Posted','Positive','Gallery/Innovation for a Better Future.jfif'),(166,'sai kumar','The Other Side of Progress','\"As technology and medicine advance, we must also address challenges like ethics, accessibility, and unintended consequences to ensure progress benefits everyone.\"','23/03/2025   23:02:08',0,'Yes','Posted','Neutral','Gallery/The Other Side of Progress.jfif'),(167,'Sathish','Learning is Fun','\"Every day at school is a new adventure in learning!\"','24/03/2025   08:42:34',1,'Yes','Posted','Positive','Gallery/compressed_classroom_image.jpg'),(168,'priya','Friends for Life','\"School is a place where learning and lifelong friendships grow!\"\r\n\r\n\r\n\r\n\r\n\r\n\r\n','24/03/2025   08:45:31',1,'No','Posted','Negative','Gallery/compressed_playground_image.jpg'),(169,'Vamsi','Team Spirit','\"School inspires teamwork and perseverance, helping us grow with every challenge!\"','24/03/2025   08:49:00',1,'Yes','Posted','Neutral','Gallery/compressed_sports_image.jpg'),(170,'Sathish','Exams Stress','\"Sometimes, school feels like a never-ending cycle of exams and stress!\"','24/03/2025   08:55:06',1,'Yes','Posted','Negative','Gallery/compressed_stress_image.jpg'),(171,'priya','Smartphones  Connecting the World','\"From staying in touch to learning new things, mobile phones make life smarter and easier every day!\" ','24/03/2025   09:11:17',0,'No','Posted','Neutral','Gallery/Smartphones  Connecting the World.webp'),(172,'Ganesh','Rise and Shine',' A new day, a new opportunity to shine bright','24/03/2025   16:07:46',0,'No','Posted','Positive','Gallery/compressed_sunrise.png'),(173,'Vikram','Kindness Wins','A small act of kindness can change someone\'s day','24/03/2025   16:11:10',0,'No','Posted','Positive','Gallery/compressed_shaking_hands.png'),(174,'sai kumar','Success is Yours','Hard work and persistence always lead to success','24/03/2025   16:14:10',0,'Yes','Posted','Positive','Gallery/compressed_trophy.png'),(175,'Vamsi','Stay Happy, Stay Healthy','A positive mind and a healthy body make life beautiful','24/03/2025   16:17:52',0,'Yes','Posted','Positive','Gallery/compressed_apple.png'),(176,'Sathish',' Dream Big','Your dreams are valid go chase them with confidence.','24/03/2025   16:22:09',0,'Yes','Posted','Neutral','Gallery/compressed_rocket.png'),(177,'Sathish','Believe in Yourself','You are capable of amazing things believe it, achieve it','24/03/2025   16:26:50',0,'Yes','Posted','Positive','Gallery/compressed_star.png'),(178,'Manasa','Happiness is Contagious','Share your smile, and the world will smile with you','24/03/2025   16:31:04',0,'No','Posted','Positive','Gallery/compressed_smile.png'),(181,'priya','Dream, Dare, Do','The sky is not the limit it\'s just the beginning','24/03/2025   16:39:02',0,'No','Posted','Negative','Gallery/compressed_sunrise.png'),(183,'Ramya','A Fresh Start Every Day',' Each sunrise brings new hope and endless possibilities','24/03/2025   16:44:07',1,'No','Posted','Positive','Gallery/compressed_sunrise.png'),(184,'divya','Health is Wealth','A healthy body and mind pave the way for a joyful life','24/03/2025   16:45:37',0,'Yes','Posted','Positive','Gallery/compressed_apple.png'),(185,'Vikram','Your Hard Work Pays Off','Stay focused, stay determined success is just around the corner','24/03/2025   16:47:19',1,'No','Posted','Positive','Gallery/compressed_trophy.png'),(186,'Sathish',' Happiness is in the Little Things','Enjoy the small joys in life, and happiness will follow','24/03/2025   16:51:12',1,'Yes','Posted','Positive','Gallery/compressed_sunflower.png');
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  `mobile` text NOT NULL,
  `dob` text,
  `gender` text,
  `address` text,
  `pincode` text,
  `network` text,
  `status` text,
  `image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10,'Vikram','1234','vikram@gmail.com','9867563455','2005-03-03','MALE','Tanuku','534211','TWITTER','Authorized','Gallery/images (1).png'),(11,'Sathish','1234','sathish@gmail.com','9804567232','2003-06-12','MALE','Rajamundry','543266','TWITTER','Authorized','Gallery/images (6).jpg'),(12,'Ganesh','1234','ganesh@gmail.com','8765453288','2003-10-11','MALE','Tadepalligudem','532441','TWITTER','Authorized','Gallery/profile 1.png'),(13,'Vamsi','1234','vamsi@gmail.com','9878657532','2004-09-27','MALE','Vijayawada','543265','FACEBOOK','Authorized','Gallery/profile 1.png'),(14,'sai kumar','1234','saikumar@gmail.com','9865342311','2004-03-28','MALE','Tanuku','534211','FACEBOOK','Authorized','Gallery/images (9).jpg'),(15,'Arjun','1234','arjun@gmail.com','9765883422','2001-08-29','MALE','Kakinada','543255','FACEBOOK','Authorized','Gallery/images (6).jpg'),(16,'Manasa','1234','manasa@gmail.com','9492774586','2004-05-23','FEMALE','Nallajerla','543277','TWITTER','Authorized','Gallery/Business Women.png'),(17,'Priya','1234','priya@gmail.com','9014666566','2002-08-26','FEMALE','Kakinada','543244','TWITTER','Authorized','Gallery/profile2.jpg'),(18,'Ramya','1234','ramya@gmail.com','9959017544','2004-09-30','FEMALE','Tadepalligudem','534232','FACEBOOK','Authorized','Gallery/profile3.webp'),(19,'Divya','1234','divya@gmail.com','6304453422','2003-02-20','FEMALE','Vijayawada','532411','FACEBOOK','Authorized','Gallery/profile4.png');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-24 21:13:07
