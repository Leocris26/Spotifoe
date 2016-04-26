-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2016 at 11:13 PM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `musica`
--
CREATE DATABASE IF NOT EXISTS `musica` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `musica`;

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `Cod_album` int(11) NOT NULL,
  `Nro_canciones` int(4) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Ano` int(4) NOT NULL,
  `Duracion` varchar(8) NOT NULL,
  `Fecha_lan` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`Cod_album`, `Nro_canciones`, `Nombre`, `Ano`, `Duracion`, `Fecha_lan`) VALUES
(1, 16, 'X', 2014, '65:27', '2014-06-20'),
(2, 14, '25', 2015, '48:25', '2015-11-20');

-- --------------------------------------------------------

--
-- Table structure for table `albumartista`
--

CREATE TABLE IF NOT EXISTS `albumartista` (
  `Cod_album` int(11) NOT NULL,
  `Cod_artista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `albumartista`
--

INSERT INTO `albumartista` (`Cod_album`, `Cod_artista`) VALUES
(2, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `artista`
--

CREATE TABLE IF NOT EXISTS `artista` (
  `Cod_artista` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artista`
--

INSERT INTO `artista` (`Cod_artista`, `Nombre`) VALUES
(1, 'Adele'),
(2, 'Ed Sheeran'),
(3, 'Shakira'),
(4, 'Enrique Iglesias'),
(5, 'Michael Jackson'),
(6, 'Jason Mraz');

-- --------------------------------------------------------

--
-- Table structure for table `artistacancion`
--

CREATE TABLE IF NOT EXISTS `artistacancion` (
  `Cod_artista` int(11) NOT NULL,
  `Cod_cancion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artistacancion`
--

INSERT INTO `artistacancion` (`Cod_artista`, `Cod_cancion`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cancion`
--

CREATE TABLE IF NOT EXISTS `cancion` (
  `Cod_cancion` int(11) NOT NULL,
  `CalidadA` varchar(30) NOT NULL,
  `CalidadB` varchar(30) NOT NULL,
  `Duracion` varchar(7) NOT NULL,
  `Fecha_lan` date NOT NULL,
  `Veces_escuch` int(15) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Cod_genero` int(11) NOT NULL,
  `Cod_album` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cancion`
--

INSERT INTO `cancion` (`Cod_cancion`, `CalidadA`, `CalidadB`, `Duracion`, `Fecha_lan`, `Veces_escuch`, `Nombre`, `Cod_genero`, `Cod_album`) VALUES
(1, '', '', '4:55', '2015-10-23', 0, 'Hello', 3, 2),
(2, '', '', '4:40', '2014-08-14', 0, 'Thinking out loud', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `genero`
--

CREATE TABLE IF NOT EXISTS `genero` (
  `Cod_genero` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genero`
--

INSERT INTO `genero` (`Cod_genero`, `Nombre`) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Soul'),
(4, 'Soft rock'),
(5, 'Blue-eyed soul');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`Cod_album`);

--
-- Indexes for table `albumartista`
--
ALTER TABLE `albumartista`
  ADD PRIMARY KEY (`Cod_album`,`Cod_artista`),
  ADD KEY `Cod_artista` (`Cod_artista`);

--
-- Indexes for table `artista`
--
ALTER TABLE `artista`
  ADD PRIMARY KEY (`Cod_artista`);

--
-- Indexes for table `artistacancion`
--
ALTER TABLE `artistacancion`
  ADD PRIMARY KEY (`Cod_artista`,`Cod_cancion`),
  ADD KEY `Cod_cancion` (`Cod_cancion`);

--
-- Indexes for table `cancion`
--
ALTER TABLE `cancion`
  ADD PRIMARY KEY (`Cod_cancion`);

--
-- Indexes for table `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`Cod_genero`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `Cod_album` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `artista`
--
ALTER TABLE `artista`
  MODIFY `Cod_artista` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cancion`
--
ALTER TABLE `cancion`
  MODIFY `Cod_cancion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `genero`
--
ALTER TABLE `genero`
  MODIFY `Cod_genero` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `albumartista`
--
ALTER TABLE `albumartista`
  ADD CONSTRAINT `albumartista_ibfk_1` FOREIGN KEY (`Cod_album`) REFERENCES `album` (`Cod_album`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `albumartista_ibfk_2` FOREIGN KEY (`Cod_artista`) REFERENCES `artista` (`Cod_artista`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `artistacancion`
--
ALTER TABLE `artistacancion`
  ADD CONSTRAINT `artistacancion_ibfk_1` FOREIGN KEY (`Cod_cancion`) REFERENCES `cancion` (`Cod_cancion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `artistacancion_ibfk_2` FOREIGN KEY (`Cod_artista`) REFERENCES `artista` (`Cod_artista`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
