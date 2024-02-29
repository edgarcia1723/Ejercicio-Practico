-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para edumanage
CREATE DATABASE IF NOT EXISTS `edumanage` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `edumanage`;

-- Volcando estructura para procedimiento edumanage.InsertarAlumnos
DELIMITER //
CREATE PROCEDURE `InsertarAlumnos`(
    IN carnet_alumno VARCHAR(50),
    IN nombre_alumno VARCHAR(50),
    IN apellido_alumno VARCHAR(50),
    IN edad_alumno INT
)
BEGIN
    INSERT INTO tb_alumnos (carnet_alumno, nombre_alumno, apellido_alumno, edad_alumno) 
	 VALUES (carnet_alumno, nombre_alumno, apellido_alumno, edad_alumno);
END//
DELIMITER ;

-- Volcando estructura para procedimiento edumanage.InsertarMaterias
DELIMITER //
CREATE PROCEDURE `InsertarMaterias`(
    IN nombre_materia VARCHAR(100),
    IN grupo_materia INT,
    IN cupos_disponibles INT
)
BEGIN
    INSERT INTO tb_materias (nombre_materia, grupo_materia, cupos_disponibles) 
	 VALUES (nombre_materia, grupo_materia, cupos_disponibles);
END//
DELIMITER ;

-- Volcando estructura para procedimiento edumanage.InsertarProfesores
DELIMITER //
CREATE PROCEDURE `InsertarProfesores`(
    IN nombre VARCHAR(100),
    IN apellido VARCHAR(100),
    IN correo_electronico VARCHAR(100)
)
BEGIN
    INSERT INTO tb_profesores (nombre, apellido, correo_electronico) 
	 VALUES (nombre, apellido, correo_electronico);
END//
DELIMITER ;

