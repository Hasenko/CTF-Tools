-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 15 Septembre 2017 à 14:32
-- Version du serveur :  10.1.10-MariaDB
-- Version de PHP :  5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `sql_injection`
--
CREATE DATABASE IF NOT EXISTS `sql_injection` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sql_injection`;

-- --------------------------------------------------------

--
-- Structure de la table `sql_i`
--

DROP TABLE IF EXISTS `sql_i`;
CREATE TABLE `sql_i` (
  `id` int(11) NOT NULL,
  `login` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `extra` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vider la table avant d'insérer `sql_i`
--

TRUNCATE TABLE `sql_i`;
--
-- Contenu de la table `sql_i`
--

INSERT INTO `sql_i` (`id`, `login`, `pwd`, `value`, `extra`) VALUES
(1, 'admin', 'admin', 12, '13'),
(2, 'tom', 'pouce', 4, NULL),
(3, 'jerem', 'mie', 777, '999'),
(4, 'nico', 'azerty', NULL, NULL);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `sql_i`
--
ALTER TABLE `sql_i`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `sql_i`
--
ALTER TABLE `sql_i`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
