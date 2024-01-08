-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 04 déc. 2023 à 06:56
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `webshop`
--

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `reservation_via_nom`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `reservation_via_nom` (IN `nom` VARCHAR(20))  begin
 select * FROM reservation WHERE Nomclient=nom;

end$$

DROP PROCEDURE IF EXISTS `vue_profile`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `vue_profile` ()  begin
 select * FROM utilisateurs;

end$$

DROP PROCEDURE IF EXISTS `vue_reseve_client`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `vue_reseve_client` ()  begin
 select * FROM reservation WHERE Nomclient="tata";

end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `acceder`
--

DROP TABLE IF EXISTS `acceder`;
CREATE TABLE IF NOT EXISTS `acceder` (
  `idreserv` int(11) NOT NULL,
  `idmembre` int(11) NOT NULL,
  PRIMARY KEY (`idreserv`,`idmembre`),
  KEY `ACCEDER_utilisateurs0_FK` (`idmembre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `bonne_affaire`
--

DROP TABLE IF EXISTS `bonne_affaire`;
CREATE TABLE IF NOT EXISTS `bonne_affaire` (
  `id_bonne_affaire` int(11) NOT NULL AUTO_INCREMENT,
  `titre_promos` varchar(255) NOT NULL,
  `date_fin_promo` datetime NOT NULL,
  `pourcentage_promos` decimal(10,0) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id_bonne_affaire`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `bonne_affaire`
--

INSERT INTO `bonne_affaire` (`id_bonne_affaire`, `titre_promos`, `date_fin_promo`, `pourcentage_promos`, `date`) VALUES
(1, 'promos &eacute;t&eacute;', '2023-05-27 14:59:00', '14', '2023-05-23');

--
-- Déclencheurs `bonne_affaire`
--
DROP TRIGGER IF EXISTS `limite`;
DELIMITER $$
CREATE TRIGGER `limite` BEFORE UPDATE ON `bonne_affaire` FOR EACH ROW BEGIN
IF (NEW.pourcentage_promos > 20) THEN
  SET NEW.pourcentage_promos = 20;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `idcat` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` text NOT NULL,
  `idproduit` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcat`),
  KEY `categorie_produit_FK` (`idproduit`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idcat`, `categorie`, `idproduit`) VALUES
(1, 'teeshirt', NULL),
(2, 'pantalon', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commende_valider`
--

DROP TABLE IF EXISTS `commende_valider`;
CREATE TABLE IF NOT EXISTS `commende_valider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_commande` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_client` int(250) NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `qte` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `idcontact` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `email` varchar(25) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`idcontact`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`idcontact`, `nom`, `prenom`, `email`, `message`) VALUES
(2, 'tata', 'toto', 'tata@gmail.com', 'test nop 1254 dijfojfd8fg 48df4g dffldkdfgdlgn 666 ne pas repndre 1'),
(3, 'toto', 'tota', 'test@gmail.com', '05 soso test note cool pas de bole 654 78 nuque12346'),
(4, 'tata', 'toto', 'tata@gmail.com', 'bonjour');

-- --------------------------------------------------------

--
-- Structure de la table `date_utilisateur`
--

DROP TABLE IF EXISTS `date_utilisateur`;
CREATE TABLE IF NOT EXISTS `date_utilisateur` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `date_insertion` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `date_utilisateur`
--

INSERT INTO `date_utilisateur` (`id`, `id_utilisateur`, `date_insertion`) VALUES
(1, 13, '2023-05-03 00:00:00'),
(2, 14, '2023-05-27 00:00:00'),
(3, 15, '2023-05-27 00:00:00'),
(4, 16, '2023-05-27 00:00:00'),
(5, 17, '2023-05-27 00:00:00'),
(6, 18, '2023-05-27 00:00:00'),
(7, 19, '2023-05-27 00:00:00'),
(8, 20, '2023-05-27 00:00:00'),
(9, 21, '2023-05-27 00:00:00'),
(10, 22, '2023-05-27 00:00:00'),
(11, 23, '2023-05-27 00:00:00'),
(12, 24, '2023-05-27 00:00:00'),
(13, 25, '2023-05-27 00:00:00'),
(14, 26, '2023-05-27 00:00:00'),
(15, 27, '2023-05-27 00:00:00'),
(16, 28, '2023-05-27 00:00:00'),
(17, 29, '2023-05-27 03:30:55'),
(18, 30, '2023-05-27 04:01:24'),
(19, 31, '2023-05-27 04:03:00'),
(20, 32, '2023-05-27 04:05:13'),
(21, 33, '2023-05-27 04:29:39'),
(22, 34, '2023-05-27 04:30:11'),
(23, 35, '2023-05-27 04:31:08'),
(24, 36, '2023-05-27 04:31:33'),
(25, 36, '2023-11-04 15:34:27'),
(26, 37, '2023-11-28 13:15:49'),
(27, 38, '2023-11-28 13:29:37');

-- --------------------------------------------------------

--
-- Structure de la table `point`
--

DROP TABLE IF EXISTS `point`;
CREATE TABLE IF NOT EXISTS `point` (
  `id_piont` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `point_pour` int(3) NOT NULL,
  `id_reservation` int(3) NOT NULL,
  PRIMARY KEY (`id_piont`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `point`
--

INSERT INTO `point` (`id_piont`, `nom`, `point_pour`, `id_reservation`) VALUES
(1, 'tata', 10, 55),
(2, 'lola', 10, 56),
(3, 'lola', 10, 57),
(4, 'lola', 10, 58);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `idproduit` int(11) NOT NULL AUTO_INCREMENT,
  `id_promos` int(10) DEFAULT NULL,
  `description` text NOT NULL,
  `produit` varchar(250) NOT NULL,
  `prix` decimal(11,2) NOT NULL,
  `marque` varchar(250) NOT NULL,
  `image` varchar(250) NOT NULL,
  `idcat` int(11) NOT NULL,
  `qte` int(5) NOT NULL,
  PRIMARY KEY (`idproduit`),
  KEY `id_promos` (`id_promos`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idproduit`, `id_promos`, `description`, `produit`, `prix`, `marque`, `image`, `idcat`, `qte`) VALUES
(11, 1, 'Jean Slim Femme Noir', 'Jean Slim Femme Noir', '34.40', ' GIRLS OUTFIT', 'girls-outfit_389149_P078-8_20230921T135032_01.webp', 2, 17),
(12, NULL, 'Pantalon Cargo Femme Vert Kaki', 'Pantalon Cargo Femme Vert Kaki', '35.00', 'GIRLS OUTFIT', 'girls-outfit_373440_1676-75_20230612T153048_01.webp', 2, 49),
(13, NULL, 'Salopette Jean Femme Bleu Wash', 'Salopette Jean Femme Bleu Wash', '50.00', 'GIRLS OUTFIT', 'girls-outfit_389141_S512-8_20231005T155903_01.jpg', 2, 19),
(14, NULL, 'Jean Skinny Femme G2133 Noir', 'Jean Skinny Femme G2133 Noir', '25.00', 'GIRLS OUTFIT', 'girls-only_218889_G2133-1_NOIR_20200609T155930_01.jpg', 2, 22),
(15, NULL, 'Pantalon Cargo Femme Dera Vert Kaki', 'Pantalon Cargo Femme Dera Vert Kaki', '79.90', 'KAPORAL', 'kaporal_382514_DERAW7J_EXKHAK_20230915T150818_01.webp', 2, 25),
(16, NULL, 'Jean Skinny Femme Royal Noir', 'Jean Skinny Femme Royal Noir', '40.00', 'ONLY', 'only_343877_15159341_BLACK_20221110T143122_01.jpg', 2, 24),
(17, NULL, 'Jogger Pant Femme TB3626 Beige', 'Jogger Pant Femme TB3626 Beige', '39.90', 'URBAN CLASSICS', 'urban-classics_312492_TB3626_CONCRETE_20220421T152519_01.webp', 2, 20),
(18, NULL, 'Jean Slim Femme Noir', 'Jean Slim Femme Noir', '35.00', 'GIRLS OUTFIT', 'girls-outfit_389149_P078-8_20230921T135032_01.webp', 2, 17),
(19, NULL, 'Pantalon Cargo Bandes Femme Tiro IA3034 Noire', 'Pantalon Cargo Bandes Femme Tiro IA3034 Noire', '65.00', 'ADIDAS SPORTSWEAR', 'adidas_375118_IA3034_20230612T154028_01.webp', 2, 25),
(20, NULL, 'Pantalon Cargo Skinny Femme S353 Vert ', 'Pantalon Cargo Skinny Femme S353 Vert ', '32.00', 'GIRLS OUTFIT', 'girls-only_259486_S353-5_GREEN_20210402T145349_01.webp', 2, 26),
(21, NULL, 'Pantalon Cargo Flare Femme TB6040 Noir', 'Pantalon Cargo Flare Femme TB6040 Noir', '59.90', 'URBAN CLASSICS', 'urban-classics_373408_TB6040_BLACK_20230605T143759_01.webp', 2, 28),
(22, NULL, 'Jogger Pant Femme TF239708 Vert Kaki Beige', 'Jogger Pant Femme TF239708 Vert Kaki Beige', '60.00', 'PROJECT X PARIS', 'project-x-paris_367227_TF239708_KH2_20230425T151423_01.webp', 2, 23),
(23, NULL, 'Jean Femme Super Skinny 5526 Noire', 'Jean Femme Super Skinny 5526 Noire', '99.90', 'CALVIN KLEIN', 'calvin-klein_262183_J20J215526_1BY_20210507T092437_01.webp', 2, 23),
(24, NULL, 'Pantalon Cargo Femme Sania Marron', 'Pantalon Cargo Femme Sania Marron', '35.00', 'ONLY', 'only_381831_15301393_OTTER_20230915T150625_01.webp', 2, 50),
(25, NULL, 'Pantalon Cargo Femme Faduma Noir', 'Pantalon Cargo Femme Faduma Noir', '40.00', 'ONLY', 'only_381334_15301582_BLACK_20230915T151137_01.webp', 2, 50),
(26, NULL, 'Pantalon Cargo Femme Kirby Camel', 'Pantalon Cargo Femme Kirby Camel', '50.00', 'NOISY MAY', 'noisy-may_375260_27026174_NATURAL_20230612T152958_01.webp', 2, 25),
(27, NULL, 'Pantalon Cargo Femme TB3048 Beige', 'Pantalon Cargo Femme TB3048 Beige', '44.90', 'URBAN CLASSICS', 'urban-classics_385760_TB3048_UNIONBEIGE_20231005T154456_01.webp', 2, 25),
(28, NULL, 'Pantalon Cargo Skinny Femme Missouri Vert Kaki', 'Pantalon Cargo Skinny Femme Missouri Vert Kaki', '45.00', 'ONLY', 'only_342045_15170889_ROSIN_20221110T144104_01.webp', 2, 25),
(29, NULL, 'Pantalon Cargo Femme W33620CPA Vert Kaki', 'Pantalon Cargo Femme W33620CPA Vert Kaki', '59.90', 'SIXTH JUNE', 'sixth-june_339782_W33620CPA_KAKI_20221206T113933_01.webp', 2, 29),
(30, NULL, 'Jogger Pant Femme TB3048 Gris', 'Jogger Pant Femme TB3048 Gris', '44.90', 'URBAN CLASSICS', 'urban-classics_261238_TB3048_LIGHT-SHADOW_20210507T090900_01.webp', 2, 20),
(31, NULL, 'Tee Shirt Oversize Large Femme Art Series Pink Blanc', 'Tee Shirt Oversize Large Femme Art Series Pink Blanc', '30.00', 'TEDDY YACHT CLUB', 'teddy-yacht-club_365167_TYC_TSOF_ARTSERIESPINK_BLC_20230310T141343_01.jpg', 1, 60),
(32, NULL, 'Tee Shirt Oversize Large Femme Tweety Graff Pink Noir', 'Tee Shirt Oversize Large Femme Tweety Graff Pink Noir', '35.00', 'LOONEY TUNES', 'series-tv-et-films_376182_LOONEY_TSOF_TWEETYGRAFFPINK_NOI_20230615T123930_01.jpg', 1, 50),
(33, NULL, 'Tee Shirt Oversize Large Femme Bugs Bunny Graff Pink Blanc', 'Tee Shirt Oversize Large Femme Bugs Bunny Graff Pink Blanc', '35.00', 'LOONEY TUNES', 'series-tv-et-films_376178_LOONEY_TSOF_BUGSGRAFFPINK_BLC_20230615T123710_01.jpg', 1, 53),
(34, NULL, 'Tee Shirt Oversize Large Femme Tweety Graff Pink Blanc', 'Tee Shirt Oversize Large Femme Tweety Graff Pink Blanc', '35.00', 'LOONEY TUNES', 'series-tv-et-films_376175_LOONEY_TSOF_TWEETYGRAFFPINK_BLC_20230615T123837_01.jpg', 1, 55),
(35, NULL, 'Tee Shirt Manches Longues Femme Art Series Dripping Pink Noir', 'Tee Shirt Manches Longues Femme Art Series Dripping Pink Noir', '40.00', 'LOONEY TUNES', 'teddy-yacht-club_394817_TYC_TSMLF_ARTSERIESDRIPPINK_NOI_20231024T144730_01.jpg', 1, 51),
(36, NULL, 'Tee Shirt Col Roul&eacute; Manches Longues Femme 2024 Noir', 'Tee Shirt Col Roul&eacute; Manches Longues Femme 2024 Noir', '59.90', 'CALVIN KLEIN', 'calvin-klein_387222_J20J222024_BEH_20230911T155029_01.webp', 1, 43),
(37, NULL, 'Tee Shirt Oversize Large Femme Taz Graff Pink Noir', 'Tee Shirt Oversize Large Femme Taz Graff Pink Noir', '35.00', 'LOONEY TUNES', 'series-tv-et-films_376180_LOONEY_TSOF_TAZGRAFFPINK_NOI_20230615T123818_01.jpg', 1, 60),
(38, NULL, 'Tee Shirt Femme 1426 Bleu Clair', 'Tee Shirt Femme 1426 Bleu Clair', '39.90', 'CALVIN KLEIN', 'calvin-klein_387257_J20J221426_CAX_20230911T154440_01.webp', 1, 30),
(39, NULL, 'Tee Shirt Manches Longues Femme W3BI35 Noir', 'Tee Shirt Manches Longues Femme W3BI35 Noir', '45.00', 'GUESS', 'guess_384199_W3BI35-J1314_JBLK_20230919T151806_01.webp', 1, 29),
(40, NULL, 'Tee Shirt Oversize Large Femme Taz Graff Pink Blanc', 'Tee Shirt Oversize Large Femme Taz Graff Pink Blanc', '35.00', 'LOONEY TUNES', 'series-tv-et-films_376174_LOONEY_TSOF_TAZGRAFFPINK_BLC_20230615T123749_01.jpg', 1, 56),
(41, NULL, 'Tee Shirt Oversize Large Femme Art Series Blue Beige', 'Tee Shirt Oversize Large Femme Art Series Blue Beige', '30.00', 'TEDDY YACHT CLUB', 'teddy-yacht-club_372917_TYC_TSOF_ARTSERIESBLUE_BEI_20230522T150723_01.webp', 1, 52),
(42, NULL, 'Tee Shirt Manches Longues Femme 4153 Blanc', 'Tee Shirt Manches Longues Femme 4153 Blanc', '49.90', 'TOMMY HIFIGER', 'tommy-hilfiger_366482_UW0UW04153_YBR_20230329T151006_01.jpg', 1, 20),
(43, NULL, 'Tee Shirt Manches Longues Femme New Virginia Noir', 'Tee Shirt Manches Longues Femme New Virginia Noir', '29.90', 'PEPE JEANS', 'pepe-jeans_149094_PL502755_999_20180801T150629_02.webp', 1, 29),
(44, NULL, 'Tee Shirt Skinny Femme Col V Stretch 9197 Blanc', 'Tee Shirt Skinny Femme Col V Stretch 9197 Blanc', '34.90', 'TOMMY HIFIGER', 'tommy-hilfiger_232521_DW0DW09197_YBR_NOOS_20220622T152743_01.webp', 1, 44),
(45, NULL, 'Tee Shirt Manches Longues Col V Femme 2023 Beige Clair', 'Tee Shirt Manches Longues Col V Femme 2023 Beige Clair', '49.90', 'CALVIN KLEIN', 'calvin-klein_387225_J20J222023_YBI_20230911T154351_01.webp', 1, 33),
(46, NULL, 'Tee Shirt Manches Longues Femme Button Rib 7540 Rouge', 'Tee Shirt Manches Longues Femme Button Rib 7540 Rouge', '44.90', 'TOMMY HIFIGER', 'tommy-hilfiger_378855_DW0DW17540_XNL_20230731T101001_01.webp', 1, 42),
(47, NULL, 'Sweat Crewneck Femme Shuffle 50490577 Blanc', 'Sweat Crewneck Femme Shuffle 50490577 Blanc', '60.00', 'HUGO', 'hugo_366531_50490577_100_20230329T151314_01.jpg', 1, 70),
(48, NULL, 'Tee Shirt Manches Longues Femme O3BP01-KBXB2 Noir', 'Tee Shirt Manches Longues Femme O3BP01-KBXB2 Noir', '40.00', 'GUESS', 'guess_382545_O3BP01-KBXB2_JBLK_20230814T145329_01.webp', 1, 45),
(49, 1, 'Robe Tee Shirt Loungewear Femme QS6944E Noir', 'Robe Tee Shirt Loungewear Femme QS6944E Noir', '49.90', 'CALVIN KLEIN', 'calvin-klein_353883_QS6944E_UB1_20230125T103926_01.webp', 1, 12),
(50, 1, 'Tee Shirt Slim Femme Col V Embroidery Stretch 3716 Noir', 'Tee Shirt Slim Femme Col V Embroidery Stretch 3716 Noir', '39.90', 'CALVIN KLEIN', 'calvin-klein_344076_J20J213716_BAE_20221115T143659_01.webp', 1, 50);

--
-- Déclencheurs `produit`
--
DROP TRIGGER IF EXISTS `qte_limit`;
DELIMITER $$
CREATE TRIGGER `qte_limit` BEFORE UPDATE ON `produit` FOR EACH ROW BEGIN
IF (NEW.qte < 0) THEN
  SET NEW.qte = 0;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `idreserv` int(11) NOT NULL AUTO_INCREMENT,
  `NC` int(11) NOT NULL,
  `Nomclient` varchar(100) NOT NULL,
  `Produit` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `qte` int(5) NOT NULL,
  `prix` int(4) NOT NULL,
  `statue` text CHARACTER SET utf8mb4 NOT NULL,
  `image` varchar(250) NOT NULL,
  PRIMARY KEY (`idreserv`),
  UNIQUE KEY `idreserv` (`idreserv`),
  UNIQUE KEY `idreserv_2` (`idreserv`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`idreserv`, `NC`, `Nomclient`, `Produit`, `date`, `qte`, `prix`, `statue`, `image`) VALUES
(53, 1, 'tata', 'Pantalon Cargo Femme Vert Kaki', '2023-11-06', 1, 35, 'non-livrer', 'girls-outfit_373440_1676-75_20230612T153048_01.webp'),
(54, 54, 'tata', 'Tee Shirt Oversize Large Femme Bugs Bunny Graff Pink Blanc', '2023-11-29', 2, 70, 'non-livrer', 'series-tv-et-films_376178_LOONEY_TSOF_BUGSGRAFFPINK_BLC_20230615T123710_01.jpg'),
(55, 55, 'tata', 'Salopette Jean Femme Bleu Wash', '2023-11-29', 1, 50, 'non-livrer', 'girls-outfit_389141_S512-8_20231005T155903_01.jpg'),
(56, 56, 'lola', 'Jean Skinny Femme G2133 Noir', '2023-11-29', 3, 75, 'non-livrer', 'girls-only_218889_G2133-1_NOIR_20200609T155930_01.jpg'),
(57, 57, 'lola', 'Jean Skinny Femme Royal Noir', '2023-11-29', 1, 40, 'non-livrer', 'only_343877_15159341_BLACK_20221110T143122_01.jpg'),
(58, 58, 'lola', 'Jean Slim Femme Noir', '2023-12-02', 3, 105, 'non-livrer', 'girls-outfit_389149_P078-8_20230921T135032_01.webp');

--
-- Déclencheurs `reservation`
--
DROP TRIGGER IF EXISTS `livrer`;
DELIMITER $$
CREATE TRIGGER `livrer` AFTER UPDATE ON `reservation` FOR EACH ROW INSERT INTO reservation_livrer VALUES(null, NEW.idreserv,NEW.Nomclient, OLD.date,NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `point`;
DELIMITER $$
CREATE TRIGGER `point` AFTER INSERT ON `reservation` FOR EACH ROW INSERT INTO point VALUES(null,NEW.Nomclient,10,NEW.idreserv)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `reservation_livrer`
--

DROP TABLE IF EXISTS `reservation_livrer`;
CREATE TABLE IF NOT EXISTS `reservation_livrer` (
  `idlivrer` int(10) NOT NULL AUTO_INCREMENT,
  `idresevation` int(10) NOT NULL,
  `nomclient` text NOT NULL,
  `date` date NOT NULL,
  `date_livreson` date NOT NULL,
  PRIMARY KEY (`idlivrer`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservation_livrer`
--

INSERT INTO `reservation_livrer` (`idlivrer`, `idresevation`, `nomclient`, `date`, `date_livreson`) VALUES
(7, 53, 'tata', '2023-11-06', '2023-11-10'),
(8, 53, 'tata', '2023-11-09', '2023-11-10');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `role` text NOT NULL,
  `idmemebre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_role`),
  KEY `roles_utilisateurs_FK` (`idmemebre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id_role`, `role`, `idmemebre`) VALUES
(1, 'Admin', NULL),
(2, 'Menbre', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `idmembre` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `sexe` text NOT NULL,
  `age` int(11) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `email` varchar(25) NOT NULL,
  `telephone` int(11) NOT NULL,
  `password` varchar(250) NOT NULL,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY (`idmembre`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`idmembre`, `nom`, `prenom`, `sexe`, `age`, `adresse`, `email`, `telephone`, `password`, `id_role`) VALUES
(5, 'admin', 'admin', 'Monsieur', 25, '97470', 'admin@admin.com', 693028908, 'e10adc3949ba59abbe56e057f20f883e', 1),
(6, 'abdou', 'Abdoul', 'Monsieur', 25, '97470', 'musbahou.abdoul@gmail.com', 693028908, '0328da4c7619dfdf90434f5cff094b5b', 2),
(7, 'mina', 'lola', 'Madame', 25, '32 rut michelle', 'mina@gmail.com', 1234567891, 'e10adc3949ba59abbe56e057f20f883e', 2),
(8, 'tata', 'tata', 'Madame', 25, '43 rue Jean Monnet', 'tata@gmail.com', 693028912, 'e10adc3949ba59abbe56e057f20f883e', 2),
(9, 'jean', 'jac', 'Monsieur', 19, '43 rue Jean Monnet', 'jac@gmail.com', 693028918, 'c33367701511b4f6020ec61ded352059', 2),
(36, 'titi', 'titi', 'Monsieur', 16, '97470', 'titi@gmail.com', 693028908, 'e10adc3949ba59abbe56e057f20f883e', 2),
(38, 'jojo', 'jojo', 'Monsieur', 19, '97470', 'jojo@gmail.com', 693028908, 'e10adc3949ba59abbe56e057f20f883e', 2);

--
-- Déclencheurs `utilisateurs`
--
DROP TRIGGER IF EXISTS `date_inscrit`;
DELIMITER $$
CREATE TRIGGER `date_inscrit` AFTER INSERT ON `utilisateurs` FOR EACH ROW INSERT INTO date_utilisateur VALUES(null, NEW.idmembre, NOW())
$$
DELIMITER ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `promo` FOREIGN KEY (`id_promos`) REFERENCES `bonne_affaire` (`id_bonne_affaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_utilisateurs_FK` FOREIGN KEY (`idmemebre`) REFERENCES `utilisateurs` (`idmembre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