-- Volcando estructura para tabla edumanage.tb_alumnos
CREATE TABLE IF NOT EXISTS `tb_alumnos` (
  `id_alumno` varchar(36) NOT NULL DEFAULT uuid(),
  `carnet_alumno` varchar(50) DEFAULT NULL,
  `nombre_alumno` varchar(50) DEFAULT NULL,
  `apellido_alumno` varchar(50) DEFAULT NULL,
  `edad_alumno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla edumanage.tb_alumnos: ~14 rows (aproximadamente)
INSERT IGNORE INTO `tb_alumnos` (`id_alumno`, `carnet_alumno`, `nombre_alumno`, `apellido_alumno`, `edad_alumno`) VALUES
	('d2502536-d69f-11ee-b685-b04f130599b9', '6546', 'Camilon', 'Perez', 13),
	('d2782a7a-d69f-11ee-b685-b04f130599b9', '9872', 'María', 'González', 25),
	('d2936090-d69f-11ee-b685-b04f130599b9', '1234', 'Pedro', 'Ramírez', 18),
	('d2a37aa1-d69f-11ee-b685-b04f130599b9', '5678', 'Laura', 'Martínez', 30),
	('d2aaf183-d69f-11ee-b685-b04f130599b9', '3456', 'Juan', 'López', 22),
	('d2b00634-d69f-11ee-b685-b04f130599b9', '7890', 'Ana', 'Hernández', 27),
	('d2bb97b5-d69f-11ee-b685-b04f130599b9', '2345', 'Carlos', 'García', 21),
	('d2c5e873-d69f-11ee-b685-b04f130599b9', '8901', 'Sofía', 'Díaz', 19),
	('d2d1ff39-d69f-11ee-b685-b04f130599b9', '4567', 'Luis', 'Fernández', 26),
	('d2df4466-d69f-11ee-b685-b04f130599b9', '6789', 'Lucía', 'Sánchez', 24),
	('d2fcc83c-d69f-11ee-b685-b04f130599b9', '9012', 'Diego', 'Torres', 20),
	('d3295db2-d69f-11ee-b685-b04f130599b9', '4321', 'Valeria', 'Paz', 28),
	('d3323e84-d69f-11ee-b685-b04f130599b9', '2109', 'Mateo', 'Ríos', 23),
	('d33a2167-d69f-11ee-b685-b04f130599b9', '8765', 'Isabel', 'Álvarez', 29);

-- Volcando estructura para tabla edumanage.tb_calificaciones
CREATE TABLE IF NOT EXISTS `tb_calificaciones` (
  `id_calificacion` varchar(36) NOT NULL DEFAULT uuid(),
  `id_inscripcion` varchar(36) DEFAULT NULL,
  `calificacion_final` decimal(3,2) DEFAULT NULL CHECK (`calificacion_final` >= 7),
  `fecha_calificacion` date DEFAULT NULL,
  PRIMARY KEY (`id_calificacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla edumanage.tb_calificaciones: ~0 rows (aproximadamente)

-- Volcando estructura para tabla edumanage.tb_inscripciones
CREATE TABLE IF NOT EXISTS `tb_inscripciones` (
  `id_inscripcion` varchar(36) NOT NULL DEFAULT uuid(),
  `id_alumno` varchar(36) DEFAULT NULL,
  `id_materia` varchar(36) DEFAULT NULL,
  `fecha_inscripcion` date DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT NULL,
  PRIMARY KEY (`id_inscripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla edumanage.tb_inscripciones: ~0 rows (aproximadamente)

-- Volcando estructura para tabla edumanage.tb_materias
CREATE TABLE IF NOT EXISTS `tb_materias` (
  `id_materia` varchar(36) NOT NULL DEFAULT uuid(),
  `nombre_materia` varchar(100) DEFAULT NULL,
  `grupo_materia` int(11) DEFAULT NULL,
  `id_profesor` varchar(36) DEFAULT NULL,
  `cupos_disponibles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla edumanage.tb_materias: ~14 rows (aproximadamente)
INSERT IGNORE INTO `tb_materias` (`id_materia`, `nombre_materia`, `grupo_materia`, `id_profesor`, `cupos_disponibles`) VALUES
	('d35109ae-d69f-11ee-b685-b04f130599b9', 'Matematica', 1, NULL, 135),
	('d363af9d-d69f-11ee-b685-b04f130599b9', 'Física', 2, NULL, 120),
	('d374f175-d69f-11ee-b685-b04f130599b9', 'Química', 1, NULL, 90),
	('d38308e5-d69f-11ee-b685-b04f130599b9', 'Biología', 3, NULL, 110),
	('d3912a05-d69f-11ee-b685-b04f130599b9', 'Historia', 2, NULL, 80),
	('d39728e7-d69f-11ee-b685-b04f130599b9', 'Literatura', 1, NULL, 70),
	('d39abec0-d69f-11ee-b685-b04f130599b9', 'Inglés', 3, NULL, 100),
	('d3a46f19-d69f-11ee-b685-b04f130599b9', 'Programación', 2, NULL, 140),
	('d3aac55b-d69f-11ee-b685-b04f130599b9', 'Economía', 1, NULL, 60),
	('d3c570ca-d69f-11ee-b685-b04f130599b9', 'Arte', 3, NULL, 130),
	('d3d9b4fa-d69f-11ee-b685-b04f130599b9', 'Geografía', 1, NULL, 110),
	('d3e2bad7-d69f-11ee-b685-b04f130599b9', 'Filosofía', 2, NULL, 100),
	('d3e915c2-d69f-11ee-b685-b04f130599b9', 'Educación Física', 3, NULL, 80),
	('d3f098b4-d69f-11ee-b685-b04f130599b9', 'Ciencias Sociales', 1, NULL, 150);

-- Volcando estructura para tabla edumanage.tb_profesores
CREATE TABLE IF NOT EXISTS `tb_profesores` (
  `id_profesor` varchar(36) NOT NULL DEFAULT uuid(),
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla edumanage.tb_profesores: ~14 rows (aproximadamente)
INSERT IGNORE INTO `tb_profesores` (`id_profesor`, `nombre`, `apellido`, `correo_electronico`) VALUES
	('d09de27d-d69f-11ee-b685-b04f130599b9', 'Juan', 'Perez', 'juan@example.com'),
	('d0cbf864-d69f-11ee-b685-b04f130599b9', 'María', 'Gómez', 'maria@example.com'),
	('d0fb9aa3-d69f-11ee-b685-b04f130599b9', 'Luis', 'Martínez', 'luis@example.com'),
	('d12e7acd-d69f-11ee-b685-b04f130599b9', 'Ana', 'Rodríguez', 'ana@example.com'),
	('d143c3c8-d69f-11ee-b685-b04f130599b9', 'Carlos', 'López', 'carlos@example.com'),
	('d162544a-d69f-11ee-b685-b04f130599b9', 'Laura', 'Sánchez', 'laura@example.com'),
	('d182bbf3-d69f-11ee-b685-b04f130599b9', 'Pedro', 'García', 'pedro@example.com'),
	('d1a4345b-d69f-11ee-b685-b04f130599b9', 'Sofía', 'Fernández', 'sofia@example.com'),
	('d1c47677-d69f-11ee-b685-b04f130599b9', 'Javier', 'Díaz', 'javier@example.com'),
	('d1d0928f-d69f-11ee-b685-b04f130599b9', 'Elena', 'Ruiz', 'elena@example.com'),
	('d1d9b0c5-d69f-11ee-b685-b04f130599b9', 'David', 'Hernández', 'david@example.com'),
	('d1e16800-d69f-11ee-b685-b04f130599b9', 'Marta', 'Torres', 'marta@example.com'),
	('d1e99e21-d69f-11ee-b685-b04f130599b9', 'Alberto', 'Jiménez', 'alberto@example.com'),
	('d205e613-d69f-11ee-b685-b04f130599b9', 'Carmen', 'Núñez', 'carmen@example.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
