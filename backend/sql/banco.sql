CREATE DATABASE  IF NOT EXISTS `banco` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banco`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: banco
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(90) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rua` varchar(210) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bairro` varchar(110) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cidade` varchar(90) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uf` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `iduser` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'08030560','Rua Alice Dilon Braga','Vila Curuçá','São Paulo','SP',23),(2,'','','','','',30),(3,'03069-030','Rua Coronel Gustavo Santiago','Vila Zilda (Tatuapé)','São Paulo','SP',31),(4,'','','','','',32),(5,'','','','','',33),(6,'','','','','',33),(7,'','','','','',34),(8,'','','','','',35);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_endereco`
--

DROP TABLE IF EXISTS `log_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_endereco` (
  `logid` int NOT NULL AUTO_INCREMENT,
  `Acao` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int NOT NULL,
  `cep` varchar(90) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rua` varchar(210) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bairro` varchar(110) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cidade` varchar(90) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uf` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `iduser` int DEFAULT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_endereco`
--

LOCK TABLES `log_endereco` WRITE;
/*!40000 ALTER TABLE `log_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_perfil`
--

DROP TABLE IF EXISTS `log_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_perfil` (
  `logid` int NOT NULL AUTO_INCREMENT,
  `Acao` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int NOT NULL,
  `nome` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`logid`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_perfil`
--

LOCK TABLES `log_perfil` WRITE;
/*!40000 ALTER TABLE `log_perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_perfil_permissoes`
--

DROP TABLE IF EXISTS `log_perfil_permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_perfil_permissoes` (
  `logid` int NOT NULL AUTO_INCREMENT,
  `Acao` varchar(200) NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `perfilid` int NOT NULL,
  `permissao_id` int NOT NULL,
  PRIMARY KEY (`logid`),
  KEY `log_perfil_permissoes_ibfk_2` (`permissao_id`),
  KEY `log_perfil_permissoes_ibfk_1` (`perfilid`),
  CONSTRAINT `log_perfil_permissoes_ibfk_1` FOREIGN KEY (`perfilid`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `log_perfil_permissoes_ibfk_2` FOREIGN KEY (`permissao_id`) REFERENCES `permissoes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_perfil_permissoes`
--

LOCK TABLES `log_perfil_permissoes` WRITE;
/*!40000 ALTER TABLE `log_perfil_permissoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_perfil_permissoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_permissoes`
--

DROP TABLE IF EXISTS `log_permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_permissoes` (
  `logid` int NOT NULL AUTO_INCREMENT,
  `Acao` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int NOT NULL,
  `nome` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`logid`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_permissoes`
--

LOCK TABLES `log_permissoes` WRITE;
/*!40000 ALTER TABLE `log_permissoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_permissoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_produtos`
--

DROP TABLE IF EXISTS `log_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_produtos` (
  `logid` int NOT NULL AUTO_INCREMENT,
  `Acao` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int NOT NULL,
  `nome` text COLLATE utf8mb4_general_ci,
  `preco` decimal(4,2) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_produtos`
--

LOCK TABLES `log_produtos` WRITE;
/*!40000 ALTER TABLE `log_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_users`
--

DROP TABLE IF EXISTS `log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_users` (
  `logid` int NOT NULL AUTO_INCREMENT,
  `Acao` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int NOT NULL,
  `nome` text COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `senha` text COLLATE utf8mb4_general_ci,
  `perfilid` int DEFAULT NULL,
  PRIMARY KEY (`logid`),
  UNIQUE KEY `email` (`email`),
  KEY `log_usuario_ibfk_1` (`perfilid`),
  CONSTRAINT `log_usuario_ibfk_1` FOREIGN KEY (`perfilid`) REFERENCES `perfil` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_users`
--

LOCK TABLES `log_users` WRITE;
/*!40000 ALTER TABLE `log_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_vendas`
--

DROP TABLE IF EXISTS `log_vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_vendas` (
  `logid` int NOT NULL AUTO_INCREMENT,
  `Acao` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_vendas`
--

LOCK TABLES `log_vendas` WRITE;
/*!40000 ALTER TABLE `log_vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'X'),(2,'Y');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_permissoes`
--

DROP TABLE IF EXISTS `perfil_permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil_permissoes` (
  `perfilid` int NOT NULL,
  `permissao_id` int NOT NULL,
  PRIMARY KEY (`perfilid`,`permissao_id`),
  KEY `perfil_permissoes_ibfk_2` (`permissao_id`),
  CONSTRAINT `perfil_permissoes_ibfk_1` FOREIGN KEY (`perfilid`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `perfil_permissoes_ibfk_2` FOREIGN KEY (`permissao_id`) REFERENCES `permissoes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_permissoes`
--

LOCK TABLES `perfil_permissoes` WRITE;
/*!40000 ALTER TABLE `perfil_permissoes` DISABLE KEYS */;
INSERT INTO `perfil_permissoes` VALUES (2,1),(2,2),(2,3),(1,4),(2,4),(1,5),(2,5),(1,6),(2,6),(1,7),(2,7),(2,8),(1,9),(2,9),(2,10),(2,11),(2,12);
/*!40000 ALTER TABLE `perfil_permissoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissoes`
--

DROP TABLE IF EXISTS `permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissoes`
--

LOCK TABLES `permissoes` WRITE;
/*!40000 ALTER TABLE `permissoes` DISABLE KEYS */;
INSERT INTO `permissoes` VALUES (13,''),(5,'buscaprod'),(2,'buscauser'),(4,'criarprod'),(1,'criaruser'),(10,'criarvenda'),(12,'Gerenciar'),(11,'grafico'),(9,'MenuPrincipal'),(7,'MenuProdutos'),(8,'MenuUsuarios'),(6,'todosprod'),(3,'todosuser');
/*!40000 ALTER TABLE `permissoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` text COLLATE utf8mb4_general_ci,
  `preco` decimal(4,2) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (18,'Peitoral de Aço',50.00,2),(19,'antebraço deus',50.00,2),(20,'biceps monstro',50.00,2);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `produtos_por_usuario`
--

DROP TABLE IF EXISTS `produtos_por_usuario`;
/*!50001 DROP VIEW IF EXISTS `produtos_por_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `produtos_por_usuario` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `quantidade_produtos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `senha` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `perfilid` int DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `usuario_ibfk_1` (`perfilid`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`perfilid`) REFERENCES `perfil` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (33,'Eustaquio','gui@gmail','$2y$10$4gio7ZR2MdUGEpgelWQ6GuF8QYRAy3MFFN4.ROtCy4yemZYKArttK',2),(34,'faustinopsy','faustino@psy','$2y$10$V6.814u/r5XoHWZNtg7UJeo02cuDm8qXwFcJUADX0enG9pAV8rxZK',1),(35,'Guilherme2','g@g','$2y$10$TI6Tad3uDZViuW9qvzbBIOX/7CJnEdZoK0km3rI1u26ICKhq07eFi',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `id_usuario` int DEFAULT NULL,
  `id_produto` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (13,12),(13,11),(25,13),(25,13),(25,13),(25,13),(17,11),(27,15),(27,14),(28,16),(28,17),(29,14),(29,15),(29,16),(29,17),(28,17),(34,18),(34,19),(33,20);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `produtos_por_usuario`
--

DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPermissoesPorPerfil`(IN perfilId INT)
BEGIN
    SELECT perm.nome 
    FROM permissoes perm
    JOIN perfil_permissoes pp ON perm.id = pp.permissao_id
    WHERE pp.perfilid = perfilId;
END ;;
DELIMITER ;

/*!50001 DROP VIEW IF EXISTS `produtos_por_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `produtos_por_usuario` AS select `u`.`id` AS `id`,`u`.`nome` AS `nome`,count(`v`.`id_produto`) AS `quantidade_produtos` from (`users` `u` left join `vendas` `v` on((`u`.`id` = `v`.`id_usuario`))) group by `u`.`id` */;
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

-- Dump completed on 2023-11-22 20:17:53
