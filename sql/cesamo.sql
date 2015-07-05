-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 06-07-2015 a las 00:12:53
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cesamo`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertBinnacle`(IN `actionSession` VARCHAR(50), IN `codEmpleadoSession` VARCHAR(4), IN `dateActionSession` DATETIME, IN `ipMachineSession` VARCHAR(40))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'This procedure have as function register all actions produced'
INSERT INTO binnacle (action, codEmpleado, dateAction, ipMachine) VALUES (actionSession, codEmpleadoSession, dateAction, ipMachineSession)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `selectAllUser`(IN `userSession` VARCHAR(30), IN `passwordSession` VARCHAR(8))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT * FROM usuarios WHERE username = userSession AND password = passwordSession$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateLog`(IN `logSession` INT, IN `codEmpleadoSession` VARCHAR(4))
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT 'This method change the log of the session of the user'
UPDATE `usuarios` SET `log`= logSession WHERE `codEmpleado`= codEmpleadoSession$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `binnacle`
--

CREATE TABLE IF NOT EXISTS `binnacle` (
  `codBinnacle` int(11) NOT NULL,
  `action` varchar(50) NOT NULL,
  `codEmpleado` varchar(4) NOT NULL,
  `dateAction` datetime NOT NULL,
  `ipMachine` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carnet_de_vacunacion`
--

