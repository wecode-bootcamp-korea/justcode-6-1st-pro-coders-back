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
-- Table structure for table `cart`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_size_id` int NOT NULL,
  `count` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_size_id` (`product_size_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_size_id`) REFERENCES `product_size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `cart_data`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cart_data` AS SELECT
 1 AS `cart_id`,
 1 AS `user_id`,
 1 AS `title`,
 1 AS `color`,
 1 AS `size`,
 1 AS `count`,
 1 AS `price`,
 1 AS `duped_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `color`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gender`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `image_arr_by_product`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `image_arr_by_product` AS SELECT
 1 AS `id`,
 1 AS `main`,
 1 AS `sub`,
 1 AS `more`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `images`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `source` varchar(3000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `information`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `contents` varchar(5000) NOT NULL,
  `material` varchar(300) NOT NULL,
  `sizes` varchar(300) NOT NULL,
  `manufacturer` varchar(300) NOT NULL,
  `country_of_manufacture` varchar(300) NOT NULL,
  `caution` varchar(300) NOT NULL,
  `guarantee` varchar(300) NOT NULL,
  `service_information` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `information_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyword`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyword` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `product_data_for_cart`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_data_for_cart` AS SELECT
 1 AS `id`,
 1 AS `title`,
 1 AS `color`,
 1 AS `size`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `product_detail`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_detail` AS SELECT
 1 AS `id`,
 1 AS `keyword`,
 1 AS `title`,
 1 AS `product_code`,
 1 AS `price`,
 1 AS `is_discounted`,
 1 AS `discount_percent`,
 1 AS `discounted_price`,
 1 AS `main_image`,
 1 AS `sub_image`,
 1 AS `back_image`,
 1 AS `high_image`,
 1 AS `contents`,
 1 AS `material`,
 1 AS `sizes`,
 1 AS `manufacturer`,
 1 AS `country_of_manufacture`,
 1 AS `caution`,
 1 AS `guarantee`,
 1 AS `service_information`,
 1 AS `gender`,
 1 AS `subcategory_items`,
 1 AS `images`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product_size`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `size_id` int NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `size_id` (`size_id`),
  CONSTRAINT `product_size_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_size_ibfk_2` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `product_summary`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_summary` AS SELECT
 1 AS `id`,
 1 AS `type`,
 1 AS `category`,
 1 AS `keyword`,
 1 AS `title`,
 1 AS `price`,
 1 AS `is_discounted`,
 1 AS `discount_percent`,
 1 AS `discounted_price`,
 1 AS `main_image`,
 1 AS `sub_image`,
 1 AS `gender`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `products`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_code` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `price` decimal(7,0) NOT NULL,
  `price_c` varchar(100) DEFAULT NULL,
  `is_discounted` tinyint NOT NULL,
  `discount_percent` decimal(7,0) DEFAULT NULL,
  `discounted_price` decimal(7,0) DEFAULT NULL,
  `discounted_price_c` varchar(100) DEFAULT NULL,
  `color_id` int DEFAULT NULL,
  `keyword_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `subcategory_id` int DEFAULT NULL,
  `gender_id` int DEFAULT NULL,
  `main_image` varchar(3000) DEFAULT NULL,
  `sub_image` varchar(3000) DEFAULT NULL,
  `back_image` varchar(3000) DEFAULT NULL,
  `high_image` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_code` (`product_code`),
  KEY `color_id` (`color_id`),
  KEY `keyword_id` (`keyword_id`),
  KEY `type_id` (`type_id`),
  KEY `category_id` (`category_id`),
  KEY `subcategory_id` (`subcategory_id`),
  KEY `gender_id` (`gender_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`id`),
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `products_ibfk_4` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `products_ibfk_5` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`),
  CONSTRAINT `products_ibfk_6` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `search_base`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `search_base` AS SELECT
 1 AS `id`,
 1 AS `keyword`,
 1 AS `title`,
 1 AS `product_code`,
 1 AS `contents`,
 1 AS `material`,
 1 AS `gender`,
 1 AS `category_name`,
 1 AS `subcategory_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `size`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `size_by_product`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `size_by_product` AS SELECT
 1 AS `id`,
 1 AS `size`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `store`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(300) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `time` varchar(300) NOT NULL,
  `type_id` int NOT NULL,
  `lat` decimal(9,6) NOT NULL,
  `lng` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `store_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `store_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `store_data`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `store_data` AS SELECT
 1 AS `id`,
 1 AS `name`,
 1 AS `address`,
 1 AS `tel`,
 1 AS `time`,
 1 AS `type`,
 1 AS `lat`,
 1 AS `lng`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `store_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcategory`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `date_of_birth` varchar(100) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dormancy_prevention_period` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'procoders'
--

--
-- Final view structure for view `cart_data`
--

/*!50001 DROP VIEW IF EXISTS `cart_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cart_data` AS select `c`.`id` AS `cart_id`,`c`.`user_id` AS `user_id`,`p`.`title` AS `title`,`p`.`color` AS `color`,`p`.`size` AS `size`,`c`.`count` AS `count`,`p`.`price` AS `price`,(`p`.`price` * `c`.`count`) AS `duped_price` from (`cart` `c` left join `product_data_for_cart` `p` on((`c`.`product_size_id` = `p`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `image_arr_by_product`
--

/*!50001 DROP VIEW IF EXISTS `image_arr_by_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `image_arr_by_product` AS select `p`.`id` AS `id`,`p`.`main_image` AS `main`,`p`.`sub_image` AS `sub`,json_arrayagg(`i`.`source`) AS `more` from (`products` `p` join `images` `i` on((`p`.`id` = `i`.`product_id`))) group by `i`.`product_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_data_for_cart`
--

/*!50001 DROP VIEW IF EXISTS `product_data_for_cart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_data_for_cart` AS select `ps`.`id` AS `id`,`p`.`title` AS `title`,`c`.`name` AS `color`,`s`.`name` AS `size`,`p`.`discounted_price` AS `price` from (((`product_size` `ps` left join `products` `p` on((`ps`.`product_id` = `p`.`id`))) left join `size` `s` on((`ps`.`size_id` = `s`.`id`))) left join `color` `c` on((`p`.`color_id` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_detail`
--

/*!50001 DROP VIEW IF EXISTS `product_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_detail` AS select `products`.`id` AS `id`,`keyword`.`name` AS `keyword`,`products`.`title` AS `title`,`products`.`product_code` AS `product_code`,`products`.`price_c` AS `price`,`products`.`is_discounted` AS `is_discounted`,`products`.`discount_percent` AS `discount_percent`,`products`.`discounted_price_c` AS `discounted_price`,`products`.`main_image` AS `main_image`,`products`.`sub_image` AS `sub_image`,`products`.`back_image` AS `back_image`,`products`.`high_image` AS `high_image`,`information`.`contents` AS `contents`,`information`.`material` AS `material`,`information`.`sizes` AS `sizes`,`information`.`manufacturer` AS `manufacturer`,`information`.`country_of_manufacture` AS `country_of_manufacture`,`information`.`caution` AS `caution`,`information`.`guarantee` AS `guarantee`,`information`.`service_information` AS `service_information`,`gender`.`name` AS `gender`,`subcategory`.`name` AS `subcategory_items`,json_arrayagg(`images`.`source`) AS `images` from (((((`products` left join `keyword` on((`products`.`keyword_id` = `keyword`.`id`))) left join `information` on((`products`.`id` = `information`.`product_id`))) left join `gender` on((`products`.`gender_id` = `gender`.`id`))) left join `subcategory` on((`products`.`subcategory_id` = `subcategory`.`id`))) left join `images` on((`products`.`id` = `images`.`product_id`))) group by `products`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_summary`
--

/*!50001 DROP VIEW IF EXISTS `product_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_summary` AS select `products`.`id` AS `id`,`type`.`name` AS `type`,`category`.`name` AS `category`,`keyword`.`name` AS `keyword`,`products`.`title` AS `title`,`products`.`price_c` AS `price`,`products`.`is_discounted` AS `is_discounted`,`products`.`discount_percent` AS `discount_percent`,`products`.`discounted_price_c` AS `discounted_price`,`products`.`main_image` AS `main_image`,`products`.`sub_image` AS `sub_image`,`gender`.`name` AS `gender` from ((((`products` left join `keyword` on((`products`.`keyword_id` = `keyword`.`id`))) left join `gender` on((`products`.`gender_id` = `gender`.`id`))) left join `type` on((`products`.`type_id` = `type`.`id`))) left join `category` on((`products`.`category_id` = `category`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `search_base`
--

/*!50001 DROP VIEW IF EXISTS `search_base`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search_base` AS select `p`.`id` AS `id`,`k`.`name` AS `keyword`,`p`.`title` AS `title`,`p`.`product_code` AS `product_code`,`i`.`contents` AS `contents`,`i`.`material` AS `material`,`g`.`name` AS `gender`,`c`.`name` AS `category_name`,`s`.`name` AS `subcategory_name` from (((((`products` `p` left join `keyword` `k` on((`p`.`keyword_id` = `k`.`id`))) left join `information` `i` on((`p`.`id` = `i`.`product_id`))) left join `gender` `g` on((`p`.`gender_id` = `g`.`id`))) left join `category` `c` on((`p`.`category_id` = `c`.`id`))) left join `subcategory` `s` on((`p`.`subcategory_id` = `s`.`id`))) group by `p`.`id`,`p`.`title` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `size_by_product`
--

/*!50001 DROP VIEW IF EXISTS `size_by_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `size_by_product` AS select `products`.`id` AS `id`,`size`.`name` AS `size` from ((`products` left join `product_size` on((`products`.`id` = `product_size`.`product_id`))) left join `size` on((`product_size`.`size_id` = `size`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `store_data`
--

/*!50001 DROP VIEW IF EXISTS `store_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `store_data` AS select `store`.`id` AS `id`,`store`.`name` AS `name`,`store`.`address` AS `address`,`store`.`tel` AS `tel`,`store`.`time` AS `time`,`store_type`.`type` AS `type`,`store`.`lat` AS `lat`,`store`.`lng` AS `lng` from (`store` left join `store_type` on((`store`.`type_id` = `store_type`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed

--
-- Dbmate schema migrations
--

LOCK TABLES `schema_migrations` WRITE;
INSERT INTO `schema_migrations` (version) VALUES
  ('20220831013629'),
  ('20220831015835'),
  ('20220831015841'),
  ('20220831015849'),
  ('20220831015856'),
  ('20220831015905'),
  ('20220831015913'),
  ('20220831015921'),
  ('20220831020010'),
  ('20220831020027'),
  ('20220831020050'),
  ('20220831020057'),
  ('20220831020108'),
  ('20220901062437'),
  ('20220901062451'),
  ('20220901062457'),
  ('20220901062511'),
  ('20220901062519'),
  ('20220901062526'),
  ('20220901062541'),
  ('20220901062547'),
  ('20220901062557'),
  ('20220901062603'),
  ('20220901062613'),
  ('20220901062619'),
  ('20220901062627'),
  ('20220903064000'),
  ('20220903064009'),
  ('20220903064024'),
  ('20220903064029'),
  ('20220904063333'),
  ('20220904063542'),
  ('20220904063652'),
  ('20220904063849'),
  ('20220904063943'),
  ('20220904064022'),
  ('20220904064140');
UNLOCK TABLES;
