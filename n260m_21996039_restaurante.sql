-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Servidor: sql302.260mb.org
-- Tiempo de generación: 28-05-2018 a las 23:04:16
-- Versión del servidor: 5.6.35-81.0
-- Versión de PHP: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `n260m_21996039_restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tespecialidad`
--

CREATE TABLE IF NOT EXISTS `tespecialidad` (
  `idtespecialidad` int(11) NOT NULL AUTO_INCREMENT,
  `especialidad` varchar(45) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`idtespecialidad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `tespecialidad`
--

INSERT INTO `tespecialidad` (`idtespecialidad`, `especialidad`) VALUES
(1, 'Colombiana'),
(2, 'Internacional'),
(3, 'Española'),
(4, 'Peruana'),
(5, 'Francesa'),
(6, 'Fusión'),
(7, 'Mediterránea'),
(8, 'Italiana'),
(9, 'Jaimaquina'),
(10, 'Japonesa'),
(11, 'Pescado y Marisco'),
(12, 'Parrilla'),
(13, 'Costeña'),
(14, 'Mexicana'),
(15, 'Americana'),
(16, 'Suiza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trestaurante`
--

CREATE TABLE IF NOT EXISTS `trestaurante` (
  `idtrestaurante` int(11) NOT NULL AUTO_INCREMENT,
  `razonsocial` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `mapslat` float(10,6) NOT NULL,
  `mapslng` float(10,6) NOT NULL,
  `ubicacion` int(11) NOT NULL,
  `especialidad` int(11) NOT NULL,
  PRIMARY KEY (`idtrestaurante`),
  KEY `fk_trestaurante_tubicacion_idx` (`ubicacion`),
  KEY `fk_trestaurante_especialidad1_idx` (`especialidad`),
  KEY `ubicacion` (`ubicacion`),
  KEY `ubicacion_2` (`ubicacion`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `trestaurante`
--

INSERT INTO `trestaurante` (`idtrestaurante`, `razonsocial`, `direccion`, `telefono`, `mapslat`, `mapslng`, `ubicacion`, `especialidad`) VALUES
(1, 'Leo Cocina y Cava', 'Calle 27B Nº 6-75 Pasaje Santa Cruz de Mompox', '2867091/2816267', 4.614441, -74.069054, 7, 1),
(2, 'Nemo by Harry Sasson', 'Calle 83 Nº 12-49', '6102619', 4.669606, -74.053261, 2, 2),
(3, 'Pajares Salinas', 'Carrera 10 Nº 96-08', '6161524', 4.678852, -74.044144, 3, 3),
(4, 'Astrid y Gastón', 'Carrera 7 Nº 67-64', '2111400', 4.650952, -74.057617, 4, 4),
(5, 'Balzac', 'Calle 83 Nº 12-19', '6105210', 4.667120, -74.053696, 2, 5),
(6, 'La Tasca de Sevilla', 'Calle 84 Nº 14-26', '2570189', 4.614546, -74.068726, 5, 3),
(7, 'Basilic', 'Carrera 13 Nº 85-80', '6212666', 4.670009, -74.053062, 2, 7),
(8, 'La Barra', 'Calle 69A Nº 5-08', '3210839', 4.651488, -74.055359, 4, 3),
(9, 'Matiz', 'Calle 95 Nº 11A-17', '5202003/5202006', 4.678965, -74.046432, 3, 6),
(10, 'La Cigale', 'Calle 69A Nº 4-93', '4009906', 4.651324, -74.055222, 4, 5),
(11, 'Di Lucca', 'Carrera 13 Nº 85-32', '6115665/2571700', 4.669434, -74.053360, 2, 8),
(12, 'Nazca', 'Calle 74 Nº 5-28', '3213459', 4.656157, -74.053276, 4, 4),
(13, 'Scotchies', 'Calle 70 Nº 4-45', '2115354/3460917', 4.651678, -74.054474, 4, 9),
(14, 'Donostia', 'Calle 29 Bis Nº 5-84', '2873943/2457953', 4.615830, -74.067368, 7, 1),
(15, 'El Patio', 'Carrera 4A Nº 27-80', '2826121', 4.614666, -74.066093, 7, 7),
(16, 'Osaki', 'Calle 71 Nº 5-10', '3462345/2462368', 4.653518, -74.054680, 4, 10),
(17, 'La Fragata', 'Carrera 13 Nº 27-98, piso 2 ', '2847836', 4.615249, -74.069839, 1, 11),
(18, 'Corral Gourmet', 'Calle 69A N° 5-09', '2171123', 4.651424, -74.055428, 4, 12),
(19, 'Criterion', 'Calle 69A Nº 5-75', '3101377', 4.651757, -74.055992, 4, 5),
(20, 'Estrella de los Ríos', 'Calle 26B Nº 4-50', '2818941/3374037/3340502', 4.613396, -74.066284, 7, 13),
(21, 'Mi Viejo', 'Calle 11 Nº 5-41', '5666128/3410971', 4.597136, -74.074089, 8, 12),
(22, 'Intermezzo', 'Calle 69 Nº 10A-35', '3134171/3146748', 4.653753, -74.060669, 9, 6),
(23, 'Museo del Tequila', 'Carrera 13A Nº 86A-18', '2566614', 4.670824, -74.053291, 5, 14),
(24, 'Le Petit Bistrot', 'Calle 76 Nº 10-28', '2494058', 4.660490, -74.055473, 10, 5),
(25, 'La Hamburguesería', 'Carrera 4A Nº 27-27', '2811286', 4.614138, -74.066330, 1, 15),
(26, 'Diana García', 'Carrera 7ª Nº 70-94', '2356805/3213431', 4.653469, -74.055962, 10, 13),
(27, 'DiVino', 'Calle 70 Nº 11-29', '3130618', 4.655058, -74.060532, 10, 16),
(28, 'Tijuana', 'Calle 71 No. 9-67', '606 08 59', 4.655443, -74.058144, 10, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tubicacion`
--

CREATE TABLE IF NOT EXISTS `tubicacion` (
  `idtubicacion` int(11) NOT NULL AUTO_INCREMENT,
  `zona` varchar(45) CHARACTER SET latin1 NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  PRIMARY KEY (`idtubicacion`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `tubicacion`
--

INSERT INTO `tubicacion` (`idtubicacion`, `zona`, `lat`, `lng`) VALUES
(1, 'Centro', 0.000000, 0.000000),
(2, 'Zona T', 4.667583, -74.054169),
(3, 'Chico', 4.681629, -74.046906),
(4, 'Zona G', 4.653490, -74.054680),
(5, 'Zona Rosa', 0.000000, 0.000000),
(7, 'La Macarena', 4.610704, -74.066360),
(8, 'La Candelaria', 4.597014, -74.072876),
(9, 'Quinta Camacho', 4.654497, -74.060120),
(10, 'Rosales', 4.661404, -74.048737);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
