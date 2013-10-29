-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-10-2013 a las 01:36:10
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `db_denkel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_actividad`
--

CREATE TABLE IF NOT EXISTS `dnk_actividad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden` int(11) NOT NULL COMMENT 'Orden en la que deben Presentarse',
  `descripcion` varchar(500) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT '0: los dos, 1:usuario,2:avance3:No visible',
  `localizacion` varchar(3) NOT NULL COMMENT 'Tipo de Actividad Externa o Interna',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Volcar la base de datos para la tabla `dnk_actividad`
--

INSERT INTO `dnk_actividad` (`id`, `orden`, `descripcion`, `tipo`, `localizacion`) VALUES
(1, 1, 'Apertura de DK', 0, 'E'),
(2, 2, 'Inicio de Procesos', 0, 'E'),
(3, 99, 'Cotización', 0, 'E'),
(4, 3, 'Revisar y Autorizar ', 0, 'I'),
(5, 5, 'Envio Aduanas ', 0, 'I'),
(6, 99, 'Multas', 0, 'E'),
(7, 6, 'Declaracion Aduanera', 0, 'E'),
(8, 8, 'Notificacion de Despacho', 0, 'E'),
(9, 99, 'Observaciones ', 0, 'E'),
(10, 7, 'Autorizacion de Salida', 0, 'E'),
(11, 99, 'Facturacion ', 0, 'E'),
(12, 99, 'Solicitud Egreso ', 0, 'I'),
(13, 99, 'Solicitud de Viaticos', 0, 'I'),
(14, 99, 'Reportes ', 1, ''),
(15, 99, 'Usuarios ', 1, ''),
(16, 99, 'Solicitud Transporte ', 0, 'I'),
(17, 99, 'Aviso deTransporte ', 0, 'E'),
(18, 99, 'Transporte Entregado ', 0, 'E'),
(19, 99, 'Cambio de Clave ', 1, ''),
(20, 99, 'Asignar Permisos a Usuarios ', 1, ''),
(21, 99, 'Subir Archivos ', 1, ''),
(22, 99, 'Crear Mensajeria ', 1, ''),
(23, 99, 'Visualizar Ordenar Mensajeria ', 1, ''),
(24, 4, 'Traslado a Ecuapass', 0, 'I'),
(26, 99, 'Predeclaracion Importacion', 0, 'E'),
(27, 99, 'Aviso Recibo de Bodega', 0, 'E'),
(28, 99, 'Aviso de Transito', 0, 'E'),
(29, 99, 'Aviso de Llegada', 0, 'E'),
(30, 10, 'Envio a Contabilidad', 0, 'I'),
(31, 9, 'Registro de Facturas', 0, 'I'),
(32, 5, 'Rechazo Aduana', 3, 'I'),
(33, 99, 'Pago Solicitud Egreso', 3, 'I'),
(34, 99, 'Rechazo Solicitud Egreso', 3, 'I'),
(35, 99, 'Solicitud de Poliza', 0, 'I'),
(36, 99, 'Creacion de Poliza', 0, 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_actividad_documento`
--

CREATE TABLE IF NOT EXISTS `dnk_actividad_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_ACTIVIDAD_id` int(11) NOT NULL,
  `DNK_DOCUMENTO_codigo` varchar(20) NOT NULL,
  `fechahora` datetime NOT NULL,
  `usu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `dnk_actividad_documento`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_actividad_doc_responsable`
--

CREATE TABLE IF NOT EXISTS `dnk_actividad_doc_responsable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_ACTIVIDAD_id` int(11) NOT NULL,
  `DNK_DOCUMENTO_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=108 ;

--
-- Volcar la base de datos para la tabla `dnk_actividad_doc_responsable`
--

INSERT INTO `dnk_actividad_doc_responsable` (`id`, `DNK_ACTIVIDAD_id`, `DNK_DOCUMENTO_id`, `usuario_id`) VALUES
(1, 1, 1, 43),
(2, 2, 1, 43),
(3, 3, 1, 43),
(4, 4, 1, 43),
(5, 1, 2, 5),
(6, 2, 2, 5),
(7, 3, 2, 5),
(8, 4, 2, 5),
(9, 6, 2, 5),
(10, 7, 2, 5),
(11, 9, 2, 5),
(12, 16, 0, 5),
(13, 17, 0, 5),
(14, 1, 3, 44),
(15, 1, 3, 44),
(16, 2, 3, 44),
(17, 1, 5, 44),
(18, 2, 5, 44),
(19, 1, 6, 1),
(20, 1, 6, 1),
(21, 1, 6, 1),
(22, 1, 6, 1),
(23, 1, 6, 1),
(24, 1, 6, 1),
(25, 1, 6, 1),
(26, 1, 6, 1),
(27, 1, 6, 1),
(28, 1, 6, 1),
(29, 2, 6, 1),
(30, 1, 12, 1),
(31, 2, 12, 1),
(32, 3, 12, 1),
(33, 3, 3, 1),
(34, 1, 13, 1),
(35, 2, 13, 0),
(36, 3, 13, 5),
(37, 3, 13, 5),
(38, 4, 13, 0),
(39, 6, 13, 1),
(40, 6, 1, 0),
(41, 6, 1, 0),
(42, 7, 1, 0),
(43, 7, 1, 0),
(44, 7, 13, 0),
(45, 13, 13, 1),
(46, 1, 14, 1),
(47, 2, 14, 1),
(48, 3, 14, 1),
(49, 3, 14, 1),
(50, 4, 14, 43),
(51, 6, 14, 43),
(52, 13, 14, 43),
(53, 14, 14, 43),
(54, 13, 0, 43),
(55, 13, 0, 43),
(56, 14, 13, 0),
(57, 15, 0, 0),
(58, 15, 0, 0),
(59, 15, 0, 0),
(60, 15, 0, 0),
(61, 14, 13, 43),
(63, 15, 0, 43),
(64, 7, 14, 0),
(65, 7, 14, 0),
(66, 1, 15, 1),
(67, 2, 15, 1),
(68, 3, 15, 1),
(69, 1, 16, 1),
(70, 1, 17, 1),
(71, 1, 18, 1),
(72, 1, 19, 1),
(73, 1, 19, 1),
(74, 1, 20, 1),
(75, 1, 20, 1),
(76, 1, 20, 1),
(77, 1, 20, 1),
(78, 1, 20, 1),
(79, 1, 20, 1),
(80, 1, 20, 1),
(81, 1, 20, 1),
(82, 1, 20, 1),
(83, 1, 20, 1),
(84, 1, 20, 1),
(85, 1, 20, 1),
(86, 1, 20, 1),
(87, 1, 20, 1),
(88, 1, 20, 1),
(89, 1, 20, 1),
(90, 1, 20, 1),
(91, 1, 20, 1),
(92, 4, 1, 1),
(93, 1, 36, 1),
(94, 2, 36, 1),
(95, 3, 36, 1),
(96, 4, 36, 1),
(97, 4, 36, 1),
(98, 1, 42, 3),
(99, 1, 42, 3),
(100, 2, 42, 3),
(101, 3, 42, 3),
(102, 3, 42, 3),
(103, 1, 12, 1),
(104, 1, 12, 1),
(105, 1, 12, 44),
(106, 1, 12, 44),
(107, 1, 12, 44);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_actividad_rol`
--

CREATE TABLE IF NOT EXISTS `dnk_actividad_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) NOT NULL,
  `DNK_ACTIVIDAD_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=100 ;

--
-- Volcar la base de datos para la tabla `dnk_actividad_rol`
--

INSERT INTO `dnk_actividad_rol` (`id`, `rol_id`, `DNK_ACTIVIDAD_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 3, 1),
(25, 3, 2),
(26, 3, 3),
(27, 3, 4),
(28, 3, 5),
(29, 3, 6),
(30, 3, 7),
(31, 3, 8),
(32, 3, 9),
(33, 3, 10),
(34, 3, 12),
(35, 3, 13),
(36, 3, 16),
(37, 3, 17),
(38, 3, 18),
(39, 4, 1),
(40, 4, 2),
(41, 4, 3),
(42, 4, 4),
(43, 4, 5),
(44, 4, 6),
(45, 4, 7),
(46, 4, 8),
(47, 4, 9),
(48, 4, 10),
(49, 4, 11),
(50, 4, 12),
(51, 4, 13),
(52, 4, 14),
(53, 4, 15),
(54, 4, 16),
(55, 4, 17),
(56, 4, 18),
(57, 4, 19),
(58, 4, 20),
(59, 4, 21),
(60, 4, 22),
(61, 4, 23),
(62, 5, 3),
(63, 5, 7),
(64, 5, 11),
(65, 5, 12),
(66, 5, 13),
(67, 5, 16),
(68, 5, 19),
(69, 5, 22),
(70, 6, 1),
(71, 6, 2),
(72, 6, 3),
(73, 6, 9),
(74, 6, 12),
(75, 6, 13),
(76, 6, 16),
(77, 6, 19),
(78, 6, 22),
(79, 6, 23),
(80, 7, 3),
(81, 7, 9),
(82, 7, 12),
(83, 7, 13),
(84, 7, 16),
(85, 7, 19),
(86, 7, 22),
(87, 1, 24),
(88, 1, 25),
(89, 1, 26),
(90, 1, 27),
(91, 1, 28),
(92, 1, 29),
(93, 1, 30),
(94, 1, 31),
(95, 1, 32),
(96, 1, 33),
(97, 1, 34),
(98, 1, 35),
(99, 1, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_aforo`
--

CREATE TABLE IF NOT EXISTS `dnk_aforo` (
  `id` varchar(2) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `dnk_aforo`
--

INSERT INTO `dnk_aforo` (`id`, `descripcion`) VALUES
('D', 'Documental'),
('F', 'Fisico Aduana'),
('V', 'Fisico Verificador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_auditoria`
--

CREATE TABLE IF NOT EXISTS `dnk_auditoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_DOCUMENTO_codigo` varchar(20) NOT NULL,
  `DNK_DOCUMENTO_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `accion` varchar(200) NOT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=110 ;

--
-- Volcar la base de datos para la tabla `dnk_auditoria`
--

INSERT INTO `dnk_auditoria` (`id`, `DNK_DOCUMENTO_codigo`, `DNK_DOCUMENTO_id`, `usuario_id`, `fecha`, `hora`, `accion`, `ip`) VALUES
(1, '11-DK-85', 2, 1, '2011-11-25', '16:26:00', 'SA', '192.168.2.20'),
(2, '', 36, 1, '2011-11-28', '09:55:39', 'Guarda Observaciones', '::1'),
(3, '11-DK-92', 0, 1, '2011-11-28', '09:55:39', 'Insertar Documento', '::1'),
(4, '11-DK-92', 0, 1, '2011-11-28', '09:55:39', 'Guardar Archivos Escaneados', '::1'),
(5, '', 36, 1, '2011-11-28', '09:58:43', 'Guarda Observaciones', '::1'),
(6, '', 10, 1, '2011-11-28', '09:58:43', 'Inserta o Actualiza Acuerdo', '::1'),
(7, '', 10, 1, '2011-11-28', '09:58:43', 'Inserta o Actualiza Documento Aereo', '::1'),
(8, '', 10, 1, '2011-11-28', '09:58:43', 'Inserta o Actualiza Factura', '::1'),
(9, '', 10, 1, '2011-11-28', '09:58:43', 'Inserta o Actualiza Incop', '::1'),
(10, '', 10, 1, '2011-11-28', '09:58:43', 'Inserta o Actualiza Poliza', '::1'),
(11, '', 10, 1, '2011-11-28', '09:58:43', 'Inserta o Actualiza Documentos Adicionales', '::1'),
(12, '', 36, 1, '2011-11-28', '09:58:43', 'Guarda Gasto', '::1'),
(13, '36', 0, 1, '2011-11-28', '09:58:43', 'Insertar Tramite', '::1'),
(14, '', 36, 1, '2011-11-28', '10:00:32', 'Guarda Observaciones', '::1'),
(15, '', 36, 1, '2011-11-28', '10:00:32', 'Guarda Gasto', '::1'),
(16, '', 36, 1, '2011-11-28', '10:00:32', 'Revision de Documentos', '::1'),
(17, '', 36, 1, '2011-11-28', '10:02:18', 'Guarda Gasto', '::1'),
(18, '', 36, 1, '2011-11-28', '10:02:18', 'Guardar Aduanas', '::1'),
(19, '', 0, 1, '2011-11-28', '10:23:10', 'Actualiza Cliente: 8', '::1'),
(20, '', 36, 1, '2011-11-28', '10:31:35', 'Guarda Gasto', '::1'),
(21, '', 36, 1, '2011-11-28', '10:31:35', 'Guardar Aduanas', '::1'),
(22, '', 42, 3, '2012-06-13', '08:06:58', 'Guarda Observaciones', '10.10.100.208, 127.0'),
(23, '12-DK-80', 0, 3, '2012-06-13', '08:06:58', 'Insertar Documento', '10.10.100.208, 127.0'),
(24, '', 42, 3, '2012-06-13', '08:09:05', 'Guarda Observaciones', '10.10.100.208, 127.0'),
(25, '12-DK-80', 0, 3, '2012-06-13', '08:09:05', 'Insertar Documento', '10.10.100.208, 127.0'),
(26, '', 43, 3, '2012-06-13', '08:10:06', 'Eliminar Documento', '10.10.100.208, 127.0'),
(27, '', 13, 3, '2012-06-13', '08:54:13', 'Inserta o Actualiza Acuerdo', '10.10.100.208, 127.0'),
(28, '', 13, 3, '2012-06-13', '08:54:13', 'Inserta o Actualiza Documento Maritimo', '10.10.100.208, 127.0'),
(29, '', 13, 3, '2012-06-13', '08:54:13', 'Inserta o Actualiza Factura', '10.10.100.208, 127.0'),
(30, '', 13, 3, '2012-06-13', '08:54:13', 'Inserta o Actualiza Factura', '10.10.100.208, 127.0'),
(31, '', 13, 3, '2012-06-13', '08:54:13', 'Inserta o Actualiza Incop', '10.10.100.208, 127.0'),
(32, '', 13, 3, '2012-06-13', '08:54:13', 'Inserta o Actualiza Poliza', '10.10.100.208, 127.0'),
(33, '', 13, 3, '2012-06-13', '08:54:13', 'Inserta o Actualiza Documentos Adicionales', '10.10.100.208, 127.0'),
(34, '', 42, 3, '2012-06-13', '08:54:13', 'Guarda Gasto', '10.10.100.208, 127.0'),
(35, '', 42, 3, '2012-06-13', '08:54:13', 'Insertar Tramite', '10.10.100.208, 127.0'),
(36, '', 42, 3, '2012-06-13', '08:56:08', 'Guarda Gasto', '10.10.100.208, 127.0'),
(37, '', 42, 3, '2012-06-13', '08:56:08', 'Revision de Documentos', '10.10.100.208, 127.0'),
(38, '', 42, 3, '2012-06-13', '08:56:29', 'Guarda Gasto', '10.10.100.208, 127.0'),
(39, '', 42, 3, '2012-06-13', '08:56:29', 'Revision de Documentos', '10.10.100.208, 127.0'),
(40, '', 0, 44, '2012-06-21', '12:19:38', 'Inserta Rol', '192.168.2.24'),
(41, '', 0, 44, '2012-06-21', '12:19:38', 'Inserta Rol', '192.168.2.24'),
(42, '', 0, 1, '2012-07-04', '18:53:56', 'Inserta Usuario: Carlos Ruiz', '186.42.228.163'),
(43, '', 0, 1, '2012-07-04', '18:55:06', 'Inserta Usuario: Carlos Ruiz', '186.42.228.163'),
(44, '', 0, 1, '2012-07-04', '18:55:30', 'Inserta Usuario: Carlos Ruiz', '186.42.228.163'),
(45, '', 0, 1, '2012-07-04', '18:55:57', 'Inserta Usuario: Carlos Ruiz', '186.42.228.163'),
(46, '', 0, 1, '2012-07-04', '18:56:28', 'Inserta Usuario: Carlos Ruiz', '186.42.228.163'),
(47, '', 0, 1, '2012-07-09', '21:17:22', 'Guarda Contacto: aafsdfasdf', '186.47.118.176'),
(48, '', 0, 1, '2012-07-09', '21:17:22', 'Guarda Cliente: WIE', '186.47.118.176'),
(49, '', 0, 1, '2012-07-09', '21:17:32', 'Actualiza Cliente: 1045', '186.47.118.176'),
(50, '', 0, 54, '2012-07-10', '08:11:22', 'Guarda Contacto: Rodolfo Mera', '192.168.2.23'),
(51, '', 0, 54, '2012-07-10', '08:11:22', 'Guarda Cliente: Rodolfo Anibal Mera Mora', '192.168.2.23'),
(52, '', 0, 1, '2012-07-10', '18:39:43', 'Guarda Contacto: SDGSDF', '190.152.157.13'),
(53, '', 0, 1, '2012-07-10', '18:39:43', 'Guarda Cliente: SADFASDF', '190.152.157.13'),
(54, '', 0, 1, '2012-07-10', '19:05:18', 'Guarda Contacto: rsdgfsdf', '190.152.157.13'),
(55, '', 0, 1, '2012-07-10', '19:05:18', 'Guarda Cliente: sdfgsdfg', '190.152.157.13'),
(56, '', 0, 1, '2012-07-10', '19:06:42', 'Guarda Contacto: ', '190.152.157.13'),
(57, '', 0, 1, '2012-07-10', '19:08:24', 'Guarda Contacto: ', '190.152.157.13'),
(58, '', 0, 1, '2012-07-10', '19:09:21', 'Guarda Contacto: sdgsdfgsd', '190.152.157.13'),
(59, '', 0, 1, '2012-07-10', '19:09:21', 'Guarda Cliente: LA ROCA', '190.152.157.13'),
(60, '', 0, 1, '2012-07-10', '19:27:00', 'Guarda Contacto: sdgsdfgsd', '190.152.157.13'),
(61, '', 0, 1, '2012-07-10', '19:27:00', 'Guarda Contacto: ', '190.152.157.13'),
(62, '', 0, 1, '2012-07-10', '19:27:00', 'Actualiza Cliente: LA ROCA', '190.152.157.13'),
(63, '', 0, 1, '2012-07-10', '19:30:11', 'Guarda Contacto: sdgsdfgsd', '190.152.157.13'),
(64, '', 0, 1, '2012-07-10', '19:30:11', 'Guarda Contacto: ', '190.152.157.13'),
(65, '', 0, 1, '2012-07-10', '19:30:11', 'Actualiza Cliente: LA ROCA', '190.152.157.13'),
(66, '', 0, 1, '2012-07-10', '19:31:04', 'Guarda Contacto: sdgsdfgsd', '190.152.157.13'),
(67, '', 0, 1, '2012-07-10', '19:31:04', 'Guarda Contacto: ', '190.152.157.13'),
(68, '', 0, 1, '2012-07-10', '19:31:04', 'Actualiza Cliente: LA ROCA', '190.152.157.13'),
(69, '', 0, 1, '2012-07-10', '19:31:21', 'Guarda Contacto: sdgsdfgsd', '190.152.157.13'),
(70, '', 0, 1, '2012-07-10', '19:31:21', 'Guarda Contacto: ', '190.152.157.13'),
(71, '', 0, 1, '2012-07-10', '19:31:21', 'Actualiza Cliente: LA ROCA', '190.152.157.13'),
(72, '', 0, 1, '2012-07-10', '19:33:19', 'Guarda Contacto: sdgsdfgsd', '190.152.157.13'),
(73, '', 0, 1, '2012-07-10', '19:33:19', 'Guarda Contacto: ', '190.152.157.13'),
(74, '', 0, 1, '2012-07-10', '19:33:19', 'Actualiza Cliente: LA ROCA', '190.152.157.13'),
(75, '', 0, 1, '2012-07-10', '19:34:33', 'Guarda Contacto: sdgsdfgsd', '190.152.157.13'),
(76, '', 0, 1, '2012-07-10', '19:34:33', 'Guarda Contacto: ', '190.152.157.13'),
(77, '', 0, 1, '2012-07-10', '19:34:33', 'Actualiza Cliente: LA ROCA', '190.152.157.13'),
(78, '', 0, 1, '2012-07-10', '19:35:33', 'Guarda Contacto: sdgsdfgsd', '190.152.157.13'),
(79, '', 0, 1, '2012-07-10', '19:35:33', 'Guarda Contacto: ', '190.152.157.13'),
(80, '', 0, 1, '2012-07-10', '19:35:33', 'Actualiza Cliente: LA ROCA', '190.152.157.13'),
(81, '', 0, 1, '2012-07-10', '19:36:26', 'Actualiza Cliente: 1048', '190.152.157.13'),
(82, '', 0, 1, '2012-07-10', '19:36:32', 'Actualiza Cliente: 1049', '190.152.157.13'),
(83, '', 0, 1, '2012-07-10', '19:37:45', 'Actualiza Cliente: 1049', '190.152.157.13'),
(84, '', 0, 1, '2012-07-10', '19:38:03', 'Actualiza Cliente: 1049', '190.152.157.13'),
(85, '', 0, 1, '2012-07-10', '19:38:09', 'Actualiza Cliente: 1049', '190.152.157.13'),
(86, '', 0, 1, '2012-07-10', '19:38:27', 'Actualiza Cliente: 1049', '190.152.157.13'),
(87, '', 0, 1, '2012-07-10', '19:38:31', 'Actualiza Cliente: 1049', '190.152.157.13'),
(88, '', 0, 1, '2012-07-10', '19:38:46', 'Actualiza Cliente: 1049', '190.152.157.13'),
(89, '', 0, 1, '2012-07-10', '19:38:59', 'Actualiza Cliente: 1049', '190.152.157.13'),
(90, '', 0, 1, '2012-07-10', '19:40:30', 'Guarda Contacto: Willian Espinosa', '190.152.157.13'),
(91, '', 0, 1, '2012-07-10', '19:40:30', 'Actualiza Cliente: WIE Solutions', '190.152.157.13'),
(92, '', 0, 1, '2012-07-31', '15:19:42', 'Inserta Usuario: Victor Jouve', '192.168.2.211'),
(93, '', 0, 1, '2012-07-31', '15:19:42', 'Inserta Usuario: ', '192.168.2.211'),
(94, '', 12, 1, '2012-08-02', '00:24:11', 'Guarda Observaciones', '186.42.79.66'),
(95, '12-DK-81', 0, 1, '2012-08-02', '00:24:11', 'Insertar Documento', '186.42.79.66'),
(96, '', 12, 1, '2012-08-02', '00:27:01', 'Guarda Observaciones', '186.42.79.66'),
(97, '12-DK-82', 0, 1, '2012-08-02', '00:27:01', 'Insertar Documento', '186.42.79.66'),
(98, '', 12, 44, '2012-08-02', '08:29:52', 'Guarda Observaciones', '192.168.2.24'),
(99, '12-DK-83', 0, 44, '2012-08-02', '08:29:52', 'Insertar Documento', '192.168.2.24'),
(100, '', 12, 44, '2012-08-02', '08:30:08', 'Guarda Observaciones', '192.168.2.24'),
(101, '12-DK-83', 0, 44, '2012-08-02', '08:30:08', 'Insertar Documento', '192.168.2.24'),
(102, '', 0, 44, '2012-08-02', '08:44:38', 'Guarda Contacto: ', '192.168.2.24'),
(103, '', 0, 44, '2012-08-02', '08:44:38', 'Actualiza Cliente: PROANO REPRESENTACIONES S.A.', '192.168.2.24'),
(104, '', 12, 44, '2012-08-02', '08:53:22', 'Guarda Observaciones', '192.168.2.24'),
(105, '12-DK-84', 0, 44, '2012-08-02', '08:53:22', 'Insertar Documento', '192.168.2.24'),
(106, '', 0, 1, '2012-08-02', '17:50:01', 'Inserta Usuario: Monica Moreta', '192.168.2.24'),
(107, '', 0, 1, '2012-09-21', '10:03:06', 'Inserta Usuario: Belen Jouve', '10.10.100.208, 127.0'),
(108, '', 0, 1, '2013-01-30', '08:46:24', 'Inserta Usuario: Dulfary Villacres', '10.10.100.208, 127.0'),
(109, '', 0, 1, '2013-01-30', '09:18:54', 'Borra Usuario', '10.10.100.208, 127.0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_banco`
--

CREATE TABLE IF NOT EXISTS `dnk_banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Volcar la base de datos para la tabla `dnk_banco`
--

INSERT INTO `dnk_banco` (`id`, `descripcion`) VALUES
(1, 'Banco Pichincha'),
(2, 'Banco del PacIfico'),
(3, 'Banco de Guayaquil'),
(4, 'Produbanco'),
(5, 'Banco Bolivariano'),
(6, 'Banco Internacional'),
(7, 'Banco del Austro'),
(8, 'Banco Promerica'),
(9, 'Banco de Machala'),
(10, 'Citibank'),
(11, 'Banco ProCredit'),
(12, 'UniBanco'),
(13, 'Banco Solidario'),
(14, 'Banco de Loja'),
(15, 'Banco Territorial'),
(16, 'Banco Coopnacional'),
(17, 'Banco Amazonas'),
(18, 'Banco Capital'),
(19, 'Banco D-MIRO'),
(20, 'Banco Finca'),
(21, 'Banco Comercial de Manabí'),
(22, 'Banco COFIEC'),
(23, 'Banco del Litoral'),
(24, 'Banco Delbank'),
(25, 'Banco Sudamericano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_carga_contenedor`
--

CREATE TABLE IF NOT EXISTS `dnk_carga_contenedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dnk_documento_id` int(11) NOT NULL,
  `fecha_carta_salida` date NOT NULL,
  `fecha_despacho` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `dnk_carga_contenedor`
--

INSERT INTO `dnk_carga_contenedor` (`id`, `dnk_documento_id`, `fecha_carta_salida`, `fecha_despacho`) VALUES
(2, 1, '2011-10-27', '2011-10-28'),
(3, 14, '2011-10-24', '2011-10-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_ciudad`
--

CREATE TABLE IF NOT EXISTS `dnk_ciudad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la Ciudad',
  `descripcion` varchar(60) NOT NULL COMMENT 'Descripcion de la Ciudad',
  `abreviatura` varchar(10) NOT NULL COMMENT 'Abreviatura de la ciudad',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcar la base de datos para la tabla `dnk_ciudad`
--

INSERT INTO `dnk_ciudad` (`id`, `descripcion`, `abreviatura`) VALUES
(1, 'Quito', 'UIO'),
(2, 'Guayaquil-Maritimo', 'GYE-MAR'),
(3, 'Guayaquil-Aereo', 'GYE'),
(4, 'Manta', 'MEC'),
(5, 'Cuenca', 'CUE'),
(6, 'Huaquillas', 'HUA'),
(7, 'Puerto Bolivar', 'PBO'),
(8, 'Esmeraldas', 'ESM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_cliente`
--

CREATE TABLE IF NOT EXISTS `dnk_cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ruc` varchar(13) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `id_tipo_cliente` tinyint(4) NOT NULL COMMENT '1: Estalales 2:Privados',
  `telefono` varchar(20) DEFAULT NULL,
  `ext` varchar(10) DEFAULT NULL,
  `web` varchar(45) DEFAULT NULL,
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1058 ;

--
-- Volcar la base de datos para la tabla `dnk_cliente`
--

INSERT INTO `dnk_cliente` (`id`, `ruc`, `nombre`, `direccion`, `id_tipo_cliente`, `telefono`, `ext`, `web`, `usuario`, `clave`) VALUES
(15, '1720802394', 'WIE Solutions', 'Calderon', 2, '3811544', '', 'www.iblack.com.ec', 'wespinosa', '26c141e2a38485a6e849cb6d2f011013215617c'),
(1008, '1791804619001', 'CYFOIL', 'Av. República del Salvador N34-499 y Portugal Edif. Estrento piso 1 of 03', 2, '6018636', '', '', '', ''),
(1007, '1768152800001', 'CORPORACION ELECTRICA DEL ECUADOR/ CELEC  EP/TERMOPICHINCHA', 'Av. 6 de diciembre N26-235 y Orellana edif. Transelectric  4to piso', 1, '2563300', NULL, NULL, '', ''),
(1006, '1791913582001', 'COMINTAM /COMERCIO INTEGRAL AMERICANO S.A', '', 2, '', NULL, NULL, '', ''),
(1003, '1791840712001', 'AURELIA - KINROSS/AURELIAN ECUADOR S.A.', '', 2, '2996405', NULL, NULL, '', ''),
(1004, '1792010942001', 'CIRSA ECUADOR S.A.', 'Av.República del Salvador 880 y Suecia Ed. Admirante Colón 1er piso', 2, '2252069', NULL, NULL, '', ''),
(1001, '1792148200001', 'AMA ENERGY SERVICE S.A.', 'Republica del Salvador E9-24 y Shyris Edif. Euro piso 6', 2, '3332079', NULL, NULL, '', ''),
(1002, '1791957253001', 'AZULEC S.A.', 'Granados E12-02 y Colimes', 2, '2977600', NULL, NULL, '', ''),
(1005, '1792010586001', 'CODABE', 'Av. 10 de Agosto N47-214 pasaje Federico Paredes', 2, '2811021', NULL, NULL, '', ''),
(1009, '1791863984001', 'DISETEC SOLUCIONES INDUSTRIALES', 'Mariano Cardenal Oe1-74  y Vicente Duque (detrás de IIASA Caterpilar)', 2, '2806222', NULL, NULL, '', ''),
(1010, '1768153530001', 'EP PETROECUADOR', 'Alpallana  y 6 de diciembre', 1, '2563060', NULL, NULL, '', ''),
(1017, '', 'FAIRBANKS MORSE ENGINE', '701 White Avenue Beloit,Wl 53511-5492', 3, '7865819516', NULL, NULL, '', ''),
(1018, '1791825845001', 'FLOWSEAL S.A.', 'Av. Shyris N35-174 y Suecia Edif. Renazzo Plaza Ofic. 507 /Iñaquito y NNUU Edif. UNP', 2, '2451236', NULL, NULL, '', ''),
(1019, '1707009971001', 'FRANCISCO ALARCON', '', 2, '97703525', NULL, NULL, '', ''),
(1020, '1791351088001', 'GRAPHIC SOURCE C.A.', 'Benalcazar N 11-285 ( 1569) y Guatemala SECTOR SAN JUAN POR LA GASOLINERA A LADO', 2, '97822822', NULL, NULL, '', ''),
(1021, '1792036178001', 'IMPROLAB', '', 2, '99232627', NULL, NULL, '', ''),
(1022, '1791220668001', 'INGENIERIA Y REFRIGERACIÓN CIA.LTDA./ INFRI', 'De los aceitunos E6-08 y Eloy Alfaro', 2, '2802553', NULL, NULL, '', ''),
(1023, '1792050103001', 'INMOPETROSA', 'El tiempo n37-137 y Roma', 2, '2258425', NULL, NULL, '', ''),
(1024, '1792050103001', 'INMOPETROSA', '12 Octubre  N24-562 y Luis Cordero', 2, '2225959', NULL, NULL, '', ''),
(1025, '', 'LEVO', 'Vía Interoceanica KM 10 1/2   Cumbayá  Centro Ejecutivo Espacia - Oficina # 212', 2, '98912434', NULL, NULL, '', ''),
(1026, '1391776578001', 'MECAGRUN CIA.  LTDA.', '', 2, '', NULL, NULL, '', ''),
(1027, '', 'MINISTERIO DE SALUD PUBLICA', 'Republica del Salvador y', 1, '3814400', NULL, NULL, '', ''),
(1028, '', 'MINGA', '', 2, '', NULL, NULL, '', ''),
(1029, '1791774647001', 'MISSION PETROLEUM S.A.', 'Av. República de El Salvador 491  y Naciones Unidas Edif. Suyana  3er. Piso,ofic. 301', 2, '3333663', NULL, NULL, '', ''),
(1030, '', 'MQ TEXAS OIL SUPPLY, CO. ', '11621 Spring Cypress Rd. Ste F  Tomball, Texas 77377', 3, '7139318604', NULL, NULL, '', ''),
(1031, '991362452001', 'MODALTRADE S.A.', 'Av. Amazonas No.3461 y Av. Atahualpa 6to piso', 2, '2266893', NULL, NULL, '', ''),
(1032, '1792168619001', 'NEURALOG', '', 2, '98521421', NULL, NULL, '', ''),
(1033, '1791765362001', 'OLEADUCTO DE CRUDOS PESADOS OCP ECUADOR S.A.', 'Amazonas 1014 y Naciones Unidas Ed. La Previsora Torre A piso 3', 1, '2973314', NULL, NULL, '', ''),
(1034, '1792013496001', 'PROANO REPRESENTACIONES S.A.', 'Domingo Rengifo N74-116 y Joaquin Mancheno  CARCELEN INDUSTRIAL', 2, '2476974', NULL, NULL, '', ''),
(1035, '190357791001', 'REYBEC S.A/FRUIT', 'José Caamaño s8-242 y Espejo en el VALLE', 2, '2343708', NULL, NULL, '', ''),
(1036, '991475907001', 'ROLASA ROLA INTERNACIONAL S.A.', '', 2, '94492022', NULL, NULL, '', ''),
(1037, '1792181216001', 'ROS ROCA INDOX CRYO ENERGY S.L.', 'Mariana de Jesús E7-8 y La Pradera', 2, '', NULL, NULL, '', ''),
(1038, '', 'SEGURE LOGISTICS INTERNATIONAL', 'De la Canela E2-06 y Amazonas por los pollos Gus sector El Labrador', 2, '2419190', NULL, NULL, '', ''),
(1039, '1791158261001', 'SERINPE', 'Gonzalez Suarez N32-12', 2, '2909404', NULL, NULL, '', ''),
(1040, '1790550176001', 'SJ JERSEY  ECUATORIANO C.A.', 'De los Cerezos Oe1-321 y Real Audiencia/ CALDERON ', 2, '3980500', NULL, NULL, '', ''),
(1041, '1792169755001', 'SK  ENGINEERING', 'Amazonas 1014 y Naciones Unidas Ed. La Previsora Torre A piso 11 of.1102', 2, '2260500', NULL, NULL, '', ''),
(1042, '1791241061001', 'SCHNEIDER ELECTRIC', '', 2, '2465792', NULL, NULL, '', ''),
(1043, '1791241061001', 'TRAUMA ORTOPEDICS S.C.C.', 'Colón 1310 y Foch Edif. Vilagomex Yepéz Ofic. 5A', 2, '2554297', NULL, NULL, '', ''),
(1044, '1791851404001', 'TREE OIL CIA LTDA.', 'América N34 -437 y Veracruz Edif. Jativa 2do. Piso', 2, '3318707', NULL, NULL, '', ''),
(1046, '099813499', 'Rodolfo Anibal Mera Mora', 'Ibarra Edif. Sucre 624 Calle sucre', 2, '2563708', NULL, '', '', ''),
(1050, '', 'dfsdbsdfb', 'sdfbsdfbsdf', 2, '234523452345', '23452345', 'xzxb', '', ''),
(1051, '123412341234', 'LA ROCA', 'AAAAAAAAAAAAAAAA', 2, '2222', '2222222', 'vzxcvzxcv', '', ''),
(1052, '1715173652001', 'VASCO CASTRO CRISTIAN DARIO', 'KM6 1/2 VIA QUEVEDO S/N Y MARGEN DERECHO', 2, '2271201', '', '', '', ''),
(1053, '1704930948001', 'VELASTEGUI LASSO BOLIVAR ALEJANDRO', 'GASPAR DE VILLAROEL 952 Y SHYRIS', 2, '2271201', '', '', '', ''),
(1056, '1891725287001', 'GLOBAL TRAIL CIA. LTDA.', 'AV AMERICA N39-386 Y AV 10 DE AGOSTO', 2, '8871201', '', '', '', ''),
(1055, '1792188539001', 'COBAX DE COMERCIO CIA. LTDA.', 'AV. EL INCA OE1-191 Y AV. DE LA PRENSA', 2, '2445093', '', '', '', ''),
(1057, '1792081734000', 'XIMACEG ELEVADORES CIA. LTDA', 'AV. 10 DE AGOSTON3926 Y VILLALENGUA', 2, '06218586', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_contactos`
--

CREATE TABLE IF NOT EXISTS `dnk_contactos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_CLIENTE_id` int(11) NOT NULL,
  `DNK_GERENCIAS_id` int(11) NOT NULL,
  `contacto` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `celular` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Volcar la base de datos para la tabla `dnk_contactos`
--

INSERT INTO `dnk_contactos` (`id`, `DNK_CLIENTE_id`, `DNK_GERENCIAS_id`, `contacto`, `email`, `celular`) VALUES
(1, 1010, 1, 'Richard  Chamba', 'rchamba@pro.eppetroecuador.ec', '98229221'),
(2, 1010, 1, 'Jacqueline Stayce', 'jstacey@eppetroecuador.ec', ''),
(3, 1010, 1, 'Diego Salas ', 'dsalas@eppetroecuador.ec', ''),
(4, 1010, 2, 'Rosario Villegas', 'rvillegas@eppetroecuador.ec', ''),
(5, 1010, 2, 'Francisco Sánchez', 'fsanchez@ind.eppetroecuador.ec', ''),
(6, 1010, 2, 'Alexis Loor', 'aloor@eppetroecuador.ec', ''),
(7, 1010, 2, 'Eduardo Sosa', 'esosa@com.eppetroecuador.ec', '2671403'),
(8, 1010, 3, 'Irene Zabala', ' izabala@com.eppetroecuador.ec', ''),
(9, 1010, 3, 'Angelo Sebastián Toro Torres', 'storo@tra.eppetroecuador.ec', ''),
(10, 1010, 3, 'Gonzalo Toledo', 'gtoledo@com.eppetroecuador.ec', ''),
(11, 1010, 3, 'Mauricio Valenzuela', 'mvalenzuela@tra.eppetroecuador.ec', ''),
(12, 1010, 3, 'Carmen Rosero', 'crosero@tra.eppetroecuador.ec', ''),
(13, 1010, 3, 'Alfredo Burbano', 'aburbano@sote.petroecuador.com.ec', ''),
(14, 1010, 3, 'Ruth Lalangui Guevara', 'rlalangui@tra.eppetroecuador.ec', ''),
(15, 1010, 3, 'Gabriela Zurita', 'mzurita@com.eppetroecuador.ec', ''),
(16, 1010, 4, 'Daniela Castellanos', 'dcastellanos@com.eppetroecuador.ec', ''),
(17, 1010, 4, 'Jorge Vanronzelen', 'jvanronzelen@pro.eppetroecuador.ec', ''),
(18, 1010, 5, 'Luis Oracio Lema Altamirano', 'llema@pro.eppetroecuador.ec', ''),
(19, 1010, 5, 'Marlon Guerrón', 'mguerron@pro.eppetroecuador.ec', ''),
(20, 1010, 5, 'Juan Diego Brito', 'jbrito@pro.eppetroecuador.ec', ''),
(21, 1020, 5, 'Josè Guevara Pereira', 'jguevara2@ind.eppetroecuador.ec', '96601850'),
(22, 1020, 6, 'Zoila Marisol Andrade Vaca', 'mandrade2@ind.eppetroecuador.ec', ''),
(23, 1010, 6, 'Marcia Calva', 'mcalva@ind.eppetroecuador.ec', ''),
(24, 39, 0, 'Willian Espinosa', 'wespinosa86@gmail.com', '092725859'),
(25, 1010, 6, 'Teresa Yépez', 'tyepez@ind.eppetroecuador.ec', ''),
(26, 1010, 6, 'Patricio Zambrano', 'pzambrano2@ind.eppetroecuador.ec', ''),
(27, 1010, 6, 'Patricia Torres', 'ptorres2@ind.eppetroecuador.ec', ''),
(29, 1046, 0, 'Rodolfo Mera', '', ''),
(30, 1051, 0, 'sdgsdfgsd', 'fgsdfgsdfg', '223452345'),
(31, 15, 0, 'Willian Espinosa', 'wespinosa@iblack.com.ec', '092725859'),
(32, 15, 0, 'Alfredo Guerron', 'wespinosa86@gmail.com', '0992725859'),
(33, 15, 0, 'Monica Ortiz', 'willianespinosa_0708@hotmail.com', '0992725859');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_despacho`
--

CREATE TABLE IF NOT EXISTS `dnk_despacho` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_DOCUMENTO_id` int(10) unsigned NOT NULL,
  `DNK_TP_CARGA_id` int(10) unsigned NOT NULL,
  `fecha` date NOT NULL,
  `estado` tinyint(4) NOT NULL COMMENT '1:stanby 2:aprobado',
  PRIMARY KEY (`id`),
  KEY `DESPACHO_FKIndex1` (`DNK_TP_CARGA_id`),
  KEY `DESPACHO_FKIndex2` (`DNK_DOCUMENTO_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `dnk_despacho`
--

INSERT INTO `dnk_despacho` (`id`, `DNK_DOCUMENTO_id`, `DNK_TP_CARGA_id`, `fecha`, `estado`) VALUES
(1, 2, 1, '2011-09-30', 2),
(2, 1, 2, '2011-10-27', 2),
(3, 13, 1, '2011-10-27', 2),
(4, 14, 2, '2011-10-24', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_documento`
--

CREATE TABLE IF NOT EXISTS `dnk_documento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_CLIENTE_id` int(10) unsigned NOT NULL,
  `DNK_GERENCIAS_id` int(11) NOT NULL,
  `codigo` varchar(20) DEFAULT NULL,
  `num_ref_cliente` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `proveedor` int(10) NOT NULL,
  `id_tp_carga` int(11) NOT NULL COMMENT '1: Suelta , 2: Contenedor',
  `via` varchar(3) NOT NULL,
  `DNK_TP_DOCUMENTO_id` int(11) NOT NULL,
  `ciudad_id` int(11) NOT NULL,
  `estado` int(10) unsigned DEFAULT NULL COMMENT '1: Abierto 2: Cerrado 3:Anulado',
  `usuario_id` int(11) NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `DOCUMENTO_FKIndex1` (`DNK_CLIENTE_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Volcar la base de datos para la tabla `dnk_documento`
--

INSERT INTO `dnk_documento` (`id`, `DNK_CLIENTE_id`, `DNK_GERENCIAS_id`, `codigo`, `num_ref_cliente`, `fecha`, `hora`, `proveedor`, `id_tp_carga`, `via`, `DNK_TP_DOCUMENTO_id`, `ciudad_id`, `estado`, `usuario_id`, `fecha_fin`) VALUES
(1, 1003, 0, '13-DK-90', '1231444', '2013-09-24', '15:29:50', 1004, 1, 'AE', 1, 5, 1, 3, '0000-00-00'),
(2, 1003, 0, '13-DK-91', 'assa121212', '2013-09-24', '16:29:56', 1006, 1, 'AE', 1, 3, 1, 8, '0000-00-00'),
(3, 1020, 0, '13-DK-92', '2342ssdf', '2013-09-24', '16:31:55', 1033, 1, 'AE', 1, 2, 1, 12, '0000-00-00'),
(4, 1003, 0, '13-DK-93', '2323sasdasd', '2013-09-24', '16:33:06', 1009, 1, 'MA', 2, 2, 1, 3, '0000-00-00'),
(5, 1006, 0, '13-DK-94', 'qqqqqqq', '2013-10-03', '10:12:45', 1004, 2, 'MA', 3, 1, 1, 3, '0000-00-00'),
(6, 1030, 0, '13-DK-95', 'wwwwwwwww', '2013-10-03', '10:18:00', 1018, 1, 'MA', 1, 2, 1, 3, '0000-00-00'),
(7, 1010, 0, '13-DK-96', '999877889', '2013-10-03', '14:35:45', 1018, 1, 'MA', 1, 1, 1, 5, '0000-00-00'),
(8, 1010, 0, '13-DK-97', 'aaaaaaaaaa', '2013-10-08', '14:40:06', 1003, 1, 'MA', 1, 2, 1, 7, '0000-00-00'),
(9, 1007, 0, '13-DK-98', 'sssssss', '2013-10-08', '10:56:57', 15, 1, 'MA', 1, 5, 1, 14, '0000-00-00'),
(10, 15, 0, '13-DK-99', '213444', '2013-10-14', '13:40:08', 15, 2, 'MA', 5, 6, 1, 2, '0000-00-00'),
(11, 1004, 0, '13-DK-100', 'asdasd', '2013-10-17', '17:13:32', 1002, 1, 'AE', 1, 1, 1, 9, '0000-00-00'),
(12, 1018, 0, '13-DK-101', 'eqwerqw2', '2013-10-22', '15:28:38', 1007, 1, 'MA', 2, 2, 1, 4, '0000-00-00'),
(13, 1008, 0, '13-DK-102', 'asdfasdf', '2013-10-22', '15:41:52', 1018, 1, 'MA', 2, 1, 1, 4, '0000-00-00'),
(14, 1005, 0, '13-DK-103', 'asdfasdfasdf', '2013-10-22', '15:49:46', 1002, 2, 'MA', 2, 2, 1, 7, '0000-00-00'),
(15, 1018, 0, '13-DK-104', 'wwwww', '2013-10-23', '18:00:25', 15, 1, 'MA', 1, 1, 1, 4, '0000-00-00'),
(16, 1004, 0, '13-DK-105', 'asdfasdf', '2013-10-23', '18:59:40', 1006, 1, 'MA', 1, 2, 1, 2, '0000-00-00'),
(17, 15, 0, '13-DK-106', 'qweqqwq', '2013-10-27', '18:24:10', 1018, 1, 'MA', 5, 1, 1, 2, '0000-00-00'),
(18, 1006, 0, '13-DK-107', 'asasas', '2013-10-27', '18:31:56', 1003, 1, 'MA', 1, 1, 1, 2, '0000-00-00'),
(19, 1003, 0, '13-DK-108', '987634', '2013-10-27', '18:33:52', 1024, 1, 'MA', 2, 2, 1, 2, '0000-00-00'),
(20, 15, 0, '13-DK-109', 'SADFASDF987', '2013-10-27', '23:57:02', 1004, 2, 'MA', 2, 2, 1, 2, '0000-00-00'),
(21, 15, 0, '13-DK-110', 'ASDASDA', '2013-10-28', '00:03:28', 1007, 1, 'MA', 1, 1, 1, 4, '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_documento_aduana`
--

CREATE TABLE IF NOT EXISTS `dnk_documento_aduana` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_VERIFICADORA_id` int(10) unsigned NOT NULL,
  `DNK_AFORO_id` int(10) unsigned NOT NULL,
  `DNK_DOCUMENTO_id` int(10) unsigned NOT NULL,
  `orden` varchar(255) DEFAULT NULL,
  `refrendado` varchar(255) DEFAULT NULL,
  `dav` varchar(255) DEFAULT NULL,
  `dau` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `valor_verificadora` varchar(20) DEFAULT NULL,
  `observacion` mediumtext NOT NULL,
  `estado` tinyint(4) NOT NULL COMMENT '1:stanby 2:aprobado',
  PRIMARY KEY (`id`),
  KEY `DOCUMENTO_ADUANA_FKIndex1` (`DNK_DOCUMENTO_id`),
  KEY `DOCUMENTO_ADUANA_FKIndex2` (`DNK_AFORO_id`),
  KEY `DOCUMENTO_ADUANA_FKIndex3` (`DNK_VERIFICADORA_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `dnk_documento_aduana`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_documento_gasto`
--

CREATE TABLE IF NOT EXISTS `dnk_documento_gasto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_DOCUMENTO_codigo` varchar(20) NOT NULL,
  `factura` varchar(60) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `valor` varchar(20) DEFAULT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DOCUMENTO_GASTO_FKIndex1` (`DNK_DOCUMENTO_codigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Volcar la base de datos para la tabla `dnk_documento_gasto`
--

INSERT INTO `dnk_documento_gasto` (`id`, `DNK_DOCUMENTO_codigo`, `factura`, `fecha`, `descripcion`, `valor`, `estado`) VALUES
(1, '13-DK-97', '', '0000-00-00', 'Inen  costo ', '3.', ''),
(2, '13-DK-97', '', '0000-00-00', 'COLAS', '10', ''),
(3, '13-DK-97', '', '0000-00-00', 'AGUAS', '10', ''),
(8, '13-DK-97', '', '0000-00-00', 'Transporte Interno', '350', ''),
(5, '13-DK-97', '', '0000-00-00', 'SEGUNDO', '20', ''),
(6, '13-DK-97', '', '0000-00-00', 'LIMON', '30', ''),
(7, '13-DK-97', '', '0000-00-00', 'NARANJAS', '20', ''),
(9, '13-DK-97', '', '0000-00-00', 'Transporte Interno', '320', ''),
(11, '13-DK-97', '', '0000-00-00', '2', '1', ''),
(12, '13-DK-97', '', '0000-00-00', 'asdfasdf', '123', ''),
(13, '13-DK-97', '', '0000-00-00', 'zxcvzx', '123', ''),
(14, '13-DK-97', '', '0000-00-00', 'zxcvzx', '123', ''),
(15, '1212', '', '0000-00-00', 'qwqwqw', '12123', ''),
(16, '13-DK-98', '', '0000-00-00', 'wwwwwwwwww', '112', ''),
(17, '13-DK-105', '', '2013-10-25', 'Solicitud de Egreso 8', '2134.00', 'A'),
(20, '13-DK-108', '001-001-0005236', '2013-10-27', 'Solicitud de Egreso 9', '123.85', 'A'),
(21, '13-DK-108', '001-001-0005236', '2013-10-27', 'Solicitud de Egreso 10', '50.00', ''),
(22, '13-DK-108', '001-001-0005236', '2013-10-27', 'Solicitud de Egreso 11', '800.00', 'A'),
(23, '13-DK-106', '98765422', '2013-10-27', 'Solicitud de Egreso 12', '123.85', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_doc_escaneados`
--

CREATE TABLE IF NOT EXISTS `dnk_doc_escaneados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_DOCUMENTO_codigo` varchar(20) NOT NULL,
  `DNK_ACTIVIDAD_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `DNK_TPDOC_ESCANEADOS_id` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL COMMENT 'Descripcion del Archivo',
  `nombre_original` varchar(255) NOT NULL COMMENT 'Nombre Original inicial del Archivo',
  `nombre_almacenado` varchar(500) NOT NULL COMMENT 'Nombre del Documento Actual',
  `path` varchar(500) NOT NULL,
  `size` varchar(60) NOT NULL,
  `extencion` varchar(10) NOT NULL COMMENT 'Extencion del Archivo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `dnk_doc_escaneados`
--

INSERT INTO `dnk_doc_escaneados` (`id`, `DNK_DOCUMENTO_codigo`, `DNK_ACTIVIDAD_id`, `usuario_id`, `DNK_TPDOC_ESCANEADOS_id`, `descripcion`, `nombre_original`, `nombre_almacenado`, `path`, `size`, `extencion`) VALUES
(1, '13-DK-106', 2, 3, 8, 'aaaa', 'ACTA DE JUNTA DE SOCIOS.docx', '20131027-autoriz.comexi-actadejuntadesocios.docx', 'uploads/13-DK-106/20131027-autoriz.comexi-actadejuntadesocios.docx', '15.69 kB', 'docx'),
(2, '13-DK-106', 2, 3, 8, 'aaaa', 'Acta_Junta_Directiva.doc', '20131027-autoriz.comexi-acta_junta_directiva.doc', 'uploads/13-DK-106/20131027-autoriz.comexi-acta_junta_directiva.doc', '32.50 kB', 'doc'),
(3, '13-DK-106', 2, 3, 8, 'aaaa', 'Acta_Reforma_Sociedad_por_Venta_de_Cuotas.doc', '20131027-autoriz.comexi-acta_reforma_sociedad_por_venta_de_cuotas.doc', 'uploads/13-DK-106/20131027-autoriz.comexi-acta_reforma_sociedad_por_venta_de_cuotas.doc', '31.00 kB', 'doc'),
(4, '13-DK-106', 30, 3, 36, 'hola', 'autorización RUP.pdf', '20131027-declaracioniva-autorizaci??nrup.pdf', 'uploads/13-DK-106/20131027-declaracioniva-autorizaci??nrup.pdf', '', 'pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_emp_transporte`
--

CREATE TABLE IF NOT EXISTS `dnk_emp_transporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `ruc` varchar(15) NOT NULL,
  `telefono_ep` varchar(20) NOT NULL,
  `direccion_ep` varchar(250) NOT NULL,
  `mail_ep` varchar(250) NOT NULL,
  `web_ep` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `dnk_emp_transporte`
--

INSERT INTO `dnk_emp_transporte` (`id`, `nombre`, `ruc`, `telefono_ep`, `direccion_ep`, `mail_ep`, `web_ep`) VALUES
(1, 'TRANSUR', '17855895254', '222250', 'FADSKFJALKSDF', 'daps1411@hotmail.com', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_factura_documento`
--

CREATE TABLE IF NOT EXISTS `dnk_factura_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_DOCUMENTO_id` int(11) NOT NULL,
  `DNK_CLIENTE_id` int(11) NOT NULL,
  `fecha_factura` date NOT NULL,
  `valor` varchar(50) NOT NULL,
  `valor_siniva` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `dnk_factura_documento`
--

INSERT INTO `dnk_factura_documento` (`id`, `DNK_DOCUMENTO_id`, `DNK_CLIENTE_id`, `fecha_factura`, `valor`, `valor_siniva`) VALUES
(1, 2, 1, '2011-09-30', '558.4', '200');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_factura_documento_detalle`
--

CREATE TABLE IF NOT EXISTS `dnk_factura_documento_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_FACTURA_DOCUMENTO_id` int(11) NOT NULL,
  `detalle` varchar(250) NOT NULL,
  `valor_unitario` int(11) NOT NULL,
  `iva` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `dnk_factura_documento_detalle`
--

INSERT INTO `dnk_factura_documento_detalle` (`id`, `DNK_FACTURA_DOCUMENTO_id`, `detalle`, `valor_unitario`, `iva`) VALUES
(1, 1, 'HONORARIOS', 120, 1),
(2, 1, 'VARIOS', 200, 1),
(3, 1, 'TRASNPORTE', 200, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_funcion_auditoria`
--

CREATE TABLE IF NOT EXISTS `dnk_funcion_auditoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcar la base de datos para la tabla `dnk_funcion_auditoria`
--

INSERT INTO `dnk_funcion_auditoria` (`id`, `descripcion`, `estado`) VALUES
(1, 'GRABAR', 'A'),
(2, 'EDITAR', 'A'),
(3, 'ELIMINAR', 'A'),
(4, 'SUBIR ARCHIVOS', 'A'),
(5, 'BAJAR ARCHIVOS', 'A'),
(6, 'ENVIAR CORREO', 'A'),
(7, 'INGRESO AL SISTEMA', 'A'),
(8, 'IMPRIMIR', 'A'),
(9, 'CREAR TRAMITE', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_gerencias`
--

CREATE TABLE IF NOT EXISTS `dnk_gerencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_CLIENTE_id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `web` varchar(250) NOT NULL,
  `clave` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `dnk_gerencias`
--

INSERT INTO `dnk_gerencias` (`id`, `DNK_CLIENTE_id`, `nombre`, `direccion`, `telefono`, `web`, `clave`) VALUES
(1, 1010, 'EP PETROECUADOR SUBGERENCIA/DESARROLLO ORGANIZACIONAL', 'Alpallana  y 6 de diciembre', '2563060', '', ''),
(2, 1010, 'EP PETROECUADOR DESARROLLO ORGANIZACIONAL', 'Alpallana  y 6 de diciembre', '2563060', '', ''),
(3, 1010, 'EP PETROECUADOR GERENCIA DE  ABASTECIMIENTOS  TRANSPORTE Y ALMACENAMIENTO ', 'Alpallana  y 6 de diciembre', '2677428', '', ''),
(4, 1010, 'EP PETROECUADOR GERENCIA DE COMERCIALIZACIÓN ', 'Alpallana  y 6 de diciembre', '2563607', '', ''),
(5, 1010, 'EP PETROECUADOR GERENCIA DE EXPLORACION Y PRODUCCION', 'Alpallana E8-30 y Diego de Almagro, Edificio "Plaza Lavì"', '2440333', '', ''),
(6, 1010, 'EP PETROECUADOR GERENCIA DE REFINACION', 'Alpallana  y 6 de diciembre', '3239032', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_levantamiento`
--

CREATE TABLE IF NOT EXISTS `dnk_levantamiento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_DOCUMENTO_id` int(10) unsigned NOT NULL,
  `dias_levantamiento` int(10) unsigned DEFAULT NULL,
  `observaciones` mediumtext,
  `estado` int(11) NOT NULL COMMENT '1:stanby 2 aprobado',
  `fechalev` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `LEVANTAMIENTO_FKIndex1` (`DNK_DOCUMENTO_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `dnk_levantamiento`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_liquidacion`
--

CREATE TABLE IF NOT EXISTS `dnk_liquidacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_AFORO_id` int(10) unsigned NOT NULL,
  `DNK_DOCUMENTO_id` int(10) unsigned NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `url_liquidacion` varchar(255) DEFAULT NULL,
  `valor` varchar(20) DEFAULT NULL,
  `estado_pago` int(10) unsigned DEFAULT NULL COMMENT '1: impago 2: pago',
  `fecha_caducidad` date DEFAULT NULL,
  `fecha_pago` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `LIQUIDACION_FKIndex1` (`DNK_DOCUMENTO_id`),
  KEY `LIQUIDACION_FKIndex2` (`DNK_AFORO_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `dnk_liquidacion`
--

INSERT INTO `dnk_liquidacion` (`id`, `DNK_AFORO_id`, `DNK_DOCUMENTO_id`, `observaciones`, `url_liquidacion`, `valor`, `estado_pago`, `fecha_caducidad`, `fecha_pago`) VALUES
(1, 1, 2, 'TRAMITE LIQUIDADO SIN NOVEDAD', '', '12587', 2, '1969-12-31', '0000-00-00'),
(2, 0, 13, 'fgddfgh', '2011-Oct/20111027031002_ActadeFiniquito.pdf', '200', 2, '1969-12-31', '0000-00-00'),
(4, 2, 1, 'gsd', '2011-Oct/20111027031028_07042011180222_manualdejqueryenpdfdesarrollowebcom.pdf', '234', 2, '2011-10-24', '2011-10-27'),
(5, 3, 14, 'OBSERVACION CUARTA OK', '2011-Oct/20111028041000_doc20110826232046.pdf', '123', 2, '2011-10-31', '2011-10-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_mensajeria_ant`
--

CREATE TABLE IF NOT EXISTS `dnk_mensajeria_ant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `columna` int(11) DEFAULT NULL,
  `fila` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fecha_crea` date NOT NULL,
  `hora` time NOT NULL,
  `hora_fin` time NOT NULL,
  `cliente` varchar(200) NOT NULL,
  `actividad` varchar(200) NOT NULL,
  `observacion` varchar(500) NOT NULL,
  `programada` date NOT NULL,
  `turno` varchar(1) NOT NULL,
  `obser_cancel` varchar(500) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(400) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=979 ;

--
-- Volcar la base de datos para la tabla `dnk_mensajeria_ant`
--

INSERT INTO `dnk_mensajeria_ant` (`id`, `columna`, `fila`, `fecha`, `fecha_crea`, `hora`, `hora_fin`, `cliente`, `actividad`, `observacion`, `programada`, `turno`, `obser_cancel`, `user_id`, `user_name`, `estado`) VALUES
(72, 1, 1, '2012-03-26', '0000-00-00', '12:34:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE FACTURAS CONTECON', 'FAVOR ENTREGAR EN GERENCIA DE REFINACION A MARISOL ANDRADE FACTURAS ORIGINALES CON CARTA DE CONTECON', '2012-03-26', 'T', '', 53, 'Lorena Morales', 'T'),
(70, 0, 4, '2012-03-26', '0000-00-00', '09:09:00', '00:00:00', 'PRODUBANCO', 'CERTIFICAR CHEQUES', 'PARA HAMBURG SUD Y ECONOTRANS', '2012-03-26', 'M', '', 51, 'Anita Paucar', 'T'),
(71, 1, 2, '2012-03-26', '0000-00-00', '09:28:00', '00:00:00', 'PRODUBANCO', 'RETIRAR LIBRETA DE AHORROS Y TARJETA DE DEBITO', 'FAVOR RETIRAR LOS DOCUMENTOS EN MENSION EN LA AGENCIA DE PRODUBANCO DE LORENA VIVAR EN SERVICIO AL CLIENTE, ADJUNTO AUTORIZACION Y COPIA DE MI CEDULA', '2012-03-26', 'T', '', 53, 'Lorena Morales', 'T'),
(66, 1, 3, '2012-03-26', '0000-00-00', '09:05:00', '00:00:00', 'PRODUBANCO', 'DEPOSITAR CHEQUE', 'HACER DEPOSITO EN LA CUENTA DE L.F.', '2012-03-26', 'T', '', 44, 'Paola Paredes', 'T'),
(67, 0, 3, '2012-03-26', '0000-00-00', '09:05:00', '00:00:00', 'TAME', 'VALIJA AEREA', 'ENVIAR VALIJA AREREA CON DOCUMENTOS DE DON EDWIN A GYE ', '2012-03-26', 'M', '', 44, 'Paola Paredes', 'T'),
(68, 1, 5, '2012-03-26', '0000-00-00', '09:07:00', '00:00:00', 'SERIMPE', 'DEPOSITAR CHEQUE', 'DEPOSITAR CHEQUE EN PRODUBANCO EN CUENTA DE DENKEL', '2012-03-26', 'T', '', 51, 'Anita Paucar', 'T'),
(69, 0, 7, '2012-03-26', '0000-00-00', '09:08:00', '00:00:00', 'PRODUBANCO/PICHINCHA', 'RETIRAR FACTURAS', 'DE LEASING. DEPARTAMENTO LEASING<br />\nEN PRODUBANCO Y PICHINCHA CON MARCELA URREA', '2012-03-26', 'M', '', 51, 'Anita Paucar', 'T'),
(63, 1, 3, '2012-03-23', '0000-00-00', '13:03:00', '00:00:00', 'TRUAMA ORTOPEDICS', 'RETIRAR GUIA', 'LLAMADA RECIBIDA A LAS 13:00 PIA EN EL ALMUERZO', '2012-03-23', 'T', '', 44, 'Paola Paredes', 'T'),
(64, 1, 5, '2012-03-23', '0000-00-00', '13:40:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'DEJAR FACTURAS', 'DEJAR FACTURAS 1277 11114', '2012-03-23', 'T', '', 44, 'Paola Paredes', 'T'),
(65, 0, 0, '2012-03-23', '0000-00-00', '17:52:00', '00:00:00', 'PRODUBANCO', 'RETIRAR LIBRETA DE AHORROS Y TARJETA DE DEBITO', 'ADJUNTO CARTA DE AUTORIZACION Y COPIA DE CEDULA, FAVOR RETIRAR EN AGENCIA MATRIZ DE PRODUBANCO', '2012-03-23', 'M', '', 53, 'Lorena Morales', 'P'),
(62, 1, 1, '2012-03-23', '0000-00-00', '13:01:00', '00:00:00', 'REYBEC', 'RETIRAR CHEQUES', '2 CHEQUES A LA 3PM', '2012-03-23', 'T', '', 51, 'Anita Paucar', 'T'),
(61, 1, 4, '2012-03-23', '0000-00-00', '12:22:00', '00:00:00', 'ep petroecuador Diego Salas', 'entregar trámite', 'devuelvo trámite de exportacion temporal ', '2012-03-23', 'T', '', 43, 'Karla Jacome', 'T'),
(60, 1, 2, '2012-03-23', '0000-00-00', '10:35:00', '00:00:00', 'TRANSPORTES OXIDENTAL', 'VALIJA ESMERALDAS', 'UNIFORME PIEDAD Y ROL DE PAGOS', '2012-03-23', 'T', '', 44, 'Paola Paredes', 'T'),
(37, 0, 2, '2012-03-22', '0000-00-00', '14:30:00', '00:00:00', 'UPS CARGO ', 'RETIRAR GUIA Nº 81077318592', 'CAMBIAR CHEQUE CON MARTITA Y RETIRAR LA GUIA CON EL EFECTIVO', '2012-03-22', 'M', '', 44, 'Paola Paredes', 'T'),
(38, 0, 3, '2012-03-22', '0000-00-00', '14:32:00', '00:00:00', 'IBERIA CARGO', 'RETIRAR GUIA', 'RETIRAR GUIA', '2012-03-22', 'M', '', 44, 'Paola Paredes', 'T'),
(39, 0, 4, '2012-03-22', '0000-00-00', '14:32:00', '00:00:00', 'DOLAMR', 'RETIRAR GUIA', 'RETIRAR GUIA', '2012-03-22', 'M', '', 44, 'Paola Paredes', 'T'),
(40, 1, 3, '2012-03-22', '0000-00-00', '14:33:00', '00:00:00', 'BANCO DEL PACIFICO', 'DEPOSITO CHEQUE', 'OLGA BUSTILLOS', '2012-03-22', 'T', '', 44, 'Paola Paredes', 'T'),
(41, 1, 1, '2012-03-22', '0000-00-00', '14:35:00', '00:00:00', 'SERIMPE ', 'DEJAR CERTIFICADO', 'DEJAR CERTIFICADO', '2012-03-22', 'T', '', 44, 'Paola Paredes', 'T'),
(42, 1, 6, '2012-03-22', '0000-00-00', '14:37:00', '00:00:00', 'ROS ROCA', 'DEJAR FACTURAS', '1251 10854 10855 10856', '2012-03-22', 'T', '', 44, 'Paola Paredes', 'T'),
(43, 1, 5, '2012-03-22', '0000-00-00', '14:37:00', '00:00:00', 'INEN', 'RETIRAR CERTIFICADO', 'ASH', '2012-03-22', 'T', '', 44, 'Paola Paredes', 'T'),
(44, 1, 7, '2012-03-22', '0000-00-00', '14:40:00', '00:00:00', 'AZUL', 'RETIRO DE DOCUMENTOS', 'RETIRAR DAV', '2012-03-22', 'T', '', 44, 'Paola Paredes', 'T'),
(45, 1, 2, '2012-03-22', '0000-00-00', '14:40:00', '00:00:00', 'BANCO INTERNACIONAL', 'RETIRAR FORMULARIOS DE TRASNFERENCIALAL EXTERIOR', 'TRASNFERENCIALAL EXTERIOR', '2012-03-22', 'T', '', 44, 'Paola Paredes', 'T'),
(46, 1, 8, '2012-03-22', '0000-00-00', '14:42:00', '00:00:00', 'IMPROLAB', 'ENTREGAR FACTURAS', '1250 10852', '2012-03-22', 'T', '', 44, 'Paola Paredes', 'T'),
(47, 0, 5, '2012-03-22', '0000-00-00', '14:44:00', '00:00:00', 'ADUANA ', 'ENTREGAR TRAMITE AZUL', 'ENTREGAR A JUANLUIS', '2012-03-22', 'M', '', 44, 'Paola Paredes', 'T'),
(48, 0, 1, '2012-03-22', '0000-00-00', '14:44:00', '00:00:00', 'TRASNPORTES ECUADOR', 'RETIRAR VALIJA', 'TRAER ANTES DE LAS 9 AM', '2012-03-22', 'M', '', 44, 'Paola Paredes', 'T'),
(49, 1, 4, '2012-03-22', '0000-00-00', '14:45:00', '00:00:00', 'PRODUCCION', 'DEJAR DOCUMENTOS', 'FIRMAR TODAS LAS HOJAS', '2012-03-22', 'T', '', 44, 'Paola Paredes', 'T'),
(50, 0, 2, '2012-03-29', '0000-00-00', '17:25:00', '00:00:00', 'SRI', 'SOLICITUD CERTIFICADO', 'FAVOR REALIZAR EL TRAMITE EN LA MAÑANA', '2012-03-22', 'M', '', 44, 'Paola Paredes', 'T'),
(59, 1, 2, '2012-03-23', '0000-00-00', '10:12:00', '00:00:00', 'serimpe', 'retirar cheque para denkel', 'retiran a las 4pm en punto', '2012-03-23', 'T', '', 44, 'Paola Paredes', 'T'),
(52, 0, 3, '2012-03-23', '0000-00-00', '09:01:00', '00:00:00', 'aduana', 'entregar sobre', 'entregar soble de fabara a juan luis', '2012-03-23', 'M', '', 44, 'Paola Paredes', 'T'),
(53, 0, 5, '2012-03-23', '0000-00-00', '09:02:00', '00:00:00', 'produbanco', 'hacer pago sri', 'solicitar $1.20 para pago de formulario', '2012-03-23', 'M', '', 44, 'Paola Paredes', 'T'),
(54, 0, 6, '2012-03-23', '0000-00-00', '09:16:00', '00:00:00', 'REFINACION ', 'ENTREGAR RETENCIONES  Y COMPROBANTES DE TRANSFERENCIAS ', 'ENTREGAR A MARISOL ANDRADE ', '2012-03-23', 'M', '', 43, 'Karla Jacome', 'T'),
(55, 0, 0, '2012-03-23', '0000-00-00', '09:17:00', '00:00:00', 'sj jersey ', 'dejar facturas', 'dejar facturas 1275 11113', '2012-03-23', 'M', '', 44, 'Paola Paredes', 'T'),
(56, 0, 4, '2012-03-23', '0000-00-00', '09:20:00', '00:00:00', 'S.J. JERSEY', 'ENTREGAR FACTURAS', 'ENTREGAR A ANDREA MOLINA', '2012-03-23', 'M', '', 51, 'Anita Paucar', 'T'),
(57, 0, 6, '2012-03-23', '0000-00-00', '09:22:00', '00:00:00', 'PRODUCCION', 'ENTREGAR DOCUMENTOS ', 'SR. LEMA O JUAN DIEGO BRITO ', '2012-03-23', 'M', '', 43, 'Karla Jacome', 'T'),
(58, 0, 7, '2012-03-23', '0000-00-00', '09:36:00', '00:00:00', 'transportes Ecuador', 'retirar valija', 'entregar a la llegada a las oficinas', '2012-03-23', 'M', '', 44, 'Paola Paredes', 'T'),
(73, 1, 6, '2012-03-27', '0000-00-00', '13:28:00', '00:00:00', 'BANCO PICHINCHA', 'RETIRAR FACTURAS DE LISSING', 'SOLO SE HAN RETIRADO LAS FACTURAS DE PRODUBANCO<br />\nFALTAN LAS DEL BANCO DEL PICHINCHA SOLICITADAS EN LA MAÑANA', '2012-03-26', 'T', '', 44, 'Paola Paredes', 'T'),
(74, 0, 6, '2012-03-27', '0000-00-00', '14:42:00', '00:00:00', 'SILVANA PEREZ/VASCO CRISTIAN', 'INEN ', 'INGRESAR INEN ELECTRONICO EN VENTANILLAS ANTES DE LAS 12:00 27/03/2012 LLEVAR LOS 3 DOLARES EN EFECTIVO SOLICITADO A FINANCIERO', '2012-03-26', 'M', '', 5, 'Maria Piedad', 'T'),
(75, 0, 1, '2012-03-27', '0000-00-00', '14:45:00', '00:00:00', 'Refinación', 'Entregar documentos ', 'entregar a Marisol ANdrade ', '2012-03-26', 'M', '', 43, 'Karla Jacome', 'T'),
(76, 0, 3, '2012-03-27', '0000-00-00', '17:20:00', '00:00:00', 'SJ JERSEY', 'ENTREGA DE CHEQUE POR GARANTIA DE CONTENEDOR', 'FAVOR ENTREGAR CHEQUE E INTERCHANGE', '2012-03-26', 'M', '', 53, 'Lorena Morales', 'T'),
(77, 0, 1, '2012-03-27', '0000-00-00', '08:52:00', '00:00:00', 'ADUANA', 'RETIRO DE VALIJA', 'RETIRO DE DOCUMENTOS PARA LA OFICINA', '2012-03-27', 'M', '', 56, 'Diana Gonza', 'T'),
(78, 0, 3, '2012-03-27', '0000-00-00', '09:09:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'ENTREGA FACTURA', 'Y RETENCION CON CARTA', '2012-03-27', 'M', '', 51, 'Anita Paucar', 'T'),
(79, 0, 4, '2012-03-28', '0000-00-00', '09:14:00', '00:00:00', 'ARISBERG ECUADOR', 'ENTREGA FACTURAS', 'CLIENTE NUEVO JOSE LUIS TAMAYO N24-32 Y WILSON', '2012-03-27', 'M', '', 51, 'Anita Paucar', 'T'),
(80, 0, 4, '2012-03-27', '0000-00-00', '09:28:00', '00:00:00', 'SJ JERSEY', 'ENTREGA DE CHEQUE POR GARANTIA DE CONTENEDOR', 'FAVOR ENTREGAR CHEQUE E INTERCHANGE Y HACER FIRMAR EL RECIBIDO', '2012-03-27', 'M', '', 53, 'Lorena Morales', 'T'),
(81, 0, 2, '2012-03-27', '0000-00-00', '09:28:00', '00:00:00', 'ADUANA', 'ENTREGAR PANTALON', 'A JUAN LUIS', '2012-03-27', 'M', '', 51, 'Anita Paucar', 'T'),
(82, 0, 5, '2012-03-27', '0000-00-00', '09:31:00', '00:00:00', 'SILVANA PEREZ/CRISTIAN VASCO', 'INEN', 'INGRESAR INEN ELECTRONICO CONFORME DOCUMENTOS EN BANDEJA LLEVAR USD 3 ', '2012-03-27', 'M', '', 5, 'Maria Piedad', 'T'),
(83, 1, 6, '2012-03-27', '0000-00-00', '10:18:00', '00:00:00', 'ROSARIO VILLEGAS//DESARROLLO ORGANIZACIONAL ', 'Retirar un oficio y pago para retirar guia ', 'la Sra Charito debe entregarle un pago y oficio anombre de Eduardo para retiro de guia ', '2012-03-27', 'T', '', 43, 'Karla Jacome', 'T'),
(84, 1, 11, '2012-03-27', '0000-00-00', '11:08:00', '00:00:00', 'BANCO DE GUAYAQUIL', 'HACER DEPOSITO', 'DEPOSITAR EN LA CUENTA DE BELEN', '2012-03-27', 'T', '', 44, 'Paola Paredes', 'T'),
(85, 1, 8, '2012-03-27', '0000-00-00', '11:28:00', '00:00:00', 'GRAPHIC SOURCE', 'RETIRO DE CERTIFICADO CONSEP', 'RETIRAR DOCUMENTO CON NATALIA LOPEZ, PARA ENVIAR EN VALIJA GYE ', '2012-03-27', 'T', '', 5, 'Maria Piedad', 'T'),
(86, 0, 3, '2012-03-28', '0000-00-00', '11:56:00', '00:00:00', 'CENTURION ', 'RETIRAR GUIA/DOCUMENTOS ', 'LLEVAR TRANSFERENCIA POR $25, LLEVAR COPIA DE CEDULA  DE EDUARDO JUNTO CON CARTA Y  COPIA DE RUC DE AOC  RETIRAR GUIA CENTURION ', '2012-03-27', 'M', '', 43, 'Karla Jacome', 'T'),
(87, 1, 10, '2012-03-27', '0000-00-00', '12:31:00', '00:00:00', 'DENKEL', 'SACAR COPIAS ', 'SACAR 1 JUEGO COMPLETO DE LAS 4 LLAVES NUMERADAS Y SEÑALADAS CON CINTA ADHESIVA', '2012-03-27', 'T', '', 51, 'Anita Paucar', 'T'),
(88, 1, 5, '2012-03-27', '0000-00-00', '12:38:00', '00:00:00', 'DISETEC', 'ENTREGAR FACTURAS', 'ENG TRADING. DEPARTAMENTO DE CONTABILIDADA GABRIELA GAVILANEZ', '2012-03-27', 'T', '', 51, 'Anita Paucar', 'T'),
(89, 1, 7, '2012-03-27', '0000-00-00', '13:01:00', '00:00:00', 'FRANCISCO ALARCON ', 'REITRAR CHEQUE ', 'CHEQUE DE TRIBUTOS ', '2012-03-27', 'T', '', 43, 'Karla Jacome', 'T'),
(94, 1, 3, '2012-03-14', '0000-00-00', '12:00:00', '00:00:00', 'asas', 'asas', 'asasas', '2012-03-13', 'T', '', 4, 'ASDSD', 'P'),
(90, 1, 12, '2012-03-27', '0000-00-00', '13:39:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO CHEQUES', 'EN CTA CTE PRODUBANCO DENKEL 2 CHEQUES DE PROAÑO Y PREMIUMCORP', '2012-03-27', 'T', '', 51, 'Anita Paucar', 'T'),
(91, 0, 4, '2012-03-27', '0000-00-00', '14:35:00', '00:00:00', 'PRODUCCION', 'RETIRAR OFICIO Y TRAMITE ', 'JUAN DIEGO BRITO ', '2012-03-27', 'M', '', 43, 'Karla Jacome', 'T'),
(92, 0, 1, '2012-03-28', '0000-00-00', '14:42:00', '00:00:00', 'AZULEC ', 'RETIRAR DOCUMENTOS ', 'SRA. MORAYMA ARIAS RETIRAR CARTA DE AUTORIZACION PARA RETIRAR GUIA Y DAV ', '2012-03-27', 'M', '', 43, 'Karla Jacome', 'T'),
(93, 0, 2, '2012-03-28', '0000-00-00', '14:46:00', '00:00:00', 'REFINACION', 'RETIRO PAPELES', 'TRAMITES NUEVOS Y RETENCIONES CON MARISOL ANDRADE', '2012-03-27', 'M', '', 5, 'Maria Piedad', 'T'),
(95, 1, 4, '2012-03-28', '0000-00-00', '14:55:00', '00:00:00', 'qwe', 'qweqwwe', 'qweqwe', '2012-03-28', 'T', '', 3, 'Willian Espinosa', 'T'),
(96, 1, 5, '2012-03-28', '0000-00-00', '14:58:00', '00:00:00', 'Prueba', 'Prueba', 'prueba', '2012-03-28', 'T', '', 3, 'Willian Espinosa', 'T'),
(97, 1, 6, '2012-03-28', '0000-00-00', '15:06:00', '00:00:00', 'Prueba', 'Prueba', 'qwedqwedqwedqwedqwed', '2012-03-28', 'T', '', 3, 'Willian Espinosa', 'T'),
(98, 1, 7, '2012-03-28', '0000-00-00', '15:25:00', '00:00:00', 'SK ', 'DEJAR FACTURAS', 'ES UNA PRUEVA PAR QUE EL WILY VEA LO DE SISTEMA PERO IGUAL EDUARDO TIENE QUE IR', '2012-03-28', 'T', '', 44, 'Paola Paredes', 'T'),
(99, 0, 1, '2012-03-29', '0000-00-00', '17:06:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGAR TRAMITE  ', 'FAVOR ENREGAR TRAMITE A JUAN LUIS PARA QUE SEA INGRESADO', '2012-03-28', 'M', '', 53, 'Lorena Morales', 'T'),
(100, 0, 3, '2012-03-29', '0000-00-00', '17:18:00', '00:00:00', 'disetec ', 'retirar facturas', 'retirar facturas en disetec llamada recibida a las 17:18', '2012-03-28', 'M', '', 44, 'Paola Paredes', 'T'),
(101, 0, 10, '2012-03-29', '0000-00-00', '08:03:00', '00:00:00', 'Prueba', 'Prueba', 'pp', '2012-03-29', 'M', '', 3, 'Willian Espinosa', 'T'),
(102, 1, 1, '2012-03-29', '0000-00-00', '08:57:00', '00:00:00', 'S.J. JERSEY ECUATORIANO', 'ENTREGAR FACTURAS', 'ANDREA MOLINA/MA. FERNANDA GOMEZ', '2012-03-29', 'T', '', 51, 'Anita Paucar', 'T'),
(103, 0, 5, '2012-03-29', '0000-00-00', '08:58:00', '00:00:00', 'PICHINCHA', 'DEPOSITO', 'CHEQUE NO.5792 Y NO.4294', '2012-03-29', 'M', '', 51, 'Anita Paucar', 'T'),
(104, 0, 6, '2012-03-29', '0000-00-00', '08:59:00', '00:00:00', 'DENKEL GYE', 'ENVIAR VALIJA', 'AEREA CON UNIFORMES. ENTREGO $2', '2012-03-29', 'M', '', 51, 'Anita Paucar', 'T'),
(105, 0, 9, '2012-03-30', '0000-00-00', '09:37:00', '00:00:00', 'personal', 'depositar cheque en produbanco', 'depositar cheque en cuenta de lfg ', '2012-03-29', 'M', '', 50, 'Luis Felipe', 'T'),
(106, 0, 7, '2012-03-29', '0000-00-00', '09:44:00', '00:00:00', 'produbanco', 'depositara cheque', 'depositar cheque de l.f.', '2012-03-29', 'M', '', 44, 'Paola Paredes', 'T'),
(107, 0, 4, '2012-03-29', '0000-00-00', '09:46:00', '00:00:00', 'PERSONAL', 'PAGO PLANILLA', 'IESS 36.40Y 36.77', '2012-03-29', 'M', '', 51, 'Anita Paucar', 'T'),
(108, 1, 3, '2012-03-29', '0000-00-00', '10:03:00', '00:00:00', 'AZULEC', 'ENTREGAR INFORME', 'ENTREGAR  INFROME AL SEÑOR IVAN VALDIVIEZO<br />\n', '2012-03-29', 'T', '', 53, 'Lorena Morales', 'T'),
(119, 1, 9, '2012-03-30', '0000-00-00', '08:48:00', '00:00:00', 'REFINACION', 'RETIRO DAVS', 'POR FAVOR CON MARISOL ANDRADE RETIRO DOCUMENTOS Y DAV', '2012-03-30', 'T', '', 5, 'Maria Piedad', 'T'),
(109, 1, 1, '2012-03-29', '0000-00-00', '13:07:00', '00:00:00', 'ALARCON FRANCISCO', 'SENAE', 'ENTREGA DE DOCUMENTOS PARA REEXPORTACION', '2012-03-29', 'T', '', 5, 'Maria Piedad', 'T'),
(110, 1, 4, '2012-03-29', '0000-00-00', '13:49:00', '00:00:00', 'darwin cardenas', 'seguro de don edwin', 'checoslovaquia y moscu', '2012-03-29', 'T', '', 44, 'Paola Paredes', 'T'),
(111, 0, 1, '2012-03-30', '0000-00-00', '14:21:00', '00:00:00', 'S.J. JERSEY ECUATORIANO', 'RETIRAR DCTOS', 'CARTAS DE AUTORIZACION PARA ALMACENERAS Y RUC', '2012-03-29', 'M', '', 51, 'Anita Paucar', 'T'),
(112, 1, 5, '2012-03-29', '0000-00-00', '14:22:00', '00:00:00', 'IMPEXAZUL', 'BANCO BOLIVARIANO', 'A RETIRAR CHEQUES', '2012-03-29', 'T', '', 51, 'Anita Paucar', 'T'),
(113, 0, 2, '2012-03-30', '0000-00-00', '15:29:00', '00:00:00', 'DIEGO MERINO', 'DEJAR INVITACION', 'DEJAR INVITACION DE LFG', '2012-03-29', 'M', '', 44, 'Paola Paredes', 'T'),
(114, 0, 8, '2012-03-30', '0000-00-00', '16:55:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'CHEQUE AZUL #1105 POR $5711.88 CTA CTE DENKEL', '2012-03-29', 'M', '', 51, 'Anita Paucar', 'T'),
(115, 0, 6, '2012-03-30', '0000-00-00', '17:07:00', '00:00:00', 'PRODUCCION ', 'RETIRAR DAV ', 'RETIRAR DAV JUAN DIEGO BRITO ', '2012-03-29', 'M', '', 43, 'Karla Jacome', 'T'),
(116, 0, 2, '2012-03-30', '0000-00-00', '17:08:00', '00:00:00', 'ADUANA QUITO ', 'DEJAR TRAMITE ', 'JUAN LUIS MIÑO ', '2012-03-29', 'M', '', 43, 'Karla Jacome', 'T'),
(117, 1, 2, '2012-03-30', '0000-00-00', '17:22:00', '00:00:00', 'CELEC', 'ENTREGAR FACTURA', '6 DE DICIEMBRE Y ORELLANA.', '2012-03-29', 'T', '', 51, 'Anita Paucar', 'T'),
(118, 0, 1, '2012-03-30', '0000-00-00', '17:41:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGAR TRAMITE.', 'FAVOR ENTREGAR A JUAN LUIS', '2012-03-29', 'M', '', 53, 'Lorena Morales', 'T'),
(120, 0, 7, '2012-03-30', '0000-00-00', '09:30:00', '00:00:00', 'DENKEL', 'COPIA LLAVE', 'LLAVE DE SERVIDOR, ENTREGO $1', '2012-03-30', 'M', '', 51, 'Anita Paucar', 'T'),
(121, 0, 1, '2012-03-30', '0000-00-00', '09:33:00', '00:00:00', 'dolmar ', 'retiro de guia', 'retirar guia pendiente', '2012-03-30', 'M', '', 44, 'Paola Paredes', 'T'),
(122, 0, 3, '2012-03-30', '0000-00-00', '09:33:00', '00:00:00', 'SK', 'RETIRO DE GUIA IMPEXNET', 'REETIRAR GUIA PENDIENTE DEL 28/03/2012', '2012-03-30', 'M', '', 5, 'Maria Piedad', 'T'),
(123, 0, 2, '2012-03-30', '0000-00-00', '09:36:00', '00:00:00', 'diego merino', 'dejar invitacion', 'dejar invitacion de lfg', '2012-03-30', 'M', '', 44, 'Paola Paredes', 'T'),
(124, 1, 1, '2012-03-30', '0000-00-00', '10:15:00', '00:00:00', 'SK', 'RETIRO CHEQUE', 'A PARTIR DE LAS 3PM', '2012-03-30', 'T', '', 51, 'Anita Paucar', 'T'),
(125, 0, 2, '2012-03-30', '0000-00-00', '10:24:00', '00:00:00', 'denkel', 'retiro de cheques certificados', 'retirar donde rocio tabandgo en sweaden urgentísimo dos cheques', '2012-03-30', 'M', '', 50, 'Luis Felipe', 'T'),
(126, 0, 3, '2012-03-30', '0000-00-00', '10:25:00', '00:00:00', 'GRAPHIC SOURCE', 'RETIRO DOCUMENTOS', 'DAVS FIRMADAS A PARTIR DE LAS 15:00', '2012-03-30', 'M', '', 5, 'Maria Piedad', 'T'),
(127, 1, 8, '2012-03-30', '0000-00-00', '12:40:00', '00:00:00', 'REFINACION', 'SENAE', 'ENTREGAR DOCUMENTOS A JUAN LUIS REGIMENES 51', '2012-03-30', 'T', '', 5, 'Maria Piedad', 'T'),
(128, 1, 2, '2012-03-30', '0000-00-00', '13:03:00', '00:00:00', 'SJ JERSEY', 'RETIRO DOCUMENTOS', 'DK 279 DAVS Y ORIGINALES', '2012-03-30', 'T', '', 5, 'Maria Piedad', 'T'),
(129, 1, 1, '2012-03-30', '0000-00-00', '13:04:00', '00:00:00', 'PROAÑO REPRESENTACIONES ', 'RETIRO DOCUMENTOS', 'A PARTIR DE LAS 3:30 NO ANTES MARIA ALICIA ', '2012-03-30', 'T', '', 5, 'Maria Piedad', 'T'),
(130, 1, 3, '2012-03-30', '0000-00-00', '13:08:00', '00:00:00', 'BANCO INTERNACIONAL', 'DEPOSITO CHEQUE', 'CERTIFICADO NO UTILIZADO DE DENKEL', '2012-03-30', 'T', '', 51, 'Anita Paucar', 'T'),
(131, 1, 4, '2012-03-30', '0000-00-00', '13:08:00', '00:00:00', 'PRODUBANCO', 'DEPOSITAR CHEQUE', 'CERTIFICADO NO UTILIZADO', '2012-03-30', 'T', '', 51, 'Anita Paucar', 'T'),
(132, 1, 5, '2012-03-30', '0000-00-00', '13:18:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'CHEQUES DE S.J. JERSEY', '2012-03-30', 'T', '', 51, 'Anita Paucar', 'T'),
(133, 1, 6, '2012-03-30', '0000-00-00', '13:28:00', '00:00:00', 'GRAFIC SOURCE', 'RETIRAR DAV', 'RETIRAR DAVS A PARTIR DE LAS 15:00', '2012-03-30', 'T', '', 44, 'Paola Paredes', 'T'),
(134, 1, 7, '2012-03-30', '0000-00-00', '13:33:00', '00:00:00', 'BANCO DE GUAYAQUIL', 'DEPOSITAR CTA BELEN', 'DEPOSITAR LAS MOEDAS EN AL CUENTA DE BELEN', '2012-03-30', 'T', '', 44, 'Paola Paredes', 'T'),
(135, 1, 10, '2012-03-30', '0000-00-00', '13:42:00', '00:00:00', 'SK ', 'RETIRAR CHEQUES', 'RETIRAR CHEQUES EN SK', '2012-03-30', 'T', '', 44, 'Paola Paredes', 'T'),
(136, 1, 11, '2012-03-30', '0000-00-00', '14:02:00', '00:00:00', 'Prueba', 'Prueba', 'sdsadfasf', '2012-03-30', 'T', '', 3, 'Willian Espinosa', 'T'),
(137, 1, 6, '2012-04-02', '0000-00-00', '15:11:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE FACTURA', 'FAVOR ENTREGAR FACTURA ', '2012-03-30', 'T', '', 53, 'Lorena Morales', 'T'),
(138, 0, 10, '2012-04-02', '0000-00-00', '16:15:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'CHEQUE DE CITY BANK MARGLOBAL', '2012-03-30', 'M', '', 51, 'Anita Paucar', 'T'),
(139, 0, 11, '2012-04-02', '0000-00-00', '16:27:00', '00:00:00', 'INTERNACIONAL', 'DEPOSITO', 'CHEQUE SK', '2012-03-30', 'M', '', 51, 'Anita Paucar', 'T'),
(140, 0, 9, '2012-04-02', '0000-00-00', '16:29:00', '00:00:00', 'PRODUBANCO', 'DESPOSITO', 'DEPOSITO CHEQUE MARGLOBAL DE CITIBANK', '2012-03-30', 'M', '', 51, 'Anita Paucar', 'T'),
(141, 0, 13, '2012-04-02', '0000-00-00', '17:14:00', '00:00:00', 'ROS ROCA', 'RETIRAR DOCUMENTOS PARA SENAE', 'LOS DOCUMENTOS DE ROS ROCA SON PARA JUAN LUIS ', '2012-03-30', 'M', '', 5, 'Maria Piedad', 'T'),
(142, 0, 9, '2012-04-02', '0000-00-00', '08:43:00', '00:00:00', 'SJ SERJEY', 'RETIRO DE DOCUMENTOS ', 'RETIRAR DOCUMENTOS ORIGINALES CON ANDREA MOLINA', '2012-04-02', 'M', '', 5, 'Maria Piedad', 'T'),
(143, 0, 7, '2012-04-02', '0000-00-00', '08:55:00', '00:00:00', 'TAME', 'RETIRAR VALIJA ESMERALDAS ', 'VALIJA ESMERALDAS ', '2012-04-02', 'M', '', 43, 'Karla Jacome', 'T'),
(144, 0, 3, '2012-04-02', '0000-00-00', '08:59:00', '00:00:00', 'KLM ', 'RETIRAR GUIA IMPEXAZUL ', 'ADJUNTO CARTA DE AUTORIZACION Y TRANSFERENCIA', '2012-04-02', 'M', '', 43, 'Karla Jacome', 'T'),
(145, 1, 3, '2012-04-02', '0000-00-00', '09:22:00', '00:00:00', 'COPA AIRLINES', 'RETIRO DE GUIA', 'FAVOR RETIRAR GUIA AREA 2309313-1592, LLEVAR CARTA DE AUTORIZACION DE MSP, DIRECCION: PSJE <br />\nGONZALOO GALLO AL NORTE DEL COLEGIO LA FAE EDIFICIO BLANCO DE DOS PISO COPA CARGO', '2012-04-02', 'T', '', 53, 'Lorena Morales', 'T'),
(146, 0, 5, '2012-04-02', '0000-00-00', '09:28:00', '00:00:00', 'DOLMAR', 'CAMBIAR GUIA', 'CAMBIAR GUIA DE EP PETRO TRAIDA POR ERROR POR GUIA DE SK.', '2012-04-02', 'M', '', 44, 'Paola Paredes', 'T'),
(147, 0, 1, '2012-04-02', '0000-00-00', '09:37:00', '00:00:00', 'ADUANA', 'ENTREGA CHEQUES', 'A JUAN LUIS Y TRAER RECIBIDO', '2012-04-02', 'M', '', 51, 'Anita Paucar', 'T'),
(148, 1, 1, '2012-04-02', '0000-00-00', '11:13:00', '00:00:00', 'ADUANA', 'ENTREGA', 'CHEQUES, UNIFORMES Y ACTA DE ENTREGA PARA DIANA Y JUAN LUIS', '2012-04-02', 'T', '', 51, 'Anita Paucar', 'T'),
(149, 1, 8, '2012-04-02', '0000-00-00', '11:44:00', '00:00:00', 'PIEDAD CABEZAS', 'ENVIO VALIJA', 'CON CHEQUE Y ROL DE PAGOS MARZO', '2012-04-02', 'T', '', 51, 'Anita Paucar', 'T'),
(150, 1, 3, '2012-04-02', '0000-00-00', '11:45:00', '00:00:00', 'GERENCIA DE DESARROLLO ORGANIZACIONAL ', 'RETIRAR DAV ', 'RETIRARLO DONDE LA SRA. ROSARIO VILLEGAS ', '2012-04-02', 'T', '', 43, 'Karla Jacome', 'T'),
(151, 1, 8, '2012-04-02', '0000-00-00', '12:23:00', '00:00:00', 'BANCO DE GYE', 'DESPOSITO', 'HACER DEPOSITO EN LA CUENTA DE BELEN', '2012-04-02', 'T', '', 44, 'Paola Paredes', 'T'),
(152, 1, 2, '2012-04-02', '0000-00-00', '12:48:00', '00:00:00', 'ADUANA QUITO ', 'ENTREAR TRAMITE ', 'TRAMITE PARA JUAN LUIS MIÑO DK 259 AZULEC ', '2012-04-02', 'T', '', 43, 'Karla Jacome', 'T'),
(153, 1, 8, '2012-04-02', '0000-00-00', '13:26:00', '00:00:00', 'PERSONAL', 'DEPOSITO', 'UNIBANCO- TARJETA VISA PERFECTA   $24', '2012-04-02', 'T', '', 51, 'Anita Paucar', 'T'),
(154, 1, 1, '2012-04-02', '0000-00-00', '13:27:00', '00:00:00', 'COPA AIRLINES', 'RETIRO DE GUIA', 'FAVOR RETIRAR GUIA CON CHEQUE CERTIFICADO Y CARTA DE AUTORIZACION EN COPA AIRLINES CARGO, LUEGO LLEVARLA A ADUANA ', '2012-04-02', 'T', '', 53, 'Lorena Morales', 'T'),
(155, 0, 5, '2012-04-03', '0000-00-00', '16:35:00', '00:00:00', 'GRAFIC SOURCE', 'RETIRAR DOCUMENTOS', 'RETIRAR DOCUMENTACION CON NATALIA', '2012-04-02', 'M', '', 44, 'Paola Paredes', 'T'),
(156, 0, 10, '2012-04-03', '0000-00-00', '17:12:00', '00:00:00', 'PRODUBANCO ', 'DEPOSITAR CHEQUES FELIPE Y BELEN', 'DEPOSITAR CHEQUES FELIPE Y BELEN', '2012-04-02', 'M', '', 44, 'Paola Paredes', 'T'),
(157, 0, 1, '2012-04-03', '0000-00-00', '17:52:00', '00:00:00', 'REFINACION', 'LLEVAR DOCUMENTOS A SENAE', 'DEJAR TRAMITE DK 269 SENAE ', '2012-04-02', 'M', '', 5, 'Maria Piedad', 'T'),
(158, 0, 7, '2012-04-03', '0000-00-00', '08:42:00', '00:00:00', 'banco de guayaquil', 'realizar deposito en la cuenta de belen', ' en la cuenta de belen', '2012-04-03', 'M', '', 44, 'Paola Paredes', 'T'),
(159, 0, 1, '2012-04-03', '0000-00-00', '09:03:00', '00:00:00', 'OFICINA ADUANA', 'FAVRO LLEVAR TRAMITES PARA SER INGRESADOS', 'LOS TRAMITES SON DEL MSP Y DEL DK 269', '2012-04-03', 'M', '', 53, 'Lorena Morales', 'T'),
(160, 0, 1, '2012-04-03', '0000-00-00', '09:04:00', '00:00:00', 'ADUANA QUITO ', 'DEJAR TRAMITE ', 'DK 239 EP PETROECUADOR ', '2012-04-03', 'M', '', 43, 'Karla Jacome', 'T'),
(161, 0, 2, '2012-04-03', '0000-00-00', '09:05:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'RETIRO DE DAV PARA SER LLEVADAS A ADUANA', 'FAVOPR RETIRARA DAVS Y LLEVARLAS A ADUANA CONJUNTAMENTE CON  DAUS ADJUNTAS PARA SU INGRESO EN ADUANA', '2012-04-03', 'M', '', 53, 'Lorena Morales', 'T'),
(162, 0, 5, '2012-04-03', '0000-00-00', '09:20:00', '00:00:00', 'GRAPHICSOURCE', 'ENTREGA FACTURAS', 'ATENCION MARGARITA ORTIZ', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(163, 0, 4, '2012-04-03', '0000-00-00', '09:22:00', '00:00:00', 'FRANCISCO ALARCON', 'ENTREGA FACTURAS', 'LAS VIOLETAS 4-A A DOS CUADRAS DEL COLEGIO ALEMAN', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(164, 0, 3, '2012-04-03', '0000-00-00', '09:24:00', '00:00:00', 'CARGONET', 'ENTREGA', 'FACTURA', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(165, 0, 6, '2012-04-03', '0000-00-00', '09:26:00', '00:00:00', 'IMPROLAB', 'ENTREGAR FACTURAS', 'DK-228', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(166, 0, 5, '2012-04-03', '0000-00-00', '09:27:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'ENTREGAR FACTURAS', 'DK-252', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(167, 0, 4, '2012-04-03', '0000-00-00', '09:28:00', '00:00:00', 'NEURALOG, INC', 'ENTREGA', 'DK-240', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(168, 0, 6, '2012-04-03', '0000-00-00', '09:29:00', '00:00:00', 'REFINACION', 'ENTREGA FACTURAS', 'VARIAS', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(169, 0, 8, '2012-04-03', '0000-00-00', '09:34:00', '00:00:00', 'PRODUCCION', 'ENTREGA FACTURAS', 'VARIAS', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(171, 0, 4, '2012-04-09', '0000-00-00', '13:13:00', '00:00:00', 'INEN', 'TRAMITAR INEN', 'PAGAR CON CAJA CHICA Y USAR RETNCIONES FACTURA A NOMBRE DE DENKEL', '2012-04-03', 'M', '', 53, 'Lorena Morales', 'T'),
(170, 0, 9, '2012-04-03', '0000-00-00', '09:48:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO CHEQUE', 'DEPOSITAR CHEQUE DEL BOLIVARIANO', '2012-04-03', 'M', '', 44, 'Paola Paredes', 'T'),
(172, 0, 7, '2012-04-03', '0000-00-00', '13:23:00', '00:00:00', 'GRAPHICSOURCE', 'ENTREGA FACTURAS', 'TRAER DEVUELTA PLANILLA DE GASTO', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(173, 0, 4, '2012-04-03', '0000-00-00', '13:25:00', '00:00:00', 'SK ENGINEERING', 'ENTREGA FACTURAS', 'VARIAS', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(174, 0, 5, '2012-04-03', '0000-00-00', '13:26:00', '00:00:00', 'MSP', 'RETIRAR RETENCIONES', 'ATT. LORENA CEVALLOS', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(175, 0, 8, '2012-04-03', '0000-00-00', '13:28:00', '00:00:00', 'PRODUBANCO', 'CAMBIAR CHEQUE', 'A NOMBRE DE EDUCARDO PARA CAJA CHICA', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(176, 0, 6, '2012-04-03', '0000-00-00', '13:28:00', '00:00:00', 'refinacion', 'retirar documetnos', 'retirar documentos', '2012-04-03', 'M', '', 44, 'Paola Paredes', 'T'),
(177, 0, 9, '2012-04-03', '0000-00-00', '13:29:00', '00:00:00', 'ESDINAMICO', 'ENVIO CHEQUE', 'REALIZAR PAGO Y ENTREGAR RETENCION', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(178, 0, 1, '2012-04-03', '0000-00-00', '13:34:00', '00:00:00', 'AZULEC', 'ENTREGA FACTURAS', 'ATT. MORAYMA ARIAS', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'T'),
(179, 0, 2, '2012-04-03', '0000-00-00', '13:34:00', '00:00:00', 'AZUL', 'ENTREGAR FACTURAS ', 'DK 241<br />\n<br />\nENTREGAR MORAYMA ARIAS', '2012-04-03', 'M', '', 43, 'Karla Jacome', 'T'),
(180, 2, 1, '2012-04-06', '0000-00-00', '15:22:00', '00:00:00', 'TV CABLE', 'ENTREGA CARTA', 'Y EQUIPOS.', '2012-04-03', 'M', '', 51, 'Anita Paucar', 'P'),
(181, 0, 7, '2012-04-04', '0000-00-00', '17:47:00', '00:00:00', 'DOLMAR', 'RETIRO DE GUIA', 'FAVOR RETIRA GUIA', '2012-04-03', 'M', '', 53, 'Lorena Morales', 'T'),
(182, 0, 6, '2012-04-04', '0000-00-00', '17:53:00', '00:00:00', 'DOLMAR', 'RETIRO DE GUIA', 'FAVOR RETIRAR GUIA DE DOLMAR CLIENTE GERENCIA DE REFINACCION', '2012-04-03', 'M', '', 53, 'Lorena Morales', 'T'),
(183, 0, 4, '2012-04-04', '0000-00-00', '18:12:00', '00:00:00', 'AZUL ', 'ENTREGAR FACTURAS ', 'ENTREGAR FACTURAS Y RECUPERAR FACTURA ANULADA ', '2012-04-03', 'M', '', 43, 'Karla Jacome', 'T'),
(184, 1, 1, '2012-04-04', '0000-00-00', '08:56:00', '00:00:00', 'TV CABLE', 'PAGO', 'CHEQUE A NOMBRE DE EDUASRDO, CAMBIAR Y CANCELAR EN EFECTIVO', '2012-04-04', 'T', '', 51, 'Anita Paucar', 'T'),
(185, 0, 9, '2012-04-04', '0000-00-00', '08:56:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'CHEQUE BANCO DE PICHINCHA DE IMPROLAB POR $273.07 ', '2012-04-04', 'M', '', 51, 'Anita Paucar', 'T'),
(186, 0, 2, '2012-04-04', '0000-00-00', '09:02:00', '00:00:00', 'wilson hidalgoq', 'entregar invitacion', 'entregar invitacion de lfg seguir el croquis', '2012-04-04', 'M', '', 44, 'Paola Paredes', 'T'),
(187, 0, 8, '2012-04-04', '0000-00-00', '10:00:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE FACTURA', 'favor entregar recibido Lorena<br />\n<br />\n', '2012-04-04', 'M', '', 53, 'Lorena Morales', 'T'),
(188, 1, 1, '2012-04-04', '0000-00-00', '11:33:00', '00:00:00', 'OLGA BUSTILLOS', 'ENTREGA CHEQUE', 'Y RETENCION A ALEXANDRA SALAZAR', '2012-04-04', 'T', '', 51, 'Anita Paucar', 'T'),
(189, 1, 1, '2012-04-04', '0000-00-00', '12:28:00', '00:00:00', 'UNIBANCO', 'ENTREGAR SOBRE', 'FAVOR TRAER RECIBIDO FIRMADO.', '2012-04-04', 'T', '', 45, 'Hernan Jouve', 'T'),
(190, 1, 1, '2012-04-04', '0000-00-00', '13:43:00', '00:00:00', 'REFINACION', 'RETIRAR DOCUMENTOS', 'RETIRAR DOCUMENTOS', '2012-04-04', 'T', '', 44, 'Paola Paredes', 'T'),
(191, 0, 1, '2012-04-05', '0000-00-00', '17:52:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGA DE TRAMITE', 'FAVOR ENTREGAR A JUAN LUIS', '2012-04-04', 'M', '', 53, 'Lorena Morales', 'T'),
(192, 0, 3, '2012-04-05', '0000-00-00', '09:22:00', '00:00:00', 'BOLIVARIANO', 'RETIRO', 'CHEQUE IMPEXAZUL', '2012-04-05', 'M', '', 51, 'Anita Paucar', 'T'),
(193, 0, 4, '2012-04-05', '0000-00-00', '09:23:00', '00:00:00', 'PRODUCCION', 'ENTREGA FACTURAS', 'JORGE VANROZELEN', '2012-04-05', 'M', '', 51, 'Anita Paucar', 'T'),
(194, 1, 3, '2012-04-05', '0000-00-00', '11:06:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRAR RETENCIONES', 'FAVOR RETIRAR  CON MARISOL ANDRADE', '2012-04-05', 'T', '', 53, 'Lorena Morales', 'T'),
(195, 1, 1, '2012-04-05', '0000-00-00', '12:12:00', '00:00:00', 'S.J. JERSEY ECUATORIANO', 'ENTREGAR', 'FACTURAS', '2012-04-05', 'T', '', 51, 'Anita Paucar', 'T'),
(196, 1, 2, '2012-04-05', '0000-00-00', '12:17:00', '00:00:00', 'ADUANA QUITO ', 'ENTREGAR TRÁMITE ', 'DK 297', '2012-04-05', 'T', '', 43, 'Karla Jacome', 'T'),
(197, 1, 4, '2012-04-05', '0000-00-00', '13:41:00', '00:00:00', 'produbanco', 'deposito', 'deposito cheque de impexazul', '2012-04-05', 'T', '', 52, 'Martha Marulanda', 'T'),
(198, 0, 1, '2012-04-09', '0000-00-00', '15:33:00', '00:00:00', 'ADUANA', 'ENTREGA CARPETA', 'DIANA GONZA', '2012-04-05', 'M', '', 51, 'Anita Paucar', 'T'),
(199, 0, 2, '2012-04-09', '0000-00-00', '15:35:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'CHEQUE REYBEC 2267', '2012-04-05', 'M', '', 51, 'Anita Paucar', 'T'),
(200, 0, 3, '2012-04-09', '0000-00-00', '08:57:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'HOUSTON- CHEQUE PICHINCHA', '2012-04-09', 'M', '', 51, 'Anita Paucar', 'T'),
(201, 0, 4, '2012-04-09', '0000-00-00', '09:39:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV Y ENTREGA  DE FACTURA', 'FACVOR RECIBIR DAV FIRMADA Y ENTREGAR RECIBIDO DE FACTURAS A LORENA', '2012-04-09', 'M', '', 53, 'Lorena Morales', 'T'),
(202, 0, 5, '2012-04-09', '0000-00-00', '09:43:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV Y ENTREGA  DE FACTURA', 'favor entregar recibido de factura a Lorena Morales', '2012-04-09', 'M', '', 53, 'Lorena Morales', 'T'),
(203, 1, 3, '2012-04-09', '0000-00-00', '10:35:00', '00:00:00', 'IMPEXAZUL', 'ENTREGA FACTURAS', 'MORAYMA ARIAS', '2012-04-09', 'T', '', 51, 'Anita Paucar', 'T'),
(204, 1, 6, '2012-04-09', '0000-00-00', '11:45:00', '00:00:00', 'PRODUCCION ', 'RETIRAR DAV ', 'JUAN DIEGO BRITO ', '2012-04-09', 'T', '', 43, 'Karla Jacome', 'T'),
(205, 1, 5, '2012-04-09', '0000-00-00', '12:04:00', '00:00:00', 'COMERCIALIZACION ', 'ENTREGAR OFICIO ', 'ING. GABRIELA ZURITA <br />\n<br />\nPONER RECIBIDO EN COPIA GRACIAS ', '2012-04-09', 'T', '', 43, 'Karla Jacome', 'T'),
(206, 1, 1, '2012-04-09', '0000-00-00', '12:51:00', '00:00:00', 'SJ JERSEY ECUATORIANO', 'ENTREGA FACTURAS', 'ANDREA MOLINA', '2012-04-09', 'T', '', 51, 'Anita Paucar', 'T'),
(207, 1, 7, '2012-04-10', '0000-00-00', '13:02:00', '00:00:00', 'GERENCIA REFINACION', 'ENTREGA FACTURAS', 'TERESA YEPEZ', '2012-04-09', 'T', '', 51, 'Anita Paucar', 'T'),
(208, 1, 4, '2012-04-09', '0000-00-00', '13:03:00', '00:00:00', 'CARGONET', 'ENTREGA FACTURAS', 'JIMMY CADENA', '2012-04-09', 'T', '', 51, 'Anita Paucar', 'T'),
(209, 1, 2, '2012-04-09', '0000-00-00', '13:15:00', '00:00:00', 'PROAÑO', 'ENTREGAR FACTURAS', 'MA ALICIA ESPIN', '2012-04-09', 'T', '', 51, 'Anita Paucar', 'T'),
(210, 1, 7, '2012-04-09', '0000-00-00', '13:26:00', '00:00:00', 'GERENCIA REFINACION/OFICINAS', 'RETIRO DAV', 'CON MARISOL ANDRADE', '2012-04-09', 'T', '', 5, 'Maria Piedad', 'T'),
(211, 1, 2, '2012-04-10', '0000-00-00', '15:55:00', '00:00:00', 'ADUANA', 'ENTREGA DCTOS', 'DIANA GONZA', '2012-04-09', 'T', '', 51, 'Anita Paucar', 'T'),
(212, 1, 8, '2012-04-10', '0000-00-00', '15:56:00', '00:00:00', 'MINISTERIO DE SALUD PUBLICA', 'ENTREGA FACTURAS', 'LORENA CEVALLOS', '2012-04-09', 'T', '', 51, 'Anita Paucar', 'T'),
(213, 1, 9, '2012-04-10', '0000-00-00', '16:58:00', '00:00:00', 'BANCO INTERNACIONAL', 'ENTREGA', 'CERTIFICADO DE INVERSION A PATRICIO ZAPATTA', '2012-04-09', 'T', '', 51, 'Anita Paucar', 'T'),
(214, 1, 10, '2012-04-10', '0000-00-00', '17:21:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'CHEQUE DE PROAÑO POR $266.75', '2012-04-09', 'T', '', 51, 'Anita Paucar', 'T'),
(215, 1, 1, '2012-04-10', '0000-00-00', '17:22:00', '00:00:00', 'IMPEXAZUL', 'ENTREGA FACTURA', 'MORAYMA ARIAS', '2012-04-09', 'T', '', 51, 'Anita Paucar', 'T'),
(216, 0, 13, '2012-04-09', '0000-00-00', '17:22:00', '00:00:00', 'SENAE//GERENCIA REFINACION', 'ENTREGAR TRAMITE ', 'ENTREGAR A JUAN LUIS DK 292', '2012-04-09', 'N', '', 5, 'Maria Piedad', 'P'),
(217, 1, 12, '2012-04-10', '0000-00-00', '17:32:00', '00:00:00', 'PICHINCHA', 'RETIRAR FACTURAS', 'LEASING-MARCELA URREA', '2012-04-09', 'T', '', 51, 'Anita Paucar', 'T'),
(218, 1, 8, '2012-04-10', '0000-00-00', '17:33:00', '00:00:00', 'CARGONET', 'ENTREGA FACTURA', 'JIMMY CADENA', '2012-04-09', 'T', '', 51, 'Anita Paucar', 'T'),
(219, 1, 1, '2012-04-10', '0000-00-00', '09:04:00', '00:00:00', 'CASA FELIPE', 'LLEVAR DOCUMENTOS', 'Y TRAER FIRMADOS', '2012-04-10', 'T', '', 51, 'Anita Paucar', 'T'),
(220, 1, 9, '2012-04-10', '0000-00-00', '09:05:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'CUENTA FELIPE $115', '2012-04-10', 'T', '', 51, 'Anita Paucar', 'T'),
(221, 1, 9, '2012-04-10', '0000-00-00', '09:12:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'RETIRO DE DAV', 'FAVOR RETIRAR DAV FIRMADA CON EL SR APARICIO COBA', '2012-04-10', 'T', '', 53, 'Lorena Morales', 'T'),
(222, 1, 11, '2012-04-10', '0000-00-00', '09:21:00', '00:00:00', 'PRODUBANCO', 'PAGO IESS', 'DON EDWIN', '2012-04-10', 'T', '', 51, 'Anita Paucar', 'T'),
(223, 1, 2, '2012-04-10', '0000-00-00', '09:23:00', '00:00:00', 'ADUANA QUITO ', 'TRAMITE ', 'INGRESO TRAMITE JUAN LUIS ', '2012-04-10', 'T', '', 43, 'Karla Jacome', 'T'),
(224, 1, 3, '2012-04-10', '0000-00-00', '10:35:00', '00:00:00', 'ADUANA', 'ENTREGA DE SUMINISTROS', 'DIANA GONZA', '2012-04-10', 'T', '', 51, 'Anita Paucar', 'T'),
(225, 1, 6, '2012-04-10', '0000-00-00', '11:41:00', '00:00:00', 'ADUANA QUITO ', 'entregar trámite ', 'tramite para juan Luis DE Arias Aranga Carlos ', '2012-04-10', 'T', '', 43, 'Karla Jacome', 'T'),
(226, 1, 6, '2012-04-10', '0000-00-00', '12:43:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV Y ENTREGA  DE FACTURA', 'FAVOR ENTREGAR RECIBIDO DE FACTURAS A LORENA MORALES, Y RETIRAR DAV FIRMADA', '2012-04-10', 'T', '', 53, 'Lorena Morales', 'T'),
(227, 1, 1, '2012-04-10', '0000-00-00', '12:45:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGA DE TRAMITE TRAUMA Y 2 SK', 'FAVOR ADJUNTAR DAV DE TRAUMA Y ENTREGAR  A JUAN LUIS CON EL TRAMITE PARA QUE SEA SELLADO, FIRMADO E  INGRESADO.<br />\nENTREGAR 2 TRAMITES SK PARA SU INGRESO', '2012-04-10', 'T', '', 53, 'Lorena Morales', 'T'),
(228, 1, 9, '2012-04-10', '0000-00-00', '13:00:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'RETIRAR DOCUMENTOS', 'CON ANDRES MENA', '2012-04-10', 'T', '', 5, 'Maria Piedad', 'T'),
(229, 1, 2, '2012-04-10', '0000-00-00', '13:04:00', '00:00:00', 'LAN ', 'REETIRO DE GUIA', 'RETIRAR DE GUIA ', '2012-04-10', 'T', '', 5, 'Maria Piedad', 'P'),
(230, 1, 2, '2012-04-10', '0000-00-00', '13:16:00', '00:00:00', 'SK ENGINEERING', 'RETIRO DE DAV', 'FAVRO RETIRAR DAVS FIRMADAS Y ENTREGAR A JUAN LOUIS PAR ADJUNTAR A TRAMITES Y QUE SEAN INGRESADAS', '2012-04-10', 'T', '', 53, 'Lorena Morales', 'T'),
(231, 1, 4, '2012-04-10', '0000-00-00', '13:21:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGA DE TRAMITE TRAUMA Y  SK', 'ADICIONAL ENTREGAR DAVS FIRMADAS RETIRADAS DE SK PARA ADJUNTARSE A TRAMITE E INGRESARSE', '2012-04-10', 'T', '', 53, 'Lorena Morales', 'T'),
(232, 1, 5, '2012-04-10', '0000-00-00', '16:33:00', '00:00:00', 'ADUANA QUITO ', 'TRAMITE MALUENDO ', 'PARA JUAN LUIS ', '2012-04-10', 'T', '', 43, 'Karla Jacome', 'T'),
(233, 0, 8, '2012-04-11', '0000-00-00', '17:18:00', '00:00:00', 'GRAPHICSOURCE', 'RETIRAR CHEQUE', 'A FAVOR DE DENKEL ', '2012-04-10', 'M', '', 51, 'Anita Paucar', 'T'),
(245, 1, 6, '2012-04-11', '0000-00-00', '09:37:00', '00:00:00', 'tv cable ', 'llevar carta y equipos', 'llevar carta y equios a tv cable', '2012-04-11', 'T', '', 44, 'Paola Paredes', 'P'),
(234, 0, 13, '2012-04-11', '0000-00-00', '17:19:00', '00:00:00', 'PRODUBANCO', 'PAGO IESS', 'CHQ DENKEL', '2012-04-10', 'M', '', 51, 'Anita Paucar', 'T'),
(235, 1, 7, '2012-04-11', '0000-00-00', '17:20:00', '00:00:00', 'BANCO INTERNACIONAL', 'ENTREGAR DCTOS', 'ATT. PATRICIO ZAPPATA', '2012-04-10', 'T', '', 51, 'Anita Paucar', 'P'),
(236, 0, 1, '2012-04-11', '0000-00-00', '17:42:00', '00:00:00', 'SK ENGINEERING', 'RETIRO DE CHEQUES PARA SENAE', 'LLEVAR A SENAE PARA PAGO TRIBUTOS ', '2012-04-10', 'M', '', 5, 'Maria Piedad', 'T'),
(237, 0, 7, '2012-04-11', '0000-00-00', '17:46:00', '00:00:00', 'GRAPHICSOURSE', 'RETIRO DE DAV', 'CON NATALIA LOPEZ', '2012-04-10', 'M', '', 53, 'Lorena Morales', 'T'),
(238, 1, 3, '2012-04-11', '0000-00-00', '08:38:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'RETIRO CHEQUE PARA SENAE', 'LLEVAR A ADUANA CHEQUE PARA SENAE', '2012-04-11', 'T', '', 5, 'Maria Piedad', 'T'),
(239, 0, 14, '2012-04-11', '0000-00-00', '08:57:00', '00:00:00', 'PRODUBANCO', 'PAGO IESS', 'HACER EL PAGO DE LOS APORTES AL IESS', '2012-04-11', 'M', '', 52, 'Martha Marulanda', 'T'),
(240, 0, 15, '2012-04-11', '0000-00-00', '09:01:00', '00:00:00', 'PRODUBANCO', 'RETIRAR FACTURAS LEASING', 'FAVOR IR A RETIRAR FACTURAS DE LEASING', '2012-04-11', 'M', '', 52, 'Martha Marulanda', 'T'),
(241, 0, 10, '2012-04-11', '0000-00-00', '09:10:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'ENTREGAR FACTURAS', 'NATHALIA COBA', '2012-04-11', 'M', '', 51, 'Anita Paucar', 'T'),
(242, 1, 12, '2012-04-11', '0000-00-00', '09:11:00', '00:00:00', 'REYBEC', 'ENTREGA FACTURAS', 'VALERIA MEJIA 3:00 PM', '2012-04-11', 'T', '', 51, 'Anita Paucar', 'T'),
(243, 0, 1, '2012-04-11', '0000-00-00', '09:22:00', '00:00:00', 'GRAPHICSOURSE', 'RETIRO DE DAV', 'RETIRAR DAV FRIMADA POR NATALIA LOPEZ', '2012-04-11', 'M', '', 53, 'Lorena Morales', 'T'),
(244, 1, 1, '2012-04-11', '0000-00-00', '09:25:00', '00:00:00', 'IMPRENTA', 'MANDAR A HACER TALONARIOS', 'DE RETENCIONES 6 TALONARIOS Y DE LIQUIDACIONES DE COMPRA 3 TALONARIOS.<br />\nENVIO CHEQUE PARA PAGO.', '2012-04-11', 'T', '', 51, 'Anita Paucar', 'P'),
(246, 0, 6, '2012-04-11', '0000-00-00', '09:37:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV Y ENTREGA  DE FACTURA', 'FAVOR ENTREGAR RECIBIDO DE FACTURA A LORENA', '2012-04-11', 'M', '', 53, 'Lorena Morales', 'T'),
(247, 0, 3, '2012-04-11', '0000-00-00', '09:38:00', '00:00:00', 'OFICINA ADUANA', 'LLEVAR CHEQUE E SK', 'PARA SENAE', '2012-04-11', 'M', '', 53, 'Lorena Morales', 'T'),
(248, 1, 4, '2012-04-11', '0000-00-00', '10:30:00', '00:00:00', 'OFICINA  DENKEL LA PRENSA', 'LLEVAR RETENCIONES', 'LLEVAR RETENCIONES DE TRANSPORTISTAS A DIANA O JUANCHO', '2012-04-11', 'T', '', 52, 'Martha Marulanda', 'P'),
(249, 1, 2, '2012-04-11', '0000-00-00', '11:15:00', '00:00:00', 'PROAÑO REPRESENTACIONES ', 'RETIRO CHEQUE PAR GYE Y DOCS', 'CON CRISTIAN MARIÑO A PARTIR DE LAS 4PM', '2012-04-11', 'T', '', 5, 'Maria Piedad', 'P'),
(250, 1, 5, '2012-04-11', '0000-00-00', '12:23:00', '00:00:00', 'ADUANA QUITO ', 'TRAMITE ', 'JUAN LUIS MIÑO TRAMITE DK 302', '2012-04-11', 'T', '', 43, 'Karla Jacome', 'P'),
(251, 0, 2, '0000-00-00', '0000-00-00', '13:40:00', '00:00:00', 'aduana ', 'entregar cheque de trauma ', 'entregar cheque de trauma', '2012-04-11', 'N', '', 44, 'Paola Paredes', 'P'),
(252, 1, 3, '2012-04-11', '0000-00-00', '13:42:00', '00:00:00', 'aduana', 'entregar cheque', 'entregar cheque de trauma', '2012-04-11', 'T', '', 44, 'Paola Paredes', 'P'),
(253, 1, 8, '2012-04-11', '0000-00-00', '13:54:00', '00:00:00', 'pancho del pichincha ', 'depositar cheque', 'depositar cheque de graficsource', '2012-04-11', 'T', '', 44, 'Paola Paredes', 'P'),
(254, 1, 9, '2012-04-11', '0000-00-00', '15:03:00', '00:00:00', 'MINISTERIO ', 'RETIRO DE DOCUMENTOS ', 'RETIRAR TRAMITE CON EUGENIA ALMEIDA ', '2012-04-11', 'T', '', 5, 'Maria Piedad', 'P'),
(255, 1, 9, '2012-04-11', '0000-00-00', '18:41:00', '00:00:00', 'Willian Espinosa', 'Ninguna', 'Prueba', '2012-04-11', 'T', '', 3, 'Willian Espinosa', 'T'),
(256, 0, 1, '2012-04-12', '0000-00-00', '09:15:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGA DE TRAMITE ', 'FAVOR ENTREGAR TRAMITE PARA QUE SEA INGRESADO ', '2012-04-12', 'M', '', 53, 'Lorena Morales', 'T'),
(257, 0, 4, '2012-04-12', '0000-00-00', '09:16:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE FACTURAS CONTECON', 'FAVOR ENTREGAR RECIBIDO A LORENA<br />\n', '2012-04-12', 'M', '', 53, 'Lorena Morales', 'T'),
(258, 0, 3, '2012-04-12', '0000-00-00', '09:17:00', '00:00:00', 'DOLMAR', 'RETIRO DE GUIA', 'RETIRAR GUIA CON DOCUMENTOS ADJUNTOS', '2012-04-12', 'M', '', 53, 'Lorena Morales', 'T'),
(259, 0, 2, '2012-04-12', '0000-00-00', '09:30:00', '00:00:00', 'ADUANA QUITO ', 'INGRESAR PODERES PARA DAV ', 'JUAN LUIS MIÑO ', '2012-04-12', 'M', '', 43, 'Karla Jacome', 'T'),
(260, 0, 5, '2012-04-12', '0000-00-00', '09:38:00', '00:00:00', 'BANCO INTERNACIONAL', 'RETIRAR CLAVE DE ACCESO ', 'RETIRAR CLAVE DE ACCESO', '2012-04-12', 'M', '', 44, 'Paola Paredes', 'T'),
(261, 0, 6, '2012-04-12', '0000-00-00', '09:43:00', '00:00:00', 'banco bolivariano', 'retirar cheque', 'retirar queque de impexazul', '2012-04-12', 'M', '', 44, 'Paola Paredes', 'T'),
(262, 1, 1, '2012-04-12', '0000-00-00', '11:43:00', '00:00:00', 'PRODUBANCO', 'CAMBIAR CHEQUE', 'CAJA CHICA', '2012-04-12', 'T', '', 51, 'Anita Paucar', 'T'),
(263, 1, 2, '2012-04-12', '0000-00-00', '11:56:00', '00:00:00', 'KLM', 'RETIRAR GUIA MSP', 'LLEVAR A ADUANA ', '2012-04-12', 'T', '', 5, 'Maria Piedad', 'T'),
(264, 1, 3, '2012-04-12', '0000-00-00', '12:56:00', '00:00:00', 'PRODUBANCO', 'ENTREGA DCTOS', 'ATT. LORENA VIVAR', '2012-04-12', 'T', '', 51, 'Anita Paucar', 'T'),
(265, 1, 4, '2012-04-12', '0000-00-00', '12:58:00', '00:00:00', 'banco bolivariano', 'retirar cheque', 'retirar cheque impexazul<br />\n', '2012-04-12', 'T', '', 44, 'Paola Paredes', 'T'),
(266, 0, 8, '2012-04-13', '0000-00-00', '13:44:00', '00:00:00', 'BANCO INTERNACIONAL', 'SOLICITUD DE CLAVE', 'FAVOR LLENAL LA SOLICITUD EN EL BANCO', '2012-04-12', 'M', '', 44, 'Paola Paredes', 'T'),
(270, 0, 1, '2012-04-13', '0000-00-00', '09:06:00', '00:00:00', 'tame', 'dejar valija', 'enviar valija aerea a gye', '2012-04-13', 'M', '', 44, 'Paola Paredes', 'T'),
(267, 1, 3, '2012-04-13', '0000-00-00', '16:45:00', '00:00:00', 'DESAROLLO ORGANIZACIONAL', 'ENTREGA SOBRE/OFICIO', 'ATT. ING. RICHAR CHAMBA', '2012-04-12', 'T', '', 51, 'Anita Paucar', 'P'),
(268, 1, 4, '2012-04-13', '0000-00-00', '18:25:00', '00:00:00', 'PRODUCCION ', 'RETIRAR DOCUMENTOS ', 'IMPORTANTE JUAN DEIGO VRITO ', '2012-04-12', 'T', '', 43, 'Karla Jacome', 'P'),
(269, 0, 2, '2012-04-13', '0000-00-00', '18:36:00', '00:00:00', 'ADUANA QUITO ', 'DEJASR PAGOO PARA MULTA ', 'PAGO MULTA DK 297', '2012-04-12', 'M', '', 43, 'Karla Jacome', 'T'),
(271, 1, 2, '2012-04-13', '0000-00-00', '09:18:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE FACTURA Y COMPROBANTE DE PAGO', ' ENTREGAR RECIBIDOS A LORENA', '2012-04-13', 'T', '', 53, 'Lorena Morales', 'P'),
(272, 1, 1, '2012-04-13', '0000-00-00', '09:24:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGAR TRAMITE.', 'TRAMITE DE TRAUMA PARA SUU INGRESO', '2012-04-13', 'T', '', 53, 'Lorena Morales', 'P'),
(273, 0, 2, '2012-04-13', '0000-00-00', '09:38:00', '00:00:00', 'AZULEC', 'ENTREGA', 'NOTE DE CREDITO ATT. MORAYMA ARIAS', '2012-04-13', 'M', '', 51, 'Anita Paucar', 'T'),
(274, 1, 5, '2012-04-13', '0000-00-00', '11:53:00', '00:00:00', 'ABOGADO', 'ENTREGAR FACTURA', 'DEVOLUCION ', '2012-04-13', 'T', '', 51, 'Anita Paucar', 'P'),
(275, 1, 6, '2012-04-13', '0000-00-00', '12:00:00', '00:00:00', 'PRODUBANCO', 'ENTREGA SOBRE', 'ATT. LORENA VIVAR', '2012-04-13', 'T', '', 51, 'Anita Paucar', 'P'),
(276, 1, 1, '2012-04-13', '0000-00-00', '13:07:00', '00:00:00', 'ADUANA QUITO', 'ENTREGAR PODER ', 'PODER PARA REGISTRAR FIRMA PARA DAV DE ALEXI LOOR <br />\n<br />\nENTREGAR A JUAN LUIS MIÑO ', '2012-04-13', 'T', '', 43, 'Karla Jacome', 'P'),
(277, 1, 2, '2012-04-13', '0000-00-00', '13:11:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGAR OFICIO', 'FAVOR ENTREGAR OFICIO AL SR JOSE GUEVARA', '2012-04-13', 'T', '', 53, 'Lorena Morales', 'P'),
(278, 1, 1, '2012-04-13', '0000-00-00', '13:12:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGA DE DODCUMENTOS', 'FAVOR ENTREGAR  A JUAN LUIS', '2012-04-13', 'T', '', 53, 'Lorena Morales', 'P'),
(279, 0, 1, '2012-04-16', '0000-00-00', '08:42:00', '00:00:00', 'MSP', 'RETIRO DE DOCUMENTOS', 'PARA NUEVO TRAMITE', '2012-04-16', 'M', '', 5, 'Maria Piedad', 'T'),
(280, 0, 3, '2012-04-16', '0000-00-00', '09:20:00', '00:00:00', 'REFINACION', 'ENTREGAR FACTURAS', 'ATT. TERESA YEPEZ', '2012-04-16', 'M', '', 51, 'Anita Paucar', 'T'),
(281, 0, 5, '2012-04-16', '0000-00-00', '09:28:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV', 'FAVOR RETIRAR5 DAV CON MARISOL ANDRADE', '2012-04-16', 'M', '', 53, 'Lorena Morales', 'T'),
(282, 1, 7, '2012-04-16', '0000-00-00', '09:29:00', '00:00:00', 'PRODUBANCO', 'ENTREGA DCTOS', 'ATT. LORENA VIVAR', '2012-04-16', 'T', '', 51, 'Anita Paucar', 'T'),
(283, 0, 2, '2012-04-16', '0000-00-00', '09:33:00', '00:00:00', 'abogado', 'entregar factura', 'entragar factura hacer firmar recibido ', '2012-04-16', 'M', '', 44, 'Paola Paredes', 'T'),
(284, 0, 4, '2012-04-16', '0000-00-00', '09:42:00', '00:00:00', 'imprenta', 'retirar fecturas', 'retirar facturas', '2012-04-16', 'M', '', 44, 'Paola Paredes', 'T'),
(285, 1, 3, '2012-04-16', '0000-00-00', '09:45:00', '00:00:00', 'EXPLORACION Y PRODUCCION', 'ENTREGA FACTURAS', 'ATT. JUAN DIEGO BRITO', '2012-04-16', 'T', '', 51, 'Anita Paucar', 'T'),
(286, 1, 5, '2012-04-16', '0000-00-00', '11:03:00', '00:00:00', 'GERENCIA DE DESARROLLO ORGANIZACIONAL ', 'RETIRAR TRAMITE ', 'TRAMITE CON DIEGO SALAS ', '2012-04-16', 'T', '', 43, 'Karla Jacome', 'T'),
(287, 1, 3, '2012-04-16', '0000-00-00', '12:04:00', '00:00:00', 'REFINACION', 'RETIRO DOCUMENTOS', 'CON MARISOL ANDRADE TRAMITES NUEVOS', '2012-04-16', 'T', '', 5, 'Maria Piedad', 'P'),
(288, 1, 7, '2012-04-16', '0000-00-00', '12:18:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE PAGOS', 'FAVOR ENTREGAR PAGOS, RECIBIDO EN COPIAS', '2012-04-16', 'T', '', 53, 'Lorena Morales', 'T'),
(289, 1, 2, '2012-04-16', '0000-00-00', '12:20:00', '00:00:00', 'CARGONET', 'ENTREGA FACTURAS', 'ATT. JIMMY CADENA', '2012-04-16', 'T', '', 51, 'Anita Paucar', 'T'),
(290, 1, 2, '2012-04-16', '0000-00-00', '13:03:00', '00:00:00', 'SK ENGINEERING', 'ENTREGAR FACTURAS', 'ATT. HANA LEE', '2012-04-16', 'T', '', 51, 'Anita Paucar', 'T'),
(291, 0, 1, '2012-04-16', '0000-00-00', '14:53:00', '00:00:00', 'AZULEC', 'RETIRAR RETENCIONES', 'MORAYMA ARIAS', '2012-04-16', 'M', '', 51, 'Anita Paucar', 'T'),
(292, 0, 5, '2012-04-17', '0000-00-00', '16:50:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGA DE TRAMITE', 'FAVOR EMTREGAR TRAMITE DE GERENCCIA DE REFINACION PARA SER INGRESADO', '2012-04-16', 'M', '', 53, 'Lorena Morales', 'T'),
(293, 1, 1, '2012-04-16', '0000-00-00', '16:52:00', '00:00:00', 'ACAI CARGO', 'DEJAR DOCUMENTOS EN SOBRE', 'ENTREGAR A ROBERTO PAZMIÑO EN SOBRE DE DENKEL ', '2012-04-16', 'T', '', 5, 'Maria Piedad', 'P'),
(297, 0, 1, '2012-04-17', '0000-00-00', '09:16:00', '00:00:00', 'CAERGONET ', 'ENTREGA DE FACTURA', 'PAOLA FAVOR GUARDAR RECIBIDO EN CARPETA DE DK 253', '2012-04-17', 'M', '', 53, 'Lorena Morales', 'T'),
(294, 0, 3, '2012-04-17', '0000-00-00', '17:39:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'RETIRO DE DOCUMENTOS', 'RETIRAR TRAMITE CON JOHANNA', '2012-04-16', 'M', '', 5, 'Maria Piedad', 'T'),
(295, 0, 2, '2012-04-17', '0000-00-00', '08:55:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'ENTREGAR FACTURAS', 'ATT. MARIA ALICIA ESPIN 2 TRAMITES', '2012-04-17', 'M', '', 51, 'Anita Paucar', 'T'),
(296, 0, 7, '2012-04-17', '0000-00-00', '09:02:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE FACTURAS Y PAGOS', 'FAVOR ENTREGAR RECIBIDOS A LORENA MORALES', '2012-04-17', 'M', '', 53, 'Lorena Morales', 'T'),
(298, 0, 4, '2012-04-17', '0000-00-00', '09:25:00', '00:00:00', 'ADUANA', 'ENTREGA CHEQUES', '8 CH. A JUAN LUIS MIÑO', '2012-04-17', 'M', '', 51, 'Anita Paucar', 'T'),
(299, 1, 5, '2012-04-17', '0000-00-00', '10:31:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'PRODUBANCO DEPOSITO CHQ DE TRANSOCEANICA', '2012-04-17', 'T', '', 52, 'Martha Marulanda', 'P'),
(300, 1, 1, '2012-04-17', '0000-00-00', '11:41:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'RETIRO CHEQUE PARA SENAE', 'LLEVAR CHEQUE HASTA SENAE PARA JUAN LUIS', '2012-04-17', 'T', '', 5, 'Maria Piedad', 'P');
INSERT INTO `dnk_mensajeria_ant` (`id`, `columna`, `fila`, `fecha`, `fecha_crea`, `hora`, `hora_fin`, `cliente`, `actividad`, `observacion`, `programada`, `turno`, `obser_cancel`, `user_id`, `user_name`, `estado`) VALUES
(301, 1, 1, '2012-04-17', '0000-00-00', '12:41:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'RETIRAR CHEQUE', 'ATT. LAURITA ESTRELLA', '2012-04-17', 'T', '', 51, 'Anita Paucar', 'P'),
(302, 1, 2, '2012-04-17', '0000-00-00', '12:55:00', '00:00:00', 'PRODUCCION ', 'ENTREGAR DOCUMENTOS ', 'ENTREGAR A SR. LEMA ', '2012-04-17', 'T', '', 43, 'Karla Jacome', 'P'),
(303, 1, 3, '2012-04-17', '0000-00-00', '13:06:00', '00:00:00', 'GRAPHICSOURCE', 'ENTREGA FACTURAS', 'ATT. MARGARITA ORTIZ', '2012-04-17', 'T', '', 51, 'Anita Paucar', 'P'),
(304, 1, 4, '2012-04-17', '0000-00-00', '13:19:00', '00:00:00', 'ORGANIZACIONAL ', 'RETIRAR DAV ', 'DIEGO SALAS ', '2012-04-17', 'T', '', 43, 'Karla Jacome', 'P'),
(305, 0, 5, '2012-04-17', '0000-00-00', '13:43:00', '00:00:00', 'REFINACION', 'RETIRAR DAV', 'RETIRO DAV NUEVO TRAMITE', '2012-04-17', 'N', '', 5, 'Maria Piedad', 'P'),
(306, 1, 4, '2012-04-19', '0000-00-00', '15:24:00', '00:00:00', 'BOLIVARIANO', 'RETIRAR CHEQUE', 'DE IMPEXAZUL', '2012-04-17', 'T', '', 51, 'Anita Paucar', 'T'),
(307, 1, 5, '2012-04-18', '0000-00-00', '16:20:00', '00:00:00', 'FLOWSEAL', 'RETIRAR CHEQUES', 'ATT. M. MARTINEZ', '2012-04-17', 'T', '', 51, 'Anita Paucar', 'T'),
(308, 0, 8, '2012-04-17', '0000-00-00', '17:04:00', '00:00:00', 'INEN', 'INGRESAR AUOTORIZACION PARA FACTURACION A DENKEL', 'FACVOR INGRESAR DOCUMENTOS <br />\nY HACER FIRMAWR RECIBIDO', '2012-04-17', 'N', '', 53, 'Lorena Morales', 'P'),
(309, 1, 6, '2012-04-18', '0000-00-00', '17:40:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'VARIOS CHEQUES', '2012-04-17', 'T', '', 51, 'Anita Paucar', 'P'),
(310, 1, 5, '2012-04-19', '0000-00-00', '17:41:00', '00:00:00', 'INTERNACIONAL', 'RETIRAR CLAVE', 'FECHA DE ENTREGA', '2012-04-17', 'T', '', 51, 'Anita Paucar', 'T'),
(311, 0, 3, '2012-04-18', '0000-00-00', '08:58:00', '00:00:00', 'INEN', 'INGRESAR AUTORIZACION PARA FACTURACION A DENKEL', 'FAVOR INGRESAR AUTORIZACION PARA INICIAR TRAMITE INEN ', '2012-04-18', 'M', '', 53, 'Lorena Morales', 'T'),
(312, 0, 1, '2012-04-18', '0000-00-00', '09:10:00', '00:00:00', 'ADUANA QUITO ', 'TRAMITE 329', 'INGRESAR TRAMITE  JUAN LUIS ', '2012-04-18', 'M', '', 43, 'Karla Jacome', 'T'),
(313, 0, 5, '2012-04-18', '0000-00-00', '09:38:00', '00:00:00', 'INEN', 'INGRESAR INEN ELECTRONICO', 'PARA CRISTIAN VASCO INGRESAR ANTES DE LAS 12', '2012-04-18', 'M', '', 5, 'Maria Piedad', 'T'),
(314, 1, 1, '2012-04-18', '0000-00-00', '09:51:00', '00:00:00', 'FRANCISCO ALARCON', 'ENTREGA ESCRITURA', 'OFI.', '2012-04-18', 'T', '', 51, 'Anita Paucar', 'T'),
(315, 0, 2, '2012-04-18', '0000-00-00', '10:02:00', '00:00:00', 'SJ JERSEY', 'RETIRO DE DOCUMENTOS', 'FAVOR RETIRAR CON MARIA FERNANDA<br />\n', '2012-04-18', 'M', '', 53, 'Lorena Morales', 'T'),
(316, 1, 3, '2012-04-18', '0000-00-00', '10:25:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV', 'RETIRAR DAVS FIRMADAS ', '2012-04-18', 'T', '', 53, 'Lorena Morales', 'T'),
(317, 1, 1, '2012-04-18', '0000-00-00', '11:29:00', '00:00:00', 'PRODUCCION', 'RETIRAR DAV ', 'RETIRAR DAV JAUN DIEGO BRITO ', '2012-04-18', 'T', '', 43, 'Karla Jacome', 'T'),
(318, 1, 2, '2012-04-18', '0000-00-00', '12:32:00', '00:00:00', 'ARISBERG', 'RETIRAR CHEQUE', 'Av. 12 DE OCTUBRE y CORDERO. WALL TRADE CENTER PISO 11 OFI. 1110<br />\nDE 3 - 5 PM', '2012-04-18', 'T', '', 51, 'Anita Paucar', 'P'),
(319, 1, 6, '2012-04-18', '0000-00-00', '14:06:00', '00:00:00', 'claro', 'activar roaming de datos', 'activar roaming<br />\n', '2012-04-18', 'T', '', 44, 'Paola Paredes', 'T'),
(320, 0, 1, '2012-04-19', '0000-00-00', '14:23:00', '00:00:00', 'INEN', 'ENTREGAR DCS', 'HACERCARSE CON DOÑA SUSANA PRESENTAR NUMERO DE SOLICITUD ', '2012-04-18', 'M', '', 5, 'Maria Piedad', 'T'),
(321, 0, 8, '2012-04-18', '0000-00-00', '14:50:00', '00:00:00', 'INEN', 'INGRESAR TRAMITE', 'ADJUNTO ORIGINALES DE OFICIO 10148 Y 10147', '2012-04-18', 'N', '', 53, 'Lorena Morales', 'P'),
(322, 1, 2, '2012-04-19', '0000-00-00', '14:55:00', '00:00:00', 'ADUANA', 'ENTREGA ROL DE PAGOS', 'DIANA Y JUAN LUIS', '2012-04-18', 'T', '', 51, 'Anita Paucar', 'T'),
(323, 0, 3, '2012-04-19', '0000-00-00', '08:40:00', '00:00:00', 'ASISBERG', 'RETIRAR CHEQUE', 'RETIRAR CHEQUE EN LAS OFICINAS EN EL WORD TRADE CENTER', '2012-04-19', 'M', '', 44, 'Paola Paredes', 'T'),
(324, 0, 3, '2012-04-19', '0000-00-00', '08:44:00', '00:00:00', 'GRAPHIC SOURCE', 'RETIRO DE DOCUMENTOS', 'CON MARGARITA ORTIZ', '2012-04-19', 'M', '', 5, 'Maria Piedad', 'T'),
(325, 0, 5, '2012-04-19', '0000-00-00', '08:53:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE PAGOS', 'FAVOR ENTREGAR PAGOS Y  RECIBIDO EN COPIAS<br />\n', '2012-04-19', 'M', '', 53, 'Lorena Morales', 'T'),
(326, 0, 6, '2012-04-19', '0000-00-00', '09:03:00', '00:00:00', 'PRODUBANCO', 'DEPOSITOS (2)', 'DEPOSITAR CHQUES DE FLOWSEAL ', '2012-04-19', 'M', '', 52, 'Martha Marulanda', 'T'),
(327, 1, 6, '2012-04-19', '0000-00-00', '09:06:00', '00:00:00', 'PRODUBANCO/PICHINCHA', 'RETIRAR FACTURAS LEASING', 'AVERIGUAR POR LAS FACTURAS DEL LEASING DEL MES DE ABRIL-2012', '2012-04-19', 'T', '', 52, 'Martha Marulanda', 'T'),
(328, 1, 3, '2012-04-19', '0000-00-00', '10:17:00', '00:00:00', 'AZUL', 'RETIRAR TRAMITE URGENTE', 'SRA. MORAYMA ARIAS<br />\nTRAMITE URGENTE ', '2012-04-19', 'T', '', 43, 'Karla Jacome', 'T'),
(329, 0, 10, '0000-00-00', '0000-00-00', '12:38:00', '00:00:00', 'MINISTERIO DE SALUD', 'RETIRO DE OFICIO', 'RETIRAR OFICIO SRTA EVELYN ROBAYO', '2012-04-19', 'N', '', 53, 'Lorena Morales', 'P'),
(330, 1, 1, '2012-04-19', '0000-00-00', '13:01:00', '00:00:00', 'PERSONAL', 'LLEVAR DCTOS A FELIPE', 'A LA CASA EN CUMBAYA', '2012-04-19', 'T', '', 51, 'Anita Paucar', 'T'),
(331, 0, 1, '2012-04-20', '0000-00-00', '15:00:00', '00:00:00', 'MINISTERIO DE SALUD', 'RETIRAR DOCUMENTOS', 'CON LORENA CEVALLOS', '2012-04-19', 'M', '', 53, 'Lorena Morales', 'T'),
(332, 0, 3, '2012-04-20', '0000-00-00', '15:03:00', '00:00:00', 'MSP', 'RETIRAR ', 'ENTREGAR DOCUMENTOS A EUGENIA', '2012-04-19', 'M', '', 5, 'Maria Piedad', 'T'),
(333, 0, 1, '2012-04-23', '0000-00-00', '15:29:00', '00:00:00', 'KLM', 'RETIRO DE GUIA', 'RETIRAR GUIA EN KLM ENVIAR A ADUANA ', '2012-04-19', 'M', '', 5, 'Maria Piedad', 'T'),
(346, 0, 11, '2012-04-23', '0000-00-00', '10:22:00', '00:00:00', 'MARTINAIR CARGO ', 'RETIRAR GUIA IMPEXAZUL ', 'RETIRAR GUIA Nº 129-54239636. LLEVAR CPBTE DE TRANSFERENCIA. <br />\nCARGA LLEGA SABADO 16:00PM. ', '2012-04-20', 'M', '', 43, 'Karla Jacome', 'T'),
(334, 1, 8, '2012-04-19', '0000-00-00', '16:02:00', '00:00:00', 'DANIELCOM', 'RETIRO CHEQUE', 'ATT. GIOVANNY SALAZAR', '2012-04-19', 'T', '', 51, 'Anita Paucar', 'T'),
(335, 1, 1, '2012-04-23', '0000-00-00', '16:03:00', '00:00:00', 'CELEC', 'RETIRAR CHEQUES', 'GUANGOPOLO DE 3 A 5 PM ', '2012-04-19', 'T', '', 51, 'Anita Paucar', 'T'),
(336, 0, 4, '2012-04-20', '0000-00-00', '17:07:00', '00:00:00', 'PROAÑO', 'RETIRAR DOCUMENTOS', 'RETIRAR TRAMITE Y LLEVARLO A ADUANA', '2012-04-19', 'M', '', 5, 'Maria Piedad', 'T'),
(337, 0, 9, '2012-04-20', '0000-00-00', '17:20:00', '00:00:00', 'GRAPHICSOURCE', 'ENTREGAR FACTURAS', 'ATT. MARGARITA ORTIZ', '2012-04-19', 'M', '', 51, 'Anita Paucar', 'T'),
(338, 0, 13, '2012-04-20', '0000-00-00', '08:54:00', '00:00:00', 'PICHINCHA', 'DEPOSITOS', 'DEPOSITOS (2) INMOPETROSA, NEURALOG', '2012-04-20', 'M', '', 52, 'Martha Marulanda', 'T'),
(339, 0, 5, '2012-04-20', '0000-00-00', '08:58:00', '00:00:00', 'PROAÑO', 'ENTREGAR FACTURAS', 'DK-301 Y 298<br />\n', '2012-04-20', 'M', '', 51, 'Anita Paucar', 'T'),
(340, 0, 7, '2012-04-20', '0000-00-00', '08:58:00', '00:00:00', 'CARGONET', 'ENTREGAR FACTURAS', 'ATT. JIMMY CADENA', '2012-04-20', 'M', '', 51, 'Anita Paucar', 'T'),
(341, 1, 6, '2012-04-20', '0000-00-00', '08:59:00', '00:00:00', 'MINISTERIO DE SALUD', 'ENTREGAR FACTURAS', 'ATT. LORENA CEVALLOS', '2012-04-20', 'T', '', 51, 'Anita Paucar', 'T'),
(342, 1, 5, '2012-04-20', '0000-00-00', '09:03:00', '00:00:00', 'ESCUELA ROBERTO ARREGUI', 'RETIRAR CEDULA Y PAPELETA ', 'DE DOÑA CECI', '2012-04-20', 'T', '', 51, 'Anita Paucar', 'T'),
(343, 0, 10, '2012-04-20', '0000-00-00', '09:05:00', '00:00:00', '|SUPERINTENDENCIA DE COMPAÑIAS', 'ENTREGAR DOCUMENTOS', 'DE DENKEL', '2012-04-20', 'M', '', 51, 'Anita Paucar', 'T'),
(344, 0, 8, '2012-04-20', '0000-00-00', '09:06:00', '00:00:00', 'ADUANA QUITO ', 'INGRESAR TRÁMITE ', 'cliente arquilight ingresar trámite', '2012-04-20', 'M', '', 43, 'Karla Jacome', 'T'),
(345, 0, 12, '2012-04-20', '0000-00-00', '09:22:00', '00:00:00', 'SUPERINTENDENCIA  COMPAÑIAS', 'ENTREGAR INFORME', 'ENTREGAR INFORME FINANCIERO 2011', '2012-04-20', 'M', '', 52, 'Martha Marulanda', 'T'),
(347, 1, 5, '2012-04-20', '0000-00-00', '11:31:00', '00:00:00', 'REFINACION', 'RETIRO DE DAVS', 'CON PATRICIO ZAMBRANO, PREGUNTAR A MARISOL SI TIENE ALGO ', '2012-04-20', 'T', '', 5, 'Maria Piedad', 'T'),
(348, 1, 10, '2012-04-20', '0000-00-00', '11:33:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'RETEIRO DAV', 'RETIRAR DAV CON NATALIA COBA', '2012-04-20', 'T', '', 5, 'Maria Piedad', 'T'),
(349, 1, 11, '2012-04-20', '0000-00-00', '12:10:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'RETIRO DE DAV', 'FAVOR RETIRAR DAVS', '2012-04-20', 'T', '', 53, 'Lorena Morales', 'T'),
(350, 1, 3, '2012-04-20', '0000-00-00', '12:19:00', '00:00:00', 'TRANSOCEANICA', 'RETIRAR FACTURAS', 'ACERCARSE A CAJA Y RETIRAR FACTURAS PARA DENKEL SERVICE', '2012-04-20', 'T', '', 5, 'Maria Piedad', 'T'),
(351, 1, 4, '2012-04-20', '0000-00-00', '13:16:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGAR TRAMITE', 'TRAMITE DEL SR CAJAMARCA<br />\n', '2012-04-20', 'T', '', 53, 'Lorena Morales', 'T'),
(352, 1, 9, '2012-04-20', '0000-00-00', '13:19:00', '00:00:00', 'EXPLORACION Y PRODUCCION', 'ENTREGAR ', 'FACTURAS', '2012-04-20', 'T', '', 51, 'Anita Paucar', 'T'),
(353, 1, 7, '2012-04-20', '0000-00-00', '13:20:00', '00:00:00', 'REFINACION', 'ENTREGAR FACTURAS', 'VARIAS', '2012-04-20', 'T', '', 51, 'Anita Paucar', 'T'),
(354, 1, 8, '2012-04-20', '0000-00-00', '13:21:00', '00:00:00', 'ABASTECIMIENTOS', 'ENTREGA FACTURAS', 'ATT. DIEGO SALAS', '2012-04-20', 'T', '', 51, 'Anita Paucar', 'T'),
(355, 1, 2, '2012-04-20', '0000-00-00', '13:29:00', '00:00:00', 'MSP', 'RETIRAR DOCUMENTOS', 'RETIRAR DOCUMENTOS', '2012-04-20', 'T', '', 44, 'Paola Paredes', 'P'),
(356, 1, 6, '2012-04-20', '0000-00-00', '13:39:00', '00:00:00', 'GERENCIA DE GAS', 'ENTREGA FACTURAS', 'RENATO VEGA', '2012-04-20', 'T', '', 51, 'Anita Paucar', 'T'),
(357, 1, 13, '2012-04-23', '0000-00-00', '17:31:00', '00:00:00', 'SK ENGINEERING', 'ENTREGAR FACTURAS', 'ATT. HANA LEE', '2012-04-20', 'T', '', 51, 'Anita Paucar', 'T'),
(358, 0, 9, '2012-05-09', '0000-00-00', '17:31:00', '08:44:00', 'SETEC', 'ENTREGAR DOCUMENTOS', 'SOLICITUD DE CLAVE', '2012-04-20', 'M', '', 51, 'Anita Paucar', 'T'),
(359, 1, 16, '2012-04-23', '0000-00-00', '17:31:00', '00:00:00', 'MODALTRADE', 'RETIRO DE DOCUMENTOS ', 'RETIRAR TRAMITES', '2012-04-20', 'T', '', 5, 'Maria Piedad', 'T'),
(360, 0, 15, '2012-04-23', '0000-00-00', '17:35:00', '00:00:00', 'GEMAR ', 'ENTREGA CARTA DK 320', 'SR ABRHAN CISNEROS ', '2012-04-20', 'M', '', 43, 'Karla Jacome', 'T'),
(361, 0, 3, '2012-04-23', '0000-00-00', '11:32:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'ENTREGAR CARTA', 'ENTREGAR CARTA A ANDRES Y RETIRAR DOCUMENTOS CON JOHANA', '2012-04-21', 'M', '', 5, 'Maria Piedad', 'T'),
(362, 0, 7, '2012-04-23', '0000-00-00', '08:52:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'ENTREGA DE COMPROBANTES', 'FAVOR ENTREGSR AL SR ANDRES MENA', '2012-04-23', 'M', '', 53, 'Lorena Morales', 'T'),
(363, 0, 13, '2012-04-23', '0000-00-00', '09:10:00', '00:00:00', 'ADUANA QUITO ', 'DEJAR TRAMITE ADUANA ', 'PARA JUAN LUIS TRAMITE <br />\n1 SISTEMA DE AGUA POTABLE<br />\n2 TERRACON ', '2012-04-23', 'M', '', 43, 'Karla Jacome', 'T'),
(364, 1, 1, '2012-04-23', '0000-00-00', '09:11:00', '00:00:00', 'AZULEC ', 'RETIRAR ALCASNCE DE POLIZA ', 'ESTO TE CONFIRMARE NTES DE QUE VAYAS  CON MORAYMA ARIAS ', '2012-04-23', 'T', '', 43, 'Karla Jacome', 'T'),
(365, 0, 12, '2012-04-23', '0000-00-00', '09:13:00', '00:00:00', 'OFICINA ADUANA', 'ENREGAR TRAMITE DE TRAUMA', 'ENTREGAR A JUAN LUIS PAEA SER INGRESADO', '2012-04-23', 'M', '', 53, 'Lorena Morales', 'T'),
(366, 0, 11, '2012-04-24', '0000-00-00', '09:23:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'DEPOSITO CHEQUE EXPRESITO CARGA', '2012-04-23', 'M', '', 52, 'Martha Marulanda', 'T'),
(367, 1, 6, '2012-04-23', '0000-00-00', '11:54:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGA DE TRAMITE', 'FAVOR ENTREGAR A JUAN LUIS PARA SER INGRESADO', '2012-04-23', 'T', '', 53, 'Lorena Morales', 'T'),
(383, 0, 1, '2012-04-24', '0000-00-00', '09:14:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'RETIRAR CHEQUE', 'URGENTE', '2012-04-24', 'M', '', 53, 'Lorena Morales', 'T'),
(368, 1, 8, '2012-04-23', '0000-00-00', '12:27:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV', 'FAVRO RETIRAR DAV FIRMADA', '2012-04-23', 'T', '', 53, 'Lorena Morales', 'T'),
(369, 1, 4, '2012-04-23', '0000-00-00', '12:49:00', '00:00:00', 'TAMPA ', 'RETIRO DE GUIA ', 'RETIRAR GUIA Nº 729-87380075 ', '2012-04-23', 'T', '', 43, 'Karla Jacome', 'T'),
(370, 2, 10, '2012-04-23', '0000-00-00', '12:50:00', '00:00:00', 'REFINACION', 'RETIRAR DAV', 'RETIRAR DAV CON MARISOL ANDRADE', '2012-04-23', 'T', '', 44, 'Paola Paredes', 'T'),
(371, 0, 1, '2012-04-24', '0000-00-00', '12:54:00', '00:00:00', 'MINISTERIO DE SALUD', 'RETIRAR CARTA DE AUTORIZAACION', 'FAVOR RETIRAR 3 AUTORIZACIONES PARA RETIRO DE GUIA, YA ESTAN LISTAS Y FRIMADAS PREGUNTAR POR EVELYN ROBAYO', '2012-04-23', 'M', '', 53, 'Lorena Morales', 'T'),
(372, 1, 9, '2012-04-23', '0000-00-00', '13:12:00', '00:00:00', 'INTERNACIONAL', 'PAGO IMPUESTO', 'A LA RENTA CON CHEQUE', '2012-04-23', 'T', '', 51, 'Anita Paucar', 'T'),
(373, 1, 2, '2012-04-23', '0000-00-00', '13:15:00', '00:00:00', 'CELEC EP ', 'RETIRA CHEQUES', 'RETIRAR DE 1 A 4 PM', '2012-04-23', 'T', '', 44, 'Paola Paredes', 'T'),
(374, 0, 3, '2012-04-24', '0000-00-00', '16:49:00', '00:00:00', 'OFICINA ADUANA', 'TRAMITE DE KARLA ', 'FAVOR ENTREGAR PARA SER INGRESADO', '2012-04-23', 'M', '', 53, 'Lorena Morales', 'T'),
(375, 0, 9, '2012-04-24', '0000-00-00', '16:50:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE FACTURAS', 'FAVOR ENTREGAR RECIBIDO A LORENA', '2012-04-23', 'M', '', 53, 'Lorena Morales', 'T'),
(376, 0, 4, '2012-04-23', '0000-00-00', '17:38:00', '00:00:00', 'MINISTERIO DE SALUD', 'RETIRAR CARTA DE AUTORIZAACION', 'URGENTE<br />\n', '2012-04-23', 'N', '', 53, 'Lorena Morales', 'P'),
(377, 0, 11, '2012-04-24', '0000-00-00', '08:54:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'DEPOSITO CHEQUE CELEC', '2012-04-24', 'M', '', 52, 'Martha Marulanda', 'T'),
(378, 0, 8, '2012-04-24', '0000-00-00', '08:56:00', '00:00:00', 'PRODUBANCO', 'ORDEN DE CHEQUERA', 'ENTREGAR SOLICITUD DE CHEQUERA', '2012-04-24', 'M', '', 52, 'Martha Marulanda', 'T'),
(379, 0, 15, '2012-04-24', '0000-00-00', '08:57:00', '00:00:00', 'PRODUBANCO', 'PAGO IMPUESTOS', 'PAGAR LOS IMPUESTOS MES DE MARZO -2012', '2012-04-24', 'M', '', 52, 'Martha Marulanda', 'T'),
(380, 0, 12, '2012-04-24', '0000-00-00', '08:58:00', '00:00:00', 'BANCO INTERNACIONAL', 'DEPOSITO', 'DEPOSITAR CHEUQE REYBEC', '2012-04-24', 'M', '', 52, 'Martha Marulanda', 'T'),
(381, 0, 7, '2012-04-24', '0000-00-00', '08:58:00', '00:00:00', 'GRAPHICSOURCE', 'ENTREGA FACTURA', 'ATT. MARGARITA ORTIZ', '2012-04-24', 'M', '', 51, 'Anita Paucar', 'T'),
(382, 0, 20, '2012-04-24', '0000-00-00', '08:59:00', '00:00:00', 'SERVIPAGOS', 'PAGO PLANILLA', 'IESS-PERSONAL', '2012-04-24', 'M', '', 51, 'Anita Paucar', 'T'),
(384, 0, 5, '2012-04-24', '0000-00-00', '09:21:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGAR CHEQUE DE TRAUMA', 'FAVOR ENTREGAR CHEQUE DE TRAUMA PARA PAGO DE LIQUIDACION', '2012-04-24', 'M', '', 53, 'Lorena Morales', 'T'),
(385, 1, 3, '2012-04-24', '0000-00-00', '09:53:00', '00:00:00', 'CARGONET', 'ENTREGA FACTURAS', 'ATT. JIMMY CADENA', '2012-04-24', 'T', '', 51, 'Anita Paucar', 'T'),
(386, 1, 2, '2012-04-24', '0000-00-00', '10:01:00', '00:00:00', 'SK ENGINEERING', 'ENTREGA FACTURAS', 'ATT. HANA LEE', '2012-04-24', 'T', '', 51, 'Anita Paucar', 'T'),
(387, 1, 1, '2012-04-24', '0000-00-00', '10:39:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'RETIRO DE DOCUMENTOS', 'CON ANDRES MENA ', '2012-04-24', 'T', '', 5, 'Maria Piedad', 'T'),
(388, 0, 3, '2012-04-25', '0000-00-00', '11:37:00', '13:26:00', 'SRI', 'SOLICITAR EL PAGO', 'IMPUESTO A LA RENTA SELLADO. LLEVAR COMPROBANTES DE PAGO.', '2012-04-24', 'M', '', 51, 'Anita Paucar', 'T'),
(389, 0, 4, '2012-04-25', '0000-00-00', '11:37:00', '13:23:00', 'INCOP', 'INGRESO DE PAPELES', 'INGRESAR PARA ACTUALIZAR RUP HOY', '2012-04-24', 'M', '', 5, 'Maria Piedad', 'T'),
(390, 1, 6, '2012-04-24', '0000-00-00', '12:28:00', '00:00:00', 'SORCIAIR', 'RETIRAR GUIA', 'DE IMPEXAZUL Y ENTREGAR A JUAN LUIS PARA EL INGRESO DEL TRAMITE.', '2012-04-24', 'T', '', 51, 'Anita Paucar', 'T'),
(391, 1, 8, '2012-04-24', '0000-00-00', '12:29:00', '00:00:00', 'S.J. JERSEY ', 'ENTREGAR  FACTURAS', 'DK-314', '2012-04-24', 'T', '', 51, 'Anita Paucar', 'T'),
(392, 1, 10, '2012-04-24', '0000-00-00', '12:35:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'RETIRAR CHEQUE ', 'FACVOR RETIORA CHEQEU POR 146 PARA  PAGO DE MULTA Y LLEVARLO A ADUANA JUNTO CON EL CHUQUE QUE FUE RETIRADO EN LA MAÑANA', '2012-04-24', 'T', '', 53, 'Lorena Morales', 'T'),
(393, 1, 1, '2012-04-25', '0000-00-00', '13:12:00', '13:52:00', 'KLM Y MARTIN AIR', 'RETIRO DE GUIA', 'FAVOR RETIRAR GUIAS ', '2012-04-24', 'T', '', 53, 'Lorena Morales', 'T'),
(394, 0, 8, '2012-04-25', '0000-00-00', '13:25:00', '13:26:00', 'ADUANA', 'ENTREGA CHEQUES FIRMADOS', 'ATT. JUAN LUIS MIÑO', '2012-04-24', 'M', '', 51, 'Anita Paucar', 'T'),
(395, 1, 9, '2012-04-24', '0000-00-00', '13:39:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'ENTREGA FACTURAS', 'DEVUELTAS CON SOPORTES', '2012-04-24', 'T', '', 51, 'Anita Paucar', 'T'),
(396, 1, 2, '2012-04-25', '0000-00-00', '17:25:00', '13:52:00', 'SK ENGINEERING', 'ENTREGA FACTURAS', 'ATT. HANA LEE', '2012-04-24', 'T', '', 51, 'Anita Paucar', 'T'),
(397, 0, 6, '2012-04-25', '0000-00-00', '17:34:00', '13:23:00', 'DOLMAR', 'RETIRO DE GUIA', 'favor retirar guia adjunto carta y copia de guia', '2012-04-24', 'M', '', 53, 'Lorena Morales', 'T'),
(398, 0, 7, '2012-04-25', '0000-00-00', '17:37:00', '13:26:00', 'COPIAS LLAVERO ADUANA', 'SACAR 1 JUEGO', 'GG', '2012-04-24', 'M', '', 51, 'Anita Paucar', 'T'),
(402, 0, 2, '2012-04-25', '0000-00-00', '09:28:00', '13:24:00', 'PROAÑO REPRESENTACIONES', 'RETIRAR DOCUMENTOS', 'FAVOR RETIRAR POLIZA Y NOTA DE PEDIDO', '2012-04-25', 'M', '', 53, 'Lorena Morales', 'T'),
(400, 0, 11, '2012-04-25', '0000-00-00', '08:39:00', '13:22:00', 'BANCO INTERNACIONAL', 'DEPOSITOS  (2)', 'DEPOSITAR CHEQUES DE PROAÑO, CARGONET', '2012-04-25', 'M', '', 52, 'Martha Marulanda', 'T'),
(401, 0, 9, '2012-04-25', '0000-00-00', '09:08:00', '13:26:00', 'ADUANA', 'ENTREGAR DCTOS', 'DE CREDENCIAL A DIANA', '2012-04-25', 'M', '', 51, 'Anita Paucar', 'T'),
(403, 1, 1, '2012-04-25', '0000-00-00', '09:34:00', '16:56:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV', 'FAVOR RETIRAR DAVS EN LA MAÑANA', '2012-04-25', 'T', '', 53, 'Lorena Morales', 'T'),
(404, 1, 3, '2012-04-25', '0000-00-00', '11:47:00', '16:56:00', 'SETEC', 'ENTREGA SOLICITUD', 'CLAVE ELECTRONICA', '2012-04-25', 'T', '', 51, 'Anita Paucar', 'T'),
(405, 1, 13, '2012-04-25', '0000-00-00', '13:01:00', '13:02:00', 'Prueba', 'Prueba', 'kuioiuui', '2012-04-25', 'T', '', 3, 'Willian Espinosa', 'T'),
(406, 1, 2, '2012-04-25', '0000-00-00', '13:53:00', '16:56:00', 'SK ENGINEERING', 'ENTREGAR FACTURAS', 'ENTREGAR FACTURTAS A HANNA', '2012-04-25', 'T', '', 44, 'Paola Paredes', 'T'),
(407, 0, 2, '2012-04-26', '0000-00-00', '14:53:00', '13:20:00', 'BOLIVARIANO', 'RETIRAR CHEQUE', 'CONFIRMADO', '2012-04-25', 'M', '', 51, 'Anita Paucar', 'T'),
(408, 0, 1, '2012-04-26', '0000-00-00', '14:54:00', '13:20:00', 'ADUANA', 'ENTREGAR ESTILETES', 'JUANCHO/DIANA', '2012-04-25', 'M', '', 51, 'Anita Paucar', 'T'),
(409, 0, 1, '2012-04-27', '0000-00-00', '14:58:00', '13:04:00', 'UPS CARGO', 'RETIRAR GUIA DE MSP', 'RETIRAR GUIA 40670706510 ARRIBO CONFIRMADO', '2012-04-25', 'M', '', 5, 'Maria Piedad', 'T'),
(410, 0, 1, '2012-04-26', '0000-00-00', '14:59:00', '13:20:00', 'KLM CARGO', 'RETIRAR GUIA', 'RETIRAR GUIA 074-7551-3071 CONFIRMADA ', '2012-04-25', 'M', '', 5, 'Maria Piedad', 'T'),
(418, 0, 1, '2012-04-26', '0000-00-00', '09:16:00', '13:20:00', 'ADUANA QUITO ', 'DEJAR TRAMITE ', 'ENTREGAR TRAMITE A JUAN LUIS DE BOOTS´N  BAGS ', '2012-04-26', 'M', '', 43, 'Karla Jacome', 'T'),
(411, 1, 4, '2012-04-26', '0000-00-00', '16:03:00', '16:52:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE FACTURA', 'FAVOR ENTREGAR A MARISOL ANDRADE ', '2012-04-25', 'T', '', 53, 'Lorena Morales', 'T'),
(412, 0, 1, '2012-04-26', '0000-00-00', '16:49:00', '13:20:00', 'MSP', 'ENTREGA DE POLIZAS', 'ENTREGA DE POLIZAS PARA FIRMA COORDINAR RETIRO', '2012-04-25', 'M', '', 5, 'Maria Piedad', 'T'),
(413, 0, 8, '2012-04-25', '0000-00-00', '17:01:00', '00:00:00', 'SK ENGINEERING ', 'RETIRAR DOCS ', 'FAVOR RETIRAR DOCS CON HANA :)', '2012-04-25', 'N', '', 43, 'Karla Jacome', 'P'),
(414, 0, 9, '2012-04-25', '0000-00-00', '17:24:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'RETIRAR DOCUMENTOS', 'CON JOHANNA GARZON', '2012-04-25', 'N', '', 53, 'Lorena Morales', 'P'),
(415, 0, 10, '2012-04-25', '0000-00-00', '17:25:00', '00:00:00', 'aduana', 'RETIRAR FACTURA FRIO Y ADJUNTAR A NUEVA FACTURA DE AZUL', 'SOLICITAR LA FACTURA DE IMPEXAZUL CORRESPONDIENTE AL TRAMITE DE LA NUEVA FACTURA SACAR UNA COPIA Y ADJUNTAR A L AFACTURA PARA ENTREGAR AL CLIENTE', '2012-04-25', 'N', '', 44, 'Paola Paredes', 'P'),
(416, 0, 1, '2012-04-26', '0000-00-00', '17:38:00', '13:20:00', 'PROAÑO REPRESENTACIONES', 'ENTREGA FACTURAS', '335-331', '2012-04-25', 'M', '', 51, 'Anita Paucar', 'T'),
(417, 1, 5, '2012-04-26', '0000-00-00', '17:38:00', '16:52:00', 'FLOWSEAL', 'ENTREGAR FACTURAS', '350', '2012-04-25', 'T', '', 51, 'Anita Paucar', 'T'),
(419, 1, 2, '2012-04-26', '0000-00-00', '09:32:00', '16:52:00', 'AZUL', 'ENTREGAR FATURA', 'RETIRAR FACTURA DE FRIO EN ADUANA Y ADJUNTAR A LA FACTURA  DE IMPEXAZUL Nº 11354 FAVOR TRAER COPIA RECIBIDA DE LA FACTURA', '2012-04-26', 'T', '', 44, 'Paola Paredes', 'T'),
(420, 1, 2, '2012-04-26', '0000-00-00', '09:39:00', '13:36:00', 'GRAPHICSOURSE', 'ENTREGA DE COMPROBANTE', 'FAVOR ENTREGAR COMPROBANTES DE RETENCION', '2012-04-26', 'T', '', 53, 'Lorena Morales', 'T'),
(421, 1, 6, '2012-04-26', '0000-00-00', '12:29:00', '16:52:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV', 'FAVOR RETIRAD DAVS CON MARISOL ANDRADE', '2012-04-26', 'T', '', 53, 'Lorena Morales', 'T'),
(422, 1, 7, '2012-04-26', '0000-00-00', '13:16:00', '16:52:00', 'PRODUBANCO', 'DEPOSITOS (2)', 'DEPOSITAR CHQUES SHIA ASIA ', '2012-04-26', 'T', '', 52, 'Martha Marulanda', 'T'),
(423, 1, 3, '2012-04-26', '0000-00-00', '13:32:00', '16:52:00', 'GEMAR ', 'ENTREGAR CARTA ', 'ENTERGAR AL SR. ABRHAN CISNEROS ', '2012-04-26', 'T', '', 43, 'Karla Jacome', 'T'),
(424, 1, 1, '2012-04-26', '0000-00-00', '00:00:00', '23:45:00', 'UPS', 'RETIRO DE GUIA', 'ADJUNTO 5.60 POR DIFERENCIA GUIA MIN DE SALUD', '2012-04-26', 'T', '', 53, 'Lorena Morales', 'P'),
(425, 0, 1, '2012-04-26', '0000-00-00', '20:16:00', '23:37:00', 'b', 'sdfg', 'sdfgsdfg', '2012-04-26', 'M', 'porque si', 3, 'Willian Espinosa', 'C'),
(426, 1, 2, '2012-04-26', '0000-00-00', '22:30:00', '22:32:00', 'wewertwertwertw', 'wertwertwertwertwertwertwert', 'ewrtwertwertwertwertwert', '2012-04-26', 'T', '', 3, 'Willian Espinosa', 'T'),
(427, 1, 2, '2012-04-27', '0000-00-00', '23:48:00', '00:04:00', 'Alejandro', 'Retirar Documentos Legales', 'saasfasdfasdfasdf', '2012-04-26', 'T', '', 3, 'Willian Espinosa', 'C'),
(428, 0, 3, '2012-04-27', '0000-00-00', '08:47:00', '13:04:00', 'MINISTERIO DE SALUD', 'ENTREGA DE DOCUMENTOS ', 'FAVOR RETIRAR POLIZAS ORIGINALES', '2012-04-27', 'M', '', 53, 'Lorena Morales', 'T'),
(429, 0, 7, '2012-04-27', '0000-00-00', '09:02:00', '13:04:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV', 'FAVOR RETIRAR DAVS FIRMADAS', '2012-04-27', 'M', '', 53, 'Lorena Morales', 'T'),
(430, 0, 8, '2012-04-27', '0000-00-00', '09:03:00', '13:04:00', 'BANCO DEL AUSTRO', 'PAGO ', 'ENVIO CHEQUE DE $342', '2012-04-27', 'M', '', 51, 'Anita Paucar', 'T'),
(431, 0, 5, '2012-04-27', '0000-00-00', '09:04:00', '09:04:00', 'yop', 'yop', 'yop', '2012-04-27', 'M', 'prueva', 44, 'Paola Paredes', 'C'),
(432, 1, 4, '2012-04-27', '0000-00-00', '09:10:00', '09:13:00', 'AEROGAL', 'RETIRAR VALIJA', 'RETIRAR VALIJA DE GYE Nºguía 475813 a nombre de Eduardo Rosado Y /o DENKEL', '2012-04-27', 'T', 'ROY VA A RETIRAR LA VALIJA', 44, 'Paola Paredes', 'C'),
(433, 1, 2, '2012-04-27', '0000-00-00', '09:13:00', '17:17:00', 'PRODUBANCO', 'FACTURAS LEASING', 'PRODUBANCO TRAER FACTURAS LEASING', '2012-04-27', 'T', '', 52, 'Martha Marulanda', 'T'),
(434, 0, 5, '2012-04-27', '0000-00-00', '09:16:00', '13:04:00', 'OFICINA ADUANA', 'ENTREGA DE TRAMITES', 'TRAMITES DE MINISTERIO DE SALUD Y REYBEC', '2012-04-27', 'M', '', 53, 'Lorena Morales', 'T'),
(435, 0, 10, '2012-04-27', '0000-00-00', '09:17:00', '13:05:00', 'MENTORING', 'PAGO CURSO', 'JERRY Y MA. PIEDAD, FAVOR SOLICITAR FACTURAS ORIGINALES.', '2012-04-27', 'M', '', 51, 'Anita Paucar', 'T'),
(436, 0, 2, '2012-04-27', '0000-00-00', '09:26:00', '13:04:00', 'PROAÑO REPRESENTACIONES', 'ENTRGA FACTURAS', 'dk-352-322', '2012-04-27', 'M', '', 51, 'Anita Paucar', 'T'),
(437, 1, 1, '2012-04-27', '0000-00-00', '09:54:00', '17:17:00', 'CARGONET', 'ENTRGA FACTURAS', 'ATT. JIMMY CADENA<br />\n', '2012-04-27', 'T', '', 51, 'Anita Paucar', 'T'),
(438, 1, 3, '2012-04-27', '0000-00-00', '11:28:00', '17:17:00', 'PRODUBANCO', 'CAMBIAR CHEQUE', 'CAJA CHICA 51.07', '2012-04-27', 'T', '', 51, 'Anita Paucar', 'T'),
(439, 0, 1, '2012-04-30', '0000-00-00', '16:38:00', '13:11:00', 'ADUANA QUITO ', 'DEJAR TRAMITE ', 'TRAMITE DK 369//JUAN LUIS MIÑO', '2012-04-27', 'M', '', 43, 'Karla Jacome', 'T'),
(440, 0, 3, '2012-04-30', '0000-00-00', '16:45:00', '13:11:00', 'TRAUMA ORTOPEDICS', 'ENTREGA FACTURAS', 'ATT. LAURA ESTRELLA', '2012-04-27', 'M', '', 51, 'Anita Paucar', 'T'),
(441, 0, 6, '2012-04-30', '0000-00-00', '16:56:00', '13:11:00', 'GRAPHICSOURCE', 'ENTREGA FACTURAS', 'ATT. MARGARITA ORTIZ', '2012-04-27', 'M', '', 51, 'Anita Paucar', 'T'),
(442, 1, 1, '2012-04-30', '0000-00-00', '16:58:00', '17:09:00', 'OCP', 'RETIRO GARANTIA', 'VENTANILLA CONTROL DE DOCUMENTOS', '2012-04-27', 'T', '', 51, 'Anita Paucar', 'T'),
(443, 1, 6, '2012-04-30', '0000-00-00', '17:14:00', '13:19:00', 'GLOBALNET', 'RETIRO DE GUIA', 'DIRECCION: CC LA Y AV AMERICA JUNTO A SKYNET<br />\nADJUNTO TRANSFERENCIA Y RTENCION', '2012-04-27', 'T', 'error en la direccion\r\n', 53, 'Lorena Morales', 'C'),
(444, 0, 9, '2012-04-27', '0000-00-00', '17:27:00', '00:00:00', 'MINISTERIO DE SALUD', 'ENTREGA DE DOCUMENTOS', 'URGENTE 8:00 AM', '2012-04-27', 'N', '', 53, 'Lorena Morales', 'P'),
(445, 0, 7, '2012-04-30', '0000-00-00', '08:50:00', '13:44:00', 'BANCO INTERNACIONAL', 'DEPOSITO', 'DEPOSITO CHEQUE SK-', '2012-04-30', 'M', '', 52, 'Martha Marulanda', 'T'),
(450, 1, 5, '2012-04-30', '0000-00-00', '10:58:00', '17:10:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE COMPROBANTES', 'FAVOR ENTREGAR Y RECIBIDO A LORENA', '2012-04-30', 'T', '', 53, 'Lorena Morales', 'T'),
(446, 0, 11, '2012-04-30', '0000-00-00', '09:10:00', '13:11:00', 'GRAPHICSOURSE', 'RETIRO DE DAV', 'RETIRAR DAV FIRMADAS POR MARGARITA ORTIZ DESPUES DE LAS 11:00', '2012-04-30', 'M', '', 53, 'Lorena Morales', 'T'),
(447, 0, 12, '2012-04-30', '0000-00-00', '09:11:00', '13:11:00', 'SJ JERSEY', 'RETIRO DE DAV', 'RETIRAR DAV FIRMADA ANDREA MOLINA', '2012-04-30', 'M', '', 53, 'Lorena Morales', 'T'),
(448, 1, 3, '2012-04-30', '0000-00-00', '09:15:00', '17:11:00', 'GERENCIA DE GAS', 'ENTREGA FACTURAS', 'ATT. RENATO VEGA', '2012-04-30', 'T', '', 51, 'Anita Paucar', 'T'),
(449, 0, 13, '2012-04-30', '0000-00-00', '09:18:00', '13:11:00', 'ADUANA QUITO ', 'TRAMITE PARA JUAN LUIS ', 'ARIAS ARRANGO', '2012-04-30', 'M', '', 43, 'Karla Jacome', 'T'),
(451, 0, 9, '2012-05-02', '0000-00-00', '10:59:00', '13:22:00', 'DOLMAR', 'RETIRO DE GUIA', 'FAVOR  RETIRAR GUIA A 27 6422 1736, ADJUNTO COPIA', '2012-04-30', 'M', '', 53, 'Lorena Morales', 'T'),
(452, 1, 4, '2012-04-30', '0000-00-00', '12:48:00', '17:11:00', 'PRODUCCION', 'ENTREGAR  FACTURA ', 'SR. LUIS LEMA ', '2012-04-30', 'T', '', 43, 'Karla Jacome', 'T'),
(453, 1, 6, '2012-05-02', '0000-00-00', '13:19:00', '08:44:00', 'GLOBALNET', 'RETIRO DE GUIA SK ', 'FAVOR RETIRAR EN OFICINA: AV LA PRENSA Y CRISTOBAL SANDOVAL OE319 CC LOS CRISTALES LOCAL 205', '2012-04-30', 'T', '', 53, 'Lorena Morales', 'T'),
(454, 0, 9, '2012-05-02', '0000-00-00', '14:08:00', '13:43:00', 'produbanco', 'retiro de chequera', 'tramitar la solicitud de chequera para gye<br />\n', '2012-04-30', 'M', '', 44, 'Paola Paredes', 'T'),
(455, 1, 1, '2012-04-30', '0000-00-00', '17:12:00', '17:13:00', 'aduana ', 'retirar factura', 'retirar factura i llevar a azul<br />\n', '2012-04-30', 'T', '', 44, 'Paola Paredes', 'T'),
(456, 1, 2, '2012-04-30', '0000-00-00', '17:13:00', '17:14:00', 'azul', 'entrega de facturas', 'entregar factura a morayma', '2012-04-30', 'T', '', 44, 'Paola Paredes', 'T'),
(457, 0, 4, '2012-05-02', '0000-00-00', '17:15:00', '13:20:00', 'MINISTERIO DE SALUD', 'RETIRAR DOCUMENTOS PARA SENAE', 'RETIRAR DOCUMENTOS Y LLEVARLOS A OFICINA ADUANA PARA COMPLETAR TRAMITE', '2012-04-30', 'M', '', 53, 'Lorena Morales', 'T'),
(458, 0, 1, '2012-05-02', '0000-00-00', '08:50:00', '13:20:00', 'AZULEC', 'ENTREGA FACTURA DE FRIOEXPORT ', 'ES URGENTE ENTREGAR A LA SRA. MORAYMA ARIAS ', '2012-05-02', 'M', '', 43, 'Karla Jacome', 'T'),
(459, 0, 5, '2012-05-02', '0000-00-00', '08:51:00', '13:42:00', 'aduana ', 'entrega de documentos ', 'entregar documentos del msp', '2012-05-02', 'M', '', 44, 'Paola Paredes', 'T'),
(460, 0, 10, '2012-05-02', '0000-00-00', '09:05:00', '13:43:00', 'PRODUBANCO', 'DEPOSITO', 'DEPOSITO CHEQUE SJ.JERSEY', '2012-05-02', 'M', '', 52, 'Martha Marulanda', 'T'),
(461, 0, 10, '2012-05-02', '0000-00-00', '09:07:00', '13:22:00', 'GERENCIA DE REFINACION', 'ENTREGA DE FACTURAS', 'ENTREGAR A MARISOL ANDRADE', '2012-05-02', 'M', '', 5, 'Maria Piedad', 'T'),
(462, 0, 8, '2012-05-02', '0000-00-00', '09:24:00', '13:42:00', 'GERENCIA DE GAS', 'ENTREGA FACTURAS', 'ATT. RENATO VEGA', '2012-05-02', 'M', '', 51, 'Anita Paucar', 'T'),
(463, 0, 12, '2012-05-02', '0000-00-00', '09:25:00', '13:22:00', 'EP PETROECUADOR/DEPTO FINANCIERO', 'ENTREGA OFICIO', 'ATT. ING PABLO MORENO COORDINADOR SENIOR DE GESTION FINANCIERA.', '2012-05-02', 'M', '', 51, 'Anita Paucar', 'T'),
(469, 0, 3, '2012-05-03', '0000-00-00', '13:09:00', '13:08:00', 'SENAE', 'TRAMITE DK 359', 'PRIMERO DEBERA PASAR RETIRANDO DAV DE MODALTRDE PARA QUE ESTE TRAMITE SE COMPLETE', '2012-05-02', 'M', '', 5, 'Maria Piedad', 'T'),
(464, 0, 14, '2012-05-02', '0000-00-00', '10:55:00', '13:22:00', 'ADUANA', 'ENTREGAR TRAMITE DE FLOWSEAL', 'ENTREGAR A JUAN LUIS', '2012-05-02', 'M', '', 5, 'Maria Piedad', 'T'),
(465, 0, 1, '2012-05-03', '0000-00-00', '11:40:00', '13:08:00', 'MODALTRADE', 'RETIRO DAV', 'COORDINAR CON RECEPCION EN MODALTRADE', '2012-05-02', 'M', '', 5, 'Maria Piedad', 'T'),
(466, 1, 1, '2012-05-02', '0000-00-00', '12:03:00', '16:45:00', 'MSP', 'ENTREGA DE RECIBOS', 'ENTREGAR RECIBOS A EVELYN O EUGENIA', '2012-05-02', 'T', '', 5, 'Maria Piedad', 'T'),
(467, 1, 2, '2012-05-02', '0000-00-00', '12:43:00', '16:45:00', 'PROAÑO REPRESENTACIONES', 'ENTREGA FACTURA CONTECON', 'ATT. JOHANNA GARZON DK-352', '2012-05-02', 'T', '', 51, 'Anita Paucar', 'T'),
(468, 1, 5, '2012-05-02', '0000-00-00', '12:47:00', '16:45:00', 'conecel', 'tramites', 'traer el sesgoce de factuacion de los tel fijos y desactivar el servicio de internet de un modem', '2012-05-02', 'T', '', 44, 'Paola Paredes', 'T'),
(470, 1, 4, '2012-05-02', '0000-00-00', '13:36:00', '16:44:00', 'ADUANA QUITO ', 'ENTREGAR TRAMITE ', 'DK 379<br />\n', '2012-05-02', 'T', '', 43, 'Karla Jacome', 'T'),
(471, 0, 5, '2012-05-03', '0000-00-00', '17:35:00', '13:06:00', 'DOLMAR', 'RETIRAR GUIA UA1204949MIA', 'PARA OFICINA', '2012-05-02', 'M', '', 5, 'Maria Piedad', 'T'),
(472, 0, 7, '2012-05-03', '0000-00-00', '08:52:00', '13:07:00', 'ESDINAMICO', 'LLEVAR CHEQUE', 'ENTREGAR CHEQUE CANCELACION FACTURA 23161', '2012-05-03', 'M', '', 52, 'Martha Marulanda', 'T'),
(473, 1, 7, '2012-05-03', '0000-00-00', '09:19:00', '17:20:00', 'conecel', 'realizar tramites', 'solicitar el sesgloce global de llamadas desde el 30 de marzo al 30 de abril y la anulacion del servicio de internet de un modem', '2012-05-03', 'T', '', 44, 'Paola Paredes', 'T'),
(474, 1, 11, '2012-05-03', '0000-00-00', '09:46:00', '17:20:00', 'TRAUMA ORTOPEDICS', 'ENTREGA FACTURAS', 'ATT. NATALIA COBA', '2012-05-03', 'T', '', 51, 'Anita Paucar', 'T'),
(475, 1, 3, '2012-05-03', '0000-00-00', '10:01:00', '17:19:00', 'UPS', 'RETIRAR GUIA MSP', 'RETIRAR GUIA MSP ENTREGAR RETENCION MSP', '2012-05-03', 'T', '', 5, 'Maria Piedad', 'T'),
(476, 1, 4, '2012-05-03', '0000-00-00', '10:02:00', '17:19:00', 'TACA', 'RETIRAR GUIA MSP', 'RETIRAR GUIA Y PRESENTAR RETENCION DENKEL', '2012-05-03', 'T', '', 5, 'Maria Piedad', 'T'),
(477, 1, 5, '2012-05-03', '0000-00-00', '11:14:00', '17:21:00', 'ADUANA QUITO ', 'TRAMITE', 'PARA JLUIS TRAMITE SR. PACHECO. ', '2012-05-03', 'T', '', 43, 'Karla Jacome', 'T'),
(478, 1, 1, '2012-05-03', '0000-00-00', '11:19:00', '17:19:00', 'PROAÑO REPRESENTACIONES', 'ENTREGA FACTURA', 'ATT. JOHANNA ', '2012-05-03', 'T', '', 51, 'Anita Paucar', 'T'),
(479, 1, 8, '2012-05-03', '0000-00-00', '11:38:00', '17:21:00', 'REFINACION', 'ENTREGA DE FACTURAS', '291-284-304-292<br />\n', '2012-05-03', 'T', '', 51, 'Anita Paucar', 'T'),
(480, 1, 13, '2012-05-03', '0000-00-00', '12:03:00', '17:21:00', 'SERVIENTREGA', 'PERSONAL', 'ENTREGAR SOBRE', '2012-05-03', 'T', '', 51, 'Anita Paucar', 'T'),
(481, 1, 2, '2012-05-03', '0000-00-00', '12:16:00', '17:21:00', 'SK ENGINEERING', 'RETIRO DAV', 'RETIRAR DAV CON HANNA A LAS 14:00 ', '2012-05-03', 'T', '', 5, 'Maria Piedad', 'T'),
(482, 1, 12, '2012-05-03', '0000-00-00', '12:26:00', '17:18:00', 'GRAPHIC SOURCE', 'RETIRO DE DOCUMENTOS', 'RETIRAR DOCUMENTOS 16:00', '2012-05-03', 'T', '', 5, 'Maria Piedad', 'T'),
(483, 1, 10, '2012-05-03', '0000-00-00', '12:36:00', '17:20:00', 'CELEC', 'ENTREGA CHEQUE,FACTURA', 'ATT. MA. BELEN SANCHEZ', '2012-05-03', 'T', '', 51, 'Anita Paucar', 'T'),
(484, 1, 6, '2012-05-03', '0000-00-00', '13:05:00', '17:21:00', 'ADUANA', 'ENTREGA ROL', 'DEVOLVER FIRMADO', '2012-05-03', 'T', '', 51, 'Anita Paucar', 'T'),
(485, 1, 9, '2012-05-03', '0000-00-00', '13:15:00', '17:21:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE FACTURA', 'ENTREGAR A MARISOL ANDRADE RECIBIDO A LORENA', '2012-05-03', 'T', '', 53, 'Lorena Morales', 'T'),
(486, 1, 4, '2012-05-04', '0000-00-00', '16:56:00', '00:00:00', 'mission petroleum', 'retirar cheque', 'retirar cheque de 3 - 5 pm', '2012-05-03', 'T', '', 44, 'Paola Paredes', 'P'),
(487, 0, 5, '2012-05-04', '0000-00-00', '17:25:00', '13:12:00', 'MODALTRADE', 'RETIRAR CARGA', 'RETIRAR CARTA PARA SENAE', '2012-05-03', 'M', '', 5, 'Maria Piedad', 'T'),
(488, 0, 13, '2012-05-03', '0000-00-00', '17:34:00', '00:00:00', 'SENAE', 'ENTREGAR DOCUMENTOS', 'ENTREGAR A JUAN LUIS', '2012-05-03', 'N', '', 5, 'Maria Piedad', 'P'),
(489, 0, 10, '2012-05-04', '0000-00-00', '08:34:00', '13:12:00', 'PRODUBANCO', 'DEPOSITOS', 'DEPOSTIO (2) CHEQUES', '2012-05-04', 'M', '', 52, 'Martha Marulanda', 'T'),
(490, 0, 8, '2012-05-04', '0000-00-00', '08:51:00', '13:11:00', 'GRAPHIC SOURCE', 'RETIRO TRAMITE NUEVO', 'RETIRAR NUEVO TRAMITE', '2012-05-04', 'M', '', 5, 'Maria Piedad', 'T'),
(491, 0, 7, '2012-05-04', '0000-00-00', '08:54:00', '13:11:00', 'ADUANA QUITO ', 'ENTREGA TRAMITE', 'TRAMITE DE MALUENDA & BORJA + EL DK 392', '2012-05-04', 'M', '', 43, 'Karla Jacome', 'T'),
(492, 0, 11, '2012-05-04', '0000-00-00', '09:07:00', '13:12:00', 'trasportyes ecuador', 'retirar valija', 'retirar valija', '2012-05-04', 'M', '', 44, 'Paola Paredes', 'T'),
(493, 0, 12, '2012-05-04', '0000-00-00', '09:07:00', '13:12:00', 'CARLOS GARZON', 'ENTREGA FACTURAS', '2 TRAMITES', '2012-05-04', 'M', '', 51, 'Anita Paucar', 'T'),
(494, 0, 9, '2012-05-04', '0000-00-00', '09:08:00', '13:11:00', 'secap', 'inscripcion', 'incripcion curso ', '2012-05-04', 'M', '', 44, 'Paola Paredes', 'T'),
(495, 0, 2, '2012-05-04', '0000-00-00', '09:16:00', '13:12:00', 'MINISTERIO DE SALUD', 'RETIRAR POLIZAS', 'CON LORENA CEVALLOS O EVELYN ROBAYO DPTO ADMINISTRATIVO', '2012-05-04', 'M', '', 53, 'Lorena Morales', 'T'),
(496, 1, 3, '2012-05-04', '0000-00-00', '09:52:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'RETIRAR DAV FIRMADAS', 'FAVOR RETIRAR CON JOHANA GARZON', '2012-05-04', 'T', '', 53, 'Lorena Morales', 'P'),
(497, 1, 9, '2012-05-04', '0000-00-00', '10:37:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'DEPOSITO CHEQUE COMERCIO INTEGRAL AMERICANO', '2012-05-04', 'T', '', 52, 'Martha Marulanda', 'P'),
(498, 1, 5, '2012-05-04', '0000-00-00', '11:41:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGA DE TRAMITE', 'FAVRO ENTREGAR A JUAN LUIS TRAMITE PETROECUADOR PARA SER INGRESADO ', '2012-05-04', 'T', '', 53, 'Lorena Morales', 'P'),
(499, 1, 8, '2012-05-04', '0000-00-00', '12:11:00', '00:00:00', 'PRODUCCION', 'ENTREGA FACTURA', 'DK-323<br />\n', '2012-05-04', 'T', '', 51, 'Anita Paucar', 'P'),
(500, 1, 6, '2012-05-04', '0000-00-00', '12:12:00', '00:00:00', 'REFINACION', 'ENTREGA FACTURAS', 'VARIAS', '2012-05-04', 'T', '', 51, 'Anita Paucar', 'P'),
(501, 1, 1, '2012-05-04', '0000-00-00', '12:13:00', '13:50:00', 'LEVO', 'entrega factura', 'DK-82', '2012-05-04', 'T', '', 51, 'Anita Paucar', 'T'),
(502, 1, 7, '2012-05-04', '0000-00-00', '12:28:00', '00:00:00', 'GERENCIA DE GAS', 'ENTREGA FACTURAS', 'ATT. RENATO VEGA', '2012-05-04', 'T', '', 51, 'Anita Paucar', 'P'),
(503, 1, 1, '2012-05-04', '0000-00-00', '12:29:00', '00:00:00', 'MODALTRADE', 'ENTREGA FACTURAS', 'DK-360', '2012-05-04', 'T', '', 51, 'Anita Paucar', 'P'),
(504, 1, 2, '2012-05-04', '0000-00-00', '12:32:00', '00:00:00', 'SL ENGINNEERING', 'ENTREGA FACTURAS', 'TRANSPORTE VARIAS', '2012-05-04', 'T', '', 51, 'Anita Paucar', 'P'),
(505, 0, 3, '2012-05-04', '0000-00-00', '15:45:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGAR CHEQUE DE REYBEC', 'FAVOR ENTREGAR JUAN LUIS PARA PAGO', '2012-05-04', 'N', '', 53, 'Lorena Morales', 'P'),
(506, 0, 1, '2012-05-07', '0000-00-00', '15:54:00', '13:34:00', 'KLM CARGO ', 'RETIRAR GUIA ', 'RETIRAR GUIA ENVIO PAGO Y CARTA DE AUTORIZACIÓN KLM CARGO //DK 393', '2012-05-04', 'M', '', 43, 'Karla Jacome', 'T'),
(507, 0, 5, '2012-05-04', '0000-00-00', '15:55:00', '00:00:00', 'MARTINAIR CARGO ', 'RETIRAR GUIA ', 'RETIRAR GUIA ENVIO PAGO Y CARTA DE AUTORIZACIÓN MARTINAIR  CARGO <br />\nDK 394', '2012-05-04', 'N', '', 43, 'Karla Jacome', 'P'),
(508, 0, 2, '2012-05-07', '0000-00-00', '08:43:00', '13:34:00', 'MINISTERIO DE SALUD', 'RETIRAR POLIZA Y FACTURA', 'CON EVELYN ROBAYO<br />\n', '2012-05-07', 'M', '', 53, 'Lorena Morales', 'T'),
(509, 0, 3, '2012-05-07', '0000-00-00', '08:51:00', '13:34:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE COMPROBANTES Y FACTURA', 'ENTREGAR RECIBIDO LORENA', '2012-05-07', 'M', '', 53, 'Lorena Morales', 'T'),
(510, 2, 4, '2012-05-07', '0000-00-00', '09:14:00', '13:34:00', 'MARTINAIR CARGO ', 'RETIRAR GUIA ', 'RETIRAR GUIA ENVIO AUTORIZACIÓN Y PAGO ', '2012-05-07', 'T', '', 43, 'Karla Jacome', 'T'),
(511, 2, 5, '2012-05-07', '0000-00-00', '09:16:00', '13:34:00', 'PRODUABANCO', 'DEPOSITO', 'DEPOSITO CHEQUE DE MISSIONPETROLEUM', '2012-05-07', 'T', '', 52, 'Martha Marulanda', 'T'),
(512, 2, 6, '2012-05-07', '0000-00-00', '09:41:00', '13:34:00', 'SERVIPAGOS ', 'DEPOSITO', 'DEPOSITOP  A DON EDWIN', '2012-05-07', 'T', '', 3, 'Willian Espinosa', 'T'),
(513, 1, 1, '2012-05-07', '0000-00-00', '10:39:00', '16:52:00', 'CARGONET', 'ENTREGA FACTURAS', 'ATT. JIMMY CADENA', '2012-05-07', 'T', '', 51, 'Anita Paucar', 'T'),
(514, 1, 2, '2012-05-07', '0000-00-00', '10:39:00', '16:52:00', 'REFINACION', 'ENTREGA FACTURAS', 'VARIOS', '2012-05-07', 'T', '', 51, 'Anita Paucar', 'T'),
(515, 1, 3, '2012-05-07', '0000-00-00', '11:01:00', '16:53:00', 'LEVO', 'ENTREGA FACTURAS', 'CENTRO EJCUTIVO ESPACIO OF.212', '2012-05-07', 'T', '', 51, 'Anita Paucar', 'T'),
(516, 1, 4, '2012-05-07', '0000-00-00', '12:16:00', '16:53:00', 'AZUL', 'RETIRAR DAV Y FACTURA COMERCIAL ', 'FAVOR RETIRAR DAV DE DOS TRAMITES DK 393 Y DK 394 + LA FACTURA ORIGINAL DEL DK 394 ENTREGAR A JUAN LUIS JUNTO CON LOS TRÁMITES ', '2012-05-07', 'T', '', 43, 'Karla Jacome', 'T'),
(517, 1, 5, '2012-05-07', '0000-00-00', '12:17:00', '17:15:00', 'ADUANA QUITO ', 'ENTREGAR TRÁMITE ', 'DK 393 Y DK 394 IMPEXAZUL ', '2012-05-07', 'T', '', 43, 'Karla Jacome', 'T'),
(518, 1, 6, '2012-05-07', '0000-00-00', '12:18:00', '17:15:00', 'AZULEC', 'RETIRAR RETENCIONES', 'ATT. MORAYMA ARIAS', '2012-05-07', 'T', '', 51, 'Anita Paucar', 'T'),
(519, 1, 7, '2012-05-07', '0000-00-00', '13:34:00', '17:15:00', 'OFICINA ADUANA', 'ENTREGA DE TRAMITE', ' AJUAN LUIS PARA INGRESAR MSP', '2012-05-07', 'T', '', 53, 'Lorena Morales', 'T'),
(520, 0, 3, '2012-05-08', '0000-00-00', '16:41:00', '13:37:00', 'MINISTERIO DE SALUD', 'RETIRO DE POLIZA', 'RETIRAR POLIZA DPTO ADMINISTRATIVO<br />\n', '2012-05-07', 'M', '', 53, 'Lorena Morales', 'T'),
(521, 0, 6, '2012-05-08', '0000-00-00', '16:41:00', '13:37:00', 'TAMPA', 'RETIRO DE GUIA', 'DK 355', '2012-05-07', 'M', '', 53, 'Lorena Morales', 'T'),
(522, 1, 5, '2012-05-08', '0000-00-00', '17:19:00', '16:55:00', 'gerencia de abastesimientos', 'entregar oficio ', 'entregar oficio a richard chamba', '2012-05-07', 'T', '', 3, 'Willian Espinosa', 'T'),
(523, 0, 12, '2012-05-08', '0000-00-00', '17:20:00', '13:37:00', 'TRANSPORTE PANAMERICANA ', 'RETIRAR SOBRE ', 'EL SOBRE ESTA A NOMBRE DE KJ ENVIO CARTA DE AUTORIZACIÓN. <br />\n<br />\n', '2012-05-07', 'M', '', 43, 'Karla Jacome', 'T'),
(524, 1, 6, '2012-05-08', '0000-00-00', '17:21:00', '16:55:00', 'gerencia de abastesimientos', 'ENTREGAR Y RETIRAR DOCS ', 'IR DONDE DIEGO SALAS EN LA TARDE ARETIRAR DOCS Y DEJAR OFICIO DE KJ ', '2012-05-07', 'T', '', 43, 'Karla Jacome', 'T'),
(525, 0, 4, '2012-05-07', '0000-00-00', '17:25:00', '00:00:00', 'ADUANA', 'DEVOLUCION', 'REPORTE CAJA CHICA', '2012-05-07', 'N', '', 51, 'Anita Paucar', 'P'),
(526, 1, 2, '2012-05-08', '0000-00-00', '17:36:00', '00:00:00', 'SERVIPAGOS', 'PAGAR IESS', 'PAGO IESS DENKEL/DON EDWIN', '2012-05-07', 'T', '', 52, 'Martha Marulanda', 'P'),
(527, 0, 10, '2012-05-08', '0000-00-00', '08:43:00', '13:37:00', 'ADUANA', 'ENTREGA TRAMITE', 'HJ', '2012-05-08', 'M', '', 51, 'Anita Paucar', 'T'),
(528, 0, 9, '2012-05-08', '0000-00-00', '08:43:00', '13:37:00', 'DOLMAR', 'RETIRO DE GUIA, LLEVAR A  OFICINA ADUANA', 'FAVOR RETIRAR GUIA Y ENTREGARLA A JUAN LUIS PARA COMPLETAR DK 401 E INGRESARLO', '2012-05-08', 'M', '', 53, 'Lorena Morales', 'T'),
(529, 0, 11, '2012-05-08', '0000-00-00', '08:44:00', '13:37:00', 'ADUANA QUITO ', 'DEJAR TRAMITE ', 'TRAMITE INNOVATRONICA <br />\nSPINOTEX ', '2012-05-08', 'M', '', 43, 'Karla Jacome', 'T'),
(530, 1, 1, '2012-05-08', '0000-00-00', '08:58:00', '16:56:00', 'PROAÑO REPRESENTACIONES', 'ENTRETGA FACTURAS', 'DK-361<br />\n', '2012-05-08', 'T', '', 51, 'Anita Paucar', 'T'),
(531, 0, 4, '2012-05-08', '0000-00-00', '09:29:00', '13:26:00', 'IMPROLAB', 'ENTREGA FACTURAS', 'DK-367', '2012-05-08', 'M', '', 51, 'Anita Paucar', 'T'),
(532, 1, 10, '2012-05-08', '0000-00-00', '09:29:00', '16:59:00', 'FLOWSEAL', 'ENTREGA FACTURAS', 'DK-380', '2012-05-08', 'T', '', 51, 'Anita Paucar', 'T'),
(533, 0, 5, '2012-05-08', '0000-00-00', '09:30:00', '13:37:00', 'SK ENGINEERING', 'RETIRAR CHEQUE', 'RETIRAR CHEQUE CON HANNA', '2012-05-08', 'M', '', 53, 'Lorena Morales', 'T'),
(534, 1, 7, '2012-05-08', '0000-00-00', '09:30:00', '16:57:00', 'REFINACION', 'ENTREGA FACTURAS', 'DK332 Y 355', '2012-05-08', 'T', '', 51, 'Anita Paucar', 'T'),
(535, 1, 3, '2012-05-08', '0000-00-00', '10:53:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'DEPOSITO CHEQUES TRAUMA', '2012-05-08', 'T', '', 52, 'Martha Marulanda', 'P'),
(536, 1, 2, '2012-05-08', '0000-00-00', '13:00:00', '16:56:00', 'S.J. JERSEY ECUATORIANO', 'ENTREGA FACTURAS', 'DK-376', '2012-05-08', 'T', '', 51, 'Anita Paucar', 'T'),
(537, 1, 3, '2012-05-08', '0000-00-00', '13:10:00', '16:56:00', 'OFICINA ADUANA', 'ENTREGA DE TRAMITE', '2 TRAMITES PARA  SER INGRESADOS', '2012-05-08', 'T', '', 53, 'Lorena Morales', 'T'),
(538, 1, 1, '2012-05-08', '0000-00-00', '16:48:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'RETIRAR DAV FIRMADAS', 'CON NATALIA COBA', '2012-05-08', 'T', '', 53, 'Lorena Morales', 'P'),
(539, 0, 10, '2012-05-09', '0000-00-00', '16:58:00', '13:26:00', 'TRAUMA ORTOPEDICS', 'RETIRO DE DAV', 'CON NATALIA COBA', '2012-05-08', 'M', '', 53, 'Lorena Morales', 'T'),
(540, 0, 1, '2012-05-09', '0000-00-00', '16:59:00', '13:23:00', 'DOLMAR', 'RETIRO DE GUIA', 'RETIRAR  GUIA UA1204012ICN', '2012-05-08', 'M', '', 53, 'Lorena Morales', 'T'),
(541, 0, 7, '2012-05-09', '0000-00-00', '17:09:00', '17:24:00', 'CELEC', 'ENTREGA OFICIO', 'OFICINA QUITO', '2012-05-08', 'M', '', 51, 'Anita Paucar', 'T'),
(542, 0, 12, '2012-05-09', '0000-00-00', '17:10:00', '13:28:00', 'PRODUBANCO', 'ENTREGA SOLICITU', 'AGENCIA MATRIZ .ATT.  JUAN FRANCISCO RUIZ', '2012-05-08', 'M', '', 51, 'Anita Paucar', 'T'),
(543, 0, 13, '2012-05-09', '0000-00-00', '17:11:00', '13:28:00', 'PRODUBANCO', 'CAMBIO CHEQUE', 'CAJA CHICA', '2012-05-08', 'M', '', 51, 'Anita Paucar', 'T'),
(544, 0, 10, '2012-05-08', '0000-00-00', '17:39:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV', 'DAV FIRMADAS CON MARISOL', '2012-05-08', 'N', '', 53, 'Lorena Morales', 'P'),
(545, 0, 2, '2012-05-09', '0000-00-00', '17:40:00', '13:29:00', 'TAMPA', 'RETIRO DE GUIA', 'ADJUNTO TRANSFERENCIA', '2012-05-08', 'M', '', 53, 'Lorena Morales', 'T'),
(546, 0, 14, '2012-05-09', '0000-00-00', '08:31:00', '13:28:00', 'PRODUBANCO', 'DEPOSITO', 'DEPOSITO CHEQUES FLOWSEAL', '2012-05-09', 'M', '', 52, 'Martha Marulanda', 'T'),
(547, 0, 5, '2012-05-09', '0000-00-00', '08:42:00', '17:24:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV', 'RETIRARA DAV FIRMADAS', '2012-05-09', 'M', '', 53, 'Lorena Morales', 'T'),
(548, 0, 3, '2012-05-09', '0000-00-00', '08:56:00', '13:29:00', 'ADUANA QUITO', 'DEJAR TRAMITE ', 'TRAMITE ARQUILIGHT ', '2012-05-09', 'M', '', 43, 'Karla Jacome', 'T'),
(549, 0, 11, '2012-05-09', '0000-00-00', '08:59:00', '13:24:00', 'GRAPHICSOURCE', 'ENTREGA FACTURAS', 'DK-373', '2012-05-09', 'M', '', 51, 'Anita Paucar', 'T'),
(550, 0, 2, '2012-05-09', '0000-00-00', '09:00:00', '09:30:00', 'SK ENGINEERING', 'ENTREGA FACTURAS', 'ATT. HANA LEE', '2012-05-09', 'M', 'anita va a llevar personalmente', 51, 'Anita Paucar', 'C'),
(551, 0, 6, '2012-05-09', '0000-00-00', '09:02:00', '17:24:00', 'PRODUCCION', 'RETIRAR DOCS ', 'SR. LEMA ', '2012-05-09', 'M', '', 43, 'Karla Jacome', 'T'),
(552, 0, 1, '2012-05-09', '0000-00-00', '10:10:00', '13:42:00', 'MINISTERIO DE SALUD', 'RETIRO DE POLIZA', 'CON EUGENIA ALMEIDA, RETIRAR Y LLEVAR A ADUANA PARA ADJUNTAR A DK MINISTERIO', '2012-05-09', 'M', '', 53, 'Lorena Morales', 'T'),
(553, 0, 1, '2012-05-09', '0000-00-00', '12:48:00', '17:25:00', 'FRANCISCO SALGADO', 'LLEVAR CHEQUES (2)', 'ENTREGAR CHEQUES DE:<br />\nFRANCISCO SALGADO<br />\nWALTER HINOJOSA Y RECLAMAR DOCUMENTACION PENDIENTE', '2012-05-09', 'M', '', 52, 'Martha Marulanda', 'T'),
(554, 0, 1, '2012-05-10', '0000-00-00', '13:00:00', '13:33:00', 'DOLMAR', 'ENTREGAR PAGO', 'POR FAVOR FIRMAR RECPECION DE PAGO ', '2012-05-09', 'M', '', 5, 'Maria Piedad', 'T'),
(555, 0, 3, '2012-05-09', '0000-00-00', '13:35:00', '17:24:00', 'aduana', 'llevar tramite', 'n/a', '2012-05-09', 'M', '', 44, 'Paola Paredes', 'T'),
(556, 0, 2, '2012-05-09', '0000-00-00', '13:44:00', '17:24:00', 'banco internacional', 'enviar solicitudes', 'traer targeta', '2012-05-09', 'M', '', 44, 'Paola Paredes', 'T'),
(557, 1, 5, '2012-05-10', '0000-00-00', '08:49:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'DEPOSITO', '2012-05-10', 'T', '', 52, 'Martha Marulanda', 'P'),
(558, 0, 9, '2012-05-10', '0000-00-00', '08:53:00', '13:21:00', 'CORREOS DEL ECUADOR', 'ENVIAR SOBRE', 'ENVIAR SOBRE DE LF', '2012-05-10', 'M', '', 44, 'Paola Paredes', 'T'),
(559, 1, 1, '2012-05-10', '0000-00-00', '09:00:00', '00:00:00', 'SK ENGINEERING', 'ENTREGA FACTURAS', 'ATTT. HANA LEE', '2012-05-10', 'T', '', 51, 'Anita Paucar', 'P'),
(560, 0, 3, '2012-05-10', '0000-00-00', '09:07:00', '13:33:00', 'DHL', 'RETIRO DE FACTURA DHL', 'RETIRAR FACTURA PARA MSP DEL MINISTERIO DE SALUD', '2012-05-10', 'M', '', 5, 'Maria Piedad', 'T'),
(561, 1, 7, '2012-05-10', '0000-00-00', '09:17:00', '16:38:00', 'PRODUCCION', 'DEJAR FACTURAS DE BODEGA FERTISA ', 'SR. LEMA ', '2012-05-10', 'T', '', 43, 'Karla Jacome', 'T'),
(562, 1, 8, '2012-05-10', '0000-00-00', '09:19:00', '16:38:00', 'REFINACION ', 'DEJAR CHEQUE MAERSK ', 'PATRICIA TORRES ', '2012-05-10', 'T', '', 43, 'Karla Jacome', 'T'),
(563, 0, 4, '2012-05-10', '0000-00-00', '09:37:00', '13:17:00', 'PANAMERICANA', 'RETIRAR SOBRE ', 'RETIRAR SOBRE DK 354', '2012-05-10', 'M', '', 43, 'Karla Jacome', 'T'),
(564, 1, 6, '2012-05-10', '0000-00-00', '09:38:00', '16:38:00', 'banco internacional ', 'solicitud de clave', 'solicitud de clave', '2012-05-10', 'T', '', 44, 'Paola Paredes', 'T'),
(565, 0, 10, '2012-05-10', '0000-00-00', '09:45:00', '13:21:00', 'serimpe', 'retirar documentos', 'retirar documentos<br />\n', '2012-05-10', 'M', '', 44, 'Paola Paredes', 'T'),
(566, 1, 2, '2012-05-10', '0000-00-00', '10:51:00', '16:38:00', 'MIPRO ', 'ENTREGAR DOCUMENTACION', 'DE MIGUEL ANGEL ALVAREZ', '2012-05-10', 'T', '', 53, 'Lorena Morales', 'T'),
(567, 1, 10, '2012-05-10', '0000-00-00', '11:02:00', '00:00:00', 'GRAPHICSOURSE', 'RETIRAR CHEQUE', 'CON NATALIA<br />\n', '2012-05-10', 'T', '', 53, 'Lorena Morales', 'P'),
(568, 1, 3, '2012-05-10', '0000-00-00', '11:26:00', '16:39:00', 'RANCHO SAN FRANCISCO', 'ENTREGA CHEQUE', 'ATT, EDUARDO HIDALGO, FAVOR SOLICITAR FACTURA.', '2012-05-10', 'T', '', 51, 'Anita Paucar', 'T'),
(569, 1, 4, '2012-05-10', '0000-00-00', '12:05:00', '16:39:00', 'MISSIONPETROLEUM ', 'RETIRAR DAV ', 'CONTACTO PAOLA LUNA. <br />\nDAV DK 318', '2012-05-10', 'T', '', 43, 'Karla Jacome', 'T');
INSERT INTO `dnk_mensajeria_ant` (`id`, `columna`, `fila`, `fecha`, `fecha_crea`, `hora`, `hora_fin`, `cliente`, `actividad`, `observacion`, `programada`, `turno`, `obser_cancel`, `user_id`, `user_name`, `estado`) VALUES
(570, 1, 9, '2012-05-10', '0000-00-00', '12:23:00', '16:38:00', 'TRAUMA', 'RETIRO DE CHEQUE SENAE', 'CON NATALIA COBA RETIRAR Y LLEVAR A LA SENAE', '2012-05-10', 'T', '', 5, 'Maria Piedad', 'T'),
(571, 0, 1, '2012-05-11', '0000-00-00', '14:52:00', '13:25:00', 'GERENCIA DE DESARROLLO ORGANIZACIONAL ', 'RETIRAR DOCS ', 'DIEGO SALAS <br />\nGUIA Y MANIFIESTO ', '2012-05-10', 'M', '', 43, 'Karla Jacome', 'T'),
(572, 0, 11, '2012-05-10', '0000-00-00', '17:26:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV Y ENTREGA  DE FACTURA', 'ENTREGAR FACTURA Y PAGOS ADJUNTOS  , RECIBIDO A LORENA', '2012-05-10', 'N', '', 53, 'Lorena Morales', 'P'),
(573, 1, 2, '2012-05-11', '0000-00-00', '11:17:00', '00:00:00', 'SERIMPE', 'RETIRAR FACTURAS ORIGIALES', 'RETIRAR 2 FACTURAS Y ENTREGARLAS A JUAN  LUIS PARA SER INGRESADAS CONTRAMITE DK 386', '2012-05-11', 'T', '', 53, 'Lorena Morales', 'P'),
(574, 1, 6, '2012-05-11', '0000-00-00', '11:18:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGA DE  2 TRAMITES', 'ADJUNTAR FACTURA RETIRADA EN SERIMPE<br />\n', '2012-05-11', 'T', '', 53, 'Lorena Morales', 'P'),
(575, 1, 7, '2012-05-11', '0000-00-00', '11:58:00', '00:00:00', 'CONSKUMYI ', 'HACER FIRMAR DOCUMENTOS ', 'SR. KIM <br />\nEL CONDADO <br />\nCALLE D1 N73-73 <br />\nURBANIZACION EL CONDADO 1<br />\nDPTO.3<br />\nA TRES CUADRAS DEL REDONDEL EL CONDADO. ', '2012-05-11', 'T', '', 43, 'Karla Jacome', 'P'),
(576, 0, 4, '2012-05-11', '0000-00-00', '12:31:00', '13:24:00', 'LEVO ', 'ENTREGA FACTURAS', 'TRAER FACTURA ANULADA', '2012-05-11', 'M', '', 51, 'Anita Paucar', 'T'),
(577, 1, 8, '2012-05-11', '0000-00-00', '12:31:00', '00:00:00', 'SK ENGINEERING', 'ENTREGA FACTURAS', 'ATT. HANA LEE, FAVOR SOLICITAR CHEQUE DE PAGO', '2012-05-11', 'T', '', 51, 'Anita Paucar', 'P'),
(578, 1, 4, '2012-05-11', '0000-00-00', '12:32:00', '00:00:00', 'REFINACION', 'ENTREGA FACTURAS', 'ATT. TERESA YEPEZ', '2012-05-11', 'T', '', 51, 'Anita Paucar', 'P'),
(579, 1, 9, '2012-05-11', '0000-00-00', '12:57:00', '00:00:00', 'MINISTERIO DE SALUD', 'ENTREGA DE POLIZA', 'ENTRAGAR POLIZA A LORENA CEVALLOS<br />\n', '2012-05-11', 'T', '', 53, 'Lorena Morales', 'P'),
(580, 1, 10, '2012-05-11', '0000-00-00', '13:02:00', '00:00:00', 'DHL', 'RETIRO DE GUIA', 'GUIA DE MINSITERIO DE SALUD CON ABEL DELGADO', '2012-05-11', 'T', '', 53, 'Lorena Morales', 'P'),
(581, 1, 5, '2012-05-11', '0000-00-00', '13:23:00', '00:00:00', 'REFINACION', 'RETIRAR DAV', 'RETIRAR DAV Y LLEVAR A LA ADUANA <br />\n', '2012-05-11', 'T', '', 44, 'Paola Paredes', 'P'),
(582, 1, 1, '2012-05-11', '0000-00-00', '13:23:00', '00:00:00', 'PRODUBANCO', 'RETIRAR CLAVE MARTHA', 'PRIORIDAD', '2012-05-11', 'T', '', 44, 'Paola Paredes', 'P'),
(583, 1, 6, '2012-05-11', '0000-00-00', '14:32:00', '00:00:00', 'tame ', 'retirar valija', 'retirar valija de esmeraldas<br />\n', '2012-05-11', 'T', '', 44, 'Paola Paredes', 'P'),
(584, 0, 7, '2012-05-11', '0000-00-00', '16:17:00', '00:00:00', 'PRODUCCION', 'DEJAR DOCS ', 'SR. LEMA ', '2012-05-11', 'N', '', 43, 'Karla Jacome', 'P'),
(585, 0, 3, '2012-05-14', '0000-00-00', '08:50:00', '13:15:00', 'PRODUBANCO', 'DEPOSITO', 'DEPOSITO CHEQUES PROAÑO', '2012-05-14', 'M', '', 52, 'Martha Marulanda', 'T'),
(586, 0, 1, '2012-05-14', '0000-00-00', '08:54:00', '13:15:00', 'ADUANA QUITO ', 'ENTREGAR TRAMITES ', 'JUAN LUIS MIÑO TRAMITES DE INPLQUALITY Y TRAMITE MALUENDA ', '2012-05-14', 'M', '', 43, 'Karla Jacome', 'T'),
(587, 0, 2, '2012-05-14', '0000-00-00', '09:02:00', '13:15:00', 'MARTINAIR CARGO ', 'RETIRAR GUIA IMPEXAZUL ', 'ADJUNTO PAGO Y CARTA PARA RETIRO DE GUIA ', '2012-05-14', 'M', '', 43, 'Karla Jacome', 'T'),
(588, 0, 3, '2012-05-14', '0000-00-00', '09:26:00', '09:49:00', 'AZULEC ', 'RETIRAR DAV ', 'MORAYMA ARIAS<br />\n<br />\nANTES DE IR YO CONFRIMO PÒR RADIO  ', '2012-05-14', 'M', 'KARLITA VA A RETIRAR PERSONALMENTE', 43, 'Karla Jacome', 'C'),
(589, 0, 4, '2012-05-14', '0000-00-00', '09:48:00', '13:15:00', 'PRODUCCION', 'ENTREGAR DOCUMENTOS', 'ENTREGAR Y HACER FIRMAR RECIBIDO EN TODAS LAS HOJAS POR FAVOR ', '2012-05-14', 'M', '', 44, 'Paola Paredes', 'T'),
(590, 0, 5, '2012-05-14', '0000-00-00', '09:49:00', '13:15:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGAR RETENCIONES', 'VON MARISOL ANDRADE', '2012-05-14', 'M', '', 53, 'Lorena Morales', 'T'),
(591, 1, 1, '2012-05-14', '0000-00-00', '10:20:00', '17:34:00', 'MINISTERIO DE SALUD', 'RETIRARA TRAMITE', 'CON EUGENIA ALMEIDA DPTO ADMINISTRATIVO', '2012-05-14', 'T', '', 53, 'Lorena Morales', 'T'),
(592, 1, 7, '2012-05-14', '0000-00-00', '11:52:00', '17:34:00', 'produbanco ', 'retirar clave', 'retirar clave con juan francisco ruiz Cash Management en el edificio matriz', '2012-05-14', 'T', '', 44, 'Paola Paredes', 'T'),
(593, 1, 1, '2012-05-14', '0000-00-00', '12:11:00', '17:35:00', 'SERIMPE', 'RETIRAR CHEQUE', 'LLEVAR A OFICINA ADUANA', '2012-05-14', 'T', '', 53, 'Lorena Morales', 'T'),
(594, 1, 6, '2012-05-14', '0000-00-00', '12:14:00', '17:34:00', 'transportes ecuador', 'retirar valija', 'retirar valija de gye en transportes ecuador llevar credencial de denkel ', '2012-05-14', 'T', '', 44, 'Paola Paredes', 'T'),
(595, 1, 2, '2012-05-14', '0000-00-00', '12:15:00', '17:35:00', 'aduana ', 'entregar facturas y cheque de serimpe', 'retirar cheque en serimpe y entregar en la oficina de la aduana a juan luis', '2012-05-14', 'T', '', 44, 'Paola Paredes', 'T'),
(596, 1, 5, '2012-05-14', '0000-00-00', '12:16:00', '17:35:00', 'refinacion ', 'retirara documentos', 'retirar documentos  con marisol andrade', '2012-05-14', 'T', 'cancelado por operaciones', 44, 'Paola Paredes', 'C'),
(597, 1, 3, '2012-05-14', '0000-00-00', '13:14:00', '17:35:00', 'PROAÑO REPRESENTACIONES', 'ENTREGA FACTURAS', 'DK-388', '2012-05-14', 'T', '', 51, 'Anita Paucar', 'T'),
(598, 0, 1, '2012-05-15', '0000-00-00', '17:57:00', '16:23:00', 'retirar valija ', 'retirar valija por trasnportes ecuador', 'retirar valija por trasnportes ecuador', '2012-05-14', 'M', '', 44, 'Paola Paredes', 'T'),
(599, 0, 2, '2012-05-15', '0000-00-00', '18:18:00', '11:16:00', 'MIPRO', 'REGISTRO IMPORTADOR ', 'URGENTE REGISTRO MIPRO<br />\nPREGUNTAR DESPUES DE INGRESAR QUE SE DEBE HACER. ?? GRACIAS ', '2012-05-14', 'M', '', 43, 'Karla Jacome', 'T'),
(600, 0, 3, '2012-05-14', '0000-00-00', '18:22:00', '00:00:00', 'CUBANA DE AVIACION ', 'RETIRAR GUIA DE CELEC ', 'CUBANA DE AVIACION LLEVAR PAGO QUE SOLICITE EN EFECTIVO $33 + RETENCION Y + CARTA DE AUTORIZACIÓN ', '2012-05-14', 'N', '', 43, 'Karla Jacome', 'P'),
(601, 0, 1, '2012-05-15', '0000-00-00', '11:07:00', '16:54:00', 'PRODUBANCO', 'DEPOSITO', 'EFECTUAR DEPOSITO DE<br />\nSHI-ASIA', '2012-05-15', 'M', '', 52, 'Martha Marulanda', 'T'),
(602, 0, 5, '2012-05-15', '0000-00-00', '11:16:00', '16:24:00', 'ADUANA', 'ENTREGAR TRAMITES', 'N/A', '2012-05-15', 'M', '', 44, 'Paola Paredes', 'T'),
(603, 0, 2, '2012-05-15', '0000-00-00', '11:19:00', '16:54:00', ' CUBANA DE AVIACION ', 'RETIRAR GUIA ', 'RETIRO GUIA CELEC LLEVAR CARTA RTEENCION Y PAGO ', '2012-05-15', 'M', '', 43, 'Karla Jacome', 'T'),
(604, 0, 3, '2012-05-15', '0000-00-00', '11:26:00', '16:24:00', 'GERENCIA DE REFINACION', 'ENTREGAR DOCUMETO Y RETTRAR DAVS', 'ALPALLANA Y 6 DE DICIEMBRE EDIFICIO PLAZA LEVI CON MARIZOL ANDRADE', '2012-05-15', 'M', '', 44, 'Paola Paredes', 'T'),
(605, 0, 4, '2012-05-15', '0000-00-00', '11:27:00', '16:24:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE OFICIO Y RETIRAR DAV', 'HACER FIRMAR RECIBIDO, CON MARISOL ANDRADE<br />\n', '2012-05-15', 'M', '', 53, 'Lorena Morales', 'T'),
(606, 0, 3, '2012-05-16', '0000-00-00', '17:53:00', '00:00:00', 'ADUANA QUITO', 'INGRESAR TRAMITE ', 'DK 424 <br />\nINGRESRA JUAN LUIS ', '2012-05-15', 'M', '', 43, 'Karla Jacome', 'P'),
(607, 0, 1, '2012-05-16', '0000-00-00', '08:57:00', '12:33:00', 'PROAÑO REPRESENTACIONES', 'ENTREGA DE RETENCION Y RETIRAR DOCUMENTOS', 'CON JOHANNA GARZON', '2012-05-16', 'M', '', 53, 'Lorena Morales', 'T'),
(608, 0, 4, '2012-05-16', '0000-00-00', '09:01:00', '12:12:00', 'LEVO', 'ENTREGAR BL Y CARTA', 'Roberto Marcel<br />\n<br />\nCentro Ejecutivo Espacia<br />\nVia Interoceanica Km 10 1/2-Cumbaya<br />\nOficina # 212<br />\n', '2012-05-16', 'M', '', 53, 'Lorena Morales', 'T'),
(609, 0, 4, '2012-05-16', '0000-00-00', '09:21:00', '00:00:00', 'GERENCIA DE DESARROLLO', 'RETIRAR GUIA', 'RETIRAR GUIA CON DIEGO SALAS', '2012-05-16', 'M', '', 44, 'Paola Paredes', 'P'),
(610, 0, 2, '2012-05-16', '0000-00-00', '09:33:00', '00:00:00', 'KLM', 'RETIRAR GUIAS', 'URGENTE, ADJUNTO AUTORIZACION Y PAGO<br />\n', '2012-05-16', 'M', '', 53, 'Lorena Morales', 'P'),
(611, 0, 8, '2012-05-16', '0000-00-00', '09:52:00', '00:00:00', 'TRASNPORTES ECUADOR', 'RETIRAR VALIJA', 'RETIRAR VALIJA', '2012-05-16', 'M', '', 44, 'Paola Paredes', 'P'),
(612, 0, 6, '2012-05-16', '0000-00-00', '11:40:00', '00:00:00', 'REFINACION', 'ENTREGA FACTURAS', 'VARIOS', '2012-05-16', 'M', '', 51, 'Anita Paucar', 'P'),
(613, 0, 9, '2012-05-16', '0000-00-00', '11:42:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'ENTREGA FACTURAS', 'ATT. NATHALIA COBA', '2012-05-16', 'M', '', 51, 'Anita Paucar', 'P'),
(614, 0, 5, '2012-05-17', '0000-00-00', '11:46:00', '13:25:00', 'BOLIVARIANO', 'RETIRAR CHEQUE', 'A FAVOR DE DENKEL', '2012-05-16', 'M', 'ROY NO PUEDE RETIRAR CHEQUES', 51, 'Anita Paucar', 'C'),
(615, 0, 1, '2012-05-16', '0000-00-00', '12:30:00', '00:00:00', 'MINSITERIO DE SALUD', 'RETIRAR CARTA DE AUTORIZACION', 'PARA RETIRO DE GUIA DE DHL', '2012-05-16', 'M', '', 53, 'Lorena Morales', 'P'),
(616, 0, 5, '2012-05-16', '0000-00-00', '12:31:00', '00:00:00', 'DHL', 'RETIRAR GUIA', 'ADJUNTO CARTA DE AUTORIZACION', '2012-05-16', 'M', '', 53, 'Lorena Morales', 'P'),
(617, 0, 7, '2012-05-16', '0000-00-00', '12:38:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV', 'MARISOL ANDRADE', '2012-05-16', 'M', '', 53, 'Lorena Morales', 'P'),
(618, 0, 8, '0000-00-00', '0000-00-00', '12:57:00', '00:00:00', 'impexazul ', 'dejar facturas', 'entregar factura', '2012-05-16', 'N', '', 44, 'Paola Paredes', 'P'),
(619, 0, 2, '2012-05-17', '0000-00-00', '14:39:00', '10:43:00', 'GRAPHICSOURSE', 'RETIRAR DOCUMENTOS', 'FAVOR RETIRAR ANTES DE VENIR A LA OFICINA TRAMITE URGENTE<br />\n', '2012-05-16', 'M', '', 53, 'Lorena Morales', 'T'),
(620, 0, 1, '2012-05-17', '0000-00-00', '10:07:00', '13:24:00', 'IMPEXAZUL', 'ENTREGAR FACTURAS', 'ATT. MORAYMA ARIAS', '2012-05-17', 'M', '', 51, 'Anita Paucar', 'T'),
(621, 0, 2, '2012-05-17', '0000-00-00', '10:08:00', '13:24:00', 'CARGONET', 'ENTREGAR FACTURAS', 'ATT. JIMMY CADENA', '2012-05-17', 'M', '', 51, 'Anita Paucar', 'T'),
(622, 0, 4, '2012-05-17', '0000-00-00', '10:09:00', '13:24:00', 'DESARROLLO ORGANIZACIONAL', 'ENTREGA FACTURAS', 'ATT. DIEGO SALAS', '2012-05-17', 'M', '', 51, 'Anita Paucar', 'T'),
(623, 0, 3, '2012-05-17', '0000-00-00', '10:47:00', '13:24:00', 'PROAÑO REPRESENTACIONES', 'ENTREGA DE COMPROBANTE DE RETENCION', 'ENTREGAR FACTURA DK 361 ADJUNTA', '2012-05-17', 'M', '', 53, 'Lorena Morales', 'T'),
(624, 0, 4, '2012-05-17', '0000-00-00', '10:48:00', '13:24:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE COMPROBANTES ', 'FIRMAR RECIBIDO EN COPIAS', '2012-05-17', 'M', '', 53, 'Lorena Morales', 'T'),
(625, 0, 1, '2012-05-17', '0000-00-00', '11:36:00', '00:00:00', 'ADUANA  ', 'DEJAR TRAMITE ', 'INTERMEDIA ', '2012-05-17', 'M', '', 43, 'Karla Jacome', 'P'),
(626, 0, 2, '2012-05-17', '0000-00-00', '12:50:00', '00:00:00', 'FRANCISCO ALARCON', 'RETIRAR DAV', 'DK-434<br />\n', '2012-05-17', 'M', '', 51, 'Anita Paucar', 'P'),
(627, 0, 3, '2012-05-17', '0000-00-00', '13:50:00', '00:00:00', 'REFINACION', 'RETIAR DOCS', 'N/A', '2012-05-17', 'M', '', 44, 'Paola Paredes', 'P'),
(628, 0, 3, '2012-05-17', '0000-00-00', '13:50:00', '00:00:00', 'DESARROLLO ORG', 'ENTREGAR FACTURAS DIEGO SALAS', 'NO RECIBIDO EN LA MAÑANA', '2012-05-17', 'M', '', 44, 'Paola Paredes', 'P'),
(629, 0, 1, '2012-05-18', '0000-00-00', '18:25:00', '00:00:00', 'MINSITERIO DE SALUD', 'RETIRAR POLIZAS', 'dpto administrativo', '2012-05-17', 'M', '', 53, 'Lorena Morales', 'P'),
(630, 0, 2, '2012-05-18', '0000-00-00', '08:52:00', '09:26:00', 'DESARROLLO ORGANIZACIONAL', 'ENTREGAR FACTURAS', 'ENTREGAR FACTURAS CON DIEGO SALAS', '2012-05-18', 'M', 'ERROR', 44, 'Paola Paredes', 'C'),
(631, 0, 2, '2012-05-18', '0000-00-00', '09:24:00', '14:44:00', 'CONTINENTAL ', 'RETIRAR GUIA DE FRANCISCO ALARCON', 'LLEVAR CARTA DE AUTORIZACION + RETENCION+$11 EN EFECTIVO <br />\nES EN LA PRENSA Y RIO CURARAY', '2012-05-18', 'M', '', 43, 'Karla Jacome', 'T'),
(632, 0, 2, '2012-05-18', '0000-00-00', '09:27:00', '14:00:00', 'PREMIUN CORP', 'RETIRAR DAV', 'RETIRO CON ANDRES MENA', '2012-05-18', 'M', '', 5, 'Maria Piedad', 'T'),
(633, 0, 3, '2012-05-18', '0000-00-00', '09:27:00', '00:00:00', 'DESARROLLO ORG', 'ENTREGAR FACTURAS ', 'ENTREGAR A ROSARIO VILLEGAS', '2012-05-18', 'M', '', 44, 'Paola Paredes', 'P'),
(634, 0, 5, '2012-05-18', '0000-00-00', '09:48:00', '00:00:00', 'DOLMAR', 'RETIRO DE GUIA', 'RETIRAR GUIA AU1205003ICN DOLMAR DK 440', '2012-05-18', 'M', '', 5, 'Maria Piedad', 'P'),
(635, 0, 2, '2012-05-18', '0000-00-00', '14:00:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGA DE TRAMITE', 'PARA INGRESAR', '2012-05-18', 'M', '', 53, 'Lorena Morales', 'P'),
(636, 0, 4, '2012-05-18', '0000-00-00', '14:04:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE COMPROBANTES Y FACTURA', 'MARISOL ANDRADE', '2012-05-18', 'M', '', 53, 'Lorena Morales', 'P'),
(637, 1, 1, '2012-05-21', '0000-00-00', '08:57:00', '12:30:00', 'PRODUBANCO', 'DEPOSITO', 'DEPOSITO CHEQUES PROAÑO', '2012-05-21', 'T', '', 52, 'Martha Marulanda', 'T'),
(638, 1, 1, '2012-05-21', '0000-00-00', '09:16:00', '00:00:00', 'DOLMAR', 'RETIRO DE GUIA', 'ADJUNTO TRANSFERENCIA Y RETENCION', '2012-05-21', 'T', '', 53, 'Lorena Morales', 'P'),
(639, 1, 2, '2012-05-21', '0000-00-00', '11:28:00', '00:00:00', 'PICHINCHA', 'DEPOSITOS', 'DEPOSITOS CHEEQUE DE CELEC<br />\nC.INTEGRAL AMERICANO<br />\n', '2012-05-21', 'T', '', 52, 'Martha Marulanda', 'P'),
(640, 1, 3, '2012-05-21', '0000-00-00', '11:29:00', '00:00:00', 'PRODUBANCO/ PICHINCHA', 'RETIRAR FACTURAS LEASING', 'RETIRAR FACTURAS LEASING', '2012-05-21', 'T', '', 52, 'Martha Marulanda', 'P'),
(641, 1, 3, '2012-05-21', '0000-00-00', '13:19:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE COMPROBANTE', 'FIRMAR RECIBIDO EN COPIAS', '2012-05-21', 'T', '', 53, 'Lorena Morales', 'P'),
(642, 1, 4, '2012-05-22', '0000-00-00', '08:57:00', '17:07:00', 'PRODUCCION ', 'DEJAR CHEQUE ', 'SR. LEMA <br />\n', '2012-05-22', 'T', '', 43, 'Karla Jacome', 'T'),
(643, 1, 5, '2012-05-22', '0000-00-00', '09:20:00', '17:07:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV', 'CON MARISOL ANDRADE', '2012-05-22', 'T', '', 53, 'Lorena Morales', 'T'),
(644, 1, 1, '2012-05-22', '0000-00-00', '09:21:00', '17:07:00', 'cirsa', 'retirar facturas', 'retirar facturas con michelle romo', '2012-05-22', 'T', '', 44, 'Paola Paredes', 'T'),
(645, 1, 6, '2012-05-22', '0000-00-00', '09:22:00', '17:07:00', 'graficsource', 'retirar doicumerntos', 'retirar documentos', '2012-05-22', 'T', '', 44, 'Paola Paredes', 'T'),
(646, 0, 1, '2012-05-22', '0000-00-00', '09:36:00', '00:00:00', 'agencia nacional de trasnsito', 'consultar requisitos', 'AVERIGUAR CUALES SON LOS REQUISITOS PARA OBTENER UNA ACREDITACION COMO TRANSPORTE DE CARGA PELIGROSA QUIMICOS', '2012-05-22', 'M', '', 44, 'Paola Paredes', 'P'),
(647, 0, 6, '2012-05-22', '0000-00-00', '09:41:00', '13:33:00', 'INTERNACIONAL', 'PAGO AL EXTERIOR', '$15800', '2012-05-22', 'M', '', 51, 'Anita Paucar', 'T'),
(648, 0, 9, '2012-05-22', '0000-00-00', '09:43:00', '13:33:00', 'impexnet', 'entregar retenciones', 'n/a', '2012-05-22', 'M', '', 44, 'Paola Paredes', 'T'),
(649, 0, 8, '2012-05-22', '0000-00-00', '09:56:00', '09:57:00', 'banco interternacional', 'cambiar cheque', 'cambiar cheque de caja chica', '2012-05-22', 'M', 'error\r\n', 44, 'Paola Paredes', 'C'),
(650, 0, 8, '2012-05-22', '0000-00-00', '09:57:00', '09:59:00', 'banco internacioinal', 'trasnferencia al exterior', 'n/a', '2012-05-22', 'M', '', 44, 'Paola Paredes', 'T'),
(651, 0, 6, '2012-05-24', '0000-00-00', '09:58:00', '13:27:00', 'produbanco', 'realizar solicitudes de clave', 'realizar solicitudes de clave y cambiar cheque de caja chica ', '2012-05-22', 'M', '', 44, 'Paola Paredes', 'T'),
(652, 0, 8, '2012-05-22', '0000-00-00', '09:59:00', '13:33:00', 'conecel', 'realizar solicitudes', 'desgloce de llamadas y chip para diana', '2012-05-22', 'M', '', 44, 'Paola Paredes', 'T'),
(653, 1, 3, '2012-05-22', '0000-00-00', '10:24:00', '17:07:00', 'MINSITERIO DE SALUD', 'RETIRO DE POLIZAS', 'EUGENIA ALMEIDA YA ESTAN LISTAS', '2012-05-22', 'T', '', 53, 'Lorena Morales', 'T'),
(654, 1, 7, '2012-05-22', '0000-00-00', '11:58:00', '17:07:00', 'ALDEMAR PEÑA', 'ENTREGA FACTURAS', 'CC AMERICA CENTER VERSALLES N20-77 Y BOLIVIA OF.102', '2012-05-22', 'T', '', 51, 'Anita Paucar', 'T'),
(657, 0, 3, '2012-05-23', '0000-00-00', '09:05:00', '12:07:00', 'agencia nacional de transiito', 'averiguar certificado', 'averiguar los requicitos y el procedidmiento para obtener un permiso para transporte de carga peligrosa QUIMICOS', '2012-05-23', 'M', 'n/a\r\n', 44, 'Paola Paredes', 'C'),
(655, 1, 2, '2012-05-22', '0000-00-00', '13:38:00', '17:10:00', 'aduana', 'entregar docs', 'entregar documentos ', '2012-05-22', 'T', '', 44, 'Paola Paredes', 'T'),
(656, 0, 1, '2012-05-23', '0000-00-00', '08:58:00', '12:07:00', 'SK ENGINEERING', 'ENTREGAR FACTURAS', 'ATT. HANA LEE', '2012-05-23', 'M', '', 51, 'Anita Paucar', 'T'),
(658, 0, 1, '2012-05-23', '0000-00-00', '09:09:00', '12:07:00', 'PICHINCHA', 'DEPOSITO', 'DEPOSITO CHEQUES GRAPHIC', '2012-05-23', 'M', '', 52, 'Martha Marulanda', 'T'),
(659, 0, 2, '2012-05-23', '0000-00-00', '09:30:00', '12:07:00', 'aduana ', 'entregar tramite', 'entregar toner y tramite en la aduana', '2012-05-23', 'M', '', 44, 'Paola Paredes', 'T'),
(660, 1, 1, '2012-05-23', '0000-00-00', '13:04:00', '18:00:00', 'OFICINA ADUANA', 'ENTREGAR TRAMITE Y DAV', 'DAV DE MACAGRUN PARA INGRESO URGENTE Y TRAMITE MSP', '2012-05-23', 'T', '', 53, 'Lorena Morales', 'T'),
(661, 1, 2, '2012-05-23', '0000-00-00', '13:32:00', '18:00:00', 'aduana', 'entregar documetnos', 'entregar documentos', '2012-05-23', 'T', '', 44, 'Paola Paredes', 'T'),
(662, 1, 4, '2012-05-23', '0000-00-00', '13:32:00', '18:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV', 'CON MARISOL ANDRADE', '2012-05-23', 'T', '', 53, 'Lorena Morales', 'T'),
(663, 1, 3, '2012-05-23', '0000-00-00', '13:38:00', '18:00:00', 'dra luisa chiriboga', 'entregar cheques y retirar autorizacion', 'entregar los dos cheques y retirar autorizacion de ingreso para casa blanca, <br />\n<br />\nav. amazonas y alemania optica ', '2012-05-23', 'T', '', 44, 'Paola Paredes', 'T'),
(664, 0, 1, '2012-05-23', '0000-00-00', '17:30:00', '00:00:00', 'BOLIVARIANO', 'RETIRAR CHEQUE', 'IMPEXAZUL', '2012-05-23', 'M', '', 51, 'Anita Paucar', 'P'),
(665, 0, 1, '2012-05-24', '0000-00-00', '17:31:00', '13:27:00', 'BOLIVARIANO', 'RETIRAR CHEQUE', 'IMPEXAZUL', '2012-05-23', 'M', '', 51, 'Anita Paucar', 'T'),
(666, 1, 3, '2012-05-24', '0000-00-00', '17:31:00', '16:52:00', 'CELEC', 'ENTREGA FACTURAS', 'ATT. BELEN SANCHEZ', '2012-05-23', 'T', '', 51, 'Anita Paucar', 'T'),
(667, 0, 4, '2012-05-24', '0000-00-00', '08:53:00', '13:27:00', 'BANCO INTERNACIONAL', 'PAGO IMPUESTOS', 'PAGO IMPUESTOS', '2012-05-24', 'M', '', 52, 'Martha Marulanda', 'T'),
(668, 0, 3, '2012-05-24', '0000-00-00', '09:32:00', '13:27:00', 'aduana', 'dejar docs', 'dejar docuemntacion en la aduana', '2012-05-24', 'M', '', 44, 'Paola Paredes', 'T'),
(669, 1, 1, '2012-05-24', '0000-00-00', '12:58:00', '16:52:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE COMPROBANTES Y FACTURA', 'RETIRAR DAV', '2012-05-24', 'T', '', 53, 'Lorena Morales', 'T'),
(670, 1, 2, '2012-05-24', '0000-00-00', '13:07:00', '16:52:00', 'BANCO INTERNACIONAL', 'DEPOSITO', 'DEPOSITO CHEQUE IMPEXAZUL', '2012-05-24', 'T', '', 52, 'Martha Marulanda', 'T'),
(671, 1, 4, '2012-05-24', '0000-00-00', '13:28:00', '16:52:00', 'MISSION PETROLEUM', 'ENTREGAR FACTURAS', 'ENTREGAR FACTURAS', '2012-05-24', 'T', '', 44, 'Paola Paredes', 'T'),
(672, 0, 1, '2012-05-28', '0000-00-00', '09:12:00', '13:13:00', 'MARTINAIR CARGO ', 'RETIRAR GUIA ', 'GUIA # 12954239684', '2012-05-28', 'M', '', 43, 'Karla Jacome', 'T'),
(673, 0, 3, '2012-05-28', '0000-00-00', '09:28:00', '13:13:00', 'REFINACION', 'RETIRAR DOCUMENTOS', 'RETIRAR DOCUEMENTOS', '2012-05-28', 'M', '', 44, 'Paola Paredes', 'T'),
(674, 0, 2, '2012-05-28', '0000-00-00', '09:39:00', '13:13:00', 'IMPEXAZUL', 'RETIRAR DAV ', 'RETIRAR GUIA DE IMPEXAZUL DK 462 BAJO CONFIRMACION ', '2012-05-28', 'M', '', 43, 'Karla Jacome', 'T'),
(675, 1, 1, '2012-05-28', '0000-00-00', '12:27:00', '09:29:00', 'ADUANA QUITO ', 'DEJAR TRAMITE ', 'DK 462//IMPEXAZUL INGRESAR URGENTE ', '2012-05-28', 'T', '', 43, 'Karla Jacome', 'T'),
(676, 1, 1, '2012-05-28', '0000-00-00', '14:46:00', '00:00:00', 'IMPEXAZUL ', 'RETIRAR RETENCIONES', 'AÑADIDO POR ANITA  14:45', '2012-05-28', 'T', '', 44, 'Paola Paredes', 'P'),
(677, 0, 3, '2012-05-28', '0000-00-00', '15:11:00', '00:00:00', 'DOLMAR', 'RETIRAR GUIA', 'ADJUNTO CARTA', '2012-05-28', 'N', '', 53, 'Lorena Morales', 'P'),
(678, 0, 1, '2012-05-29', '0000-00-00', '15:13:00', '12:47:00', 'GRAPHICSOURSE', 'RETIRAR DAV FIRMADAS', 'CON MARGARITA ORTIZ', '2012-05-28', 'M', '', 53, 'Lorena Morales', 'T'),
(679, 0, 3, '2012-05-29', '0000-00-00', '16:14:00', '12:47:00', 'DOLMAR', 'ENTREGA DE OFICIO Y GUIA', 'CARTA POR DIFERENCIA DE PESOS', '2012-05-28', 'M', '', 53, 'Lorena Morales', 'T'),
(680, 0, 6, '2012-05-28', '0000-00-00', '16:19:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'RETIRO DE DAV', 'CON ANDRES MENA', '2012-05-28', 'N', '', 53, 'Lorena Morales', 'P'),
(681, 0, 4, '2012-05-29', '0000-00-00', '09:09:00', '12:47:00', 'PROAÑO REPRESENTACIONES', 'RETIRO DE DAV', 'FIRMADA', '2012-05-29', 'M', '', 53, 'Lorena Morales', 'T'),
(682, 0, 5, '2012-05-29', '0000-00-00', '09:10:00', '12:47:00', 'MINISTERIO DE SALUD', 'ENTREGA DE FACTURAS', 'FIRMAR RECIBIDO', '2012-05-29', 'M', '', 53, 'Lorena Morales', 'T'),
(683, 0, 6, '2012-05-29', '0000-00-00', '09:10:00', '12:47:00', 'PETROECUADOR/ GERENCIA DE REFINACIONE', 'RETIRO DE DAV', 'EN LA TARDE', '2012-05-29', 'M', '', 53, 'Lorena Morales', 'T'),
(684, 1, 1, '2012-05-29', '0000-00-00', '11:26:00', '00:00:00', 'BYRON VELASCO', 'RETIRO DE DAV', 'EN LA BRASIL Y ZAMORA URGENTE 2:30PM', '2012-05-29', 'T', '', 53, 'Lorena Morales', 'P'),
(685, 1, 2, '2012-05-29', '0000-00-00', '12:46:00', '00:00:00', 'ADUANA QUITO ', 'DEJAR DOCS', 'PARA REGISTRO DK 354', '2012-05-29', 'T', '', 43, 'Karla Jacome', 'P'),
(686, 1, 4, '2012-05-29', '0000-00-00', '12:53:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGAR TRAMITE ', '2 ORDENES DE EMBARQUE', '2012-05-29', 'T', '', 53, 'Lorena Morales', 'P'),
(687, 1, 5, '2012-05-29', '0000-00-00', '12:57:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV', 'AL ULTIMO', '2012-05-29', 'T', '', 53, 'Lorena Morales', 'P'),
(688, 1, 3, '2012-05-29', '0000-00-00', '13:24:00', '00:00:00', 'ADUANA QUITO ', 'DEJAR TRAMITE ', 'ADFOLSA ', '2012-05-29', 'T', '', 43, 'Karla Jacome', 'P'),
(689, 1, 6, '2012-05-29', '0000-00-00', '13:32:00', '00:00:00', 'franciso alarcon ', 'retirar certificado ', 'retirar certificado ', '2012-05-29', 'T', '', 44, 'Paola Paredes', 'P'),
(690, 1, 7, '2012-05-29', '0000-00-00', '13:38:00', '00:00:00', 'PRODUCCION ', 'DEJAR DOCS //RETIRAR DAV ', 'BAJO CONFIRMACION ', '2012-05-29', 'T', '', 43, 'Karla Jacome', 'P'),
(691, 1, 2, '2012-05-31', '0000-00-00', '08:52:00', '09:31:00', 'GRAPHICSOURSE', 'RETIRO DE DAV', 'DK 465 ', '2012-05-30', 'T', '', 53, 'Lorena Morales', 'T'),
(692, 0, 6, '2012-05-30', '0000-00-00', '08:53:00', '17:11:00', 'PRODUBANCO', 'DEPOSITO', 'DEPOSITOS  (2)', '2012-05-30', 'M', '', 52, 'Martha Marulanda', 'T'),
(693, 0, 2, '2012-05-30', '0000-00-00', '08:58:00', '17:11:00', 'ADUANA QUITO', 'DEJAR TRAMITES ', 'DK 413//473', '2012-05-30', 'M', '', 43, 'Karla Jacome', 'T'),
(694, 0, 8, '2012-05-30', '0000-00-00', '09:16:00', '17:11:00', 'jose guevara', 'retirtar certificado', 'retirar certificado para denkel directamente con el señor guevara', '2012-05-30', 'M', '', 44, 'Paola Paredes', 'T'),
(695, 0, 5, '2012-05-30', '0000-00-00', '09:17:00', '17:11:00', 'ocp ', 'retirar cetificado', 'retirar certificado con  viviana zapata al medio dia<br />\n', '2012-05-30', 'M', '', 44, 'Paola Paredes', 'T'),
(696, 0, 3, '2012-05-30', '0000-00-00', '10:35:00', '17:11:00', 'PROAÑO REPRESENTACIONES', 'RETIRO DE DAV', 'CON JOHANNA', '2012-05-30', 'M', '', 53, 'Lorena Morales', 'T'),
(697, 0, 7, '2012-05-30', '0000-00-00', '10:35:00', '17:11:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'RETIRO DE DAV', 'CON MARISOL ANDRADE', '2012-05-30', 'M', '', 53, 'Lorena Morales', 'T'),
(698, 0, 4, '2012-05-30', '0000-00-00', '10:52:00', '17:11:00', 'azul', 'entregar facturas', 'entregar a la morayma', '2012-05-30', 'M', '', 44, 'Paola Paredes', 'T'),
(704, 0, 8, '2012-05-31', '0000-00-00', '09:30:00', '09:31:00', 'INEN', 'INGRESAR INEN', 'INGRESAR INEN', '2012-05-31', 'M', '', 44, 'Paola Paredes', 'T'),
(699, 0, 9, '2012-05-30', '0000-00-00', '11:02:00', '17:11:00', 'transportes ecuador', 'retirar valija', 'retirar valija', '2012-05-30', 'M', '', 44, 'Paola Paredes', 'T'),
(700, 0, 1, '2012-05-30', '0000-00-00', '12:22:00', '17:12:00', 'GERENCIA DE DESARROLLO ORGANIZACIONAL ', 'RETIRAR TRAMITE ', 'CON DIEGO SALAS TRAMITE NUEVO ', '2012-05-30', 'M', '', 43, 'Karla Jacome', 'T'),
(701, 0, 5, '2012-05-31', '0000-00-00', '12:22:00', '09:31:00', 'ENERGIA FUTURA ', 'RETIRAR DAV Y GUIA ORIGINAL ', 'BAJO CONFIRMACION ', '2012-05-30', 'M', '', 43, 'Karla Jacome', 'T'),
(702, 0, 1, '2012-05-31', '0000-00-00', '17:22:00', '13:28:00', 'SJ JERSEY', 'RETIRAR DOCUMENTOS', 'CON ANDREA<br />\n', '2012-05-30', 'M', '', 53, 'Lorena Morales', 'T'),
(703, 0, 7, '2012-05-31', '0000-00-00', '17:53:00', '09:31:00', 'DOLMAR', 'RETIRAR GUIA', 'ADJUNTO COPIA DE FACTURA Y RETENCION<br />\n', '2012-05-30', 'M', '', 53, 'Lorena Morales', 'T'),
(705, 0, 3, '2012-05-31', '0000-00-00', '09:31:00', '09:31:00', 'ADUANA', 'INGRESAR TRAMITES', 'N/A', '2012-05-31', 'M', '', 44, 'Paola Paredes', 'T'),
(706, 0, 9, '2012-05-31', '0000-00-00', '09:32:00', '09:31:00', 'REFINACION', 'ENTREGAR DOCUMENTOS', 'N/A', '2012-05-31', 'M', '', 44, 'Paola Paredes', 'T'),
(707, 0, 10, '2012-05-31', '0000-00-00', '09:41:00', '09:31:00', 'TAMPA ', 'RETIRAR GUIA ', 'DK 482//ENERGIA FUTURA ', '2012-05-31', 'M', '', 43, 'Karla Jacome', 'T'),
(708, 0, 11, '2012-05-31', '0000-00-00', '11:09:00', '09:31:00', 'BANCO BOLIVARIANO', 'RETIRAR CHEQUE DE AZUL', 'N/A', '2012-05-31', 'M', '', 44, 'Paola Paredes', 'T'),
(709, 1, 1, '2012-05-31', '0000-00-00', '11:10:00', '09:31:00', 'MARCONI', 'REPARAR RADIOS', 'ENVIAR A REPARAR LAS RADIOS', '2012-05-31', 'T', '', 44, 'Paola Paredes', 'T'),
(710, 1, 4, '2012-05-31', '0000-00-00', '12:29:00', '09:31:00', 'GRAPHICSOURCE', 'ENTREGA FACTURAS', 'URG. ATT. MARGARITA ORTIZ', '2012-05-31', 'T', '', 51, 'Anita Paucar', 'T'),
(711, 1, 6, '2012-05-31', '0000-00-00', '12:29:00', '09:31:00', 'PRODUBANCO', 'CAMBIAR CHEQUE', 'CAJA CHICA', '2012-05-31', 'T', '', 51, 'Anita Paucar', 'T'),
(712, 1, 1, '2012-06-01', '0000-00-00', '15:27:00', '09:32:00', 'PRODUCCION ', 'RETIRAR TRAMITE ', 'JUAN DIEGO BRITO ', '2012-05-31', 'T', '', 43, 'Karla Jacome', 'T'),
(713, 0, 6, '2012-05-31', '0000-00-00', '18:43:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'RETIRO DE DAV', 'con natalia', '2012-05-31', 'N', '', 53, 'Lorena Morales', 'P'),
(714, 0, 11, '2012-06-01', '0000-00-00', '08:33:00', '13:27:00', 'TRAUMA ORTOPEDICS', 'RETIRO DE DAV', 'CON NATALIA<br />\n', '2012-06-01', 'M', '', 53, 'Lorena Morales', 'T'),
(715, 1, 2, '2012-06-01', '0000-00-00', '08:57:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE FACTURAS', 'MARISOL ANDRADE', '2012-06-01', 'T', '', 53, 'Lorena Morales', 'P'),
(716, 1, 1, '2012-06-01', '0000-00-00', '09:19:00', '00:00:00', 'REYBEC', 'RETIRAR CHEQUE', 'CONTABILIDAD', '2012-06-01', 'T', '', 51, 'Anita Paucar', 'P'),
(717, 0, 4, '2012-06-01', '0000-00-00', '09:22:00', '10:31:00', 'S.J. JERSEY ECUATORIANO', 'RETIRAR CHEQUE', 'ANTES DE LAS 12PM', '2012-06-01', 'M', '', 51, 'Anita Paucar', 'T'),
(718, 1, 3, '2012-06-01', '0000-00-00', '09:23:00', '00:00:00', 'CARGONET', 'RETIRAR CHEQUE', 'DE 4 A 5 PM', '2012-06-01', 'T', '', 51, 'Anita Paucar', 'P'),
(719, 0, 10, '2012-06-01', '0000-00-00', '09:26:00', '13:27:00', 'SK ENGINEERING', 'RETIRAR CHEQUE', 'CONTABILIDAD', '2012-06-01', 'M', '', 51, 'Anita Paucar', 'T'),
(720, 0, 13, '2012-06-01', '0000-00-00', '10:00:00', '13:27:00', 'BANCO DE GYE ', 'DEPOSITO', 'DEPOSITAR EN LA CUENTA DE BELEN', '2012-06-01', 'M', '', 44, 'Paola Paredes', 'T'),
(721, 0, 4, '2012-06-01', '0000-00-00', '10:07:00', '13:27:00', 'ARISBERG', 'RETIRO DAV', 'WORLD TRADE CENTER TORRE A OFICINA 110//RETIRAN Y LLEVAN A ADUANA EL DAV JUNTO CON EL TRAMITE DEBE INGRESARSE HOY POR FAVOR ', '2012-06-01', 'M', '', 5, 'Maria Piedad', 'T'),
(726, 0, 14, '2012-06-01', '0000-00-00', '11:25:00', '13:27:00', 'cirsa', 'RETIRAR', 'URGENTE', '2012-06-01', 'M', '', 44, 'Paola Paredes', 'T'),
(722, 0, 6, '2012-06-01', '0000-00-00', '10:35:00', '13:27:00', 'diego salas', 'retirar dav', 'para ingresar en la aduana', '2012-06-01', 'M', '', 44, 'Paola Paredes', 'T'),
(723, 0, 8, '2012-06-01', '0000-00-00', '10:36:00', '13:27:00', 'INTERCILSA', 'ENTREGA CHEQUE', '168', '2012-06-01', 'M', '', 51, 'Anita Paucar', 'T'),
(724, 0, 9, '2012-06-01', '0000-00-00', '10:37:00', '13:27:00', 'SK ENGINEERING', 'RETIRO DE DAV', 'CON HANA', '2012-06-01', 'M', '', 53, 'Lorena Morales', 'T'),
(725, 0, 12, '2012-06-01', '0000-00-00', '10:38:00', '13:27:00', 'trasnportes ecuador', 'retirar valija', 'n/a', '2012-06-01', 'M', '', 44, 'Paola Paredes', 'T'),
(727, 1, 5, '2012-06-01', '0000-00-00', '13:08:00', '00:00:00', 'MINSITERIO DE SALUD', 'ENTREGA DE FACTURA', 'adjunto  copias para recibido', '2012-06-01', 'T', '', 53, 'Lorena Morales', 'P'),
(728, 1, 7, '2012-06-01', '0000-00-00', '13:17:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO', 'DEPOSITOS 2 CHQUES', '2012-06-01', 'T', '', 52, 'Martha Marulanda', 'P'),
(729, 0, 8, '2012-06-01', '0000-00-00', '17:07:00', '00:00:00', 'PRODUCCION ', 'DEJAR DOCS ', 'RECIBOS DE MSC + LIQUIDACIONES DE MSC+ INTERCHANGE ', '2012-06-01', 'N', '', 43, 'Karla Jacome', 'P'),
(730, 0, 1, '2012-06-04', '0000-00-00', '17:50:00', '13:12:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE CHEQUE ', 'FIRMAR RECIBIDO', '2012-06-01', 'M', '', 53, 'Lorena Morales', 'T'),
(731, 0, 3, '2012-06-04', '0000-00-00', '09:21:00', '13:12:00', 'ADUANA QUITO ', 'DEJAR TRAMITE', 'DK 488', '2012-06-04', 'M', '', 43, 'Karla Jacome', 'T'),
(732, 0, 5, '2012-06-04', '0000-00-00', '09:21:00', '13:12:00', 'ORGANIZACIONAL', 'RETIRAR TRAMITE ', 'DIEGO SALAS ', '2012-06-04', 'M', '', 43, 'Karla Jacome', 'T'),
(733, 1, 3, '2012-06-04', '0000-00-00', '10:11:00', '00:00:00', 'GRAPHICSOURCE', 'ENTREGA FACTURAS', 'DK-442', '2012-06-04', 'T', '', 51, 'Anita Paucar', 'P'),
(734, 1, 2, '2012-06-04', '0000-00-00', '10:11:00', '00:00:00', 'PREMIUMCORP', 'ENTREGA FACTURAS', 'DK-430', '2012-06-04', 'T', '', 51, 'Anita Paucar', 'P'),
(735, 1, 4, '2012-06-04', '0000-00-00', '10:12:00', '00:00:00', 'FRANCISCO ALARCON', 'ENTREGA FACTURAS', 'DK-434', '2012-06-04', 'T', '', 51, 'Anita Paucar', 'P'),
(736, 1, 1, '2012-06-04', '0000-00-00', '10:12:00', '00:00:00', 'CARGONET', 'ENTREGA FACTURAS', 'DK-400', '2012-06-04', 'T', '', 51, 'Anita Paucar', 'P'),
(737, 1, 6, '2012-06-04', '0000-00-00', '10:13:00', '00:00:00', 'EXPLORACION Y PRODUCCION', 'ENTREGA FACTURAS', 'DK-323', '2012-06-04', 'T', '', 51, 'Anita Paucar', 'P'),
(738, 1, 5, '2012-06-04', '0000-00-00', '10:13:00', '00:00:00', 'REFINACION', 'ENTREGA DE FACTURAS', 'DK-230', '2012-06-04', 'T', '', 51, 'Anita Paucar', 'P'),
(739, 0, 2, '2012-06-04', '0000-00-00', '13:14:00', '13:17:00', 'proaño representaciones', 'retirar documentos', 'en la mañana', '2012-06-04', 'M', '', 44, 'Paola Paredes', 'T'),
(740, 0, 4, '2012-06-04', '0000-00-00', '13:15:00', '13:17:00', 'trauma ortopedics', 'retirar dav', 'en la mañana', '2012-06-04', 'M', '', 44, 'Paola Paredes', 'T'),
(741, 0, 6, '2012-06-04', '0000-00-00', '13:16:00', '13:17:00', 'trasnportes ecuador', 'retirar valija', 'retirar valija', '2012-06-04', 'M', '', 44, 'Paola Paredes', 'T'),
(742, 0, 4, '0000-00-00', '0000-00-00', '13:17:00', '00:00:00', 'secap', 'inscripcion', 'en la mañana', '2012-06-04', 'N', '', 44, 'Paola Paredes', 'P'),
(743, 1, 1, '2012-06-04', '0000-00-00', '13:39:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGA DE CHEQUE PARA LIQUIDACION', 'DE TRAUMA ENTREGAR A DIANA URGENTE', '2012-06-04', 'T', '', 53, 'Lorena Morales', 'P'),
(744, 0, 2, '2012-06-04', '0000-00-00', '15:09:00', '00:00:00', 'CENTURION CARGO', 'RETIRO DE GUIA', 'RETIRAR GUIA AOC  307 36338503', '2012-06-04', 'N', '', 53, 'Lorena Morales', 'P'),
(745, 0, 1, '2012-06-05', '0000-00-00', '17:45:00', '13:00:00', 'SK ENGINEERING', 'RETIRAR CHEQUE', 'CON HANNA', '2012-06-04', 'M', '', 53, 'Lorena Morales', 'T'),
(746, 0, 3, '2012-06-05', '0000-00-00', '17:46:00', '13:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE COMPROBANTES Y FACTURA', 'marisol andrade', '2012-06-04', 'M', '', 53, 'Lorena Morales', 'T'),
(747, 0, 6, '2012-06-05', '0000-00-00', '08:52:00', '13:03:00', 'CENTURION CARGO', 'RETIRAR GUIA', 'GUIA 307 36338503', '2012-06-05', 'M', '', 53, 'Lorena Morales', 'T'),
(748, 0, 5, '2012-06-05', '0000-00-00', '09:11:00', '13:00:00', 'ORGANIZACIONAL ', 'RETIRAR TRAMITE ', 'DIEGO SALAS EN LA MAÑANA ', '2012-06-05', 'M', '', 43, 'Karla Jacome', 'T'),
(749, 1, 1, '2012-06-05', '0000-00-00', '10:42:00', '17:04:00', 'SJ JERSEY', 'RETIRAR DOCUMENTOS', 'TARDE', '2012-06-05', 'T', '', 53, 'Lorena Morales', 'T'),
(750, 1, 4, '2012-06-05', '0000-00-00', '11:38:00', '17:04:00', 'PRODUCCION', 'RETIRAR DAVS ', 'JUAN DIEGO BRITO ', '2012-06-05', 'T', '', 43, 'Karla Jacome', 'T'),
(751, 1, 2, '2012-06-05', '0000-00-00', '13:00:00', '17:04:00', 'SENAE', 'ENTREGAR TRAMITE A DIANA', 'INGRESAR TRAMITE DE SK ', '2012-06-05', 'T', '', 5, 'Maria Piedad', 'T'),
(752, 1, 3, '2012-06-05', '0000-00-00', '13:01:00', '17:04:00', 'INEN', 'RETIRO DE FACTURAS', 'LEER E MAIL ADJUNTO A OFICIOS DEJADOS EN VALIJA', '2012-06-05', 'T', '', 5, 'Maria Piedad', 'T'),
(753, 1, 5, '2012-06-05', '0000-00-00', '13:21:00', '17:04:00', 'HACER PLACA ', 'HACER PLACA ', 'ADJUNTO PAPELITO INIDICANDO QUE SE HAGA PLACA PARA PONER EN LA PIEZA DE LA EXPO <br />\n<br />\n', '2012-06-05', 'T', '', 43, 'Karla Jacome', 'T'),
(754, 1, 6, '2012-06-05', '0000-00-00', '13:21:00', '17:04:00', 'HACER SELLO ', 'HACER SELLO ', 'SE ADJUNTA HOJA CON LOGO PARA EL SELLO ', '2012-06-05', 'T', '', 43, 'Karla Jacome', 'T'),
(755, 0, 1, '2012-06-06', '0000-00-00', '17:08:00', '13:17:00', 'ADUANA', 'ENTREGAR CHEQUE ', 'ENTREGAR CHEQUE DE REYBEC CON SOBRECITO PARA PAGO DE LIQUIDACION', '2012-06-05', 'M', '', 44, 'Paola Paredes', 'T'),
(756, 0, 2, '2012-06-06', '0000-00-00', '09:22:00', '13:14:00', 'PRODUCCION ', 'RETIRAR DAV ', 'JUAN DIEGO BRITO', '2012-06-06', 'M', '', 43, 'Karla Jacome', 'T'),
(757, 1, 1, '2012-06-07', '0000-00-00', '09:50:00', '09:35:00', 'PRUEBA', 'Retirar Documentos', 'PRUEBA', '2012-06-06', 'T', '', 3, 'Willian Espinosa', 'T'),
(758, 0, 3, '2012-06-06', '0000-00-00', '09:51:00', '13:14:00', 'GRAPHICSOURSE', 'RETIRARA DOCUMENTOS ', 'ENTREGAR DAV ADJUNTO COPIA PARA RECIBIDO', '2012-06-06', 'M', '', 53, 'Lorena Morales', 'T'),
(759, 0, 4, '2012-06-06', '0000-00-00', '09:53:00', '13:14:00', 'RETIRAR SELLO', 'RETIRAR SELLO', 'PAGAR SALDO Y SELLAR RETENCION ', '2012-06-06', 'M', '', 43, 'Karla Jacome', 'T'),
(760, 0, 5, '2012-06-06', '0000-00-00', '09:53:00', '13:14:00', 'RETIRAR PLACA', 'RETIRAR PLACA ', 'PAGAR Y SELLAR RETENCION', '2012-06-06', 'M', '', 43, 'Karla Jacome', 'T'),
(761, 0, 6, '2012-06-06', '0000-00-00', '09:54:00', '13:14:00', 'PRODUBANCO ', 'CAMBIAR Y DEPOSITAR ', 'CAMBIAR CHEQUE 6257  PARA PAGAR SELLO Y PLACA Y DEPOSITAR CHEQUE #6256 PAGANDO TARJETA VISA ED JOUVE OFICINA ', '2012-06-06', 'M', '', 43, 'Karla Jacome', 'T'),
(762, 1, 1, '2012-06-06', '0000-00-00', '13:19:00', '00:00:00', 'imprenta', 'retirar sello', 'retirar sello', '2012-06-06', 'T', '', 44, 'Paola Paredes', 'P'),
(763, 1, 2, '2012-06-06', '0000-00-00', '13:21:00', '00:00:00', 'PRODUBANCO 	', '	CAMBIAR Y DEPOSITAR 	', 'CAMBIAR Y DEPOSITAR 	CAMBIAR CHEQUE 6257 PARA PAGAR SELLO Y PLACA Y DEPOSITAR CHEQUE #6256 PAGANDO TARJETA VISA ED JOUVE OFICINA ', '2012-06-06', 'T', '', 44, 'Paola Paredes', 'P'),
(764, 1, 3, '2012-06-06', '0000-00-00', '13:22:00', '00:00:00', 'retirar placa', 'retirar placa', 'retirar placa', '2012-06-06', 'T', '', 44, 'Paola Paredes', 'P'),
(765, 0, 4, '2012-06-06', '0000-00-00', '13:26:00', '00:00:00', 'ADUANA QUITO', 'DEJAR TRAMITE ', 'R MERCANTILES ', '2012-06-06', 'N', '', 43, 'Karla Jacome', 'P'),
(766, 0, 6, '2012-06-14', '0000-00-00', '09:05:00', '13:21:00', 'BOLIVARIANO', 'RETIRAR CHEQUE', 'IMPEXAZUL', '2012-06-07', 'M', '', 51, 'Anita Paucar', 'T'),
(769, 0, 3, '2012-06-07', '0000-00-00', '09:51:00', '14:14:00', 'levo ', 'retiar cheque', 'retirar cheque de 9 - 13:00', '2012-06-07', 'M', '', 44, 'Paola Paredes', 'T'),
(767, 1, 6, '2012-06-08', '0000-00-00', '09:43:00', '09:03:00', 'EP PETROECUADOR', 'RETIRAR RETENCIONES', 'ATT. EUGENIA YEPEZ //TESORERIA//HORARIO DE 2:30 A 4:30<br />\n', '2012-06-07', 'T', '', 51, 'Anita Paucar', 'P'),
(768, 1, 4, '2012-06-08', '0000-00-00', '09:44:00', '00:00:00', 'COMERCIALIZADORA CENTRAL', 'RETIRO CHEQUE', 'ATT. ALDEMAR PEÑA A PARTIR DE LAS 3PM.<br />\nVERSALLES N20-77 Y BOLIVIA OF 102 C.C. AMERICA CENTER', '2012-06-07', 'T', '', 51, 'Anita Paucar', 'P'),
(770, 0, 1, '2012-06-07', '0000-00-00', '09:57:00', '14:13:00', 'banco internacional', 'deposito', 'depositar en la cuenta de lf urgente<br />\n', '2012-06-07', 'M', '', 44, 'Paola Paredes', 'T'),
(771, 0, 2, '2012-06-07', '0000-00-00', '10:04:00', '14:14:00', 'SJ JSERSEY ', 'RETIRAR DOCS ', 'A LAS 11:00AM CON ANDREA MOLINA ', '2012-06-07', 'M', '', 43, 'Karla Jacome', 'T'),
(772, 0, 4, '2012-06-07', '0000-00-00', '10:05:00', '14:14:00', 'PANAMERICANA ', 'RETIRAR SOBRE ', 'PANAMERICANA ', '2012-06-07', 'M', '', 43, 'Karla Jacome', 'T'),
(773, 0, 5, '2012-06-07', '0000-00-00', '10:07:00', '14:14:00', 'INEN', 'TRAMITAR INEN', 'ADJUNTO COPIA Y 3 DOLARES CAJA CHICA', '2012-06-07', 'M', '', 53, 'Lorena Morales', 'T'),
(774, 1, 7, '2012-06-07', '0000-00-00', '10:49:00', '09:03:00', 'TRAUMA ORTOPEDICS', 'RETIRO DE CHEQUE', 'A LA OFICIAN ADUANA', '2012-06-07', 'T', '', 53, 'Lorena Morales', 'T'),
(775, 1, 1, '2012-06-07', '0000-00-00', '11:55:00', '09:02:00', 'AZUL', 'RETIRAR 2 RETENCIONES', 'ATT. MORAYMA ARIAS', '2012-06-07', 'T', '', 51, 'Anita Paucar', 'T'),
(776, 1, 2, '2012-06-07', '0000-00-00', '12:25:00', '09:02:00', 'SK ENGINEERING', 'RETIRAR CARTA DE AUTORIZACION', 'A PARTIR DE LAS 2 PM, ES AUTORIZAION PARA RETIRO DE GUIA EN TAMPA', '2012-06-07', 'T', '', 53, 'Lorena Morales', 'T'),
(777, 1, 3, '2012-06-07', '0000-00-00', '12:27:00', '09:03:00', 'TAMPA', 'RETIRO DE GUIA', 'ADJUNTO  TRANSFERENCIA DONDE CONSTA NRO DE GUIA LLEVAR CARTA DE AUTORIZACION RETIRADA EN SK', '2012-06-07', 'T', '', 53, 'Lorena Morales', 'T'),
(778, 1, 4, '2012-06-07', '0000-00-00', '12:38:00', '09:03:00', 'ADUANA', 'ENTREGA', 'CHEQUES+AVISO DE ENTRADA FIRMADO POR DIANA', '2012-06-07', 'T', '', 51, 'Anita Paucar', 'T'),
(779, 1, 5, '2012-06-07', '0000-00-00', '14:15:00', '09:03:00', 'francisco alarcon', 'retirar cheque', 'retirar cheque', '2012-06-07', 'T', '', 44, 'Paola Paredes', 'T'),
(780, 0, 9, '2012-06-08', '0000-00-00', '15:33:00', '12:57:00', 'IMPROLAB', 'RETIRO DE CHEQUE', 'DE 11 A 1 PM', '2012-06-07', 'M', '', 51, 'Anita Paucar', 'T'),
(781, 1, 1, '2012-06-08', '0000-00-00', '15:53:00', '00:00:00', 'INEN', 'INGRESO DOCS ', 'INGRESO DOCUMENTOS FISICOS PARA REGISTRO DE CUENTA <br />\n<br />\nENIO COPIAS PARA RECIBIDO ', '2012-06-07', 'T', '', 43, 'Karla Jacome', 'P'),
(782, 0, 6, '2012-06-07', '0000-00-00', '16:01:00', '00:00:00', 'ADUANA ', 'INGRESAR DOCS', 'TRAMITE DK 444 <br />\nEXPO TEMPORAL ', '2012-06-07', 'N', '', 43, 'Karla Jacome', 'P'),
(783, 0, 5, '2012-06-08', '0000-00-00', '09:04:00', '12:57:00', 'AEROGAL', 'ENVIAR SOBRE', 'ENVIAR SOBRE', '2012-06-08', 'M', '', 44, 'Paola Paredes', 'T'),
(784, 0, 12, '2012-06-08', '0000-00-00', '09:16:00', '12:59:00', 'TRASNPORTES ECUADOR', 'RETIRAR VALIJA', 'N/', '2012-06-08', 'M', '', 44, 'Paola Paredes', 'T'),
(785, 0, 10, '2012-06-08', '0000-00-00', '09:17:00', '12:57:00', 'EMPRESA ELECTRICA', 'PAGO DON EDWIN', 'PAGO DON EDWIN', '2012-06-08', 'M', '', 44, 'Paola Paredes', 'T'),
(786, 0, 6, '2012-06-08', '0000-00-00', '09:24:00', '12:57:00', 'ESDINAMICO', 'ENTREGA CHEQUE', 'PAGO MENSUALIDAD', '2012-06-08', 'M', '', 51, 'Anita Paucar', 'T'),
(787, 0, 13, '2012-06-08', '0000-00-00', '09:25:00', '12:59:00', 'PRODUBANCO', 'DEPOSITO', '7 CHEQUES', '2012-06-08', 'M', '', 51, 'Anita Paucar', 'T'),
(788, 0, 7, '2012-06-08', '0000-00-00', '09:26:00', '12:57:00', 'REFINACION', 'ENTREGAR DOCUMENTOS', 'N/A', '2012-06-08', 'M', '', 44, 'Paola Paredes', 'T'),
(789, 1, 2, '2012-06-08', '0000-00-00', '09:26:00', '00:00:00', 'GRAFIC SOURCE', 'ENTREGAR FACTURAS', 'ENTREGAR FACTURAS', '2012-06-08', 'T', '', 44, 'Paola Paredes', 'P'),
(790, 0, 4, '2012-06-08', '0000-00-00', '09:27:00', '12:57:00', 'AMERICAN AIRLINES', 'SOLICITAR FIEL COPIA DEL ORIGINAL', 'N/A', '2012-06-08', 'M', '', 44, 'Paola Paredes', 'T'),
(791, 0, 3, '2012-06-08', '0000-00-00', '09:28:00', '12:57:00', 'MINISTERIO DE SALID ', 'DEJAR DOCUMENTOS', 'N/A', '2012-06-08', 'M', '', 44, 'Paola Paredes', 'T'),
(792, 0, 14, '2012-06-08', '0000-00-00', '09:30:00', '12:59:00', 'INTERNACIONAL', 'DEPOSITO', '1 CHEQUE', '2012-06-08', 'M', '', 51, 'Anita Paucar', 'T'),
(793, 0, 15, '2012-06-08', '0000-00-00', '09:31:00', '12:59:00', 'PICHINCHA', 'DEPOSITO', '2 CHEQUES', '2012-06-08', 'M', '', 51, 'Anita Paucar', 'T'),
(794, 1, 3, '2012-06-08', '0000-00-00', '10:04:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'RETIRAR DOCUMENTOS', 'CON JOHANNA', '2012-06-08', 'T', '', 53, 'Lorena Morales', 'P'),
(795, 1, 5, '2012-06-08', '0000-00-00', '10:07:00', '00:00:00', 'SK ENGINEERING', 'RETIRO DE DAV', 'HANNA<br />\n', '2012-06-08', 'T', '', 53, 'Lorena Morales', 'P'),
(796, 0, 6, '2012-06-11', '0000-00-00', '10:53:00', '12:57:00', 'LEVO', 'DEVOLUCION RETENCIONES', 'FAVOR TRAER LAS RETENCIONES CORRECTAS', '2012-06-08', 'M', '', 51, 'Anita Paucar', 'T'),
(797, 1, 7, '2012-06-08', '0000-00-00', '12:18:00', '00:00:00', 'PETROECUADOR/ GERENCIA DE REFINACION', 'ENTREGA DE COMPROBANTES', 'FIRMAR COPIAS RECIBIDO', '2012-06-08', 'T', '', 53, 'Lorena Morales', 'P'),
(798, 1, 2, '2012-06-11', '0000-00-00', '16:30:00', '09:28:00', 'DOMAR', 'RETIRAR GUIAS', '510 Y 517', '2012-06-08', 'T', '', 53, 'Lorena Morales', 'T'),
(799, 0, 9, '2012-06-08', '0000-00-00', '16:47:00', '00:00:00', 'OFICINA ADUANA', 'ENTREGAR A DIANA FACTURA', '0714', '2012-06-08', 'N', '', 53, 'Lorena Morales', 'P'),
(800, 0, 5, '2012-06-11', '0000-00-00', '16:49:00', '12:57:00', 'OFICINA ADUANA', 'ENTREGAR FACTURA', 'A DIANA 0714', '2012-06-08', 'M', '', 53, 'Lorena Morales', 'T'),
(801, 0, 11, '2012-06-08', '0000-00-00', '17:18:00', '00:00:00', 'PRODUBANCO', 'DEPOSITO CHEQUES', '4 CHEQUES=1737.25', '2012-06-08', 'N', '', 51, 'Anita Paucar', 'P'),
(802, 0, 7, '2012-06-11', '0000-00-00', '08:37:00', '12:57:00', 'INEN ', 'INEN', 'INGRESAR DOCS AL INEN ', '2012-06-11', 'M', '', 43, 'Karla Jacome', 'T'),
(803, 0, 10, '2012-06-11', '0000-00-00', '09:00:00', '12:58:00', 'PRODUBANCO', 'DEPOSITO', 'DEPOSITO', '2012-06-11', 'M', '', 52, 'Martha Marulanda', 'T'),
(804, 0, 9, '2012-06-11', '0000-00-00', '09:35:00', '12:58:00', 'refinacion', 'entregar facturas', 'entregar facturas', '2012-06-11', 'M', '', 44, 'Paola Paredes', 'T'),
(805, 0, 4, '2012-06-11', '0000-00-00', '09:35:00', '12:57:00', 'PREMIUMCORP', 'ENTREGAR PLANILLAS', 'ENTREGAR PLANILLA DE GASTOS', '2012-06-11', 'M', '', 52, 'Martha Marulanda', 'T'),
(806, 0, 8, '2012-06-11', '0000-00-00', '09:40:00', '12:57:00', 'CELEC ', 'DEJAR DOCS', 'DEJAR EN CELEC PARA QUE LE ENTREUEN AL ING. DAvid TRUJILLO', '2012-06-11', 'M', '', 43, 'Karla Jacome', 'T'),
(807, 1, 1, '2012-06-11', '0000-00-00', '10:32:00', '09:28:00', 'TAMPA', 'RETIRO DE GUIA', 'RETIRAR GUIA SERINPE 729-8738952, ENTREGAR RETENCION ', '2012-06-11', 'T', '', 5, 'Maria Piedad', 'T'),
(808, 1, 3, '2012-06-11', '0000-00-00', '11:54:00', '09:28:00', 'ADUANA', 'ENTREGA OFICIO', 'PARA ANDRES ARROYO', '2012-06-11', 'T', '', 51, 'Anita Paucar', 'T'),
(809, 1, 5, '2012-06-11', '0000-00-00', '12:42:00', '09:28:00', 'GRAPHICSOURCE', 'ENTREGA FACTURAS', '2 TRAMITES', '2012-06-11', 'T', '', 51, 'Anita Paucar', 'T'),
(810, 1, 4, '2012-06-11', '0000-00-00', '13:58:00', '09:28:00', 'juan luis ', 'retirar celular', 'retirar el celular en la casa', '2012-06-11', 'T', '', 44, 'Paola Paredes', 'T'),
(811, 0, 7, '2012-06-12', '0000-00-00', '16:17:00', '12:41:00', 'GERENCIA DE REFINACIÓN', 'ENTREGA DE FACTURA', 'ENTREGAR A MARISOL ANDRADE', '2012-06-11', 'M', '', 5, 'Maria Piedad', 'T'),
(812, 0, 1, '2012-06-12', '0000-00-00', '18:12:00', '12:41:00', 'SENAE', 'ENTREGA DE TRAMITE', 'REFINACION ', '2012-06-11', 'M', '', 5, 'Maria Piedad', 'T'),
(813, 0, 11, '2012-06-12', '0000-00-00', '09:27:00', '12:41:00', 'SK ENGINEERING', 'RETIRO DE CHEQUE Y DAV', 'CON SOLEDAD LARA, TODO PARA SENAE', '2012-06-12', 'M', '', 5, 'Maria Piedad', 'T'),
(814, 0, 12, '2012-06-12', '0000-00-00', '09:42:00', '12:41:00', 'secap', 'inscripcion', 'inscripcion', '2012-06-12', 'M', '', 44, 'Paola Paredes', 'T'),
(815, 1, 5, '2012-06-12', '0000-00-00', '10:37:00', '09:35:00', 'SK ENGINEERING', 'ENTREGA FACTURAS', 'TRANSPORTE VARIOS', '2012-06-12', 'T', '', 51, 'Anita Paucar', 'T'),
(816, 1, 9, '2012-06-12', '0000-00-00', '10:37:00', '09:36:00', 'GRAPHICSOURCE', 'ENTREGA FACTURAS', 'SOLICITAR LAS FACTURAS Y PLANILLAS ANULADAS', '2012-06-12', 'T', '', 51, 'Anita Paucar', 'T'),
(817, 1, 11, '2012-06-12', '0000-00-00', '10:38:00', '09:36:00', 'PRODUBANCO', 'PAGOS', 'IESS', '2012-06-12', 'T', '', 51, 'Anita Paucar', 'T'),
(818, 1, 1, '2012-06-12', '0000-00-00', '11:04:00', '09:35:00', 'SENAE', 'ENTREGA DE DOCUMENTOS', 'ENTREGAR DOCUMENTOS QUE ESTAN EN VINCHA PARA DIANA GONZA', '2012-06-12', 'T', '', 5, 'Maria Piedad', 'T'),
(819, 1, 6, '2012-06-12', '0000-00-00', '11:16:00', '09:35:00', 'GERENCIA DE REFINACIÓN', 'ENTREGA DE FACTURAS', 'ENTREGAR A MARISOL ANDRADE', '2012-06-12', 'T', '', 5, 'Maria Piedad', 'T'),
(820, 1, 10, '2012-06-12', '0000-00-00', '11:52:00', '09:36:00', 'GRAPHICSOURSE', 'CARTA DE SALIDA', 'ENTREGAR A NATALIA LOPEZ', '2012-06-12', 'T', '', 5, 'Maria Piedad', 'T'),
(821, 1, 5, '2012-06-13', '0000-00-00', '12:03:00', '09:37:00', 'ENERGIA FUTURA ', 'RETIRAR CHEQUE ', 'PRIEMRO CONFIRMARE POR RADIO ', '2012-06-12', 'T', '', 43, 'Karla Jacome', 'T'),
(822, 0, 1, '2012-06-13', '0000-00-00', '12:07:00', '12:58:00', 'SERINPE', 'ENTREGAR FACTURAR', 'ENTREGA DE FACTURAS', '2012-06-12', 'M', '', 52, 'Martha Marulanda', 'T'),
(842, 1, 4, '2012-06-13', '0000-00-00', '12:14:00', '08:50:00', 'GERENCIA DE REFINACIÓN', 'ENTREGA FACTURA', 'ENTREGAR A MARISOL ANDRADE', '2012-06-13', 'T', '', 5, 'Maria Piedad', 'T'),
(823, 1, 2, '2012-06-12', '0000-00-00', '12:28:00', '09:35:00', 'ADUANA QUITO ', 'INGRESAR TRAMITE ', 'DK -464<br />\n', '2012-06-12', 'T', '', 43, 'Karla Jacome', 'T'),
(824, 1, 3, '2012-06-12', '0000-00-00', '12:32:00', '09:35:00', 'SENAE', 'TRAMITE DEVOLUCION DE GARANTIA', 'ENTREGAR A DIANA', '2012-06-12', 'T', '', 5, 'Maria Piedad', 'T'),
(825, 1, 4, '2012-06-12', '0000-00-00', '12:40:00', '09:35:00', 'AZUL', 'RETIRO SOBRE RECEPCION', 'RETIRO DE SOBRE A NOMBRE DE MA. PIEDAD Y/O DENKEL CONTENIDO DAV SERINPE (ROBERTO ABEDRABO)', '2012-06-12', 'T', '', 5, 'Maria Piedad', 'T'),
(826, 1, 7, '2012-06-13', '0000-00-00', '15:26:00', '08:50:00', 'PRODUCCION ', 'RETIRO DOCS ', 'JUAN DIEGO ', '2012-06-12', 'T', '', 43, 'Karla Jacome', 'T'),
(827, 1, 8, '2012-06-12', '0000-00-00', '16:15:00', '09:35:00', 'ADUANA QUITO', 'TRAMITE', 'TRAVEZ ', '2012-06-12', 'T', '', 43, 'Karla Jacome', 'T'),
(828, 0, 13, '2012-06-13', '0000-00-00', '16:18:00', '12:58:00', 'ENERGIA FUTURA ', 'RETIRAR CHEQUE ', 'JACQUELINE.', '2012-06-12', 'M', '', 43, 'Karla Jacome', 'T'),
(829, 0, 14, '2012-06-13', '0000-00-00', '16:46:00', '12:59:00', 'ENERGIA FUTURA', 'ENTREGA FACTURAS', 'Y RETIRO DE CHEQUE', '2012-06-12', 'M', '', 51, 'Anita Paucar', 'T'),
(830, 0, 6, '2012-06-13', '0000-00-00', '16:47:00', '12:58:00', 'MECAGRUN', 'ENTREGA FACTURAS', 'AA. MIGUEL ANGEL ALVAREZ<br />\n', '2012-06-12', 'M', '', 51, 'Anita Paucar', 'T'),
(831, 1, 6, '2012-06-13', '0000-00-00', '16:48:00', '08:50:00', 'ARISBERG', 'ENTREGA FACTURAS', 'DK-477 ', '2012-06-12', 'T', '', 51, 'Anita Paucar', 'T'),
(832, 0, 8, '2012-06-13', '0000-00-00', '16:48:00', '12:58:00', 'PREMIUMCORP', 'ENTREGA FACTURAS', 'DK-479', '2012-06-12', 'M', '', 51, 'Anita Paucar', 'T'),
(833, 0, 9, '2012-06-13', '0000-00-00', '16:49:00', '12:58:00', 'CARGONET', 'ENTREGA FACTURAS', 'DK-442 Y 421', '2012-06-12', 'M', '', 51, 'Anita Paucar', 'T'),
(834, 0, 10, '2012-06-13', '0000-00-00', '16:49:00', '12:58:00', 'VITRUM', 'ENTREGA FACTURAS', 'ATT. ANDREA MOLINA', '2012-06-12', 'M', '', 51, 'Anita Paucar', 'T'),
(835, 0, 11, '2012-06-13', '0000-00-00', '16:50:00', '12:58:00', 'S.J. JERSEY ECUATORIANO', 'ENTREGA FACTURAS', 'DK-503<br />\n', '2012-06-12', 'M', '', 51, 'Anita Paucar', 'T'),
(836, 0, 15, '2012-06-13', '0000-00-00', '16:50:00', '12:59:00', 'MODALTRADE', 'ENTREGA FACTURAS', '411 Y 353', '2012-06-12', 'M', '', 51, 'Anita Paucar', 'T'),
(837, 0, 12, '2012-06-13', '0000-00-00', '17:32:00', '12:58:00', 'SENAE', 'ENTREGA DE DOCUMENTOS', 'DK-478<br />\nDK-375', '2012-06-12', 'M', '', 5, 'Maria Piedad', 'T'),
(838, 1, 9, '2012-06-13', '0000-00-00', '08:39:00', '08:50:00', 'TRAUMA ORTOPEDICS', 'ENTREGA DE FACTURAS', 'DK-481', '2012-06-13', 'T', '', 51, 'Anita Paucar', 'T'),
(839, 0, 18, '2012-06-13', '0000-00-00', '08:47:00', '12:59:00', 'PRODUBANCO', 'DEPOSITO', 'DEPOSITO CHEQUE GRAPHIC', '2012-06-13', 'M', '', 52, 'Martha Marulanda', 'T');
INSERT INTO `dnk_mensajeria_ant` (`id`, `columna`, `fila`, `fecha`, `fecha_crea`, `hora`, `hora_fin`, `cliente`, `actividad`, `observacion`, `programada`, `turno`, `obser_cancel`, `user_id`, `user_name`, `estado`) VALUES
(840, 1, 8, '2012-06-13', '0000-00-00', '09:32:00', '08:50:00', 'MINISTERIO', 'RETIRAR DOCUMENTOS', 'RETIRAR CON MARÍA EUGENIA ALMEIDA', '2012-06-13', 'T', '', 5, 'Maria Piedad', 'T'),
(841, 1, 2, '2012-06-13', '0000-00-00', '12:13:00', '08:50:00', 'TAMPA ', 'RETIRAR FACTURA ', 'VALOR $146<br />\n<br />\nSE LA DEBE ENTREGAR EN ENRGIA FUTURA ', '2012-06-13', 'T', '', 43, 'Karla Jacome', 'T'),
(843, 0, 11, '2012-06-14', '0000-00-00', '12:14:00', '13:19:00', 'ENERGIA FUTURA ', 'ENTREGAR FACTURA DE TAMPA ', 'A JACQUELINE SI ES POSIBLE HOY EN LA TARDE 13/06/2012 ', '2012-06-13', 'M', '', 43, 'Karla Jacome', 'T'),
(844, 1, 1, '2012-06-13', '0000-00-00', '12:15:00', '08:49:00', 'ADUANA ', 'TRAMITE ', 'SABIJERS ', '2012-06-13', 'T', '', 43, 'Karla Jacome', 'T'),
(845, 1, 3, '2012-06-13', '0000-00-00', '12:38:00', '08:50:00', 'TRANSOCEANICA', 'RETIRO DE FACTURAS ORIGINALES Y ENTREGA DE RETENCIÓN', ' RETIRODE FACTURAS ORIGINALES Y ENTREGA DE RETENCIÓN, ALEXANDRA GUACHAMIN, PREGUNTAR POR BL', '2012-06-13', 'T', '', 5, 'Maria Piedad', 'T'),
(846, 1, 5, '2012-06-13', '0000-00-00', '13:05:00', '08:50:00', 'MODAL TRADE', 'ENTREGAR FACTURAS', 'ENTREGAR FACTURAS', '2012-06-13', 'T', '', 44, 'Paola Paredes', 'T'),
(847, 0, 2, '2012-06-14', '0000-00-00', '13:08:00', '13:22:00', 'ADUANA', 'TRAMITE', 'schreder ecuador ', '2012-06-13', 'M', '', 43, 'Karla Jacome', 'T'),
(848, 0, 3, '2012-06-14', '0000-00-00', '15:57:00', '13:22:00', 'PROAÑO REPRESENTACIONES', 'RETIRO DE RETENCIONES', 'CON JOHANA GARZÓN', '2012-06-13', 'M', '', 5, 'Maria Piedad', 'T'),
(849, 0, 8, '2012-06-14', '0000-00-00', '16:55:00', '13:22:00', 'FRANCISCO ALARCON', 'ENTREGA FACTURAS', 'DK-127', '2012-06-13', 'M', '', 51, 'Anita Paucar', 'T'),
(850, 1, 21, '2012-06-14', '0000-00-00', '16:56:00', '09:04:00', 'CIRSA', 'ENTREGA DE FACTURAS', 'DK-520', '2012-06-13', 'T', '', 51, 'Anita Paucar', 'T'),
(851, 1, 22, '2012-06-14', '0000-00-00', '19:42:00', '09:04:00', 'PRODUCCION ', 'RETIRAR DOCS', 'JUAN DIEGO ', '2012-06-13', 'T', '', 43, 'Karla Jacome', 'T'),
(852, 1, 1, '2012-06-14', '0000-00-00', '09:24:00', '08:59:00', 'MINISTERIO DE SALU PUBLICA', 'ENTREGA CARTA Y FACTURAS', 'VARIAS. FAVOR SOLICITAR EL TESORERIA 1 CHEQUE DEL dk-285 ANTERIOR', '2012-06-14', 'T', '', 51, 'Anita Paucar', 'T'),
(853, 0, 12, '2012-06-14', '0000-00-00', '09:24:00', '13:19:00', 'ENERGIA FUTURA', 'ENTREGA FACTURA', 'TRANSPORTE DK-482 CON GUIA 1812', '2012-06-14', 'M', '', 51, 'Anita Paucar', 'T'),
(854, 0, 4, '2012-06-14', '0000-00-00', '09:27:00', '13:21:00', 'PROAÑO', 'ENTREGA FACTURAS', 'DK497 Y 494', '2012-06-14', 'M', '', 51, 'Anita Paucar', 'T'),
(855, 0, 5, '2012-06-14', '0000-00-00', '09:27:00', '13:21:00', 'INEN', 'ENTREGA INEN ELECTRONICO', 'DEJAR DOCUMENTOS DE PROAÑO EN INEN', '2012-06-14', 'M', '', 5, 'Maria Piedad', 'T'),
(856, 0, 7, '2012-06-14', '0000-00-00', '09:31:00', '13:19:00', 'S.J. JERSEY ECUATORIANO', 'ENTREGA FACTURAS', 'DK-484', '2012-06-14', 'M', '', 51, 'Anita Paucar', 'T'),
(857, 1, 14, '2012-06-14', '0000-00-00', '10:06:00', '09:03:00', 'DSV GL', 'SELLAR GUIA ', 'GONZALO BENAVIDES N54-15 Y GONZALO GALLO <br />\nEDIF MARIA GABRIELA OFI 1B<br />\nADJUTNO PAGO', '2012-06-14', 'T', '', 43, 'Karla Jacome', 'T'),
(858, 1, 12, '2012-06-14', '0000-00-00', '10:28:00', '09:03:00', 'TRANSOCEANICA', 'RETIRAR BL SEGÚN OFICIO', 'RETIRAR BL ORIGINAL SEGÚN OFICIO DNKL 452-2012', '2012-06-14', 'T', '', 5, 'Maria Piedad', 'T'),
(859, 1, 16, '2012-06-14', '0000-00-00', '10:53:00', '09:04:00', 'DOLMAR', 'RETIRAR DOCUMENTOS ORIGINALES', 'RETIRAR GUÍA Nº UA1206005ICN', '2012-06-14', 'T', '', 5, 'Maria Piedad', 'T'),
(860, 1, 8, '2012-06-14', '0000-00-00', '11:08:00', '09:03:00', 'aduana', 'entregar tramite', 'htm hight tech', '2012-06-14', 'T', '', 44, 'Paola Paredes', 'T'),
(861, 0, 11, '2012-06-15', '0000-00-00', '11:19:00', '14:11:00', 'SERIMPE', 'RETIRAR CHEQUE', 'CON SRA. FANNY DE 3:00 A 3:45 PM', '2012-06-14', 'M', '', 5, 'Maria Piedad', 'T'),
(862, 1, 18, '2012-06-14', '0000-00-00', '11:38:00', '09:04:00', 'BANCO INTERNACIONAL', 'PAGO AL EXTERIOR', 'LOGISTICS FREIGHT', '2012-06-14', 'T', '', 51, 'Anita Paucar', 'T'),
(863, 1, 15, '2012-06-14', '0000-00-00', '11:44:00', '09:04:00', 'MARTINAIR CARGA ', 'RETIRAR FACTURAS DE TRES GUIAS ', 'ADJUNTO PAGOS TRES GUIAS <br />\nLLEVAR TRES RETENCIONES <br />\nGUIA 1 # 12959582795<br />\nGUIA 2 #12959582806<br />\nGUIA 3 #12959582810', '2012-06-14', 'T', '', 43, 'Karla Jacome', 'T'),
(864, 1, 5, '2012-06-14', '0000-00-00', '11:44:00', '09:03:00', 'SJ JERSEY', 'RETIRAR DOCUMENTOS ORIGINALES', 'CON ANDREA MOLINA', '2012-06-14', 'T', '', 5, 'Maria Piedad', 'T'),
(865, 0, 17, '2012-06-15', '0000-00-00', '11:49:00', '14:11:00', 'SUPERINTENDENCIA DE COMPANIAS', 'SOLICITAR CERTIFICADOS', 'DE EXISTENCIA LEGAL Y CUMPLIMIENTO DE OBLIGACIONES', '2012-06-14', 'M', '', 51, 'Anita Paucar', 'T'),
(866, 0, 16, '2012-06-15', '0000-00-00', '11:51:00', '14:11:00', 'IESS', 'SOLICITAR CERTIFICADO', 'DE CUMPLIMIENTO DE OBLIGACIONES', '2012-06-14', 'M', '', 51, 'Anita Paucar', 'T'),
(867, 1, 7, '2012-06-14', '0000-00-00', '12:28:00', '09:03:00', 'IMPROLAB', 'RETIRO CHEQUE', 'RETIRAR CHEQUE PARA SENAE CON SOFIA', '2012-06-14', 'T', '', 5, 'Maria Piedad', 'T'),
(868, 1, 3, '2012-06-14', '0000-00-00', '12:28:00', '09:02:00', 'SK ENGINEERING', 'RETIRAR CHEQUE', 'RETIRAR CHEQUE PARA SENAE CON HANNA', '2012-06-14', 'T', '', 5, 'Maria Piedad', 'T'),
(869, 1, 9, '2012-06-14', '0000-00-00', '13:17:00', '09:03:00', 'ADUANA ', 'TRAMITE ', 'MALUENDA ', '2012-06-14', 'T', '', 43, 'Karla Jacome', 'T'),
(870, 1, 6, '2012-06-14', '0000-00-00', '13:22:00', '09:03:00', 'VITRUM', 'ENTREGA DE FACTURA', 'DK-468 FAVOR TRAER DE VUELTA LA FACTURA 11786', '2012-06-14', 'T', '', 51, 'Anita Paucar', 'T'),
(871, 1, 19, '2012-06-14', '0000-00-00', '13:28:00', '09:04:00', 'PRODUBANCO', 'DEPOSITO CHEQUE', '2712 AZUL', '2012-06-14', 'T', '', 51, 'Anita Paucar', 'T'),
(885, 0, 1, '2012-06-15', '0000-00-00', '09:06:00', '14:10:00', 'TRASNPORTES eCUADOR', 'RETIRAR VALIJA', 'RETIRAR VALIJA', '2012-06-15', 'M', '', 44, 'Paola Paredes', 'T'),
(872, 1, 20, '2012-06-14', '0000-00-00', '13:35:00', '09:04:00', 'PRODUBANCO', 'CAMBIAR CHEQUE', 'CAJA CHICA', '2012-06-14', 'T', '', 51, 'Anita Paucar', 'T'),
(873, 1, 11, '2012-06-14', '0000-00-00', '13:37:00', '09:03:00', 'aduana ', 'entregar telefono', 'entregar telelefono y $5 para andres', '2012-06-14', 'T', '', 44, 'Paola Paredes', 'T'),
(874, 1, 10, '2012-06-14', '0000-00-00', '13:37:00', '09:03:00', 'ADUANA', 'ENTREGA FORMULARIO', 'PRODUBANCO APERTURA CUENTA', '2012-06-14', 'T', '', 51, 'Anita Paucar', 'T'),
(875, 1, 13, '2012-06-14', '0000-00-00', '13:37:00', '09:03:00', 'DHL ', 'RETIRO DE GUIA', 'DIRECCION <br />\nANTONIO NAVARRO  N32-66 Y ANDRADE MARIN <br />\nATRAS DEL CIESPAL <br />\nDHL GLOBAL ', '2012-06-14', 'T', '', 43, 'Karla Jacome', 'T'),
(876, 0, 3, '2012-06-15', '0000-00-00', '13:38:00', '14:10:00', 'AZULEC', 'RETIRAR DAV ', 'MORAYMA ARIAS <br />\n<br />\nBAJO CONFIRMACION ', '2012-06-14', 'M', '', 43, 'Karla Jacome', 'T'),
(877, 0, 14, '2012-06-15', '0000-00-00', '14:18:00', '14:11:00', 'GRAPHICSOURSE', 'ENTREGA DE CHEQUE', 'CON MARGARITA ORTIZ', '2012-06-14', 'M', '', 5, 'Maria Piedad', 'T'),
(878, 0, 7, '2012-06-15', '0000-00-00', '15:52:00', '14:11:00', 'PROAÑO REPRESENTACIONES', 'RETIRO DE TRAMITE Y RETENCIONES', 'CON JOHANA GARZÓN', '2012-06-14', 'M', '', 5, 'Maria Piedad', 'T'),
(879, 0, 13, '2012-06-15', '0000-00-00', '17:00:00', '14:11:00', 'CORREOS DEL ECUADOR', 'ENVIAR SOBRE', 'A PANAMA PTCORP', '2012-06-14', 'M', '', 51, 'Anita Paucar', 'T'),
(880, 0, 2, '2012-06-15', '0000-00-00', '17:08:00', '09:18:00', 'MINISTERIO DE SALUD', 'ENTREGA DE DAU', 'CON MARIA EUGENIA ALMEIDA', '2012-06-14', 'M', 'N/A', 5, 'Maria Piedad', 'C'),
(881, 0, 15, '2012-06-15', '0000-00-00', '17:25:00', '14:11:00', 'BYRON VELASCO', 'ENTREGA DE FACTURAS', 'DK-472', '2012-06-14', 'M', '', 51, 'Anita Paucar', 'T'),
(882, 0, 7, '2012-06-14', '0000-00-00', '17:30:00', '00:00:00', 'CIRSA', 'RETIRAR CHEQUE', 'DK-520', '2012-06-14', 'N', '', 51, 'Anita Paucar', 'P'),
(883, 0, 12, '2012-06-15', '0000-00-00', '17:32:00', '14:11:00', 'IMPROLAB', 'RETIRAR CHEQUE', 'DE 11 A 1 PM', '2012-06-14', 'M', '', 51, 'Anita Paucar', 'T'),
(884, 0, 3, '2012-06-15', '0000-00-00', '08:43:00', '09:19:00', 'SENAE', 'ENTREGA OFICICIO PARA DEPARTAMENTO GRANTIAS', 'ENTREGAR A DIANA', '2012-06-15', 'M', '', 5, 'Maria Piedad', 'T'),
(886, 0, 9, '2012-06-15', '0000-00-00', '09:08:00', '14:11:00', 'PROAÑO REPRESENTACIONES', 'RETIRO DE CHEQUE PARA SENAE', 'LLEVAR A LA SENAE, PARA DIANA', '2012-06-15', 'M', '', 5, 'Maria Piedad', 'T'),
(887, 1, 2, '2012-06-15', '0000-00-00', '11:18:00', '16:40:00', 'SK ENGINEERING', 'RETIRAR CHEQUE', 'DE 2 A 5', '2012-06-15', 'T', '', 51, 'Anita Paucar', 'T'),
(888, 0, 10, '2012-06-15', '0000-00-00', '11:18:00', '14:11:00', 'S.J. JERSEY ECUATORIANO', 'RETIRAR CHEQUE', 'HASTA LAS 12 PM', '2012-06-15', 'M', '', 51, 'Anita Paucar', 'T'),
(889, 1, 5, '2012-06-15', '0000-00-00', '11:21:00', '16:40:00', 'OCP', 'RETIRO DE DOCUMENTOS', 'RETIRAR DOCUMENTOS CON VIVIANA ZAPATA', '2012-06-15', 'T', '', 5, 'Maria Piedad', 'T'),
(890, 1, 1, '2012-06-15', '0000-00-00', '11:25:00', '16:40:00', 'ADUANA', 'TRAMITES ', 'PACHECO/INTERMEDIA E IMPELQUALITY ', '2012-06-15', 'T', '', 43, 'Karla Jacome', 'T'),
(891, 1, 3, '2012-06-15', '0000-00-00', '13:10:00', '16:40:00', 'MINISTERIO DE SALUD PUBLICA', 'ENTREG FACTURAS', '12  TRAMITES', '2012-06-15', 'T', '', 51, 'Anita Paucar', 'T'),
(892, 1, 4, '2012-06-15', '0000-00-00', '13:57:00', '16:40:00', 'PRODUCCION', 'DAV', 'JUAN DIEGO ', '2012-06-15', 'T', '', 43, 'Karla Jacome', 'T'),
(893, 1, 1, '2012-06-16', '0000-00-00', '16:43:00', '00:00:00', 'PRUEBA', 'Prueba', 'hgfhjfgujh', '2012-06-15', 'M', '', 3, 'Willian Espinosa', 'P'),
(894, 0, 3, '2012-06-18', '0000-00-00', '17:08:00', '12:32:00', 'ADUANA', 'SACAR COPIA DE LLAVES', 'ENTREGAR A ANDRES', '2012-06-15', 'M', '', 51, 'Anita Paucar', 'T'),
(895, 0, 1, '2012-06-18', '0000-00-00', '17:37:00', '12:32:00', 'PRODUBANCO', 'DEPOSITO', '3 CHEQUES', '2012-06-15', 'M', '', 51, 'Anita Paucar', 'T'),
(896, 1, 6, '2012-06-18', '0000-00-00', '17:46:00', '00:00:00', 'SK ENGINEERING', 'ENTREGA FACTURAS', 'DK-475', '2012-06-15', 'T', '', 51, 'Anita Paucar', 'P'),
(897, 0, 9, '2012-06-18', '0000-00-00', '08:56:00', '12:32:00', 'PRODUCCION', 'DAV RETIRAR', 'JUAN DIEGO BRITO ', '2012-06-18', 'M', '', 43, 'Karla Jacome', 'T'),
(901, 0, 6, '0000-00-00', '0000-00-00', '09:22:00', '00:00:00', 'PRODUCCION ', 'ENTREGAR DOCS', 'N', '2012-06-18', 'N', '', 44, 'Paola Paredes', 'P'),
(898, 0, 6, '2012-06-18', '0000-00-00', '09:19:00', '12:31:00', 'GRAFICSOURSE', 'ENTREGAR FACTURAS', 'N/A', '2012-06-18', 'M', '', 44, 'Paola Paredes', 'T'),
(899, 0, 10, '2012-06-18', '0000-00-00', '09:20:00', '12:31:00', 'REFINACION', 'ENTREGAR DOCS', 'N/A', '2012-06-18', 'M', '', 44, 'Paola Paredes', 'T'),
(900, 0, 11, '2012-06-18', '0000-00-00', '09:21:00', '12:31:00', 'INEN', 'INGRESAR INEN PROAÑO', 'N/A', '2012-06-18', 'M', '', 44, 'Paola Paredes', 'T'),
(902, 1, 9, '2012-06-18', '0000-00-00', '09:22:00', '00:00:00', 'BYRON VELASCO', 'ENTREGAR FACTURAS', 'N', '2012-06-18', 'T', '', 44, 'Paola Paredes', 'P'),
(903, 1, 5, '2012-06-18', '2012-06-18', '09:31:00', '13:10:00', 'PRUEBA', 'Prueba', 'sefasdfasdf', '2012-06-18', 'T', '', 3, 'Willian Espinosa', 'T'),
(904, 1, 1, '2012-06-18', '2012-06-18', '09:40:00', '00:00:00', 'PROAÑO REPRESENTACIONES', 'RETIRO DE DOCUMENTOS ', 'RETIRO DE DOCUMENTOS CON JOHANNA', '2012-06-18', 'T', '', 5, 'Maria Piedad', 'P'),
(905, 1, 2, '2012-06-18', '2012-06-18', '12:09:00', '00:00:00', 'ADUANA QUITO', 'TRAMITE ', 'SURGICALMED ', '2012-06-18', 'T', '', 43, 'Karla Jacome', 'P'),
(906, 1, 4, '2012-06-18', '2012-06-18', '13:01:00', '00:00:00', 'MINISTERIO DE SALUD', 'ENTREGA ', 'CARTA + RETENCION ORIGINAL + 2 COPIAS<br />\n', '2012-06-18', 'T', '', 51, 'Anita Paucar', 'P'),
(907, 1, 7, '2012-06-18', '2012-06-18', '13:01:00', '00:00:00', 'SK ENGINEERING', 'ENTREGA FACTURAS', 'VARIAS', '2012-06-18', 'T', '', 51, 'Anita Paucar', 'P'),
(908, 1, 5, '2012-06-18', '2012-06-18', '13:02:00', '00:00:00', 'S.J. JERSEY ECUATORIANO', 'ENTREGA FACTURAS', 'DK-524', '2012-06-18', 'T', '', 51, 'Anita Paucar', 'P'),
(909, 1, 8, '2012-06-18', '2012-06-18', '13:12:00', '00:00:00', 'produccion ', 'entregar comprobante ', 'n', '2012-06-18', 'T', '', 44, 'Paola Paredes', 'P'),
(910, 1, 3, '2012-06-18', '2012-06-18', '13:45:00', '00:00:00', 'SENAE', 'ENTREGA DE TRAMITE', 'ENTREGAR TRAMITE A DIANA', '2012-06-18', 'T', '', 5, 'Maria Piedad', 'P'),
(911, 0, 4, '2012-06-19', '2012-06-18', '14:35:00', '13:56:00', 'GERENCIA REFINACION', 'ENTREGA DE RETENCIONES', 'ENTREGAR A MARISOL ANDRADE', '2012-06-18', 'M', '', 5, 'Maria Piedad', 'T'),
(912, 0, 1, '2012-06-19', '2012-06-18', '14:51:00', '13:56:00', 'ADUANA', 'ENTREGA CHEQUES', 'ATT. DIANA GONZA<br />\n', '2012-06-18', 'M', '', 51, 'Anita Paucar', 'T'),
(913, 0, 5, '2012-06-19', '2012-06-18', '14:52:00', '13:56:00', 'PICHINCHA', 'DEPOSITO CHEQUE', 'CTA AHORROS', '2012-06-18', 'M', '', 51, 'Anita Paucar', 'T'),
(914, 0, 3, '2012-06-19', '2012-06-18', '15:48:00', '13:56:00', 'SJ JERSEY', 'RETIRO DE CHEQUE', 'RETIRO DE CHEQUE PARA MAERSK CON ANDREA MOLINA', '2012-06-18', 'M', '', 5, 'Maria Piedad', 'T'),
(915, 0, 7, '2012-06-19', '2012-06-18', '17:39:00', '13:56:00', 'PRODUBANCO', 'TRAMITACION', 'APERTURA CTA ANDRES LLEVAR CARTA + FORMULARIOS', '2012-06-18', 'M', '', 51, 'Anita Paucar', 'T'),
(916, 0, 2, '2012-06-19', '2012-06-19', '10:23:00', '13:13:00', 'buro de credito', 'solicitar certificado', 'URGENTE', '2012-06-19', 'M', '', 44, 'Paola Paredes', 'T'),
(917, 1, 1, '2012-06-19', '2012-06-19', '10:24:00', '00:00:00', 'IESS', 'solicitud ', 'URGENTE', '2012-06-19', 'T', '', 44, 'Paola Paredes', 'P'),
(918, 0, 8, '2012-06-19', '2012-06-19', '10:24:00', '13:56:00', 'PRODUBANCO ', 'SOLICUTUD', 'SOLICITUD ANDRES', '2012-06-19', 'M', '', 44, 'Paola Paredes', 'T'),
(919, 1, 3, '2012-06-19', '2012-06-19', '10:55:00', '00:00:00', 'EP EMPRESA PÚBLICA', 'RETIRO DE DAV', 'RETIRAR CON MARISOL ANDRADE', '2012-06-19', 'T', '', 5, 'Maria Piedad', 'P'),
(920, 1, 2, '2012-06-19', '2012-06-19', '13:49:00', '00:00:00', 'ADUANA', 'TRAMITE EXPO TEMPORAL ', 'TRAMITE EXPO TEMPORAL DK 238', '2012-06-19', 'T', '', 43, 'Karla Jacome', 'P'),
(921, 1, 3, '2012-06-19', '2012-06-19', '14:08:00', '00:00:00', 'OCP ', 'RETIRO DE DOCUMENTOS ', 'RETIRO DE DOCUMENTOS CON VIVIANA ZAPATA', '2012-06-19', 'T', '', 5, 'Maria Piedad', 'P'),
(922, 0, 4, '2012-06-19', '2012-06-19', '16:07:00', '00:00:00', 'TRAUMA ORTOPEDICS', 'ENTREGA FACTURAS', 'DK-491', '2012-06-19', 'N', '', 51, 'Anita Paucar', 'P'),
(923, 0, 6, '2012-06-20', '2012-06-19', '16:07:00', '13:40:00', 'FLOWSEAL', 'ENTREGA FACTURAS', 'DK-518', '2012-06-19', 'M', '', 51, 'Anita Paucar', 'T'),
(924, 0, 5, '2012-06-20', '2012-06-19', '16:07:00', '13:40:00', 'TRAUMA ORTOPEDICS', 'ENTREGA FACTURAS', 'DK-491', '2012-06-19', 'M', '', 51, 'Anita Paucar', 'T'),
(925, 0, 4, '2012-06-20', '2012-06-19', '16:08:00', '13:40:00', 'CARLOS GARZON', 'ENTREGA FACTURA', 'DK-423', '2012-06-19', 'M', '', 51, 'Anita Paucar', 'T'),
(926, 0, 7, '2012-06-20', '2012-06-19', '16:08:00', '13:40:00', 'RUTH PEÑA', 'ENTREGA DE FACTURAS', 'DK-451', '2012-06-19', 'M', '', 51, 'Anita Paucar', 'T'),
(927, 0, 1, '2012-06-20', '2012-06-19', '17:42:00', '13:40:00', 'SENEA', 'PARA DIANA//ANDRES', 'INGRESAR TRAMITE OCP EN VENTANILLA REGIMENES ESPECIALES', '2012-06-19', 'M', '', 5, 'Maria Piedad', 'T'),
(928, 0, 8, '2012-06-20', '2012-06-20', '09:20:00', '13:41:00', 'IESS', 'REALIZAR SOLICITUD', 'REALIZAR SOLICITUD', '2012-06-20', 'M', '', 44, 'Paola Paredes', 'T'),
(929, 0, 2, '2012-06-20', '2012-06-20', '09:21:00', '13:40:00', 'ADUANA', 'CARTAS ', 'CARTAS EXPO TEMPORALES ', '2012-06-20', 'M', '', 43, 'Karla Jacome', 'T'),
(930, 0, 9, '2012-06-20', '2012-06-20', '09:22:00', '13:41:00', 'OCP', 'ENTREGAR DOCUMENTOS', 'N/A', '2012-06-20', 'M', '', 44, 'Paola Paredes', 'T'),
(931, 0, 3, '2012-06-20', '2012-06-20', '09:23:00', '13:40:00', 'IMPEXAZUL', 'ENTREGAR FACTURAS', 'N/A', '2012-06-20', 'M', '', 44, 'Paola Paredes', 'T'),
(932, 1, 2, '2012-06-20', '2012-06-20', '11:56:00', '00:00:00', 'FLOWSEAL', 'ENTREGAR CARTA', 'CON MARY MARTINEZ', '2012-06-20', 'T', '', 5, 'Maria Piedad', 'P'),
(933, 1, 1, '2012-06-20', '2012-06-20', '11:59:00', '00:00:00', 'PROAÑO', 'ENTREGA FACTURAS', 'A TRAMITE', '2012-06-20', 'T', '', 51, 'Anita Paucar', 'P'),
(934, 1, 2, '2012-06-20', '2012-06-20', '11:59:00', '00:00:00', 'SERINPE', 'ENTREGA FACTURAS', '1 TRAMITE', '2012-06-20', 'T', '', 51, 'Anita Paucar', 'P'),
(935, 1, 3, '2012-06-20', '2012-06-20', '11:59:00', '00:00:00', 'IMPROLAB', 'ENTREGA DE FACTURAS', '1 TRAMITE', '2012-06-20', 'T', '', 51, 'Anita Paucar', 'P'),
(936, 1, 4, '2012-06-20', '2012-06-20', '12:01:00', '00:00:00', 'TAME/AEROGAL', 'ENVIO COMPUTADOR', 'ENVIO DE COMPUTADOR PARA GYE', '2012-06-20', 'T', '', 51, 'Anita Paucar', 'P'),
(937, 1, 5, '2012-06-20', '2012-06-20', '12:01:00', '00:00:00', 'CELEC', 'RETIRAR CHEQUE DE PAGO', 'DE 2 A 4 PM', '2012-06-20', 'T', '', 51, 'Anita Paucar', 'P'),
(938, 1, 3, '2012-06-21', '2012-06-20', '14:29:00', '16:28:00', 'OFICINA SEÑOR FRANCISO ALARCÓN', 'ENTRGA DE PÓLIZA SOBRE GARANTIA ADUANERA', 'ENTREGA DE GARANTÍA DK 127', '2012-06-20', 'T', '', 5, 'Maria Piedad', 'T'),
(939, 1, 2, '2012-06-21', '2012-06-20', '14:33:00', '12:41:00', 'GERENCIA DE REFINACIÓN', 'ENTREGA DE RETENCIONES Y COMPROBANTES DE EGRESO', 'ENTREGAR A MARISOL ANDRADE', '2012-06-20', 'T', '', 5, 'Maria Piedad', 'T'),
(940, 1, 3, '2012-06-21', '2012-06-20', '15:51:00', '12:44:00', 'IMPEXNET', 'RETIRAR GUÍA', 'CON VALERIA ARIAS  NUMERO DE GUÍA UA1206008ICN', '2012-06-20', 'T', '', 5, 'Maria Piedad', 'T'),
(941, 1, 1, '2012-06-21', '2012-06-20', '15:54:00', '16:28:00', 'PROAÑO REPRESENTACIONES', 'RETIRAR DAV', 'RETIRAR CON JOHANNA GARZÓN', '2012-06-20', 'T', '', 5, 'Maria Piedad', 'T'),
(942, 1, 4, '2012-06-21', '2012-06-20', '16:18:00', '12:45:00', 'S.J. JERSEY', 'RETIRAR FORMULARIOS', 'ANULACION DE CHEQUE CERTIFICADO.', '2012-06-20', 'T', '', 51, 'Anita Paucar', 'T'),
(943, 0, 3, '2012-06-21', '2012-06-20', '18:51:00', '13:37:00', 'PRODUBANCO', 'DEPOSTO', 'CHEQUE CELEC ', '2012-06-20', 'M', '', 51, 'Anita Paucar', 'T'),
(944, 0, 4, '2012-06-21', '2012-06-20', '18:51:00', '13:37:00', 'PICHINCHA', 'DEPOSITOS', 'CHEQUE SERINPE Y FLOWSEAL', '2012-06-20', 'M', '', 51, 'Anita Paucar', 'T'),
(945, 1, 8, '2012-06-21', '2012-06-20', '18:52:00', '12:45:00', 'DANIELCOM', 'ENTREGA FACTURAS', 'INMOPETROSA', '2012-06-20', 'T', '', 51, 'Anita Paucar', 'T'),
(946, 1, 9, '2012-06-21', '2012-06-21', '09:11:00', '12:45:00', 'KLM', 'RETIRO DE COPIA CERTIFICADA', 'SOLICITUD DE COPIA DE FACTURA CERTIFICADA Nº 004-001-0050845', '2012-06-21', 'T', '', 5, 'Maria Piedad', 'T'),
(949, 1, 2, '2012-06-21', '2012-06-21', '13:38:00', '16:28:00', 'ADUANA', 'ENTREGAR TRAMITE', 'N/A', '2012-06-21', 'T', '', 3, 'Willian Espinosa', 'T'),
(947, 1, 4, '2012-06-21', '2012-06-21', '11:49:00', '00:00:00', 'GERENCIA DESARROLLO ORGANIZACIONAL ', 'RETIRAR OFICIO ', 'IN. MA BELEN RIVADENEIRA// ', '2012-06-21', 'T', '', 43, 'Karla Jacome', 'P'),
(948, 1, 1, '2012-06-22', '2012-06-21', '12:07:00', '16:18:00', 'TRANSOCEANICA', 'RETIRAR BL-RETIRAR FACTURA', 'RETIRAR FACTURA', '2012-06-21', 'T', '', 5, 'Maria Piedad', 'T'),
(950, 1, 8, '2012-06-22', '2012-06-21', '14:42:00', '13:23:00', 'FEDEX', 'ENTREGA DE RETENCIÓN', 'RETENCIÓN Nº 4817', '2012-06-21', 'T', '', 5, 'Maria Piedad', 'T'),
(951, 1, 10, '2012-06-22', '2012-06-21', '16:17:00', '13:24:00', 'S.J. JERSEY', 'RETIRAR CHEQUE', 'DE VITRUM HASTA LAS 12 ', '2012-06-21', 'T', '', 51, 'Anita Paucar', 'T'),
(952, 1, 12, '2012-06-22', '2012-06-22', '08:42:00', '13:24:00', 'GRAPHICSOURSE', 'RETIRO DE TRÁMITE', 'CON NATALIA LÓPEZ', '2012-06-22', 'T', '', 5, 'Maria Piedad', 'T'),
(953, 1, 1, '2012-06-22', '2012-06-22', '08:45:00', '13:23:00', 'SENAE', 'ENTREGA DE TRAMITE', 'CON DIANA  ENTREGA DE TRÁMITE', '2012-06-22', 'T', '', 5, 'Maria Piedad', 'T'),
(954, 0, 2, '2012-06-25', '2012-06-22', '09:15:00', '14:53:00', 'INEN', 'REGISTRAR INEN ELECTRONICO', 'REGISTRAR INEN ELECTRONICO ', '2012-06-22', 'M', '', 5, 'Maria Piedad', 'T'),
(955, 1, 2, '2012-06-22', '2012-06-22', '09:17:00', '13:24:00', 'ADUANA ', 'TRAMITE', 'INNOVATRONICA <br />\n<br />\nDK-550<br />\n<br />\n', '2012-06-22', 'T', '', 43, 'Karla Jacome', 'T'),
(956, 1, 1, '2012-06-22', '2012-06-22', '09:35:00', '13:25:00', 'SJ JERSEY', 'RETIRO DE DOCUMENTOS', 'RETIRO DE TRAMITE CON ANDREA MOLINA', '2012-06-22', 'T', '', 5, 'Maria Piedad', 'T'),
(957, 0, 3, '2012-06-25', '2012-06-22', '10:22:00', '13:34:00', 'SK ENGINEERING', 'RETIRAR CHEQUE', 'A PARTIR DE LAS 2 PM', '2012-06-22', 'M', '', 51, 'Anita Paucar', 'T'),
(958, 0, 4, '2012-06-25', '2012-06-22', '10:23:00', '00:00:00', 'IMPROLAB', 'RETIRAR CHEQUE', 'CONFIRMADO', '2012-06-22', 'M', '', 51, 'Anita Paucar', 'P'),
(959, 1, 3, '2012-06-22', '2012-06-22', '11:20:00', '16:19:00', 'INFRI', 'ENTREGA DE FACTURAS', 'ATT. MA. CARMEN', '2012-06-22', 'T', '', 51, 'Anita Paucar', 'T'),
(960, 1, 5, '2012-06-22', '2012-06-22', '12:00:00', '16:19:00', 'SK ', 'RETIRO DE DAV', 'RETIRAR DAV CON HANNA', '2012-06-22', 'T', '', 5, 'Maria Piedad', 'T'),
(961, 1, 6, '2012-06-22', '2012-06-22', '12:27:00', '16:19:00', 'MODALTRADE', 'RETIRAR CHEQUE', 'EN LA TARDE', '2012-06-22', 'T', '', 51, 'Anita Paucar', 'T'),
(962, 1, 2, '2012-06-22', '2012-06-22', '12:51:00', '16:19:00', 'PROAÑO REPRESENTACIONES', 'RETIRO DE DOCUMENTOS ORIGINALES', 'CON JOHANNA GARZÓN', '2012-06-22', 'T', '', 5, 'Maria Piedad', 'T'),
(963, 1, 1, '2012-06-22', '2012-06-22', '12:53:00', '00:00:00', 'INTERNACIONAL', 'TRANSFERENCIA EXTERIOR', 'INTERWORLD', '2012-06-22', 'T', '', 51, 'Anita Paucar', 'P'),
(964, 1, 2, '2012-06-22', '2012-06-22', '13:08:00', '00:00:00', 'CORREOS DEL ECUADOR', 'ENVIAR SOBRE', 'PARA ESTADOS UNIDOS', '2012-06-22', 'T', '', 51, 'Anita Paucar', 'P'),
(965, 1, 8, '2012-06-22', '2012-06-22', '13:09:00', '16:19:00', 'PRODUBANCO', 'PAGO DE IMPUESTOS', '+$2 COMISION', '2012-06-22', 'T', '', 51, 'Anita Paucar', 'T'),
(978, 0, 2, '2012-06-25', '2012-06-25', '12:01:00', '14:58:00', 'PROAÑO REPRESENTACIONES', 'RETIRO DE DAVS ', 'RETIRO DE DAVS PARA GUAYAQUIL DK 560 CON JOHANA GARZÓN ', '2012-06-25', 'M', '', 5, 'Maria Piedad', 'T'),
(966, 0, 3, '2012-06-25', '2012-06-22', '15:59:00', '00:00:00', 'GERENCIA DE REFINACIÓN', 'ENTREGA DE FACTUCTURA Y RETENCIÓN ORIGINALES', 'CON TERESA YEPEZ', '2012-06-22', 'M', '', 5, 'Maria Piedad', 'P'),
(967, 0, 5, '2012-06-25', '2012-06-22', '16:19:00', '00:00:00', 'GRAPHICSOURSE', 'ENTREGAR  CHEQUE ', 'ENTREGAR A NATALIA LOPEZ', '2012-06-22', 'M', '', 5, 'Maria Piedad', 'P'),
(968, 0, 6, '2012-06-25', '2012-06-22', '16:52:00', '00:00:00', 'RUTH PEÑA', 'ENTREGA DE FACTURA', 'FAVOR SOLICITAR FACTURA ANULADA', '2012-06-22', 'M', '', 51, 'Anita Paucar', 'P'),
(969, 0, 7, '2012-06-25', '2012-06-22', '16:53:00', '00:00:00', 'PRODUBANCO', 'DEPOSITOS', '4 A LA CTA AHORROS', '2012-06-22', 'M', '', 51, 'Anita Paucar', 'P'),
(970, 0, 8, '2012-06-25', '2012-06-22', '16:54:00', '00:00:00', 'PRODUBANCO', 'TRANSFERENCIA AL EXTERIOR', 'INTERWIORLD', '2012-06-22', 'M', '', 51, 'Anita Paucar', 'P'),
(971, 0, 2, '2012-06-25', '2012-06-22', '17:46:00', '13:33:00', 'AZULEC', 'RETIRAR CHEQUE Y RETENCIONES', 'ATTT. MORAYMA ARIAS', '2012-06-22', 'M', '', 51, 'Anita Paucar', 'T'),
(972, 0, 4, '2012-06-25', '2012-06-22', '18:35:00', '13:34:00', 'SENAE', 'ENTREGA DE TRAMITE SK', 'ENTREGAR TRAMITE A ANDRES DK 557', '2012-06-22', 'M', '', 5, 'Maria Piedad', 'T'),
(973, 0, 6, '2012-06-25', '2012-06-25', '08:44:00', '13:35:00', 'OFICINA ADUANA', 'ENTREGAR PASAPORTE', 'ENTREGAR A ANDRÉS', '2012-06-25', 'M', '', 5, 'Maria Piedad', 'T'),
(974, 0, 8, '2012-06-25', '2012-06-25', '08:55:00', '13:40:00', 'INEN/GERENCIA DE TRANSPORTE', 'ENTREGAR INEN ELECTRONICO', 'ENTREGAR INEN ELECTRONICO EN VENTANILLAS INEN', '2012-06-25', 'M', '', 5, 'Maria Piedad', 'T'),
(975, 0, 9, '2012-06-25', '2012-06-25', '09:08:00', '13:36:00', 'LAN CARGO ', 'RETIRO GUIA ', '045-8914-7380', '2012-06-25', 'M', '', 43, 'Karla Jacome', 'T'),
(976, 0, 5, '2012-06-25', '2012-06-25', '09:10:00', '13:35:00', 'ADUANA ', 'TRAMITE ', 'FABRICA BIOS <br />\n<br />\nMALUENDA', '2012-06-25', 'M', '', 43, 'Karla Jacome', 'T'),
(977, 0, 1, '2012-06-25', '2012-06-25', '09:33:00', '13:30:00', 'OCP', 'RETIRO DE DOCUMENTO', 'RETIRAR CON VIVIANA ZAPATA', '2012-06-25', 'M', '', 5, 'Maria Piedad', 'T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_menu`
--

CREATE TABLE IF NOT EXISTS `dnk_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave secuencial de Menu Padre',
  `descripcion` varchar(200) NOT NULL COMMENT 'Descripcion del Menu Padre',
  `estado` varchar(1) NOT NULL DEFAULT 'A' COMMENT 'Estado del Menu Padre',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Volcar la base de datos para la tabla `dnk_menu`
--

INSERT INTO `dnk_menu` (`id`, `descripcion`, `estado`) VALUES
(1, 'Gestion', 'A'),
(2, 'Ingresos', 'A'),
(3, 'Visualizacion', 'A'),
(4, 'Servicio al Cliente', 'A'),
(5, 'Procesos', 'A'),
(6, 'Aduanas', 'A'),
(7, 'Liquidacion', 'A'),
(8, 'Despachos', 'A'),
(9, 'Abandonos', 'A'),
(10, 'Transporte', 'A'),
(11, 'Revisiones', 'A'),
(12, 'Contabilidad', 'A'),
(13, 'Administracion', 'A'),
(14, 'Usuarios', 'A'),
(15, 'Clientes', 'A'),
(16, 'Transportistas', 'A'),
(17, 'Mensajeria', 'A'),
(18, 'Valija', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_multas`
--

CREATE TABLE IF NOT EXISTS `dnk_multas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_TRAMITE_MULTA_id` int(11) NOT NULL,
  `fecha_liquidacion` date DEFAULT NULL,
  `ultimo_dia_pago` date DEFAULT NULL,
  `dau` varchar(250) NOT NULL,
  `valormulta` varchar(200) NOT NULL DEFAULT '0',
  `pagadopor` varchar(100) NOT NULL,
  `observacion` varchar(350) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `dnk_multas`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_notificacion_mail`
--

CREATE TABLE IF NOT EXISTS `dnk_notificacion_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo secuencial de la notificacion',
  `DNK_DOCUMENTO_codigo` varchar(20) NOT NULL COMMENT 'Codigo del tramite',
  `nombre_contacto` varchar(200) NOT NULL COMMENT 'Nombre del Contacto',
  `email_contacto` varchar(250) NOT NULL COMMENT 'Email del contacto',
  `lugar_contacto` varchar(1) NOT NULL COMMENT 'C=Cliente , I=Internos',
  `rol_id` int(11) DEFAULT NULL,
  `estado_contacto` varchar(1) NOT NULL COMMENT 'Estado del Contacto',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=211 ;

--
-- Volcar la base de datos para la tabla `dnk_notificacion_mail`
--

INSERT INTO `dnk_notificacion_mail` (`id`, `DNK_DOCUMENTO_codigo`, `nombre_contacto`, `email_contacto`, `lugar_contacto`, `rol_id`, `estado_contacto`) VALUES
(1, '13-DK-97', 'Maria Piedad', 'mariapiedadt@denkelservice.com', 'I', 3, 'A'),
(2, '13-DK-97', 'Hernan Jouve', 'hjouve@denkelservice.com', 'I', 3, 'A'),
(3, '13-DK-97', 'Karla Jacome', 'karlafjacome@denkelservice.com', 'I', 3, 'A'),
(4, '13-DK-97', 'Lorena Morales', 'asistente2@denkelservice.com', 'I', 3, 'A'),
(5, '13-DK-97', 'Juan Luis Mino', 'jlmino@denkelservice.com', 'I', 3, 'A'),
(6, '13-DK-97', 'Luis Felipe', 'luisfguzman@denkelservice.com', 'I', 4, 'A'),
(7, '13-DK-97', 'Edwin Jouve', 'edwinjouve@denkelservice.com', 'I', 4, 'A'),
(8, '13-DK-97', 'Fausto Riera', 'friera@denkelservice.com', 'I', 4, 'A'),
(9, '13-DK-97', 'Belen Jouve', 'belenjouve@denkelservice.com', 'I', 4, 'A'),
(10, '13-DK-97', 'Anita Paucar', 'analuciap@denkelservice.com', 'I', 5, 'A'),
(11, '13-DK-97', 'Monica Moreta', 'contabilidad@denkelservice.com', 'I', 5, 'A'),
(12, '13-DK-97', 'Paola Paredes', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(13, '13-DK-97', 'Zulay Tamayo', 'asistente1@denkelservice.com', 'I', 6, 'A'),
(14, '13-DK-97', 'Dulfary Villacres', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(15, '13-DK-97', 'Victor Jouve', 'comercial1@denkelservice.com', 'I', 7, 'A'),
(16, '13-DK-97', 'Maria Piedad', 'mariapiedadt@denkelservice.com', 'I', 3, 'A'),
(17, '13-DK-97', 'Hernan Jouve', 'hjouve@denkelservice.com', 'I', 3, 'A'),
(18, '13-DK-97', 'Karla Jacome', 'karlafjacome@denkelservice.com', 'I', 3, 'A'),
(19, '13-DK-97', 'Lorena Morales', 'asistente2@denkelservice.com', 'I', 3, 'A'),
(20, '13-DK-97', 'Juan Luis Mino', 'jlmino@denkelservice.com', 'I', 3, 'A'),
(21, '13-DK-97', 'Luis Felipe', 'luisfguzman@denkelservice.com', 'I', 4, 'A'),
(22, '13-DK-97', 'Edwin Jouve', 'edwinjouve@denkelservice.com', 'I', 4, 'A'),
(23, '13-DK-97', 'Fausto Riera', 'friera@denkelservice.com', 'I', 4, 'A'),
(24, '13-DK-97', 'Belen Jouve', 'belenjouve@denkelservice.com', 'I', 4, 'A'),
(25, '13-DK-97', 'Anita Paucar', 'analuciap@denkelservice.com', 'I', 5, 'A'),
(26, '13-DK-97', 'Monica Moreta', 'contabilidad@denkelservice.com', 'I', 5, 'A'),
(27, '13-DK-97', 'Paola Paredes', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(28, '13-DK-97', 'Zulay Tamayo', 'asistente1@denkelservice.com', 'I', 6, 'A'),
(29, '13-DK-97', 'Dulfary Villacres', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(30, '13-DK-97', 'Victor Jouve', 'comercial1@denkelservice.com', 'I', 7, 'A'),
(31, '13-DK-97', 'Jacqueline Stayce', 'jstacey@eppetroecuador.ec', 'C', 0, 'A'),
(32, '13-DK-97', 'Diego Salas ', 'dsalas@eppetroecuador.ec', 'C', 0, 'A'),
(33, '13-DK-97', 'Rosario Villegas', 'rvillegas@eppetroecuador.ec', 'C', 0, 'A'),
(34, '13-DK-97', 'Francisco Sánchez', 'fsanchez@ind.eppetroecuador.ec', 'C', 0, 'A'),
(35, '13-DK-97', 'Alexis Loor', 'aloor@eppetroecuador.ec', 'C', 0, 'A'),
(36, '13-DK-97', 'Eduardo Sosa', 'esosa@com.eppetroecuador.ec', 'C', 0, 'A'),
(37, '13-DK-97', 'Irene Zabala', ' izabala@com.eppetroecuador.ec', 'C', 0, 'A'),
(38, '13-DK-97', 'Angelo Sebastián Toro Torres', 'storo@tra.eppetroecuador.ec', 'C', 0, 'A'),
(39, '13-DK-97', 'Gonzalo Toledo', 'gtoledo@com.eppetroecuador.ec', 'C', 0, 'A'),
(40, '13-DK-97', 'Mauricio Valenzuela', 'mvalenzuela@tra.eppetroecuador.ec', 'C', 0, 'A'),
(41, '13-DK-97', 'Carmen Rosero', 'crosero@tra.eppetroecuador.ec', 'C', 0, 'A'),
(42, '13-DK-97', 'Alfredo Burbano', 'aburbano@sote.petroecuador.com.ec', 'C', 0, 'A'),
(43, '13-DK-97', 'Ruth Lalangui Guevara', 'rlalangui@tra.eppetroecuador.ec', 'C', 0, 'A'),
(44, '13-DK-97', 'Gabriela Zurita', 'mzurita@com.eppetroecuador.ec', 'C', 0, 'A'),
(45, '13-DK-97', 'Daniela Castellanos', 'dcastellanos@com.eppetroecuador.ec', 'C', 0, 'A'),
(46, '13-DK-97', 'Jorge Vanronzelen', 'jvanronzelen@pro.eppetroecuador.ec', 'C', 0, 'A'),
(47, '13-DK-97', 'Luis Oracio Lema Altamirano', 'llema@pro.eppetroecuador.ec', 'C', 0, 'A'),
(48, '13-DK-97', 'Marlon Guerrón', 'mguerron@pro.eppetroecuador.ec', 'C', 0, 'A'),
(49, '13-DK-97', 'Juan Diego Brito', 'jbrito@pro.eppetroecuador.ec', 'C', 0, 'A'),
(50, '13-DK-97', 'Josè Guevara Pereira', 'jguevara2@ind.eppetroecuador.ec', 'C', 0, 'A'),
(51, '13-DK-97', 'Zoila Marisol Andrade Vaca', 'mandrade2@ind.eppetroecuador.ec', 'C', 0, 'A'),
(52, '13-DK-97', 'Marcia Calva', 'mcalva@ind.eppetroecuador.ec', 'C', 0, 'A'),
(53, '13-DK-97', 'Teresa Yépez', 'tyepez@ind.eppetroecuador.ec', 'C', 0, 'A'),
(54, '13-DK-97', 'Patricio Zambrano', 'pzambrano2@ind.eppetroecuador.ec', 'C', 0, 'A'),
(55, '13-DK-97', 'Patricia Torres', 'ptorres2@ind.eppetroecuador.ec', 'C', 0, 'A'),
(56, '13-DK-97', 'Maria Piedad', 'mariapiedadt@denkelservice.com', 'I', 3, 'A'),
(57, '13-DK-97', 'Hernan Jouve', 'hjouve@denkelservice.com', 'I', 3, 'A'),
(58, '13-DK-97', 'Karla Jacome', 'karlafjacome@denkelservice.com', 'I', 3, 'A'),
(59, '13-DK-97', 'Lorena Morales', 'asistente2@denkelservice.com', 'I', 3, 'A'),
(60, '13-DK-97', 'Juan Luis Mino', 'jlmino@denkelservice.com', 'I', 3, 'A'),
(61, '13-DK-97', 'Luis Felipe', 'luisfguzman@denkelservice.com', 'I', 4, 'A'),
(62, '13-DK-97', 'Edwin Jouve', 'edwinjouve@denkelservice.com', 'I', 4, 'A'),
(63, '13-DK-97', 'Fausto Riera', 'friera@denkelservice.com', 'I', 4, 'A'),
(64, '13-DK-97', 'Belen Jouve', 'belenjouve@denkelservice.com', 'I', 4, 'A'),
(65, '13-DK-97', 'Anita Paucar', 'analuciap@denkelservice.com', 'I', 5, 'A'),
(66, '13-DK-97', 'Monica Moreta', 'contabilidad@denkelservice.com', 'I', 5, 'A'),
(67, '13-DK-97', 'Paola Paredes', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(68, '13-DK-97', 'Zulay Tamayo', 'asistente1@denkelservice.com', 'I', 6, 'A'),
(69, '13-DK-97', 'Dulfary Villacres', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(70, '13-DK-97', 'Victor Jouve', 'comercial1@denkelservice.com', 'I', 7, 'A'),
(71, '13-DK-97', 'Jacqueline Stayce', 'jstacey@eppetroecuador.ec', 'C', 0, 'A'),
(72, '13-DK-97', 'Diego Salas ', 'dsalas@eppetroecuador.ec', 'C', 0, 'A'),
(73, '13-DK-97', 'Rosario Villegas', 'rvillegas@eppetroecuador.ec', 'C', 0, 'A'),
(74, '13-DK-97', 'Francisco Sánchez', 'fsanchez@ind.eppetroecuador.ec', 'C', 0, 'A'),
(75, '13-DK-97', 'Alexis Loor', 'aloor@eppetroecuador.ec', 'C', 0, 'A'),
(76, '13-DK-97', 'Eduardo Sosa', 'esosa@com.eppetroecuador.ec', 'C', 0, 'A'),
(77, '13-DK-97', 'Irene Zabala', ' izabala@com.eppetroecuador.ec', 'C', 0, 'A'),
(78, '13-DK-97', 'Angelo Sebastián Toro Torres', 'storo@tra.eppetroecuador.ec', 'C', 0, 'A'),
(79, '13-DK-97', 'Gonzalo Toledo', 'gtoledo@com.eppetroecuador.ec', 'C', 0, 'A'),
(80, '13-DK-97', 'Mauricio Valenzuela', 'mvalenzuela@tra.eppetroecuador.ec', 'C', 0, 'A'),
(81, '13-DK-97', 'Carmen Rosero', 'crosero@tra.eppetroecuador.ec', 'C', 0, 'A'),
(82, '13-DK-97', 'Alfredo Burbano', 'aburbano@sote.petroecuador.com.ec', 'C', 0, 'A'),
(83, '13-DK-97', 'Ruth Lalangui Guevara', 'rlalangui@tra.eppetroecuador.ec', 'C', 0, 'A'),
(84, '13-DK-97', 'Gabriela Zurita', 'mzurita@com.eppetroecuador.ec', 'C', 0, 'A'),
(85, '13-DK-97', 'Daniela Castellanos', 'dcastellanos@com.eppetroecuador.ec', 'C', 0, 'A'),
(86, '13-DK-97', 'Jorge Vanronzelen', 'jvanronzelen@pro.eppetroecuador.ec', 'C', 0, 'A'),
(87, '13-DK-97', 'Luis Oracio Lema Altamirano', 'llema@pro.eppetroecuador.ec', 'C', 0, 'A'),
(88, '13-DK-97', 'Marlon Guerrón', 'mguerron@pro.eppetroecuador.ec', 'C', 0, 'A'),
(89, '13-DK-97', 'Juan Diego Brito', 'jbrito@pro.eppetroecuador.ec', 'C', 0, 'A'),
(90, '13-DK-97', 'Josè Guevara Pereira', 'jguevara2@ind.eppetroecuador.ec', 'C', 0, 'A'),
(91, '13-DK-97', 'Zoila Marisol Andrade Vaca', 'mandrade2@ind.eppetroecuador.ec', 'C', 0, 'A'),
(92, '13-DK-97', 'Marcia Calva', 'mcalva@ind.eppetroecuador.ec', 'C', 0, 'A'),
(93, '13-DK-97', 'Teresa Yépez', 'tyepez@ind.eppetroecuador.ec', 'C', 0, 'A'),
(94, '13-DK-97', 'Patricio Zambrano', 'pzambrano2@ind.eppetroecuador.ec', 'C', 0, 'A'),
(95, '13-DK-97', 'Patricia Torres', 'ptorres2@ind.eppetroecuador.ec', 'C', 0, 'A'),
(96, '13-DK-95', 'Maria Piedad', 'mariapiedadt@denkelservice.com', 'I', 3, 'A'),
(97, '13-DK-95', 'Hernan Jouve', 'hjouve@denkelservice.com', 'I', 3, 'A'),
(98, '13-DK-95', 'Karla Jacome', 'karlafjacome@denkelservice.com', 'I', 3, 'A'),
(99, '13-DK-95', 'Lorena Morales', 'asistente2@denkelservice.com', 'I', 3, 'A'),
(100, '13-DK-95', 'Juan Luis Mino', 'jlmino@denkelservice.com', 'I', 3, 'A'),
(101, '13-DK-95', 'Luis Felipe', 'luisfguzman@denkelservice.com', 'I', 4, 'A'),
(102, '13-DK-95', 'Edwin Jouve', 'edwinjouve@denkelservice.com', 'I', 4, 'A'),
(103, '13-DK-95', 'Fausto Riera', 'friera@denkelservice.com', 'I', 4, 'A'),
(104, '13-DK-95', 'Belen Jouve', 'belenjouve@denkelservice.com', 'I', 4, 'A'),
(105, '13-DK-95', 'Anita Paucar', 'analuciap@denkelservice.com', 'I', 5, 'A'),
(106, '13-DK-95', 'Monica Moreta', 'contabilidad@denkelservice.com', 'I', 5, 'A'),
(107, '13-DK-95', 'Paola Paredes', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(108, '13-DK-95', 'Zulay Tamayo', 'asistente1@denkelservice.com', 'I', 6, 'A'),
(109, '13-DK-95', 'Dulfary Villacres', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(110, '13-DK-95', 'Victor Jouve', 'comercial1@denkelservice.com', 'I', 7, 'A'),
(111, '13-DK-92', 'Maria Piedad', 'mariapiedadt@denkelservice.com', 'I', 3, 'A'),
(112, '13-DK-92', 'Hernan Jouve', 'hjouve@denkelservice.com', 'I', 3, 'A'),
(113, '13-DK-92', 'Karla Jacome', 'karlafjacome@denkelservice.com', 'I', 3, 'A'),
(114, '13-DK-92', 'Lorena Morales', 'asistente2@denkelservice.com', 'I', 3, 'A'),
(115, '13-DK-92', 'Juan Luis Mino', 'jlmino@denkelservice.com', 'I', 3, 'A'),
(116, '13-DK-92', 'Luis Felipe', 'luisfguzman@denkelservice.com', 'I', 4, 'A'),
(117, '13-DK-92', 'Edwin Jouve', 'edwinjouve@denkelservice.com', 'I', 4, 'A'),
(118, '13-DK-92', 'Fausto Riera', 'friera@denkelservice.com', 'I', 4, 'A'),
(119, '13-DK-92', 'Belen Jouve', 'belenjouve@denkelservice.com', 'I', 4, 'A'),
(120, '13-DK-92', 'Anita Paucar', 'analuciap@denkelservice.com', 'I', 5, 'A'),
(121, '13-DK-92', 'Monica Moreta', 'contabilidad@denkelservice.com', 'I', 5, 'A'),
(122, '13-DK-92', 'Paola Paredes', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(123, '13-DK-92', 'Zulay Tamayo', 'asistente1@denkelservice.com', 'I', 6, 'A'),
(124, '13-DK-92', 'Dulfary Villacres', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(125, '13-DK-92', 'Victor Jouve', 'comercial1@denkelservice.com', 'I', 7, 'A'),
(126, '13-DK-92', 'Josè Guevara Pereira', 'jguevara2@ind.eppetroecuador.ec', 'C', 0, 'I'),
(127, '13-DK-92', 'Zoila Marisol Andrade Vaca', 'mandrade2@ind.eppetroecuador.ec', 'C', 0, 'I'),
(128, '13-DK-98', 'Maria Piedad', 'mariapiedadt@denkelservice.com', 'I', 3, 'A'),
(129, '13-DK-98', 'Hernan Jouve', 'hjouve@denkelservice.com', 'I', 3, 'A'),
(130, '13-DK-98', 'Karla Jacome', 'karlafjacome@denkelservice.com', 'I', 3, 'A'),
(131, '13-DK-98', 'Lorena Morales', 'asistente2@denkelservice.com', 'I', 3, 'A'),
(132, '13-DK-98', 'Juan Luis Mino', 'jlmino@denkelservice.com', 'I', 3, 'A'),
(133, '13-DK-98', 'Luis Felipe', 'luisfguzman@denkelservice.com', 'I', 4, 'A'),
(134, '13-DK-98', 'Edwin Jouve', 'edwinjouve@denkelservice.com', 'I', 4, 'A'),
(135, '13-DK-98', 'Fausto Riera', 'friera@denkelservice.com', 'I', 4, 'A'),
(136, '13-DK-98', 'Belen Jouve', 'belenjouve@denkelservice.com', 'I', 4, 'A'),
(137, '13-DK-98', 'Anita Paucar', 'analuciap@denkelservice.com', 'I', 5, 'A'),
(138, '13-DK-98', 'Monica Moreta', 'contabilidad@denkelservice.com', 'I', 5, 'A'),
(139, '13-DK-98', 'Paola Paredes', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(140, '13-DK-98', 'Zulay Tamayo', 'asistente1@denkelservice.com', 'I', 6, 'A'),
(141, '13-DK-98', 'Dulfary Villacres', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(142, '13-DK-98', 'Victor Jouve', 'comercial1@denkelservice.com', 'I', 7, 'A'),
(143, '13-DK-98', 'Maria Piedad', 'mariapiedadt@denkelservice.com', 'I', 3, 'A'),
(144, '13-DK-98', 'Hernan Jouve', 'hjouve@denkelservice.com', 'I', 3, 'A'),
(145, '13-DK-98', 'Karla Jacome', 'karlafjacome@denkelservice.com', 'I', 3, 'A'),
(146, '13-DK-98', 'Lorena Morales', 'asistente2@denkelservice.com', 'I', 3, 'A'),
(147, '13-DK-98', 'Juan Luis Mino', 'jlmino@denkelservice.com', 'I', 3, 'A'),
(148, '13-DK-98', 'Juanita Taco', 'juana@taco.com', 'C', 0, 'A'),
(149, '13-DK-98', 'Maria Piedad', 'mariapiedadt@denkelservice.com', 'I', 3, 'A'),
(150, '13-DK-98', 'Hernan Jouve', 'hjouve@denkelservice.com', 'I', 3, 'A'),
(151, '13-DK-98', 'Karla Jacome', 'karlafjacome@denkelservice.com', 'I', 3, 'A'),
(152, '13-DK-98', 'Lorena Morales', 'asistente2@denkelservice.com', 'I', 3, 'A'),
(153, '13-DK-98', 'Juan Luis Mino', 'jlmino@denkelservice.com', 'I', 3, 'A'),
(154, '13-DK-98', 'Anita Paucar', 'analuciap@denkelservice.com', 'I', 5, 'A'),
(155, '13-DK-98', 'Monica Moreta', 'contabilidad@denkelservice.com', 'I', 5, 'A'),
(156, '13-DK-98', 'popopopo', 'popopopopo', 'C', 0, 'A'),
(157, '13-DK-98', 'Maria Piedad', 'mariapiedadt@denkelservice.com', 'I', 3, 'A'),
(158, '13-DK-98', 'Hernan Jouve', 'hjouve@denkelservice.com', 'I', 3, 'A'),
(159, '13-DK-98', 'Karla Jacome', 'karlafjacome@denkelservice.com', 'I', 3, 'A'),
(160, '13-DK-98', 'Lorena Morales', 'asistente2@denkelservice.com', 'I', 3, 'A'),
(161, '13-DK-98', 'Juan Luis Mino', 'jlmino@denkelservice.com', 'I', 3, 'A'),
(162, '13-DK-98', 'Luis Felipe', 'luisfguzman@denkelservice.com', 'I', 4, 'A'),
(163, '13-DK-98', 'Edwin Jouve', 'edwinjouve@denkelservice.com', 'I', 4, 'A'),
(164, '13-DK-98', 'Fausto Riera', 'friera@denkelservice.com', 'I', 4, 'A'),
(165, '13-DK-98', 'Belen Jouve', 'belenjouve@denkelservice.com', 'I', 4, 'A'),
(166, '13-DK-98', 'Anita Paucar', 'analuciap@denkelservice.com', 'I', 5, 'A'),
(167, '13-DK-98', 'Monica Moreta', 'contabilidad@denkelservice.com', 'I', 5, 'A'),
(168, '13-DK-98', 'Paola Paredes', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(169, '13-DK-98', 'Zulay Tamayo', 'asistente1@denkelservice.com', 'I', 6, 'A'),
(170, '13-DK-98', 'Dulfary Villacres', 'recepcion@denkelservice.com', 'I', 6, 'A'),
(171, '13-DK-98', 'Victor Jouve', 'comercial1@denkelservice.com', 'I', 7, 'A'),
(172, '13-DK-98', 'asasas', 'qwqweqwe', 'C', 0, 'A'),
(175, '13-DK-99', 'Julio Beltran', 'asistente2@denkelservice.com', 'I', 3, 'A'),
(176, '13-DK-99', 'Cristina Alvarado', 'mariacristinaf@denkelservice.com', 'I', 3, 'A'),
(182, '13-DK-99', 'Luis Felipe', 'luisfguzman@denkelservice.com', 'I', 4, 'A'),
(183, '13-DK-99', 'Edwin Jouve', 'edwinjouve@denkelservice.com', 'I', 4, 'A'),
(184, '13-DK-99', 'Belen Jouve', 'belenjouve@denkelservice.com', 'I', 4, 'A'),
(185, '13-DK-99', 'Willian Espinosa', 'wespinosa@iblack.com.ec', 'C', 0, 'A'),
(186, '13-DK-99', 'Alfredo Guerron', 'wespinosa86@gmail.com', 'C', 0, 'A'),
(187, '13-DK-99', 'Monica Ortiz', 'willianespinosa_0708@hotmail.com', 'C', 0, 'A'),
(188, '13-DK-100', 'Hernan Jouve', 'hjouve@denkelservice.com', 'I', 3, 'A'),
(189, '13-DK-100', 'Fausto Riera', 'friera@denkelservice.com', 'I', 3, 'A'),
(190, '13-DK-100', 'Julio Beltran', 'asistente2@denkelservice.com', 'I', 3, 'A'),
(191, '13-DK-100', 'Cristina Alvarado', 'mariacristinaf@denkelservice.com', 'I', 3, 'A'),
(192, '13-DK-100', 'Ruth Tamayo', '', 'I', 3, 'A'),
(193, '13-DK-100', 'Roseveth Bonilla', '', 'I', 3, 'A'),
(194, '13-DK-100', 'Jerry Rojas', '', 'I', 3, 'A'),
(195, '13-DK-100', 'Cordinacion Guayaquil', '', 'I', 3, 'A'),
(196, '13-DK-100', 'Carlos Vega', '', 'I', 3, 'A'),
(197, '13-DK-100', 'asdasd', 'asdasd', 'C', 0, 'A'),
(202, '13-DK-106', 'Willian Espinosa', 'wespinosa@iblack.com.ec', 'C', 0, 'I'),
(203, '13-DK-106', 'Alfredo Guerron', 'wespinosa86@gmail.com', 'C', 0, 'A'),
(204, '13-DK-106', 'Monica Ortiz', 'willianespinosa_0708@hotmail.com', 'C', 0, 'A'),
(206, '13-DK-109', 'Alfredo Guerron', 'wespinosa86@gmail.com', 'C', 0, 'A'),
(207, '13-DK-109', 'Monica Ortiz', 'willianespinosa_0708@hotmail.com', 'C', 0, 'A'),
(208, '13-DK-110', 'Willian Espinosa', 'wespinosa@iblack.com.ec', 'C', 0, 'I'),
(209, '13-DK-110', 'Alfredo Guerron', 'wespinosa86@gmail.com', 'C', 0, 'A'),
(210, '13-DK-110', 'Monica Ortiz', 'willianespinosa_0708@hotmail.com', 'C', 0, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_notifica_cliente`
--

CREATE TABLE IF NOT EXISTS `dnk_notifica_cliente` (
  `DNK_PROCESOS_id` int(11) NOT NULL COMMENT 'Codigo del Proceso del DK',
  `DNK_DOCUMENTO_codigo` varchar(20) NOT NULL COMMENT 'Codigo del Tramite',
  `DNK_ACTIVIDAD_id` int(11) NOT NULL COMMENT 'Codigo de la Actividad',
  `usu_id` int(11) NOT NULL COMMENT 'Codigo de Usuario',
  `fechahora_notifica` datetime NOT NULL COMMENT 'Fecha y Hora en la que notifica',
  PRIMARY KEY (`DNK_PROCESOS_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `dnk_notifica_cliente`
--

INSERT INTO `dnk_notifica_cliente` (`DNK_PROCESOS_id`, `DNK_DOCUMENTO_codigo`, `DNK_ACTIVIDAD_id`, `usu_id`, `fechahora_notifica`) VALUES
(150, '13-DK-106', 1, 3, '2013-10-27 23:44:13'),
(178, '13-DK-109', 1, 3, '2013-10-28 00:01:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_observacion`
--

CREATE TABLE IF NOT EXISTS `dnk_observacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_TRAMITE_OBSERVACION_id` int(11) DEFAULT NULL,
  `DNK_DOCUMENTO_id` int(11) NOT NULL,
  `DNK_ACTIVIDAD_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Volcar la base de datos para la tabla `dnk_observacion`
--

INSERT INTO `dnk_observacion` (`id`, `DNK_TRAMITE_OBSERVACION_id`, `DNK_DOCUMENTO_id`, `DNK_ACTIVIDAD_id`, `usuario_id`, `fecha`, `tipo`, `descripcion`) VALUES
(1, NULL, 2, 1, 1, '2011-10-07', 'Externo', 'Este tramite se encuentra con demora por parte de la Aduana no nos dan ninguna respuesta'),
(2, NULL, 2, 2, 1, '2011-10-20', 'Externo', 'YA se entrego de la Aduana esta Correcto'),
(3, NULL, 2, 3, 3, '2011-10-22', 'Externo', 'Tramite Listo para Despacho'),
(4, NULL, 2, 4, 4, '2011-10-14', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(5, NULL, 13, 1, 1, '2011-10-27', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(6, NULL, 13, 2, 1, '2011-10-27', 'Externo', 'Su tramite se encuentra con una demora debido a un Inconveniente en el Ingreso de Documentos, Falta envio de Carta, en las proximas horas se relizara el reingreso'),
(7, NULL, 0, 3, 5, '2011-10-27', 'Externo', 'hola mundo'),
(8, NULL, 0, 3, 5, '2011-10-27', 'Externo', 'asfsdfasdf'),
(9, NULL, 13, 3, 5, '2011-10-27', 'Externo', 'sgasdfasdfasdf'),
(10, NULL, 13, 4, 0, '2011-10-27', 'Externo', 'ssss, kkkkkk'),
(11, NULL, 13, 6, 1, '2011-10-27', 'Externo', 'hola liquidacion completada'),
(12, NULL, 1, 6, 0, '2011-10-27', 'Externo', 'asdgafgsfg'),
(13, NULL, 1, 6, 0, '2011-10-27', 'Externo', 'sgsdfg33434'),
(14, NULL, 14, 1, 1, '2011-10-28', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(15, NULL, 14, 2, 1, '2011-10-28', 'Externo', 'PRIMERA PARTE PASA OK'),
(16, NULL, 14, 3, 1, '2011-10-28', 'Externo', 'SEGUNDA PRUEBA OK'),
(20, NULL, 14, 13, 43, '2011-10-28', 'Externo', 'Estimado Cliente su Carga se ha entregado con Exito la persona que realizo la recepcion es: willian espinosa'),
(18, NULL, 14, 4, 43, '2011-10-28', 'Externo', 'prueba tercera ok'),
(19, NULL, 14, 6, 43, '2011-10-28', 'Externo', 'OBSERVACION CUARTA OK'),
(31, NULL, 17, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(30, NULL, 16, 1, 1, '2011-11-16', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(28, NULL, 13, 15, 43, '2011-10-28', 'Externo', 'Estimado Cliente su Carga se ha entregado con Exito la persona que realizo la recepcion es: Juan Perez'),
(29, NULL, 15, 1, 1, '2011-11-14', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(26, NULL, 13, 14, 43, '2011-10-28', 'Externo', 'Estimado Cliente su Carga saldra: 19:20, se estima que llegue al Destino: 21:30'),
(32, NULL, 18, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(33, NULL, 19, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(34, NULL, 19, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(35, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(36, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(37, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(38, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(39, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(40, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(41, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(42, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(43, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(44, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(45, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(46, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(47, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(48, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(49, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(50, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(51, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(52, NULL, 20, 1, 1, '2011-11-17', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(53, NULL, 36, 1, 1, '2011-11-28', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(54, NULL, 36, 2, 1, '2011-11-28', 'Externo', '12'),
(55, NULL, 36, 3, 1, '2011-11-28', 'Externo', 'ok'),
(56, NULL, 42, 1, 3, '2012-06-13', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(57, NULL, 42, 1, 3, '2012-06-13', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(58, NULL, 12, 1, 1, '2012-08-02', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(59, NULL, 12, 1, 1, '2012-08-02', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(60, NULL, 12, 1, 44, '2012-08-02', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(61, NULL, 12, 1, 44, '2012-08-02', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero'),
(62, NULL, 12, 1, 44, '2012-08-02', 'Externo', 'Se Realiza el Ingreso de Documentacion para el Respectivo tramite Aduanero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_parametros`
--

CREATE TABLE IF NOT EXISTS `dnk_parametros` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de Parametro',
  `table` varchar(60) NOT NULL COMMENT 'Nombre de la Tabla a la que hace referencia',
  `descripcion` varchar(250) NOT NULL COMMENT 'Descripcion del Parametro',
  `valor1` varchar(300) NOT NULL COMMENT 'Valor del Parametro 1',
  `valor2` varchar(300) DEFAULT NULL COMMENT 'Valor del Parametro 2',
  `valor3` varchar(300) DEFAULT NULL COMMENT 'Valor del Parametro 3',
  `estado` varchar(1) NOT NULL COMMENT 'Estdo del Parametro',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `dnk_parametros`
--

INSERT INTO `dnk_parametros` (`id`, `table`, `descripcion`, `valor1`, `valor2`, `valor3`, `estado`) VALUES
(1, 'dnk_documento', 'Codigo Inicial de los Tramites', '90', NULL, NULL, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_perfil_usuario`
--

CREATE TABLE IF NOT EXISTS `dnk_perfil_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Secuencial del perfil',
  `dnk_submenu_id` int(11) NOT NULL COMMENT 'Clave del Submenu',
  `dnk_menu_id` int(11) NOT NULL COMMENT 'Clave del Menu',
  `rol_id` int(11) NOT NULL COMMENT 'Clave del Rol del Usuario',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `dnk_perfil_usuario`
--

INSERT INTO `dnk_perfil_usuario` (`id`, `dnk_submenu_id`, `dnk_menu_id`, `rol_id`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 1, 13, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_procesos`
--

CREATE TABLE IF NOT EXISTS `dnk_procesos` (
  `proces_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del Proceso',
  `proces_codigo` varchar(10) NOT NULL COMMENT 'Codigo del tramite',
  `proces_actividad_id` int(11) NOT NULL COMMENT 'Codigo de la Actividad a realizar',
  `proces_observacion` varchar(500) NOT NULL COMMENT 'Observacion de la Actividad',
  `proces_solicitud` varchar(60) DEFAULT NULL COMMENT 'Numero de Solicitud',
  `proces_usuario` int(11) NOT NULL COMMENT 'Codigo del Usuario',
  `proces_fechahora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Fecha y Hora del Proceso',
  `proces_estado` varchar(2) NOT NULL COMMENT 'Estado secuencial del Proceso A:Aprobado, N:Negado, P:Pediente',
  PRIMARY KEY (`proces_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=180 ;

--
-- Volcar la base de datos para la tabla `dnk_procesos`
--

INSERT INTO `dnk_procesos` (`proces_id`, `proces_codigo`, `proces_actividad_id`, `proces_observacion`, `proces_solicitud`, `proces_usuario`, `proces_fechahora`, `proces_estado`) VALUES
(1, '13-DK-90', 1, 'ssssssssss', NULL, 4, '2013-10-22 17:06:59', 'A'),
(2, '13-DK-90', 2, 'sddfsafdasdf', NULL, 4, '2013-10-22 17:06:59', 'A'),
(3, '13-DK-93', 1, 'hola mundo', NULL, 4, '2013-10-22 17:06:59', 'A'),
(4, '13-DK-97', 1, 'asdasdasdasdasd', NULL, 4, '2013-10-22 17:06:59', 'A'),
(5, '13-DK-97', 3, 'oooooooooooooooooooooooo', NULL, 4, '2013-10-22 17:06:59', 'A'),
(6, '13-DK-97', 4, 'pppppppppppppppp', NULL, 4, '2013-10-22 17:06:59', 'A'),
(7, '', 11, 'Creacion Solicitud:123, por el Valor de:$ 500', '123', 3, '2013-10-22 17:06:59', 'A'),
(8, '', 11, 'Creacion Solicitud:1003, por el Valor de:$ 500', NULL, 3, '2013-10-22 17:06:59', 'A'),
(9, '13-DK-98', 11, 'Creacion Solicitud:1003, por el Valor de:$ 500', '1003', 3, '2013-10-22 17:06:59', 'A'),
(10, '13-DK-98', 11, 'Creacion Solicitud:1007, por el Valor de:$ 900', '1007', 3, '2013-10-22 17:06:59', 'A'),
(11, '13-DK-98', 11, 'Creacion Solicitud:1, por el Valor de:$ 800', '1', 3, '2013-10-22 17:06:59', 'A'),
(12, '13-DK-97', 11, 'Creacion Solicitud:2, por el Valor de:$ 87766', '2', 3, '2013-10-22 17:06:59', 'A'),
(13, '5', 0, '', NULL, 3, '2013-10-22 17:06:59', 'A'),
(14, '5', 0, '', NULL, 3, '2013-10-22 17:06:59', 'A'),
(15, '5', 0, '', NULL, 3, '2013-10-22 17:06:59', 'A'),
(16, '2', 564654, '', NULL, 3, '2013-10-22 17:06:59', 'A'),
(17, '13-DK-95', 1, 'DDFDF', NULL, 3, '2013-10-22 17:06:59', 'A'),
(18, '13-DK-96', 4, 'ssss', NULL, 3, '2013-10-22 17:06:59', 'A'),
(19, '13-DK-96', 3, 'dfdfdfdf', NULL, 3, '2013-10-22 17:06:59', 'A'),
(20, '13-DK-96', 5, 'sfadfasf', NULL, 3, '2013-10-22 17:06:59', 'A'),
(21, '13-DK-99', 1, 'Inicio de Proceso', NULL, 3, '2013-10-22 17:06:59', 'A'),
(22, '13-DK-99', 2, 'jj', NULL, 3, '2013-10-22 17:06:59', 'A'),
(23, '13-DK-99', 3, 'sssssssssss', NULL, 3, '2013-10-22 17:06:59', 'A'),
(24, '13-DK-99', 4, 'sdsdsdsd', NULL, 3, '2013-10-23 20:16:43', 'N'),
(25, '13-DK-99', 11, 'Creacion Solicitud:3, por el Valor de:$ 444', '3', 3, '2013-10-22 17:06:59', 'A'),
(26, '13-DK-99', 10, 'llll', NULL, 3, '2013-10-22 17:06:59', 'A'),
(27, '13-DK-100', 3, 'Subida la Cotización: KJHSD123, Documento Tipo: pdf', 'KJHSD123', 3, '2013-10-22 17:06:59', 'A'),
(28, '13-DK-97', 2, 'sdgjksgkjsfaasdf', NULL, 3, '2013-10-22 17:06:59', 'A'),
(29, '13-DK-97', 24, 'asdasdasdasd', NULL, 3, '2013-10-22 17:06:59', 'A'),
(30, '13-DK-97', 9, 'sssssssss', NULL, 3, '2013-10-22 17:06:59', 'A'),
(31, '13-DK-100', 6, 'sssssssssssss', NULL, 3, '2013-10-22 17:06:59', 'A'),
(32, '13-DK-100', 9, 'wwwwwwwwwwwwwww', NULL, 3, '2013-10-22 17:06:59', 'A'),
(33, '13-DK-100', 9, 'ddddddddddddddd', NULL, 3, '2013-10-22 17:06:59', 'A'),
(34, '13-DK-100', 6, 'qqqqqqqqqqqqq', NULL, 3, '2013-10-22 17:06:59', 'A'),
(35, '13-DK-100', 1, 'asaaasss', NULL, 3, '2013-10-22 17:06:59', 'A'),
(36, '13-DK-100', 2, 'gfgss', NULL, 3, '2013-10-22 17:06:59', 'A'),
(37, '13-DK-100', 26, 'cvfdf', NULL, 3, '2013-10-22 17:06:59', 'A'),
(38, '13-DK-100', 11, 'asasas', NULL, 3, '2013-10-22 17:06:59', 'A'),
(39, '13-DK-97', 17, 'wewewewe', NULL, 3, '2013-10-22 17:06:59', 'A'),
(40, '13-DK-100', 17, 'thhghggh', NULL, 3, '2013-10-22 17:06:59', 'A'),
(41, '13-DK-101', 1, 'Se crea DK, y se envia datos al cliente', NULL, 1, '2013-10-22 17:06:59', 'A'),
(42, '13-DK-102', 1, 'Se crea DK, y se envia datos al cliente', NULL, 3, '2013-10-22 17:11:14', 'P'),
(43, '13-DK-102', 2, 'sdsafd', NULL, 3, '2013-10-22 17:12:11', 'A'),
(44, '13-DK-102', 4, 'observacion', NULL, 3, '2013-10-22 16:57:58', ''),
(45, '13-DK-102', 3, 'Subido el Documento: CARTA DE PORTE , Nombrado: Carta Porte 76543', '', 3, '2013-10-22 17:35:51', ''),
(46, '13-DK-102', 24, 'Subido el Documento: CERTIF. INSPECCION , Nombrado: 987654', '', 3, '2013-10-23 18:47:19', 'N'),
(47, '13-DK-101', 1, '', NULL, 3, '2013-10-22 17:53:41', ''),
(48, '13-DK-101', 2, 'hjhjhj', NULL, 3, '2013-10-22 17:54:32', ''),
(49, '13-DK-101', 4, 'tyghgh', NULL, 3, '2013-10-22 17:54:37', ''),
(50, '13-DK-101', 24, 'Subido el Documento: CUPO DIPLOMATICOS , Nombrado: 987654321', '', 3, '2013-10-26 22:15:42', 'N'),
(51, '13-DK-101', 24, 'Subido el Documento: CUPO DIPLOMATICOS , Nombrado: 987654321', '', 3, '2013-10-26 22:15:39', 'N'),
(52, '13-DK-101', 24, 'Subido el Documento: CUPO DIPLOMATICOS , Nombrado: 987654321', '', 3, '2013-10-26 22:15:30', 'N'),
(53, '13-DK-99', 24, 'Subidos 4 Documentos Tipo: DAU A , Descripción: 987654321', '', 3, '2013-10-26 22:30:11', 'N'),
(54, '13-DK-102', 0, 'estan mal los cumentos que subieron', NULL, 3, '2013-10-23 17:30:46', ''),
(55, '13-DK-102', 0, 'no pasaron bien los datos en el excel', NULL, 3, '2013-10-23 17:31:31', ''),
(56, '13-DK-102', 0, 'sdfasdfadf', NULL, 3, '2013-10-23 17:32:39', ''),
(57, '13-DK-102', 0, 'zxcvzxcvzxvzxcv', NULL, 3, '2013-10-23 17:33:18', ''),
(58, '13-DK-102', 0, 'aasasas', NULL, 3, '2013-10-23 17:36:00', ''),
(59, '13-DK-102', 0, 'sss', NULL, 3, '2013-10-23 17:36:29', ''),
(60, '13-DK-102', 0, 'sdsd', NULL, 3, '2013-10-23 17:36:59', ''),
(62, '13-DK-102', 32, 'sdafasdfadfasdf', NULL, 3, '2013-10-23 17:47:43', 'A'),
(63, '13-DK-104', 1, 'Se crea DK, y se envia datos al cliente', NULL, 3, '2013-10-23 18:00:25', 'A'),
(64, '13-DK-104', 2, '321654897', NULL, 3, '2013-10-23 18:37:56', 'A'),
(65, '13-DK-104', 4, 'Revisado ok', NULL, 3, '2013-10-23 18:40:39', 'A'),
(66, '13-DK-104', 24, 'Subidos 2 Documentos Tipo: OTROS, Descripción: Excel para subir', '', 3, '2013-10-26 21:41:07', 'N'),
(67, '13-DK-105', 1, 'Se crea DK, y se envia datos al cliente', NULL, 3, '2013-10-23 18:59:40', 'A'),
(68, '13-DK-105', 2, 'asdfasdfasdf', NULL, 3, '2013-10-23 18:59:58', 'A'),
(69, '13-DK-105', 4, 'asdfasdfasdf', NULL, 3, '2013-10-23 19:00:06', 'A'),
(73, '13-DK-105', 24, 'Subidos 1 Documentos Tipo: AUTORIZ. COMEXI , Descripción: ssssss', '', 3, '2013-10-23 20:35:33', 'N'),
(75, '13-DK-105', 32, 'zzzzzzzzzz', NULL, 3, '2013-10-23 19:35:57', 'A'),
(76, '13-DK-105', 12, 'Creacion Solicitud:4, por el Valor de:$ 654', '4', 3, '2013-10-25 17:57:06', 'N'),
(79, '13-DK-105', 24, 'Subidos 1 Documentos Tipo: OTROS, Descripción: sdasdf', '', 3, '2013-10-25 17:57:13', 'N'),
(81, '13-DK-105', 34, 'aasdfasdfasdf', NULL, 3, '2013-10-25 16:57:30', 'A'),
(82, '13-DK-105', 32, 'sadfafdasdfasdf', NULL, 3, '2013-10-25 16:57:37', 'A'),
(83, '13-DK-105', 12, 'Creacion Solicitud:5, por el Valor de:$ 123', '5', 3, '2013-10-25 19:09:12', 'A'),
(85, '13-DK-105', 33, 'Solicitud de Egreso Cancelada, Documento: sasdfsdfgsdfg, cargado al sistema', '', 3, '2013-10-25 17:48:29', 'A'),
(86, '13-DK-105', 33, 'Solicitud de Egreso Cancelada, Documento: holasaaaa, cargado al sistema', '', 3, '2013-10-25 17:49:21', 'A'),
(87, '13-DK-105', 33, 'Solicitud de Egreso Cancelada, Documento: transferencia bancaria, cargado al sistema', '', 3, '2013-10-25 17:55:51', 'A'),
(88, '13-DK-105', 33, 'Solicitud de Egreso Cancelada, Documento: wwwwww, cargado al sistema', '', 3, '2013-10-25 17:57:02', 'A'),
(89, '13-DK-105', 33, 'Solicitud de Egreso Cancelada, Documento: asdfasdfasdf, cargado al sistema', '', 3, '2013-10-25 18:09:36', 'A'),
(90, '13-DK-105', 24, 'Subidos 5 Documentos Tipo: AUTORIZ. CAMBIO DE OBRA , Descripción: asdfasdfasdf', '', 3, '2013-10-25 19:40:54', 'N'),
(91, '13-DK-105', 12, 'Creacion Solicitud:6, por el Valor de:$ 155', '6', 3, '2013-10-25 19:16:37', 'N'),
(92, '13-DK-105', 12, 'Creacion Solicitud:7, por el Valor de:$ 500', '7', 3, '2013-10-25 19:27:05', 'A'),
(93, '13-DK-105', 34, 'no esta bien', NULL, 3, '2013-10-25 18:17:01', 'A'),
(100, '13-DK-105', 33, 'Solicitud de Egreso Cancelada, Documento: zczxczxczxc, cargado al sistema', '', 3, '2013-10-25 18:27:29', 'A'),
(108, '13-DK-105', 5, 'liuhiouyoiuyoi', NULL, 3, '2013-10-25 18:40:11', 'A'),
(109, '13-DK-105', 32, 'sdasdfasdf', NULL, 3, '2013-10-25 18:41:18', 'A'),
(110, '13-DK-105', 24, 'Subidos 1 Documentos Tipo: , Descripción: sdsafasdf', '', 3, '2013-10-25 20:01:12', 'N'),
(113, '13-DK-105', 32, 'hola', NULL, 3, '2013-10-25 19:01:36', 'A'),
(114, '13-DK-105', 24, 'Subidos 1 Documentos Tipo: AUTORIZ. ACOGIMIENTO REG. ESPECIAL , Descripción: asdfasdfasdf', '', 3, '2013-10-25 20:01:51', 'A'),
(115, '13-DK-105', 5, 'ok', NULL, 3, '2013-10-25 19:02:15', 'A'),
(116, '13-DK-105', 12, 'Creacion Solicitud:5, por el Valor de:$ 234', '5', 3, '2013-10-25 20:17:49', 'N'),
(117, '13-DK-102', 24, 'Subidos 1 Documentos Tipo: , Descripción: sadfasdf', '', 3, '2013-10-26 22:14:07', 'N'),
(118, '13-DK-105', 34, 'jkygfjh', NULL, 3, '2013-10-25 19:18:13', 'A'),
(122, '13-DK-105', 12, 'Creacion Solicitud:8, por el Valor de:$ 2134', '8', 3, '2013-10-25 20:59:57', 'A'),
(123, '13-DK-105', 33, 'Solicitud de Egreso Cancelada, Documento: fdbdsfgsdgsd, cargado al sistema', '', 3, '2013-10-25 20:00:21', 'A'),
(125, '13-DK-104', 32, 'sdasasf', NULL, 3, '2013-10-26 20:41:31', 'A'),
(126, '13-DK-102', 32, 'fgdhdfgh', NULL, 3, '2013-10-26 21:14:31', 'A'),
(127, '13-DK-102', 24, 'Subidos 1 Documentos Tipo: , Descripción: tttttttttttttttttttttttt', '', 3, '2013-10-26 21:14:56', 'P'),
(128, '13-DK-101', 32, 'hhhh', NULL, 3, '2013-10-26 21:15:54', 'A'),
(129, '13-DK-101', 32, 'jh', NULL, 3, '2013-10-26 21:16:03', 'A'),
(130, '13-DK-101', 32, 'nn', NULL, 3, '2013-10-26 21:16:06', 'A'),
(131, '13-DK-100', 4, 'bhgg', NULL, 3, '2013-10-26 21:16:26', 'A'),
(132, '13-DK-101', 24, 'Subidos 1 Documentos Tipo: ACUERDOS LIBERATORIOS , Descripción: fddfdf', '', 3, '2013-10-26 21:25:57', 'P'),
(133, '13-DK-101', 24, 'Subidos 1 Documentos Tipo: ACUERDOS LIBERATORIOS , Descripción: fddfdf', '', 3, '2013-10-26 21:26:45', 'P'),
(134, '13-DK-101', 24, 'Subidos 1 Documentos Tipo: ACUERDOS LIBERATORIOS , Descripción: fddfdf', '', 3, '2013-10-26 21:28:57', 'P'),
(135, '13-DK-101', 24, 'Subidos 1 Documentos Tipo: ACUERDOS LIBERATORIOS , Descripción: fddfdf', '', 3, '2013-10-26 21:29:01', 'P'),
(136, '13-DK-101', 24, 'Subidos 1 Documentos Tipo: ACUERDOS LIBERATORIOS , Descripción: fddfdf', '', 3, '2013-10-26 21:30:26', 'P'),
(137, '13-DK-99', 32, 'asc', NULL, 3, '2013-10-26 21:30:35', 'A'),
(138, '13-DK-99', 24, 'Subidos 1 Documentos Tipo: , Descripción: asc', '', 3, '2013-10-26 21:30:43', 'P'),
(139, '13-DK-99', 24, 'Subidos 1 Documentos Tipo: , Descripción: asc', '', 3, '2013-10-26 21:30:57', 'P'),
(140, '13-DK-99', 24, 'Subidos 1 Documentos Tipo: , Descripción: asc', '', 3, '2013-10-26 21:31:21', 'P'),
(141, '13-DK-99', 24, 'Subidos 1 Documentos Tipo: , Descripción: asc', '', 3, '2013-10-26 21:32:47', 'P'),
(142, '13-DK-99', 24, 'Subidos 1 Documentos Tipo: , Descripción: asc', '', 3, '2013-10-26 21:32:49', 'P'),
(143, '13-DK-101', 3, 'Subida la Cotización: sd, Documento Tipo: pdf', 'sd', 3, '2013-10-26 22:35:15', ''),
(144, '13-DK-101', 3, 'Subida la Cotización: sd, Documento Tipo: pdf', 'sd', 3, '2013-10-26 22:36:12', ''),
(145, '13-DK-101', 3, 'Subida la Cotización: sd, Documento Tipo: pdf', 'sd', 3, '2013-10-26 22:36:43', ''),
(146, '13-DK-96', 3, 'Subida la Cotización: r, Documento Tipo: pdf', 'r', 3, '2013-10-26 22:36:59', ''),
(147, '13-DK-100', 3, 'Subida la Cotización: s, Documento Tipo: pdf', 's', 3, '2013-10-26 22:37:35', ''),
(148, '13-DK-100', 3, 'Subida la Cotización: s, Documento Tipo: pdf', 's', 3, '2013-10-26 22:38:09', ''),
(149, '13-DK-100', 3, 'Subida la Cotización: jh, Documento Tipo: pdf', 'jh', 3, '2013-10-26 22:40:08', ''),
(150, '13-DK-106', 1, 'Se crea DK, y se envia datos al cliente', NULL, 3, '2013-10-27 18:24:10', 'A'),
(151, '13-DK-107', 1, 'Se crea DK, y se envia datos al cliente', NULL, 3, '2013-10-27 18:31:56', 'A'),
(152, '13-DK-108', 1, 'Se crea DK, y se envia datos al cliente', NULL, 3, '2013-10-27 18:33:52', 'A'),
(153, '13-DK-106', 2, 'hhhhhh ---  --- Subidos 2 Documentos Tipo: CARTA DE PORTE , Descripción: SADF --- Subidos 3 Documentos Tipo: AUTORIZ. COMEXI , Descripción: aaaa', NULL, 3, '2013-10-28 00:03:49', 'A'),
(154, '13-DK-106', 4, 'kkkkkkk', NULL, 3, '2013-10-27 18:38:33', 'A'),
(155, '13-DK-106', 24, 'Subidos 1 Documentos Tipo: AUTORIZ. ACOGIMIENTO REG. ESPECIAL , Descripción: 987654321', '', 3, '2013-10-27 19:40:16', 'A'),
(156, '13-DK-106', 5, 'ok', NULL, 3, '2013-10-27 18:40:40', 'A'),
(157, '13-DK-106', 7, 'iuyt', NULL, 3, '2013-10-27 18:41:13', 'A'),
(158, '13-DK-108', 12, 'Creacion Solicitud:9, por el Valor de:$ 123.85', '9', 3, '2013-10-27 19:54:15', 'A'),
(159, '13-DK-108', 33, 'Solicitud de Egreso Cancelada, Documento: transferencia, cargado al sistema', '', 3, '2013-10-27 18:54:39', 'A'),
(161, '13-DK-108', 12, 'Creacion Solicitud:10, por el Valor de:$ 50', '10', 3, '2013-10-27 20:20:32', 'A'),
(162, '13-DK-108', 33, 'Solicitud de Egreso Cancelada, Documento: mmmmm, cargado al sistema', '', 3, '2013-10-27 19:20:56', 'A'),
(163, '13-DK-108', 12, 'Creacion Solicitud:11, por el Valor de:$ 800', '11', 3, '2013-10-27 21:00:42', 'A'),
(164, '13-DK-108', 33, 'Solicitud de Egreso Cancelada, Documento: uuuuu, cargado al sistema', '', 3, '2013-10-27 20:01:06', 'A'),
(166, '13-DK-106', 10, 'poipoi', NULL, 3, '2013-10-27 20:17:04', 'A'),
(167, '13-DK-106', 8, '987654', NULL, 3, '2013-10-27 20:17:56', 'A'),
(168, '13-DK-106', 12, 'Creacion Solicitud:12, por el Valor de:$ 123.85', '12', 3, '2013-10-27 21:18:25', 'A'),
(169, '13-DK-106', 33, 'Solicitud de Egreso Cancelada, Documento: 987654321, cargado al sistema', '', 3, '2013-10-27 20:18:49', 'A'),
(171, '', 31, 'Se cargan las facturas sumando un total de:$ $ 123.85', '', 3, '0000-00-00 00:00:00', 'P'),
(172, '13-DK-106', 31, 'Se cargan las facturas sumando un total de:$ $ 123.85', '', 3, '2013-10-27 21:36:10', 'A'),
(173, '13-DK-106', 31, 'Se cargan las facturas sumando un total de:$ $ 123.85', '', 3, '0000-00-00 00:00:00', 'A'),
(174, '13-DK-106', 31, 'Se cargan las facturas sumando un total de:$ $ 123.85', '', 3, '2013-10-11 21:31:11', 'A'),
(177, '13-DK-106', 30, 'Subidos 1 Documentos Tipo: DECLARACION IVA , Descripción: hola', '', 3, '2013-10-27 23:47:20', 'A'),
(178, '13-DK-109', 1, 'Se crea DK, y se envia datos al cliente', NULL, 3, '2013-10-27 23:57:02', 'A'),
(179, '13-DK-110', 1, 'Se crea DK, y se envia datos al cliente', NULL, 3, '2013-10-28 00:03:28', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_procesos_actividad`
--

CREATE TABLE IF NOT EXISTS `dnk_procesos_actividad` (
  `contra_id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_PROCESO_id` int(11) NOT NULL,
  `DNK_ACTIVIDAD_APROBADA_id` int(11) NOT NULL,
  `DNK_ACTIVIDAD_NEGADA_id` int(11) NOT NULL,
  PRIMARY KEY (`contra_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `dnk_procesos_actividad`
--

INSERT INTO `dnk_procesos_actividad` (`contra_id`, `DNK_PROCESO_id`, `DNK_ACTIVIDAD_APROBADA_id`, `DNK_ACTIVIDAD_NEGADA_id`) VALUES
(1, 24, 5, 32),
(2, 12, 33, 34);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_retorno_dav`
--

CREATE TABLE IF NOT EXISTS `dnk_retorno_dav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_DOCUMENTO_id` int(10) unsigned NOT NULL,
  `fecha_ing` date DEFAULT NULL,
  `hora_ing` time DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `feha_ing_aduana` date DEFAULT NULL,
  `hora_ing_aduana` time DEFAULT NULL,
  `observacion` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RETORNO_DAV_FKIndex1` (`DNK_DOCUMENTO_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Volcar la base de datos para la tabla `dnk_retorno_dav`
--

INSERT INTO `dnk_retorno_dav` (`id`, `DNK_DOCUMENTO_id`, `fecha_ing`, `hora_ing`, `fecha_salida`, `hora_salida`, `feha_ing_aduana`, `hora_ing_aduana`, `observacion`) VALUES
(1, 1, '2011-09-30', '12:13:34', '2011-09-30', '12:13:11', '2011-09-30', '12:16:32', ''),
(2, 2, '2011-09-30', '12:58:53', '2011-09-30', '12:58:38', '2011-09-30', '13:01:30', ''),
(3, 13, '2011-10-27', '12:50:51', '2011-10-27', '12:50:42', '2011-10-27', '12:51:12', ''),
(4, 14, '2011-10-28', '15:59:25', '2011-10-28', '15:59:24', '2011-10-28', '15:59:27', ''),
(5, 36, NULL, NULL, '2011-11-28', '10:02:54', NULL, NULL, ''),
(6, 36, NULL, NULL, '2011-11-28', '10:03:08', NULL, NULL, ''),
(7, 36, NULL, NULL, '2011-11-28', '10:03:09', NULL, NULL, ''),
(8, 36, NULL, NULL, '2011-11-28', '10:03:09', NULL, NULL, ''),
(9, 36, NULL, NULL, '2011-11-28', '10:03:09', NULL, NULL, ''),
(10, 36, NULL, NULL, '2011-11-28', '10:06:51', NULL, NULL, ''),
(11, 36, NULL, NULL, '2011-11-28', '10:07:29', NULL, NULL, ''),
(12, 36, NULL, NULL, '2011-11-28', '10:11:50', NULL, NULL, ''),
(13, 36, NULL, NULL, '2011-11-28', '10:12:25', NULL, NULL, ''),
(14, 36, NULL, NULL, '2011-11-28', '10:12:26', NULL, NULL, ''),
(15, 36, NULL, NULL, '2011-11-28', '10:12:26', NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_revision_tramite`
--

CREATE TABLE IF NOT EXISTS `dnk_revision_tramite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_DOCUMENTO_id` int(10) unsigned NOT NULL,
  `partidas` int(10) unsigned DEFAULT NULL,
  `terminos` int(10) unsigned DEFAULT NULL,
  `acompanamiento` int(10) unsigned DEFAULT NULL,
  `carta` int(11) NOT NULL,
  `demorage` int(11) NOT NULL,
  `garantia` int(11) NOT NULL,
  `estado` int(10) unsigned DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `REVISION_TRAMITE_FKIndex1` (`DNK_DOCUMENTO_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcar la base de datos para la tabla `dnk_revision_tramite`
--

INSERT INTO `dnk_revision_tramite` (`id`, `DNK_DOCUMENTO_id`, `partidas`, `terminos`, `acompanamiento`, `carta`, `demorage`, `garantia`, `estado`, `observacion`) VALUES
(1, 1, 1, 1, 1, 0, 0, 0, 2, 'estamos esperando la carta de compromiso y los pagos de demoraje '),
(2, 2, 1, 1, 1, 0, 0, 0, 2, 'ES CARGA SUELTA SIN NOVEDAD'),
(3, 12, 1, 1, 0, 0, 0, 0, 2, 'IO'),
(4, 3, 1, 1, 0, 0, 0, 0, 2, 'fg'),
(6, 13, 1, 1, 1, 1, 1, 1, 2, 'asasas'),
(7, 14, 1, 1, 1, 0, 0, 0, 2, 'SEGUNDA PRUEBA OK'),
(9, 15, 1, 1, 1, 0, 0, 0, 2, 'ok'),
(10, 36, 1, 1, 1, 1, 0, 0, 2, 'pl'),
(11, 42, 1, 1, 1, 0, 0, 0, 2, 'zxcvzxcvzxvzxcv'),
(12, 42, 1, 1, 1, 0, 0, 0, 2, 'zxcvzxcvzxvzxcv');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_solicitud_egreso`
--

CREATE TABLE IF NOT EXISTS `dnk_solicitud_egreso` (
  `id_solicitud` int(11) NOT NULL COMMENT 'Codigo de la Solicitud',
  `fecha_solicitud` date NOT NULL COMMENT 'Fecha de Creacion Solicitud',
  `hora_solicitud` time NOT NULL,
  `motivo_solicitud` varchar(300) NOT NULL,
  `anticipo_solicitud` decimal(10,2) NOT NULL,
  `valtotal_solicitud` decimal(10,2) NOT NULL,
  `viapago_solicitud` varchar(2) NOT NULL,
  `tipocuenta_solicitud` varchar(2) NOT NULL,
  `banco_solicitud` int(11) NOT NULL,
  `numcuenta_solicitud` varchar(60) NOT NULL,
  `beneficiario_solicitud` varchar(300) NOT NULL,
  `cedula_solicitud` varchar(13) NOT NULL,
  `observacion_solicitud` varchar(500) NOT NULL,
  `DNK_DOCUMENTO_codigo` varchar(20) NOT NULL,
  `DNK_CLIENTE_id` int(11) NOT NULL,
  `estado_solicitud` varchar(2) NOT NULL COMMENT 'A: Activa, N:Anulada ',
  PRIMARY KEY (`id_solicitud`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `dnk_solicitud_egreso`
--

INSERT INTO `dnk_solicitud_egreso` (`id_solicitud`, `fecha_solicitud`, `hora_solicitud`, `motivo_solicitud`, `anticipo_solicitud`, `valtotal_solicitud`, `viapago_solicitud`, `tipocuenta_solicitud`, `banco_solicitud`, `numcuenta_solicitud`, `beneficiario_solicitud`, `cedula_solicitud`, `observacion_solicitud`, `DNK_DOCUMENTO_codigo`, `DNK_CLIENTE_id`, `estado_solicitud`) VALUES
(1, '0000-00-00', '13:19:09', 'CUALQUIERA DOSaa', '1232.00', '804.00', 'C', 'A', 6, '45345333', 'WILLIAN ESPINOSAaa', '17208023942', 'SDFASDFASFDqwerqweqweqwe', '13-DK-98', 1007, ''),
(2, '2013-10-06', '17:14:34', 'NASOFHSLFKH', '76.00', '87766.00', 'T', 'A', 2, '12341234', 'WILLIAN ESPINOSA', '1720802394', 'ZXCVZXCVZXCVZXCVZXCV', '13-DK-97', 1010, 'A'),
(3, '0000-00-00', '16:55:08', 'tttttttttttttttttttt', '33.00', '444.00', 'T', 'A', 18, '33333333333', 'WILLIAN ESPINOSA', '1720802394', 'wwwwwwwwwwwwwwwwwwwwww', '13-DK-99', 15, 'A'),
(4, '0000-00-00', '19:42:22', 'kkkkkkkkkkkkkk', '0.00', '654.00', 'T', 'A', 1, '98765411', 'WILLIAN ESPINOSA', '1720802394', 'kjhuiguygu', '13-DK-105', 1004, 'A'),
(5, '0000-00-00', '17:23:04', 'xvxcvzxcvzxcv', '123.00', '0.00', 'T', 'A', 1, '12312313', 'WILLIAN ESPINOSA', '1720802394', 'dfasdfasdf', '13-DK-105', 1004, 'A'),
(6, '0000-00-00', '18:13:53', 'sdgsdgsdgf', '155.00', '0.00', 'T', 'A', 2, '123412341234', 'WILLIAN ESPINOSA', '1720802394', 'sasdfasdf', '13-DK-105', 1004, 'A'),
(7, '2013-10-08', '18:16:29', 'wwwwwwwwwwwwwwwwwww', '500.00', '100.00', 'T', 'A', 1, '12341234', 'WILLIAN ESPINOSA', '1720802394', 'sdfasdfdfs', '13-DK-105', 1004, 'A'),
(8, '2013-10-26', '19:58:44', 'Cualquiera', '2134.00', '0.00', 'E', '0', 0, '', 'WILLIAN ESPINOSA', '1720802394', 'zxc<zxc<zxc', '13-DK-105', 1004, 'A'),
(9, '0000-00-00', '18:54:22', 'MULTAS', '123.85', '0.00', 'E', '0', 0, '', 'Juan Pita', '1720802394', 'hola mundo', '13-DK-108', 1003, 'A'),
(10, '2013-10-24', '19:20:43', 'MMMMMMMMMM', '50.00', '0.00', 'T', 'A', 1, '23324234234', 'Juan Pita', '1720802394', 'mmmmmmmmmmmmm', '13-DK-108', 1003, 'A'),
(11, '0000-00-00', '20:00:53', 'PPPPPPPPPPPPP', '800.00', '900.00', 'T', 'A', 1, '654987321', 'Juan Pita', '1720802394', 'iiiiiiiiii', '13-DK-108', 1003, 'A'),
(12, '2013-10-27', '20:18:38', 'MULTAS', '123.85', '0.00', 'E', '0', 0, '', 'Juan Pita', '1720802394', 'hgh', '13-DK-106', 15, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_submenu`
--

CREATE TABLE IF NOT EXISTS `dnk_submenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave secuencial del Submenu',
  `descripcion` varchar(200) NOT NULL COMMENT 'descripcion del Submenu',
  `dnk_menu_id` int(11) NOT NULL COMMENT 'Clave secuencial primaria del menu',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Volcar la base de datos para la tabla `dnk_submenu`
--

INSERT INTO `dnk_submenu` (`id`, `descripcion`, `dnk_menu_id`) VALUES
(1, 'Crear Tramite', 1),
(2, 'Tramites Aduanas', 2),
(3, 'Tramites Exterior', 2),
(4, 'Tramites con Documentos', 3),
(5, 'Tramites en Standby', 3),
(6, 'Tramites Ingresados', 3),
(7, 'Revisar y Autorizar', 4),
(8, 'Revisar Suspendidos', 4),
(9, 'Revisar Autorizados', 4),
(10, 'Subir Excel', 4),
(11, 'Cargar Datos Aduana', 5),
(12, 'Registro de Documentos', 6),
(13, 'Ver Suspendidos Aduana', 6),
(14, 'Ver Ingresados Aduana', 6),
(15, 'Liquidaciones Por Pagar', 7),
(16, 'Liquidaciones Impagas', 7),
(17, 'Liquidaciones Pagadas', 8),
(18, 'Observaciones Tramite', 6),
(19, 'Carga Suelta', 8),
(20, 'Carga Contenedor', 8),
(21, 'Registro de Multas', 9),
(22, 'Tramites en Abandono', 9),
(23, 'Tramites Levantados', 9),
(24, 'Solicitud de Transporte', 10),
(25, 'Transporte Asignado', 10),
(26, 'Entrega de Mercaderia', 10),
(27, 'Revision de Ordenes', 11),
(28, 'Ordenes por Cerrar', 11),
(29, 'Ordenes por Facturar', 12),
(30, 'Cerrar Ordenes', 12),
(31, 'Cambio de Clave', 14),
(32, 'Nuevo Usuario', 14),
(33, 'Todos los Usuarios', 14),
(34, 'Permisos de Usuarios', 14),
(35, 'Nuevo Cliente', 15),
(36, 'Buscar Clientes', 15),
(37, 'Editar Clientes', 15),
(38, 'Ver Clientes', 15),
(39, 'Nueva Empresa Transporte', 16),
(40, 'Nuevo Chofer', 16),
(41, 'Ver Transportistas', 16),
(42, 'Ver Choferes', 16),
(43, 'Organizar Ruta', 17),
(44, 'Visualizar Ruta', 17),
(45, 'Busqueda Personalizada Mensajeria', 17),
(46, 'Consulta Mensajerias Anteriores', 17),
(47, 'Crear Valija', 18),
(48, 'Revisar Valija', 18),
(49, 'Valijas en Trancito', 18),
(50, 'Consultar Anteriores Valijas', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_telefonos_clientes`
--

CREATE TABLE IF NOT EXISTS `dnk_telefonos_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_CLIENTE_id` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `extencion` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COMMENT='Tabla que contienen los numeros y extenciones de los cliente' AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `dnk_telefonos_clientes`
--

INSERT INTO `dnk_telefonos_clientes` (`id`, `DNK_CLIENTE_id`, `numero`, `extencion`) VALUES
(1, 1, '3811543', '12342'),
(2, 1051, '3', '333'),
(3, 1051, '444444', '444'),
(4, 1051, '55', '555');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tpdoc_escaneado`
--

CREATE TABLE IF NOT EXISTS `dnk_tpdoc_escaneado` (
  `tipo_doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_doc_desc` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`tipo_doc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Volcar la base de datos para la tabla `dnk_tpdoc_escaneado`
--

INSERT INTO `dnk_tpdoc_escaneado` (`tipo_doc_id`, `tipo_doc_desc`) VALUES
(6, 'ACUERDOS LIBERATORIOS '),
(5, 'AUTORIZ. ACOGIMIENTO REG. ESPECIAL '),
(7, 'AUTORIZ. CAMBIO DE OBRA '),
(8, 'AUTORIZ. COMEXI '),
(9, 'AUTORIZ. DESPACHO PARCIAL '),
(10, 'AUTORIZ. EXPORTACION DGP '),
(11, 'AUTORIZ. PREVIA '),
(12, 'CARTA ACEPTACION COBRO SALVAG. '),
(13, 'CARTA DE PORTE '),
(14, 'CARTA MINISTERIO RELACIONES EXT. '),
(15, 'CERTIF. FITOSANITARIO '),
(16, 'CERTIF. INSPECCION '),
(17, 'CERTIF. ORIGEN '),
(18, 'CERTIF. ORIGEN OIC - COFENAC '),
(19, 'CERTIF. PROPORCIONALIDAD SRI '),
(20, 'CERTIF. VEHICULAR '),
(21, 'COMPROB. RETENCION 1% ISD '),
(22, 'COMPROB. TARJA '),
(23, 'CONOCIMIENTO EMBARQUE '),
(24, 'CORPEI '),
(25, 'CUPO DIPLOMATICOS '),
(26, 'CUPON CORPECUADOR '),
(27, 'DAFE (CONVENIO DIVISAS ANTICIPADAS) '),
(28, 'DAU A '),
(29, 'DAU B '),
(30, 'DAU C '),
(31, 'DAU CONTENEDORES '),
(32, 'DAU DOC ACOMPAÑAMIENTO '),
(33, 'DAU SIMPLIFICADA '),
(34, 'DAU VEHICULOS '),
(35, 'DAV '),
(36, 'DECLARACION IVA '),
(37, 'DESTRUCCION SOBRANTES '),
(38, 'DOCUMENTO CONTROL PREVIO '),
(39, 'ENVIO CDA DE AUT. CIERRE EXPORT. '),
(40, 'EXON. COMPROB. RET. SRI (ISD) x FLETE '),
(41, 'EXON. COMPROB. RET. SRI (ISD) x SEGURO '),
(42, 'EXON. CORPEI '),
(43, 'EXPEDIENTE '),
(44, 'FACTURA COMERCIAL '),
(45, 'GARANTIA '),
(46, 'GUIA AEREA '),
(47, 'GUIA DE MOVILIZACION '),
(48, 'INFORME TECNICO FAVORABLE CNTTT '),
(49, 'LIQUIDACION DEPRECIACION MERCANCIAS '),
(50, 'LIQUIDACION ELECTRONICA '),
(51, 'LIQUIDACION MULTA CONTRAVENCION '),
(52, 'LISTA DE EMPAQUE '),
(53, 'MATRIZ DE CONSUMO '),
(54, 'ORDEN DE EMBARQUE '),
(55, 'OTROS '),
(56, 'PERMISO GLOBAL DE EXPORT. '),
(57, 'POLIZA SEGURO '),
(58, 'PROVIDENCIA '),
(59, 'REGULARIZACION x PERDIDA/DESTRUCCION '),
(60, 'RESOLUCION '),
(61, 'SELLO DE BODEGA '),
(62, 'SOLICITUD / CERTIFICADO DEPOSITO '),
(63, 'SOLICITUD DRAWBACK '),
(64, 'SOLICITUD SALIDA VALIJA DIPLOMATICA '),
(65, 'TITULO DE CREDITO '),
(66, 'TRAMITE DRAWBACK '),
(67, 'TRANSFERENCIA DE BENEFICIARIO '),
(68, 'VALOR AGREGADO NACIONAL '),
(69, 'VALOR DE LA TRANSACCION '),
(72, 'CANCELAR SOLICITUD DE EGRESO'),
(2, 'OTROS'),
(73, 'BL'),
(74, 'CERTIFICADO'),
(75, 'DOCUMENTO DE CONTROL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tpdoc_valija`
--

CREATE TABLE IF NOT EXISTS `dnk_tpdoc_valija` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcar la base de datos para la tabla `dnk_tpdoc_valija`
--

INSERT INTO `dnk_tpdoc_valija` (`id`, `descripcion`) VALUES
(1, 'BL'),
(2, 'Factura'),
(3, 'Retencion'),
(4, 'Pagos'),
(5, 'Cheques'),
(6, 'Oficios'),
(7, 'Inter-Change'),
(8, 'Liquidaciones'),
(9, 'Sobre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tp_carga`
--

CREATE TABLE IF NOT EXISTS `dnk_tp_carga` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `dnk_tp_carga`
--

INSERT INTO `dnk_tp_carga` (`id`, `descripcion`) VALUES
(1, 'Suelta'),
(2, 'Contenedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tp_documento`
--

CREATE TABLE IF NOT EXISTS `dnk_tp_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(250) NOT NULL,
  `estado` int(11) NOT NULL COMMENT '1: Activo, 2:Inactivo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `dnk_tp_documento`
--

INSERT INTO `dnk_tp_documento` (`id`, `descripcion`, `estado`) VALUES
(1, 'Embarque', 1),
(2, 'Embarque-Aduana', 1),
(4, 'Transporte Nacional', 1),
(3, 'Aduana', 1),
(5, 'Integral', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tramite`
--

CREATE TABLE IF NOT EXISTS `dnk_tramite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_DOCUMENTO_id` int(10) unsigned NOT NULL,
  `id_aduana` int(11) NOT NULL,
  `manifiesto` varchar(45) DEFAULT NULL,
  `fecha_llegada` date NOT NULL,
  `nota_pedido` varchar(45) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `url_excel` varchar(255) DEFAULT NULL,
  `num_item` int(11) NOT NULL,
  `abandono` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1=SI , 2=NO',
  `estado` int(10) unsigned DEFAULT NULL COMMENT '1=Standby , 2= autorizado, 3=embarque',
  PRIMARY KEY (`id`),
  KEY `TRAMITE_FKIndex1` (`DNK_DOCUMENTO_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `dnk_tramite`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tramite_acuerdo_numero`
--

CREATE TABLE IF NOT EXISTS `dnk_tramite_acuerdo_numero` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_TRAMITE_id` int(10) unsigned NOT NULL,
  `num_acuerdo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TRAMITE_ACUERDO_NUMERO_FKIndex1` (`DNK_TRAMITE_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `dnk_tramite_acuerdo_numero`
--

INSERT INTO `dnk_tramite_acuerdo_numero` (`id`, `DNK_TRAMITE_id`, `num_acuerdo`) VALUES
(1, 7, 'zxcvzxcv'),
(2, 8, '43122CCRD'),
(3, 9, '43122CCRD'),
(4, 10, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tramite_doc_aereo`
--

CREATE TABLE IF NOT EXISTS `dnk_tramite_doc_aereo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_TRAMITE_id` int(10) unsigned NOT NULL,
  `num_guia` varchar(45) DEFAULT NULL,
  `valor_guia` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TRAMITE_DOC_AEREO_FKIndex1` (`DNK_TRAMITE_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `dnk_tramite_doc_aereo`
--

INSERT INTO `dnk_tramite_doc_aereo` (`id`, `DNK_TRAMITE_id`, `num_guia`, `valor_guia`) VALUES
(1, 2, '07453708642', '184.11'),
(2, 10, '12', '12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tramite_doc_maritimo`
--

CREATE TABLE IF NOT EXISTS `dnk_tramite_doc_maritimo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_TRAMITE_id` int(10) unsigned NOT NULL,
  `num_bl` varchar(45) DEFAULT NULL,
  `valor_bl` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TRAMITE_DOC_MARITIMO_FKIndex1` (`DNK_TRAMITE_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `dnk_tramite_doc_maritimo`
--

INSERT INTO `dnk_tramite_doc_maritimo` (`id`, `DNK_TRAMITE_id`, `num_bl`, `valor_bl`) VALUES
(1, 1, 'CONS-5993-01', '2100'),
(2, 3, 'nmgmfj4564', ''),
(3, 4, 'fdj45745', '1231'),
(4, 7, 'sdfasd', '123'),
(5, 8, 'ASD123', '123'),
(6, 9, 'we', '23'),
(7, 13, '12341234', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tramite_doc_terrestre`
--

CREATE TABLE IF NOT EXISTS `dnk_tramite_doc_terrestre` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_TRAMITE_id` int(10) unsigned NOT NULL,
  `num_carta_porte` varchar(45) DEFAULT NULL,
  `valor_cp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TRAMITE_DOC_TERRESTRE_FKIndex1` (`DNK_TRAMITE_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `dnk_tramite_doc_terrestre`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tramite_factura`
--

CREATE TABLE IF NOT EXISTS `dnk_tramite_factura` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_TRAMITE_id` int(10) unsigned NOT NULL,
  `factura` varchar(45) DEFAULT NULL,
  `valor_fac` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TRAMITE_FACTURA_FKIndex1` (`DNK_TRAMITE_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcar la base de datos para la tabla `dnk_tramite_factura`
--

INSERT INTO `dnk_tramite_factura` (`id`, `DNK_TRAMITE_id`, `factura`, `valor_fac`) VALUES
(1, 1, '100739', '86456'),
(2, 2, '459512', '12465'),
(3, 4, 'dfghsdgh34235234', '200'),
(4, 7, 'asdf', '123'),
(5, 8, 'FACT20025555', '123'),
(6, 9, 'we', '123'),
(7, 9, 'rrrr', '12'),
(8, 9, 'eeee', '32'),
(9, 9, 'rrrr', '54'),
(10, 9, 'dfsdf', '76'),
(11, 9, 'fsdf', '325'),
(12, 9, 'sdfas', '34'),
(13, 9, 'sadf', '34'),
(14, 10, 's', '123'),
(15, 13, '12341234', '1223'),
(16, 13, '32444', '12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tramite_icomp`
--

CREATE TABLE IF NOT EXISTS `dnk_tramite_icomp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_TRAMITE_id` int(10) unsigned NOT NULL,
  `num_icomp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TRAMITE_ICOMP_FKIndex1` (`DNK_TRAMITE_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `dnk_tramite_icomp`
--

INSERT INTO `dnk_tramite_icomp` (`id`, `DNK_TRAMITE_id`, `num_icomp`) VALUES
(1, 1, '00466'),
(2, 7, 'zxcvz'),
(3, 8, '12312344'),
(4, 9, '12312344'),
(5, 10, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tramite_multa`
--

CREATE TABLE IF NOT EXISTS `dnk_tramite_multa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_DOCUMENTO_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `dnk_tramite_multa`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tramite_observacion`
--

CREATE TABLE IF NOT EXISTS `dnk_tramite_observacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_DOCUMENTO_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL COMMENT '1: standby, 2:autorizado',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `dnk_tramite_observacion`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tramite_poliza_transp`
--

CREATE TABLE IF NOT EXISTS `dnk_tramite_poliza_transp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_TRAMITE_id` int(10) unsigned NOT NULL,
  `num_poliza` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TRAMITE_POLIZA_TRANSP_FKIndex1` (`DNK_TRAMITE_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `dnk_tramite_poliza_transp`
--

INSERT INTO `dnk_tramite_poliza_transp` (`id`, `DNK_TRAMITE_id`, `num_poliza`) VALUES
(1, 1, '6018680//1058'),
(2, 2, '224'),
(3, 4, '3216459'),
(4, 7, 'zxcvzxcv'),
(5, 8, 'CC12341322'),
(6, 9, 'CC12341322'),
(7, 10, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tramite_transporte`
--

CREATE TABLE IF NOT EXISTS `dnk_tramite_transporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_CLIENTE_id` int(11) NOT NULL,
  `DNK_DOCUMENTO_id` int(11) NOT NULL,
  `DNK_TRANSPORTISTA_id` int(11) NOT NULL,
  `DNK_DOCUMENTO_ADUANA_codigo` varchar(100) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `peso` varchar(250) NOT NULL,
  `origen` varchar(350) NOT NULL,
  `destino` varchar(350) NOT NULL,
  `hora_salida` time NOT NULL,
  `hora_llegada` time NOT NULL,
  `persona_recibe` varchar(250) NOT NULL,
  `observacion` varchar(350) NOT NULL,
  `estado` int(11) NOT NULL COMMENT '1=Solicitado, 2= Con Transporte, 3= Finalizado',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `dnk_tramite_transporte`
--

INSERT INTO `dnk_tramite_transporte` (`id`, `DNK_CLIENTE_id`, `DNK_DOCUMENTO_id`, `DNK_TRANSPORTISTA_id`, `DNK_DOCUMENTO_ADUANA_codigo`, `usuario_id`, `peso`, `origen`, `destino`, `hora_salida`, `hora_llegada`, `persona_recibe`, `observacion`, `estado`) VALUES
(1, 15, 13, 1, '', 44, '125', 'Quito', 'Guayaquil', '19:20:00', '21:30:00', 'Juan Perez', 'sadasfasdf', 3),
(2, 15, 14, 1, '', 44, '123', 'QUITO', 'Guayaquil', '16:30:00', '21:30:00', 'willian espinosa', 'ninguna', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_tramite_varios_doc`
--

CREATE TABLE IF NOT EXISTS `dnk_tramite_varios_doc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DNK_TRAMITE_id` int(10) unsigned NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `num_documento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TRAMITE_VARIOS_DOC_FKIndex1` (`DNK_TRAMITE_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `dnk_tramite_varios_doc`
--

INSERT INTO `dnk_tramite_varios_doc` (`id`, `DNK_TRAMITE_id`, `descripcion`, `num_documento`) VALUES
(1, 1, 'Packing List', '100739'),
(2, 8, 'CDDSSD', '1234124');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_transportista`
--

CREATE TABLE IF NOT EXISTS `dnk_transportista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_EMP_TRANSPORTE_id` int(11) NOT NULL,
  `nombre_chofer` varchar(250) NOT NULL,
  `cedula` varchar(250) NOT NULL,
  `placa` varchar(250) NOT NULL,
  `tipo_licencia` varchar(10) NOT NULL,
  `licencia_numero` varchar(100) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `marca_camion` varchar(250) NOT NULL,
  `ano_camion` varchar(30) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1' COMMENT '1:activo, 2:inactivo, 3:anulado',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `dnk_transportista`
--

INSERT INTO `dnk_transportista` (`id`, `DNK_EMP_TRANSPORTE_id`, `nombre_chofer`, `cedula`, `placa`, `tipo_licencia`, `licencia_numero`, `celular`, `marca_camion`, `ano_camion`, `estado`) VALUES
(1, 1, 'AJHKJ', '0702852286', 'PBU566', 'E', '125896', '0955', 'HINO', '1990', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_usuario_solicitud`
--

CREATE TABLE IF NOT EXISTS `dnk_usuario_solicitud` (
  `usu_codigo` int(11) NOT NULL,
  `sol_secuencia` int(11) NOT NULL,
  PRIMARY KEY (`usu_codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `dnk_usuario_solicitud`
--

INSERT INTO `dnk_usuario_solicitud` (`usu_codigo`, `sol_secuencia`) VALUES
(3, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_valija_c`
--

CREATE TABLE IF NOT EXISTS `dnk_valija_c` (
  `id` varchar(60) NOT NULL,
  `origen_id` varchar(4) NOT NULL,
  `destino_id` varchar(4) NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `transporte` varchar(200) NOT NULL,
  `documento` varchar(500) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `dnk_valija_c`
--

INSERT INTO `dnk_valija_c` (`id`, `origen_id`, `destino_id`, `fecha_ini`, `fecha_fin`, `transporte`, `documento`, `estado`) VALUES
('05-UIO-1', 'UIO', 'GYE', '2012-05-24', '2012-05-24', 'Transportes Ecuador', '', 'C'),
('05-UIO-2', 'UIO', 'GYE', '2012-05-29', '2012-05-29', 'Transportes Aerea', '', 'C'),
('05-UIO-3', 'UIO', 'GYE', '2012-05-30', '2012-05-31', 'Transportes Ecuador', '', 'A'),
('06-UIO-4', 'UIO', 'GYE', '2012-06-07', '0000-00-00', 'Transportes Ecuador', '', 'A'),
('0', '--- ', '--- ', '0000-00-00', '0000-00-00', '--- Escoja ---', '', 'A'),
('05-GYE-5', 'GYE', 'UIO', '2013-05-20', '2013-05-20', 'Transportes Ecuador', '', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_valija_d`
--

CREATE TABLE IF NOT EXISTS `dnk_valija_d` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DNK_VALIJA_C_id` varchar(60) NOT NULL,
  `DNK_TPDOC_VALIJA_id` int(11) NOT NULL,
  `DNK_DOCUMENTO_codigo` varchar(20) NOT NULL,
  `DNK_CLIENTE_id` int(11) NOT NULL,
  `Descripcion_Cliente` varchar(300) NOT NULL,
  `ciudad_destino` varchar(200) NOT NULL COMMENT 'Ciudad de destino',
  `direc_destino` varchar(500) NOT NULL,
  `num_documento` int(11) DEFAULT NULL COMMENT 'Numero de Documentos',
  `fecha_crea` date NOT NULL COMMENT 'Fecha de Creacion del Item',
  `destino_empleado` int(11) NOT NULL,
  `hora_recibido` time NOT NULL,
  `usuario_recibe` varchar(200) NOT NULL,
  `estado_item` varchar(1) NOT NULL COMMENT 'E: Entregado, P: Pendiente, C: Cancelado',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=100 ;

--
-- Volcar la base de datos para la tabla `dnk_valija_d`
--

INSERT INTO `dnk_valija_d` (`id`, `DNK_VALIJA_C_id`, `DNK_TPDOC_VALIJA_id`, `DNK_DOCUMENTO_codigo`, `DNK_CLIENTE_id`, `Descripcion_Cliente`, `ciudad_destino`, `direc_destino`, `num_documento`, `fecha_crea`, `destino_empleado`, `hora_recibido`, `usuario_recibe`, `estado_item`) VALUES
(1, '05-UIO-7', 3, '11-DK-85', 3, '', 'GYE', 'No se', 1236549, '2012-05-24', 2, '00:00:00', '', 'A'),
(2, '05-UIO-1', 1, 'dnk', 1, '', 'GYE', 'aaaaaaaaaaa', 0, '2012-05-24', 0, '00:00:00', '', 'A'),
(3, '05-UIO-1', 3, 'dsgdsf', 1, '', 'GYE', 'gsdfgsdfg', 987, '2012-05-24', 59, '00:00:00', '', 'A'),
(4, '05-UIO-1', 1, '11-DK-92', 1, '', 'GYE', 'cualquiera', 123515, '2012-05-24', 59, '00:00:00', '', 'A'),
(5, '05-UIO-1', 5, '11-DK-85', 5, '', 'GYE', 'sdafasdf', 25785, '2012-05-24', 59, '00:00:00', '', 'A'),
(6, '05-UIO-1', 1, '11-DK-83', 3, '', 'GYE', 'sadasdasd', 0, '2012-05-24', 0, '00:00:00', '', 'A'),
(7, '05-UIO-1', 6, '11-DK-86', 5, '', 'GYE', 'qweqwe', 54, '2012-05-24', 58, '00:00:00', '', 'A'),
(8, '05-UIO-1', 7, 'qwe', 0, '', 'GYE', 'qwerqwer', 1234, '2012-05-24', 58, '00:00:00', '', 'A'),
(12, '05-UIO-1', 1, '11-DK-81', 0, '', 'GYE', '', 0, '2012-05-24', 58, '00:00:00', '', 'A'),
(13, '05-UIO-1', 1, '11-DK-81', 0, '', 'GYE', '', 0, '2012-05-24', 58, '00:00:00', '', 'A'),
(14, '05-UIO-2', 2, '11-DK-91', 0, '', 'GYE', 'Cualquiera', 654, '2012-05-29', 59, '00:00:00', '', 'A'),
(15, '05-UIO-2', 2, '11-DK-91', 0, '', 'GYE', 'Cualquiera', 654, '2012-05-29', 59, '00:00:00', '', 'A'),
(16, '05-UIO-2', 3, '11-DK-89', 0, '', 'GYE', 'sadf', 6, '2012-05-29', 59, '00:00:00', '', 'A'),
(17, '05-UIO-2', 2, '24', 0, '', 'GYE', '45', 654, '2012-05-29', 59, '00:00:00', '', 'A'),
(18, '05-UIO-2', 2, '24', 0, '', 'GYE', '45', 654, '2012-05-29', 59, '00:00:00', '', 'A'),
(19, '05-UIO-2', 3, 'asdf', 1, '', 'GYE', 'asdf', 0, '2012-05-29', 59, '00:00:00', '', 'A'),
(20, '05-UIO-2', 3, '11-DK-92', 3, '', 'GYE', 'asfea', 1234, '2012-05-29', 59, '00:00:00', '', 'A'),
(21, '05-UIO-2', 3, '11-DK-91', 12, '', 'GYE', 'kljhgf', 987, '2012-05-29', 59, '00:00:00', '', 'E'),
(22, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(23, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(24, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(25, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(26, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(27, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(28, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(29, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(30, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(31, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(32, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(33, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(34, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(35, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(36, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(37, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(38, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(39, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(40, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(41, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(42, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(43, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(44, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(45, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(46, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(47, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(48, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(49, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(50, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(51, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(52, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(53, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(54, '05-UIO-3', 3, '754', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(55, '05-UIO-3', 3, '754', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(56, '05-UIO-3', 3, '754', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(57, '05-UIO-3', 3, '754', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(58, '05-UIO-3', 3, '754', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(59, '05-UIO-3', 3, '754', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(60, '05-UIO-3', 3, '754', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(61, '05-UIO-3', 3, '754', 0, '', 'GYE', 'fausto riera', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(62, '05-UIO-3', 3, '11-DK-92', 9, '', 'GYE', 'ninguno', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(63, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(64, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(65, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(66, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 4735, '2012-05-30', 59, '00:00:00', '', 'A'),
(67, '05-UIO-3', 3, '11-DK-92', 10, '', 'GYE', 'Cualquiera', 9876541, '2012-05-30', 59, '00:00:00', '', 'A'),
(68, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(69, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(70, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(71, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(72, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(73, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(74, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(75, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(76, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(77, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(78, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(79, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(80, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(81, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(82, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(83, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(84, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(85, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(86, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(87, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(88, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(89, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(90, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(91, '05-UIO-3', 3, 'n/a', 0, '', 'GYE', 'FAUSTO RIERA', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(92, '05-UIO-3', 3, 'n/a', 1, '', 'GYE', 'FAUSTO', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(93, '05-UIO-3', 3, 'n/a', 1, '', 'GYE', 'FAUSTO', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(94, '05-UIO-3', 3, 'n/a', 1, '', 'GYE', 'FAUSTO', 145, '2012-05-30', 59, '00:00:00', '', 'A'),
(95, '06-UIO-4', 2, '11-DK-82', 0, '', 'GYE', 'col', 987654, '2012-06-07', 59, '00:00:00', '', 'A'),
(96, '06-UIO-4', 2, '11-DK-82', 0, '', 'GYE', 'col', 987654, '2012-06-07', 59, '00:00:00', '', 'A'),
(97, '06-UIO-4', 2, 'dd', 0, '', 'GYE', 'sfghsfh', 0, '2012-06-07', 59, '00:00:00', '', 'A'),
(98, '06-UIO-4', 3, 'uyhk', 0, 'yyyyyy', 'GYE', 'zdxzvxcz', 654, '2012-06-07', 59, '00:00:00', '', 'A'),
(99, '06-UIO-4', 2, 'fgghfgh', 0, 'wwwwwwwwwwww', 'GYE', 'sxfsf', 22352345, '2012-06-07', 59, '00:00:00', '', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dnk_verificadora`
--

CREATE TABLE IF NOT EXISTS `dnk_verificadora` (
  `id` int(10) unsigned NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcar la base de datos para la tabla `dnk_verificadora`
--

INSERT INTO `dnk_verificadora` (`id`, `nombre`, `direccion`, `telefono`) VALUES
(1, 'ITS', NULL, NULL),
(2, 'BERAU VERITAS', NULL, NULL),
(3, 'COTECNA', NULL, NULL),
(4, 'SGS', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_desc` varchar(400) NOT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `rol`
--

INSERT INTO `rol` (`rol_id`, `rol_desc`) VALUES
(1, 'Administrador'),
(2, 'Usuario Estandar'),
(3, 'Operaciones'),
(4, 'Administrativo'),
(5, 'Contabilidad'),
(6, 'Logistica'),
(7, 'Comercial');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
