/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - ambulance_django
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ambulance_django` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `ambulance_django`;

/*Table structure for table `ambulance_app_amb_location` */

DROP TABLE IF EXISTS `ambulance_app_amb_location`;

CREATE TABLE `ambulance_app_amb_location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `datetime` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `ambulance_id` bigint(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ambulance_app_amb_lo_ambulance_id_a3404c43_fk_ambulance` (`ambulance_id`),
  CONSTRAINT `ambulance_app_amb_lo_ambulance_id_a3404c43_fk_ambulance` FOREIGN KEY (`ambulance_id`) REFERENCES `ambulance_app_ambulance` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambulance_app_amb_location` */

insert  into `ambulance_app_amb_location`(`id`,`datetime`,`place`,`latitude`,`longitude`,`ambulance_id`,`status`) values 
(1,'','kottayam','9.983812927740523','76.2729263305664',1,'active');

/*Table structure for table `ambulance_app_ambulance` */

DROP TABLE IF EXISTS `ambulance_app_ambulance`;

CREATE TABLE `ambulance_app_ambulance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vehicle_number` varchar(100) NOT NULL,
  `model_number` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `capacity` varchar(100) NOT NULL,
  `cardiac_monitor` varchar(100) NOT NULL,
  `defibrillator` varchar(100) NOT NULL,
  `oxygen` varchar(100) NOT NULL,
  `facilities` varchar(100) NOT NULL,
  `driver_name` varchar(100) NOT NULL,
  `login_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ambulance_app_ambula_login_id_8f8c245a_fk_ambulance` (`login_id`),
  CONSTRAINT `ambulance_app_ambula_login_id_8f8c245a_fk_ambulance` FOREIGN KEY (`login_id`) REFERENCES `ambulance_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambulance_app_ambulance` */

insert  into `ambulance_app_ambulance`(`id`,`vehicle_number`,`model_number`,`type`,`capacity`,`cardiac_monitor`,`defibrillator`,`oxygen`,`facilities`,`driver_name`,`login_id`) values 
(1,'KL05AS7777','123','A Level','2','Yes','Yes','Yes','ghgag','akash',3);

/*Table structure for table `ambulance_app_emergency_information` */

DROP TABLE IF EXISTS `ambulance_app_emergency_information`;

CREATE TABLE `ambulance_app_emergency_information` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `info` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `ambulance_id` bigint(20) NOT NULL,
  `hospital_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ambulance_app_emerge_ambulance_id_925a21fa_fk_ambulance` (`ambulance_id`),
  KEY `ambulance_app_emerge_hospital_id_ad407646_fk_ambulance` (`hospital_id`),
  CONSTRAINT `ambulance_app_emerge_ambulance_id_925a21fa_fk_ambulance` FOREIGN KEY (`ambulance_id`) REFERENCES `ambulance_app_ambulance` (`id`),
  CONSTRAINT `ambulance_app_emerge_hospital_id_ad407646_fk_ambulance` FOREIGN KEY (`hospital_id`) REFERENCES `ambulance_app_hospital` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambulance_app_emergency_information` */

/*Table structure for table `ambulance_app_emergency_request` */

DROP TABLE IF EXISTS `ambulance_app_emergency_request`;

CREATE TABLE `ambulance_app_emergency_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `datetime` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `ambulance_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ambulance_app_emerge_ambulance_id_e3b87779_fk_ambulance` (`ambulance_id`),
  KEY `ambulance_app_emerge_user_id_d2fa8cff_fk_ambulance` (`user_id`),
  CONSTRAINT `ambulance_app_emerge_ambulance_id_e3b87779_fk_ambulance` FOREIGN KEY (`ambulance_id`) REFERENCES `ambulance_app_ambulance` (`id`),
  CONSTRAINT `ambulance_app_emerge_user_id_d2fa8cff_fk_ambulance` FOREIGN KEY (`user_id`) REFERENCES `ambulance_app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambulance_app_emergency_request` */

insert  into `ambulance_app_emergency_request`(`id`,`description`,`datetime`,`status`,`ambulance_id`,`user_id`) values 
(1,'gdgdd','2024-04-04 13:18:44.144938','',1,1);

/*Table structure for table `ambulance_app_feedback` */

DROP TABLE IF EXISTS `ambulance_app_feedback`;

CREATE TABLE `ambulance_app_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `feedback` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ambulance_app_feedback_user_id_ece63cb0_fk_ambulance_app_user_id` (`user_id`),
  CONSTRAINT `ambulance_app_feedback_user_id_ece63cb0_fk_ambulance_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `ambulance_app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambulance_app_feedback` */

insert  into `ambulance_app_feedback`(`id`,`date`,`feedback`,`user_id`) values 
(1,'2024-04-04','vh',1);

/*Table structure for table `ambulance_app_hospital` */

DROP TABLE IF EXISTS `ambulance_app_hospital`;

CREATE TABLE `ambulance_app_hospital` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `login_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ambulance_app_hospit_login_id_85b0cba3_fk_ambulance` (`login_id`),
  CONSTRAINT `ambulance_app_hospit_login_id_85b0cba3_fk_ambulance` FOREIGN KEY (`login_id`) REFERENCES `ambulance_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambulance_app_hospital` */

insert  into `ambulance_app_hospital`(`id`,`name`,`place`,`post`,`pin`,`city`,`district`,`photo`,`phone`,`email`,`login_id`) values 
(1,'as group of hospitals','kottayam','kottayam','686501','kottayam','kottayam','static/IMG_20240306_235246_778.jpg','9866262662','akhilsanthosh.as7@gmail.com',2);

/*Table structure for table `ambulance_app_login` */

DROP TABLE IF EXISTS `ambulance_app_login`;

CREATE TABLE `ambulance_app_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambulance_app_login` */

insert  into `ambulance_app_login`(`id`,`username`,`password`,`usertype`) values 
(1,'admin','admin','admin'),
(2,'akhilsanthosh.as7@gmail.com','akhil','hospital'),
(3,'akash','akash','ambulance'),
(4,'jithusmusic@gmail.com','jithu','user');

/*Table structure for table `ambulance_app_message` */

DROP TABLE IF EXISTS `ambulance_app_message`;

CREATE TABLE `ambulance_app_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `ambulance_id` bigint(20) NOT NULL,
  `hospital_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ambulance_app_messag_ambulance_id_32c4b769_fk_ambulance` (`ambulance_id`),
  KEY `ambulance_app_messag_hospital_id_e057dfdd_fk_ambulance` (`hospital_id`),
  CONSTRAINT `ambulance_app_messag_ambulance_id_32c4b769_fk_ambulance` FOREIGN KEY (`ambulance_id`) REFERENCES `ambulance_app_ambulance` (`id`),
  CONSTRAINT `ambulance_app_messag_hospital_id_e057dfdd_fk_ambulance` FOREIGN KEY (`hospital_id`) REFERENCES `ambulance_app_hospital` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambulance_app_message` */

/*Table structure for table `ambulance_app_patient_data` */

DROP TABLE IF EXISTS `ambulance_app_patient_data`;

CREATE TABLE `ambulance_app_patient_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `pulse` varchar(100) NOT NULL,
  `sugar` varchar(100) NOT NULL,
  `blood_pressure` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `ambulance_id` bigint(20) NOT NULL,
  `hospital_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ambulance_app_patien_ambulance_id_69bda43d_fk_ambulance` (`ambulance_id`),
  KEY `ambulance_app_patien_hospital_id_677e4015_fk_ambulance` (`hospital_id`),
  CONSTRAINT `ambulance_app_patien_ambulance_id_69bda43d_fk_ambulance` FOREIGN KEY (`ambulance_id`) REFERENCES `ambulance_app_ambulance` (`id`),
  CONSTRAINT `ambulance_app_patien_hospital_id_677e4015_fk_ambulance` FOREIGN KEY (`hospital_id`) REFERENCES `ambulance_app_hospital` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambulance_app_patient_data` */

insert  into `ambulance_app_patient_data`(`id`,`name`,`gender`,`pulse`,`sugar`,`blood_pressure`,`description`,`ambulance_id`,`hospital_id`) values 
(1,'asdef','male','120','22','344','afff',1,1);

/*Table structure for table `ambulance_app_user` */

DROP TABLE IF EXISTS `ambulance_app_user`;

CREATE TABLE `ambulance_app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `hname` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `health_condition` varchar(100) NOT NULL,
  `login_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ambulance_app_user_login_id_a5b02fa3_fk_ambulance_app_login_id` (`login_id`),
  CONSTRAINT `ambulance_app_user_login_id_a5b02fa3_fk_ambulance_app_login_id` FOREIGN KEY (`login_id`) REFERENCES `ambulance_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ambulance_app_user` */

insert  into `ambulance_app_user`(`id`,`fname`,`lname`,`email`,`phone`,`pin`,`post`,`hname`,`place`,`health_condition`,`login_id`) values 
(1,'Jithu','S','jithusmusic@gmail.com','686503','686503','agsgbs','M','Kottayam','Fine',4);

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add ambulance',7,'add_ambulance'),
(26,'Can change ambulance',7,'change_ambulance'),
(27,'Can delete ambulance',7,'delete_ambulance'),
(28,'Can view ambulance',7,'view_ambulance'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add patient_data',9,'add_patient_data'),
(34,'Can change patient_data',9,'change_patient_data'),
(35,'Can delete patient_data',9,'delete_patient_data'),
(36,'Can view patient_data',9,'view_patient_data'),
(37,'Can add user',10,'add_user'),
(38,'Can change user',10,'change_user'),
(39,'Can delete user',10,'delete_user'),
(40,'Can view user',10,'view_user'),
(41,'Can add hospital',11,'add_hospital'),
(42,'Can change hospital',11,'change_hospital'),
(43,'Can delete hospital',11,'delete_hospital'),
(44,'Can view hospital',11,'view_hospital'),
(45,'Can add feedback',12,'add_feedback'),
(46,'Can change feedback',12,'change_feedback'),
(47,'Can delete feedback',12,'delete_feedback'),
(48,'Can view feedback',12,'view_feedback'),
(49,'Can add emergency_request',13,'add_emergency_request'),
(50,'Can change emergency_request',13,'change_emergency_request'),
(51,'Can delete emergency_request',13,'delete_emergency_request'),
(52,'Can view emergency_request',13,'view_emergency_request'),
(53,'Can add amb_location',14,'add_amb_location'),
(54,'Can change amb_location',14,'change_amb_location'),
(55,'Can delete amb_location',14,'delete_amb_location'),
(56,'Can view amb_location',14,'view_amb_location'),
(57,'Can add message',15,'add_message'),
(58,'Can change message',15,'change_message'),
(59,'Can delete message',15,'delete_message'),
(60,'Can view message',15,'view_message'),
(61,'Can add emergency_information',16,'add_emergency_information'),
(62,'Can change emergency_information',16,'change_emergency_information'),
(63,'Can delete emergency_information',16,'delete_emergency_information'),
(64,'Can view emergency_information',16,'view_emergency_information');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(7,'ambulance_app','ambulance'),
(14,'ambulance_app','amb_location'),
(16,'ambulance_app','emergency_information'),
(13,'ambulance_app','emergency_request'),
(12,'ambulance_app','feedback'),
(11,'ambulance_app','hospital'),
(8,'ambulance_app','login'),
(15,'ambulance_app','message'),
(9,'ambulance_app','patient_data'),
(10,'ambulance_app','user'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-04-04 07:18:58.679098'),
(2,'auth','0001_initial','2024-04-04 07:18:59.098691'),
(3,'admin','0001_initial','2024-04-04 07:18:59.259162'),
(4,'admin','0002_logentry_remove_auto_add','2024-04-04 07:18:59.274791'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-04-04 07:18:59.291174'),
(6,'ambulance_app','0001_initial','2024-04-04 07:18:59.759215'),
(7,'ambulance_app','0002_amb_location_status','2024-04-04 07:18:59.794932'),
(8,'ambulance_app','0003_auto_20240317_1042','2024-04-04 07:19:00.099472'),
(9,'contenttypes','0002_remove_content_type_name','2024-04-04 07:19:00.178666'),
(10,'auth','0002_alter_permission_name_max_length','2024-04-04 07:19:00.227576'),
(11,'auth','0003_alter_user_email_max_length','2024-04-04 07:19:00.270394'),
(12,'auth','0004_alter_user_username_opts','2024-04-04 07:19:00.295299'),
(13,'auth','0005_alter_user_last_login_null','2024-04-04 07:19:00.357993'),
(14,'auth','0006_require_contenttypes_0002','2024-04-04 07:19:00.371588'),
(15,'auth','0007_alter_validators_add_error_messages','2024-04-04 07:19:00.391303'),
(16,'auth','0008_alter_user_username_max_length','2024-04-04 07:19:00.438380'),
(17,'auth','0009_alter_user_last_name_max_length','2024-04-04 07:19:00.481628'),
(18,'auth','0010_alter_group_name_max_length','2024-04-04 07:19:00.523784'),
(19,'auth','0011_update_proxy_permissions','2024-04-04 07:19:00.563680'),
(20,'auth','0012_alter_user_first_name_max_length','2024-04-04 07:19:00.591718'),
(21,'sessions','0001_initial','2024-04-04 07:19:00.638871');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('f8csw6ywka2wobmn6hv1xvnsvllrnzbf','eyJsaWQiOjIsInV0eXBlIjoiaG9zcGl0YWwiLCJhaWQiOjEsImhpZCI6MX0:1rsIDc:jT9CHg2v8BqxQ_8c1uDsojDn29DsypiS46DPV8xttoM','2024-04-18 08:13:08.558176'),
('wmrxgezljwppebs5pm5e98op3tbr9u97','eyJsaWQiOjIsInV0eXBlIjoiaG9zcGl0YWwiLCJoaWQiOjEsImFpZCI6MX0:1rsHZx:_SrDyMcVosikKT5pKvwiBjprxcyrGuAqFJwyC_qjeJs','2024-04-18 07:32:09.672674');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
