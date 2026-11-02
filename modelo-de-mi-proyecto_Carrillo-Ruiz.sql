-- ============================================================================
-- "EL MODELO DE DATOS DE MI PROYECTO"
-- Clase 14 · Viernes 30-10-2026 · 35 minutos
-- ----------------------------------------------------------------------------
-- ESTE ARCHIVO ES EL ARRANQUE DEL AVANCE 1 del proyecto integrador.
-- Lo que dejes hecho hoy es trabajo adelantado.
--
-- CÓMO EJECUTARLO
--   Primero corre 14-crear-mi-base.sql, que crea la base de TU grupo.
--   Después pega esto en MySQL Workbench o DBeaver, o desde la terminal:
--   mysql -u root -p proyecto_gN < este-archivo.sql
--
-- Y GUARDA ESTE ARCHIVO EN TU DRIVE O TU CORREO al terminar la clase.
-- Los equipos de la sala se restauran: el archivo .sql es la verdad, la base
-- de datos es desechable. Si pierdes el archivo, perdiste el trabajo.
--
-- ATAJO QUE SÍ PUEDES USAR
--   El módulo 23 de la página "Mi Proyecto en JavaScript" imprime el
--   CREATE TABLE y los INSERT de TU proyecto, con tus campos. Dale a
--   Ejecutar, copia la salida, y pégala aquí. Después revísala línea por
--   línea: la vas a tener que defender el 27 de noviembre.
--
-- GRUPO: Renta de inmuebles
-- INTEGRANTES: Mateo Carrillo - Leonardo Ruiz
-- ENTIDAD PRINCIPAL: inmueble
-- ============================================================================

-- Cambia el gN por el nombre de TU grupo:
USE proyecto_renta_inmueble;


-- ---------------------------------------------------------------------------
-- PASO 1 (10 min) — LA TABLA PRINCIPAL
-- Es tu clase del Taller 3, campo por campo. Para cada uno hay que ELEGIR
-- el tipo, y escribir al lado POR QUÉ ese y no otro.
--
--   Plata            -> DECIMAL(10,2)   nunca FLOAT
--   Cantidades       -> INT
--   Textos cortos    -> VARCHAR(n)      el n sale de mirar tus datos
--   Lista cerrada    -> ENUM('a','b')   estados, tipos, categorías fijas
--   Sí/no            -> BOOLEAN
--   Fechas           -> DATE o DATETIME
--
-- Y toda tabla lleva llave primaria. Si tu clase no tenía id, aquí se agrega.
-- ---------------------------------------------------------------------------

-- DROP TABLE IF EXISTS inmueble;

-- CREATE TABLE inmueble (
--   id         INT AUTO_INCREMENT PRIMARY KEY,
-- PORQUE ES UN NUMERO ENTERO EL QUE SE VA A GUARDAR.

--   titulo             varchar(100),
-- PORQUE REQUIERE TEXTO PERO CORTO POR ESO SE PONE 100 PARA REGULAR Y --QUE LA BASE DE DATOS NO SE LLENE DE CARACTERES INNECESARIO


--   descripcion             text,
-- PORQUE REQUIERE TEXTO LARGO SIN NINGUNA ESPECIFICACON DE ᴛᴀᴍᴀñᴏ MAXIMO O ᴛᴀᴍᴀñᴏ MINIMO:


--   precio             decimal,        -- PORQUE SE REQUIERE GUARDAR DATOS SIN REDONDEOS O CON MUCHA PRECISION COMO EN ESTE CASO QUE ES UN PRECIO QUE PUEDE --
--CAUSAR ERRORES SI SE DEFINE DE OTRA MANERA:


--   area             decimal,
-- PORQUE PARA ESTE ATRIBUTO SE REQUIERE GUARDAR UNA CANTIDAD EXACTA COMO LAS DIMENSIONES DEL TERRENO:



-- habitaciones     int,    --PORQUE SE TRABAJA CON NUMEROS ENTEROS:


-- banos    int,    --PORQUE SE NECESITA TRABAJAR CON NUMEROS ENTEROS:


-- garajes          int,    --PORQUE SE NECESITA TRABAJAR CON NUMEROS ENTEROS:


-- fecha_publicacion        datetime, --PORQUE SE NECESITA GUARDAR TANTO LA FECHA Y LA HORA EN QUE SE REGISTRA UN INMUEBLE Y ESTE TIPO DE DATO ES EL APROPIADO:


-- fecha_actualizacion      datetime,
--PORQUE SI EN ALGUN MOMENTO SE HACE UNA ACTUALIZACION ESTE TIPO DE DATO GUARDA FECHA Y HORA, TENIENDO ASI UN REGISTRO DE LO QUE SE HACE:


-- estado       tinyint,
--PORQUE ES UN TIPO DE DATO QUE OCUPA POCO ESPACIO EN LA BASE DE DATOS, EN ESTE CASO ES BUENO UTILIZARLO PORQUE SE NECESITA PARA EL
--ESTADO, "1" SI ES ACTIVO Y "0" SI NO ES ACTIVO:


-- locacion_id          int,
--PORQUE SE GUARDA UN IDENTIFICADOR Y ESTE ES UN NUMERO ENTERO:


--tipo_inmueble_id          int,
--PORQUE SE PORQUE SE GUARDA UN IDENTIFICADOR Y ESTE ES UN NUMERO ENTERO:


--usuario_id        int,
--PORQUE ESTE GUARDA EL IDENTIFICADOR DEL TIPO --DE USUARIO Y ESTE ES UN NUMERO ENTERO


--FOREIGN KEY (tipo_inmueble_id) REFERENCES tipo_inmueble(id)

-- );


