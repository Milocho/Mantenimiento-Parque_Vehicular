-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-03-2021 a las 06:10:20
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taller`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choque`
--

CREATE TABLE `choque` (
  `id` int(11) NOT NULL,
  `choque_code` varchar(100) NOT NULL,
  `fecha_choque` date NOT NULL,
  `idvehiculo` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `nombre_ter` varchar(255) NOT NULL,
  `dni_ter` varchar(20) NOT NULL,
  `registro_ter` date NOT NULL,
  `domicilio_ter` varchar(255) NOT NULL,
  `localidad_ter` varchar(255) NOT NULL,
  `patente_ter` varchar(30) NOT NULL,
  `marca_modelo_ter` varchar(255) NOT NULL,
  `color_ter` varchar(255) NOT NULL,
  `seguro_ter` varchar(255) NOT NULL,
  `poliza_ter` varchar(50) NOT NULL,
  `telefono_ter` varchar(50) NOT NULL,
  `celular_ter` varchar(50) NOT NULL,
  `fecha_carga` datetime NOT NULL,
  `foto1` varchar(255) NOT NULL,
  `foto2` varchar(255) NOT NULL,
  `foto3` varchar(255) NOT NULL,
  `foto4` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `choque`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `dni` varchar(80) DEFAULT NULL,
  `actividad_economica` varchar(255) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `configuracion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `imagen` varchar(255) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `registro` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `kind` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_permisos`
--

CREATE TABLE `empleado_permisos` (
  `idempleado_permiso` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado_permisos`
--

INSERT INTO `empleado_permisos` (`idempleado_permiso`, `idempleado`, `idpermiso`) VALUES
(132, 2, 1),
(133, 2, 2),
(134, 2, 3),
(135, 2, 4),
(136, 2, 5),
(137, 2, 6),
(138, 2, 7),
(139, 2, 8),
(140, 2, 9),
(141, 2, 10),
(142, 2, 11),
(155, 1, 1),
(156, 1, 2),
(157, 1, 3),
(158, 1, 4),
(159, 1, 5),
(160, 1, 6),
(161, 1, 7),
(162, 1, 8),
(163, 1, 9),
(164, 1, 10),
(165, 1, 11),
(168, 3, 1),
(169, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cuit` varchar(30) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `fecha_carga` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kind`
--

CREATE TABLE `kind` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`) VALUES
(1, 'Dashboard'),
(2, 'Empleados'),
(3, 'Taller'),
(4, 'Seguro'),
(5, 'Empresa'),
(6, 'Sector'),
(7, 'Vehiculo'),
(8, 'Tarjeta'),
(9, 'Reparaciones'),
(10, 'Choque'),
(11, 'Configuracion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reparaciones`
--

CREATE TABLE `reparaciones` (
  `id` int(11) NOT NULL,
  `fecha_repa` date NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `idvehiculo` int(11) NOT NULL,
  `idtaller` int(11) NOT NULL,
  `fecha_carga` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reparaciones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector`
--

CREATE TABLE `sector` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `idempresa` int(11) NOT NULL,
  `fecha_carga` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sector`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro`
--

CREATE TABLE `seguro` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `poliza` varchar(25) NOT NULL,
  `vencimiento` date NOT NULL,
  `fecha_carga` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seguro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taller`
--

CREATE TABLE `taller` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cuit` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `localidad` varchar(255) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `celular` varchar(50) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `fecha_carga` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `taller`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `id` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `vencimiento` date NOT NULL,
  `idvehiculo` int(11) NOT NULL,
  `fecha_carga` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tarjeta`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL,
  `vehiculo_code` varchar(100) NOT NULL,
  `patente` varchar(40) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `nro_chasis` varchar(30) NOT NULL,
  `nro_motor` varchar(30) NOT NULL,
  `vto_vtv` date NOT NULL,
  `idseguro` int(11) NOT NULL,
  `color` varchar(30) NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `imagen2` varchar(255) NOT NULL,
  `fecha_carga` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculo`
--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `choque`
--
ALTER TABLE `choque`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleado_permisos`
--
ALTER TABLE `empleado_permisos`
  ADD PRIMARY KEY (`idempleado_permiso`),
  ADD KEY `idempleado` (`idempleado`),
  ADD KEY `idpermiso` (`idpermiso`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `kind`
--
ALTER TABLE `kind`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seguro`
--
ALTER TABLE `seguro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `taller`
--
ALTER TABLE `taller`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `choque`
--
ALTER TABLE `choque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleado_permisos`
--
ALTER TABLE `empleado_permisos`
  MODIFY `idempleado_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `kind`
--
ALTER TABLE `kind`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `reparaciones`
--
ALTER TABLE `reparaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sector`
--
ALTER TABLE `sector`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `seguro`
--
ALTER TABLE `seguro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `taller`
--
ALTER TABLE `taller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado_permisos`
--
ALTER TABLE `empleado_permisos`
  ADD CONSTRAINT `empleado_permisos_ibfk_1` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `empleado_permisos_ibfk_2` FOREIGN KEY (`idpermiso`) REFERENCES `permisos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
