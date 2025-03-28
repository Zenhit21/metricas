-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-03-2025 a las 20:29:59
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_informe_metricas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Campaña`
--

CREATE TABLE `Campaña` (
  `id_campaña` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cliente`
--

CREATE TABLE `Cliente` (
  `id_cliente` int(11) NOT NULL,
  `rut` varchar(20) NOT NULL,
  `razon_social` varchar(255) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Metrica`
--

CREATE TABLE `Metrica` (
  `id_metrica` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RRSS`
--

CREATE TABLE `RRSS` (
  `id_rrss` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `perfil` tinyint(1) NOT NULL CHECK (`perfil` in (1,2)),
  `estado` tinyint(1) NOT NULL DEFAULT 1 CHECK (`estado` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`id_usuario`, `nombre`, `apellido`, `usuario`, `clave`, `perfil`, `estado`) VALUES
(1, 'Nicolás', 'Matamala', 'nmatamala', '1234', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Campaña`
--
ALTER TABLE `Campaña`
  ADD PRIMARY KEY (`id_campaña`);

--
-- Indices de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `rut` (`rut`);

--
-- Indices de la tabla `Metrica`
--
ALTER TABLE `Metrica`
  ADD PRIMARY KEY (`id_metrica`);

--
-- Indices de la tabla `RRSS`
--
ALTER TABLE `RRSS`
  ADD PRIMARY KEY (`id_rrss`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Campaña`
--
ALTER TABLE `Campaña`
  MODIFY `id_campaña` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Metrica`
--
ALTER TABLE `Metrica`
  MODIFY `id_metrica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `RRSS`
--
ALTER TABLE `RRSS`
  MODIFY `id_rrss` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
