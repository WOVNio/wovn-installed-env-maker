-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: mt
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Table structure for table `mt_accesstoken`
--

DROP TABLE IF EXISTS `mt_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_accesstoken` (
  `accesstoken_id` varchar(80) NOT NULL,
  `accesstoken_session_id` varchar(80) NOT NULL,
  `accesstoken_start` int(11) NOT NULL,
  PRIMARY KEY (`accesstoken_id`),
  KEY `mt_accesstoken_session_id` (`accesstoken_session_id`),
  KEY `mt_accesstoken_start` (`accesstoken_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_accesstoken`
--

LOCK TABLES `mt_accesstoken` WRITE;
/*!40000 ALTER TABLE `mt_accesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_asset`
--

DROP TABLE IF EXISTS `mt_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_asset` (
  `asset_id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_blog_id` int(11) NOT NULL,
  `asset_class` varchar(255) DEFAULT 'file',
  `asset_created_by` int(11) DEFAULT NULL,
  `asset_created_on` datetime DEFAULT NULL,
  `asset_description` mediumtext,
  `asset_file_ext` varchar(20) DEFAULT NULL,
  `asset_file_name` varchar(255) DEFAULT NULL,
  `asset_file_path` varchar(255) DEFAULT NULL,
  `asset_label` varchar(255) DEFAULT NULL,
  `asset_mime_type` varchar(255) DEFAULT NULL,
  `asset_modified_by` int(11) DEFAULT NULL,
  `asset_modified_on` datetime DEFAULT NULL,
  `asset_parent` int(11) DEFAULT NULL,
  `asset_url` mediumtext,
  PRIMARY KEY (`asset_id`),
  KEY `mt_asset_class` (`asset_class`),
  KEY `mt_asset_label` (`asset_label`),
  KEY `mt_asset_parent` (`asset_parent`),
  KEY `mt_asset_file_ext` (`asset_file_ext`),
  KEY `mt_asset_created_by` (`asset_created_by`),
  KEY `mt_asset_created_on` (`asset_created_on`),
  KEY `mt_asset_blog_class_date` (`asset_blog_id`,`asset_class`,`asset_created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_asset`
--

LOCK TABLES `mt_asset` WRITE;
/*!40000 ALTER TABLE `mt_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_asset_meta`
--

DROP TABLE IF EXISTS `mt_asset_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_asset_meta` (
  `asset_meta_asset_id` int(11) NOT NULL,
  `asset_meta_type` varchar(75) NOT NULL,
  `asset_meta_vchar` varchar(255) DEFAULT NULL,
  `asset_meta_vchar_idx` varchar(255) DEFAULT NULL,
  `asset_meta_vdatetime` datetime DEFAULT NULL,
  `asset_meta_vdatetime_idx` datetime DEFAULT NULL,
  `asset_meta_vinteger` int(11) DEFAULT NULL,
  `asset_meta_vinteger_idx` int(11) DEFAULT NULL,
  `asset_meta_vfloat` float DEFAULT NULL,
  `asset_meta_vfloat_idx` float DEFAULT NULL,
  `asset_meta_vblob` mediumblob,
  `asset_meta_vclob` mediumtext,
  PRIMARY KEY (`asset_meta_asset_id`,`asset_meta_type`),
  KEY `mt_asset_meta_type_vint` (`asset_meta_type`,`asset_meta_vinteger_idx`),
  KEY `mt_asset_meta_type_vflt` (`asset_meta_type`,`asset_meta_vfloat_idx`),
  KEY `mt_asset_meta_type_vdt` (`asset_meta_type`,`asset_meta_vdatetime_idx`),
  KEY `mt_asset_meta_type_vchar` (`asset_meta_type`,`asset_meta_vchar_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_asset_meta`
--

LOCK TABLES `mt_asset_meta` WRITE;
/*!40000 ALTER TABLE `mt_asset_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_asset_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_association`
--

DROP TABLE IF EXISTS `mt_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_association` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `association_author_id` int(11) DEFAULT '0',
  `association_blog_id` int(11) DEFAULT '0',
  `association_created_by` int(11) DEFAULT NULL,
  `association_created_on` datetime DEFAULT NULL,
  `association_group_id` int(11) DEFAULT '0',
  `association_modified_by` int(11) DEFAULT NULL,
  `association_modified_on` datetime DEFAULT NULL,
  `association_role_id` int(11) DEFAULT '0',
  `association_type` int(11) NOT NULL,
  PRIMARY KEY (`association_id`),
  KEY `mt_association_blog_id` (`association_blog_id`),
  KEY `mt_association_author_id` (`association_author_id`),
  KEY `mt_association_type` (`association_type`),
  KEY `mt_association_role_id` (`association_role_id`),
  KEY `mt_association_created_on` (`association_created_on`),
  KEY `mt_association_group_id` (`association_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_association`
--

LOCK TABLES `mt_association` WRITE;
/*!40000 ALTER TABLE `mt_association` DISABLE KEYS */;
INSERT INTO `mt_association` VALUES (1,1,1,1,'2020-11-24 14:21:00',0,NULL,'2020-11-24 14:21:00',1,1);
/*!40000 ALTER TABLE `mt_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_author`
--

DROP TABLE IF EXISTS `mt_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `author_api_password` varchar(60) DEFAULT NULL,
  `author_auth_type` varchar(50) DEFAULT NULL,
  `author_basename` varchar(255) DEFAULT NULL,
  `author_can_create_blog` tinyint(4) DEFAULT NULL,
  `author_can_view_log` tinyint(4) DEFAULT NULL,
  `author_created_by` int(11) DEFAULT NULL,
  `author_created_on` datetime DEFAULT NULL,
  `author_date_format` varchar(30) DEFAULT 'relative',
  `author_email` varchar(127) DEFAULT NULL,
  `author_entry_prefs` varchar(255) DEFAULT NULL,
  `author_external_id` varchar(255) DEFAULT NULL,
  `author_hint` varchar(75) DEFAULT NULL,
  `author_is_superuser` tinyint(4) DEFAULT NULL,
  `author_locked_out_time` int(11) NOT NULL DEFAULT '0',
  `author_modified_by` int(11) DEFAULT NULL,
  `author_modified_on` datetime DEFAULT NULL,
  `author_name` varchar(255) NOT NULL,
  `author_nickname` varchar(255) DEFAULT NULL,
  `author_password` varchar(124) NOT NULL,
  `author_preferred_language` varchar(50) DEFAULT NULL,
  `author_public_key` mediumtext,
  `author_remote_auth_token` varchar(50) DEFAULT NULL,
  `author_remote_auth_username` varchar(50) DEFAULT NULL,
  `author_status` int(11) DEFAULT '1',
  `author_text_format` varchar(30) DEFAULT NULL,
  `author_type` smallint(6) NOT NULL DEFAULT '1',
  `author_url` varchar(255) DEFAULT NULL,
  `author_userpic_asset_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `mt_author_status` (`author_status`),
  KEY `mt_author_external_id` (`author_external_id`),
  KEY `mt_author_email` (`author_email`),
  KEY `mt_author_name` (`author_name`),
  KEY `mt_author_created_on` (`author_created_on`),
  KEY `mt_author_basename` (`author_basename`),
  KEY `mt_author_auth_type_name` (`author_auth_type`,`author_name`,`author_type`),
  KEY `mt_author_type` (`author_type`),
  KEY `mt_author_locked_out_time` (`author_locked_out_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_author`
--

LOCK TABLES `mt_author` WRITE;
/*!40000 ALTER TABLE `mt_author` DISABLE KEYS */;
INSERT INTO `mt_author` VALUES (1,'g2w47ib2','MT','admin',NULL,NULL,1,'2020-11-24 14:20:59','relative','iwai@wovn.io',NULL,'',NULL,NULL,0,NULL,'2020-11-24 14:20:59','admin','admin','$6$DdfYhDTXkQXiqSAL$fm6fiV1BxOEjHSeFU2J7ntwBQ2ADfjj0183Vr93owA97m51IatmoMwHKJMHWnnfJfQjewe+YblmrbkAAsFzawQ','ja',NULL,NULL,NULL,1,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `mt_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_author_meta`
--

DROP TABLE IF EXISTS `mt_author_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_author_meta` (
  `author_meta_author_id` int(11) NOT NULL,
  `author_meta_type` varchar(75) NOT NULL,
  `author_meta_vchar` varchar(255) DEFAULT NULL,
  `author_meta_vchar_idx` varchar(255) DEFAULT NULL,
  `author_meta_vdatetime` datetime DEFAULT NULL,
  `author_meta_vdatetime_idx` datetime DEFAULT NULL,
  `author_meta_vinteger` int(11) DEFAULT NULL,
  `author_meta_vinteger_idx` int(11) DEFAULT NULL,
  `author_meta_vfloat` float DEFAULT NULL,
  `author_meta_vfloat_idx` float DEFAULT NULL,
  `author_meta_vblob` mediumblob,
  `author_meta_vclob` mediumtext,
  PRIMARY KEY (`author_meta_author_id`,`author_meta_type`),
  KEY `mt_author_meta_type_vint` (`author_meta_type`,`author_meta_vinteger_idx`),
  KEY `mt_author_meta_type_vflt` (`author_meta_type`,`author_meta_vfloat_idx`),
  KEY `mt_author_meta_type_vdt` (`author_meta_type`,`author_meta_vdatetime_idx`),
  KEY `mt_author_meta_type_vchar` (`author_meta_type`,`author_meta_vchar_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_author_meta`
--

LOCK TABLES `mt_author_meta` WRITE;
/*!40000 ALTER TABLE `mt_author_meta` DISABLE KEYS */;
INSERT INTO `mt_author_meta` VALUES (1,'favorite_websites',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary 'BIN:SERG\0\0\0\0\0\0\0A\0\0\0-\0\0\01',NULL),(1,'widgets',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,_binary 'BIN:SERG\0\0\0\0\0\0\0H\0\0\0\0\0\0dashboard:user:1H\0\0\0\0\0\0personal_statsH\0\0\0\0\0\0order-\0\0\0400\0\0\0set-\0\0\0sidebar\0\0\0mt_newsH\0\0\0\0\0\0order-\0\0\0500\0\0\0set-\0\0\0sidebar\0\0\0notification_dashboardH\0\0\0\0\0\0set-\0\0\0main\0\0\0order-\0\0\0100\0\0\0\nsite_statsH\0\0\0\0\0\0set-\0\0\0main\0\0\0order-\0\0\0200\0\0\0favorite_blogsH\0\0\0\0\0\0paramH\0\0\0\0\0\0tab-\0\0\0website\0\0\0set-\0\0\0main\0\0\0order-\0\0\0300\0\0\0dashboard:blog:1H\0\0\0\0\0\0\nsite_statsH\0\0\0\0\0\0order-\0\0\0100\0\0\0set-\0\0\0main\0\0\0recent_blogsH\0\0\0\0\0\0order-\0\0\0200\0\0\0set-\0\0\0main',NULL);
/*!40000 ALTER TABLE `mt_author_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_author_summary`
--

DROP TABLE IF EXISTS `mt_author_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_author_summary` (
  `author_summary_author_id` int(11) NOT NULL,
  `author_summary_type` varchar(75) NOT NULL,
  `author_summary_class` varchar(75) NOT NULL,
  `author_summary_vchar_idx` varchar(255) DEFAULT NULL,
  `author_summary_vinteger_idx` int(11) DEFAULT NULL,
  `author_summary_vblob` mediumblob,
  `author_summary_vclob` mediumtext,
  `author_summary_expired` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`author_summary_author_id`,`author_summary_type`),
  KEY `mt_author_summary_class_vint` (`author_summary_class`,`author_summary_vinteger_idx`),
  KEY `mt_author_summary_class_vchar` (`author_summary_class`,`author_summary_vchar_idx`),
  KEY `mt_author_summary_id_class` (`author_summary_author_id`,`author_summary_class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_author_summary`
--

LOCK TABLES `mt_author_summary` WRITE;
/*!40000 ALTER TABLE `mt_author_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_author_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_blog`
--

DROP TABLE IF EXISTS `mt_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_allow_anon_comments` tinyint(4) DEFAULT NULL,
  `blog_allow_comment_html` tinyint(4) DEFAULT NULL,
  `blog_allow_commenter_regist` tinyint(4) DEFAULT NULL,
  `blog_allow_comments_default` tinyint(4) DEFAULT NULL,
  `blog_allow_pings` tinyint(4) DEFAULT NULL,
  `blog_allow_pings_default` tinyint(4) DEFAULT NULL,
  `blog_allow_reg_comments` tinyint(4) DEFAULT NULL,
  `blog_allow_unreg_comments` tinyint(4) DEFAULT NULL,
  `blog_archive_path` varchar(255) DEFAULT NULL,
  `blog_archive_tmpl_category` varchar(255) DEFAULT NULL,
  `blog_archive_tmpl_daily` varchar(255) DEFAULT NULL,
  `blog_archive_tmpl_individual` varchar(255) DEFAULT NULL,
  `blog_archive_tmpl_monthly` varchar(255) DEFAULT NULL,
  `blog_archive_tmpl_weekly` varchar(255) DEFAULT NULL,
  `blog_archive_type` varchar(255) DEFAULT NULL,
  `blog_archive_type_preferred` varchar(25) DEFAULT NULL,
  `blog_archive_url` varchar(255) DEFAULT NULL,
  `blog_autodiscover_links` tinyint(4) DEFAULT NULL,
  `blog_autolink_urls` tinyint(4) DEFAULT NULL,
  `blog_basename_limit` smallint(6) DEFAULT NULL,
  `blog_cc_license` varchar(255) DEFAULT NULL,
  `blog_children_modified_on` datetime DEFAULT NULL,
  `blog_class` varchar(255) DEFAULT 'blog',
  `blog_content_css` varchar(255) DEFAULT NULL,
  `blog_convert_paras` varchar(30) DEFAULT NULL,
  `blog_convert_paras_comments` varchar(30) DEFAULT NULL,
  `blog_created_by` int(11) DEFAULT NULL,
  `blog_created_on` datetime DEFAULT NULL,
  `blog_custom_dynamic_templates` varchar(25) DEFAULT 'none',
  `blog_date_language` varchar(5) DEFAULT NULL,
  `blog_days_on_index` int(11) DEFAULT NULL,
  `blog_description` mediumtext,
  `blog_email_new_comments` tinyint(4) DEFAULT NULL,
  `blog_email_new_pings` tinyint(4) DEFAULT NULL,
  `blog_entries_on_index` int(11) DEFAULT NULL,
  `blog_file_extension` varchar(10) DEFAULT NULL,
  `blog_google_api_key` varchar(32) DEFAULT NULL,
  `blog_internal_autodiscovery` tinyint(4) DEFAULT NULL,
  `blog_is_dynamic` tinyint(4) DEFAULT NULL,
  `blog_junk_folder_expiry` int(11) DEFAULT NULL,
  `blog_junk_score_threshold` float DEFAULT NULL,
  `blog_language` varchar(5) DEFAULT NULL,
  `blog_manual_approve_commenters` tinyint(4) DEFAULT NULL,
  `blog_moderate_pings` tinyint(4) DEFAULT NULL,
  `blog_moderate_unreg_comments` tinyint(4) DEFAULT NULL,
  `blog_modified_by` int(11) DEFAULT NULL,
  `blog_modified_on` datetime DEFAULT NULL,
  `blog_mt_update_key` varchar(30) DEFAULT NULL,
  `blog_name` varchar(255) NOT NULL,
  `blog_old_style_archive_links` tinyint(4) DEFAULT NULL,
  `blog_parent_id` int(11) DEFAULT NULL,
  `blog_ping_blogs` tinyint(4) DEFAULT NULL,
  `blog_ping_google` tinyint(4) DEFAULT NULL,
  `blog_ping_others` mediumtext,
  `blog_ping_technorati` tinyint(4) DEFAULT NULL,
  `blog_ping_weblogs` tinyint(4) DEFAULT NULL,
  `blog_remote_auth_token` varchar(50) DEFAULT NULL,
  `blog_require_comment_emails` tinyint(4) DEFAULT NULL,
  `blog_sanitize_spec` varchar(255) DEFAULT NULL,
  `blog_server_offset` float DEFAULT NULL,
  `blog_site_path` varchar(255) DEFAULT NULL,
  `blog_site_url` varchar(255) DEFAULT NULL,
  `blog_sort_order_comments` varchar(8) DEFAULT NULL,
  `blog_sort_order_posts` varchar(8) DEFAULT NULL,
  `blog_status_default` smallint(6) DEFAULT NULL,
  `blog_theme_id` varchar(255) DEFAULT NULL,
  `blog_use_comment_confirmation` tinyint(4) DEFAULT NULL,
  `blog_use_revision` tinyint(4) DEFAULT NULL,
  `blog_welcome_msg` mediumtext,
  `blog_words_in_excerpt` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `mt_blog_class` (`blog_class`),
  KEY `mt_blog_name` (`blog_name`),
  KEY `mt_blog_parent_id` (`blog_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_blog`
--

LOCK TABLES `mt_blog` WRITE;
/*!40000 ALTER TABLE `mt_blog` DISABLE KEYS */;
INSERT INTO `mt_blog` VALUES (1,NULL,1,1,1,1,1,1,0,NULL,NULL,NULL,NULL,NULL,NULL,'Monthly,Individual,Category,Page','Individual',NULL,NULL,1,100,NULL,'2020-11-24 05:24:01','website',NULL,'richtext','1',1,'2020-11-24 14:20:59','none','ja',0,NULL,1,1,10,'html',NULL,0,NULL,14,0,'ja',NULL,1,2,NULL,'2020-11-24 14:20:59',NULL,'WOVN Example',NULL,NULL,0,0,NULL,0,0,NULL,0,'0',9,'/var/www/html','http://127.0.0.1:8080/','ascend','descend',2,'classic_website',1,1,NULL,40);
/*!40000 ALTER TABLE `mt_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_blog_meta`
--

DROP TABLE IF EXISTS `mt_blog_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_blog_meta` (
  `blog_meta_blog_id` int(11) NOT NULL,
  `blog_meta_type` varchar(75) NOT NULL,
  `blog_meta_vchar` varchar(255) DEFAULT NULL,
  `blog_meta_vchar_idx` varchar(255) DEFAULT NULL,
  `blog_meta_vdatetime` datetime DEFAULT NULL,
  `blog_meta_vdatetime_idx` datetime DEFAULT NULL,
  `blog_meta_vinteger` int(11) DEFAULT NULL,
  `blog_meta_vinteger_idx` int(11) DEFAULT NULL,
  `blog_meta_vfloat` float DEFAULT NULL,
  `blog_meta_vfloat_idx` float DEFAULT NULL,
  `blog_meta_vblob` mediumblob,
  `blog_meta_vclob` mediumtext,
  PRIMARY KEY (`blog_meta_blog_id`,`blog_meta_type`),
  KEY `mt_blog_meta_type_vflt` (`blog_meta_type`,`blog_meta_vfloat_idx`),
  KEY `mt_blog_meta_type_vchar` (`blog_meta_type`,`blog_meta_vchar_idx`),
  KEY `mt_blog_meta_type_vdt` (`blog_meta_type`,`blog_meta_vdatetime_idx`),
  KEY `mt_blog_meta_type_vint` (`blog_meta_type`,`blog_meta_vinteger_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_blog_meta`
--

LOCK TABLES `mt_blog_meta` WRITE;
/*!40000 ALTER TABLE `mt_blog_meta` DISABLE KEYS */;
INSERT INTO `mt_blog_meta` VALUES (1,'commenter_authenticators','MovableType',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'follow_auth_links',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(1,'nofollow_urls',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(1,'page_layout','layout-wtt',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mt_blog_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_category`
--

DROP TABLE IF EXISTS `mt_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_allow_pings` tinyint(4) DEFAULT '0',
  `category_author_id` int(11) DEFAULT NULL,
  `category_basename` varchar(255) DEFAULT NULL,
  `category_blog_id` int(11) NOT NULL,
  `category_class` varchar(255) DEFAULT 'category',
  `category_created_by` int(11) DEFAULT NULL,
  `category_created_on` datetime DEFAULT NULL,
  `category_description` mediumtext,
  `category_label` varchar(100) NOT NULL,
  `category_modified_by` int(11) DEFAULT NULL,
  `category_modified_on` datetime DEFAULT NULL,
  `category_parent` int(11) DEFAULT '0',
  `category_ping_urls` mediumtext,
  PRIMARY KEY (`category_id`),
  KEY `mt_category_parent` (`category_parent`),
  KEY `mt_category_blog_basename` (`category_blog_id`,`category_basename`),
  KEY `mt_category_label` (`category_label`),
  KEY `mt_category_class` (`category_class`),
  KEY `mt_category_blog_class` (`category_blog_id`,`category_class`),
  KEY `mt_category_blog_id` (`category_blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_category`
--

LOCK TABLES `mt_category` WRITE;
/*!40000 ALTER TABLE `mt_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_category_meta`
--

DROP TABLE IF EXISTS `mt_category_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_category_meta` (
  `category_meta_category_id` int(11) NOT NULL,
  `category_meta_type` varchar(75) NOT NULL,
  `category_meta_vchar` varchar(255) DEFAULT NULL,
  `category_meta_vchar_idx` varchar(255) DEFAULT NULL,
  `category_meta_vdatetime` datetime DEFAULT NULL,
  `category_meta_vdatetime_idx` datetime DEFAULT NULL,
  `category_meta_vinteger` int(11) DEFAULT NULL,
  `category_meta_vinteger_idx` int(11) DEFAULT NULL,
  `category_meta_vfloat` float DEFAULT NULL,
  `category_meta_vfloat_idx` float DEFAULT NULL,
  `category_meta_vblob` mediumblob,
  `category_meta_vclob` mediumtext,
  PRIMARY KEY (`category_meta_category_id`,`category_meta_type`),
  KEY `mt_category_meta_type_vdt` (`category_meta_type`,`category_meta_vdatetime_idx`),
  KEY `mt_category_meta_type_vflt` (`category_meta_type`,`category_meta_vfloat_idx`),
  KEY `mt_category_meta_type_vchar` (`category_meta_type`,`category_meta_vchar_idx`),
  KEY `mt_category_meta_type_vint` (`category_meta_type`,`category_meta_vinteger_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_category_meta`
--

LOCK TABLES `mt_category_meta` WRITE;
/*!40000 ALTER TABLE `mt_category_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_category_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_comment`
--

DROP TABLE IF EXISTS `mt_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_author` varchar(100) DEFAULT NULL,
  `comment_blog_id` int(11) NOT NULL,
  `comment_commenter_id` int(11) DEFAULT NULL,
  `comment_created_by` int(11) DEFAULT NULL,
  `comment_created_on` datetime DEFAULT NULL,
  `comment_email` varchar(127) DEFAULT NULL,
  `comment_entry_id` int(11) NOT NULL,
  `comment_ip` varchar(50) DEFAULT NULL,
  `comment_junk_log` mediumtext,
  `comment_junk_score` float DEFAULT NULL,
  `comment_junk_status` smallint(6) DEFAULT '1',
  `comment_last_moved_on` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `comment_modified_by` int(11) DEFAULT NULL,
  `comment_modified_on` datetime DEFAULT NULL,
  `comment_parent_id` int(11) DEFAULT NULL,
  `comment_text` mediumtext,
  `comment_url` varchar(255) DEFAULT NULL,
  `comment_visible` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `mt_comment_commenter_id` (`comment_commenter_id`),
  KEY `mt_comment_entry_visible` (`comment_entry_id`,`comment_visible`,`comment_created_on`),
  KEY `mt_comment_visible_date` (`comment_visible`,`comment_created_on`),
  KEY `mt_comment_blog_url` (`comment_blog_id`,`comment_visible`,`comment_url`),
  KEY `mt_comment_dd_coment_vis_mod` (`comment_visible`,`comment_modified_on`),
  KEY `mt_comment_email` (`comment_email`),
  KEY `mt_comment_blog_stat` (`comment_blog_id`,`comment_junk_status`,`comment_created_on`),
  KEY `mt_comment_blog_visible_entry` (`comment_blog_id`,`comment_visible`,`comment_entry_id`),
  KEY `mt_comment_author` (`comment_author`),
  KEY `mt_comment_blog_ip_date` (`comment_blog_id`,`comment_ip`,`comment_created_on`),
  KEY `mt_comment_blog_junk_stat` (`comment_blog_id`,`comment_junk_status`,`comment_last_moved_on`),
  KEY `mt_comment_last_moved_on` (`comment_last_moved_on`),
  KEY `mt_comment_blog_visible` (`comment_blog_id`,`comment_visible`,`comment_created_on`,`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_comment`
--

LOCK TABLES `mt_comment` WRITE;
/*!40000 ALTER TABLE `mt_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_comment_meta`
--

DROP TABLE IF EXISTS `mt_comment_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_comment_meta` (
  `comment_meta_comment_id` int(11) NOT NULL,
  `comment_meta_type` varchar(75) NOT NULL,
  `comment_meta_vchar` varchar(255) DEFAULT NULL,
  `comment_meta_vchar_idx` varchar(255) DEFAULT NULL,
  `comment_meta_vdatetime` datetime DEFAULT NULL,
  `comment_meta_vdatetime_idx` datetime DEFAULT NULL,
  `comment_meta_vinteger` int(11) DEFAULT NULL,
  `comment_meta_vinteger_idx` int(11) DEFAULT NULL,
  `comment_meta_vfloat` float DEFAULT NULL,
  `comment_meta_vfloat_idx` float DEFAULT NULL,
  `comment_meta_vblob` mediumblob,
  `comment_meta_vclob` mediumtext,
  PRIMARY KEY (`comment_meta_comment_id`,`comment_meta_type`),
  KEY `mt_comment_meta_type_vchar` (`comment_meta_type`,`comment_meta_vchar_idx`),
  KEY `mt_comment_meta_type_vflt` (`comment_meta_type`,`comment_meta_vfloat_idx`),
  KEY `mt_comment_meta_type_vint` (`comment_meta_type`,`comment_meta_vinteger_idx`),
  KEY `mt_comment_meta_type_vdt` (`comment_meta_type`,`comment_meta_vdatetime_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_comment_meta`
--

LOCK TABLES `mt_comment_meta` WRITE;
/*!40000 ALTER TABLE `mt_comment_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_comment_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_config`
--

DROP TABLE IF EXISTS `mt_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_data` mediumtext,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_config`
--

LOCK TABLES `mt_config` WRITE;
/*!40000 ALTER TABLE `mt_config` DISABLE KEYS */;
INSERT INTO `mt_config` VALUES (1,'DataAPIDisableSite 0,1\nMTReleaseNumber 0\nMTVersion 6.7\nPluginSchemaVersion WidgetManager=1.1\nPluginSchemaVersion formattedtext=1.00\nPluginSchemaVersion stylecatcher=1.0\nPluginSchemaVersion multiblog=2.71\nSchemaVersion 6.0022\nSecretToken HuOLxaXPw7UX0NonncaoCoEviJICa5eXJtyrzzKv\n');
/*!40000 ALTER TABLE `mt_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_entry`
--

DROP TABLE IF EXISTS `mt_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_entry` (
  `entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_allow_comments` tinyint(4) DEFAULT NULL,
  `entry_allow_pings` tinyint(4) DEFAULT NULL,
  `entry_atom_id` varchar(255) DEFAULT NULL,
  `entry_author_id` int(11) NOT NULL,
  `entry_authored_on` datetime DEFAULT NULL,
  `entry_basename` varchar(255) DEFAULT NULL,
  `entry_blog_id` int(11) NOT NULL,
  `entry_category_id` int(11) DEFAULT NULL,
  `entry_class` varchar(255) DEFAULT 'entry',
  `entry_comment_count` int(11) DEFAULT '0',
  `entry_convert_breaks` varchar(60) DEFAULT NULL,
  `entry_created_by` int(11) DEFAULT NULL,
  `entry_created_on` datetime DEFAULT NULL,
  `entry_current_revision` int(11) NOT NULL DEFAULT '0',
  `entry_excerpt` mediumtext,
  `entry_keywords` mediumtext,
  `entry_modified_by` int(11) DEFAULT NULL,
  `entry_modified_on` datetime DEFAULT NULL,
  `entry_ping_count` int(11) DEFAULT '0',
  `entry_pinged_urls` mediumtext,
  `entry_status` smallint(6) NOT NULL,
  `entry_tangent_cache` mediumtext,
  `entry_template_id` int(11) DEFAULT NULL,
  `entry_text` mediumtext,
  `entry_text_more` mediumtext,
  `entry_title` varchar(255) DEFAULT NULL,
  `entry_to_ping_urls` mediumtext,
  `entry_unpublished_on` datetime DEFAULT NULL,
  `entry_week_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `mt_entry_status` (`entry_status`),
  KEY `mt_entry_comment_count` (`entry_comment_count`),
  KEY `mt_entry_blog_basename` (`entry_blog_id`,`entry_basename`),
  KEY `mt_entry_blog_author` (`entry_blog_id`,`entry_class`,`entry_author_id`,`entry_authored_on`),
  KEY `mt_entry_tag_count` (`entry_status`,`entry_class`,`entry_blog_id`,`entry_id`),
  KEY `mt_entry_blog_authored` (`entry_blog_id`,`entry_class`,`entry_authored_on`),
  KEY `mt_entry_blog_stat_date` (`entry_blog_id`,`entry_class`,`entry_status`,`entry_authored_on`,`entry_id`),
  KEY `mt_entry_blog_unpublished` (`entry_blog_id`,`entry_class`,`entry_unpublished_on`),
  KEY `mt_entry_author_id` (`entry_author_id`),
  KEY `mt_entry_modified_on` (`entry_modified_on`),
  KEY `mt_entry_class` (`entry_class`),
  KEY `mt_entry_blog_week` (`entry_blog_id`,`entry_class`,`entry_status`,`entry_week_number`),
  KEY `mt_entry_title` (`entry_title`),
  KEY `mt_entry_auth_stat_class` (`entry_author_id`,`entry_status`,`entry_class`),
  KEY `mt_entry_dd_entry_tag_count` (`entry_blog_id`,`entry_status`,`entry_class`,`entry_id`),
  KEY `mt_entry_class_authored` (`entry_class`,`entry_authored_on`),
  KEY `mt_entry_created_on` (`entry_created_on`),
  KEY `mt_entry_class_unpublished` (`entry_class`,`entry_unpublished_on`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_entry`
--

LOCK TABLES `mt_entry` WRITE;
/*!40000 ALTER TABLE `mt_entry` DISABLE KEYS */;
INSERT INTO `mt_entry` VALUES (1,1,1,'tag:127.0.0.1,2020://1.1',1,'2020-11-24 14:21:31','post',1,NULL,'entry',0,'richtext',1,'2020-11-24 14:23:58',1,'','',NULL,'2020-11-24 14:23:58',0,NULL,2,NULL,NULL,'<h2 class=\"hero__title\" data-wovn-original-property=\"{&quot;style&quot;:{&quot;fontSize&quot;:&quot;&quot;}}\">Webå¤šè¨€èªžåŒ–ã‚„ã‚µã‚¤ãƒˆç¿»è¨³ã®èª²é¡Œã«ç­”ãˆã‚‹ã‚½ãƒªãƒ¥ãƒ¼ã‚·ãƒ§ãƒ³</h2>\n<p class=\"hero__subtitle\">ã‚µãƒ¼ãƒ“ã‚¹ã®å›½éš›åŒ–ã«ä¼´ã†é–‹ç™ºã‚„ã‚µã‚¤ãƒˆé‹ç”¨ã€ç¿»è¨³ç®¡ç†ã«ã‹ã‹ã‚‹ä¸è¦ãªã‚³ã‚¹ãƒˆã‚’å‰Šæ¸›ã—ã€ã‚ãªãŸã®ãƒ“ã‚¸ãƒã‚¹ã‚’ä¸–ç•Œã«åºƒã’ã‚‹ã‚µãƒãƒ¼ãƒˆã‚’è¡Œã„ã¾ã™ã€‚</p>\n<h2>WOVN.ioã¯ã€ã‚ãªãŸã®æµ·å¤–æˆ¦ç•¥ã‚’æ‰‹åŠ©ã‘ã™ã‚‹ãƒ‘ãƒ¼ãƒˆãƒŠãƒ¼</h2>\n<p><span>WOVN.ioã¯ã€Webã‚µã‚¤ãƒˆãƒ»ã‚¢ãƒ—ãƒªã‚’æ§˜ã€…ãªè¨€èªžã«å¤šè¨€èªžåŒ–ã§ãã‚‹ã‚½ãƒªãƒ¥ãƒ¼ã‚·ãƒ§ãƒ³ã§ã™ã€‚æ—¢å­˜ã®Webã‚µã‚¤ãƒˆãƒ»ã‚¢ãƒ—ãƒªã«å¾Œä»˜ã‘ã™ã‚‹ã“ã¨ãŒã§ãã€å¤šè¨€èªžåŒ–ã«å¿…è¦ãªã‚·ã‚¹ãƒ†ãƒ é–‹ç™ºãƒ»å¤šè¨€èªžã‚µã‚¤ãƒˆé‹ç”¨ã«ã‹ã‹ã‚‹ã€ä¸è¦ãªã‚³ã‚¹ãƒˆã®åœ§ç¸®ãƒ»äººçš„ãƒªã‚½ãƒ¼ã‚¹ã®å‰Šæ¸›ãƒ»å°Žå…¥æœŸé–“ã®çŸ­ç¸®ã‚’å®Ÿç¾ã—ã¾ã™ã€‚</span></p>\n<h3>é–‹ç™ºå·¥æ•°ã®å‰Šæ¸›</h3>\n<p><span>è¨€èªžæ¯Žã®é–‹ç™ºã‚’è¡Œã†ã“ã¨ç„¡ãã€Webã‚µã‚¤ãƒˆã‚„ã‚¢ãƒ—ãƒªã®å¤šè¨€èªžåŒ–ã‚’å®Ÿç¾ã—ã€é–‹ç™ºè²»ç”¨ã‚„äººçš„ã‚³ã‚¹ãƒˆã‚’å¤§å¹…ã«ã‚«ãƒƒãƒˆã™ã‚‹ã“ã¨ãŒã§ãã¾ã™ã€‚</span></p>\n<h3>æœ€é©ãªé‹ç”¨ã®å®Ÿç¾</h3>\n<p><span>ã‚¨ãƒ³ã‚¸ãƒ‹ã‚¢ç„¡ã—ã§Webã‚µã‚¤ãƒˆã‚„ã‚¢ãƒ—ãƒªå†…ã®ãƒ†ã‚­ã‚¹ãƒˆç¿»è¨³ãƒ»ä¿®æ­£ãŒå¯èƒ½ã§ã™ã€‚æ›´æ–°æƒ…å ±ã‚’ãƒªã‚¢ãƒ«ã‚¿ã‚¤ãƒ ã«ç¿»è¨³ã—ã€åæ˜ ã™ã‚‹ã“ã¨ãŒã§ãã¾ã™ã€‚</span></p>\n<h3>é«˜å“è³ªãªç¿»è¨³ã‚’æä¾›</h3>\n<p><span>è¤‡æ•°ã®ç¿»è¨³æ–¹æ³•ã‚’çµ„ã¿åˆã‚ã›ã‚‹ã“ã¨ã§ã€ã‚ˆã‚Šæ­£ç¢ºã§é«˜å“è³ªãªç¿»è¨³ã‚’å®Ÿç¾ã—ã¾ã™ã€‚ã¾ãŸç¿»è¨³æ–‡ã¯ã€ç¿»è¨³è³‡ç”£ã¨ã—ã¦ã€æ´»ç”¨ã™ã‚‹ã“ã¨ãŒã§ãã¾ã™ã€‚</span></p>\n<h3>å¤šè¨€èªžåŒ–ã«å¿…è¦ãªã‚½ãƒªãƒ¥ãƒ¼ã‚·ãƒ§ãƒ³ãŒå…¨ã¦æƒã£ã¦ã„ã¾ã™</h3>\n<p><span>å¤šè¨€èªžåŒ–ã«ä¼´ã†ã‚·ã‚¹ãƒ†ãƒ é–‹ç™ºã‚„ã‚µã‚¤ãƒˆé‹ç”¨ã€ç¿»è¨³ç®¡ç†ã«å¯¾ã—èª²é¡Œã‚’æŠ±ãˆã¦ã„ã¾ã›ã‚“ã‹ã€‚å¤§è¦æ¨¡ãªECã‚„ã€å¼·å›ºãªã‚»ã‚­ãƒ¥ãƒªãƒ†ã‚£ãŒå¿…è¦ãªç®¡ç†ç”»é¢ã€é«˜å“è³ªãªç¿»è¨³ã‚’å¿…è¦ã¨ã™ã‚‹IPã‚³ãƒ³ãƒ†ãƒ³ãƒ„ãŒè±Šå¯Œãªãƒ–ãƒ©ãƒ³ãƒ‡ã‚£ãƒ³ã‚°ãƒšãƒ¼ã‚¸ãªã©ã€ã‚ã‚‰ã‚†ã‚‹ã‚ªãƒ³ãƒ©ã‚¤ãƒ³ã‚µãƒ¼ãƒ“ã‚¹å¤šè¨€èªžåŒ–ã«ãŠã‘ã‚‹èª²é¡Œã‚’è§£æ±ºã™ã‚‹ã‚½ãƒªãƒ¥ãƒ¼ã‚·ãƒ§ãƒ³ã®æä¾›ã‚’è‡´ã—ã¾ã™ã€‚</span></p>\n<p><span></span></p>','','ã‚µãƒ³ãƒ—ãƒ«ãƒšãƒ¼ã‚¸','',NULL,202048);
/*!40000 ALTER TABLE `mt_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_entry_meta`
--

DROP TABLE IF EXISTS `mt_entry_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_entry_meta` (
  `entry_meta_entry_id` int(11) NOT NULL,
  `entry_meta_type` varchar(75) NOT NULL,
  `entry_meta_vchar` varchar(255) DEFAULT NULL,
  `entry_meta_vchar_idx` varchar(255) DEFAULT NULL,
  `entry_meta_vdatetime` datetime DEFAULT NULL,
  `entry_meta_vdatetime_idx` datetime DEFAULT NULL,
  `entry_meta_vinteger` int(11) DEFAULT NULL,
  `entry_meta_vinteger_idx` int(11) DEFAULT NULL,
  `entry_meta_vfloat` float DEFAULT NULL,
  `entry_meta_vfloat_idx` float DEFAULT NULL,
  `entry_meta_vblob` mediumblob,
  `entry_meta_vclob` mediumtext,
  PRIMARY KEY (`entry_meta_entry_id`,`entry_meta_type`),
  KEY `mt_entry_meta_type_vdt` (`entry_meta_type`,`entry_meta_vdatetime_idx`),
  KEY `mt_entry_meta_type_vint` (`entry_meta_type`,`entry_meta_vinteger_idx`),
  KEY `mt_entry_meta_type_vchar` (`entry_meta_type`,`entry_meta_vchar_idx`),
  KEY `mt_entry_meta_type_vflt` (`entry_meta_type`,`entry_meta_vfloat_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_entry_meta`
--

LOCK TABLES `mt_entry_meta` WRITE;
/*!40000 ALTER TABLE `mt_entry_meta` DISABLE KEYS */;
INSERT INTO `mt_entry_meta` VALUES (1,'revision',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mt_entry_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_entry_rev`
--

DROP TABLE IF EXISTS `mt_entry_rev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_entry_rev` (
  `entry_rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_rev_changed` varchar(255) NOT NULL,
  `entry_rev_created_by` int(11) DEFAULT NULL,
  `entry_rev_created_on` datetime DEFAULT NULL,
  `entry_rev_description` varchar(255) DEFAULT NULL,
  `entry_rev_entry` mediumblob NOT NULL,
  `entry_rev_entry_id` int(11) NOT NULL,
  `entry_rev_label` varchar(255) DEFAULT NULL,
  `entry_rev_modified_by` int(11) DEFAULT NULL,
  `entry_rev_modified_on` datetime DEFAULT NULL,
  `entry_rev_rev_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_rev_id`),
  KEY `mt_entry_rev_entry_id` (`entry_rev_entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_entry_rev`
--

LOCK TABLES `mt_entry_rev` WRITE;
/*!40000 ALTER TABLE `mt_entry_rev` DISABLE KEYS */;
INSERT INTO `mt_entry_rev` VALUES (1,'author_id,text,status,authored_on,convert_breaks,title,allow_pings,allow_comments,unpublished_on',1,'2020-11-24 14:23:58','',_binary 'SERG\0\0\0\0\0\0\0H\0\0\0\0\0\0convert_breaks-\0\0\0richtext\0\0\0\ncreated_on-\0\0\020201124142358\0\0\0authored_on-\0\0\020201124142131\0\0\0status-\0\0\02\0\0\0\n__rev_tagsA\0\0\0\0\0\0\0keywords-\0\0\0\0\0\0\0\rcomment_count-\0\0\00\0\0\0class-\0\0\0entry\0\0\0allow_comments-\0\0\01\0\0\0current_revision-\0\0\00\0\0\0modified_on-\0\0\020201124142358\0\0\0title-\0\0\0サンプルページ\0\0\0allow_pings-\0\0\01\0\0\0atom_id-\0\0\0tag:127.0.0.1,2020://1.1\0\0\0excerpt-\0\0\0\0\0\0\0\nping_count-\0\0\00\0\0\0\ncreated_by-\0\0\01\0\0\0week_number-\0\0\0202048\0\0\0\n__rev_catsA\0\0\0\0\0\0\0blog_id-\0\0\01\0\0\0to_ping_urls-\0\0\0\0\0\0\0basename-\0\0\0post\0\0\0	author_id-\0\0\01\0\0\0text-\0\0_<h2 class=\"hero__title\" data-wovn-original-property=\"{&quot;style&quot;:{&quot;fontSize&quot;:&quot;&quot;}}\">Web多言語化やサイト翻訳の課題に答えるソリューション</h2>\n<p class=\"hero__subtitle\">サービスの国際化に伴う開発やサイト運用、翻訳管理にかかる不要なコストを削減し、あなたのビジネスを世界に広げるサポートを行います。</p>\n<h2>WOVN.ioは、あなたの海外戦略を手助けするパートナー</h2>\n<p><span>WOVN.ioは、Webサイト・アプリを様々な言語に多言語化できるソリューションです。既存のWebサイト・アプリに後付けすることができ、多言語化に必要なシステム開発・多言語サイト運用にかかる、不要なコストの圧縮・人的リソースの削減・導入期間の短縮を実現します。</span></p>\n<h3>開発工数の削減</h3>\n<p><span>言語毎の開発を行うこと無く、Webサイトやアプリの多言語化を実現し、開発費用や人的コストを大幅にカットすることができます。</span></p>\n<h3>最適な運用の実現</h3>\n<p><span>エンジニア無しでWebサイトやアプリ内のテキスト翻訳・修正が可能です。更新情報をリアルタイムに翻訳し、反映することができます。</span></p>\n<h3>高品質な翻訳を提供</h3>\n<p><span>複数の翻訳方法を組み合わせることで、より正確で高品質な翻訳を実現します。また翻訳文は、翻訳資産として、活用することができます。</span></p>\n<h3>多言語化に必要なソリューションが全て揃っています</h3>\n<p><span>多言語化に伴うシステム開発やサイト運用、翻訳管理に対し課題を抱えていませんか。大規模なECや、強固なセキュリティが必要な管理画面、高品質な翻訳を必要とするIPコンテンツが豊富なブランディングページなど、あらゆるオンラインサービス多言語化における課題を解決するソリューションの提供を致します。</span></p>\n<p><span></span></p>\0\0\0	text_more-\0\0\0\0\0\0\0unpublished_onU\0\0\0id-\0\0\01',1,NULL,NULL,'2020-11-24 14:23:58',1);
/*!40000 ALTER TABLE `mt_entry_rev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_entry_summary`
--

DROP TABLE IF EXISTS `mt_entry_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_entry_summary` (
  `entry_summary_entry_id` int(11) NOT NULL,
  `entry_summary_type` varchar(75) NOT NULL,
  `entry_summary_class` varchar(75) NOT NULL,
  `entry_summary_vchar_idx` varchar(255) DEFAULT NULL,
  `entry_summary_vinteger_idx` int(11) DEFAULT NULL,
  `entry_summary_vblob` mediumblob,
  `entry_summary_vclob` mediumtext,
  `entry_summary_expired` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`entry_summary_entry_id`,`entry_summary_type`),
  KEY `mt_entry_summary_class_vint` (`entry_summary_class`,`entry_summary_vinteger_idx`),
  KEY `mt_entry_summary_class_vchar` (`entry_summary_class`,`entry_summary_vchar_idx`),
  KEY `mt_entry_summary_id_class` (`entry_summary_entry_id`,`entry_summary_class`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_entry_summary`
--

LOCK TABLES `mt_entry_summary` WRITE;
/*!40000 ALTER TABLE `mt_entry_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_entry_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_failedlogin`
--

DROP TABLE IF EXISTS `mt_failedlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_failedlogin` (
  `failedlogin_id` int(11) NOT NULL AUTO_INCREMENT,
  `failedlogin_author_id` int(11) DEFAULT NULL,
  `failedlogin_ip_locked` tinyint(4) DEFAULT '0',
  `failedlogin_remote_ip` varchar(60) DEFAULT NULL,
  `failedlogin_start` int(11) NOT NULL,
  PRIMARY KEY (`failedlogin_id`),
  KEY `mt_failedlogin_ip_start` (`failedlogin_remote_ip`,`failedlogin_start`),
  KEY `mt_failedlogin_start` (`failedlogin_start`),
  KEY `mt_failedlogin_ip_locked` (`failedlogin_ip_locked`),
  KEY `mt_failedlogin_remote_ip` (`failedlogin_remote_ip`),
  KEY `mt_failedlogin_author_id` (`failedlogin_author_id`),
  KEY `mt_failedlogin_author_start` (`failedlogin_author_id`,`failedlogin_start`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_failedlogin`
--

LOCK TABLES `mt_failedlogin` WRITE;
/*!40000 ALTER TABLE `mt_failedlogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_failedlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_fileinfo`
--

DROP TABLE IF EXISTS `mt_fileinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_fileinfo` (
  `fileinfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `fileinfo_archive_type` varchar(255) DEFAULT NULL,
  `fileinfo_author_id` int(11) DEFAULT NULL,
  `fileinfo_blog_id` int(11) NOT NULL,
  `fileinfo_category_id` int(11) DEFAULT NULL,
  `fileinfo_entry_id` int(11) DEFAULT NULL,
  `fileinfo_file_path` mediumtext,
  `fileinfo_startdate` varchar(80) DEFAULT NULL,
  `fileinfo_template_id` int(11) DEFAULT NULL,
  `fileinfo_templatemap_id` int(11) DEFAULT NULL,
  `fileinfo_url` varchar(255) DEFAULT NULL,
  `fileinfo_virtual` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`fileinfo_id`),
  KEY `mt_fileinfo_entry_id` (`fileinfo_entry_id`),
  KEY `mt_fileinfo_url` (`fileinfo_url`),
  KEY `mt_fileinfo_author_id` (`fileinfo_author_id`),
  KEY `mt_fileinfo_archive_type` (`fileinfo_archive_type`),
  KEY `mt_fileinfo_startdate` (`fileinfo_startdate`),
  KEY `mt_fileinfo_blog_id` (`fileinfo_blog_id`),
  KEY `mt_fileinfo_template_id` (`fileinfo_template_id`),
  KEY `mt_fileinfo_templatemap_id` (`fileinfo_templatemap_id`),
  KEY `mt_fileinfo_category_id` (`fileinfo_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_fileinfo`
--

LOCK TABLES `mt_fileinfo` WRITE;
/*!40000 ALTER TABLE `mt_fileinfo` DISABLE KEYS */;
INSERT INTO `mt_fileinfo` VALUES (1,'Monthly',NULL,1,NULL,NULL,'/var/www/html/2020/11/index.html','20201101000000',4,1,'/2020/11/index.html',NULL),(2,'Individual',NULL,1,NULL,1,'/var/www/html/2020/11/post.html',NULL,8,3,'/2020/11/post.html',NULL),(3,'index',NULL,1,NULL,NULL,'/var/www/html/styles.css',NULL,7,NULL,'/styles.css',NULL),(4,'index',NULL,1,NULL,NULL,'/var/www/html/atom.xml',NULL,17,NULL,'/atom.xml',NULL),(5,'index',NULL,1,NULL,NULL,'/var/www/html/archives.html',NULL,32,NULL,'/archives.html',NULL),(6,'index',NULL,1,NULL,NULL,'/var/www/html/rsd.xml',NULL,33,NULL,'/rsd.xml',NULL),(7,'index',NULL,1,NULL,NULL,'/var/www/html/mt.js',NULL,36,NULL,'/mt.js',NULL),(8,'index',NULL,1,NULL,NULL,'/var/www/html/index.html',NULL,40,NULL,'/index.html',NULL);
/*!40000 ALTER TABLE `mt_fileinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_filter`
--

DROP TABLE IF EXISTS `mt_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_author_id` int(11) NOT NULL,
  `filter_blog_id` int(11) NOT NULL,
  `filter_created_by` int(11) DEFAULT NULL,
  `filter_created_on` datetime DEFAULT NULL,
  `filter_items` mediumblob,
  `filter_label` varchar(255) DEFAULT NULL,
  `filter_modified_by` int(11) DEFAULT NULL,
  `filter_modified_on` datetime DEFAULT NULL,
  `filter_object_ds` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_id`),
  KEY `mt_filter_author_ds` (`filter_author_id`,`filter_object_ds`),
  KEY `mt_filter_label` (`filter_label`),
  KEY `mt_filter_modified_on` (`filter_modified_on`),
  KEY `mt_filter_created_on` (`filter_created_on`),
  KEY `mt_filter_author_id` (`filter_author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_filter`
--

LOCK TABLES `mt_filter` WRITE;
/*!40000 ALTER TABLE `mt_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_formatted_text`
--

DROP TABLE IF EXISTS `mt_formatted_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_formatted_text` (
  `formatted_text_id` int(11) NOT NULL AUTO_INCREMENT,
  `formatted_text_blog_id` int(11) NOT NULL,
  `formatted_text_created_by` int(11) DEFAULT NULL,
  `formatted_text_created_on` datetime DEFAULT NULL,
  `formatted_text_description` varchar(255) DEFAULT NULL,
  `formatted_text_label` varchar(255) DEFAULT NULL,
  `formatted_text_modified_by` int(11) DEFAULT NULL,
  `formatted_text_modified_on` datetime DEFAULT NULL,
  `formatted_text_text` mediumtext,
  PRIMARY KEY (`formatted_text_id`),
  KEY `mt_formatted_text_created_on` (`formatted_text_created_on`),
  KEY `mt_formatted_text_blog_id` (`formatted_text_blog_id`),
  KEY `mt_formatted_text_modified_on` (`formatted_text_modified_on`),
  KEY `mt_formatted_text_blog_c_by` (`formatted_text_blog_id`,`formatted_text_created_by`),
  KEY `mt_formatted_text_label` (`formatted_text_label`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_formatted_text`
--

LOCK TABLES `mt_formatted_text` WRITE;
/*!40000 ALTER TABLE `mt_formatted_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_formatted_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_ipbanlist`
--

DROP TABLE IF EXISTS `mt_ipbanlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_ipbanlist` (
  `ipbanlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `ipbanlist_blog_id` int(11) NOT NULL,
  `ipbanlist_created_by` int(11) DEFAULT NULL,
  `ipbanlist_created_on` datetime DEFAULT NULL,
  `ipbanlist_ip` varchar(50) NOT NULL,
  `ipbanlist_modified_by` int(11) DEFAULT NULL,
  `ipbanlist_modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`ipbanlist_id`),
  KEY `mt_ipbanlist_blog_id` (`ipbanlist_blog_id`),
  KEY `mt_ipbanlist_ip` (`ipbanlist_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_ipbanlist`
--

LOCK TABLES `mt_ipbanlist` WRITE;
/*!40000 ALTER TABLE `mt_ipbanlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_ipbanlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_log`
--

DROP TABLE IF EXISTS `mt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_author_id` int(11) DEFAULT '0',
  `log_blog_id` int(11) DEFAULT '0',
  `log_category` varchar(255) DEFAULT NULL,
  `log_class` varchar(255) DEFAULT 'system',
  `log_created_by` int(11) DEFAULT NULL,
  `log_created_on` datetime DEFAULT NULL,
  `log_ip` varchar(50) DEFAULT NULL,
  `log_level` int(11) DEFAULT '1',
  `log_message` mediumtext,
  `log_metadata` mediumtext,
  `log_modified_by` int(11) DEFAULT NULL,
  `log_modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `mt_log_created_on` (`log_created_on`),
  KEY `mt_log_level` (`log_level`),
  KEY `mt_log_class` (`log_class`),
  KEY `mt_log_blog_id` (`log_blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_log`
--

LOCK TABLES `mt_log` WRITE;
/*!40000 ALTER TABLE `mt_log` DISABLE KEYS */;
INSERT INTO `mt_log` VALUES (1,0,0,'upgrade','system',NULL,'2020-11-24 05:21:00',NULL,1,'\'admin\'ãŒãƒ‡ãƒ¼ã‚¿ãƒ™ãƒ¼ã‚¹ã‚’ãƒãƒ¼ã‚¸ãƒ§ãƒ³6.0022ã«ã‚¢ãƒƒãƒ—ã‚°ãƒ¬ãƒ¼ãƒ‰ã—ã¾ã—ãŸã€‚',NULL,NULL,'2020-11-24 05:21:00'),(2,0,0,'install','plugin',NULL,'2020-11-24 05:21:00',NULL,1,'\'admin\'ãŒãƒ—ãƒ©ã‚°ã‚¤ãƒ³(FormattedTextã€ãƒãƒ¼ã‚¸ãƒ§ãƒ³1.23ã€ã‚¹ã‚­ãƒ¼ãƒžãƒãƒ¼ã‚¸ãƒ§ãƒ³1.00)ã‚’ã‚¤ãƒ³ã‚¹ãƒˆãƒ¼ãƒ«ã—ã¾ã—ãŸã€‚',NULL,NULL,'2020-11-24 05:21:00'),(3,0,0,'install','plugin',NULL,'2020-11-24 05:21:00',NULL,1,'\'admin\'ãŒãƒ—ãƒ©ã‚°ã‚¤ãƒ³(MultiBlogã€ãƒãƒ¼ã‚¸ãƒ§ãƒ³2.71ã€ã‚¹ã‚­ãƒ¼ãƒžãƒãƒ¼ã‚¸ãƒ§ãƒ³2.71)ã‚’ã‚¤ãƒ³ã‚¹ãƒˆãƒ¼ãƒ«ã—ã¾ã—ãŸã€‚',NULL,NULL,'2020-11-24 05:21:00'),(4,0,0,'install','plugin',NULL,'2020-11-24 05:21:00',NULL,1,'\'admin\'ãŒãƒ—ãƒ©ã‚°ã‚¤ãƒ³(StyleCatcherã€ãƒãƒ¼ã‚¸ãƒ§ãƒ³2.61ã€ã‚¹ã‚­ãƒ¼ãƒžãƒãƒ¼ã‚¸ãƒ§ãƒ³1.0)ã‚’ã‚¤ãƒ³ã‚¹ãƒˆãƒ¼ãƒ«ã—ã¾ã—ãŸã€‚',NULL,NULL,'2020-11-24 05:21:00'),(5,0,0,'install','plugin',NULL,'2020-11-24 05:21:00',NULL,1,'\'admin\'ãŒãƒ—ãƒ©ã‚°ã‚¤ãƒ³(Widget Manager Upgrade Assistantã€ãƒãƒ¼ã‚¸ãƒ§ãƒ³1.1ã€ã‚¹ã‚­ãƒ¼ãƒžãƒãƒ¼ã‚¸ãƒ§ãƒ³1.1)ã‚’ã‚¤ãƒ³ã‚¹ãƒˆãƒ¼ãƒ«ã—ã¾ã—ãŸã€‚',NULL,NULL,'2020-11-24 05:21:00'),(6,1,1,'new','entry',NULL,'2020-11-24 05:23:58','192.168.128.1',1,'adminãŒè¨˜äº‹ã€Œã‚µãƒ³ãƒ—ãƒ«ãƒšãƒ¼ã‚¸ã€(ID:1)ã‚’è¿½åŠ ã—ã¾ã—ãŸã€‚','1',NULL,'2020-11-24 05:23:58');
/*!40000 ALTER TABLE `mt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_notification`
--

DROP TABLE IF EXISTS `mt_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_blog_id` int(11) NOT NULL,
  `notification_created_by` int(11) DEFAULT NULL,
  `notification_created_on` datetime DEFAULT NULL,
  `notification_email` varchar(75) DEFAULT NULL,
  `notification_modified_by` int(11) DEFAULT NULL,
  `notification_modified_on` datetime DEFAULT NULL,
  `notification_name` varchar(50) DEFAULT NULL,
  `notification_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `mt_notification_blog_id` (`notification_blog_id`),
  KEY `mt_notification_email` (`notification_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_notification`
--

LOCK TABLES `mt_notification` WRITE;
/*!40000 ALTER TABLE `mt_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_objectasset`
--

DROP TABLE IF EXISTS `mt_objectasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_objectasset` (
  `objectasset_id` int(11) NOT NULL AUTO_INCREMENT,
  `objectasset_asset_id` int(11) NOT NULL,
  `objectasset_blog_id` int(11) DEFAULT NULL,
  `objectasset_embedded` tinyint(4) DEFAULT '0',
  `objectasset_object_ds` varchar(50) NOT NULL,
  `objectasset_object_id` int(11) NOT NULL,
  PRIMARY KEY (`objectasset_id`),
  KEY `mt_objectasset_blog_obj` (`objectasset_blog_id`,`objectasset_object_ds`,`objectasset_object_id`),
  KEY `mt_objectasset_asset_id` (`objectasset_asset_id`),
  KEY `mt_objectasset_id_ds` (`objectasset_object_id`,`objectasset_object_ds`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_objectasset`
--

LOCK TABLES `mt_objectasset` WRITE;
/*!40000 ALTER TABLE `mt_objectasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_objectasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_objectscore`
--

DROP TABLE IF EXISTS `mt_objectscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_objectscore` (
  `objectscore_id` int(11) NOT NULL AUTO_INCREMENT,
  `objectscore_author_id` int(11) DEFAULT '0',
  `objectscore_created_by` int(11) DEFAULT NULL,
  `objectscore_created_on` datetime DEFAULT NULL,
  `objectscore_ip` varchar(50) DEFAULT NULL,
  `objectscore_modified_by` int(11) DEFAULT NULL,
  `objectscore_modified_on` datetime DEFAULT NULL,
  `objectscore_namespace` varchar(100) NOT NULL,
  `objectscore_object_ds` varchar(50) NOT NULL,
  `objectscore_object_id` int(11) DEFAULT '0',
  `objectscore_score` float DEFAULT NULL,
  PRIMARY KEY (`objectscore_id`),
  KEY `mt_objectscore_ns_user_ds_obj` (`objectscore_namespace`,`objectscore_author_id`,`objectscore_object_ds`,`objectscore_object_id`),
  KEY `mt_objectscore_ds_obj` (`objectscore_object_ds`,`objectscore_object_id`),
  KEY `mt_objectscore_user_ns` (`objectscore_author_id`,`objectscore_namespace`),
  KEY `mt_objectscore_ns_ip_ds_obj` (`objectscore_namespace`,`objectscore_ip`,`objectscore_object_ds`,`objectscore_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_objectscore`
--

LOCK TABLES `mt_objectscore` WRITE;
/*!40000 ALTER TABLE `mt_objectscore` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_objectscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_objecttag`
--

DROP TABLE IF EXISTS `mt_objecttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_objecttag` (
  `objecttag_id` int(11) NOT NULL AUTO_INCREMENT,
  `objecttag_blog_id` int(11) DEFAULT NULL,
  `objecttag_object_datasource` varchar(50) NOT NULL,
  `objecttag_object_id` int(11) NOT NULL,
  `objecttag_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`objecttag_id`),
  KEY `mt_objecttag_tag_id` (`objecttag_tag_id`),
  KEY `mt_objecttag_object_id` (`objecttag_object_id`),
  KEY `mt_objecttag_object_datasource` (`objecttag_object_datasource`),
  KEY `mt_objecttag_blog_ds_tag` (`objecttag_blog_id`,`objecttag_object_datasource`,`objecttag_tag_id`),
  KEY `mt_objecttag_blog_ds_obj_tag` (`objecttag_blog_id`,`objecttag_object_datasource`,`objecttag_object_id`,`objecttag_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_objecttag`
--

LOCK TABLES `mt_objecttag` WRITE;
/*!40000 ALTER TABLE `mt_objecttag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_objecttag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_permission`
--

DROP TABLE IF EXISTS `mt_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_author_id` int(11) NOT NULL DEFAULT '0',
  `permission_blog_id` int(11) NOT NULL DEFAULT '0',
  `permission_blog_prefs` varchar(255) DEFAULT NULL,
  `permission_created_by` int(11) DEFAULT NULL,
  `permission_created_on` datetime DEFAULT NULL,
  `permission_entry_prefs` mediumtext,
  `permission_modified_by` int(11) DEFAULT NULL,
  `permission_modified_on` datetime DEFAULT NULL,
  `permission_page_prefs` mediumtext,
  `permission_permissions` mediumtext,
  `permission_restrictions` mediumtext,
  `permission_role_mask` int(11) DEFAULT '0',
  `permission_template_prefs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `mt_permission_author_id` (`permission_author_id`),
  KEY `mt_permission_role_mask` (`permission_role_mask`),
  KEY `mt_permission_blog_id` (`permission_blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_permission`
--

LOCK TABLES `mt_permission` WRITE;
/*!40000 ALTER TABLE `mt_permission` DISABLE KEYS */;
INSERT INTO `mt_permission` VALUES (1,1,0,NULL,NULL,'2020-11-24 14:20:59',NULL,NULL,'2020-11-24 14:20:59',NULL,'\'administer\',\'create_blog\',\'create_website\',\'edit_templates\',\'manage_plugins\',\'view_log\'',NULL,0,NULL),(2,1,1,NULL,1,'2020-11-24 14:21:00','Default|Bottom',NULL,'2020-11-24 14:21:00',NULL,'\'save_image_defaults\',\'manage_pages\',\'comment\',\'edit_all_posts\',\'edit_categories\',\'view_blog_log\',\'manage_feedback\',\'upload\',\'edit_config\',\'administer_website\',\'edit_tags\',\'create_post\',\'manage_member_blogs\',\'edit_notifications\',\'manage_themes\',\'send_notifications\',\'publish_post\',\'administer_blog\',\'edit_templates\',\'manage_users\',\'edit_assets\',\'rebuild\',\'set_publish_paths\'',NULL,0,NULL);
/*!40000 ALTER TABLE `mt_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_placement`
--

DROP TABLE IF EXISTS `mt_placement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_placement` (
  `placement_id` int(11) NOT NULL AUTO_INCREMENT,
  `placement_blog_id` int(11) NOT NULL,
  `placement_category_id` int(11) NOT NULL,
  `placement_entry_id` int(11) NOT NULL,
  `placement_is_primary` tinyint(4) NOT NULL,
  PRIMARY KEY (`placement_id`),
  KEY `mt_placement_blog_cat` (`placement_blog_id`,`placement_category_id`),
  KEY `mt_placement_category_id` (`placement_category_id`),
  KEY `mt_placement_is_primary` (`placement_is_primary`),
  KEY `mt_placement_blog_id` (`placement_blog_id`),
  KEY `mt_placement_entry_id` (`placement_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_placement`
--

LOCK TABLES `mt_placement` WRITE;
/*!40000 ALTER TABLE `mt_placement` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_placement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_plugindata`
--

DROP TABLE IF EXISTS `mt_plugindata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_plugindata` (
  `plugindata_id` int(11) NOT NULL AUTO_INCREMENT,
  `plugindata_data` mediumblob,
  `plugindata_key` varchar(255) NOT NULL,
  `plugindata_plugin` varchar(50) NOT NULL,
  PRIMARY KEY (`plugindata_id`),
  KEY `mt_plugindata_plugin` (`plugindata_plugin`),
  KEY `mt_plugindata_key` (`plugindata_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_plugindata`
--

LOCK TABLES `mt_plugindata` WRITE;
/*!40000 ALTER TABLE `mt_plugindata` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_plugindata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_role`
--

DROP TABLE IF EXISTS `mt_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_created_by` int(11) DEFAULT NULL,
  `role_created_on` datetime DEFAULT NULL,
  `role_description` mediumtext,
  `role_is_system` tinyint(4) DEFAULT '0',
  `role_modified_by` int(11) DEFAULT NULL,
  `role_modified_on` datetime DEFAULT NULL,
  `role_name` varchar(255) NOT NULL,
  `role_permissions` mediumtext,
  `role_role_mask` int(11) DEFAULT NULL,
  `role_role_mask2` int(11) DEFAULT NULL,
  `role_role_mask3` int(11) DEFAULT NULL,
  `role_role_mask4` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  KEY `mt_role_created_on` (`role_created_on`),
  KEY `mt_role_is_system` (`role_is_system`),
  KEY `mt_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_role`
--

LOCK TABLES `mt_role` WRITE;
/*!40000 ALTER TABLE `mt_role` DISABLE KEYS */;
INSERT INTO `mt_role` VALUES (1,1,'2020-11-24 14:20:59','ã‚¦ã‚§ãƒ–ã‚µã‚¤ãƒˆã‚’ç®¡ç†ã§ãã¾ã™ã€‚',0,NULL,'2020-11-24 14:20:59','ã‚¦ã‚§ãƒ–ã‚µã‚¤ãƒˆç®¡ç†è€…','\'administer_website\',\'manage_member_blogs\'',NULL,NULL,NULL,NULL),(2,1,'2020-11-24 14:20:59','ãƒ–ãƒ­ã‚°ã®ç®¡ç†è€…ã§ã™ã€‚',0,NULL,'2020-11-24 14:20:59','ãƒ–ãƒ­ã‚°ç®¡ç†è€…','\'administer_blog\'',4096,NULL,NULL,NULL),(3,1,'2020-11-24 14:20:59','ãƒ•ã‚¡ã‚¤ãƒ«ã‚’ã‚¢ãƒƒãƒ—ãƒ­ãƒ¼ãƒ‰ã—ã€è¨˜äº‹(ã‚«ãƒ†ã‚´ãƒª)ã€ã‚¦ã‚§ãƒ–ãƒšãƒ¼ã‚¸(ãƒ•ã‚©ãƒ«ãƒ€)ã€ã‚¿ã‚°ã‚’ç·¨é›†ã—ã¦å…¬é–‹ã§ãã¾ã™ã€‚',0,NULL,'2020-11-24 14:20:59','ç·¨é›†è€…','\'comment\',\'create_post\',\'publish_post\',\'edit_all_posts\',\'edit_categories\',\'edit_tags\',\'manage_pages\',\'rebuild\',\'upload\',\'send_notifications\',\'manage_feedback\',\'edit_assets\'',NULL,NULL,NULL,NULL),(4,1,'2020-11-24 14:20:59','è¨˜äº‹ã‚’ä½œæˆã—ã€å„è‡ªã®è¨˜äº‹ã®ç·¨é›†ã¨ãƒ•ã‚¡ã‚¤ãƒ«ã®ã‚¢ãƒƒãƒ—ãƒ­ãƒ¼ãƒ‰ã€ãŠã‚ˆã³ãã‚Œã‚‰ã‚’å…¬é–‹ã§ãã¾ã™ã€‚',0,NULL,'2020-11-24 14:20:59','ãƒ¦ãƒ¼ã‚¶ãƒ¼','\'comment\',\'create_post\',\'publish_post\',\'upload\',\'send_notifications\'',NULL,NULL,NULL,NULL),(5,1,'2020-11-24 14:20:59','ãƒ†ãƒ³ãƒ—ãƒ¬ãƒ¼ãƒˆã¨ãƒ†ãƒ¼ãƒžã®ç·¨é›†ã¨ç®¡ç†ã€åŠã³ãã‚Œã‚‰ã®å…¬é–‹ãŒã§ãã¾ã™ã€‚',0,NULL,'2020-11-24 14:20:59','ãƒ‡ã‚¶ã‚¤ãƒŠ','\'manage_themes\',\'edit_templates\',\'rebuild\'',144,NULL,NULL,NULL),(6,1,'2020-11-24 14:20:59','ãƒšãƒ¼ã‚¸ã®ç®¡ç†ã€ãƒ•ã‚¡ã‚¤ãƒ«ã®ã‚¢ãƒƒãƒ—ãƒ­ãƒ¼ãƒ‰ã€ãƒ–ãƒ­ã‚°ãƒ†ãƒ³ãƒ—ãƒ¬ãƒ¼ãƒˆã‚’å…¬é–‹ã§ãã¾ã™ã€‚',0,NULL,'2020-11-24 14:20:59','ã‚¦ã‚§ãƒ–ãƒžã‚¹ã‚¿ãƒ¼','\'manage_pages\',\'rebuild\',\'upload\'',NULL,NULL,NULL,NULL),(7,1,'2020-11-24 14:20:59','è¨˜äº‹ã®ä½œæˆã€å„è‡ªã®è¨˜äº‹ã¨ã‚³ãƒ¡ãƒ³ãƒˆã‚’ç·¨é›†ã§ãã¾ã™ã€‚',0,NULL,'2020-11-24 14:20:59','ãƒ©ã‚¤ã‚¿ãƒ¼','\'comment\',\'create_post\'',NULL,NULL,NULL,NULL),(8,1,'2020-11-24 14:20:59','ã‚³ãƒ¡ãƒ³ãƒˆã‚’æŠ•ç¨¿ã—ã€ã‚³ãƒ¡ãƒ³ãƒˆã‚„ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ã‚’ç®¡ç†ã§ãã¾ã™ã€‚',0,NULL,'2020-11-24 14:20:59','ãƒ¢ãƒ‡ãƒ¬ãƒ¼ã‚¿','\'comment\',\'manage_feedback\'',NULL,NULL,NULL,NULL),(9,1,'2020-11-24 14:20:59','ã‚³ãƒ¡ãƒ³ãƒˆã‚’æŠ•ç¨¿ã§ãã¾ã™ã€‚',0,NULL,'2020-11-24 14:20:59','ã‚³ãƒ¡ãƒ³ãƒˆæŠ•ç¨¿è€…','\'comment\'',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mt_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_session`
--

DROP TABLE IF EXISTS `mt_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_session` (
  `session_id` varchar(80) NOT NULL,
  `session_data` mediumblob,
  `session_duration` int(11) DEFAULT NULL,
  `session_email` varchar(255) DEFAULT NULL,
  `session_kind` varchar(2) DEFAULT NULL,
  `session_name` varchar(255) DEFAULT NULL,
  `session_start` int(11) NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `mt_session_start` (`session_start`),
  KEY `mt_session_name` (`session_name`),
  KEY `mt_session_kind` (`session_kind`),
  KEY `mt_session_duration` (`session_duration`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_session`
--

LOCK TABLES `mt_session` WRITE;
/*!40000 ALTER TABLE `mt_session` DISABLE KEYS */;
INSERT INTO `mt_session` VALUES ('beaa4d4f59bab4afc28db303556f9964e9da871c',_binary 'SERG\0\0\0\0\0\0\0H\0\0\0\0\0\0mt_rebuild_token-\0\0\0(a65ca06b9d802d33bd0272472a6ad1e04bbcc87d\0\0\0magic_token-\0\0\0(02adb10e774302b3518a0bd0cab5f290eeaf0508\0\0\0	author_id-\0\0\01',NULL,NULL,'US','1',1606195260),('NW','',NULL,NULL,'NW',NULL,1606112473);
/*!40000 ALTER TABLE `mt_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_tag`
--

DROP TABLE IF EXISTS `mt_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_is_private` tinyint(4) DEFAULT '0',
  `tag_n8d_id` int(11) DEFAULT '0',
  `tag_name` varchar(255) NOT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `mt_tag_n8d_id` (`tag_n8d_id`),
  KEY `mt_tag_private_id_name` (`tag_is_private`,`tag_id`,`tag_name`),
  KEY `mt_tag_name` (`tag_name`),
  KEY `mt_tag_name_id` (`tag_name`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_tag`
--

LOCK TABLES `mt_tag` WRITE;
/*!40000 ALTER TABLE `mt_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_tbping`
--

DROP TABLE IF EXISTS `mt_tbping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_tbping` (
  `tbping_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbping_blog_id` int(11) NOT NULL,
  `tbping_blog_name` varchar(255) DEFAULT NULL,
  `tbping_created_by` int(11) DEFAULT NULL,
  `tbping_created_on` datetime DEFAULT NULL,
  `tbping_excerpt` mediumtext,
  `tbping_ip` varchar(50) NOT NULL,
  `tbping_junk_log` mediumtext,
  `tbping_junk_score` float DEFAULT NULL,
  `tbping_junk_status` smallint(6) NOT NULL DEFAULT '1',
  `tbping_last_moved_on` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `tbping_modified_by` int(11) DEFAULT NULL,
  `tbping_modified_on` datetime DEFAULT NULL,
  `tbping_source_url` varchar(255) DEFAULT NULL,
  `tbping_tb_id` int(11) NOT NULL,
  `tbping_title` varchar(255) DEFAULT NULL,
  `tbping_visible` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`tbping_id`),
  KEY `mt_tbping_blog_stat` (`tbping_blog_id`,`tbping_junk_status`,`tbping_created_on`),
  KEY `mt_tbping_visible_date` (`tbping_visible`,`tbping_created_on`),
  KEY `mt_tbping_blog_url` (`tbping_blog_id`,`tbping_visible`,`tbping_source_url`),
  KEY `mt_tbping_blog_visible` (`tbping_blog_id`,`tbping_visible`,`tbping_created_on`,`tbping_id`),
  KEY `mt_tbping_last_moved_on` (`tbping_last_moved_on`),
  KEY `mt_tbping_tb_visible` (`tbping_tb_id`,`tbping_visible`,`tbping_created_on`),
  KEY `mt_tbping_created_on` (`tbping_created_on`),
  KEY `mt_tbping_ip` (`tbping_ip`),
  KEY `mt_tbping_blog_junk_stat` (`tbping_blog_id`,`tbping_junk_status`,`tbping_last_moved_on`),
  KEY `mt_tbping_junk_date` (`tbping_junk_status`,`tbping_created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_tbping`
--

LOCK TABLES `mt_tbping` WRITE;
/*!40000 ALTER TABLE `mt_tbping` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_tbping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_tbping_meta`
--

DROP TABLE IF EXISTS `mt_tbping_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_tbping_meta` (
  `tbping_meta_tbping_id` int(11) NOT NULL,
  `tbping_meta_type` varchar(75) NOT NULL,
  `tbping_meta_vchar` varchar(255) DEFAULT NULL,
  `tbping_meta_vchar_idx` varchar(255) DEFAULT NULL,
  `tbping_meta_vdatetime` datetime DEFAULT NULL,
  `tbping_meta_vdatetime_idx` datetime DEFAULT NULL,
  `tbping_meta_vinteger` int(11) DEFAULT NULL,
  `tbping_meta_vinteger_idx` int(11) DEFAULT NULL,
  `tbping_meta_vfloat` float DEFAULT NULL,
  `tbping_meta_vfloat_idx` float DEFAULT NULL,
  `tbping_meta_vblob` mediumblob,
  `tbping_meta_vclob` mediumtext,
  PRIMARY KEY (`tbping_meta_tbping_id`,`tbping_meta_type`),
  KEY `mt_tbping_meta_type_vflt` (`tbping_meta_type`,`tbping_meta_vfloat_idx`),
  KEY `mt_tbping_meta_type_vint` (`tbping_meta_type`,`tbping_meta_vinteger_idx`),
  KEY `mt_tbping_meta_type_vdt` (`tbping_meta_type`,`tbping_meta_vdatetime_idx`),
  KEY `mt_tbping_meta_type_vchar` (`tbping_meta_type`,`tbping_meta_vchar_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_tbping_meta`
--

LOCK TABLES `mt_tbping_meta` WRITE;
/*!40000 ALTER TABLE `mt_tbping_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_tbping_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_template`
--

DROP TABLE IF EXISTS `mt_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_blog_id` int(11) NOT NULL,
  `template_build_dynamic` tinyint(4) DEFAULT NULL,
  `template_build_interval` int(11) DEFAULT NULL,
  `template_build_type` smallint(6) DEFAULT NULL,
  `template_created_by` int(11) DEFAULT NULL,
  `template_created_on` datetime DEFAULT NULL,
  `template_identifier` varchar(50) DEFAULT NULL,
  `template_linked_file` varchar(255) DEFAULT NULL,
  `template_linked_file_mtime` varchar(10) DEFAULT NULL,
  `template_linked_file_size` int(11) DEFAULT NULL,
  `template_modified_by` int(11) DEFAULT NULL,
  `template_modified_on` datetime DEFAULT NULL,
  `template_name` varchar(255) NOT NULL,
  `template_outfile` varchar(255) DEFAULT NULL,
  `template_rebuild_me` tinyint(4) DEFAULT NULL,
  `template_text` mediumtext,
  `template_type` varchar(25) NOT NULL,
  `template_current_revision` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `mt_template_outfile` (`template_outfile`),
  KEY `mt_template_identifier` (`template_identifier`),
  KEY `mt_template_blog_id` (`template_blog_id`),
  KEY `mt_template_type` (`template_type`),
  KEY `mt_template_name` (`template_name`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_template`
--

LOCK TABLES `mt_template` WRITE;
/*!40000 ALTER TABLE `mt_template` DISABLE KEYS */;
INSERT INTO `mt_template` VALUES (1,1,0,0,1,1,'2020-11-24 14:20:59','banner_header',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ãƒãƒŠãƒ¼ãƒ˜ãƒƒãƒ€ãƒ¼',NULL,1,'<div id=\"header\">\n    <div id=\"header-inner\">\n        <div id=\"header-content\">\n<mt:Ignore><!-- Use h1 and h2 html tags on the main index of the blog as the title, use divs on all other pages where there are page titles. --></mt:Ignore>\n<mt:If name=\"main_index\">\n            <h1 id=\"header-name\"><a href=\"<$mt:BlogURL$>\" accesskey=\"1\"><$mt:BlogName encode_html=\"1\"$></a></h1>\n            <h2 id=\"header-description\"><$mt:BlogDescription$></h2>\n<mt:Else>\n            <div id=\"header-name\"><a href=\"<$mt:BlogURL$>\" accesskey=\"1\"><$mt:BlogName encode_html=\"1\"$></a></div>\n            <div id=\"header-description\"><$mt:BlogDescription$></div>\n</mt:If>\n        </div>\n    </div>\n</div>\n','custom',0),(2,1,0,0,1,1,'2020-11-24 14:20:59','date_based_category_archives',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','æ—¥ä»˜ãƒ™ãƒ¼ã‚¹ã®ã‚«ãƒ†ã‚´ãƒªã‚¢ãƒ¼ã‚«ã‚¤ãƒ–',NULL,1,'<mt:IfArchiveTypeEnabled archive_type=\"Category-Yearly\">\n    <mt:ArchiveList archive_type=\"Category-Yearly\">\n        <mt:ArchiveListHeader>\n<div class=\"widget-archive-category-yearly widget-archive widget\">\n    <h3 class=\"widget-header\">å¹´åˆ¥ã‚«ãƒ†ã‚´ãƒªã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:ArchiveListHeader>\n            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$> (<$mt:ArchiveCount$>)</a></li>\n        <mt:ArchiveListFooter>\n        </ul>\n    </div>\n</div>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n</mt:IfArchiveTypeEnabled>\n\n<mt:IfArchiveTypeEnabled archive_type=\"Category-Monthly\">\n    <mt:ArchiveList archive_type=\"Category-Monthly\">\n        <mt:ArchiveListHeader>\n<div class=\"widget-archive-category-monthly widget-archive widget\">\n    <h3 class=\"widget-header\">æœˆåˆ¥ã‚«ãƒ†ã‚´ãƒªã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:ArchiveListHeader>\n            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$> (<$mt:ArchiveCount$>)</a></li>\n        <mt:ArchiveListFooter>\n        </ul>\n    </div>\n</div>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n</mt:IfArchiveTypeEnabled>\n\n<mt:IfArchiveTypeEnabled archive_type=\"Category-Weekly\">\n    <mt:ArchiveList archive_type=\"Category-Weekly\">\n        <mt:ArchiveListHeader>\n<div class=\"widget-archive-category-weekly widget-archive widget\">\n    <h3 class=\"widget-header\">é€±åˆ¥ã‚«ãƒ†ã‚´ãƒªã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:ArchiveListHeader>\n            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$> (<$mt:ArchiveCount$>)</a></li>\n        <mt:ArchiveListFooter>\n        </ul>\n    </div>\n</div>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n</mt:IfArchiveTypeEnabled>\n\n<mt:IfArchiveTypeEnabled archive_type=\"Category-Daily\">\n    <mt:ArchiveList archive_type=\"Category-Daily\">\n        <mt:ArchiveListHeader>\n<div class=\"widget-archive-category-daily widget-archive widget\">\n    <h3 class=\"widget-header\">æ—¥åˆ¥ã‚«ãƒ†ã‚´ãƒªã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:ArchiveListHeader>\n            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$> (<$mt:ArchiveCount$>)</a></li>\n        <mt:ArchiveListFooter>\n        </ul>\n    </div>\n</div>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n</mt:IfArchiveTypeEnabled>\n\n','widget',0),(3,1,0,0,1,1,'2020-11-24 14:20:59','recent_assets',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚¢ã‚¤ãƒ†ãƒ ',NULL,1,'<mt:If tag=\"AssetCount\" include_blogs=\"children\" include_with_website=\"1\">\n    <mt:Assets type=\"image\" lastn=\"10\" include_blogs=\"children\" include_with_website=\"1\">\n        <mt:AssetsHeader>\n<div class=\"widget-recent-assets widget\">\n    <h3 class=\"widget-header\">ã‚¢ã‚¤ãƒ†ãƒ </h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:AssetsHeader>\n        <li class=\"item\"><a class=\"asset-image\" href=\"<$mt:AssetURL$>\"><img src=\"<$mt:AssetThumbnailURL height=\"70\"$>\" class=\"asset-img-thumb\" alt=\"<$mt:AssetLabel$>\" title=\"<$mt:AssetLabel$>\" /></a></li>\n        <mt:AssetsFooter>\n        </ul>\n    </div>\n</div>\n        </mt:AssetsFooter>\n    </mt:Assets>\n</mt:If>\n','widget',0),(4,1,0,0,1,1,'2020-11-24 14:20:59','monthly_entry_listing',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','æœˆåˆ¥è¨˜äº‹ãƒªã‚¹ãƒˆ',NULL,1,'<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" id=\"sixapart-standard\">\n<head>\n    <$mt:Include module=\"HTMLãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n    <title><$mt:BlogName encode_html=\"1\"$>: <$mt:ArchiveTitle$>ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</title>\n<mt:Ignore>\n    <!-- Include Next and Previous links if publishing a date-based archive -->\n</mt:Ignore>\n<mt:If name=\"datebased_archive\">\n    <mt:ArchivePrevious><link rel=\"prev\" href=\"<$mt:ArchiveLink$>\" title=\"<$mt:ArchiveTitle encode_html=\"1\"$>\" /></mt:ArchivePrevious>\n    <mt:ArchiveNext><link rel=\"next\" href=\"<$mt:ArchiveLink$>\" title=\"<$mt:ArchiveTitle encode_html=\"1\"$>\" /></mt:ArchiveNext>\n</mt:If>\n</head>\n<body id=\"<$mt:BlogThemeID$>\" class=\"mt-archive-listing mt-<$mt:Var name=\"archive_class\"$> <$mt:Var name=\"page_layout\"$>\">\n    <div id=\"container\">\n        <div id=\"container-inner\">\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n\n\n            <div id=\"content\">\n                <div id=\"content-inner\">\n\n\n                    <div id=\"alpha\">\n                        <div id=\"alpha-inner\">\n\n\n                            <h1 id=\"page-title\" class=\"archive-title\"><$mt:ArchiveTitle$>ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h1>\n\n\n<mt:Ignore><!-- Limit number of entries to the number set in Blog Entry Settings --></mt:Ignore>\n<mt:Unless name=\"datebased_archive\"><$mt:Var name=\"limit\" value=\"auto\"$></mt:Unless>\n<mt:Entries limit=\"$limit\">\n                            <mt:Ignore><!-- Use the Entry Summary module for each entry published on this page --></mt:Ignore>\n                            <$mt:Include module=\"è¨˜äº‹ã®æ¦‚è¦\"$>\n</mt:Entries>\n\n\n                            <div class=\"content-nav\">\n                                <mt:ArchivePrevious><a href=\"<$mt:ArchiveLink$>\">&laquo; <$mt:ArchiveTitle$></a> |</mt:ArchivePrevious>\n                                <a href=\"<$mt:Link template=\"main_index\"$>\">ãƒ¡ã‚¤ãƒ³ãƒšãƒ¼ã‚¸</a> |\n                                <a href=\"<$mt:Link template=\"archive_index\"$>\">ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</a>\n                                <mt:ArchiveNext>| <a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$> &raquo;</a></mt:ArchiveNext>\n                            </div>\n\n\n                        </div>\n                    </div>\n\n\n                    <$mt:Include module=\"ã‚µã‚¤ãƒ‰ãƒãƒ¼\"$>\n\n\n                </div>\n            </div>\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n\n\n        </div>\n    </div>\n</body>\n</html>\n','archive',0),(5,1,0,0,1,1,'2020-11-24 14:20:59','date_based_author_archives',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','æ—¥ä»˜ãƒ™ãƒ¼ã‚¹ã®ãƒ¦ãƒ¼ã‚¶ãƒ¼ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–',NULL,1,'<mt:IfArchiveTypeEnabled archive_type=\"Author-Yearly\">\n    <mt:ArchiveList archive_type=\"Author-Yearly\">\n        <mt:ArchiveListHeader>\n<div class=\"widget-archive-author-yearly widget-archive widget\">\n    <h3 class=\"widget-header\">å¹´åˆ¥ãƒ¦ãƒ¼ã‚¶ãƒ¼ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:ArchiveListHeader>\n            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$> (<$mt:ArchiveCount$>)</a></li>\n        <mt:ArchiveListFooter>\n        </ul>\n    </div>\n</div>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n</mt:IfArchiveTypeEnabled>\n\n<mt:IfArchiveTypeEnabled archive_type=\"Author-Monthly\">\n    <mt:ArchiveList archive_type=\"Author-Monthly\">\n        <mt:ArchiveListHeader>\n<div class=\"widget-archive-author-monthly widget-archive widget\">\n    <h3 class=\"widget-header\">æœˆåˆ¥ãƒ¦ãƒ¼ã‚¶ãƒ¼ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:ArchiveListHeader>\n            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$> (<$mt:ArchiveCount$>)</a></li>\n        <mt:ArchiveListFooter>\n        </ul>\n    </div>\n</div>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n</mt:IfArchiveTypeEnabled>\n\n<mt:IfArchiveTypeEnabled archive_type=\"Author-Weekly\">\n    <mt:ArchiveList archive_type=\"Author-Weekly\">\n        <mt:ArchiveListHeader>\n<div class=\"widget-archive-author-weekly widget-archive widget\">\n    <h3 class=\"widget-header\">é€±åˆ¥ãƒ¦ãƒ¼ã‚¶ãƒ¼ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:ArchiveListHeader>\n            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$> (<$mt:ArchiveCount$>)</a></li>\n        <mt:ArchiveListFooter>\n        </ul>\n    </div>\n</div>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n</mt:IfArchiveTypeEnabled>\n\n<mt:IfArchiveTypeEnabled archive_type=\"Author-Daily\">\n    <mt:ArchiveList archive_type=\"Author-Daily\">\n        <mt:ArchiveListHeader>\n<div class=\"widget-archive-author-daily widget-archive widget\">\n    <h3 class=\"widget-header\">æ—¥åˆ¥ãƒ¦ãƒ¼ã‚¶ãƒ¼ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:ArchiveListHeader>\n            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$> (<$mt:ArchiveCount$>)</a></li>\n        <mt:ArchiveListFooter>\n        </ul>\n    </div>\n</div>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n</mt:IfArchiveTypeEnabled>\n\n','widget',0),(6,1,0,0,1,1,'2020-11-24 14:20:59','page',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚¦ã‚§ãƒ–ãƒšãƒ¼ã‚¸',NULL,1,'<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" id=\"sixapart-standard\">\n<head>\n    <$mt:Include module=\"HTMLãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n    <$mt:EntryTrackbackData$>\n    <$mt:Var name=\"comments_per_page\" value=\"50\"$>\n    <mt:If tag=\"EntryCommentCount\" gt=\"$comments_per_page\">\n	    <script type=\"text/javascript\">\n         MT.entryID = <$mt:PageID$>;\n         MT.commentsPerPage = <$mt:Var name=\"comments_per_page\"$>;\n         MT.entryCommentCount = <$mt:EntryCommentCount$>;\n         MT.commentIds = [<mt:Comments sort_order=\"ascend\" glue=\",\"><mt:CommentID></mt:Comments>];\n	    </script>\n    </mt:If>\n    <title><$mt:PageTitle encode_html=\"1\"$> - <$mt:BlogName encode_html=\"1\"$></title>\n</head>\n<body id=\"<$mt:WebsiteThemeID$>\" class=\"mt-page-archive <$mt:Var name=\"page_layout\"$>\">\n    <div id=\"container\">\n        <div id=\"container-inner\">\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n\n\n            <div id=\"content\">\n                <div id=\"content-inner\">\n\n\n                    <div id=\"alpha\">\n                        <div id=\"alpha-inner\">\n\n\n                            <div id=\"page-<$mt:PageID$>\" class=\"page-asset asset\">\n                                <div class=\"asset-header\">\n                                    <h1 id=\"page-title\" class=\"asset-name\"><$mt:PageTitle$></h1>\n                                </div>\n                                <div class=\"asset-content\">\n<mt:If tag=\"PageBody\">\n                                    <div class=\"asset-body\">\n                                        <$mt:PageBody$>\n                                    </div>\n</mt:If>\n<mt:If tag=\"PageMore\">\n                                    <div id=\"more\" class=\"asset-more\">\n                                        <$mt:PageMore$>\n                                    </div>\n</mt:If>\n                                </div>\n                                <div class=\"asset-footer\"></div>\n                            </div>\n\n\n                    <$mt:Include module=\"ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯\"$>\n                    <$mt:Include module=\"ã‚³ãƒ¡ãƒ³ãƒˆ\"$>\n\n\n                        </div>\n                    </div>\n\n\n                    <$mt:Include module=\"ã‚µã‚¤ãƒ‰ãƒãƒ¼\"$>\n\n\n                </div>\n            </div>\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n\n\n        </div>\n    </div>\n</body>\n</html>\n','page',0),(7,1,0,0,1,1,'2020-11-24 14:20:59','styles',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚¹ã‚¿ã‚¤ãƒ«ã‚·ãƒ¼ãƒˆ','styles.css',1,'@import url(<$mt:StaticWebPath$>themes-base/blog.css);\n@import url(<$mt:StaticWebPath$>themes/minimalist-red/screen.css);\n','index',0),(8,1,0,0,1,1,'2020-11-24 14:20:59','entry',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','è¨˜äº‹',NULL,1,'<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" id=\"sixapart-standard\">\n<head>\n    <$mt:Include module=\"HTMLãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n    <$mt:Var name=\"comments_per_page\" value=\"50\"$>\n    <mt:EntryPrevious><link rel=\"prev bookmark\" href=\"<$mt:EntryPermalink$>\" title=\"<$mt:EntryTitle encode_html=\"1\"$>\" /></mt:EntryPrevious>\n    <mt:EntryNext><link rel=\"next bookmark\" href=\"<$mt:EntryPermalink$>\" title=\"<$mt:EntryTitle encode_html=\"1\"$>\" /></mt:EntryNext>\n    <$mt:EntryTrackbackData$>\n    <mt:If tag=\"EntryCommentCount\" gt=\"$comments_per_page\">\n    <script type=\"text/javascript\">\n        MT.entryID = <$mt:EntryID$>;\n        MT.commentsPerPage = <$mt:Var name=\"comments_per_page\"$>;\n        MT.entryCommentCount = <$mt:EntryCommentCount$>;\n        MT.commentIds = [<mt:Comments sort_order=\"ascend\" glue=\",\"><mt:CommentID></mt:Comments>];\n    </script>\n    </mt:If>\n    <title><$mt:EntryTitle encode_html=\"1\"$> - <$mt:BlogName encode_html=\"1\"$></title>\n</head>\n<body id=\"<$mt:WebsiteThemeID$>\" class=\"mt-entry-archive <$mt:Var name=\"page_layout\"$>\">\n    <div id=\"container\">\n        <div id=\"container-inner\">\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n\n\n            <div id=\"content\">\n                <div id=\"content-inner\">\n\n\n                    <div id=\"alpha\">\n                        <div id=\"alpha-inner\">\n\n\n                            <div id=\"entry-<$mt:EntryID$>\" class=\"entry-asset asset hentry\">\n                                <div class=\"asset-header\">\n                                    <h1 id=\"page-title\" class=\"asset-name entry-title\"><$mt:EntryTitle$></h1>\n                                    <div class=\"asset-meta\">\n                                        <span class=\"byline\">\n<mt:If tag=\"EntryAuthorDisplayName\">\n                                            <span class=\"vcard author\"><$mt:EntryAuthorLink show_hcard=\"1\"$></span> (<abbr class=\"published\" title=\"<$mt:EntryDate format_name=\"iso8601\"$>\"><$mt:EntryDate format=\"%x %X\"$></abbr>)\n<mt:Else>\n                                            <abbr class=\"published\" title=\"<$mt:EntryDate format_name=\"iso8601\"$>\"><$mt:EntryDate format=\"%x %X\"$></abbr>\n</mt:If>\n                                        </span>\n<mt:IfCommentsActive>\n                                        <span class=\"separator\">|</span> <a href=\"<$mt:EntryPermalink$>#comments\"><$mt:EntryCommentCount singular=\"ã‚³ãƒ¡ãƒ³ãƒˆ(1)\" plural=\"ã‚³ãƒ¡ãƒ³ãƒˆ(#)\" none=\"ã‚³ãƒ¡ãƒ³ãƒˆ(0)\"$></a>\n</mt:IfCommentsActive>\n<mt:IfPingsActive>\n                                        <span class=\"separator\">|</span> <a href=\"<$mt:EntryPermalink$>#trackbacks\"><$mt:EntryTrackbackCount singular=\"ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯(1)\" plural=\"ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯(#)\" none=\"ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯(0)\"$></a>\n</mt:IfPingsActive>\n                                    </div>\n                                </div>\n                                <div class=\"asset-content entry-content\">\n<mt:If tag=\"EntryBody\">\n                                    <div class=\"asset-body\">\n                                        <$mt:EntryBody$>\n                                    </div>\n</mt:If>\n<mt:If tag=\"EntryMore\" convert_breaks=\"0\">\n                                    <div id=\"more\" class=\"asset-more\">\n                                        <$mt:EntryMore$>\n                                    </div>\n</mt:If>\n                                </div>\n                                <div class=\"asset-footer\">\n<mt:IfArchiveTypeEnabled archive_type=\"Category\">\n    <mt:If tag=\"EntryCategories\">\n                                    <div class=\"entry-categories\">\n                                        <h4>ã‚«ãƒ†ã‚´ãƒª<span class=\"delimiter\">:</span></h4>\n                                        <ul>\n                                            <li class=\"entry-category\"><mt:EntryCategories glue=\'<span class=\"delimiter\">,</span></li> <li class=\"entry-category\">\'><a href=\"<$mt:CategoryArchiveLink$>\" rel=\"tag\"><$mt:CategoryLabel$></a></mt:EntryCategories></li>\n                                        </ul>\n                                    </div>\n    </mt:If>\n</mt:IfArchiveTypeEnabled>\n<mt:EntryIfTagged>\n                                    <div class=\"entry-tags\">\n                                        <h4>ã‚¿ã‚°<span class=\"delimiter\">:</span></h4>\n                                        <ul>\n                                            <li><mt:EntryTags glue=\'<span class=\"delimiter\">,</span></li> <li>\'><a href=\"javascript:void(0)\" onclick=\"location.href=\'<$mt:TagSearchLink encode_js=\"1\"$>\';return false;\" rel=\"tag\"><$mt:TagName$></a></mt:EntryTags></li>\n                                        </ul>\n                                    </div>\n</mt:EntryIfTagged>\n                                </div>\n                            </div>\n\n\n                    <$mt:Include module=\"ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯\"$>\n                    <$mt:Include module=\"ã‚³ãƒ¡ãƒ³ãƒˆ\"$>\n\n\n                        </div>\n                    </div>\n\n\n                    <$mt:Include module=\"ã‚µã‚¤ãƒ‰ãƒãƒ¼\"$>\n\n\n                </div>\n            </div>\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n\n\n        </div>\n    </div>\n</body>\n</html>\n','individual',0),(9,1,0,0,1,1,'2020-11-24 14:20:59','trackbacks',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯',NULL,1,'<mt:Ignore><!-- Display TrackBacks for the entry/page or TrackBack details if TrackBacks are being accepted --></mt:Ignore>\n<mt:IfPingsActive>\n<div id=\"trackbacks\" class=\"trackbacks\">\n    <h2 class=\"trackbacks-header\"><$mt:EntryTrackbackCount singular=\"ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯(1)\" plural=\"ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯(#)\" none=\"ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯(0)\"$></h2>\n\n    <mt:Ignore><!-- Display TrackBack details if TrackBacks are being accepted --></mt:Ignore>\n    <mt:IfPingsAccepted>\n    <div class=\"trackbacks-info\">\n        <p>ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯URL: <$mt:EntryTrackbackLink$></p>\n    </div>\n    </mt:IfPingsAccepted>\n\n\n    <mt:Ignore><!-- Display TrackBacks --></mt:Ignore>\n    <mt:Pings>\n        <mt:PingsHeader>\n    <div class=\"trackbacks-content\">\n        </mt:PingsHeader>\n        <div class=\"trackback\" id=\"ping-<$mt:PingID$>\">\n            <div class=\"inner\">\n                <div class=\"trackback-header\">\n                    <div class=\"asset-meta\">\n                        <$mt:PingBlogName$> - <a href=\"<$mt:PingURL$>\"><$mt:PingTitle$></a> (<a href=\"#ping-<$mt:PingID$>\"><$mt:PingDate$></a>)\n                    </div>\n                </div>\n                <div class=\"trackback-content\">\n                    <p>\n                        <$mt:PingExcerpt$> <a href=\"<$mt:PingURL$>\">ç¶šãã‚’èª­ã‚€</a>\n                    </p>\n                </div>\n            </div>\n        </div>\n        <mt:PingsFooter>\n    </div>\n        </mt:PingsFooter>\n    </mt:Pings>\n</div>\n</mt:IfPingsActive>\n','custom',0),(10,1,0,0,1,1,'2020-11-24 14:20:59','powered_by',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','Powered By',NULL,1,'<div class=\"widget-powered widget\">\n    <div class=\"widget-content\">\n        <a href=\"http://www.sixapart.jp/movabletype/\"><img src=\"<$mt:StaticWebPath$>images/bug-pbmt-white.png\" alt=\"Powered by Movable Type <$mt:Version$>\" width=\"80\" height=\"61\" /></a>\n    </div>\n</div>\n','widget',0),(11,1,0,0,1,1,'2020-11-24 14:20:59','about_this_page',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','About',NULL,1,'<mt:unless name=\"main_index\">\n<div class=\"widget-about-this-page widget\">\n    <h3 class=\"widget-header\">\n<mt:If name=\"entry_template\">\n        ã“ã®è¨˜äº‹ã«ã¤ã„ã¦\n<mt:Else>\n    <mt:If name=\"archive_template\">\n        ã“ã®ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–ã«ã¤ã„ã¦\n    </mt:If>\n</mt:If>\n<mt:If name=\"archive_index\">\n        ã“ã®ãƒšãƒ¼ã‚¸ã«ã¤ã„ã¦\n</mt:If>\n    </h3>\n    <div class=\"widget-content\">\n<mt:If name=\"archive_index\">\n        <p>ã“ã®ãƒšãƒ¼ã‚¸ã«ã¯éŽåŽ»ã«æ›¸ã‹ã‚ŒãŸã™ã¹ã¦ã®ã‚³ãƒ³ãƒ†ãƒ³ãƒ„ãŒå«ã¾ã‚Œã¦ã„ã¾ã™ã€‚</p>\n</mt:If>\n<mt:If name=\"entry_template\">\n        <p class=\"first\">ã“ã®ãƒšãƒ¼ã‚¸ã¯ã€<$mt:EntryAuthorLink$>ãŒ<$mt:EntryDate format=\"%x %X\"$>ã«æ›¸ã„ãŸè¨˜äº‹ã§ã™ã€‚</p>\n    <mt:EntryPrevious>\n        <p>ã²ã¨ã¤å‰ã®è¨˜äº‹ã¯ã€Œ<a href=\"<$mt:EntryPermalink$>\"><$mt:EntryTitle remove_html=\"1\"$></a>ã€ã§ã™ã€‚</p>\n    </mt:EntryPrevious>\n    <mt:EntryNext>\n        <p>æ¬¡ã®è¨˜äº‹ã¯ã€Œ<a href=\"<$mt:EntryPermalink$>\"><$mt:EntryTitle remove_html=\"1\"$></a>ã€ã§ã™ã€‚</p>\n    </mt:EntryNext>\n</mt:If>\n<mt:If name=\"category_archive\">\n    <mt:If name=\"datebased_archive\">\n        <p class=\"first\">ã“ã®ãƒšãƒ¼ã‚¸ã«ã¯ã€<strong><$mt:ArchiveDate format=\"%B %Y\"$></strong>ä»¥é™ã«æ›¸ã‹ã‚ŒãŸè¨˜äº‹ã®ã†ã¡<strong><$mt:CategoryLabel$></strong>ã‚«ãƒ†ã‚´ãƒªã«å±žã—ã¦ã„ã‚‹ã‚‚ã®ãŒå«ã¾ã‚Œã¦ã„ã¾ã™ã€‚</p>\n        <mt:ArchivePrevious>\n        <p>å‰ã®ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–ã¯<a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$></a>ã§ã™ã€‚</p>\n        </mt:ArchivePrevious>\n        <mt:ArchiveNext>\n        <p>æ¬¡ã®ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–ã¯<a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$></a>ã§ã™ã€‚</p>\n        </mt:ArchiveNext>\n    <mt:Else>\n        <p class=\"first\">ã“ã®ãƒšãƒ¼ã‚¸ã«ã¯ã€éŽåŽ»ã«æ›¸ã‹ã‚ŒãŸè¨˜äº‹ã®ã†ã¡<strong><$mt:CategoryLabel$></strong>ã‚«ãƒ†ã‚´ãƒªã«å±žã—ã¦ã„ã‚‹ã‚‚ã®ãŒå«ã¾ã‚Œã¦ã„ã¾ã™ã€‚</p>\n        <mt:CategoryPrevious>\n        <p>å‰ã®ã‚«ãƒ†ã‚´ãƒªã¯<a href=\"<$mt:CategoryArchiveLink$>\"><$mt:CategoryLabel$></a>ã§ã™ã€‚</p>\n        </mt:CategoryPrevious>\n        <mt:CategoryNext>\n        <p>æ¬¡ã®ã‚«ãƒ†ã‚´ãƒªã¯<a href=\"<$mt:CategoryArchiveLink$>\"><$mt:CategoryLabel$></a>ã§ã™ã€‚</p>\n        </mt:CategoryNext>\n    </mt:If>\n</mt:If>\n<mt:If name=\"author_archive\">\n    <mt:If name=\"datebased_archive\">\n        <p class=\"first\">ã“ã®ãƒšãƒ¼ã‚¸ã«ã¯ã€<strong><$mt:AuthorDisplayName encode_html=\"1\"$></strong>ãŒ<strong><$mt:ArchiveDate format=\"%B %Y\"$></strong>ã«æ›¸ã„ãŸè¨˜äº‹ãŒå«ã¾ã‚Œã¦ã„ã¾ã™ã€‚</p>\n        <mt:ArchivePrevious>\n        <p>å‰ã®ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–ã¯<a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$></a>ã§ã™ã€‚</p>\n        </mt:ArchivePrevious>\n        <mt:ArchiveNext>\n        <p>æ¬¡ã®ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–ã¯<a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$></a>ã§ã™ã€‚</p>\n        </mt:ArchiveNext>\n    <mt:Else>\n        <p class=\"first\">ã“ã®ãƒšãƒ¼ã‚¸ã«ã¯ã€<strong><$mt:AuthorDisplayName encode_html=\"1\"$></strong>ãŒæœ€è¿‘æ›¸ã„ãŸè¨˜äº‹ãŒå«ã¾ã‚Œã¦ã„ã¾ã™ã€‚</p>\n    </mt:If>\n</mt:If>\n<mt:If name=\"datebased_only_archive\">\n        <p class=\"first\">ã“ã®ãƒšãƒ¼ã‚¸ã«ã¯ã€<strong><$mt:ArchiveDate format=\"%B %Y\"$></strong>ã«æ›¸ã‹ã‚ŒãŸè¨˜äº‹ãŒæ–°ã—ã„é †ã«å…¬é–‹ã•ã‚Œã¦ã„ã¾ã™ã€‚</p>\n    <mt:ArchivePrevious>\n        <p>å‰ã®ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–ã¯<a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$></a>ã§ã™ã€‚</p>\n    </mt:ArchivePrevious>\n    <mt:ArchiveNext>\n        <p>æ¬¡ã®ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–ã¯<a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$></a>ã§ã™ã€‚</p>\n    </mt:ArchiveNext>\n</mt:If>\n<mt:If name=\"archive_index\">\n        <p>æœ€è¿‘ã®ã‚³ãƒ³ãƒ†ãƒ³ãƒ„ã¯<a href=\"<$mt:BlogURL$>\">ã‚¤ãƒ³ãƒ‡ãƒƒã‚¯ã‚¹ãƒšãƒ¼ã‚¸</a>ã§è¦‹ã‚‰ã‚Œã¾ã™ã€‚</p>\n<mt:Else>\n        <p>æœ€è¿‘ã®ã‚³ãƒ³ãƒ†ãƒ³ãƒ„ã¯<a href=\"<$mt:BlogURL$>\">ã‚¤ãƒ³ãƒ‡ãƒƒã‚¯ã‚¹ãƒšãƒ¼ã‚¸</a>ã§è¦‹ã‚‰ã‚Œã¾ã™ã€‚éŽåŽ»ã«æ›¸ã‹ã‚ŒãŸã‚‚ã®ã¯<a href=\"<$mt:Link template=\"archive_index\"$>\">ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–ã®ãƒšãƒ¼ã‚¸</a>ã§è¦‹ã‚‰ã‚Œã¾ã™ã€‚</p>\n</mt:If>\n    </div>\n</div>\n</mt:unless>\n','widget',0),(12,1,0,0,1,1,'2020-11-24 14:20:59','html_head',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','HTMLãƒ˜ãƒƒãƒ€ãƒ¼',NULL,1,'<meta http-equiv=\"Content-Type\" content=\"text/html; charset=<$mt:PublishCharset$>\" />\n<meta name=\"generator\" content=\"<$mt:ProductName version=\"1\"$>\" />\n<link rel=\"stylesheet\" href=\"<$mt:Link template=\"styles\"$>\" type=\"text/css\" />\n<link rel=\"start\" href=\"<$mt:BlogURL$>\" title=\"Home\" />\n<link rel=\"alternate\" type=\"application/atom+xml\" title=\"Recent Entries\" href=\"<$mt:Link template=\"feed_recent\"$>\" />\n<script type=\"text/javascript\" src=\"<$mt:Link template=\"javascript\"$>\"></script>\n<$mt:CCLicenseRDF$>\n<$mt:CanonicalLink$>\n<$mt:StatsSnippet$>\n','custom',0),(13,1,0,0,1,1,'2020-11-24 14:20:59','syndication',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','è³¼èª­',NULL,1,'<div class=\"widget-syndication widget\">\n    <div class=\"widget-content\">\n        <ul>\n            <li><img src=\"<$mt:StaticWebPath$>images/status_icons/feed.gif\" alt=\"è³¼èª­ã™ã‚‹\" width=\"9\" height=\"9\" /> <a href=\"<$mt:Link template=\"feed_recent\"$>\">ã‚¦ã‚§ãƒ–ã‚µã‚¤ãƒˆã‚’è³¼èª­</a></li>\n<mt:If name=\"search_results\">\n    <mt:If tag=\"SearchString\">\n            <li class=\"search-results-feed\"><img src=\"<$mt:StaticWebPath$>images/status_icons/feed.gif\" alt=\"è³¼èª­ã™ã‚‹\" width=\"9\" height=\"9\" /> <a href=\"<$mt:CGIPath$><$mt:SearchScript$>?<mt:IfTagSearch>tag<mt:else>search</mt:IfTagSearch>=<$mt:SearchString encode_url=\"1\"$>&amp;Template=feed&amp;IncludeBlogs=<$mt:SearchIncludeBlogs$>&amp;limit=<$mt:SearchMaxResults$>\" title=\"<mt:IfTagSearch>ã€Œ<$mt:SearchString$>ã€ã®æ¤œç´¢çµæžœã‚’è³¼èª­<mt:Else>ã‚¿ã‚°ã€Œ<$mt:SearchString$>ã€ã‚’è³¼èª­</mt:IfTagSearch>\"><mt:IfTagSearch>ã‚¿ã‚°ã€Œ<$mt:SearchString$>ã€ã®ãƒ•ã‚£ãƒ¼ãƒ‰<mt:Else>ã€Œ<$mt:SearchString$>ã€ã‚’æ¤œç´¢ã—ãŸçµæžœã®ãƒ•ã‚£ãƒ¼ãƒ‰</mt:IfTagSearch></a></li>\n    </mt:If>\n</mt:If>\n        </ul>\n    </div>\n</div>\n','widget',0),(14,1,0,0,1,1,'2020-11-24 14:20:59','current_category_monthly_archive_list',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚«ãƒ†ã‚´ãƒªæœˆåˆ¥ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–',NULL,1,'<mt:IfArchiveTypeEnabled archive_type=\"Category-Monthly\">\n    <mt:ArchiveList archive_type=\"Category-Monthly\">\n        <mt:ArchiveListHeader>\n<div class=\"widget-archive-current-category-monthly widget-archive widget\">\n    <h3 class=\"widget-header\"><$mt:CategoryLabel$>: æœˆåˆ¥ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:ArchiveListHeader>\n            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$></a></li>\n        <mt:ArchiveListFooter>\n        </ul>\n    </div>\n</div>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n</mt:IfArchiveTypeEnabled>\n','widget',0),(15,1,0,0,1,1,'2020-11-24 14:20:59','author_archive_list',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ãƒ¦ãƒ¼ã‚¶ãƒ¼ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–',NULL,1,'<mt:IfArchiveTypeEnabled archive_type=\"Author\">\n    <mt:ArchiveList archive_type=\"Author\">\n        <mt:ArchiveListHeader>\n<div class=\"widget-archive widget-archive-author widget\">\n    <h3 class=\"widget-header\">ãƒ¦ãƒ¼ã‚¶ãƒ¼</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:ArchiveListHeader>\n            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$> (<$mt:ArchiveCount$>)</a></li>\n        <mt:ArchiveListFooter>\n        </ul>\n    </div>\n</div>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n</mt:IfArchiveTypeEnabled>\n','widget',0),(16,1,0,0,1,1,'2020-11-24 14:20:59','entry_summary',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','è¨˜äº‹ã®æ¦‚è¦',NULL,1,'<$mt:EntryTrackbackData$>\n<div id=\"entry-<$mt:EntryID$>\" class=\"entry-asset asset hentry\">\n    <div class=\"asset-header\">\n        <h2 class=\"asset-name entry-title\"><a href=\"<$mt:EntryPermalink$>\" rel=\"bookmark\"><$mt:EntryTitle$></a><mt:If name=\"display_blog_name\"> - <a href=\"<$mt:EntryBlogURL$>\"><$mt:EntryBlogName$></a></mt:If></h2>\n        <div class=\"asset-meta\">\n            <span class=\"byline\">\n    <mt:If tag=\"EntryAuthorDisplayName\">\n                <span class=\"vcard author\"><$mt:EntryAuthorLink show_hcard=\"1\"$></span> (<abbr class=\"published\" title=\"<$mt:EntryDate format_name=\"iso8601\"$>\"><$mt:EntryDate format=\"%x %X\"$></abbr>)\n    <mt:Else>\n                <abbr class=\"published\" title=\"<$mt:EntryDate format_name=\"iso8601\"$>\"><$mt:EntryDate format=\"%x %X\"$></abbr>\n    </mt:If>\n            </span>\n<mt:Unless name=\"hide_counts\" eq=\"1\">\n            <mt:IfCommentsActive><span class=\"separator\">|</span> <a href=\"<$mt:EntryPermalink$>#comments\"><$mt:EntryCommentCount singular=\"ã‚³ãƒ¡ãƒ³ãƒˆ(1)\" plural=\"ã‚³ãƒ¡ãƒ³ãƒˆ(#)\" none=\"ã‚³ãƒ¡ãƒ³ãƒˆ(0)\"$></a></mt:IfCommentsActive>\n            <mt:IfPingsActive><span class=\"separator\">|</span> <a href=\"<$mt:EntryPermalink$>#trackbacks\"><$mt:EntryTrackbackCount singular=\"ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯(1)\" plural=\"ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯(#)\" none=\"ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯(0)\"$></a></mt:IfPingsActive>\n</mt:Unless>\n        </div>\n    </div>\n    <div class=\"asset-content entry-content\">\n<mt:If tag=\"EntryBody\">\n        <div class=\"asset-body\">\n            <$mt:EntryBody$>\n        </div>\n</mt:If>\n<mt:If name=\"entry_archive\">\n    <mt:EntryIfTagged>\n        <div class=\"entry-tags\">\n            <h4>ã‚¿ã‚°<span class=\"delimiter\">:</span></h4>\n            <ul>\n                <li><mt:EntryTags glue=\'<span class=\"delimiter\">,</span></li> <li>\'><a href=\"javascript:void(0)\" onclick=\"location.href=\'<$mt:TagSearchLink encode_js=\"1\"$>\';return false;\" rel=\"tag\"><$mt:TagName$></a></mt:EntryTags></li>\n            </ul>\n        </div>\n    </mt:EntryIfTagged>\n</mt:If>\n<mt:If tag=\"EntryMore\" convert_breaks=\"0\">\n        <div class=\"asset-more-link\">\n            ç¶šãã‚’èª­ã‚€: <a href=\"<$mt:EntryPermalink$>#more\" rel=\"bookmark\"><$mt:EntryTitle$></a>\n        </div>\n</mt:If>\n    </div>\n    <div class=\"asset-footer\"></div>\n</div>\n','custom',0),(17,1,0,0,1,1,'2020-11-24 14:20:59','feed_recent',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','æœ€æ–°è¨˜äº‹ã®ãƒ•ã‚£ãƒ¼ãƒ‰','atom.xml',1,'<$mt:HTTPContentType type=\"application/atom+xml\"$><?xml version=\"1.0\" encoding=\"<$mt:PublishCharset$>\"?>\n<feed xmlns=\"http://www.w3.org/2005/Atom\">\n    <title><$mt:BlogName remove_html=\"1\" encode_xml=\"1\"$></title>\n    <link rel=\"alternate\" type=\"text/html\" href=\"<$mt:BlogURL encode_xml=\"1\"$>\" />\n    <link rel=\"self\" type=\"application/atom+xml\" href=\"<$mt:Link template=\"feed_recent\"$>\" />\n    <id>tag:<$mt:BlogHost exclude_port=\"1\" encode_xml=\"1\"$>,<$mt:TemplateCreatedOn format=\"%Y-%m-%d\"$>:<$mt:BlogRelativeURL encode_xml=\"1\"$><$mt:BlogID$></id>\n    <updated><mt:Entries blog_ids=\"children\" include_with_website=\"1\" lastn=\"1\"><$mt:EntryModifiedDate utc=\"1\" format=\"%Y-%m-%dT%H:%M:%SZ\"$></mt:Entries></updated>\n    <mt:If tag=\"BlogDescription\"><subtitle><$mt:BlogDescription remove_html=\"1\" encode_xml=\"1\"$></subtitle></mt:If>\n    <generator uri=\"http://www.sixapart.com/movabletype/\"><$mt:ProductName version=\"1\"$></generator>\n<mt:Entries blog_ids=\"children\" include_with_website=\"1\" lastn=\"15\">\n<entry>\n    <title><$mt:EntryTitle remove_html=\"1\" encode_xml=\"1\"$> - <$mt:EntryBlogName$></title>\n    <link rel=\"alternate\" type=\"text/html\" href=\"<$mt:EntryPermalink encode_xml=\"1\"$>\" />\n    <id><$mt:EntryAtomID$></id>\n\n    <published><$mt:EntryDate utc=\"1\" format=\"%Y-%m-%dT%H:%M:%SZ\"$></published>\n    <updated><$mt:EntryModifiedDate utc=\"1\" format=\"%Y-%m-%dT%H:%M:%SZ\"$></updated>\n\n    <summary><$mt:EntryExcerpt remove_html=\"1\" encode_xml=\"1\"$></summary>\n    <author>\n        <name><$mt:EntryAuthorDisplayName encode_xml=\"1\"$></name>\n        <mt:If tag=\"EntryAuthorURL\"><uri><$mt:EntryAuthorURL encode_xml=\"1\"$></uri></mt:If>\n    </author>\n    <mt:EntryCategories>\n        <category term=\"<$mt:CategoryLabel encode_xml=\"1\"$>\" scheme=\"http://www.sixapart.com/ns/types#category\" />\n    </mt:EntryCategories>\n    <mt:EntryIfTagged><mt:EntryTags><category term=\"<$mt:TagName normalize=\"1\" encode_xml=\"1\"$>\" label=\"<$mt:TagName encode_xml=\"1\"$>\" scheme=\"http://www.sixapart.com/ns/types#tag\" />\n    </mt:EntryTags></mt:EntryIfTagged>\n    <content type=\"html\" xml:lang=\"<$mt:BlogLanguage ietf=\"1\"$>\" xml:base=\"<$mt:BlogURL encode_xml=\"1\"$>\">\n        <$mt:EntryBody encode_xml=\"1\"$>\n        <$mt:EntryMore encode_xml=\"1\"$>\n    </content>\n</entry>\n</mt:Entries>\n</feed>\n','index',0),(18,1,0,0,1,1,'2020-11-24 14:20:59','banner_footer',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ãƒãƒŠãƒ¼ãƒ•ãƒƒã‚¿ãƒ¼',NULL,1,'<div id=\"footer\">\n    <div id=\"footer-inner\">\n        <div id=\"footer-content\">\n            <div class=\"widget-powered widget\">\n                <div class=\"widget-content\">\n                    Powered by <a href=\"http://www.sixapart.jp/movabletype/\"><$MTProductName$></a>\n                </div>\n            </div>\n<mt:BlogIfCCLicense>\n            <div class=\"widget-creative-commons widget\">\n                <div class=\"widget-content\">\n                    ã“ã®ãƒ–ãƒ­ã‚°ã¯<a href=\"<$mt:BlogCCLicenseURL$>\">ã‚¯ãƒªã‚¨ã‚¤ãƒ†ã‚£ãƒ–ãƒ»ã‚³ãƒ¢ãƒ³ã‚º</a>ã§ãƒ©ã‚¤ã‚»ãƒ³ã‚¹ã•ã‚Œã¦ã„ã¾ã™ã€‚\n                </div>\n            </div>\n</mt:BlogIfCCLicense>\n        </div>\n    </div>\n</div>\n','custom',0),(19,1,0,0,1,1,'2020-11-24 14:20:59','recent_comments',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','æœ€è¿‘ã®ã‚³ãƒ¡ãƒ³ãƒˆ',NULL,1,'<mt:If tag=\"BlogCommentCount\" include_blogs=\"children\" include_with_website=\"1\">\n    <mt:Comments lastn=\"10\" sort_order=\"descend\" include_blogs=\"children\" include_with_website=\"1\">\n        <mt:CommentsHeader>\n<div class=\"widget-recent-comments widget\">\n    <h3 class=\"widget-header\">æœ€è¿‘ã®ã‚³ãƒ¡ãƒ³ãƒˆ</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:CommentsHeader>\n            <li><strong><$mt:CommentAuthor$>:</strong> <$mt:CommentBody remove_html=\"1\" words=\"10\"$> <a href=\"<$mt:CommentLink$>\" title=\"<mt:CommentEntry><$mt:EntryTitle$></mt:CommentEntry>ã¸ã®ã‚³ãƒ¡ãƒ³ãƒˆ\">ç¶šãã‚’èª­ã‚€</a></li>\n        <mt:CommentsFooter>\n        </ul>\n    </div>\n</div>\n        </mt:CommentsFooter>\n    </mt:Comments>\n</mt:If>\n','widget',0),(20,1,0,0,1,1,'2020-11-24 14:20:59','sidebar',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚µã‚¤ãƒ‰ãƒãƒ¼',NULL,1,'<mt:Ignore><!-- \n#\n#  The sidebar is made up of one or two columns.\n#  For 2-column designs, just beta.\n#  For 3-column designs, beta and gamma.\n#\n--></mt:Ignore>\n\n\n<div id=\"beta\">\n    <div id=\"beta-inner\">\n\n<mt:If name=\"page_columns\" eq=\"2\">\n    <mt:Ignore><!-- Use the 2-column layout Sidebar if page layout is layout-wt or layout-tw. --></mt:Ignore>\n    <$mt:WidgetSet name=\"2ã‚«ãƒ©ãƒ ã®ã‚µã‚¤ãƒ‰ãƒãƒ¼\"$>\n<mt:Else name=\"page_columns\" eq=\"3\">\n    <mt:Ignore><!-- Use the 3-column layout Primary Sidebar if page layout is layout-wtt or layout-twt. --></mt:Ignore>\n    <$mt:WidgetSet name=\"3ã‚«ãƒ©ãƒ ã®ã‚µã‚¤ãƒ‰ãƒãƒ¼(ãƒ¡ã‚¤ãƒ³)\"$>\n</mt:If>\n\n    </div>\n</div>\n\n\n<mt:If name=\"page_columns\" eq=\"3\">\n    <mt:Ignore><!-- Use the 3-column layout Secondary Sidebar if page layout is layout-wtt or layout-twt. --></mt:Ignore>\n<div id=\"gamma\">\n    <div id=\"gamma-inner\">\n    <$mt:WidgetSet name=\"3ã‚«ãƒ©ãƒ ã®ã‚µã‚¤ãƒ‰ãƒãƒ¼(ã‚µãƒ–)\"$>\n    </div>\n</div>\n</mt:If>\n','custom',0),(21,1,0,0,1,1,'2020-11-24 14:20:59','dynamic_error',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ãƒ€ã‚¤ãƒŠãƒŸãƒƒã‚¯ãƒ‘ãƒ–ãƒªãƒƒã‚·ãƒ³ã‚°ã‚¨ãƒ©ãƒ¼',NULL,1,'<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" id=\"sixapart-standard\">\n<head>\n    <$mt:Include module=\"HTMLãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n    <title><$mt:BlogName encode_html=\"1\"$>: ãƒšãƒ¼ã‚¸ãŒè¦‹ã¤ã‹ã‚Šã¾ã›ã‚“ã€‚</title>\n</head>\n<body id=\"<$mt:WebsiteThemeID$>\" class=\"mt-dynamic-error <$mt:Var name=\"page_layout\"$>\">\n    <div id=\"container\">\n        <div id=\"container-inner\">\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n\n\n            <div id=\"content\">\n                <div id=\"content-inner\">\n\n\n                    <div id=\"alpha\">\n                        <div id=\"alpha-inner\">\n                            <h1 id=\"page-title\">ãƒšãƒ¼ã‚¸ãŒè¦‹ã¤ã‹ã‚Šã¾ã›ã‚“ã€‚</h1>\n                            <blockquote>\n                                <strong><$mt:ErrorMessage$></strong>\n                            </blockquote>\n                        </div>\n                    </div>\n\n\n                    <$mt:Include module=\"ã‚µã‚¤ãƒ‰ãƒãƒ¼\"$>\n\n\n                </div>\n            </div>\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n\n\n        </div>\n    </div>\n</body>\n</html>\n','dynamic_error',0),(22,1,0,0,1,1,'2020-11-24 14:20:59','openid',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','OpenIDå¯¾å¿œ',NULL,1,'<mt:IfRegistrationAllowed type=\"OpenID\">\n<div class=\"widget-openid widget\">\n    <div class=\"widget-content\">\n        <em><strong>OpenID</strong>å¯¾å¿œã—ã¦ã„ã¾ã™</em>\n        <a href=\"https://www.sixapart.jp/about/openid.html\">OpenIDã«ã¤ã„ã¦</a>\n    </div>\n</div>\n</mt:IfRegistrationAllowed>\n','widget',0),(23,1,0,0,1,1,'2020-11-24 14:20:59','category_entry_listing',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚«ãƒ†ã‚´ãƒªåˆ¥è¨˜äº‹ãƒªã‚¹ãƒˆ',NULL,1,'<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" id=\"sixapart-standard\">\n<head>\n    <$mt:Include module=\"HTMLãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n    <title><$mt:BlogName encode_html=\"1\"$>: <$mt:ArchiveTitle$>ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</title>\n<mt:Ignore>\n    <!-- Include Next and Previous links if publishing a date-based archive -->\n</mt:Ignore>\n<mt:If name=\"datebased_archive\">\n    <mt:ArchivePrevious><link rel=\"prev\" href=\"<$mt:ArchiveLink$>\" title=\"<$mt:ArchiveTitle encode_html=\"1\"$>\" /></mt:ArchivePrevious>\n    <mt:ArchiveNext><link rel=\"next\" href=\"<$mt:ArchiveLink$>\" title=\"<$mt:ArchiveTitle encode_html=\"1\"$>\" /></mt:ArchiveNext>\n</mt:If>\n</head>\n<body id=\"<$mt:BlogThemeID$>\" class=\"mt-archive-listing mt-<$mt:Var name=\"archive_class\"$> <$mt:Var name=\"page_layout\"$>\">\n    <div id=\"container\">\n        <div id=\"container-inner\">\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n\n\n            <div id=\"content\">\n                <div id=\"content-inner\">\n\n\n                    <div id=\"alpha\">\n                        <div id=\"alpha-inner\">\n<mt:If name=\"datebased_archive\">\n                            <mt:Ignore><!-- Title for category-monthly entry listings --></mt:Ignore>\n                            <h1 id=\"page-title\" class=\"archive-title\"><$mt:ArchiveTitle$>ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h1>\n<mt:Else>\n                            <mt:Ignore><!-- Title for category entry listings --></mt:Ignore>\n                            <h1 id=\"page-title\" class=\"archive-title\"><em><$mt:ArchiveTitle$></em>ã®æœ€è¿‘ã®è¨˜äº‹</h1>\n</mt:If>\n\n\n<mt:Ignore><!-- Limit number of entries to the number set in Blog Entry Settings --></mt:Ignore>\n<mt:Unless name=\"datebased_archive\"><$mt:Var name=\"limit\" value=\"auto\"$></mt:Unless>\n<mt:Entries limit=\"$limit\">\n                            <mt:Ignore><!-- Use the Entry Summary module for each entry published on this page --></mt:Ignore>\n                            <$mt:Include module=\"è¨˜äº‹ã®æ¦‚è¦\"$>\n</mt:Entries>\n\n\n                            <div class=\"content-nav\">\n                                <mt:ArchivePrevious><a href=\"<$mt:ArchiveLink$>\">&laquo; <$mt:ArchiveTitle$></a> |</mt:ArchivePrevious>\n                                <a href=\"<$mt:Link template=\"main_index\"$>\">ãƒ¡ã‚¤ãƒ³ãƒšãƒ¼ã‚¸</a> |\n                                <a href=\"<$mt:Link template=\"archive_index\"$>\">ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</a>\n                                <mt:ArchiveNext>| <a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$> &raquo;</a></mt:ArchiveNext>\n                            </div>\n\n\n                        </div>\n                    </div>\n\n\n                    <$mt:Include module=\"ã‚µã‚¤ãƒ‰ãƒãƒ¼\"$>\n\n\n                </div>\n            </div>\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n\n\n        </div>\n    </div>\n</body>\n</html>\n','archive',0),(24,1,0,0,1,1,'2020-11-24 14:20:59','pages_list',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ãƒšãƒ¼ã‚¸ä¸€è¦§',NULL,1,'<mt:IfArchiveTypeEnabled archive_type=\"Page\">\n<div class=\"widget-pages widget\">\n    <h3 class=\"widget-header\">ã‚¦ã‚§ãƒ–ãƒšãƒ¼ã‚¸</h3>\n    <div class=\"widget-content\">\n        <ul>\n    <mt:Pages no_folder=\"1\" sort_by=\"title\" sort_order=\"ascend\">\n            <li class=\"page page-<$mt:PageID$>\"><a href=\"<$mt:PagePermalink$>\"><$mt:PageTitle$></a></li>\n    </mt:Pages>\n    <mt:TopLevelFolders>\n            <li class=\"folder folder-<$mt:FolderID$>\"><strong><$mt:FolderLabel$></strong>\n        <mt:Pages sort_by=\"title\" sort_order=\"ascend\">\n            <mt:PagesHeader>\n                <ul>\n            </mt:PagesHeader>\n                    <li class=\"page page-<$mt:PageID$>\"><a href=\"<$mt:PagePermalink$>\"><$mt:PageTitle$></a></li>\n            <mt:PagesFooter>\n                </ul>\n            </mt:PagesFooter>\n        </mt:Pages>\n            </li>\n        <$mt:SubFolderRecurse$>\n    </mt:TopLevelFolders>\n        </ul>\n    </div>\n</div>\n</mt:IfArchiveTypeEnabled>\n','widget',0),(25,1,0,0,1,1,'2020-11-24 14:20:59','comment_response',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚³ãƒ¡ãƒ³ãƒˆå®Œäº†',NULL,1,'<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" id=\"sixapart-standard\">\n<head>\n\n\n<mt:If name=\"comment_confirmation\">\n    <mt:Ignore><!-- Success message when comment has been submitted --></mt:Ignore>\n    <$mt:Var name=\"page_title\" value=\"ç¢ºèª\"$>\n    <$mt:Var name=\"message\" value=\"<p>ã‚³ãƒ¡ãƒ³ãƒˆã‚’æŠ•ç¨¿ã—ã¾ã—ãŸã€‚</p>\"$>\n<mt:Else name=\"comment_pending\">\n    <mt:Ignore><!-- Pending message when comment is being held for review --></mt:Ignore>\n    <$mt:Var name=\"page_title\" value=\"ã‚³ãƒ¡ãƒ³ãƒˆã‚ã‚ŠãŒã¨ã†ã”ã–ã„ã¾ã™ã€‚\"$>\n    <$mt:Var name=\"message\" value=\"<p>ã‚³ãƒ¡ãƒ³ãƒˆã¯ç¾åœ¨æ‰¿èªã•ã‚Œã‚‹ã¾ã§å…¬é–‹ã‚’ä¿ç•™ã•ã‚Œã¦ã„ã¾ã™ã€‚</p>\"$>\n<mt:Else name=\"comment_error\">\n    <mt:Ignore><!-- Error message when comment submission fails --></mt:Ignore>\n    <$mt:Var name=\"page_title\" value=\"ã‚³ãƒ¡ãƒ³ãƒˆæŠ•ç¨¿ã‚¨ãƒ©ãƒ¼\"$>\n    <mt:SetVarBlock name=\"message\"><p>ã‚³ãƒ¡ãƒ³ãƒˆã‚’æŠ•ç¨¿ã§ãã¾ã›ã‚“ã§ã—ãŸã€‚ã‚¨ãƒ©ãƒ¼: <$mt:ErrorMessage encode_html=\"1\"$></p></mt:SetVarBlock>\n</mt:If>\n\n\n    <$mt:Include module=\"HTMLãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n    <title><$mt:BlogName encode_html=\"1\"$>: <$mt:Var name=\"page_title\"$></title>\n</head>\n<body id=\"<$mt:WebsiteThemeID$>\" class=\"<$mt:Var name=\"body_class\"$> <$mt:Var name=\"page_layout\"$>\">\n    <div id=\"container\">\n        <div id=\"container-inner\">\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n\n\n            <div id=\"content\">\n                <div id=\"content-inner\">\n\n\n                    <div id=\"alpha\">\n                        <div id=\"alpha-inner\">\n                            <h1 id=\"page-title\"><$mt:Var name=\"page_title\"$></h1>\n                            <$mt:Var name=\"message\"$>\n                            <p>\n                            <mt:If name=\"comment_error\">\n                                <a href=\"javascript:history.back()\">æˆ»ã‚‹</a>\n                            <mt:Else>\n                                <a href=\"<$mt:EntryLink$>\">å…ƒã®è¨˜äº‹</a>ã«æˆ»ã‚‹\n                            </mt:If>\n                            </p>\n                        </div>\n                    </div>\n\n\n                    <$mt:Include module=\"ã‚µã‚¤ãƒ‰ãƒãƒ¼\"$>\n\n\n                </div>\n            </div>\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n\n\n        </div>\n    </div>\n</body>\n</html>\n','comment_response',0),(26,1,0,0,1,1,'2020-11-24 14:20:59','archive_widgets_group',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–ã‚¦ã‚£ã‚¸ã‚§ãƒƒãƒˆã‚°ãƒ«ãƒ¼ãƒ—',NULL,1,'<mt:Ignore>\n    ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–ã®ç¨®é¡žã«å¿œã˜ã¦ç•°ãªã‚‹å†…å®¹ã‚’è¡¨ç¤ºã™ã‚‹ã‚ˆã†ã«è¨­å®šã•ã‚ŒãŸã‚¦ã‚£ã‚¸ã‚§ãƒƒãƒˆã§ã™ã€‚è©³ç´°: http://www.movabletype.org/documentation/designer/widget-sets.html\n</mt:Ignore>\n<mt:If name=\"category_archive\">\n    <mt:IfArchiveTypeEnabled archive_type=\"Category-Monthly\">\n        <$mt:Include widget=\"ã‚«ãƒ†ã‚´ãƒªæœˆåˆ¥ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–\"$>\n    </mt:IfArchiveTypeEnabled>\n</mt:If>\n<mt:IfArchiveTypeEnabled archive_type=\"Category\">\n    <$mt:Include widget=\"ã‚«ãƒ†ã‚´ãƒªã‚¢ãƒ¼ã‚«ã‚¤ãƒ–\"$>\n</mt:IfArchiveTypeEnabled>\n<mt:IfArchiveTypeEnabled archive_type=\"Monthly\">\n    <$mt:Include widget=\"æœˆåˆ¥ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–\"$>\n</mt:IfArchiveTypeEnabled>\n','widget',0),(27,1,0,0,1,1,'2020-11-24 14:20:59','comment_detail',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚³ãƒ¡ãƒ³ãƒˆè©³ç´°',NULL,1,'<div id=\"comment-<$mt:CommentID$>\" class=\"comment<mt:IfCommentParent> comment-reply</mt:IfCommentParent><mt:IfCommenterIsEntryAuthor> entry-author-comment</mt:IfCommenterIsEntryAuthor>\">\n    <div class=\"inner\">\n        <div class=\"comment-header\">\n            <div class=\"asset-meta\">\n                <span class=\"byline\">\n                    <$mt:CommentAuthorIdentity$>\n<mt:IfCommentParent>\n                    <span class=\"vcard author\"><$mt:CommentAuthorLink$></span>ã‹ã‚‰<a href=\"<mt:CommentParent><$mt:CommentLink$></mt:CommentParent>\"><mt:CommentParent><$mt:CommentAuthor$></mt:CommentParent></a>ã¸ã®è¿”ä¿¡\n<mt:Else>\n                    <span class=\"vcard author\"><$mt:CommentAuthorLink$></span>\n</mt:IfCommentParent>\n                    | <a href=\"<$mt:CommentLink$>\"><abbr class=\"published\" title=\"<$mt:CommentDate format_name=\"iso8601\"$>\"><$mt:CommentDate$></abbr></a>\n<mt:IfCommentsAccepted>\n                    | <$mt:CommentReplyToLink$>\n</mt:IfCommentsAccepted>\n                </span>\n            </div>\n        </div>\n        <div class=\"comment-content\">\n            <$mt:CommentBody$>\n        </div>\n    </div>\n</div>','custom',0),(28,1,0,0,1,1,'2020-11-24 14:20:59','monthly_archive_dropdown',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','æœˆåˆ¥ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–(ãƒ‰ãƒ­ãƒƒãƒ—ãƒ€ã‚¦ãƒ³)',NULL,1,'<mt:IfArchiveTypeEnabled archive_type=\"Monthly\">\n    <mt:ArchiveList archive_type=\"Monthly\">\n        <mt:ArchiveListHeader>\n<div class=\"widget-archive-monthly-dropdown widget-archive widget\">\n   <h3 class=\"widget-header\"><a href=\"<$mt:BlogURL$>archives.html\">ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</a></h3>\n   <div class=\"widget-content\">\n      <select onchange=\"nav(this)\">\n         <option>æœˆã‚’é¸æŠž...</option>\n         </mt:ArchiveListHeader>\n         <option value=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$></option>\n         <mt:ArchiveListFooter>\n      </select>\n   </div>\n</div>\n<script type=\"text/javascript\" charset=\"utf-8\">\n/* <![CDATA[ */\nfunction nav(sel) {\n   if (sel.selectedIndex == -1) return;\n   var opt = sel.options[sel.selectedIndex];\n   if (opt && opt.value)\n      location.href = opt.value;\n}\n/* ]]> */\n</script>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n</mt:IfArchiveTypeEnabled>\n','widget',0),(29,1,0,0,1,1,'2020-11-24 14:20:59','monthly_archive_list',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','æœˆåˆ¥ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–',NULL,1,'<mt:IfArchiveTypeEnabled archive_type=\"Monthly\">\n    <mt:ArchiveList archive_type=\"Monthly\">\n        <mt:ArchiveListHeader>\n<div class=\"widget-archive-monthly widget-archive widget\">\n    <h3 class=\"widget-header\"><$mt:ArchiveTypeLabel$> <a href=\"<$mt:Link template=\"archive_index\"$>\">ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</a></h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:ArchiveListHeader>\n            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$> (<$mt:ArchiveCount$>)</a></li>\n        <mt:ArchiveListFooter>\n        </ul>\n    </div>\n</div>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n</mt:IfArchiveTypeEnabled>\n','widget',0),(30,1,0,0,1,1,'2020-11-24 14:20:59','comment_listing',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚³ãƒ¡ãƒ³ãƒˆä¸€è¦§',NULL,1,'{\n    \"direction\": \"<mt:Var name=\"commentDirection\">\",\n    \"comments\": \"<mt:Comments sort_order=\"$commentDirection\"><$mt:Include module=\"ã‚³ãƒ¡ãƒ³ãƒˆè©³ç´°\" replace=\"\\\",\"\\\\\" replace=\'\"\',\'\\\"\' regex_replace=\"/\\t/g\",\"\\\\t\" strip_linefeeds=\"1\"$></mt:Comments>\",\n    \"cacheKey\": \"<mt:Var name=\"cacheKey\">\"\n}\n','comment_listing',0),(31,1,0,0,1,1,'2020-11-24 14:20:59','category_archive_list',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚«ãƒ†ã‚´ãƒªã‚¢ãƒ¼ã‚«ã‚¤ãƒ–',NULL,1,'<mt:IfArchiveTypeEnabled archive_type=\"Category\">\n<div class=\"widget-archive widget-archive-category widget\">\n    <h3 class=\"widget-header\">ã‚«ãƒ†ã‚´ãƒª</h3>\n    <div class=\"widget-content\">\n    <mt:TopLevelCategories>\n        <mt:SubCatIsFirst>\n        <ul>\n        </mt:SubCatIsFirst>\n        <mt:If tag=\"CategoryCount\">\n            <li><a href=\"<$mt:CategoryArchiveLink$>\"<mt:If tag=\"CategoryDescription\"> title=\"<$mt:CategoryDescription remove_html=\"1\" encode_html=\"1\"$>\"</mt:If>><$mt:CategoryLabel$> (<$mt:CategoryCount$>)</a>\n        <mt:Else>\n            <li><$mt:CategoryLabel$>\n        </mt:If>\n        <$mt:SubCatsRecurse$>\n            </li>\n        <mt:SubCatIsLast>\n        </ul>\n        </mt:SubCatIsLast>\n    </mt:TopLevelCategories>\n    </div>\n</div>\n</mt:IfArchiveTypeEnabled>\n','widget',0),(32,1,0,0,1,1,'2020-11-24 14:20:59','archive_index',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–ã‚¤ãƒ³ãƒ‡ãƒƒã‚¯ã‚¹','archives.html',1,'<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" id=\"sixapart-standard\">\n<head>\n    <$mt:Include module=\"HTMLãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n    <title><$mt:BlogName encode_html=\"1\"$>: ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</title>\n</head>\n<body id=\"<$mt:BlogThemeID$>\" class=\"mt-archive-index <$mt:Var name=\"page_layout\"$>\">\n    <div id=\"container\">\n        <div id=\"container-inner\">\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n\n\n            <div id=\"content\">\n                <div id=\"content-inner\">\n\n\n                    <div id=\"alpha\">\n                        <div id=\"alpha-inner\">\n\n                            <h1 id=\"page-title\" class=\"archive-title\">ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h1>\n\n<mt:Ignore>\n    <!-- List of monthly archives, if monthly archives are enabled -->\n</mt:Ignore>\n<mt:IfArchiveTypeEnabled archive_type=\"Monthly\">\n                            <div class=\"archive-monthly archive-date-based archive\">\n    <mt:ArchiveList archive_type=\"Monthly\">\n        <mt:ArchiveListHeader>\n                                <h2 class=\"archive-header\">æœˆåˆ¥ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h2>\n                                <div class=\"archive-content\">\n                                    <ul>\n        </mt:ArchiveListHeader>\n                                        <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$></a></li>\n        <mt:ArchiveListFooter>\n                                    </ul>\n                                </div>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n                            </div>\n</mt:IfArchiveTypeEnabled>\n\n\n<mt:Ignore>\n    <!-- List of category archives, if category archives are enabled -->\n</mt:Ignore>\n<mt:IfArchiveTypeEnabled archive_type=\"Category\">\n                            <div class=\"archive-category archive\">\n                                <h2 class=\"archive-header\">ã‚«ãƒ†ã‚´ãƒª</h2>\n                                <div class=\"archive-content\">\n    <mt:TopLevelCategories>\n        <mt:SubCatIsFirst>\n                                    <ul>\n        </mt:SubCatIsFirst>\n        <mt:If tag=\"CategoryCount\">\n                                        <li><a href=\"<$mt:CategoryArchiveLink$>\" title=\"<$mt:CategoryDescription$>\"><$mt:CategoryLabel$></a>\n        <mt:Else>\n                                        <li><$mt:CategoryLabel$>\n        </mt:If>\n        <$mt:SubCatsRecurse$>\n                                        </li>\n        <mt:SubCatIsLast>\n                                    </ul>\n        </mt:SubCatIsLast>\n    </mt:TopLevelCategories>\n                                </div>\n                            </div>\n</mt:IfArchiveTypeEnabled>\n\n\n<mt:Ignore>\n    <!-- List of author archives, if category author are enabled -->\n    <mt:IfArchiveTypeEnabled archive_type=\"Author\">\n                                <div class=\"archive-author archive\">\n        <mt:ArchiveList archive_type=\"Author\">\n            <mt:ArchiveListHeader>\n                                    <h2 class=\"archive-header\">ãƒ¦ãƒ¼ã‚¶ãƒ¼ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h2>\n                                    <div class=\"archive-content\">\n                                        <ul>\n            </mt:ArchiveListHeader>\n                                            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$></a></li>\n            <mt:ArchiveListFooter>\n                                        </ul>\n                                    </div>\n            </mt:ArchiveListFooter>\n        </mt:ArchiveList>\n                                </div>\n    </mt:IfArchiveTypeEnabled>\n</mt:Ignore>\n\n\n<mt:Ignore>\n    <!-- List of category archives by month, if category archives are enabled -->\n    <mt:IfArchiveTypeEnabled archive_type=\"Category-Monthly\">\n                                <div class=\"archive-category-monthly archive\">\n        <mt:ArchiveList archive_type=\"Category-Monthly\">\n            <mt:ArchiveListHeader>\n                                    <h2 class=\"archive-header\">æœˆåˆ¥ã‚«ãƒ†ã‚´ãƒªã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h2>\n                                    <div class=\"archive-content\">\n                                        <ul>\n            </mt:ArchiveListHeader>\n                                            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$></a></li>\n            <mt:ArchiveListFooter>\n                                        </ul>\n                                    </div>\n            </mt:ArchiveListFooter>\n        </mt:ArchiveList>\n                                </div>\n    </mt:IfArchiveTypeEnabled>\n</mt:Ignore>\n\n\n<mt:Ignore>\n    <!-- List of author archives, if category archives are enabled -->\n    <mt:IfArchiveTypeEnabled archive_type=\"Author-Monthly\">\n                                <div class=\"archive-author-monthly archive\">\n        <mt:ArchiveList archive_type=\"Author-Monthly\">\n            <mt:ArchiveListHeader>\n                                    <h2 class=\"archive-header\">æœˆåˆ¥ãƒ¦ãƒ¼ã‚¶ãƒ¼ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h2>\n                                    <div class=\"archive-content\">\n                                        <ul>\n            </mt:ArchiveListHeader>\n                                            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$></a></li>\n            <mt:ArchiveListFooter>\n                                        </ul>\n                                    </div>\n            </mt:ArchiveListFooter>\n        </mt:ArchiveList>\n                                </div>\n    </mt:IfArchiveTypeEnabled>\n</mt:Ignore>\n\n\n<mt:Ignore>\n    <!-- List of entry archives, if entry archives are enabled -->\n<mt:IfArchiveTypeEnabled archive_type=\"Individual\">\n                            <div class=\"archive-individual archive-date-based archive\">\n    <mt:ArchiveList archive_type=\"Individual\">\n        <mt:ArchiveListHeader>\n                                <div class=\"archive-content\">\n                                    <ul>\n        </mt:ArchiveListHeader>\n                                        <li><$mt:ArchiveDate format=\"%Y.%m.%d\"$>: <a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$></a></li>\n        <mt:ArchiveListFooter>\n                                    </ul>\n                                </div>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n                            </div>\n</mt:IfArchiveTypeEnabled>\n</mt:Ignore>\n\n\n                        </div>\n                    </div>\n\n\n                    <$mt:Include module=\"ã‚µã‚¤ãƒ‰ãƒãƒ¼\"$>\n\n\n                </div>\n            </div>\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n\n\n        </div>\n    </div>\n</body>\n</html>\n','index',0),(33,1,0,0,1,1,'2020-11-24 14:20:59','rsd',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','RSD','rsd.xml',1,'<$mt:HTTPContentType type=\"application/rsd+xml\"$><?xml version=\"1.0\"?>\n<rsd version=\"1.0\" xmlns=\"http://archipelago.phrasewise.com/rsd\">\n<service>\n<engineName><$mt:ProductName version=\"1\"$></engineName>\n<engineLink>http://www.sixapart.com/movabletype/</engineLink>\n<homePageLink><$mt:BlogURL$></homePageLink>\n<apis>\n<api name=\"MetaWeblog\" preferred=\"true\" apiLink=\"<$mt:CGIPath$><$mt:XMLRPCScript$>\" blogID=\"<$mt:BlogID$>\" />\n<api name=\"MovableType\" preferred=\"false\" apiLink=\"<$mt:CGIPath$><$mt:XMLRPCScript$>\" blogID=\"<$mt:BlogID$>\" />\n<api name=\"Blogger\" preferred=\"false\" apiLink=\"<$mt:CGIPath$><$mt:XMLRPCScript$>\" blogID=\"<$mt:BlogID$>\" />\n<api name=\"Atom\" preferred=\"false\" apiLink=\"<$mt:CGIPath$><$mt:AtomScript$>/weblog\" blogID=\"<$mt:BlogID$>\" />\n</apis>\n</service>\n</rsd>\n','index',0),(34,1,0,0,1,1,'2020-11-24 14:20:59','blogs',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ãƒ–ãƒ­ã‚°',NULL,1,'<mt:Blogs include_blogs=\"children\">\n    <mt:If name=\"__first__\">\n<div class=\"widget-blogs widget-archives widget\">\n    <h3 class=\"widget-header\">ãƒ–ãƒ­ã‚°</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:If>\n            <li><a href=\"<$mt:BlogURL$>\"><$mt:BlogName$></a></li>\n        <mt:If name=\"__last__\">\n        </ul>\n    </div>\n</div>\n        </mt:If>\n</mt:Blogs>\n','widget',0),(35,1,0,0,1,1,'2020-11-24 14:20:59','comments',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚³ãƒ¡ãƒ³ãƒˆ',NULL,1,'<mt:Ignore>\n<!-- Display comments for the entry/page or commenting form if entry/page is accepting comments -->\n</mt:Ignore>\n<mt:IfCommentsActive>\n\n<div id=\"comments\" class=\"comments\">\n\n\n    <mt:Ignore>\n    <!-- Display comments -->\n    </mt:Ignore>\n    <mt:Comments lastn=\"$comments_per_page\">\n        <mt:CommentsHeader>\n    <h2 class=\"comments-header\"><$mt:EntryCommentCount singular=\"ã‚³ãƒ¡ãƒ³ãƒˆ(1)\" plural=\"ã‚³ãƒ¡ãƒ³ãƒˆ(#)\" none=\"ã‚³ãƒ¡ãƒ³ãƒˆ(0)\"$></h2>\n            <mt:If tag=\"EntryCommentCount\" gt=\"$comments_per_page\">\n    <ul id=\"top-comment-nav\">\n        <li id=\"top-prev-comments\">\n            <a href=\"javascript://\" id=\"top-prev-comments-link\" title=\"å‰\">&lt;&lt;&nbsp;å‰</a>\n        </li>\n        <li id=\"top-num-comments\">\n            <span id=\"top-current-comments\"></span>\n        </li>\n        <li id=\"top-next-comments\">\n            <a href=\"javascript://\" id=\"top-next-comments-link\" title=\"æ¬¡\">æ¬¡&nbsp;&gt;&gt;</a>\n        </li>\n    </ul>\n            </mt:If>\n    <div id=\"comments-content\" class=\"comments-content\">\n        </mt:CommentsHeader>\n        <$mt:Include module=\"ã‚³ãƒ¡ãƒ³ãƒˆè©³ç´°\"$>\n        <mt:CommentsFooter>\n    </div>\n            <mt:If tag=\"EntryCommentCount\" gt=\"$comments_per_page\">\n                <mt:Ignore>ãƒšãƒ¼ã‚¸ãƒãƒ¼ã‚·ãƒ§ãƒ³ã‚¹ã‚¯ãƒªãƒ—ãƒˆã«ã‚ˆã£ã¦å¤‰æ›´ã•ã‚Œã¦ã„ã¾ã™ã€‚</mt:Ignore>\n    <ul id=\"comment-nav\">\n        <li id=\"prev-comments\">\n            <a href=\"javascript://\" id=\"prev-comments-link\" title=\"å‰\">&lt;&lt;&nbsp;å‰</a>\n        </li>\n        <li id=\"num-comments\">\n            <span id=\"current-comments\"></span>\n        </li>\n        <li id=\"next-comments\">\n            <a href=\"javascript://\" id=\"next-comments-link\" title=\"æ¬¡\">æ¬¡&nbsp;&gt;&gt;</a>\n        </li>\n    </ul>\n            </mt:If>\n        </mt:CommentsFooter>\n    </mt:Comments>\n    <mt:Ignore>\n    <!-- Display commenting form if entry/page is accepting comments -->\n    </mt:Ignore>\n    <mt:IfCommentsAccepted>\n    <div class=\"comments-open\" id=\"comments-open\">\n        <h2 class=\"comments-open-header\">ã‚³ãƒ¡ãƒ³ãƒˆã™ã‚‹</h2>\n        <div class=\"comments-open-content\">\n\n        <mt:Ignore>\n        <!-- Display greeting for users if blog allows users to register locally -->\n        </mt:Ignore>\n            <div id=\"comment-greeting\"></div>\n\n            <form method=\"post\" action=\"<$mt:CGIPath$><$mt:CommentScript$>\" name=\"comments_form\" id=\"comments-form\" onsubmit=\"return mtCommentOnSubmit(this)\">\n                <input type=\"hidden\" name=\"static\" value=\"1\" />\n                <input type=\"hidden\" name=\"entry_id\" value=\"<$mt:EntryID$>\" />\n                <input type=\"hidden\" name=\"__lang\" value=\"<$mt:BlogLanguage$>\" />\n                <input type=\"hidden\" name=\"parent_id\" value=\"<$mt:CommentParentID escape=\"html\"$>\" id=\"comment-parent-id\" />\n                <input type=\"hidden\" name=\"armor\" value=\"1\" />\n                <input type=\"hidden\" name=\"preview\" value=\"\" />\n                <input type=\"hidden\" name=\"sid\" value=\"\" />\n                <div id=\"comments-open-data\">\n                    <div id=\"comment-form-name\">\n                        <label for=\"comment-author\">åå‰</label>\n                        <input id=\"comment-author\" name=\"author\" size=\"30\" value=\"\" onfocus=\"mtCommentFormOnFocus()\" />\n                    </div>\n                    <div id=\"comment-form-email\">\n                        <label for=\"comment-email\">é›»å­ãƒ¡ãƒ¼ãƒ«</label>\n                        <input id=\"comment-email\" name=\"email\" size=\"30\" value=\"\" onfocus=\"mtCommentFormOnFocus()\" />\n                    </div>\n                    <div id=\"comment-form-url\">\n                        <label for=\"comment-url\">URL</label>\n                        <input id=\"comment-url\" name=\"url\" size=\"30\" value=\"\" onfocus=\"mtCommentFormOnFocus()\" />\n                    </div>\n                    <div id=\"comment-form-remember-me\">\n                        <input type=\"checkbox\" id=\"comment-bake-cookie\" name=\"bakecookie\" onclick=\"mtRememberMeOnClick(this)\" value=\"1\" accesskey=\"r\" />\n                        <label for=\"comment-bake-cookie\">ã‚µã‚¤ãƒ³ã‚¤ãƒ³æƒ…å ±ã‚’è¨˜æ†¶</label>\n                    </div>\n                </div>\n                <div id=\"comment-form-reply\" style=\"display:none\">\n                    <input type=\"checkbox\" id=\"comment-reply\" name=\"comment_reply\" value=\"\" onclick=\"mtSetCommentParentID()\" />\n                    <label for=\"comment-reply\" id=\"comment-reply-label\"></label>\n                </div>\n                <div id=\"comments-open-text\">\n                    <label for=\"comment-text\">ã‚³ãƒ¡ãƒ³ãƒˆ\n                    <mt:IfAllowCommentHTML>(ã‚¹ã‚¿ã‚¤ãƒ«ç”¨ã®HTMLã‚¿ã‚°ã‚’ä½¿ãˆã¾ã™)</mt:IfAllowCommentHTML></label>\n                    <textarea id=\"comment-text\" name=\"text\" rows=\"15\" cols=\"50\" onfocus=\"mtCommentFormOnFocus()\"></textarea>\n                </div>\n                <div id=\"comments-open-captcha\"></div>\n                <div id=\"comments-open-footer\">\n                    <input type=\"submit\" accesskey=\"v\" name=\"preview_button\" id=\"comment-preview\" value=\"ãƒ—ãƒ¬ãƒ“ãƒ¥ãƒ¼\" onclick=\"this.form.preview.value=\'1\';\" />\n                    <input type=\"submit\" accesskey=\"s\" name=\"post\" id=\"comment-submit\" value=\"æŠ•ç¨¿\" />\n                </div>\n            </form>\n\n\n        </div>\n    </div>\n    <script type=\"text/javascript\">\n    <!--\n    mtAttachEvent(\"load\", mtEntryOnLoad);\n    mtAttachEvent(\"unload\", mtEntryOnUnload);\n    //-->\n    </script>\n    </mt:IfCommentsAccepted>\n\n\n</div>\n</mt:IfCommentsActive>\n','custom',0),(36,1,0,0,1,1,'2020-11-24 14:20:59','javascript',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','JavaScript','mt.js',1,'<mt:Ignore>\n/*  The following functions and variables are here to support legacy MT templates.\n    If you have refreshed your JavaScript template but still use older MT comment\n    templates, you may need to uncomment this block in order for those templates \n    to work properly. To use, simply remove the \'mt:Ignore\' tags wrapping this\n    block of code.\n*/\n    function hideDocumentElement(id) { return mtHide(id) }\n    function showDocumentElement(id) { return mtShow(id) }\n    function individualArchivesOnLoad() { return mtEntryOnLoad() }\n    function writeCommenterGreeting() { return mtShowGreeting() }\n    function rememberMe(f) { return mtRememberMe(f) }\n    function forgetMe(f) { return mtForgetMe(f) }\n    var commenter_name;\n    var commenter_id;\n    var commenter_url;\n    var commenter_blog_ids;\n    var mtcmtmail;\n    var mtcmtauth;\n    var mtcmthome;\n    var captcha_timer;\n</mt:Ignore>\n\n// The cookie name to use for storing the blog-side comment session cookie.\nvar mtCookieName = \"<$mt:UserSessionCookieName$>\";\nvar mtCookieDomain = \"<$mt:UserSessionCookieDomain$>\";\nvar mtCookiePath = \"<$mt:UserSessionCookiePath$>\";\nvar mtCookieTimeout = <$mt:UserSessionCookieTimeout$>;\n\n<mt:Ignore>\n/***\n * Simple routine for showing a DOM element (applying a CSS display\n * attribute of \'none\').\n */\n</mt:Ignore>\nfunction mtHide(id) {\n    var el = (typeof id == \"string\") ? document.getElementById(id) : id;\n    if (el) el.style.display = \'none\';\n}\n\n<mt:Ignore>\n/***\n * Simple routine for showing a DOM element (applying a CSS display\n * attribute of \'block\').\n */\n</mt:Ignore>\nfunction mtShow(id) {\n    var el = (typeof id == \"string\") ? document.getElementById(id) : id;\n    if (el) el.style.display = \'block\';\n}\n\n<mt:Ignore>\n/***\n * A utility function for assigning/adding handlers to window events.\n */\n</mt:Ignore>\nfunction mtAttachEvent(eventName,func) {\n    var onEventName = \'on\' + eventName;\n    var old = window[onEventName];\n    if( typeof old != \'function\' )\n        window[onEventName] = func;\n    else {\n        window[onEventName] = function( evt ) {\n            old( evt );\n            return func( evt );\n        };\n    }\n}\n\n<mt:Ignore>\n/***\n * Calls the event named, if there are handlers for it.\n */\n</mt:Ignore>\nfunction mtFireEvent(eventName,param) {\n    var fn = window[\'on\' + eventName];\n    if (typeof fn == \'function\') return fn(param);\n    return;\n}\n\nif(!this.JSON){JSON={};}(function(){function f(n){return n<10?\'0\'+n:n;}if(typeof Date.prototype.toJSON!==\'function\'){Date.prototype.toJSON=function(key){return this.getUTCFullYear()+\'-\'+f(this.getUTCMonth()+1)+\'-\'+f(this.getUTCDate())+\'T\'+f(this.getUTCHours())+\':\'+f(this.getUTCMinutes())+\':\'+f(this.getUTCSeconds())+\'Z\';};String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(key){return this.valueOf();};}var cx=/[\\u0000\\u00ad\\u0600-\\u0604\\u070f\\u17b4\\u17b5\\u200c-\\u200f\\u2028-\\u202f\\u2060-\\u206f\\ufeff\\ufff0-\\uffff]/g,escapable=/[\\\\\\\"\\x00-\\x1f\\x7f-\\x9f\\u00ad\\u0600-\\u0604\\u070f\\u17b4\\u17b5\\u200c-\\u200f\\u2028-\\u202f\\u2060-\\u206f\\ufeff\\ufff0-\\uffff]/g,gap,indent,meta={\'\\b\':\'\\\\b\',\'\\t\':\'\\\\t\',\'\\n\':\'\\\\n\',\'\\f\':\'\\\\f\',\'\\r\':\'\\\\r\',\'\"\':\'\\\\\"\',\'\\\\\':\'\\\\\\\\\'},rep;function quote(string){escapable.lastIndex=0;return escapable.test(string)?\'\"\'+string.replace(escapable,function(a){var c=meta[a];return typeof c===\'string\'?c:\'\\\\u\'+(\'0000\'+a.charCodeAt(0).toString(16)).slice(-4);})+\'\"\':\'\"\'+string+\'\"\';}function str(key,holder){var i,k,v,length,mind=gap,partial,value=holder[key];if(value&&typeof value===\'object\'&&typeof value.toJSON===\'function\'){value=value.toJSON(key);}if(typeof rep===\'function\'){value=rep.call(holder,key,value);}switch(typeof value){case\'string\':return quote(value);case\'number\':return isFinite(value)?String(value):\'null\';case\'boolean\':case\'null\':return String(value);case\'object\':if(!value){return\'null\';}gap+=indent;partial=[];if(Object.prototype.toString.apply(value)===\'[object Array]\'){length=value.length;for(i=0;i<length;i+=1){partial[i]=str(i,value)||\'null\';}v=partial.length===0?\'[]\':gap?\'[\\n\'+gap+partial.join(\',\\n\'+gap)+\'\\n\'+mind+\']\':\'[\'+partial.join(\',\')+\']\';gap=mind;return v;}if(rep&&typeof rep===\'object\'){length=rep.length;for(i=0;i<length;i+=1){k=rep[i];if(typeof k===\'string\'){v=str(k,value);if(v){partial.push(quote(k)+(gap?\': \':\':\')+v);}}}}else{for(k in value){if(Object.hasOwnProperty.call(value,k)){v=str(k,value);if(v){partial.push(quote(k)+(gap?\': \':\':\')+v);}}}}v=partial.length===0?\'{}\':gap?\'{\\n\'+gap+partial.join(\',\\n\'+gap)+\'\\n\'+mind+\'}\':\'{\'+partial.join(\',\')+\'}\';gap=mind;return v;}}if(typeof JSON.stringify!==\'function\'){JSON.stringify=function(value,replacer,space){var i;gap=\'\';indent=\'\';if(typeof space===\'number\'){for(i=0;i<space;i+=1){indent+=\' \';}}else if(typeof space===\'string\'){indent=space;}rep=replacer;if(replacer&&typeof replacer!==\'function\'&&(typeof replacer!==\'object\'||typeof replacer.length!==\'number\')){throw new Error(\'JSON.stringify\');}return str(\'\',{\'\':value});};}if(typeof JSON.parse!==\'function\'){JSON.parse=function(text,reviver){var j;function walk(holder,key){var k,v,value=holder[key];if(value&&typeof value===\'object\'){for(k in value){if(Object.hasOwnProperty.call(value,k)){v=walk(value,k);if(v!==undefined){value[k]=v;}else{delete value[k];}}}}return reviver.call(holder,key,value);}cx.lastIndex=0;if(cx.test(text)){text=text.replace(cx,function(a){return\'\\\\u\'+(\'0000\'+a.charCodeAt(0).toString(16)).slice(-4);});}if(/^[\\],:{}\\s]*$/.test(text.replace(/\\\\(?:[\"\\\\\\/bfnrt]|u[0-9a-fA-F]{4})/g,\'@\').replace(/\"[^\"\\\\\\n\\r]*\"|true|false|null|-?\\d+(?:\\.\\d*)?(?:[eE][+\\-]?\\d+)?/g,\']\').replace(/(?:^|:|,)(?:\\s*\\[)+/g,\'\'))){j=eval(\'(\'+text+\')\');return typeof reviver===\'function\'?walk({\'\':j},\'\'):j;}throw new SyntaxError(\'JSON.parse\');};}}());\n\nvar MT = window.MT || {};\n\nMT.cons = function () {\n  return {\n    LOG : \'log\',\n    WARN : \'warn\',\n    DEBUG : \'debug\',\n    INFO : \'info\',\n    ERR : \'error\',\n    JSON : \'json\'\n  };\n}();\n\n<mt:Ignore>\n/**\n * Used for base functionality related to MT\n * \n * @package MT\n * @class core\n * @global\n * @param {Object} o optional configuration object\n * Options:\n */\n</mt:Ignore>\nMT.core = function (o) {\n  var _debug = false;\n  \n  return {\n    <mt:Ignore>\n    /**\n     * Makes remote call and handles response\n     * \n     * @param {String} url The URL endpoint\n     * @param {String} respType The type of response expected\n     * @param {Function} respHandler The function to handle the response\n     * @return void\n     */\n    </mt:Ignore>\n    connect : function (url,respType,respHandler) {\n      var xh = mtGetXmlHttp();\n      if (!xh) return false;\n      \n      xh.onreadystatechange = function() {\n        if ( xh.readyState == 4 ) {\n          if ( xh.status && ( xh.status != 200 ) ) {\n            // error - ignore\n          } else {\n            switch (respType) {\n              case \'json\':\n                respHandler(JSON.parse(xh.responseText));\n                break;\n                \n              case \'xml\':\n                break;\n                \n              case \'text\':\n                break;\n            }\n          }\n        }\n      };\n      \n      xh.open(\'GET\',url);\n      xh.send(null);\n    },\n    \n    getEl : function (el) {\n      return MT.util.checkNodeType(el)===\'element\' ? id : (document.getElementById(el) || false);\n    },\n    \n    addEvent : function (el,type,func,obj) {\n      if(!obj && document.addEventListener) {\n        el.addEventListener(type,func,false);\n      } else if(obj && document.addEventListener) {\n        el.addEventListener(type,function () {\n          func.call(obj,event);\n        },false);\n      } else {\n        if(obj) {\n          el.attachEvent(\'on\' + type,function () {\n            func.call(obj,event);\n          });\n        } else {\n          el.attachEvent(\'on\' + type,function () {          \n            func.call(el,event);\n          });\n        }\n      }\n    },\n    \n    <mt:Ignore>\n    /**\n     * Basic logging function\n     * \n     * @param {String} level The log level (WARN|DEBUG|INFO|ERROR|LOG)\n     * Specified by one of the MT constants\n     * @param {String} msg The log message\n     * @return void\n     */\n    </mt:Ignore>\n    log : function (level,msg) {\n      if(_debug && window.console) {\n        switch(level) {\n          case \'warn\':\n          case \'debug\':\n          case \'info\':\n          case \'error\':\n          case \'log\':\n            console[level](msg);\n            break;\n            \n          default:\n            return false; \n        }\n      } else {\n        return false;\n      }\n    }\n  }\n}();\n\n<mt:Ignore>\n/**\n * Utilities class\n * \n * @package MT\n * @class util\n * @global\n * Options:\n */\n</mt:Ignore>\nMT.util = function () {\n  return {\n    toggleVisibility : {\n      show : function () {\n        var i = arguments.length;\n        \n        while(i--) {\n          if(MT.util.checkNodeType(arguments[i])===\'element\') {\n            arguments[i].style.visibility = \'visible\';\n          } else {\n            MT.core.getEl(arguments[i]).style.visibility = \'visible\';\n          }\n        }\n      },\n      \n      hide : function () {\n        var i = arguments.length;\n        while(i--) {\n          if(MT.util.checkNodeType(arguments[i])===\'element\') {\n            arguments[i].style.visibility = \'hidden\';\n          } else {\n            MT.core.getEl(arguments[i]).style.visibility = \'hidden\';\n          }\n        }\n      }\n    },\n    \n    toggleDisplay : {\n      show : function () {\n        var i = arguments.length;\n        while(i--) {\n          if(MT.util.checkNodeType(arguments[i])===\'element\') {\n            arguments[i].style.display = \'\';\n          } else {\n            MT.core.getEl(arguments[i]).style.display = \'\';\n          }\n        }\n      },\n      \n      hide : function () {\n        var i = arguments.length;\n        while(i--) {\n          if(MT.util.checkNodeType(arguments[i])===\'element\') {\n            arguments[i].style.display = \'none\';\n          } else {\n            MT.core.getEl(arguments[i]).style.display = \'none\';\n          }\n        }\n      }\n    },\n    \n    <mt:Ignore>\n    /**\n     * Finds the nearest defining (i.e. with an id) parent to the given element\n     * \n     * @param {HTMLElement} origin the node from which to start the search\n     * @return {HTMLElement|Boolean} The parent node with an id attribute or false\n     */\n    </mt:Ignore>\n    findDefiningParent : function (origin) {\n      if(MT.util.checkNodeType(origin)===\'element\') {\n        for(var node=origin.parentNode;node.parentNode;node=node.parentNode) {\n          if((node.hasAttribute && node.hasAttribute(\'id\')) || node.getAttribute(\'id\')) {\n            return node;\n          }\n        }\n      }\n      return false;\n    },\n    \n    <mt:Ignore>\n    /**\n     * Tests objects to verify if they are DOM nodes\n     * \n     * @param {Object} obj The object to be tested\n     * @return {String} the values \'element\'|\'textnode\'|\'whitespace\'\n     */\n    </mt:Ignore>\n    checkNodeType : function (obj) {\n      if (obj && obj.nodeName){\n        switch (obj.nodeType) {\n          case 1: return \'element\';\n          case 3: return (/\\S/).test(obj.nodeValue) ? \'textnode\' : \'whitespace\';\n        }\n      }\n    }\n  }\n}();\n\n<mt:Ignore>\n/**\n * mtPaginateComments takes the currently generated static page and either:\n *  - Attempts to find an individual comment link in the query string\n *  - If no link is found, the static page loads\n * In either case, the pagination event is set\n */\n</mt:Ignore>\n(function () {\n  var M = MT.core,\n      c = MT.cons,\n      u = MT.util,\n      cache,\n      isLoading,\n      direction,\n      currentComments,\n      commentAnchor,\n      commentArrId,\n      commentsPerPage,\n      commentsTotalPages,\n      loadingIcon,\n      pageNum,\n      commentsOffset,\n      totalComments,\n      entryID,\n      commentContentDiv,\n      topNav,\n      nav,\n      currentCommentsSpan,\n      topCurrentCommentsSpan;\n            \n  M.addEvent(window,\'load\',_init);\n  \n  /**\n   * Initializes the class\n   * \n   * @return void\n   */\n  function _init () {\n    if(!MT.entryCommentCount) {\n      return;\n    }\n    \n    _initializeVariables();\n    _setCommentOffset(false);\n    _checkForAnchor();\n		_setCurrentComments();\n    _toggleNavLinks();\n    _initializeEvents();\n  }\n  \n  <mt:Ignore>\n  /**\n   * Initializes variables to their initial values\n   * \n   * @return void\n   */\n  </mt:Ignore>\n  function _initializeVariables() {\n    cache = {};\n    isLoading = false;\n    commentAnchor = \'\';\n    commentArrId = \'\';\n    commentsPerPage = MT.commentsPerPage || 50;\n    currentComments = \'\';\n    direction = \'ascend\';\n    entryID = MT.entryID;\n    totalComments = MT.entryCommentCount;\n    commentsTotalPages = Math.ceil(totalComments / commentsPerPage);\n    pageNum = 1;\n    \n    loadingIcon = \"<img title=\'Loading...\' src=\'<$MTStaticWebPath$>images/indicator.white.gif\' alt=\'Loading\' />\";\n    \n    commentContentDiv = M.getEl(\"comments-content\");\n    topNav = M.getEl(\"top-comment-nav\");\n    nav = M.getEl(\"comment-nav\");\n    \n    currentCommentsSpan = M.getEl(\"current-comments\");\n    topCurrentCommentsSpan = M.getEl(\"top-current-comments\");\n  }\n  \n  function _initializeEvents() {\n    if (commentsPerPage < totalComments) {\n      M.addEvent(nav,\'click\',_handleEvents);\n      M.addEvent(topNav,\'click\',_handleEvents);\n    }\n  }\n  \n  <mt:Ignore>\n  /**\n   * Checks for an existing anchor tag in the query string\n   * If found, it looks for it on the current page\n   * If that fails, it tries to find it in comment list and loads\n   * the desired page\n   * \n   * @return void\n   */\n  </mt:Ignore>\n  function _checkForAnchor() {\n    var found = String(window.location.hash).match( /comment-(\\d{1,6})/ );\n		\n		if (found) {\n		  M.log(c.DEBUG,found);\n			if (!Object.prototype.hasOwnProperty.call(M.getEl(found[0]), \'className\')) {\n				if (_findIdMatch(found[1])) {\n    			pageNum = Math.floor(commentArrId / commentsPerPage) + 1;\n    			M.log(c.DEBUG,\'Comment Array Id: \' + commentArrId);\n    			M.log(c.DEBUG,\'Comments Per Page: \' + commentsPerPage);\n    			M.log(c.DEBUG,\'Page Number: \' + pageNum);\n    			M.log(c.DEBUG,\'Comment Offset: \' + _getCommentOffset());\n    			_updateComments();\n    		}\n			}\n		}\n  }\n  \n  <mt:Ignore>\n  /**\n   * Sets commentsOffset (i.e. the offset number to the remote list)\n   * \n   * @return void\n   */\n  </mt:Ignore>\n  function _setCommentOffset() {\n    commentsOffset = commentsPerPage * (pageNum-1);\n  }\n  \n  <mt:Ignore>\n  /**\n   * Gets the commentsOffset (i.e. the offset number to the remote list)\n   * \n   * @return void\n   */\n  </mt:Ignore>\n  function _getCommentOffset() {\n    return commentsOffset;\n  }\n  \n  <mt:Ignore>\n  /**\n   * General event handler\n   * \n   * @param {Event} e The event object\n   * @return void\n   */\n  </mt:Ignore>\n  function _handleEvents (e) {\n    var origin = e.target || e.srcElement,\n        parentId;\n        \n    // stupid IE\n    origin = origin.id && M.getEl(origin.id) || false;\n\n    if(origin) {\n      parentId = u.checkNodeType(origin.parentNode)===\'element\' && origin.parentNode.getAttribute(\'id\') && origin.parentNode.id;\n    } else {\n      return false;\n    }\n    \n    switch(origin.nodeName) {\n      case \'A\':\n        switch (parentId) {\n          case \'prev-comments\':\n          case \'top-prev-comments\':\n            if(e.preventDefault) {\n              e.preventDefault();\n            } else {\n              e.returnValue =	false;\n            }\n            if(!isLoading) {\n              _previousPage();\n            }\n            break;\n          case \'next-comments\':\n          case \'top-next-comments\':\n            if(e.preventDefault) {\n              e.preventDefault();\n            } else {\n              e.returnValue =	false;\n            }\n            if(!isLoading) {\n              _nextPage();\n            }\n            break;\n        }\n        break;\n    }\n  }\n  \n  <mt:Ignore>\n  /**\n   * Toggles the visibility of the navigation links\n   * \n   * @return void\n   */\n  </mt:Ignore>\n  function _toggleNavLinks () {\n    M.log(c.DEBUG,M.getEl(\'top-prev-comments\'));\n    if(pageNum <= commentsTotalPages && pageNum !== 1) {\n      u.toggleVisibility.show(\'prev-comments\');\n      u.toggleVisibility.show(\'top-prev-comments\');\n    }\n    \n    if(pageNum >= 1 && pageNum !== commentsTotalPages) {\n      u.toggleVisibility.show(\'next-comments\');\n      u.toggleVisibility.show(\'top-next-comments\');\n    }\n    \n    if(pageNum===1 || nav.style.visibility===\'hidden\') {\n      u.toggleVisibility.hide(\'prev-comments\');\n      u.toggleVisibility.hide(\'top-prev-comments\');\n    }\n    \n    if(pageNum===commentsTotalPages || nav.style.visibility===\'hidden\') {\n      u.toggleVisibility.hide(\'next-comments\');\n      u.toggleVisibility.hide(\'top-next-comments\');\n    }\n  }\n  \n  <mt:Ignore>\n  /**\n   * Determines appropriate action based on the id of the parent\n   * clicked link. Decrements pageNum based on id.\n   * \n   * @param {String} id the id of the parent of the clicked link\n   * @return void\n   */\n  </mt:Ignore>\n  function _nextPage () {\n    if(pageNum < commentsTotalPages) {\n      pageNum++;\n      _updateComments();\n    }\n  }\n  \n  <mt:Ignore>\n  /**\n   * Determines appropriate action based on the id of the parent\n   * clicked link. Increments/decrements pageNum based on id.\n   * \n   * @param {String} id the id of the parent of the clicked link\n   * @return void\n   */\n  </mt:Ignore>\n  function _previousPage() {\n    if(pageNum > 1) {\n      pageNum--;\n      _updateComments();\n    }\n  }\n  \n  <mt:Ignore>\n  /**\n   * Searches for a particular comment in the list of ids\n   * \n   * @param {String} id The id for which to search\n   * @return {Boolean} true, if found, false otherwise\n   */\n  </mt:Ignore>\n  function _findIdMatch (id) {\n    var len = MT.commentIds.length;\n    \n  	while (len--) {\n  		if (MT.commentIds[len] == id) {\n  			commentAnchor = \"comment-\" + id;\n  			commentArrId = len;\n  			return true;\n  		}\n  	}\n  	\n  	return false;\n  }\n  \n  <mt:Ignore>\n  /**\n   * Sets the current comment counts on the page\n   *\n   * @return void\n   */\n  </mt:Ignore>\n  function _setCurrentComments() {\n    var commentsOnPage = pageNum != commentsTotalPages ? commentsOffset + commentsPerPage : totalComments;\n    \n    _setCurrentCommentsContent([commentsOffset+1,\" - \",commentsOnPage].join(\'\'));\n  }\n  \n  <mt:Ignore>\n  /**\n   * Sets the \"current-comments\" element with the HTML value\n   * \n   * @param {String|Element} currentCommentsHTML The content to be set\n   * @return void\n   */\n  </mt:Ignore>\n  function _setCurrentCommentsContent(currentCommentsHTML) {\n    currentCommentsSpan.innerHTML = currentCommentsHTML;\n    topCurrentCommentsSpan.innerHTML = currentCommentsHTML;\n  }\n  \n  <mt:Ignore>\n  /**\n   * Sets the content of the comment list\n   * \n   * @param {String|Element} commentHTML The content to be set \n   * @return void\n   */\n  </mt:Ignore>\n  function _setCommentContent(commentHTML) {\n    commentContentDiv.innerHTML = commentHTML;\n  }\n  \n  <mt:Ignore>\n  /**\n   * Builds the appropriate URL to make a remote call to get the\n   * next set of comments\n   * \n   * @return void\n   */\n  </mt:Ignore>\n  function _updateComments() {\n    var comments, jsonUrl, cacheKey, offset;\n    isLoading = true;\n    _setCurrentCommentsContent(loadingIcon);\n    _setCommentOffset();\n\n    offset   = _getCommentOffset();\n    cacheKey = [direction, entryID, commentsPerPage, offset]\n        .join(\'-\')\n        .replace(/[^a-zA-Z0-9-]/g, \'\');\n    jsonUrl  = [\n        \"<$mt:CGIPath$><$mt:CommentScript$>?__mode=comment_listing&direction=\",\n        direction,\n        \"&entry_id=\",\n        entryID,\n        \"&limit=\",\n        commentsPerPage,\n        \"&offset=\",\n        offset,\n        \"&cacheKey=\",\n        cacheKey,\n        \"&jsonp=mtUpdateCommentsCallback\",\n        \"&ts=\",\n        new Date().getTime()\n      ].join(\'\');\n  	\n  	if (!commentAnchor) {\n      commentAnchor = \"comments-content\";\n    }\n\n    if(cache.hasOwnProperty(cacheKey)) {\n      _refreshComments(cache[cacheKey]);\n      isLoading = false;\n    } else {\n      var script = document.createElement(\'script\');\n      script.src = jsonUrl;\n      (document.getElementsByTagName(\'head\'))[0].appendChild(script);\n    }\n  }\n\n  window[\'mtUpdateCommentsCallback\'] = function(json) {\n    cache[json.cacheKey] = json.comments;\n    _refreshComments(json.comments);\n    isLoading = false;\n  }\n  \n  <mt:Ignore>\n  /**\n   * Refreshes the comment data with the current\n   * \n   * @param {String} commentData The data used to replace current comments\n   * @return void\n   */\n  </mt:Ignore>\n  function _refreshComments(commentData) {\n    _setCommentContent(commentData);\n    _setCurrentComments();\n    window.location.hash = \'reset\';\n    window.location.hash = commentAnchor;\n    _toggleNavLinks();\n  }\n})();\n\n<mt:Ignore>\n/***\n * Displays a relative date.\n * \'ts\' is a Date object, \'fds\' is a string of the date which\n * will be displayed if the given date is older than 1 week.\n */\n</mt:Ignore>\nfunction mtRelativeDate(ts, fds) {\n    var now = new Date();\n    var ref = ts;\n    var delta = Math.floor((now.getTime() - ref.getTime()) / 1000);\n\n    var str;\n    if (delta < 60) {\n        str = \'ç›´å‰\';\n    } else if (delta <= 86400) {\n        // less than 1 day\n        var hours = Math.floor(delta / 3600);\n        var min = Math.floor((delta % 3600) / 60);\n        if (hours == 1)\n            str = \'1 æ™‚é–“å‰\';\n        else if (hours > 1)\n            str = \'2 æ™‚é–“å‰\'.replace(/2/, hours);\n        else if (min == 1)\n            str = \'1 åˆ†å‰\';\n        else\n            str = \'2 åˆ†å‰\'.replace(/2/, min);\n    } else if (delta <= 604800) {\n        // less than 1 week\n        var days = Math.floor(delta / 86400);\n        var hours = Math.floor((delta % 86400) / 3600);\n        if (days == 1)\n            str = \'1 æ—¥å‰\';\n        else if (days > 1)\n            str = \'2 æ—¥å‰\'.replace(/2/, days);\n        else if (hours == 1)\n            str = \'1 æ™‚é–“å‰\';\n        else\n            str = \'2 æ™‚é–“å‰\'.replace(/2/, hours);\n    }\n    return str ? str : fds;\n}\n\n<mt:Ignore>\n/***\n * Used to display an edit link for the given entry.\n */\n</mt:Ignore>\nfunction mtEditLink(entry_id, author_id) {\n    <mt:Ignore>\n    // This function has been inactivated by default because of the security issue.\n    // You can activate this function if \"AdminScript\" is already known by visitor.\n    </mt:Ignore>\n    <mt:Ignore>\n\n    var u = mtGetUser();\n    if (! u) return;\n    if (! entry_id) return;\n    if (! author_id) return;\n    if (u.id != author_id) return;\n    var link = \'<a href=\"<$mt:AdminScript$>?__mode=view&amp;_type=entry&amp;id=\' + entry_id + \'\">ç·¨é›†</a>\';\n    document.write(link);\n\n    </mt:Ignore>\n}\n\n<mt:Ignore>\n/***\n * Called when an input field on the comment form receives focus.\n */\n</mt:Ignore>\nfunction mtCommentFormOnFocus() {\n    // if CAPTCHA is enabled, this causes the captcha image to be\n    // displayed if it hasn\'t been already.\n    mtShowCaptcha();\n}\n\n<mt:Ignore>\n/***\n * Displays a captcha field for anonymous commenters.\n */\n</mt:Ignore>\nvar mtCaptchaVisible = false;\nfunction mtShowCaptcha() {\n    var u = mtGetUser();\n    if ( u && u.is_authenticated ) return;\n    if (mtCaptchaVisible) return;\n    var div = document.getElementById(\'comments-open-captcha\');\n    if (div) {\n        div.innerHTML = \'<$mt:CaptchaFields$>\';\n        mtCaptchaVisible = true;\n    }\n}\n\n<mt:Ignore>\n/* user object\n    -- saved in user cookie --\n    u.name (display name)\n    u.url (link to home page)\n    u.email (for anonymous only)\n    u.userpic (url for commenter/author)\n    u.profile (link to profile)\n    u.is_trusted (boolean)\n    u.is_author (user has posting rights)\n    u.is_banned (banned status; neither post/comment perms)\n    u.can_post (has permission to post)\n    u.can_comment (has permission to comment)\n\n    -- status fields --\n    u.is_authenticated (boolean)\n    u.is_anonymous (user is anonymous)\n*/\n</mt:Ignore>\n\nvar is_preview;\nvar user;\n<mt:Ignore>\n/***\n * Assigns a user object as the actively logged in user; also saves the\n * user information in a browser cookie.\n */\n</mt:Ignore>\nfunction mtSetUser(u) {\n    if (u) {\n        // persist this\n        user = u;\n        mtSaveUser();\n        // sync up user greeting\n        mtFireEvent(\'usersignin\');\n    }\n}\n\n<mt:Ignore>\n/***\n * Simple function that escapes single quote characters for storing\n * in a cookie.\n */\n</mt:Ignore>\nfunction mtEscapeJS(s) {\n    s = s.replace(/\'/g, \"&apos;\");\n    return s;\n}\n\n<mt:Ignore>\n/***\n * Simple function that unescapes single quote characters that were\n * stored in a cookie.\n */\n</mt:Ignore>\nfunction mtUnescapeJS(s) {\n    s = s.replace(/&apos;/g, \"\'\");\n    return s;\n}\n\n<mt:Ignore>\n/***\n * Serializes a user object into a string, suitable for storing as a cookie.\n */\n</mt:Ignore>\nfunction mtBakeUserCookie(u) {\n    var str = \"\";\n    if (u.name) str += \"name:\'\" + mtEscapeJS(u.name) + \"\';\";\n    if (u.url) str += \"url:\'\" + mtEscapeJS(u.url) + \"\';\";\n    if (u.email) str += \"email:\'\" + mtEscapeJS(u.email) + \"\';\";\n    if (u.is_authenticated) str += \"is_authenticated:\'1\';\";\n    if (u.profile) str += \"profile:\'\" + mtEscapeJS(u.profile) + \"\';\";\n    if (u.userpic) str += \"userpic:\'\" + mtEscapeJS(u.userpic) + \"\';\";\n    if (u.sid) str += \"sid:\'\" + mtEscapeJS(u.sid) + \"\';\";\n    str += \"is_trusted:\'\" + (u.is_trusted ? \"1\" : \"0\") + \"\';\";\n    str += \"is_author:\'\" + (u.is_author ? \"1\" : \"0\") + \"\';\";\n    str += \"is_banned:\'\" + (u.is_banned ? \"1\" : \"0\") + \"\';\";\n    str += \"can_post:\'\" + (u.can_post ? \"1\" : \"0\") + \"\';\";\n    str += \"can_comment:\'\" + (u.can_comment ? \"1\" : \"0\") + \"\';\";\n    str = str.replace(/;$/, \'\');\n    return str;\n}\n\n<mt:Ignore>\n/***\n * Unserializes a user cookie and returns a user object with the restored\n * state.\n */\n</mt:Ignore>\nfunction mtUnbakeUserCookie(s) {\n    if (!s) return;\n\n    var u = {};\n    var m;\n    while (m = s.match(/^((name|url|email|is_authenticated|profile|userpic|sid|is_trusted|is_author|is_banned|can_post|can_comment):\'([^\']+?)\';?)/)) {\n        s = s.substring(m[1].length);\n        if (m[2].match(/^(is|can)_/)) // boolean fields\n            u[m[2]] = m[3] == \'1\' ? true : false;\n        else\n            u[m[2]] = mtUnescapeJS(m[3]);\n    }\n    if (u.is_authenticated) {\n        u.is_anonymous = false;\n    } else {\n        u.is_anonymous = true;\n        u.can_post = false;\n        u.is_author = false;\n        u.is_banned = false;\n        u.is_trusted = false;\n    }\n    return u;\n}\n\n<mt:Ignore>\n/***\n * Retrieves an object of the currently logged in user\'s state.\n * If no user is logged in or cookied, this will return null.\n */\n</mt:Ignore>\nfunction mtGetUser() {\n    if (!user) {\n        var cookie = mtGetCookie(mtCookieName);\n        if (!cookie) return;\n        user = mtUnbakeUserCookie(cookie);\n        if (! user) {\n            user = {};\n            user.is_anonymous = true;\n            user.can_post = false;\n            user.is_author = false;\n            user.is_banned = false;\n            user.is_trusted = false;\n        }\n    }\n    return user;\n}\n\n<mt:Ignore>\n/***\n * Issues a request to the MT comment script to retrieve the currently\n * logged-in user (if any).\n */\n</mt:Ignore>\nvar mtFetchedUser = false;\n<mt:IfWebsite>\nfunction mtFetchUser(cb) {\n    if (!cb) cb = \'mtSetUser\';\n    if ( ( cb == \'mtSetUser\' ) && mtGetUser() ) {\n        var url = document.URL;\n        url = url.replace(/#.+$/, \'\');\n        url += \'#comments-open\';\n        location.href = url;\n    } else {\n        // we aren\'t using AJAX for this, since we may have to request\n        // from a different domain. JSONP to the rescue.\n        mtFetchedUser = true;\n        var u = mtGetUser();\n        var script = document.createElement(\'script\');\n        var ts = new Date().getTime();\n        script.src = \'<$mt:CGIPath$><$mt:CommentScript$>?__mode=userinfo&blog_id=<$mt:BlogID$>&jsonp=\' + cb + \'&ts=\' + ts + \'&sid=\' + u.sid;\n        (document.getElementsByTagName(\'head\'))[0].appendChild(script);\n    }\n}\n\nfunction mtVerifySession(cb) {\n    if (!cb) return;\n    var script = document.createElement(\'script\');\n    var ts = new Date().getTime();\n    var u = mtGetUser();\n    script.src = \'<$mt:CGIPath$><$mt:CommentScript$>?__mode=verify_session&blog_id=<$mt:BlogID$>&jsonp=\' + cb + \'&ts=\' + ts + \'&sid=\' + u.sid;\n    (document.getElementsByTagName(\'head\'))[0].appendChild(script);\n}\n</mt:IfWebsite>\n\n<mt:Ignore>\n/***\n * Called when the \'Remember me\' checkbox is changed. If the checkbox\n * is cleared, the cached user cookie is immediately cleared.\n */\n</mt:Ignore>\nfunction mtRememberMeOnClick(b) {\n    if (!b.checked)\n        mtClearUser(b.form);\n    return true;\n}\n\n<mt:Ignore>\n/***\n * Called when comment form is sent.\n * Required parameter: Form DOM object of comment form.\n * If form has a \'bakecookie\' member, it will be used to signal\n * storing the anonymous commenter information to a cookie.\n * If form has a \'armor\' member, it will be used to store\n * a token that is checked by the comment script.\n */\n</mt:Ignore>\n<mt:IfWebsite>\nvar mtRequestSubmitted = false;\nfunction mtCommentOnSubmit(f) {\n    if (!mtRequestSubmitted) {\n        mtRequestSubmitted = true;\n\n        if (f.armor)\n            f.armor.value = \'<$mt:BlogSitePath encode_sha1=\"1\"$>\';\n        if (f.bakecookie && f.bakecookie.checked)\n            mtSaveUser(f);\n\n        // disable submit buttons\n        if (f.preview_button) f.preview_button.disabled = true;\n        if (f.post) f.post.disabled = true;\n\n        var u = mtGetUser();\n        if ( !is_preview && ( u && u.is_authenticated ) ) {\n            // validate session; then submit\n            mtVerifySession(\'mtCommentSessionVerify\');\n            return false;\n        }\n\n        return true;\n    }\n    return false;\n}\n\nfunction mtCommentSessionVerify(app_user) {\n    var f = document[\'comments_form\'];\n    if ( app_user && app_user.verified ) {\n        f.submit();\n    } else {\n        alert(\'ã‚»ãƒƒã‚·ãƒ§ãƒ³ã®æœ‰åŠ¹æœŸé™ãŒåˆ‡ã‚Œã¦ã„ã¾ã™ã€‚å†åº¦ã‚µã‚¤ãƒ³ã‚¤ãƒ³ã—ã¦ãã ã•ã„ã€‚\');\n        mtClearUser();\n        mtFireEvent(\'usersignin\');\n<mt:IfRegistrationRequired>\n        mtShow(\'comments-form\');\n        mtHide(\'comments-open-footer\');\n</mt:IfRegistrationRequired>\n    }\n}\n\nfunction mtUserOnLoad() {\n    var u = mtGetUser();\n\n    // if the user is authenticated, hide the \'anonymous\' fields\n    // and any captcha input if already shown\n    if ( document.getElementById(\'comments-form\')) {\n        if ( u && u.is_authenticated ) {\n            mtShow(\'comments-form\');\n            mtHide(\'comments-open-data\');\n            if (mtCaptchaVisible)\n                mtHide(\'comments-open-captcha\');\n        } else {\n<mt:IfRegistrationRequired>\n            mtHide(\'comments-form\');\n</mt:IfRegistrationRequired>\n        }\n        if ( u && u.is_banned )\n            mtHide(\'comments-form\');\n\n        // if we\'re previewing a comment, make sure the captcha\n        // field is visible\n        if (is_preview)\n            mtShowCaptcha();\n        else\n            mtShowGreeting();\n\n        // populate anonymous comment fields if user is cookied as anonymous\n        var cf = document[\'comments_form\'];\n        if (cf) {\n            if (u && u.is_anonymous) {\n                if (u.email) cf.email.value = u.email;\n                if (u.name) cf.author.value = u.name;\n                if (u.url) cf.url.value = u.url;\n                if (cf.bakecookie)\n                    cf.bakecookie.checked = u.name || u.email;\n            } else {\n                if (u && u.sid && cf.sid)\n                    cf.sid.value = u.sid;\n            }\n            if (cf.post && cf.post.disabled)\n                cf.post.disabled = false;\n            if (cf.preview_button && cf.preview_button.disabled)\n                cf.preview_button.disabled = false;\n            mtRequestSubmitted = false;\n        }\n    }\n}\n</mt:IfWebsite>\n\n<mt:Ignore>\n/***\n * Called when an entry archive page is loaded.\n * This routine controls which elements of the comment form are shown\n * or hidden, depending on commenter type and blog configuration.\n */\n</mt:Ignore>\n<mt:IfWebsite>\nfunction mtEntryOnLoad() {\n    var cf = document[\'comments_form\'];\n    if (cf && cf.preview) cf.preview.value = \'\';\n    <mt:Unless tag=\"IfPingsAccepted\">mtHide(\'trackbacks-info\');</mt:Unless>\n    <mt:Unless tag=\"IfCommentsAccepted\">mtHide(\'comments-open\');</mt:Unless>\n    mtFireEvent(\'usersignin\');\n}\n\nfunction mtEntryOnUnload() {\n    if (mtRequestSubmitted) {\n        var cf = document[\'comments_form\'];\n        if (cf) {\n            if (cf.post && cf.post.disabled)\n                cf.post.disabled = false;\n            if (cf.preview_button && cf.preview_button.disabled)\n                cf.preview_button.disabled = false;\n        }\n        mtRequestSubmitted = false;\n    }\n    return true;\n}\n\nmtAttachEvent(\'usersignin\', mtUserOnLoad);\n</mt:IfWebsite>\n\n<mt:Ignore>\n/***\n * Handles the action of the \"Sign in\" link. First clears any existing\n * user cookie, then directs to the MT comment script to sign the user in.\n */\n</mt:Ignore>\nfunction mtSignIn() {\n    var doc_url = document.URL;\n    doc_url = doc_url.replace(/#.+/, \'\');\n    var url = \'<$mt:SignInLink$>\';\n    if (is_preview) {\n        if ( document[\'comments_form\'] ) {\n            var entry_id = document[\'comments_form\'].entry_id.value;\n            url += \'&entry_id=\' + entry_id;\n        } else {\n            url += \'&return_url=<$mt:BlogURL encode_url=\"1\"$>\';\n        }\n    } else {\n        url += \'&return_url=\' + encodeURIComponent(doc_url);\n    }\n    mtClearUser();\n    location.href = url;\n}\n\nfunction mtSignInOnClick(sign_in_element) {\n    var el;\n    if (sign_in_element) {\n        // display throbber\n        el = document.getElementById(sign_in_element);\n        if (!el)  // legacy MT 4.x element id\n            el = document.getElementById(\'comment-form-external-auth\');\n    }\n    if (el)\n        el.innerHTML = \'ã‚µã‚¤ãƒ³ã‚¤ãƒ³ã—ã¾ã™... <span class=\"status-indicator\">&nbsp;</span>\';\n\n    mtClearUser(); // clear any \'anonymous\' user cookie to allow sign in\n    mtSignIn();\n    return false;\n}\n\nfunction mtSetUserOrLogin(u) {\n    if (u && u.is_authenticated) {\n        mtSetUser(u);\n    } else {\n        // user really isn\'t logged in; so let\'s do this!\n        mtSignIn();\n    }\n}\n\n<mt:Ignore>\n/***\n * Handles sign out from the web site.\n * First clears any existing user cookie, then direts to the MT comment\n * script to sign the user out.\n */\n</mt:Ignore>\nfunction mtSignOut(entry_id) {\n    mtClearUser();\n    var doc_url = document.URL;\n    doc_url = doc_url.replace(/#.+/, \'\');\n    var url = \'<$mt:SignOutLink$>\';\n    if (is_preview) {\n        if ( document[\'comments_form\'] ) {\n            var entry_id = document[\'comments_form\'].entry_id.value;\n            url += \'&entry_id=\' + entry_id;\n        } else {\n            url += \'&return_url=<$mt:BlogURL encode_url=\"1\"$>\';\n        }\n    } else {\n        url += \'&return_url=\' + encodeURIComponent(doc_url);\n    }\n    location.href = url;\n}\n\n<mt:Ignore>\n/***\n * Handles the action of the \"Sign out\" link.\n */\n</mt:Ignore>\nfunction mtSignOutOnClick() {\n    mtSignOut();\n    return false;\n}\n\n<mt:Ignore>\n/***\n * Handles the display of the greeting message, depending on what kind of\n * user is logged in and blog comment policy.\n */\n</mt:Ignore>\n<mt:IfWebsite>\nfunction mtShowGreeting() {\n<mt:IfRegistrationAllowed>\n    var reg_reqd = <mt:IfRegistrationRequired>true<mt:Else>false</mt:IfRegistrationRequired>;\n\n    var cf = document[\'comments_form\'];\n    if (!cf) return;\n\n    var el = document.getElementById(\'comment-greeting\');\n    if (!el)  // legacy MT 4.x element id\n        el = document.getElementById(\'comment-form-external-auth\');\n    if (!el) return;\n\n    var eid = cf.entry_id;\n    var entry_id;\n    if (eid) entry_id = eid.value;\n\n    var phrase;\n    var u = mtGetUser();\n\n    if ( u && u.is_authenticated ) {\n        if ( u.is_banned ) {\n            phrase = \'ã“ã®ãƒ–ãƒ­ã‚°ã«ã‚³ãƒ¡ãƒ³ãƒˆã™ã‚‹æ¨©é™ã‚’æŒã£ã¦ã„ã¾ã›ã‚“ã€‚(\\<a href=\\\"javas\\cript:void(0);\\\" onclick=\\\"return mtSignOutOnClick();\\\"\\>ã‚µã‚¤ãƒ³ã‚¢ã‚¦ãƒˆã™ã‚‹\\<\\/a\\>)\';\n        } else {\n            var user_link;\n            if ( u.is_author ) {\n                user_link = \'<a href=\"<$mt:CGIPath$><$mt:CommentScript$>?__mode=edit_profile&blog_id=<mt:BlogID>&return_url=\' + encodeURIComponent( location.href );\n                user_link += \'\">\' + u.name + \'</a>\';\n            } else {\n                // registered user, but not a user with posting rights\n                if (u.url)\n                    user_link = \'<a href=\"\' + u.url + \'\">\' + u.name + \'</a>\';\n                else\n                    user_link = u.name;\n            }\n            // TBD: supplement phrase with userpic if one is available.\n            phrase = \'__NAME__ã¨ã—ã¦ã‚µã‚¤ãƒ³ã‚¤ãƒ³ã—ã¦ã„ã¾ã™ã€‚(\\<a href=\\\"javas\\cript:void(0)\\\" onclick=\\\"return mtSignOutOnClick();\\\"\\>ã‚µã‚¤ãƒ³ã‚¢ã‚¦ãƒˆ\\<\\/a\\>)\';\n            phrase = phrase.replace(/__NAME__/, user_link);\n        }\n    } else {\n        if (reg_reqd) {\n            phrase = \'ã‚³ãƒ¡ãƒ³ãƒˆã™ã‚‹ã«ã¯ã¾ãš\\<a href=\\\"javas\\cript:void(0)\\\" onclick=\\\"return mtSignInOnClick(\\\'comment-greeting\\\')\\\"\\>ã‚µã‚¤ãƒ³ã‚¤ãƒ³\\<\\/a\\>ã—ã¦ãã ã•ã„ã€‚\';\n        } else {\n            phrase = \'ã‚³ãƒ¡ãƒ³ãƒˆã™ã‚‹å‰ã«\\<a href=\\\"javas\\cript:void(0)\\\" onclick=\\\"return mtSignInOnClick(\\\'comment-greeting\\\')\\\"\\>ã‚µã‚¤ãƒ³ã‚¤ãƒ³\\<\\/a\\>ã™ã‚‹ã“ã¨ã‚‚ã§ãã¾ã™ã€‚\';\n        }\n    }\n    el.innerHTML = phrase;\n<mt:Else>\n    mtShowCaptcha();\n</mt:IfRegistrationAllowed>\n}\n</mt:IfWebsite>\n\n<mt:Ignore>\n/***\n * Handles the action of the \'Reply\' links.\n */\n</mt:Ignore>\nfunction mtReplyCommentOnClick(parent_id, author) {\n    mtShow(\'comment-form-reply\');\n\n    var checkbox = document.getElementById(\'comment-reply\');\n    var label = document.getElementById(\'comment-reply-label\');\n    var text = document.getElementById(\'comment-text\');\n\n    // Populate label with new values\n    var reply_text = \'\\<a href=\\\"#comment-__PARENT__\\\" onclick=\\\"location.href=this.href; return false\\\"\\>__AUTHOR__ã‹ã‚‰ã®ã‚³ãƒ¡ãƒ³ãƒˆ\\<\\/a\\>ã«è¿”ä¿¡\';\n    reply_text = reply_text.replace(/__PARENT__/, parent_id);\n    reply_text = reply_text.replace(/__AUTHOR__/, author);\n    label.innerHTML = reply_text;\n\n    checkbox.value = parent_id; \n    checkbox.checked = true;\n    try {\n        // text field may be hidden\n        text.focus();\n    } catch(e) {\n    }\n\n    mtSetCommentParentID();\n}\n\n<mt:Ignore>\n/***\n * Sets the parent comment ID when replying to a comment.\n */\n</mt:Ignore>\nfunction mtSetCommentParentID() {\n    var checkbox = document.getElementById(\'comment-reply\');\n    var parent_id_field = document.getElementById(\'comment-parent-id\');\n    if (!checkbox || !parent_id_field) return;\n\n    var pid = 0;\n    if (checkbox.checked == true)\n        pid = checkbox.value;\n    parent_id_field.value = pid;\n}\n\n<mt:Ignore>\n/***\n * Persists a copy of the current user cookie into the browser cookie stash.\n */\n</mt:Ignore>\nfunction mtSaveUser(f) {\n    // We can\'t reliably store the user cookie during a preview.\n    if (is_preview) return;\n\n    var u = mtGetUser();\n\n    if (f && (!u || u.is_anonymous)) {\n        if ( !u ) {\n            u = {};\n            u.is_authenticated = false;\n            u.can_comment = true;\n            u.is_author = false;\n            u.is_banned = false;\n            u.is_anonymous = true;\n            u.is_trusted = false;\n        }\n        if (f.author != undefined) u.name = f.author.value;\n        if (f.email != undefined) u.email = f.email.value;\n        if (f.url != undefined) u.url = f.url.value;\n    }\n\n    if (!u) return;\n\n    var cache_period = mtCookieTimeout * 1000;\n\n    // cache anonymous user info for a long period if the\n    // user has requested to be remembered\n    if (u.is_anonymous && f && f.bakecookie && f.bakecookie.checked)\n        cache_period = 365 * 24 * 60 * 60 * 1000;\n\n    var now = new Date();\n    mtFixDate(now);\n    now.setTime(now.getTime() + cache_period);\n\n    var cmtcookie = mtBakeUserCookie(u);\n    mtSetCookie(mtCookieName, cmtcookie, now, mtCookiePath, mtCookieDomain,\n        location.protocol == \'https:\');\n}\n\n<mt:Ignore>\n/***\n * Clears the blog-side user cookie.\n */\n</mt:Ignore>\nfunction mtClearUser() {\n    user = null;\n    mtDeleteCookie(mtCookieName, mtCookiePath, mtCookieDomain,\n        location.protocol == \'https:\');\n}\n\n<mt:Ignore>\n/***\n * Sets a browser cookie.\n */\n</mt:Ignore>\nfunction mtSetCookie(name, value, expires, path, domain, secure) {\n    if (domain && ( domain.match(/^\\.?localhost$/) || domain.match(/^[0-9\\.]+$/) ))\n        domain = null;\n    var curCookie = name + \"=\" + encodeURIComponent(value) +\n        (expires ? \"; expires=\" + expires.toGMTString() : \"\") +\n        (path ? \"; path=\" + path : \"\") +\n        (domain ? \"; domain=\" + domain : \"\") +\n        (secure ? \"; secure\" : \"\");\n    document.cookie = curCookie;\n}\n\n<mt:Ignore>\n/***\n * Retrieves a browser cookie.\n */\n</mt:Ignore>\nfunction mtGetCookie(name) {\n    var prefix = name + \'=\';\n    var c = document.cookie;\n    var cookieStartIndex = c.indexOf(prefix);\n    if (cookieStartIndex == -1)\n        return \'\';\n    var cookieEndIndex = c.indexOf(\";\", cookieStartIndex + prefix.length);\n    if (cookieEndIndex == -1)\n        cookieEndIndex = c.length;\n    var this_cookie = c.substring(cookieStartIndex + prefix.length, cookieEndIndex);\n    if ( this_cookie.match(/\\%u/i) ) {\n        return \'\';\n    }\n    return decodeURIComponent( this_cookie );\n}\n\n<mt:Ignore>\n/***\n * Deletes a browser cookie.\n */\n</mt:Ignore>\nfunction mtDeleteCookie(name, path, domain, secure) {\n    if (mtGetCookie(name)) {\n        if (domain && domain.match(/^\\.?localhost$/))\n            domain = null;\n        document.cookie = name + \"=\" +\n            (path ? \"; path=\" + path : \"\") +\n            (domain ? \"; domain=\" + domain : \"\") +\n            (secure ? \"; secure\" : \"\") +\n            \"; expires=Thu, 01-Jan-70 00:00:01 GMT\";\n    }\n}\n\nfunction mtFixDate(date) {\n    var skew = (new Date(0)).getTime();\n    if (skew > 0)\n        date.setTime(date.getTime() - skew);\n}\n\n<mt:Ignore>\n/***\n * Returns a XMLHttpRequest object (for Ajax operations).\n */\n</mt:Ignore>\nfunction mtGetXmlHttp() {\n    if ( !window.XMLHttpRequest ) {\n        window.XMLHttpRequest = function() {\n            var types = [\n                \"Microsoft.XMLHTTP\",\n                \"MSXML2.XMLHTTP.5.0\",\n                \"MSXML2.XMLHTTP.4.0\",\n                \"MSXML2.XMLHTTP.3.0\",\n                \"MSXML2.XMLHTTP\"\n            ];\n\n            for ( var i = 0; i < types.length; i++ ) {\n                try {\n                    return new ActiveXObject( types[ i ] );\n                } catch( e ) {}\n            }\n\n            return undefined;\n        };\n    }\n    if ( window.XMLHttpRequest )\n        return new XMLHttpRequest();\n}\n\n// BEGIN: fast browser onload init\n// Modifications by David Davis, DWD\n// Dean Edwards/Matthias Miller/John Resig\n// http://dean.edwards.name/weblog/2006/06/again/?full#comment5338\n\nfunction mtInit() {\n    // quit if this function has already been called\n    if (arguments.callee.done) return;\n\n    // flag this function so we don\'t do the same thing twice\n    arguments.callee.done = true;\n\n    // kill the timer\n    // DWD - check against window\n    if ( window._timer ) clearInterval(window._timer);\n\n    // DWD - fire the window onload now, and replace it\n    if ( window.onload && ( window.onload !== window.mtInit ) ) {\n        window.onload();\n        window.onload = function() {};\n    }\n<mt:IfWebsite>\n<mt:IfRegistrationAllowed>\n    mtInitCommenter();\n</mt:IfRegistrationAllowed>\n</mt:IfWebsite>\n}\n\n/* for Mozilla/Opera9 */\nif (document.addEventListener) {\n    document.addEventListener(\"DOMContentLoaded\", mtInit, false);\n}\n\n/* for Internet Explorer */\n/*@cc_on @*/\n/*@if (@_win32)\nif (!document.addEventListener){\n  document.write(\"<script id=__ie_onload defer src=//:><\\/script>\");\n  var script = document.getElementById(\"__ie_onload\");\n  script.onreadystatechange = function() {\n      if (this.readyState == \"complete\") {\n          mtInit(); // call the onload handler\n      }\n  };\n}\n/*@end @*/\n\n/* for Safari */\nif (/WebKit/i.test(navigator.userAgent)) { // sniff\n    _timer = setInterval(function() {\n        if (/loaded|complete/.test(document.readyState)) {\n            mtInit(); // call the onload handler\n        }\n    }, 10);\n}\n\n/* for other browsers */\nwindow.onload = mtInit;\n\n// END: fast browser onload init\n\n<mt:IfWebsite>\n<mt:IfRegistrationAllowed>\n\nfunction mtLoggedIn(ott) {\n    var script = document.createElement(\'script\');\n    var ts = new Date().getTime();\n    script.src = \'<$mt:CGIPath$><$mt:CommentScript$>?__mode=userinfo&jsonp=mtSaveUserInfo&ott=\' + ott;\n    (document.getElementsByTagName(\'head\'))[0].appendChild(script);\n}\n\nfunction mtRefreshUserInfo(sid) {\n    var script = document.createElement(\'script\');\n    var ts = new Date().getTime();\n    script.src = \'<$mt:CGIPath$><$mt:CommentScript$>?__mode=userinfo&jsonp=mtSaveUserInfo&sid=\' + sid;\n    (document.getElementsByTagName(\'head\'))[0].appendChild(script);\n}\n\nfunction mtSaveUserInfo (u) {\n    if ( u.error ) {\n        if ( !user ) {\n            alert(\'ã‚µã‚¤ãƒ³ã‚¤ãƒ³ã§ãã¾ã›ã‚“ã§ã—ãŸã€‚\');\n        }\n        return;\n    }\n    user = null;\n    var cmtcookie = mtBakeUserCookie(u);\n    var now = new Date();\n    var cache_period = mtCookieTimeout * 1000;\n\n    // cache anonymous user info for a long period if the\n    // user has requested to be remembered\n    mtFixDate(now);\n    now.setTime(now.getTime() + cache_period);\n    mtSetCookie(mtCookieName, cmtcookie, now, mtCookiePath, mtCookieDomain,\n        location.protocol == \'https:\');\n    mtFireEvent(\'usersignin\');\n}\n\nfunction mtInitCommenter () {\n    /***\n     * If request contains a \'#_login\' or \'#_logout\' hash, use this to\n     * also delete the blog-side user cookie, since we\'re coming back from\n     * a login, logout or edit profile operation.\n     */\n\n    var hash = ( window.location.hash );\n    hash.match( /^#_(.*)$/ );\n    var command = RegExp.$1 || \'\';\n    if ( command === \'refresh\' ) {\n        // Back from profile edit screen.\n        // Reload userinfo with current session ID.\n        var u = mtGetUser();\n        user  = null;\n        mtRefreshUserInfo(u.sid);\n    }\n    else if ( command === \'logout\' ) {\n        // clear any logged in state\n        mtClearUser();\n        mtFireEvent(\'usersignin\');\n    }\n    else if ( command.match( /^login_(.*)$/ ) ) {\n        var sid = RegExp.$1;\n        mtLoggedIn(sid);\n    }\n    else {\n        mtFireEvent(\'usersignin\');\n    }\n}\n</mt:IfRegistrationAllowed>\n</mt:IfWebsite>\n','index',0),(37,1,0,0,1,1,'2020-11-24 14:20:59','creative_commons',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚¯ãƒªã‚¨ã‚¤ãƒ†ã‚£ãƒ–ãƒ»ã‚³ãƒ¢ãƒ³ã‚º',NULL,1,'<mt:BlogIfCCLicense>\n<div class=\"widget-creative-commons widget\">\n   <div class=\"widget-content\">\n      <a href=\"<$mt:BlogCCLicenseURL$>\"><img alt=\"Creative Commons License\" src=\"<$mt:BlogCCLicenseImage$>\" /></a><br />\n      ã“ã®ãƒ–ãƒ­ã‚°ã¯<a href=\"<$mt:BlogCCLicenseURL$>\">ã‚¯ãƒªã‚¨ã‚¤ãƒ†ã‚£ãƒ–ãƒ»ã‚³ãƒ¢ãƒ³ã‚º</a>ã§ãƒ©ã‚¤ã‚»ãƒ³ã‚¹ã•ã‚Œã¦ã„ã¾ã™ã€‚\n   </div>\n</div>\n</mt:BlogIfCCLicense>\n','widget',0),(38,1,0,0,1,1,'2020-11-24 14:20:59','main_index_widgets_group',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ãƒ›ãƒ¼ãƒ ãƒšãƒ¼ã‚¸ã‚¦ã‚£ã‚¸ã‚§ãƒƒãƒˆã‚°ãƒ«ãƒ¼ãƒ—',NULL,1,'<mt:Ignore>\n    main_indexã®ãƒ†ãƒ³ãƒ—ãƒ¬ãƒ¼ãƒˆã ã‘ã«è¡¨ç¤ºã•ã‚Œã‚‹ã‚ˆã†ã«è¨­å®šã•ã‚Œã¦ã„ã‚‹ã‚¦ã‚£ã‚¸ã‚§ãƒƒãƒˆã®ã‚»ãƒƒãƒˆã§ã™ã€‚è©³ç´°: http://www.movabletype.org/documentation/designer/widget-sets.html\n</mt:Ignore>\n<mt:If name=\"main_index\">\n    <$mt:Include widget=\"æœ€è¿‘ã®ã‚³ãƒ¡ãƒ³ãƒˆ\"$>\n    <$mt:Include widget=\"æœ€è¿‘ã®è¨˜äº‹\"$>\n    <$mt:Include widget=\"ã‚¢ã‚¤ãƒ†ãƒ \"$>\n    <$mt:Include widget=\"ã‚¿ã‚°ã‚¯ãƒ©ã‚¦ãƒ‰\"$>\n</mt:If>\n','widget',0),(39,1,0,0,1,1,'2020-11-24 14:20:59','popup_image',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ãƒãƒƒãƒ—ã‚¢ãƒƒãƒ—ç”»åƒ',NULL,1,'<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" id=\"sixapart-standard\">\n<head><title><$mt:ImageURL$></title></head>\n<body id=\"uploaded-image-popup\" class=\"popup\" style=\"margin: 0;padding: 0;\">\n    <img src=\"<$mt:ImageURL$>\" width=\"<$mt:ImageWidth$>\" height=\"<$mt:ImageHeight$>\" alt=\"<$mt:ImageURL$>\" style=\"margin: 0;padding: 0;border: 0;\" />\n</body>\n</html>\n','popup_image',0),(40,1,0,0,1,1,'2020-11-24 14:20:59','main_index',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ãƒ¡ã‚¤ãƒ³ãƒšãƒ¼ã‚¸','index.html',1,'<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" id=\"sixapart-standard\">\n<head>\n    <$mt:Include module=\"HTMLãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n    <link rel=\"EditURI\" type=\"application/rsd+xml\" title=\"RSD\" href=\"<$mt:Link template=\"rsd\"$>\" />\n    <title><$mt:BlogName encode_html=\"1\"$></title>\n</head>\n<body id=\"<$mt:WebsiteThemeID$>\" class=\"mt-main-index <$mt:Var name=\"page_layout\"$>\">\n    <div id=\"container\">\n        <div id=\"container-inner\">\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n\n\n            <div id=\"content\">\n                <div id=\"content-inner\">\n\n\n                    <div id=\"alpha\">\n                        <div id=\"alpha-inner\">\n<mt:Entries include_blogs=\"children\" include_with_website=\"1\" >\n                            <mt:Ignore><!-- Use the Entry Summary module for each entry published on this page --></mt:Ignore>\n                            <$mt:Include module=\"è¨˜äº‹ã®æ¦‚è¦\" display_blog_name=\"1\"$>\n</mt:Entries>\n\n                        </div>\n                    </div>\n\n\n                    <$mt:Include module=\"ã‚µã‚¤ãƒ‰ãƒãƒ¼\"$>\n\n\n                </div>\n            </div>\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n\n\n        </div>\n    </div>\n</body>\n</html>\n','index',0),(41,1,0,0,1,1,'2020-11-24 14:20:59','calendar',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚«ãƒ¬ãƒ³ãƒ€ãƒ¼',NULL,1,'<mt:IfArchiveTypeEnabled archive_type=\"Individual\">\n<div class=\"widget-calendar widget\">\n    <h3 class=\"widget-header\"><$mt:Date format=\"%B %Y\"$></h3>\n    <div class=\"widget-content\">\n        <table summary=\"ãƒªãƒ³ã‚¯ä»˜ãã®ã‚«ãƒ¬ãƒ³ãƒ€ãƒ¼\">\n            <tr>\n                <th abbr=\"æ—¥æ›œæ—¥\">æ—¥</th>\n                <th abbr=\"æœˆæ›œæ—¥\">æœˆ</th>\n                <th abbr=\"ç«æ›œæ—¥\">ç«</th>\n                <th abbr=\"æ°´æ›œæ—¥\">æ°´</th>\n                <th abbr=\"æœ¨æ›œæ—¥\">æœ¨</th>\n                <th abbr=\"é‡‘æ›œæ—¥\">é‡‘</th>\n                <th abbr=\"åœŸæ›œæ—¥\">åœŸ</th>\n            </tr>\n    <mt:Calendar>\n        <mt:CalendarWeekHeader>\n            <tr>\n        </mt:CalendarWeekHeader>\n                <td>\n        <mt:CalendarIfEntries>\n            <mt:Entries lastn=\"1\">\n                    <a href=\"<$mt:EntryPermalink$>\"><$mt:CalendarDay$></a>\n            </mt:Entries>\n        </mt:CalendarIfEntries>\n        <mt:CalendarIfNoEntries>\n                    <$mt:CalendarDay$>\n        </mt:CalendarIfNoEntries>\n        <mt:CalendarIfBlank>&nbsp;</mt:CalendarIfBlank>\n                </td>\n        <mt:CalendarWeekFooter>\n            </tr>\n        </mt:CalendarWeekFooter>\n    </mt:Calendar>\n        </table>\n    </div>\n</div>\n</mt:IfArchiveTypeEnabled>\n','widget',0),(42,1,0,0,1,1,'2020-11-24 14:20:59','signin',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚µã‚¤ãƒ³ã‚¤ãƒ³',NULL,1,'<mt:IfRegistrationAllowed>\n<div class=\"widget-sign-in widget\">\n    <h3 class=\"widget-header\">ã‚µã‚¤ãƒ³ã‚¤ãƒ³</h3>\n    <div id=\"signin-widget-content\" class=\"widget-content\"></div>\n</div>\n<script type=\"text/javascript\">\n/* <![CDATA[ */\nfunction mtUpdateSignInWidget(u) {\n    var el = document.getElementById(\'signin-widget-content\');\n    var content = \'\';\n    if (!el) return;\n    if (u) {\n        if (u && u.is_authenticated) {\n            user = u;\n            mtSaveUser();\n        } else {\n            // user really isn\'t logged in; so let\'s do this!\n            return mtSignIn();\n        }\n    } else {\n        u = mtGetUser();\n    }\n    if (u && u.name && !u.is_anonymous) {\n        var url;\n        if (u.is_authenticated) {\n            if (u.is_author) {\n                url = \'<$mt:CGIPath$><$mt:CommentScript$>?__mode=edit_profile\';\n                url += \'&return_url=\' + encodeURIComponent( location.href );\n            } else {\n                url = u.url;\n            }\n        } else if (u.url) {\n            url = u.url;\n        } else {\n            url = null;\n        }\n        var content = \'ãƒ¦ãƒ¼ã‚¶ãƒ¼å:\';\n        if (url)\n            content += \'<a href=\"\' + url + \'\">\' + u.name + \'</a>\';\n        else\n            content += u.name;\n        content += \'.  (<a href=\"javascript:void(0)\" onclick=\"return mtSignOutOnClick()\">ã‚µã‚¤ãƒ³ã‚¢ã‚¦ãƒˆ</a>)\';\n    } else if (u && u.is_banned) {\n        content = \'ã“ã®ãƒ–ãƒ­ã‚°ã«ã‚µã‚¤ãƒ³ã‚¤ãƒ³ã™ã‚‹æ¨©é™ãŒã‚ã‚Šã¾ã›ã‚“ã€‚\';\n    } else {\n        content = \'<a href=\"javascript:void(0)\" onclick=\"return mtSignInOnClick(\\\'signin-widget-content\\\')\">ã‚µã‚¤ãƒ³ã‚¤ãƒ³</a>\';\n    }\n    el.innerHTML = content;\n}\nmtAttachEvent(\'usersignin\', mtUpdateSignInWidget);\nmtUpdateSignInWidget();\n/* ]]> */\n</script>\n</mt:IfRegistrationAllowed>\n','widget',0),(43,1,0,0,1,1,'2020-11-24 14:20:59','comment_preview',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚³ãƒ¡ãƒ³ãƒˆãƒ—ãƒ¬ãƒ“ãƒ¥ãƒ¼',NULL,1,'<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" id=\"sixapart-standard\">\n<head>\n    <script type=\"text/javascript\">\n    /* <![CDATA[ */\n    var user = <$mt:UserSessionState$>;\n    var is_preview = true;\n    /* ]]> */\n    </script>\n    <$mt:Include module=\"HTMLãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n    <title><$mt:BlogName encode_html=\"1\"$>: ã‚³ãƒ¡ãƒ³ãƒˆã®ãƒ—ãƒ¬ãƒ“ãƒ¥ãƒ¼</title>\n</head>\n<body id=\"<$mt:WebsiteThemeID$>\" class=\"mt-comment-preview <$mt:Var name=\"page_layout\"$>\" onload=\"mtEntryOnLoad()\" onunload=\"mtEntryOnUnload()\">\n    <div id=\"container\">\n        <div id=\"container-inner\">\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n\n\n            <div id=\"content\">\n                <div id=\"content-inner\">\n\n\n                    <div id=\"alpha\">\n                        <div id=\"alpha-inner\">\n\n\n                            <h1 id=\"page-title\"><$mt:Var name=\"page_title\"$></h1>\n\n\n<mt:Ignore><!-- Comment Preview --></mt:Ignore>\n                            <div class=\"comment\" id=\"comment-<$mt:CommentID$>\">\n                                <div class=\"inner\">\n                                    <div class=\"comment-header\">\n                                        <div class=\"asset-meta\">\n                                            <span class=\"byline\">\n                                                <$mt:CommentAuthorIdentity$>\n    <mt:IfCommentParent>\n                                                <span class=\"vcard author\"><$mt:CommentAuthorLink$></span>ã‹ã‚‰<a href=\"<mt:CommentParent><$mt:CommentLink$></mt:CommentParent>\"><mt:CommentParent><$mt:CommentAuthor$></mt:CommentParent></a>ã¸ã®è¿”ä¿¡\n    <mt:Else>\n                                                <span class=\"vcard author\"><$mt:CommentAuthorLink$></span>\n    </mt:IfCommentParent>\n                                                | <a href=\"<$mt:CommentLink$>\"><abbr class=\"published\" title=\"<$mt:CommentDate format_name=\"iso8601\"$>\"><$mt:CommentDate$></abbr></a>\n                                            </span>\n                                        </div>\n                                    </div>\n                                    <div class=\"comment-content\">\n                                        <$mt:CommentBody$>\n                                    </div>\n                                </div>\n                            </div>\n\n\n<mt:Ignore><!-- Comment Form --></mt:Ignore>\n                            <div class=\"comments-open\" id=\"comments-open\">\n                                <h2 class=\"comments-open-header\">ã‚³ãƒ¡ãƒ³ãƒˆã™ã‚‹</h2>\n                                <div class=\"comments-open-content\">\n                                    <div id=\"comment-greeting\"></div>\n                                    <form method=\"post\" action=\"<$mt:CGIPath$><$mt:CommentScript$>\" name=\"comments_form\" id=\"comments-form\" onsubmit=\"return mtCommentOnSubmit(this)\">\n                                        <input type=\"hidden\" name=\"static\" value=\"1\" />\n                                        <input type=\"hidden\" name=\"armor\" value=\"1\" />\n                                        <input type=\"hidden\" name=\"preview\" value=\"\" />\n                                        <input type=\"hidden\" name=\"entry_id\" value=\"<$mt:EntryID$>\" />\n                                        <input type=\"hidden\" name=\"__lang\" value=\"<$mt:BlogLanguage$>\" />\n                                        <input type=\"hidden\" name=\"sid\" value=\"\" />\n<mt:IfCommentParent>\n                                            <input type=\"hidden\" name=\"parent_id\" value=\"<$mt:CommentParentID escape=\"html\"$>\" id=\"comment-parent-id\">\n</mt:IfCommentParent>\n                                        <div id=\"comments-open-data\">\n                                            <div id=\"comment-form-name\">\n                                                <label for=\"comment-author\">åå‰</label>\n                                                <input id=\"comment-author\" name=\"author\" size=\"30\" value=\"<$mt:CommentAuthor encode_html=\"1\"$>\" onfocus=\"mtShowCaptcha()\" />\n                                            </div>\n                                            <div id=\"comment-form-email\">\n                                                <label for=\"comment-email\">é›»å­ãƒ¡ãƒ¼ãƒ«</label>\n                                                <input id=\"comment-email\" name=\"email\" size=\"30\" value=\"<$mt:CommentEmail encode_html=\"1\"$>\" onfocus=\"mtShowCaptcha()\" />\n                                            </div>\n                                            <div id=\"comment-form-url\">\n                                                <label for=\"comment-url\">URL</label>\n                                                <input id=\"comment-url\" name=\"url\" size=\"30\" value=\"<$mt:CommentURL encode_html=\"1\"$>\" onfocus=\"mtShowCaptcha()\" />\n                                            </div>\n                                        </div>\n<mt:IfCommentParent>\n                                        <div id=\"comment-form-reply\">\n                                            <input type=\"checkbox\" id=\"comment-reply\" name=\"comment_reply\" value=\"<$mt:CommentParentID escape=\"html\"$>\" checked=\"checked\" onclick=\"mtSetCommentParentID()\" />\n                                            <label for=\"comment-reply\" id=\"comment-reply-label\"><mt:CommentParent><$mt:CommentAuthor$></mt:CommentParent>ã‹ã‚‰ã®ã‚³ãƒ¡ãƒ³ãƒˆã«è¿”ä¿¡</label>\n                                        </div>\n</mt:IfCommentParent>\n                                        <div id=\"comments-open-text\">\n                                            <label for=\"comment-text\">ã‚³ãƒ¡ãƒ³ãƒˆ <mt:IfAllowCommentHTML>(ã‚¹ã‚¿ã‚¤ãƒ«ç”¨ã®HTMLã‚¿ã‚°ã‚’ä½¿ãˆã¾ã™)</mt:IfAllowCommentHTML></label>\n                                            <textarea id=\"comment-text\" name=\"text\" rows=\"15\" cols=\"50\" onfocus=\"mtShowCaptcha()\"><$mt:CommentBody autolink=\"0\" sanitize=\"0\" convert_breaks=\"0\" encode_html=\"1\"$></textarea>\n                                        </div>\n                                        <div id=\"comments-open-captcha\"></div>\n                                        <div id=\"comments-open-footer\">\n                                            <input type=\"submit\" accesskey=\"v\" name=\"preview_button\" id=\"comment-preview\" value=\"ãƒ—ãƒ¬ãƒ“ãƒ¥ãƒ¼\" onclick=\"this.form.preview.value=\'1\';\" />\n                                            <input type=\"submit\" accesskey=\"s\" name=\"post\" id=\"comment-submit\" value=\"æŠ•ç¨¿\" />\n                                            <input type=\"button\" name=\"cancel\" id=\"comment-cancel\" value=\"ã‚­ãƒ£ãƒ³ã‚»ãƒ«\" onclick=\"window.location=\'<$mt:EntryPermalink$>\'\" />\n                                        </div>\n                                    </form>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n\n\n                    <$mt:Include module=\"ã‚µã‚¤ãƒ‰ãƒãƒ¼\"$>\n\n\n                </div>\n            </div>\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n\n\n        </div>\n    </div>\n</body>\n</html>\n','comment_preview',0),(44,1,0,0,1,1,'2020-11-24 14:20:59','search',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','æ¤œç´¢',NULL,1,'<div class=\"widget-search widget\">\n    <h3 class=\"widget-header\">æ¤œç´¢</h3>\n    <div class=\"widget-content\">\n        <form method=\"get\" action=\"<$mt:CGIPath$><$mt:SearchScript$>\">\n            <input type=\"text\" id=\"search\" class=\"ti\" name=\"search\" value=\"<MTIfStatic><mt:IfStraightSearch><$mt:SearchString$></mt:IfStraightSearch></MTIfStatic>\" />\n<mt:If name=\"search_results\">\n            <input type=\"hidden\" name=\"IncludeBlogs\" value=\"<$mt:SearchIncludeBlogs$>\" />\n            <mt:Ignore>\n            <!-- use these options only with MT::App::Search::Legacy -->\n            <ul class=\"search-options\">\n                <li><input type=\"checkbox\" name=\"CaseSearch\" /> å¤§æ–‡å­—/å°æ–‡å­—ã‚’åŒºåˆ¥ã™ã‚‹</li>\n                <li><input type=\"checkbox\" name=\"RegexSearch\" /> æ­£è¦è¡¨ç¾</li>\n            </ul>\n            </mt:Ignore>\n<mt:Else>\n            <input type=\"hidden\" name=\"IncludeBlogs\" value=\"<$mt:WebsiteID$><mt:WebsiteHasBlog><mt:Blogs include_blogs=\"children\">,<mt:BlogID></mt:Blogs></mt:WebsiteHasBlog>\" />\n</mt:If>\n            <input type=\"hidden\" name=\"limit\" value=\"<$mt:SearchMaxResults$>\" />\n            <input type=\"submit\" accesskey=\"4\" value=\"æ¤œç´¢\" />\n        </form>\n    </div>\n</div>\n<mt:If name=\"search_results\">\n    <mt:IfTagSearch>\n<div class=\"widget-tags widget\">\n    <h3 class=\"widget-header\">ã‚¿ã‚°</h3>\n    <div class=\"widget-content\">\n        <ul>\n        <mt:Tags>\n            <li><a href=\"javascript:void(0)\" onclick=\"location.href=\'<$mt:TagSearchLink encode_js=\"1\"$>\';return false;\"><$mt:TagName$> (<$mt:TagCount$>)</a></li>\n        </mt:Tags>\n        </ul>\n    </div>\n</div>\n    </mt:IfTagSearch>\n</mt:If>\n','widget',0),(45,1,0,0,1,1,'2020-11-24 14:20:59','current_author_monthly_archive_list',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ãƒ¦ãƒ¼ã‚¶ãƒ¼æœˆåˆ¥ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–',NULL,1,'<mt:IfArchiveTypeEnabled archive_type=\"Author-Monthly\">\n    <mt:ArchiveList archive_type=\"Author-Monthly\">\n        <mt:ArchiveListHeader>\n<div class=\"widget-archive-current-author-monthly widget-archive widget\">\n    <h3 class=\"widget-header\"><$mt:AuthorDisplayName encode_html=\"1\"$>: æœˆåˆ¥ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:ArchiveListHeader>\n            <li><a href=\"<$mt:ArchiveLink$>\"><$mt:ArchiveTitle$> (<$mt:ArchiveCount$>)</a></li>\n        <mt:ArchiveListFooter>\n        </ul>\n        </mt:ArchiveListFooter>\n    </mt:ArchiveList>\n    </div>\n</div>\n</mt:IfArchiveTypeEnabled>\n','widget',0),(46,1,0,0,1,1,'2020-11-24 14:20:59','tag_cloud',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','ã‚¿ã‚°ã‚¯ãƒ©ã‚¦ãƒ‰',NULL,1,'<mt:Tags top=\"20\" include_blogs=\"children\" include_with_website=\"1\">\n<mt:If name=\"__first__\">\n<div class=\"widget-tag-cloud widget\">\n    <h3 class=\"widget-header\">ã‚¿ã‚°ã‚¯ãƒ©ã‚¦ãƒ‰</h3>\n    <div class=\"widget-content\">\n        <ul>\n</mt:If>\n            <li class=\"rank-<$mt:TagRank max=\"10\"$>\"><a href=\"javascript:void(0)\" onclick=\"location.href=\'<$mt:TagSearchLink encode_js=\"1\"$>\';return false;\" rel=\"tag\"><$mt:TagName$></a></li>\n<mt:If name=\"__last__\">\n        </ul>\n    </div>\n</div>\n</mt:If>\n</mt:Tags>\n','widget',0),(47,1,0,0,1,1,'2020-11-24 14:20:59','search_results',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','æ¤œç´¢çµæžœ',NULL,1,'<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n    \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\" id=\"sixapart-standard\">\n<head>\n    <script type=\"text/javascript\">\n    /* <![CDATA[ */\n    var user = <$mt:UserSessionState$>;\n    /* ]]> */\n    </script>\n    <$mt:Include module=\"HTMLãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n    <title><$mt:BlogName encode_html=\"1\"$>: æ¤œç´¢çµæžœ</title>\n    <mt:Ignore>Below Javascript adds ajax search capability</mt:Ignore>\n    <script type=\"text/javascript\">\n    /* <![CDATA[ */\n    <mt:IfMoreResults>\n    function getResults(page) {\n        page = parseInt(page);\n        if (timer) window.clearTimeout(timer);\n        var xh = mtGetXmlHttp();\n        if (!xh) return false;\n        var res = results[page];\n        if (!res) return;\n        var url = res[\'next_url\'];\n        if (!url) return;\n\n        xh.open(\'GET\', url + \'&format=js\', true);\n        xh.onreadystatechange = function() {\n            if ( xh.readyState == 4 ) {\n                if ( xh.status && ( xh.status != 200 ) ) {\n                    // error - ignore\n                } else {\n                    try {\n                        var page_results = eval(\"(\" + xh.responseText + \")\");\n                        if ( page_results[\'error\'] == null )\n                            results[page + 1] = page_results[\'result\'];\n                    } catch (e) {\n                    }\n                }\n            }\n        };\n        xh.send(null);\n    }\n\n    function swapContent(direction) {\n        if ( direction == undefined ) direction = 1;\n        var page_span = document.getElementById(\'current-page\');\n        if (!page_span) return true;\n        var next_page = direction + parseInt(page_span.innerHTML);\n        var res = results[next_page];\n        if (!res) return true;\n        var content = res[\'content\'];\n        if (!content) return true;\n        var div = document.getElementById(\'search-results\');\n        if (!div) return true;\n        div.innerHTML = content;\n        timer = window.setTimeout(\"getResults(\" + next_page + \")\", 1*1000);\n        window.scroll(0, 0);\n        return false;\n    }\n    <mt:Else><mt:IfPreviousResults>\n    function swapContent(direction) {\n        return true;\n    }</mt:IfPreviousResults>\n    </mt:IfMoreResults>\n    /* ]]> */\n    </script>\n</head>\n<body id=\"<$mt:WebsiteThemeID$>\" class=\"mt-search-results <$mt:Var name=\"page_layout\"$>\">\n    <div id=\"container\">\n        <div id=\"container-inner\">\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ˜ãƒƒãƒ€ãƒ¼\"$>\n\n\n            <div id=\"content\">\n                <div id=\"content-inner\">\n\n\n                    <div id=\"alpha\">\n                        <div id=\"alpha-inner\">\n\n<mt:Ignore><!--\n    Below is the block to show search results.\n    This makes an independent block to support\n    Ajax-based background retrieval of the next search results.\n--></mt:Ignore>\n<mt:SetVarTemplate id=\"search_results\" name=\"search_results\">  \n<mt:SearchResults>\n    <mt:SearchResultsHeader>\n                            <div id=\"search-results\">\n                                <span id=\"current-page\" class=\"hidden\"><$mt:CurrentPage$></span>\n                                <h1 id=\"page-title\" class=\"search-results-header\">\n        <MTIfStatic><mt:IfStraightSearch>\n                                    ã€Œ<$mt:SearchString$>ã€ã¨ä¸€è‡´ã™ã‚‹ã‚‚ã®\n        </mt:IfStraightSearch></MTIfStatic>\n        <mt:IfTagSearch>\n                                    ã‚¿ã‚°ã€Œ<$mt:SearchString$>ã€ãŒä»˜ã‘ã‚‰ã‚Œã¦ã„ã‚‹ã‚‚ã®\n        </mt:IfTagSearch>\n                                </h1>\n                                <div class=\"search-results-container autopagerize_page_element\">\n    </mt:SearchResultsHeader>\n                                    <$mt:Include module=\"è¨˜äº‹ã®æ¦‚è¦\" hide_counts=\"1\" display_blog_name=\"1\" local=\"1\"$>\n    <mt:SearchResultsFooter>\n                                </div><div class=\"autopagerize_insert_before\"></div>\n\n    <mt:Ignore><!-- Used with the ajax search capability of the new search class --></mt:Ignore>\n                                <div class=\"content-nav\">\n                                    <mt:IfPreviousResults><a href=\"<$mt:PreviousLink$>\" rel=\"prev\" onclick=\"return swapContent(-1);\">&lt; å‰</a>&nbsp;&nbsp;</mt:IfPreviousResults><mt:PagerBlock><mt:IfCurrentPage><$mt:Var name=\"__value__\"$><mt:Else><a href=\"<$mt:PagerLink$>\"><$mt:Var name=\"__value__\"$></a></mt:IfCurrentPage><mt:Unless name=\"__last__\">&nbsp;</mt:Unless></mt:PagerBlock><mt:IfMoreResults>&nbsp;&nbsp;<a href=\"<$mt:NextLink$>\" rel=\"next\" onclick=\"return swapContent();\">æ¬¡ &gt;</a></mt:IfMoreResults>\n                                </div>\n                            </div>\n    </mt:SearchResultsFooter>\n</mt:SearchResults>\n</mt:SetVarTemplate>\n<mt:Ignore><!-- Display search results constructed in the block above --></mt:Ignore>\n<$mt:Var name=\"search_results\"$>\n\n\n<mt:Ignore><!-- Display no results message --></mt:Ignore>\n<mt:NoSearchResults>\n                            <h1 id=\"page-title\" class=\"search-results-header\">\n    <MTIfStatic><mt:IfStraightSearch>\n                                ã€Œ<$mt:SearchString$>ã€ã¨ä¸€è‡´ã™ã‚‹ã‚‚ã®\n    </mt:IfStraightSearch></MTIfStatic>\n    <mt:IfTagSearch>\n                                ã‚¿ã‚°ã€Œ<$mt:SearchString$>ã€ãŒä»˜ã‘ã‚‰ã‚Œã¦ã„ã‚‹ã‚‚ã®\n    </mt:IfTagSearch>\n                            </h1>\n                            <p>ã€Œ<$mt:SearchString$>ã€ã¨ä¸€è‡´ã™ã‚‹çµæžœã¯è¦‹ã¤ã‹ã‚Šã¾ã›ã‚“ã§ã—ãŸã€‚</p>\n</mt:NoSearchResults>\n\n\n<mt:Ignore><!-- Display instructions for searching if search script was accessed without a query --></mt:Ignore>\n<mt:NoSearch>\n                            <h1 id=\"page-title\" class=\"search-results-header\">ä¾‹</h1>\n                            <p>ã™ã¹ã¦ã®å˜èªžãŒé †åºã«é–¢ä¿‚ãªãæ¤œç´¢ã•ã‚Œã¾ã™ã€‚ãƒ•ãƒ¬ãƒ¼ã‚ºã§æ¤œç´¢ã—ãŸã„ã¨ãã¯å¼•ç”¨ç¬¦ã§å›²ã‚“ã§ãã ã•ã„ã€‚</p>\n                            <blockquote>\n                                <p><code>\"movable type\"</code></p>\n                            </blockquote>\n                            <p>ANDã€ORã€NOTã‚’å…¥ã‚Œã‚‹ã“ã¨ã§è«–ç†æ¤œç´¢ã‚’è¡Œã†ã“ã¨ã‚‚ã§ãã¾ã™ã€‚</p>\n                            <blockquote>\n                                <p><code>å€‹äºº OR å‡ºç‰ˆ</code></p>\n                                <p><code>å€‹äºº NOT å‡ºç‰ˆ</code></p>\n                            </blockquote>\n</mt:NoSearch>\n\n<mt:Ignore><!-- Used with the ajax search capability of the new search class --></mt:Ignore>\n<mt:IfMoreResults>\n<script type=\"text/javascript\">\n<!--\nvar div = document.getElementById(\'search-results\');\nvar results = {\n    \'<$mt:CurrentPage$>\': {\n        \'content\': div.innerHTML,\n        \'next_url\': \'<$mt:NextLink$>\'\n    }\n};\nvar timer = window.setTimeout(\"getResults(\" + <$mt:CurrentPage$> + \")\", 1*1000);\n//-->\n</script>\n</mt:IfMoreResults>\n\n\n                        </div>\n                    </div>\n\n                    <$mt:Include module=\"ã‚µã‚¤ãƒ‰ãƒãƒ¼\"$>\n\n\n                </div>\n            </div>\n\n\n            <$mt:Include module=\"ãƒãƒŠãƒ¼ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n\n\n        </div>\n    </div>\n</body>\n</html>\n','search_results',0),(48,1,0,0,1,1,'2020-11-24 14:20:59','recent_entries',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','æœ€è¿‘ã®è¨˜äº‹',NULL,1,'<mt:If tag=\"BlogEntryCount\" include_blogs=\"children\" include_with_website=\"1\">\n    <mt:Entries lastn=\"10\" include_blogs=\"children\" include_with_website=\"1\">\n        <mt:EntriesHeader>\n<div class=\"widget-recent-entries widget-archives widget\">\n    <h3 class=\"widget-header\">æœ€è¿‘ã®è¨˜äº‹</h3>\n    <div class=\"widget-content\">\n        <ul>\n        </mt:EntriesHeader>\n            <li><a href=\"<$mt:EntryPermalink$>\"><$mt:EntryTitle$></a> - <a href=\"<$mt:EntryBlogURL$>\"><$mt:EntryBlogName$></a></li>\n        <mt:EntriesFooter>\n        </ul>\n    </div>\n</div>\n        </mt:EntriesFooter>\n    </mt:Entries>\n</mt:If>\n','widget',0),(49,1,0,0,1,1,'2020-11-24 14:20:59','3column_layout_primary_sidebar',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','3ã‚«ãƒ©ãƒ ã®ã‚µã‚¤ãƒ‰ãƒãƒ¼(ãƒ¡ã‚¤ãƒ³)',NULL,1,'<mt:include widget=\"ãƒ–ãƒ­ã‚°\"><mt:include widget=\"ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–ã‚¦ã‚£ã‚¸ã‚§ãƒƒãƒˆã‚°ãƒ«ãƒ¼ãƒ—\"><mt:include widget=\"ãƒšãƒ¼ã‚¸ä¸€è¦§\"><mt:include widget=\"è³¼èª­\"><mt:include widget=\"OpenIDå¯¾å¿œ\"><mt:include widget=\"Powered By\">','widgetset',0),(50,1,0,0,1,1,'2020-11-24 14:20:59','3column_layout_secondary_sidebar',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','3ã‚«ãƒ©ãƒ ã®ã‚µã‚¤ãƒ‰ãƒãƒ¼(ã‚µãƒ–)',NULL,1,'<mt:include widget=\"æ¤œç´¢\"><mt:include widget=\"ãƒ›ãƒ¼ãƒ ãƒšãƒ¼ã‚¸ã‚¦ã‚£ã‚¸ã‚§ãƒƒãƒˆã‚°ãƒ«ãƒ¼ãƒ—\"><mt:include widget=\"About\">','widgetset',0),(51,1,0,0,1,1,'2020-11-24 14:20:59','2column_layout_sidebar',NULL,NULL,NULL,NULL,'2020-11-24 14:20:59','2ã‚«ãƒ©ãƒ ã®ã‚µã‚¤ãƒ‰ãƒãƒ¼',NULL,1,'<mt:include widget=\"æ¤œç´¢\"><mt:include widget=\"ãƒ–ãƒ­ã‚°\"><mt:include widget=\"About\"><mt:include widget=\"ãƒ›ãƒ¼ãƒ ãƒšãƒ¼ã‚¸ã‚¦ã‚£ã‚¸ã‚§ãƒƒãƒˆã‚°ãƒ«ãƒ¼ãƒ—\"><mt:include widget=\"ã‚¢ãƒ¼ã‚«ã‚¤ãƒ–ã‚¦ã‚£ã‚¸ã‚§ãƒƒãƒˆã‚°ãƒ«ãƒ¼ãƒ—\"><mt:include widget=\"ãƒšãƒ¼ã‚¸ä¸€è¦§\"><mt:include widget=\"è³¼èª­\"><mt:include widget=\"OpenIDå¯¾å¿œ\"><mt:include widget=\"Powered By\">','widgetset',0),(52,0,0,0,1,1,'2020-11-24 14:21:00','commenter_notify',NULL,NULL,NULL,NULL,'2020-11-24 14:21:00','ã‚³ãƒ¡ãƒ³ãƒˆã®é€šçŸ¥',NULL,1,'ã“ã‚Œã¯æ–°ã—ã„ãƒ¦ãƒ¼ã‚¶ãƒ¼ãŒãƒ–ãƒ­ã‚°ã€Œ<$mt:BlogName$>ã€ã«ç™»éŒ²ã‚’å®Œäº†ã—ãŸã“ã¨ã‚’é€šçŸ¥ã™ã‚‹ãƒ¡ãƒ¼ãƒ«ã§ã™ã€‚æ–°ã—ã„ãƒ¦ãƒ¼ã‚¶ãƒ¼ã®æƒ…å ±ã¯ä»¥ä¸‹ã«è¨˜è¼‰ã•ã‚Œã¦ã„ã¾ã™ã€‚\n\næ–°è¦ç™»éŒ²ãƒ¦ãƒ¼ã‚¶ãƒ¼:\nãƒ¦ãƒ¼ã‚¶ãƒ¼å: <$mt:CommenterUsername$> \nåå‰: <$mt:CommenterName$>\nãƒ¡ãƒ¼ãƒ«: <$mt:CommenterEmail$>\n\nã“ã®ãƒ¦ãƒ¼ã‚¶ãƒ¼ã®æƒ…å ±ã‚’è¦‹ãŸã‚Šç·¨é›†ã™ã‚‹å ´åˆã«ã¯ã€ä¸‹è¨˜ã®URLã‚’ã‚¯ãƒªãƒƒã‚¯ã™ã‚‹ã‹ã€URLã‚’ã‚³ãƒ”ãƒ¼ã—ã¦ãƒ–ãƒ©ã‚¦ã‚¶ã®ã‚¢ãƒ‰ãƒ¬ã‚¹æ¬„ã«è²¼ã‚Šä»˜ã‘ã¦ãã ã•ã„ã€‚\n<$mt:Var name=\"profile_url\"$>\n\n<$mt:Include module=\"ãƒ¡ãƒ¼ãƒ«ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n','email',0),(53,0,0,0,1,1,'2020-11-24 14:21:00','lockout-user',NULL,NULL,NULL,NULL,'2020-11-24 14:21:00','ãƒ¦ãƒ¼ã‚¶ãƒ¼ã‚¢ã‚«ã‚¦ãƒ³ãƒˆã®ãƒ­ãƒƒã‚¯é€šçŸ¥',NULL,1,'ã“ã‚Œã¯ä»¥ä¸‹ã®ãƒ¦ãƒ¼ã‚¶ãƒ¼ã‚¢ã‚«ã‚¦ãƒ³ãƒˆãŒãƒ­ãƒƒã‚¯ã•ã‚ŒãŸã“ã¨ã‚’é€šçŸ¥ã™ã‚‹ãƒ¡ãƒ¼ãƒ«ã§ã™ã€‚\n\nãƒ¦ãƒ¼ã‚¶ãƒ¼å: <mt:AuthorName> \nè¡¨ç¤ºå: <mt:AuthorDisplayName>\nãƒ¡ãƒ¼ãƒ«: <mt:AuthorEmail>\n\nãƒ¦ãƒ¼ã‚¶ãƒ¼ã®ãƒ­ãƒƒã‚¯ã‚’è§£é™¤ã™ã‚‹å ´åˆã¯ã€ãƒªãƒ³ã‚¯ã‚’ã‚¯ãƒªãƒƒã‚¯ã—ã¦ãã ã•ã„ã€‚\n\n<mt:var name=\"recover_lockout_link\">\n\n<mt:include module=\"ãƒ¡ãƒ¼ãƒ«ãƒ•ãƒƒã‚¿ãƒ¼\">\n','email',0),(54,0,0,0,1,1,'2020-11-24 14:21:00','lockout-ip',NULL,NULL,NULL,NULL,'2020-11-24 14:21:00','IPã‚¢ãƒ‰ãƒ¬ã‚¹ã®ãƒ­ãƒƒã‚¯é€šçŸ¥',NULL,1,'ã“ã‚Œã¯ä»¥ä¸‹ã®IPã‚¢ãƒ‰ãƒ¬ã‚¹ã‹ã‚‰ã®ã‚¢ã‚¯ã‚»ã‚¹ãŒãƒ­ãƒƒã‚¯ã•ã‚ŒãŸã“ã¨ã‚’é€šçŸ¥ã™ã‚‹ãƒ¡ãƒ¼ãƒ«ã§ã™ã€‚\n\nIPã‚¢ãƒ‰ãƒ¬ã‚¹: <mt:var name=\"ip_address\"> \nè§£é™¤æ™‚åˆ»: <mt:Date ts=\"$recovery_time\">\n\n<mt:include module=\"ãƒ¡ãƒ¼ãƒ«ãƒ•ãƒƒã‚¿ãƒ¼\">\n','email',0),(55,0,0,0,1,1,'2020-11-24 14:21:00','new-ping',NULL,NULL,NULL,NULL,'2020-11-24 14:21:00','æ–°ã—ã„ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯',NULL,1,'<mt:If name=\"unapproved\" trim=\"1\">\n  <mt:If name=\"entry_id\">\n    <mt:If tag=\"EntryClass\" eq=\"entry\">\n      ã‚µã‚¤ãƒˆ \'<$mt:BlogName$>\' ã®è¨˜äº‹ \'<$mt:EntryTitle$>\' (ID:<$mt:EntryID$>) ã«æœªå…¬é–‹ã®ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ãŒã‚ã‚Šã¾ã™ã€‚å…¬é–‹ã™ã‚‹ã¾ã§ã“ã®ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ã¯ã‚µã‚¤ãƒˆã«è¡¨ç¤ºã•ã‚Œã¾ã›ã‚“ã€‚\n    <mt:Else>\n      ã‚µã‚¤ãƒˆ \'<$mt:BlogName$>\' ã®ã‚¦ã‚§ãƒ–ãƒšãƒ¼ã‚¸ \'<$mt:PageTitle$>\' (ID:<$mt:PageID$>) ã«æœªå…¬é–‹ã®ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ãŒã‚ã‚Šã¾ã™ã€‚å…¬é–‹ã™ã‚‹ã¾ã§ã“ã®ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ã¯ã‚µã‚¤ãƒˆã«è¡¨ç¤ºã•ã‚Œã¾ã›ã‚“ã€‚\n    </mt:If>\n  <mt:ElseIf name=\"category_id\">\n    ã‚µã‚¤ãƒˆ \'<$mt:BlogName$>\' ã®ã‚«ãƒ†ã‚´ãƒª \'<$mt:CategoryLabel$>\' (ID:<$mt:CategoryID$>) ã«æœªå…¬é–‹ã®ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ãŒã‚ã‚Šã¾ã™ã€‚å…¬é–‹ã™ã‚‹ã¾ã§ã“ã®ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ã¯ã‚µã‚¤ãƒˆã«è¡¨ç¤ºã•ã‚Œã¾ã›ã‚“ã€‚\n  </mt:If>\n<mt:Else>\n  <mt:If name=\"entry_id\">\n    <mt:If tag=\"EntryClass\" eq=\"entry\">\n      ã‚µã‚¤ãƒˆ \'<$mt:BlogName$>\' ã®è¨˜äº‹ \'<$mt:EntryTitle$>\' (ID:<$mt:EntryID$>) ã«æ–°ã—ã„ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ãŒã‚ã‚Šã¾ã™ã€‚\n    <mt:Else>\n      ã‚µã‚¤ãƒˆ \'<$mt:BlogName$>\' ã®ã‚¦ã‚§ãƒ–ãƒšãƒ¼ã‚¸ \'<$mt:PageTitle$>\' (ID:<$mt:PageID$>) ã«æ–°ã—ã„ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ãŒã‚ã‚Šã¾ã™ã€‚\n    </mt:If>\n  <mt:ElseIf name=\"category_id\">\n    ã‚µã‚¤ãƒˆ \'<$mt:BlogName$>\' ã®ã‚«ãƒ†ã‚´ãƒª \'<$mt:CategoryLabel$>\' (ID:<$mt:CategoryID$>) ã«æ–°ã—ã„ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ãŒã‚ã‚Šã¾ã™ã€‚\n  </mt:If>\n</mt:If>\n\næ¦‚è¦: \n<$mt:PingExcerpt wrap_text=\"72\"$>\n\nURL: <$mt:PingURL$>\nã‚¿ã‚¤ãƒˆãƒ«: <$mt:PingTitle$>\nãƒ–ãƒ­ã‚°: <$mt:PingBlogName$>\nIPã‚¢ãƒ‰ãƒ¬ã‚¹: <$mt:PingIP$>\n\n<mt:If name=\"state_editable\"><mt:If name=\"unapproved\">ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ã‚’æ‰¿èªã™ã‚‹: \n  <<$mt:Var name=\"approve_url\"$>>\n</mt:If></mt:If>\n<mt:If name=\"entry_id\"><mt:If tag=\"EntryPermalink\">ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ã‚’è¦‹ã‚‹: \n  <<$mt:EntryPermalink$>>\n</mt:If></mt:If>\n<mt:If name=\"state_editable\">ãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ã‚’ã‚¹ãƒ‘ãƒ ã¨ã—ã¦å ±å‘Šã™ã‚‹: \n  <<$mt:Var name=\"spam_url\"$>>\n</mt:If>\nãƒˆãƒ©ãƒƒã‚¯ãƒãƒƒã‚¯ã®ç·¨é›†: \n  <<$mt:Var name=\"edit_url\"$>>\n\n<$mt:Include module=\"ãƒ¡ãƒ¼ãƒ«ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n','email',0),(56,0,0,0,1,1,'2020-11-24 14:21:00','comment_throttle',NULL,NULL,NULL,NULL,'2020-11-24 14:21:00','ã‚³ãƒ¡ãƒ³ãƒˆã‚¹ãƒ­ãƒƒãƒˆãƒ«',NULL,1,'<mt:SetVarBlock name=\"message\">ã“ã‚ŒãŒé–“é•ã„ã§ã‚ã‚‹å ´åˆã¯ã€Movable Typeã«ã‚µã‚¤ãƒ³ã‚¤ãƒ³ã—ã¦ã€ãƒ–ãƒ­ã‚°ã®è¨­å®šç”»é¢ã«é€²ã¿ã€ç¦æ­¢IPãƒªã‚¹ãƒˆã‹ã‚‰IPã‚¢ãƒ‰ãƒ¬ã‚¹ã‚’å‰Šé™¤ã—ã¦ãã ã•ã„ã€‚</mt:SetVarBlock>\n<$mt:BlogName$>ã‚’ç¦æ­¢ã—ã¾ã—ãŸã€‚<$mt:Var name=\"throttle_seconds\"$>ç§’ã®é–“ã«è¨±å¯ã•ã‚ŒãŸä»¥ä¸Šã®ã‚³ãƒ¡ãƒ³ãƒˆã‚’é€ä¿¡ã—ã¦ãã¾ã—ãŸã€‚\n\nã“ã‚Œã¯æ‚ªæ„ã®ã‚¹ã‚¯ãƒªãƒ—ãƒˆãŒãƒ–ãƒ­ã‚°ã‚’ã‚³ãƒ¡ãƒ³ãƒˆã§é£½å’Œã•ã›ã‚‹ã®ã‚’é˜»æ­¢ã™ã‚‹ãŸã‚ã®æŽªç½®ã§ã™ã€‚ä»¥ä¸‹ã®IPã‚¢ãƒ‰ãƒ¬ã‚¹ã‚’ç¦æ­¢ã—ã¾ã—ãŸã€‚\n\n<$mt:Var name=\"throttled_ip\"$>\n\n<$mt:Var name=\"message\"$>\n','email',0),(57,0,0,0,1,1,'2020-11-24 14:21:00','recover-password',NULL,NULL,NULL,NULL,'2020-11-24 14:21:00','ãƒ‘ã‚¹ãƒ¯ãƒ¼ãƒ‰ã®å†è¨­å®š',NULL,1,'ãƒ‘ã‚¹ãƒ¯ãƒ¼ãƒ‰ã‚’ãƒªã‚»ãƒƒãƒˆã—ã‚ˆã†ã¨ã—ã¦ã„ã¾ã™ã€‚ä»¥ä¸‹ã®ãƒªãƒ³ã‚¯ã‚’ã‚¯ãƒªãƒƒã‚¯ã—ã¦ã€æ–°ã—ã„ãƒ‘ã‚¹ãƒ¯ãƒ¼ãƒ‰ã‚’è¨­å®šã—ã¦ãã ã•ã„ã€‚\n\n<mt:var name=\"link_to_login\">\n\nã“ã®ãƒ¡ãƒ¼ãƒ«ã«å¿ƒå½“ãŸã‚ŠãŒãªã„ã¨ãã¯ã€ä½•ã‚‚ã›ãšã«ç„¡è¦–ã—ã¦ãã ã•ã„ã€‚\n\n<mt:include module=\"ãƒ¡ãƒ¼ãƒ«ãƒ•ãƒƒã‚¿ãƒ¼\">\n','email',0),(58,0,0,0,1,1,'2020-11-24 14:21:00','new-comment',NULL,NULL,NULL,NULL,'2020-11-24 14:21:00','æ–°ã—ã„ã‚³ãƒ¡ãƒ³ãƒˆ',NULL,1,'<mt:If name=\"unapproved\" trim=\"1\">\n    <mt:If tag=\"EntryClass\" eq=\"entry\">\n        æœªå…¬é–‹ã®ã‚³ãƒ¡ãƒ³ãƒˆãŒã‚µã‚¤ãƒˆ \'<$mt:BlogName$>\' ã®è¨˜äº‹ \'<$mt:EntryTitle$>\' (ID:<$mt:EntryID$>) ã«æŠ•ç¨¿ã•ã‚Œã¾ã—ãŸã€‚å…¬é–‹ã™ã‚‹ã¾ã§ã“ã®ã‚³ãƒ¡ãƒ³ãƒˆã¯ã‚µã‚¤ãƒˆã«è¡¨ç¤ºã•ã‚Œã¾ã›ã‚“ã€‚\n    <mt:Else>\n        æœªå…¬é–‹ã®ã‚³ãƒ¡ãƒ³ãƒˆãŒã‚µã‚¤ãƒˆ \'<$mt:BlogName$>\' ã®ã‚¦ã‚§ãƒ–ãƒšãƒ¼ã‚¸ \'<$mt:PageTitle$>\' (ID:<$mt:PageID$>) ã«æŠ•ç¨¿ã•ã‚Œã¾ã—ãŸã€‚å…¬é–‹ã™ã‚‹ã¾ã§ã“ã®ã‚³ãƒ¡ãƒ³ãƒˆã¯ã‚µã‚¤ãƒˆã«è¡¨ç¤ºã•ã‚Œã¾ã›ã‚“ã€‚\n    </mt:If>\n<mt:Else>\n    <mt:If tag=\"EntryClass\" eq=\"entry\">\n        ã‚µã‚¤ãƒˆ \'<$mt:BlogName$>\' ã®è¨˜äº‹ \'<$mt:EntryTitle$>\' (ID:<$mt:EntryID$>) ã«æ–°ã—ã„ã‚³ãƒ¡ãƒ³ãƒˆãŒæŠ•ç¨¿ã•ã‚Œã¾ã—ãŸã€‚\n    <mt:Else>\n        ã‚µã‚¤ãƒˆ \'<$mt:BlogName$>\' ã®ã‚¦ã‚§ãƒ–ãƒšãƒ¼ã‚¸ \'<$mt:PageTitle$>\' (ID:<$mt:PageID$>) ã«æ–°ã—ã„ã‚³ãƒ¡ãƒ³ãƒˆãŒæŠ•ç¨¿ã•ã‚Œã¾ã—ãŸã€‚\n    </mt:If>\n</mt:If>\n\n<$mt:CommentBody remove_html=\"1\" wrap_text=\"72\"$>\n\nã‚³ãƒ¡ãƒ³ãƒˆæŠ•ç¨¿è€…: <$mt:CommentAuthor$> \nãƒ¡ãƒ¼ãƒ«ã‚¢ãƒ‰ãƒ¬ã‚¹: <$mt:CommentEmail$>\nURL: <$mt:CommentURL$>\nIPã‚¢ãƒ‰ãƒ¬ã‚¹: <$mt:CommentIP$>\n\n<mt:If name=\"unapproved\"><mt:If name=\"state_editable\">ã‚³ãƒ¡ãƒ³ãƒˆã‚’æ‰¿èªã™ã‚‹:\n    <<$mt:Var name=\"approve_url\"$>></mt:If></mt:If>\n<mt:If name=\"view_url\">ã‚³ãƒ¡ãƒ³ãƒˆã‚’è¦‹ã‚‹:\n    <<$mt:Var name=\"view_url\" escape=\"html\"$>></mt:If>\nã‚³ãƒ¡ãƒ³ãƒˆã‚’ç·¨é›†ã™ã‚‹:\n    <<$mt:Var name=\"edit_url\"$>>\n<mt:If name=\"state_editable\">ã‚³ãƒ¡ãƒ³ãƒˆã‚’ã‚¹ãƒ‘ãƒ ã¨ã—ã¦å ±å‘Šã™ã‚‹:\n    <<$mt:Var name=\"spam_url\"$>></mt:If>\n\n<$mt:Include module=\"ãƒ¡ãƒ¼ãƒ«ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n','email',0),(59,0,0,0,1,1,'2020-11-24 14:21:00','notify-entry',NULL,NULL,NULL,NULL,'2020-11-24 14:21:00','è¨˜äº‹ã®å…±æœ‰',NULL,1,'æ–°ã—ã„<$mt:EntryClassLabel$>ã€Œ<$mt:EntryTitle$>ã€ã‚’<$mt:BlogName$>ã§å…¬é–‹ã—ã¾ã—ãŸã€‚\n\n<mt:If name=\"object_type\" eq=\"entry\">è¡¨ç¤ºã™ã‚‹<mt:Else>è¡¨ç¤ºã™ã‚‹</mt:If> <<mt:SetVarBlock name=\"entry_status\"><$mt:EntryStatus$></mt:SetVarBlock><mt:If name=\"entry_status\" eq=\"Publish\"><$mt:EntryPermalink$><mt:Else><$mt:Var name=\"entry_editurl\"$></mt:If>>\n\n------------------------------------------------------------------------\nã‚¿ã‚¤ãƒˆãƒ«: <$mt:EntryTitle$>\næ—¥ä»˜: <$mt:EntryDate mail=\"1\"$>\n<mt:If name=\"send_excerpt\">\n\n<$mt:EntryExcerpt wrap_text=\"72\"$>\n</mt:If>\n------------------------------------------------------------------------\n\n<mt:If name=\"message\">ãƒ¡ãƒƒã‚»ãƒ¼ã‚¸: \n<$mt:Var name=\"message\"$></mt:If>\n<mt:If name=\"send_body\">\n------------------------------------------------------------------------\n\n<$mt:EntryBody remove_html=\"1\" wrap_text=\"72\"$>\n\n------------------------------------------------------------------------</mt:If>\n\nã“ã®ãƒ¡ãƒ¼ãƒ«ã¯<$mt:BlogName$>ã§æ–°è¦ã«ä½œæˆã•ã‚ŒãŸã‚³ãƒ³ãƒ†ãƒ³ãƒ„ã«é–¢ã™ã‚‹é€šçŸ¥ã‚’é€ã‚‹ã‚ˆã†ã«è¨­å®šã•ã‚Œã¦ã„ã‚‹ã‹ã€ã¾ãŸã¯ã‚³ãƒ³ãƒ†ãƒ³ãƒ„ã®è‘—è€…ãŒé¸æŠžã—ãŸãƒ¦ãƒ¼ã‚¶ãƒ¼ã«é€ä¿¡ã•ã‚Œã¦ã„ã¾ã™ã€‚ã“ã®ãƒ¡ãƒ¼ãƒ«ã‚’å—ä¿¡ã—ãŸããªã„å ´åˆã¯ã€æ¬¡ã®ãƒ¦ãƒ¼ã‚¶ãƒ¼ã«é€£çµ¡ã—ã¦ãã ã•ã„:\n\n<mt:if name=\"entry_author\"><$mt:AuthorDisplayName$> <<$mt:AuthorEmail$>><mt:else><$mt:var name=\"from_address\"$></mt:if>\n','email',0),(60,0,0,0,1,1,'2020-11-24 14:21:00','footer-email',NULL,NULL,NULL,NULL,'2020-11-24 14:21:00','ãƒ¡ãƒ¼ãƒ«ãƒ•ãƒƒã‚¿ãƒ¼',NULL,1,'\n-- \nPowered by Movable Type <$mt:Version$>\n<$mt:Var name=\"portal_url\"$>\n','custom',0),(61,0,0,0,1,1,'2020-11-24 14:21:00','commenter_confirm',NULL,NULL,NULL,NULL,'2020-11-24 14:21:00','ã‚³ãƒ¡ãƒ³ãƒˆã®ç¢ºèª',NULL,1,'<$mt:BlogName$>ã«ã‚³ãƒ¡ãƒ³ãƒˆã™ã‚‹ãŸã‚ã«ç™»éŒ²ã—ã¦ã„ãŸã ãã‚ã‚ŠãŒã¨ã†ã”ã–ã„ã¾ã™ã€‚ \n\nã‚»ã‚­ãƒ¥ãƒªãƒ†ã‚£ä¸Šã®ç†ç”±ã‹ã‚‰ã€ç™»éŒ²ã‚’å®Œäº†ã™ã‚‹å‰ã«ã‚¢ã‚«ã‚¦ãƒ³ãƒˆã¨ãƒ¡ãƒ¼ãƒ«ã‚¢ãƒ‰ãƒ¬ã‚¹ã®ç¢ºèªã‚’è¡Œã£ã¦ã„ã¾ã™ã€‚ç¢ºèªã‚’å®Œäº†æ¬¡ç¬¬ã€<$mt:BlogName$>ã«ã‚³ãƒ¡ãƒ³ãƒˆã§ãã‚‹ã‚ˆã†ã«ãªã‚Šã¾ã™ã€‚\n\nã‚¢ã‚«ã‚¦ãƒ³ãƒˆã®ç¢ºèªã®ãŸã‚ã€æ¬¡ã®URLã‚’ã‚¯ãƒªãƒƒã‚¯ã™ã‚‹ã‹ã€ã‚³ãƒ”ãƒ¼ã—ã¦ãƒ–ãƒ©ã‚¦ã‚¶ã®ã‚¢ãƒ‰ãƒ¬ã‚¹æ¬„ã«è²¼ã‚Šä»˜ã‘ã¦ãã ã•ã„ã€‚\n\n<$mt:Var name=\"confirm_url\"$>\n\nã“ã®ãƒ¡ãƒ¼ãƒ«ã«è¦šãˆãŒãªã„å ´åˆã‚„ã€<$mt:BlogName$>ã«ç™»éŒ²ã™ã‚‹ã®ã‚’ã‚„ã‚ãŸã„å ´åˆã¯ã€ä½•ã‚‚ã™ã‚‹å¿…è¦ã¯ã‚ã‚Šã¾ã›ã‚“ã€‚\n\n \n<mt:If tag=\"AuthorDisplayName\"><$mt:AuthorDisplayName encode_html=\"1\"$><mt:Else>Movable Type</mt:If>\n\n<$mt:Include module=\"ãƒ¡ãƒ¼ãƒ«ãƒ•ãƒƒã‚¿ãƒ¼\"$>\n','email',0);
/*!40000 ALTER TABLE `mt_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_template_meta`
--

DROP TABLE IF EXISTS `mt_template_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_template_meta` (
  `template_meta_template_id` int(11) NOT NULL,
  `template_meta_type` varchar(75) NOT NULL,
  `template_meta_vchar` varchar(255) DEFAULT NULL,
  `template_meta_vchar_idx` varchar(255) DEFAULT NULL,
  `template_meta_vdatetime` datetime DEFAULT NULL,
  `template_meta_vdatetime_idx` datetime DEFAULT NULL,
  `template_meta_vinteger` int(11) DEFAULT NULL,
  `template_meta_vinteger_idx` int(11) DEFAULT NULL,
  `template_meta_vfloat` float DEFAULT NULL,
  `template_meta_vfloat_idx` float DEFAULT NULL,
  `template_meta_vblob` mediumblob,
  `template_meta_vclob` mediumtext,
  PRIMARY KEY (`template_meta_template_id`,`template_meta_type`),
  KEY `mt_template_meta_type_vint` (`template_meta_type`,`template_meta_vinteger_idx`),
  KEY `mt_template_meta_type_vchar` (`template_meta_type`,`template_meta_vchar_idx`),
  KEY `mt_template_meta_type_vflt` (`template_meta_type`,`template_meta_vfloat_idx`),
  KEY `mt_template_meta_type_vdt` (`template_meta_type`,`template_meta_vdatetime_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_template_meta`
--

LOCK TABLES `mt_template_meta` WRITE;
/*!40000 ALTER TABLE `mt_template_meta` DISABLE KEYS */;
INSERT INTO `mt_template_meta` VALUES (49,'modulesets','34,26,24,13,22,10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'modulesets','44,38,11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'modulesets','44,34,11,38,26,24,13,22,10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mt_template_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_template_rev`
--

DROP TABLE IF EXISTS `mt_template_rev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_template_rev` (
  `template_rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_rev_changed` varchar(255) NOT NULL,
  `template_rev_created_by` int(11) DEFAULT NULL,
  `template_rev_created_on` datetime DEFAULT NULL,
  `template_rev_description` varchar(255) DEFAULT NULL,
  `template_rev_label` varchar(255) DEFAULT NULL,
  `template_rev_modified_by` int(11) DEFAULT NULL,
  `template_rev_modified_on` datetime DEFAULT NULL,
  `template_rev_rev_number` int(11) NOT NULL DEFAULT '0',
  `template_rev_template` mediumblob NOT NULL,
  `template_rev_template_id` int(11) NOT NULL,
  PRIMARY KEY (`template_rev_id`),
  KEY `mt_template_rev_template_id` (`template_rev_template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_template_rev`
--

LOCK TABLES `mt_template_rev` WRITE;
/*!40000 ALTER TABLE `mt_template_rev` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_template_rev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_templatemap`
--

DROP TABLE IF EXISTS `mt_templatemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_templatemap` (
  `templatemap_id` int(11) NOT NULL AUTO_INCREMENT,
  `templatemap_archive_type` varchar(25) NOT NULL,
  `templatemap_blog_id` int(11) NOT NULL,
  `templatemap_build_interval` int(11) DEFAULT NULL,
  `templatemap_build_type` smallint(6) DEFAULT '1',
  `templatemap_file_template` varchar(255) DEFAULT NULL,
  `templatemap_is_preferred` tinyint(4) DEFAULT NULL,
  `templatemap_template_id` int(11) NOT NULL,
  PRIMARY KEY (`templatemap_id`),
  KEY `mt_templatemap_template_id` (`templatemap_template_id`),
  KEY `mt_templatemap_blog_id` (`templatemap_blog_id`),
  KEY `mt_templatemap_is_preferred` (`templatemap_is_preferred`),
  KEY `mt_templatemap_archive_type` (`templatemap_archive_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_templatemap`
--

LOCK TABLES `mt_templatemap` WRITE;
/*!40000 ALTER TABLE `mt_templatemap` DISABLE KEYS */;
INSERT INTO `mt_templatemap` VALUES (1,'Monthly',1,NULL,1,NULL,1,4),(2,'Page',1,NULL,1,NULL,1,6),(3,'Individual',1,NULL,1,NULL,1,8),(4,'Category',1,NULL,1,NULL,1,23);
/*!40000 ALTER TABLE `mt_templatemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_touch`
--

DROP TABLE IF EXISTS `mt_touch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_touch` (
  `touch_id` int(11) NOT NULL AUTO_INCREMENT,
  `touch_blog_id` int(11) DEFAULT NULL,
  `touch_modified_on` datetime DEFAULT NULL,
  `touch_object_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`touch_id`),
  KEY `mt_touch_blog_type` (`touch_blog_id`,`touch_object_type`,`touch_modified_on`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_touch`
--

LOCK TABLES `mt_touch` WRITE;
/*!40000 ALTER TABLE `mt_touch` DISABLE KEYS */;
INSERT INTO `mt_touch` VALUES (1,0,'2020-11-24 05:21:23','author'),(3,1,'2020-11-24 05:23:59','entry'),(2,1,'2020-11-24 05:21:00','template');
/*!40000 ALTER TABLE `mt_touch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_trackback`
--

DROP TABLE IF EXISTS `mt_trackback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_trackback` (
  `trackback_id` int(11) NOT NULL AUTO_INCREMENT,
  `trackback_blog_id` int(11) NOT NULL,
  `trackback_category_id` int(11) NOT NULL DEFAULT '0',
  `trackback_created_by` int(11) DEFAULT NULL,
  `trackback_created_on` datetime DEFAULT NULL,
  `trackback_description` mediumtext,
  `trackback_entry_id` int(11) NOT NULL DEFAULT '0',
  `trackback_is_disabled` tinyint(4) DEFAULT '0',
  `trackback_modified_by` int(11) DEFAULT NULL,
  `trackback_modified_on` datetime DEFAULT NULL,
  `trackback_passphrase` varchar(30) DEFAULT NULL,
  `trackback_rss_file` varchar(255) DEFAULT NULL,
  `trackback_title` varchar(255) DEFAULT NULL,
  `trackback_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trackback_id`),
  KEY `mt_trackback_category_id` (`trackback_category_id`),
  KEY `mt_trackback_created_on` (`trackback_created_on`),
  KEY `mt_trackback_entry_id` (`trackback_entry_id`),
  KEY `mt_trackback_blog_id` (`trackback_blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_trackback`
--

LOCK TABLES `mt_trackback` WRITE;
/*!40000 ALTER TABLE `mt_trackback` DISABLE KEYS */;
INSERT INTO `mt_trackback` VALUES (1,1,0,1,'2020-11-24 14:23:58','Webå¤šè¨€èªžåŒ–ã‚„ã‚µã‚¤ãƒˆç¿»è¨³ã®èª²é¡Œã«ç­”ãˆã‚‹ã‚½ãƒªãƒ¥ãƒ¼ã‚·ãƒ§ãƒ³ ã‚µãƒ¼ãƒ“ã‚¹ã®å›½éš›åŒ–ã«ä¼´ã†é–‹...',1,0,NULL,'2020-11-24 14:23:58',NULL,NULL,'ã‚µãƒ³ãƒ—ãƒ«ãƒšãƒ¼ã‚¸','http://127.0.0.1:8080/2020/11/post.html');
/*!40000 ALTER TABLE `mt_trackback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_ts_error`
--

DROP TABLE IF EXISTS `mt_ts_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_ts_error` (
  `ts_error_error_time` int(11) NOT NULL,
  `ts_error_funcid` int(11) NOT NULL DEFAULT '0',
  `ts_error_jobid` int(11) NOT NULL,
  `ts_error_message` mediumtext NOT NULL,
  KEY `mt_ts_error_funcid_time` (`ts_error_funcid`,`ts_error_error_time`),
  KEY `mt_ts_error_jobid` (`ts_error_jobid`),
  KEY `mt_ts_error_error_time` (`ts_error_error_time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_ts_error`
--

LOCK TABLES `mt_ts_error` WRITE;
/*!40000 ALTER TABLE `mt_ts_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_ts_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_ts_exitstatus`
--

DROP TABLE IF EXISTS `mt_ts_exitstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_ts_exitstatus` (
  `ts_exitstatus_jobid` int(11) NOT NULL,
  `ts_exitstatus_completion_time` int(11) DEFAULT NULL,
  `ts_exitstatus_delete_after` int(11) DEFAULT NULL,
  `ts_exitstatus_funcid` int(11) NOT NULL,
  `ts_exitstatus_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`ts_exitstatus_jobid`),
  KEY `mt_ts_exitstatus_funcid` (`ts_exitstatus_funcid`),
  KEY `mt_ts_exitstatus_delete_after` (`ts_exitstatus_delete_after`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_ts_exitstatus`
--

LOCK TABLES `mt_ts_exitstatus` WRITE;
/*!40000 ALTER TABLE `mt_ts_exitstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_ts_exitstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_ts_funcmap`
--

DROP TABLE IF EXISTS `mt_ts_funcmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_ts_funcmap` (
  `ts_funcmap_funcid` int(11) NOT NULL AUTO_INCREMENT,
  `ts_funcmap_funcname` varchar(255) NOT NULL,
  PRIMARY KEY (`ts_funcmap_funcid`),
  UNIQUE KEY `mt_ts_funcmap_funcname` (`ts_funcmap_funcname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_ts_funcmap`
--

LOCK TABLES `mt_ts_funcmap` WRITE;
/*!40000 ALTER TABLE `mt_ts_funcmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_ts_funcmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mt_ts_job`
--

DROP TABLE IF EXISTS `mt_ts_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mt_ts_job` (
  `ts_job_jobid` int(11) NOT NULL AUTO_INCREMENT,
  `ts_job_arg` mediumblob,
  `ts_job_coalesce` varchar(255) DEFAULT NULL,
  `ts_job_funcid` int(11) NOT NULL,
  `ts_job_grabbed_until` int(11) NOT NULL,
  `ts_job_insert_time` int(11) DEFAULT NULL,
  `ts_job_priority` int(11) DEFAULT NULL,
  `ts_job_run_after` int(11) NOT NULL,
  `ts_job_uniqkey` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ts_job_jobid`),
  UNIQUE KEY `mt_ts_job_uniqfunc` (`ts_job_funcid`,`ts_job_uniqkey`),
  KEY `mt_ts_job_funccoal` (`ts_job_funcid`,`ts_job_coalesce`),
  KEY `mt_ts_job_funcrun` (`ts_job_funcid`,`ts_job_run_after`),
  KEY `mt_ts_job_funcpri` (`ts_job_funcid`,`ts_job_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mt_ts_job`
--

LOCK TABLES `mt_ts_job` WRITE;
/*!40000 ALTER TABLE `mt_ts_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `mt_ts_job` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-24  5:39:36