-- ---------------------------------------------------------------------------
-- PASO 2 (5 min) — LOS DATOS
-- Los mismos cinco registros del Taller 3. Que sean VARIADOS: tiene que
-- haber filas que cumplan tu regla de negocio y filas que no.
-- ---------------------------------------------------------------------------
/*
INSERT INTO inmueble
  (titulo, descripcion, precio, area, habitaciones, banos, garajes,
   fecha_publicacion, fecha_actualizacion, estado, locacion_id, tipo_inmueble_id, usuario_id)
VALUES
  ('Apartamento amplio en el centro',
   'Apartamento de dos habitaciones con cocina integrada, balcón y excelente iluminación natural. Cerca de comercios y transporte público.',
   1200000.00, 75.50, 2, 1, 1,
   '2026-10-01 09:15:00', '2026-10-05 14:30:00', 1, 1, 1, 1),

  ('Casa familiar con patio',
   'Casa de tres habitaciones con patio trasero, sala comedor y zona de lavandería. Ideal para familias.',
   2500000.00, 140.00, 3, 2, 1,
   '2026-10-03 11:00:00', '2026-10-03 11:00:00', 1, 1, 2, 1),

  ('Apartaestudio moderno',
   'Apartaestudio completamente amueblado, con baño privado y cocina. Perfecto para estudiantes o profesionales.',
   750000.00, 35.00, 1, 1, 0,
   '2026-10-08 16:45:00', '2026-10-20 10:20:00', 1, 1, 3, 2),

  ('Local comercial esquinero',
   'Local comercial en esquina con alto flujo peatonal, baño y bodega. Disponible de inmediato.',
   1800000.00, 60.25, 0, 1, 0,
   '2026-10-12 08:30:00', '2026-10-15 17:10:00', 0, 1, 4, 2),

  ('Casa campestre con garaje doble',
   'Casa campestre de cuatro habitaciones, amplio jardín, zona BBQ y garaje para dos vehículos.',
   3800000.00, 220.80, 4, 3, 2,
   '2026-10-25 13:00:00', '2026-11-01 09:00:00', 1, 1, 2, 3);
   */



-- ---------------------------------------------------------------------------
-- PASO 3 (10 min) — LA SEGUNDA TABLA Y LA LLAVE FORÁNEA
--
-- Di la relación en voz alta antes de escribirla:
--     "un tipo de inmueble tiene muchos inmuebles"
--
-- La llave foránea va SIEMPRE en el lado MUCHOS. Si al decirlo en voz alta
-- suena raro, la estabas poniendo al revés.
--
-- El módulo 23 de la página ya te propone cuál es la segunda tabla de TU
-- proyecto y por qué. Puedes usar esa o justificar otra.
-- ---------------------------------------------------------------------------

-- CREATE TABLE tipo_inmueble (
--   id   INT AUTO_INCREMENT PRIMARY KEY,
--   nombre VARCHAR(50),
--   descripcion VARCHAR(255)
--
-- );

/*En nuestro modelo de base de datos se utilizo la tabla tipo inmueble con el fin de normalizar la base de datos y que no hubiera errores ortograficos al momento en que el usuario ingresara el "tipo de inmueble". Esto permite hacer un desplegable en HTML donde el usuario solo elija el tipo de vivienda que va a publicar */

/*La FOREIGN KEY esta en la tabla inmueble dado que este es el lado MUCHOS*/

-- ---------------------------------------------------------------------------
-- PASO 4 (10 min) — LAS CUATRO CONSULTAS
-- Son las mismas cuatro del Taller 3, ahora en SQL.
-- ---------------------------------------------------------------------------

-- 1. LISTAR (el forEach)
-- SELECT * FROM inmueble;

-- 2. BUSCAR UNO POR SU ID (el find)
-- SELECT * FROM inmueble WHERE id = 1;

-- 3. TU REGLA DE NEGOCIO (el filter)
--    El && del Taller 2 se escribe AND.
--    REVISA EL RESULTADO: no puede devolver 0 filas ni las 5.
-- SELECT *  FROM inmueble WHERE precio <= 1500000 AND estado = 1;

-- 4. LA COLUMNA CALCULADA (el map)
--    Tu método que calcula NO es una columna: va aquí, en el SELECT.
-- SELECT precio, (precio*1.19) AS precio_IVA FROM inmueble;


-- ---------------------------------------------------------------------------
-- ANTES DE ENTREGAR
--   [ ] El archivo corre completo, sin errores.
--   [ ] Toda tabla tiene llave primaria.
--   [ ] La plata está en DECIMAL, no en FLOAT.
--   [ ] La llave foránea está del lado MUCHOS.
--   [ ] Cada tipo tiene su comentario de por qué.
--   [ ] La consulta 3 no devolvió ni 0 filas ni todas.
--   [ ] Los nombres de todos los integrantes están arriba, en este archivo.
--   [ ] GUARDÉ ESTE ARCHIVO fuera del computador de la sala.
-- ---------------------------------------------------------------------------
