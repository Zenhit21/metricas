-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-04-2025 a las 17:56:37
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
-- Base de datos: `Informe_Metricas_DB`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Campania`
--

CREATE TABLE `Campania` (
  `Id_Campania` tinyint(3) UNSIGNED NOT NULL,
  `Id_Cliente` tinyint(3) UNSIGNED NOT NULL,
  `Fecha_Inicio` datetime NOT NULL,
  `Fecha_Fin` datetime NOT NULL,
  `Nombre_Campania` varchar(200) NOT NULL,
  `Estado_Campania` tinyint(3) UNSIGNED DEFAULT 1 COMMENT '1=Activo, 0=Inactivo, 99=Eliminado (borrado lógico)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Clientes`
--

CREATE TABLE `Clientes` (
  `Id_Cliente` tinyint(3) UNSIGNED NOT NULL,
  `Rut_Cliente` varchar(15) NOT NULL,
  `Razon_Social_Cliente` varchar(100) NOT NULL,
  `Estado_Cliente` tinyint(3) UNSIGNED DEFAULT 1 COMMENT '1=Activo, 0=Inactivo, 99=Eliminado (borrado lógico)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Informe`
--

CREATE TABLE `Informe` (
  `Id_Informe` tinyint(3) UNSIGNED NOT NULL,
  `Id_Cliente` tinyint(3) UNSIGNED NOT NULL,
  `Id_Campania` tinyint(3) UNSIGNED NOT NULL,
  `Id_Rel_Red_Social_Metrica` tinyint(3) UNSIGNED NOT NULL,
  `Valor_Metrica` int(10) UNSIGNED NOT NULL,
  `Estado_Informe` tinyint(3) UNSIGNED DEFAULT 1 COMMENT '1=Activo, 0=Inactivo, 99=Eliminado (borrado lógico)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Metrica`
--

CREATE TABLE `Metrica` (
  `Id_Metrica` tinyint(3) UNSIGNED NOT NULL,
  `Id_RRSS` tinyint(3) UNSIGNED NOT NULL,
  `Nombre_Metrica` varchar(100) NOT NULL,
  `Estado_Metrica` tinyint(3) UNSIGNED DEFAULT 1 COMMENT '1=Activo, 0=Inactivo, 99=Eliminado (borrado lógico)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RedesSociales`
--

CREATE TABLE `RedesSociales` (
  `Id_RRSS` tinyint(3) UNSIGNED NOT NULL,
  `Nombre_RRSS` varchar(100) NOT NULL,
  `Estado_RRSS` tinyint(3) UNSIGNED DEFAULT 1 COMMENT '1=Activo, 0=Inactivo, 99=Eliminado (borrado lógico)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RelRedSocialMetrica`
--

CREATE TABLE `RelRedSocialMetrica` (
  `Id_Rel_Red_Social_Metrica` tinyint(3) UNSIGNED NOT NULL,
  `Id_RRSS` tinyint(3) UNSIGNED NOT NULL,
  `Id_Metrica` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `Id_Usuario` tinyint(3) UNSIGNED NOT NULL,
  `Nombre_Usuario` varchar(100) NOT NULL,
  `Apellido_Usuario` varchar(100) NOT NULL,
  `Usuario` varchar(100) NOT NULL,
  `Clave` varchar(100) NOT NULL,
  `Perfil` tinyint(3) UNSIGNED NOT NULL COMMENT '1=Administrador, 2=Ejecutivo',
  `Estado_Usuario` tinyint(3) UNSIGNED DEFAULT 1 COMMENT '1=Activo, 0=Inactivo, 99=Eliminado (borrado lógico)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`Id_Usuario`, `Nombre_Usuario`, `Apellido_Usuario`, `Usuario`, `Clave`, `Perfil`, `Estado_Usuario`) VALUES
(1, 'yuibbi', 'sdfidds', 'iifsdfdsi', '$2y$10$LEbqB2XmkWkRmPm6WgLIaerSCgltRut.SeO8b81CaeKeYGwIy.4OO', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Campania`
--
ALTER TABLE `Campania`
  ADD PRIMARY KEY (`Id_Campania`),
  ADD KEY `Id_Cliente` (`Id_Cliente`);

--
-- Indices de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`Id_Cliente`),
  ADD UNIQUE KEY `Rut_Cliente` (`Rut_Cliente`);

--
-- Indices de la tabla `Informe`
--
ALTER TABLE `Informe`
  ADD PRIMARY KEY (`Id_Informe`),
  ADD KEY `Id_Cliente` (`Id_Cliente`),
  ADD KEY `Id_Campania` (`Id_Campania`),
  ADD KEY `Id_Rel_Red_Social_Metrica` (`Id_Rel_Red_Social_Metrica`);

--
-- Indices de la tabla `Metrica`
--
ALTER TABLE `Metrica`
  ADD PRIMARY KEY (`Id_Metrica`),
  ADD KEY `Id_RRSS` (`Id_RRSS`);

--
-- Indices de la tabla `RedesSociales`
--
ALTER TABLE `RedesSociales`
  ADD PRIMARY KEY (`Id_RRSS`);

--
-- Indices de la tabla `RelRedSocialMetrica`
--
ALTER TABLE `RelRedSocialMetrica`
  ADD PRIMARY KEY (`Id_Rel_Red_Social_Metrica`),
  ADD UNIQUE KEY `Id_RRSS` (`Id_RRSS`,`Id_Metrica`),
  ADD KEY `Id_Metrica` (`Id_Metrica`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD UNIQUE KEY `Usuario` (`Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Campania`
--
ALTER TABLE `Campania`
  MODIFY `Id_Campania` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `Id_Cliente` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Informe`
--
ALTER TABLE `Informe`
  MODIFY `Id_Informe` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Metrica`
--
ALTER TABLE `Metrica`
  MODIFY `Id_Metrica` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `RedesSociales`
--
ALTER TABLE `RedesSociales`
  MODIFY `Id_RRSS` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `RelRedSocialMetrica`
--
ALTER TABLE `RelRedSocialMetrica`
  MODIFY `Id_Rel_Red_Social_Metrica` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `Id_Usuario` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Campania`
--
ALTER TABLE `Campania`
  ADD CONSTRAINT `Campania_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `Clientes` (`Id_Cliente`);

--
-- Filtros para la tabla `Informe`
--
ALTER TABLE `Informe`
  ADD CONSTRAINT `Informe_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `Clientes` (`Id_Cliente`),
  ADD CONSTRAINT `Informe_ibfk_2` FOREIGN KEY (`Id_Campania`) REFERENCES `Campania` (`Id_Campania`),
  ADD CONSTRAINT `Informe_ibfk_3` FOREIGN KEY (`Id_Rel_Red_Social_Metrica`) REFERENCES `RelRedSocialMetrica` (`Id_Rel_Red_Social_Metrica`);

--
-- Filtros para la tabla `Metrica`
--
ALTER TABLE `Metrica`
  ADD CONSTRAINT `Metrica_ibfk_1` FOREIGN KEY (`Id_RRSS`) REFERENCES `RedesSociales` (`Id_RRSS`);

--
-- Filtros para la tabla `RelRedSocialMetrica`
--
ALTER TABLE `RelRedSocialMetrica`
  ADD CONSTRAINT `RelRedSocialMetrica_ibfk_1` FOREIGN KEY (`Id_RRSS`) REFERENCES `RedesSociales` (`Id_RRSS`),
  ADD CONSTRAINT `RelRedSocialMetrica_ibfk_2` FOREIGN KEY (`Id_Metrica`) REFERENCES `Metrica` (`Id_Metrica`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
