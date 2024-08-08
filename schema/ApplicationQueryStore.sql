-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: 127.0.0.1    Database: ApplicationQueryStore
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `Feedback`
--

DROP TABLE IF EXISTS `Feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Feedback` (
  `FeedbackId` int NOT NULL AUTO_INCREMENT,
  `Rating` int NOT NULL,
  `Comments` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `QueryId` int NOT NULL,
  PRIMARY KEY (`FeedbackId`),
  KEY `Feedback_Query_QueryId_fk` (`QueryId`),
  CONSTRAINT `Feedback_Query_QueryId_fk` FOREIGN KEY (`QueryId`) REFERENCES `Query` (`QueryId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedback`
--

LOCK TABLES `Feedback` WRITE;
/*!40000 ALTER TABLE `Feedback` DISABLE KEYS */;
INSERT INTO `Feedback` VALUES (2,5,'This answer addressed my question',39),(3,4,'Answered my question',63);
/*!40000 ALTER TABLE `Feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Query`
--

DROP TABLE IF EXISTS `Query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Query` (
  `QueryId` int NOT NULL AUTO_INCREMENT,
  `QueryText` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`QueryId`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Query`
--

LOCK TABLES `Query` WRITE;
/*!40000 ALTER TABLE `Query` DISABLE KEYS */;
INSERT INTO `Query` VALUES (38,'How can I get a student Visa?'),(39,'How can I get a student Visa?'),(40,'How much does a family visa cost?'),(41,'How much does a family visa cost?'),(42,'How much does a family visa cost?'),(43,'What os a family visa?'),(44,'How can I get a family visa?'),(45,'How long do family visa\'s last?'),(46,'what long can I keep my family visa?'),(47,'How much is a student visa?'),(48,'What is the total cost of a family visa?'),(49,'What are the requirements for a family visa?'),(50,'Can I apply for asylum'),(51,'Is there a cost for applying for asylum?'),(52,'Does it cost to apply for asylum?'),(53,'how much is asylum'),(54,'What is a student visa'),(55,'How can I get a student visa'),(56,'How long does it take to get a student visa'),(57,'when should I apply for a student visa'),(58,'what is the process for getting a student visa'),(59,'how long can I stay in the country with a student visa'),(60,'can I work with a student visa'),(61,'can I travel with a student visa'),(62,'how can I get a work visa?'),(63,'What is indefinite leave to remain'),(64,'can I apply for asylum'),(65,'is there a cost to apply for asylum'),(66,'how much is asylum'),(67,'what is a family visa'),(68,'how much does a family visa cost'),(69,'What is a student visa'),(70,'What is a studen visa'),(71,'How can I apply for a student Bisa '),(72,'can I travel with a student visa');
/*!40000 ALTER TABLE `Query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Response`
--

DROP TABLE IF EXISTS `Response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Response` (
  `ResponseId` int NOT NULL AUTO_INCREMENT,
  `ResponseText` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `QueryId` int NOT NULL,
  PRIMARY KEY (`ResponseId`),
  KEY `Response_Query_QueryId_fk` (`QueryId`),
  CONSTRAINT `Response_Query_QueryId_fk` FOREIGN KEY (`QueryId`) REFERENCES `Query` (`QueryId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Response`
--

LOCK TABLES `Response` WRITE;
/*!40000 ALTER TABLE `Response` DISABLE KEYS */;
INSERT INTO `Response` VALUES (24,'To get a Tier 4 student visa, students must first receive a Confirmation of Acceptance for Studies (CAS) from their chosen educational institution. They must then complete an online application form, provide biometric information, submit financial proof (showing they can support themselves and pay for their course), and demonstrate English language proficiency. Applicants will also need to provide a valid passport and possibly other supporting documents like academic qualifications.',38),(25,'To get a Tier 4 student visa, students must first receive a Confirmation of Acceptance for Studies (CAS) from their chosen educational institution. They must then complete an online application form, provide biometric information, submit financial proof (showing they can support themselves and pay for their course), and demonstrate English language proficiency. Applicants will also need to provide a valid passport and possibly other supporting documents like academic qualifications.',39),(26,'The cost of a family visa (Spouse or Partner visa) is £1,846 if applying from outside the UK and £1,258 if applying from within the UK. Applicants must also pay the Immigration Health Surcharge, which is £624 per year. Additional costs may include fees for dependents and the priority service fee for faster processing.',42),(27,'A family visa allows non-UK nationals to join their family members in the UK. Common types include the Spouse or Partner visa, which requires the UK sponsor to be a British citizen or have settled status. Applicants must prove their relationship is genuine, meet financial requirements, and demonstrate English language proficiency.',43),(28,'A family visa allows non-UK nationals to join their family members in the UK. Common types include the Spouse or Partner visa, which requires the UK sponsor to be a British citizen or have settled status. Applicants must prove their relationship is genuine, meet financial requirements, and demonstrate English language proficiency.',44),(29,'A family visa allows non-UK nationals to join their family members in the UK. Common types include the Spouse or Partner visa, which requires the UK sponsor to be a British citizen or have settled status. Applicants must prove their relationship is genuine, meet financial requirements, and demonstrate English language proficiency.',45),(30,'A family visa allows non-UK nationals to join their family members in the UK. Common types include the Spouse or Partner visa, which requires the UK sponsor to be a British citizen or have settled status. Applicants must prove their relationship is genuine, meet financial requirements, and demonstrate English language proficiency.',46),(31,'The cost of a UK Tier 4 (General) student visa is £348 if you apply from outside the UK, and £475 to extend or switch to this visa from within the UK. In addition to the visa fee, applicants must also pay the Immigration Health Surcharge, which is £470 per year of study, allowing access to the National Health Service (NHS).',47),(32,'The cost of a family visa (Spouse or Partner visa) is £1,846 if applying from outside the UK and £1,258 if applying from within the UK. Applicants must also pay the Immigration Health Surcharge, which is £624 per year. Additional costs may include fees for dependents and the priority service fee for faster processing.',48),(33,'Family visa holders must live with their UK sponsor, meet financial requirements, and prove their relationship is genuine. They must not access public funds and must register with the police if required. Family visa holders can work or study in the UK. Any change in circumstances, such as separation, must be reported to the Home Office.',49),(34,'Asylum is protection granted to individuals in the UK who have left their home country and fear persecution due to race, religion, nationality, political opinion, or membership in a particular social group. Asylum seekers must apply for asylum at the UK border or once inside the country and provide evidence supporting their claim.',50),(35,'There is no cost to apply for asylum in the UK. Asylum seekers do not need to pay an application fee or the Immigration Health Surcharge. Asylum seekers may receive financial support and accommodation from the UK government while their application is processed, depending on their financial situation.',51),(36,'There is no cost to apply for asylum in the UK. Asylum seekers do not need to pay an application fee or the Immigration Health Surcharge. Asylum seekers may receive financial support and accommodation from the UK government while their application is processed, depending on their financial situation.',52),(37,'There is no cost to apply for asylum in the UK. Asylum seekers do not need to pay an application fee or the Immigration Health Surcharge. Asylum seekers may receive financial support and accommodation from the UK government while their application is processed, depending on their financial situation.',53),(38,'A student visa, specifically the Tier 4 (General) student visa in the UK, allows international students to study at a registered educational institution in the UK. This visa is essential for non-EU/EEA nationals who intend to undertake full-time academic courses. To be eligible, applicants must have an unconditional offer from a licensed Tier 4 sponsor, prove they have enough money to support themselves and pay for their course, and demonstrate adequate English language skills.',54),(39,'To get a Tier 4 student visa, students must first receive a Confirmation of Acceptance for Studies (CAS) from their chosen educational institution. They must then complete an online application form, provide biometric information, submit financial proof (showing they can support themselves and pay for their course), and demonstrate English language proficiency. Applicants will also need to provide a valid passport and possibly other supporting documents like academic qualifications.',55),(40,'To get a Tier 4 student visa, students must first receive a Confirmation of Acceptance for Studies (CAS) from their chosen educational institution. They must then complete an online application form, provide biometric information, submit financial proof (showing they can support themselves and pay for their course), and demonstrate English language proficiency. Applicants will also need to provide a valid passport and possibly other supporting documents like academic qualifications.',56),(41,'The application process for a Tier 4 student visa includes obtaining a CAS from a licensed sponsor, completing the online visa application form, paying the application fee, and the Immigration Health Surcharge. Applicants must submit their biometric information and provide documents such as proof of finances, academic qualifications, and English language proficiency. Some applicants might need to attend an interview or provide additional information.',57),(42,'To get a Tier 4 student visa, students must first receive a Confirmation of Acceptance for Studies (CAS) from their chosen educational institution. They must then complete an online application form, provide biometric information, submit financial proof (showing they can support themselves and pay for their course), and demonstrate English language proficiency. Applicants will also need to provide a valid passport and possibly other supporting documents like academic qualifications.',58),(43,'The length of a Tier 4 student visa typically covers the duration of the course plus a short additional period (usually 4 months for courses longer than 6 months) to allow for graduation and preparation for departure or further studies. If a course extends beyond the original duration, students can apply for a visa extension from within the UK.',59),(44,'The rules for holding a Tier 4 student visa include attending classes regularly, progressing academically, and complying with the work restrictions (generally up to 20 hours per week during term time and full-time during vacations). Visa holders must not access public funds (benefits) and must register with the police if required. The visa is also tied to the institution, so changing the course or institution requires formal notification and approval from the Home Office.',60),(45,'Students with a Tier 4 visa can travel in and out of the UK during their studies, but they must ensure their visa and passport are valid for re-entry. It\'s advisable to carry documents proving their student status and course enrollment. There are no specific travel restrictions, but prolonged absences might affect their studies and visa compliance',61),(46,'A work visa allows non-UK nationals to work in the UK. The Tier 2 (General) visa is the most common type of work visa, which requires a job offer from a licensed UK employer and a certificate of sponsorship. The job must meet certain skill and salary requirements, and the applicant must demonstrate English language proficiency and sufficient funds to support themselves.',62),(47,'Indefinite Leave to Remain (ILR) allows non-UK nationals to live, work, and study in the UK without any time restrictions. To be eligible, applicants must have lived in the UK for a certain period (usually five years) on a qualifying visa, meet the residency requirements, pass the Life in the UK Test, and prove English language proficiency.',63),(48,'Asylum is protection granted to individuals in the UK who have left their home country and fear persecution due to race, religion, nationality, political opinion, or membership in a particular social group. Asylum seekers must apply for asylum at the UK border or once inside the country and provide evidence supporting their claim.',64),(49,'There is no cost to apply for asylum in the UK. Asylum seekers do not need to pay an application fee or the Immigration Health Surcharge. Asylum seekers may receive financial support and accommodation from the UK government while their application is processed, depending on their financial situation.',65),(50,'There is no cost to apply for asylum in the UK. Asylum seekers do not need to pay an application fee or the Immigration Health Surcharge. Asylum seekers may receive financial support and accommodation from the UK government while their application is processed, depending on their financial situation.',66),(51,'A family visa allows non-UK nationals to join their family members in the UK. Common types include the Spouse or Partner visa, which requires the UK sponsor to be a British citizen or have settled status. Applicants must prove their relationship is genuine, meet financial requirements, and demonstrate English language proficiency.',67),(52,'The cost of a family visa (Spouse or Partner visa) is £1,846 if applying from outside the UK and £1,258 if applying from within the UK. Applicants must also pay the Immigration Health Surcharge, which is £624 per year. Additional costs may include fees for dependents and the priority service fee for faster processing.',68),(53,'A student visa, specifically the Tier 4 (General) student visa in the UK, allows international students to study at a registered educational institution in the UK. This visa is essential for non-EU/EEA nationals who intend to undertake full-time academic courses. To be eligible, applicants must have an unconditional offer from a licensed Tier 4 sponsor, prove they have enough money to support themselves and pay for their course, and demonstrate adequate English language skills.',69),(54,'A student visa, specifically the Tier 4 (General) student visa in the UK, allows international students to study at a registered educational institution in the UK. This visa is essential for non-EU/EEA nationals who intend to undertake full-time academic courses. To be eligible, applicants must have an unconditional offer from a licensed Tier 4 sponsor, prove they have enough money to support themselves and pay for their course, and demonstrate adequate English language skills.',70),(55,'To get a Tier 4 student visa, students must first receive a Confirmation of Acceptance for Studies (CAS) from their chosen educational institution. They must then complete an online application form, provide biometric information, submit financial proof (showing they can support themselves and pay for their course), and demonstrate English language proficiency. Applicants will also need to provide a valid passport and possibly other supporting documents like academic qualifications.',71),(56,'Students with a Tier 4 visa can travel in and out of the UK during their studies, but they must ensure their visa and passport are valid for re-entry. It\'s advisable to carry documents proving their student status and course enrollment. There are no specific travel restrictions, but prolonged absences might affect their studies and visa compliance',72);
/*!40000 ALTER TABLE `Response` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-08 20:50:38
