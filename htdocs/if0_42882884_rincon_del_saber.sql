-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql202.infinityfree.com
-- Tiempo de generación: 23-09-2026 a las 04:07:19
-- Versión del servidor: 11.4.13-MariaDB
-- Versión de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `if0_42882884_rincon_del_saber`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` bigint(20) UNSIGNED NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_administrador`, `Nombre`, `Apellido`, `email`, `contraseña`) VALUES
(1, 'Ramiro', 'Unrein', 'ramirounrein1@gmail.com', '1111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificar`
--

CREATE TABLE `clasificar` (
  `id_libro` bigint(20) UNSIGNED NOT NULL,
  `id_genero` bigint(20) UNSIGNED NOT NULL,
  `id_clasificar` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `tipo_consulta` enum('general','prestamos','recomendacion','sugerencia','reclamo','otro') NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp(),
  `leido` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplar`
--

CREATE TABLE `ejemplar` (
  `id_ejemplar` bigint(20) UNSIGNED NOT NULL,
  `id_libro` bigint(20) UNSIGNED NOT NULL,
  `numero_ejemplar` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ejemplar`
--

INSERT INTO `ejemplar` (`id_ejemplar`, `id_libro`, `numero_ejemplar`, `estado`) VALUES
(53, 1, 1, 1),
(54, 1, 2, 0),
(55, 7, 1, 1),
(56, 7, 2, 1),
(57, 8, 1, 0),
(58, 8, 2, 1),
(59, 9, 1, 1),
(60, 9, 2, 1),
(61, 10, 1, 1),
(62, 11, 1, 1),
(63, 11, 2, 0),
(64, 12, 1, 1),
(65, 13, 1, 1),
(66, 13, 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` bigint(20) UNSIGNED NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) NOT NULL,
  `matricula` bigint(20) NOT NULL,
  `curso` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `Nombre`, `Apellido`, `matricula`, `curso`, `email`) VALUES
(1, 'Ramiro', 'Unrein', 1111, '1ro', 'ramirounrein1@gmail.com'),
(3, 'Julian', 'Murgic', 1111, '3ro', 'julimurgic@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` bigint(20) UNSIGNED NOT NULL,
  `nombre_genero` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `nombre_genero`) VALUES
(1, 'Literatura'),
(2, 'Ciencia'),
(3, 'Infantil'),
(4, 'Historia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id_libro` bigint(20) UNSIGNED NOT NULL,
  `título` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `categoria` varchar(30) NOT NULL DEFAULT 'literatura',
  `editorial` varchar(255) NOT NULL,
  `fecha_publicación` date NOT NULL,
  `portada` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `valoracion` decimal(2,1) DEFAULT NULL,
  `paginas` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id_libro`, `título`, `autor`, `categoria`, `editorial`, `fecha_publicación`, `portada`, `descripcion`, `valoracion`, `paginas`) VALUES
(1, 'El principito', 'Antoine de Saint-Exupéry', 'literatura', 'Salamandra', '1943-01-01', 'imagenes/el-principito.jpg', 'El principito de Antoine de Saint-Exupéry narra el encuentro entre un aviador varado en el desierto y un pequeño príncipe que viene de otro planeta. A través de sus preguntas y viajes, la historia reflexiona sobre la amistad, el amor y lo esencial que solo se ve con el corazón.', '4.8', 96),
(7, '1984', 'George Orwell', 'literatura', 'Debolsillo', '1949-01-01', 'imagenes/1984.jpg', '1984 de George Orwell describe una sociedad totalitaria vigilada por el Gran Hermano, donde el pensamiento y el lenguaje están controlados. Winston Smith, el protagonista, cuestiona el sistema mientras el régimen intenta borrar cualquier forma de disidencia.', '4.7', 328),
(8, 'Orgullo y prejuicio', 'Jane Austen', 'literatura', 'Alianza Editorial', '1813-01-01', 'imagenes/orgullo-y-prejuicio.jpg', 'Orgullo y prejuicio sigue a Elizabeth Bennet y sus hermanas en la Inglaterra rural, donde el matrimonio, la clase social y los primeros juicios marcan sus relaciones. La novela de Jane Austen combina ironía y romance para retratar las costumbres de su época.', '4.6', 432),
(9, 'Red Eyes', 'Mara Voss', 'literatura', 'HarperCollins', '2023-01-01', 'imagenes/red-eyes.jpg', 'Red Eyes de Mara Voss sigue a una investigadora que persigue una serie de desapariciones en una ciudad costera. A medida que las pistas se acumulan, descubre que el verdadero peligro está más cerca de lo que imaginaba.', '4.3', 288),
(10, 'Walk into the Shadow', 'Theo Bramwell', 'literatura', 'Orbit Books', '2021-01-01', 'imagenes/walk-into-the-shadow.jpg', 'Walk into the Shadow de Theo Bramwell mezcla fantasía y misterio en un mundo donde las sombras guardan recuerdos ajenos. Su protagonista aprende a leerlas para resolver un crimen que nadie más puede ver.', '4.2', 356),
(11, 'What is AI', 'Renee Cole', 'ciencia', 'MIT Press', '2023-01-01', 'imagenes/what-is-ai.jpg', 'What is AI de Renee Cole explica de forma accesible los fundamentos de la inteligencia artificial: cómo aprenden las máquinas, qué problemas pueden resolver y qué límites e implicancias éticas trae su uso cotidiano.', '4.5', 214),
(12, 'Dawn of Tomorrow', 'Delilah K. May', 'infantil', 'Atria Books', '2022-01-01', 'imagenes/dawn-of-tomorrow.jpg', 'The Dawn of Tomorrow de Delilah K. May es una novela que explora las luchas y aspiraciones de dos hermanas a principios del siglo XX. Ambientada en Estados Unidos, sigue su viaje entre sueños, desafíos sociales y roles de género tradicionales.', '4.4', 251),
(13, 'Sapiens', 'Yuval Noah Harari', 'historia', 'Debate', '2011-01-01', 'imagenes/sapiens.jpg', 'Sapiens de Yuval Noah Harari recorre la historia de la humanidad desde la aparición del Homo sapiens hasta la actualidad, explorando cómo el mito, la cooperación y las revoluciones cognitiva, agrícola y científica moldearon nuestro mundo.', '4.7', 496);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_espera`
--

CREATE TABLE `lista_espera` (
  `id_lista` bigint(20) UNSIGNED NOT NULL,
  `id_estudiante` bigint(20) UNSIGNED NOT NULL,
  `id_libro` bigint(20) UNSIGNED NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `posición` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lista_espera`
--

INSERT INTO `lista_espera` (`id_lista`, `id_estudiante`, `id_libro`, `fecha_solicitud`, `posición`) VALUES
(4, 2, 11, '2026-07-04', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id_prestamo` bigint(20) UNSIGNED NOT NULL,
  `Id_estudiante` bigint(20) UNSIGNED NOT NULL,
  `Id_ejemplar` bigint(20) UNSIGNED NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `fecha_estimada_de_devolución` date NOT NULL,
  `estado_prestamo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `Id_estudiante`, `Id_ejemplar`, `fecha_prestamo`, `fecha_devolucion`, `fecha_estimada_de_devolución`, `estado_prestamo`) VALUES
(1, 2, 1, '2024-03-01', NULL, '2024-03-15', 1),
(2, 1, 2, '2024-03-05', NULL, '2024-03-19', 1),
(4, 3, 20, '2026-07-04', NULL, '2026-07-11', 1),
(8, 1, 64, '2026-07-05', NULL, '2026-07-12', 1),
(10, 1, 55, '2026-09-18', NULL, '2026-09-25', 1),
(11, 1, 61, '2026-09-22', NULL, '2026-09-30', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id_profesor` bigint(20) UNSIGNED NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id_profesor`, `Nombre`, `Apellido`, `email`, `contraseña`) VALUES
(1, 'Lucía', 'Fernández', 'lucia.fernandez@rincondelsaber.edu.ar', '123456'),
(2, 'Carla', 'Sosa', 'carla.sosa@rincondelsaber.edu.ar', '123456'),
(3, 'Marta', 'Giménez', 'marta.gimenez@rincondelsaber.edu.ar', '123456'),
(4, 'Diego', 'Herrera', 'diego.herrera@rincondelsaber.edu.ar', '123456'),
(5, 'Facundo', 'Romero', 'Facundoromero@gmail.com', '1111'),
(6, 'Ramiro ', 'Unrein', 'ramirounrein1@gmail.com', '1111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomendacion`
--

CREATE TABLE `recomendacion` (
  `id_recomendacion` bigint(20) UNSIGNED NOT NULL,
  `id_libro` bigint(20) UNSIGNED NOT NULL,
  `id_profesor` bigint(20) UNSIGNED NOT NULL,
  `curso` varchar(100) DEFAULT NULL,
  `motivo` text DEFAULT NULL,
  `fecha_recomendacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recomendacion`
--

INSERT INTO `recomendacion` (`id_recomendacion`, `id_libro`, `id_profesor`, `curso`, `motivo`, `fecha_recomendacion`) VALUES
(9, 1, 6, '3ro', '', '2026-07-05'),
(10, 9, 6, '4to', '', '2026-07-05'),
(11, 7, 5, '1ro', '', '2026-07-05'),
(12, 7, 3, '1ro', '', '2026-07-05'),
(16, 7, 1, '1ro', NULL, '2026-07-05'),
(17, 7, 2, '1ro', NULL, '2026-07-05'),
(18, 7, 4, '1ro', NULL, '2026-07-05'),
(19, 10, 6, '1ro', NULL, '2026-07-05'),
(20, 1, 5, '1ro', NULL, '2026-07-05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`),
  ADD UNIQUE KEY `administrador_email_unique` (`email`);

--
-- Indices de la tabla `clasificar`
--
ALTER TABLE `clasificar`
  ADD PRIMARY KEY (`id_clasificar`),
  ADD KEY `clasificar_id_genero_foreign` (`id_genero`),
  ADD KEY `clasificar_id_libro_foreign` (`id_libro`),
  ADD KEY `clasificar_id_genero_index` (`id_genero`),
  ADD KEY `clasificar_id_libro_index` (`id_libro`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD PRIMARY KEY (`id_ejemplar`),
  ADD KEY `ejemplar_id_libro_foreign` (`id_libro`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id_libro`);

--
-- Indices de la tabla `lista_espera`
--
ALTER TABLE `lista_espera`
  ADD PRIMARY KEY (`id_lista`),
  ADD KEY `lista_espera_id_libro_foreign` (`id_libro`),
  ADD KEY `lista_espera_id_estudiante_foreign` (`id_estudiante`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `prestamo_id_estudiante_foreign` (`Id_estudiante`),
  ADD KEY `prestamo_id_ejemplar_foreign` (`Id_ejemplar`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id_profesor`);

--
-- Indices de la tabla `recomendacion`
--
ALTER TABLE `recomendacion`
  ADD PRIMARY KEY (`id_recomendacion`),
  ADD UNIQUE KEY `recomendacion_libro_curso_profesor_unique` (`id_libro`,`curso`,`id_profesor`),
  ADD KEY `recomendacion_id_libro_foreign` (`id_libro`),
  ADD KEY `recomendacion_id_profesor_foreign` (`id_profesor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_administrador` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clasificar`
--
ALTER TABLE `clasificar`
  MODIFY `id_clasificar` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  MODIFY `id_ejemplar` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_estudiante` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id_libro` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `lista_espera`
--
ALTER TABLE `lista_espera`
  MODIFY `id_lista` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id_prestamo` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `id_profesor` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `recomendacion`
--
ALTER TABLE `recomendacion`
  MODIFY `id_recomendacion` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clasificar`
--
ALTER TABLE `clasificar`
  ADD CONSTRAINT `clasificar_id_genero_foreign` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`),
  ADD CONSTRAINT `clasificar_id_libro_foreign` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`);

--
-- Filtros para la tabla `ejemplar`
--
ALTER TABLE `ejemplar`
  ADD CONSTRAINT `ejemplar_id_libro_foreign` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
