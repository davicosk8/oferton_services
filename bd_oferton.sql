-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2016 a las 23:44:53
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_oferton`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categorias`
--

CREATE TABLE `tbl_categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `estado_activa` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `tbl_categorias`
--

INSERT INTO `tbl_categorias` (`id`, `nombre`, `fecha_creacion`, `estado_activa`) VALUES
(1, 'Comidas', '2016-05-18', 1),
(2, 'Transporte', '2016-05-18', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empresas`
--

CREATE TABLE `tbl_empresas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `estado_activa` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `tbl_empresas`
--

INSERT INTO `tbl_empresas` (`id`, `nombre`, `descripcion`, `fecha_creacion`, `estado_activa`) VALUES
(1, 'Pollos Kio', 'Pollito al horno, frito y al spinning', '2016-05-18', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_imageofertas`
--

CREATE TABLE `tbl_imageofertas` (
  `id` int(11) NOT NULL,
  `dir` varchar(300) NOT NULL,
  `descripcion_imagen` varchar(200) NOT NULL,
  `tbl_oferta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ofertas`
--

CREATE TABLE `tbl_ofertas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `nombre_imagen` varchar(150) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `estado_activa` tinyint(1) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `duracion_dias` int(11) NOT NULL,
  `nombre_encargado` varchar(100) NOT NULL,
  `telefono_encargado` int(11) NOT NULL,
  `email_encargado` varchar(100) NOT NULL,
  `tbl_categoria_id` int(11) NOT NULL,
  `tbl_empresa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `tbl_ofertas`
--

INSERT INTO `tbl_ofertas` (`id`, `nombre`, `descripcion`, `nombre_imagen`, `fecha_creacion`, `estado_activa`, `fecha_inicio`, `fecha_fin`, `duracion_dias`, `nombre_encargado`, `telefono_encargado`, `email_encargado`, `tbl_categoria_id`, `tbl_empresa_id`) VALUES
(3, 'Pollos 2X1', 'Por la compra de un pollito llevese otro muy gratis', 'Comidas.jpg', '2016-05-18', 1, '2016-05-18', '2016-06-18', 30, 'Marco Antionio Echeverri', 75866666, 'eldaiblo@hotmail.com', 1, 1),
(4, '40% de Descuento', 'descuento en todas las poleras hasta un 40%', 'Poleras.jpg', '2016-05-18', 1, '2016-05-18', '2016-06-18', 30, 'Axel Rose', 76685968, 'gunsandroses@hotmail.com', 2, 1),
(5, 'Consulta gratis!', 'consulta gratis en cualquiera de nuestras sucursales', 'Consultas.jpg', '2016-05-18', 1, '2016-05-18', '2016-06-18', 30, 'Salama Hayek', 75584745, 'salmahayek@hotmail.com', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sucursales`
--

CREATE TABLE `tbl_sucursales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono1` int(11) NOT NULL,
  `telefono2` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `fecha_creacion` date NOT NULL,
  `estado_activa` tinyint(1) NOT NULL,
  `tbl_empresa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_empresas`
--
ALTER TABLE `tbl_empresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_imageofertas`
--
ALTER TABLE `tbl_imageofertas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_oferta_id` (`tbl_oferta_id`);

--
-- Indices de la tabla `tbl_ofertas`
--
ALTER TABLE `tbl_ofertas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_categoria_id` (`tbl_categoria_id`),
  ADD KEY `tbl_empresa_id` (`tbl_empresa_id`);

--
-- Indices de la tabla `tbl_sucursales`
--
ALTER TABLE `tbl_sucursales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_empresa_id` (`tbl_empresa_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbl_empresas`
--
ALTER TABLE `tbl_empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_imageofertas`
--
ALTER TABLE `tbl_imageofertas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_ofertas`
--
ALTER TABLE `tbl_ofertas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tbl_sucursales`
--
ALTER TABLE `tbl_sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_imageofertas`
--
ALTER TABLE `tbl_imageofertas`
  ADD CONSTRAINT `tbl_imageofertas_ibfk_1` FOREIGN KEY (`tbl_oferta_id`) REFERENCES `tbl_ofertas` (`id`);

--
-- Filtros para la tabla `tbl_ofertas`
--
ALTER TABLE `tbl_ofertas`
  ADD CONSTRAINT `tbl_ofertas_ibfk_1` FOREIGN KEY (`tbl_categoria_id`) REFERENCES `tbl_categorias` (`id`),
  ADD CONSTRAINT `tbl_ofertas_ibfk_2` FOREIGN KEY (`tbl_empresa_id`) REFERENCES `tbl_empresas` (`id`);

--
-- Filtros para la tabla `tbl_sucursales`
--
ALTER TABLE `tbl_sucursales`
  ADD CONSTRAINT `tbl_sucursales_ibfk_1` FOREIGN KEY (`tbl_empresa_id`) REFERENCES `tbl_empresas` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