CREATE TABLE IF NOT EXISTS `carnet_de_vacunacion` (
  `CodCarnet` int(11) NOT NULL,
  `CodExpediente` varchar(13) NOT NULL,
  `FechaEmision` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE IF NOT EXISTS `citas` (
  `CodCita` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `P_Nombre_Paciente` varchar(30) NOT NULL,
  `S_Nombre_Paciente` varchar(30) NOT NULL,
  `P_Apellido_Paciente` varchar(30) NOT NULL,
  `S_Apellido_Paciente` varchar(30) NOT NULL,
  `Telefono` int(8) NOT NULL,
  `CodMedico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consolidado`
--

CREATE TABLE IF NOT EXISTS `consolidado` (
  `CodConsolidado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE IF NOT EXISTS `consultas` (
  `CodConsulta` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `MotivoConsulta` text NOT NULL,
  `Descripcion_examen_fisico` text NOT NULL,
  `Descripcion_diagnostico` text NOT NULL,
  `Descripcion_tratamiento` text NOT NULL,
  `CodMedico` int(11) NOT NULL,
  `CodConsolidado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
  `CodEmpleado` varchar(4) NOT NULL,
  `NumIdentidad` varchar(13) NOT NULL,
  `P_Nombre` varchar(30) NOT NULL,
  `S_Nombre` varchar(30) DEFAULT NULL,
  `P_Apellido` varchar(30) NOT NULL,
  `S_Apellido` varchar(30) DEFAULT NULL,
  `Telefono` int(8) DEFAULT NULL,
  `CorreoElectronico` varchar(100) DEFAULT NULL,
  `FechaNacimiento` datetime NOT NULL,
  `Sexo` varchar(1) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Cargo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`CodEmpleado`, `NumIdentidad`, `P_Nombre`, `S_Nombre`, `P_Apellido`, `S_Apellido`, `Telefono`, `CorreoElectronico`, `FechaNacimiento`, `Sexo`, `Direccion`, `Cargo`) VALUES
('adf2', '0601199301279', 'Alex', 'Dario', 'Flores', 'Aplicano', 32436703, 'alex_dario92@hotmail.com', '1992-09-21 00:00:00', 'M', 'Choluteca', 'Administrador'),
('dag2', '0801199219039', 'Douglas', 'Alberto', 'Guillen', NULL, 98566454, 'douglas_guillen@hotmail.com', '1992-11-28 00:00:00', 'M', 'La joya', 'Doctor'),
('efd2', '0921199332455', 'Edwin', NULL, 'Paz', NULL, NULL, NULL, '1992-07-22 00:00:00', 'M', 'Las uvas', 'Enfermero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_medicamentos`
--

CREATE TABLE IF NOT EXISTS `entrada_medicamentos` (
  `CodEntrada` int(11) NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_medicamentos_inventario`
--

CREATE TABLE IF NOT EXISTS `entrada_medicamentos_inventario` (
  `CodEntrada` int(11) NOT NULL,
  `CodMedicamento` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `FechaVencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expedientes`
--

CREATE TABLE IF NOT EXISTS `expedientes` (
  `CodExpediente` varchar(13) NOT NULL,
  `P_Nombre` varchar(30) NOT NULL,
  `S_Nombre` varchar(30) NOT NULL,
  `P_Apellido` varchar(30) NOT NULL,
  `S_Apellido` varchar(30) NOT NULL,
  `FechaNacimiento` datetime NOT NULL,
  `Sexo` varchar(1) NOT NULL,
  `LugarNacimiento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE IF NOT EXISTS `inventario` (
  `CodMedicamento` int(11) NOT NULL,
  `NombreMedicamento` varchar(30) NOT NULL,
  `NombreFabricante` varchar(30) NOT NULL,
  `Descripcion` text NOT NULL,
  `Existencia` int(11) NOT NULL,
  `UnidadMedida` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_carnet_de_vacunacion`
--

CREATE TABLE IF NOT EXISTS `inventario_carnet_de_vacunacion` (
  `CodMedicamento` int(11) NOT NULL,
  `CodCarnet` int(11) NOT NULL,
  `FechaAplicacion` date DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_receta_medica`
--

CREATE TABLE IF NOT EXISTS `inventario_receta_medica` (
  `CodMedicamento` int(11) DEFAULT NULL,
  `CodReceta` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE IF NOT EXISTS `medicos` (
  `CodMedico` int(11) NOT NULL,
  `CodEmpleado` varchar(4) NOT NULL,
  `Firma` varchar(100) NOT NULL,
  `Sello` varchar(100) DEFAULT NULL,
  `Especialidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preclinica`
--

CREATE TABLE IF NOT EXISTS `preclinica` (
  `CodPreclinica` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Peso` float NOT NULL,
  `Presion` varchar(20) NOT NULL,
  `Temperatura` float NOT NULL,
  `Altura` float NOT NULL,
  `CodEmpleado` int(11) NOT NULL,
  `CodExpediente` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta_medica`
--

CREATE TABLE IF NOT EXISTS `receta_medica` (
  `CodReceta` int(11) NOT NULL,
  `CodConsulta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `codRole` int(11) NOT NULL,
  `nombreRole` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`codRole`, `nombreRole`) VALUES
(1, 'ADMINISTRADOR'),
(3, 'Médico'),
(2, 'Recepcionista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas_medicamentos`
--

CREATE TABLE IF NOT EXISTS `salidas_medicamentos` (
  `CodSalida` int(11) NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas_medicamentos_inventario`
--

CREATE TABLE IF NOT EXISTS `salidas_medicamentos_inventario` (
  `CodSalida` int(11) NOT NULL,
  `CodMedicamento` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `MotivoSalida` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `userName` varchar(30) NOT NULL,
  `password` varchar(8) NOT NULL,
  `status` int(1) NOT NULL,
  `codRole` int(11) NOT NULL,
  `codEmpleado` varchar(4) NOT NULL,
  `log` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`userName`, `password`, `status`, `codRole`, `codEmpleado`, `log`) VALUES
('adfaplicano', '1234', 1, 1, 'adf2', 0),
('dgou', '1234', 1, 3, 'dag2', 0),
('edwi', '1234', 1, 2, 'efd2', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `binnacle`
--
ALTER TABLE `binnacle`
  ADD PRIMARY KEY (`codBinnacle`),
  ADD KEY `codEmpleado_FK_Binnacle` (`codEmpleado`);

--
-- Indices de la tabla `carnet_de_vacunacion`
--
ALTER TABLE `carnet_de_vacunacion`
  ADD PRIMARY KEY (`CodCarnet`),
  ADD UNIQUE KEY `CodExpediente` (`CodExpediente`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`CodCita`),
  ADD UNIQUE KEY `CodMedico` (`CodMedico`),
  ADD UNIQUE KEY `CodMedico_2` (`CodMedico`);

--
-- Indices de la tabla `consolidado`
--
ALTER TABLE `consolidado`
  ADD PRIMARY KEY (`CodConsolidado`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`CodConsulta`),
  ADD UNIQUE KEY `CodMedico` (`CodMedico`,`CodConsolidado`),
  ADD KEY `CodConsolidado` (`CodConsolidado`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`CodEmpleado`),
  ADD UNIQUE KEY `CodEmpleado` (`CodEmpleado`),
  ADD UNIQUE KEY `NumIdentidad` (`NumIdentidad`);

--
-- Indices de la tabla `entrada_medicamentos`
--
ALTER TABLE `entrada_medicamentos`
  ADD PRIMARY KEY (`CodEntrada`);

--
-- Indices de la tabla `entrada_medicamentos_inventario`
--
ALTER TABLE `entrada_medicamentos_inventario`
  ADD KEY `CodEntradaFK` (`CodEntrada`),
  ADD KEY `CodMedicamento_EM_FK` (`CodMedicamento`);

--
-- Indices de la tabla `expedientes`
--
ALTER TABLE `expedientes`
  ADD PRIMARY KEY (`CodExpediente`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`CodMedicamento`);

--
-- Indices de la tabla `inventario_carnet_de_vacunacion`
--
ALTER TABLE `inventario_carnet_de_vacunacion`
  ADD KEY `CodMedicamentoFK` (`CodMedicamento`),
  ADD KEY `CodCarnetFK` (`CodCarnet`);

--
-- Indices de la tabla `inventario_receta_medica`
--
ALTER TABLE `inventario_receta_medica`
  ADD KEY `CodMedicamento_inv_recetaFK` (`CodMedicamento`),
  ADD KEY `CodRecetaFK` (`CodReceta`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`CodMedico`),
  ADD UNIQUE KEY `CodMedico_2` (`CodMedico`),
  ADD UNIQUE KEY `CodEmpleado` (`CodEmpleado`,`Firma`,`Sello`),
  ADD KEY `CodMedico` (`CodMedico`);

--
-- Indices de la tabla `preclinica`
--
ALTER TABLE `preclinica`
  ADD PRIMARY KEY (`CodPreclinica`),
  ADD UNIQUE KEY `CodExpediente` (`CodExpediente`),
  ADD UNIQUE KEY `CodEmpleado` (`CodEmpleado`);

--
-- Indices de la tabla `receta_medica`
--
ALTER TABLE `receta_medica`
  ADD PRIMARY KEY (`CodReceta`),
  ADD UNIQUE KEY `CodConsulta` (`CodConsulta`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`codRole`),
  ADD UNIQUE KEY `nombreRole` (`nombreRole`);

--
-- Indices de la tabla `salidas_medicamentos`
--
ALTER TABLE `salidas_medicamentos`
  ADD PRIMARY KEY (`CodSalida`);

--
-- Indices de la tabla `salidas_medicamentos_inventario`
--
ALTER TABLE `salidas_medicamentos_inventario`
  ADD KEY `CodSalidaFK` (`CodSalida`),
  ADD KEY `CodMedicamento_SM_FK` (`CodMedicamento`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`userName`),
  ADD UNIQUE KEY `codRole` (`codRole`),
  ADD UNIQUE KEY `codEmpleado` (`codEmpleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `binnacle`
--
ALTER TABLE `binnacle`
  MODIFY `codBinnacle` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `carnet_de_vacunacion`
--
ALTER TABLE `carnet_de_vacunacion`
  MODIFY `CodCarnet` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `CodCita` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `consolidado`
--
ALTER TABLE `consolidado`
  MODIFY `CodConsolidado` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `CodConsulta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `entrada_medicamentos`
--
ALTER TABLE `entrada_medicamentos`
  MODIFY `CodEntrada` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `CodMedicamento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `CodMedico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `preclinica`
--
ALTER TABLE `preclinica`
  MODIFY `CodPreclinica` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `receta_medica`
--
ALTER TABLE `receta_medica`
  MODIFY `CodReceta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `codRole` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `salidas_medicamentos`
--
ALTER TABLE `salidas_medicamentos`
  MODIFY `CodSalida` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `binnacle`
--
ALTER TABLE `binnacle`
  ADD CONSTRAINT `codEmpleado_FK_Binnacle` FOREIGN KEY (`codEmpleado`) REFERENCES `empleados` (`CodEmpleado`);

--
-- Filtros para la tabla `carnet_de_vacunacion`
--
ALTER TABLE `carnet_de_vacunacion`
  ADD CONSTRAINT `carnet_de_vacunacion_ibfk_1` FOREIGN KEY (`CodExpediente`) REFERENCES `expedientes` (`CodExpediente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`CodMedico`) REFERENCES `medicos` (`CodMedico`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`CodMedico`) REFERENCES `medicos` (`CodMedico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`CodConsolidado`) REFERENCES `consolidado` (`CodConsolidado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entrada_medicamentos_inventario`
--
ALTER TABLE `entrada_medicamentos_inventario`
  ADD CONSTRAINT `CodEntradaFK` FOREIGN KEY (`CodEntrada`) REFERENCES `entrada_medicamentos` (`CodEntrada`),
  ADD CONSTRAINT `CodMedicamento_EM_FK` FOREIGN KEY (`CodMedicamento`) REFERENCES `inventario` (`CodMedicamento`);

--
-- Filtros para la tabla `inventario_carnet_de_vacunacion`
--
ALTER TABLE `inventario_carnet_de_vacunacion`
  ADD CONSTRAINT `CodCarnetFK` FOREIGN KEY (`CodCarnet`) REFERENCES `carnet_de_vacunacion` (`CodCarnet`),
  ADD CONSTRAINT `CodMedicamentoFK` FOREIGN KEY (`CodMedicamento`) REFERENCES `inventario` (`CodMedicamento`);

--
-- Filtros para la tabla `inventario_receta_medica`
--
ALTER TABLE `inventario_receta_medica`
  ADD CONSTRAINT `CodMedicamento_inv_recetaFK` FOREIGN KEY (`CodMedicamento`) REFERENCES `inventario` (`CodMedicamento`),
  ADD CONSTRAINT `CodRecetaFK` FOREIGN KEY (`CodReceta`) REFERENCES `receta_medica` (`CodReceta`);

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`CodEmpleado`) REFERENCES `empleados` (`CodEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `preclinica`
--
ALTER TABLE `preclinica`
  ADD CONSTRAINT `preclinica_ibfk_1` FOREIGN KEY (`CodExpediente`) REFERENCES `expedientes` (`CodExpediente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `receta_medica`
--
ALTER TABLE `receta_medica`
  ADD CONSTRAINT `receta_medica_ibfk_1` FOREIGN KEY (`CodConsulta`) REFERENCES `consultas` (`CodConsulta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `salidas_medicamentos_inventario`
--
ALTER TABLE `salidas_medicamentos_inventario`
  ADD CONSTRAINT `CodMedicamento_SM_FK` FOREIGN KEY (`CodMedicamento`) REFERENCES `inventario` (`CodMedicamento`),
  ADD CONSTRAINT `CodSalidaFK` FOREIGN KEY (`CodSalida`) REFERENCES `salidas_medicamentos` (`CodSalida`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`codEmpleado`) REFERENCES `empleados` (`CodEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`codRole`) REFERENCES `roles` (`codRole`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
