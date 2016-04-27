-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2016 a las 14:38:39
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `musica`
--
CREATE DATABASE IF NOT EXISTS `musica` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `musica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album`
--

CREATE TABLE `album` (
  `Cod_album` int(11) NOT NULL,
  `Nro_canciones` int(4) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Ano` int(4) NOT NULL,
  `Duracion` varchar(8) NOT NULL,
  `Fecha_lan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `album`
--

INSERT INTO `album` (`Cod_album`, `Nro_canciones`, `Nombre`, `Ano`, `Duracion`, `Fecha_lan`) VALUES
(1, 16, 'X', 2014, '65:27', '2014-06-20'),
(2, 14, '25', 2015, '48:25', '2015-11-20'),
(3, 13, 'Nevermind', 1992, '46:69', '1991-09-24'),
(4, 13, 'The open door', 2006, '51:29', '2005-09-25'),
(5, 10, 'Amar sin Mentiras', 2004, '43:16', '2004-06-08'),
(7, 17, 'Contraste', 2007, '71:32', '2007-07-24'),
(8, 11, 'Ciclos', 2009, '46:09', '2009-05-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albumartista`
--

CREATE TABLE `albumartista` (
  `Cod_album` int(11) NOT NULL,
  `Cod_artista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `albumartista`
--

INSERT INTO `albumartista` (`Cod_album`, `Cod_artista`) VALUES
(1, 2),
(2, 1),
(3, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artista`
--

CREATE TABLE `artista` (
  `Cod_artista` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `artista`
--

INSERT INTO `artista` (`Cod_artista`, `Nombre`) VALUES
(1, 'Adele'),
(2, 'Ed Sheeran'),
(3, 'Shakira'),
(4, 'Enrique Iglesias'),
(5, 'Michael Jackson'),
(6, 'Jason Mraz'),
(7, 'Nirvana'),
(8, 'Evanescence');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artistacancion`
--

CREATE TABLE `artistacancion` (
  `Cod_artista` int(11) NOT NULL,
  `Cod_cancion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `artistacancion`
--

INSERT INTO `artistacancion` (`Cod_artista`, `Cod_cancion`) VALUES
(1, 1),
(2, 2),
(7, 3),
(8, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancion`
--

CREATE TABLE `cancion` (
  `Cod_cancion` int(11) NOT NULL,
  `CalidadA` varchar(80) NOT NULL,
  `CalidadB` varchar(80) NOT NULL,
  `Duracion` varchar(7) NOT NULL,
  `Fecha_lan` date NOT NULL,
  `Veces_escuch` int(15) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Cod_genero` int(11) NOT NULL,
  `Cod_album` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cancion`
--

INSERT INTO `cancion` (`Cod_cancion`, `CalidadA`, `CalidadB`, `Duracion`, `Fecha_lan`, `Veces_escuch`, `Nombre`, `Cod_genero`, `Cod_album`) VALUES
(1, '', '', '4:55', '2015-10-23', 0, 'Hello', 3, 2),
(2, '', '', '4:40', '2014-08-14', 0, 'Thinking out loud', 4, 1),
(3, '', '', '4:15', '1991-09-24', 0, 'Lithium', 6, 3),
(4, '', '', '3:48', '2007-02-06', 0, 'Lithium', 7, 4),
(6, 'C:/xampp/htdocs/canciones/Ahora Quien.mp3', '', '05:11', '2001-04-04', 0, 'Ahora Quien', 8, 5),
(7, 'C:/xampp/htdocs/canciones/Conteo Regresivo.mp3', '', '4:25', '2003-06-17', 0, 'Conteo Regresivo', 8, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `Cod_genero` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`Cod_genero`, `Nombre`) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Soul'),
(4, 'Soft rock'),
(5, 'Blue-eyed soul'),
(6, 'Grunge'),
(7, 'Metal Alternativo'),
(8, 'Salsa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`Cod_album`);

--
-- Indices de la tabla `albumartista`
--
ALTER TABLE `albumartista`
  ADD PRIMARY KEY (`Cod_album`,`Cod_artista`),
  ADD KEY `Cod_artista` (`Cod_artista`);

--
-- Indices de la tabla `artista`
--
ALTER TABLE `artista`
  ADD PRIMARY KEY (`Cod_artista`);

--
-- Indices de la tabla `artistacancion`
--
ALTER TABLE `artistacancion`
  ADD PRIMARY KEY (`Cod_artista`,`Cod_cancion`),
  ADD KEY `Cod_cancion` (`Cod_cancion`);

--
-- Indices de la tabla `cancion`
--
ALTER TABLE `cancion`
  ADD PRIMARY KEY (`Cod_cancion`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`Cod_genero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `album`
--
ALTER TABLE `album`
  MODIFY `Cod_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `artista`
--
ALTER TABLE `artista`
  MODIFY `Cod_artista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `cancion`
--
ALTER TABLE `cancion`
  MODIFY `Cod_cancion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `Cod_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `albumartista`
--
ALTER TABLE `albumartista`
  ADD CONSTRAINT `albumartista_ibfk_1` FOREIGN KEY (`Cod_album`) REFERENCES `album` (`Cod_album`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `albumartista_ibfk_2` FOREIGN KEY (`Cod_artista`) REFERENCES `artista` (`Cod_artista`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `artistacancion`
--
ALTER TABLE `artistacancion`
  ADD CONSTRAINT `artistacancion_ibfk_1` FOREIGN KEY (`Cod_cancion`) REFERENCES `cancion` (`Cod_cancion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `artistacancion_ibfk_2` FOREIGN KEY (`Cod_artista`) REFERENCES `artista` (`Cod_artista`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
