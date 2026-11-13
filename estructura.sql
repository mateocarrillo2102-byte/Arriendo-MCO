SET FOREIGN_KEY_CHECKS = 0;
use amco;

CREATE TABLE `ciudad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`,`departamento`)
);


CREATE TABLE `informacion_reserva` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_inmueble` int NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('pendiente','confirmada','cancelada') NOT NULL DEFAULT 'pendiente',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(15,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_inmueble` (`id_inmueble`),
  CONSTRAINT `informacion_reserva_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `informacion_reserva_ibfk_2` FOREIGN KEY (`id_inmueble`) REFERENCES `inmueble` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE `inmueble` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(15,2) NOT NULL,
  `area` decimal(10,2) NOT NULL,
  `habitaciones` int NOT NULL,
  `banos` int NOT NULL,
  `garajes` int NOT NULL,
  `fecha_publicacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `locacion_id` int NOT NULL,
  `tipo_inmueble_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locacion_id` (`locacion_id`),
  KEY `tipo_inmueble_id` (`tipo_inmueble_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `inmueble_ibfk_1` FOREIGN KEY (`locacion_id`) REFERENCES `locacion` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `inmueble_ibfk_2` FOREIGN KEY (`tipo_inmueble_id`) REFERENCES `tipo_inmueble` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `inmueble_ibfk_3` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE `locacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ciudad_id` int NOT NULL,
  `barrio` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `latitud` decimal(9,6) DEFAULT NULL,
  `longitud` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_locacion_ciudad` (`ciudad_id`),
  CONSTRAINT `fk_locacion_ciudad` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudad` (`id`)
);

CREATE TABLE `pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `monto` decimal(15,2) NOT NULL,
  `fecha_pago` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `metodo_pago` enum('tarjeta','transferencia','efectivo') NOT NULL,
  `id_informacion_reserva` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_informacion_reserva` (`id_informacion_reserva`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_informacion_reserva`) REFERENCES `informacion_reserva` (`id`)
);

CREATE TABLE `propiedad_foto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inmueble_id` int NOT NULL,
  `nombre_original` varchar(255) NOT NULL,
  `ruta` varchar(500) NOT NULL,
  `tipo_mime` varchar(100) NOT NULL,
  `tamano_bytes` int NOT NULL,
  `orden` int NOT NULL DEFAULT '0',
  `principal` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_foto_propiedad` (`inmueble_id`),
  CONSTRAINT `fk_foto_propiedad` FOREIGN KEY (`inmueble_id`) REFERENCES `inmueble` (`id`) ON DELETE CASCADE
);

CREATE TABLE `rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `tipo_inmueble` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cedula_ciudadania` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena_HASH` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `rol_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula_ciudadania` (`cedula_ciudadania`),
  UNIQUE KEY `correo` (`correo`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);
SET FOREIGN_KEY_CHECKS = 1;