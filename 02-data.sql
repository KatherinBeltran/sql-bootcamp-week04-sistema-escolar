--  Universidad TechMaster — Datos iniciales
--  Week 4 SQL Bootcamp
--  Nombre: Katherin Beltran
--  Fecha: [22/06/2026]

USE universidad_techmaster;

-- Departamentos

INSERT INTO departamentos (nombre, presupuesto, fecha_fundacion) VALUES
    ('Computación',  5000000.00, '1998-08-15'),
    ('Matemáticas',  3500000.00, '1995-01-10'),
    ('Física',       4200000.00, '1995-01-10'),
    ('Humanidades',  2000000.00, '2005-03-22'),
    ('Biología',     3800000.00, '2000-09-01');

-- Profesores

INSERT INTO profesores (nombre, email, departamento_id, jefe_id, salario, fecha_contratacion) VALUES
    ('Dr. Roberto Méndez',   'rmendez@uni.edu',   1, NULL, 95000, '2010-08-01'),  -- Jefe Computación
    ('Dra. Sara López',      'slopez@uni.edu',    2, NULL, 92000, '2008-01-15'),  -- Jefa Matemáticas
    ('Dr. Miguel Vega',      'mvega@uni.edu',     1,    1, 78000, '2015-03-10'),
    ('Dra. Ana Torres',      'atorres@uni.edu',   1,    1, 76000, '2017-09-05'),
    ('Dr. Carlos Ruiz',      'cruiz@uni.edu',     2,    2, 72000, '2018-02-12'),
    ('Dra. Elena Martínez',  'emartinez@uni.edu', 3, NULL, 88000, '2012-08-20'),  -- Jefa Física
    ('Dr. Felipe Castro',    'fcastro@uni.edu',   3,    6, 70000, '2019-01-15'),
    ('Dra. Gabriela Pérez',  'gperez@uni.edu',    4, NULL, 75000, '2014-09-01'),  -- Jefa Humanidades
    ('Dr. Héctor Silva',     'hsilva@uni.edu',    5, NULL, 80000, '2013-08-15'),  -- Jefe Biología
    ('Dra. Isabel Ramos',    'iramos@uni.edu',    5,    9, 68000, '2020-03-01'),
    ('Dr. Jorge Núñez',      'jnunez@uni.edu',    4,    8, 65000, '2021-09-10');

-- Estudiantes

INSERT INTO estudiantes (nombre, email, fecha_nacimiento, fecha_ingreso, promedio_general, estado) VALUES
    ('Alicia García',     'agarcia@uni.edu',     '2002-05-15', '2020-08-20',  8.5,  'activo'),
    ('Brian Hernández',   'bhernandez@uni.edu',  '2001-11-22', '2020-08-20',  7.2,  'activo'),
    ('Camila Ruiz',       'cruiz.est@uni.edu',   '2003-03-10', '2021-08-20',  9.1,  'activo'),
    ('Daniel Torres',     'dtorres@uni.edu',     '2002-07-08', '2020-08-20',  8.8,  'activo'),
    ('Estefania López',   'elopez.est@uni.edu',  '2001-12-30', '2019-08-20',  9.5,  'graduado'),
    ('Federico Salinas',  'fsalinas@uni.edu',    '2003-04-25', '2021-08-20',  6.8,  'activo'),
    ('Gabriela Méndez',   'gmendez@uni.edu',     '2002-09-12', '2020-08-20',  8.2,  'activo'),
    ('Hugo Vega',         'hvega@uni.edu',       '2003-06-18', '2022-08-20',  7.9,  'activo'),
    ('Inés Castro',       'icastro@uni.edu',     '2001-10-05', '2019-08-20',  5.5,  'baja'),
    ('Javier Núñez',      'jnunez.est@uni.edu',  '2002-08-29', '2020-08-20',  8.0,  'activo'),
    ('Karla Romero',      'kromero@uni.edu',     '2003-01-17', '2022-08-20', NULL,  'activo'),  -- sin promedio
    ('Lucas Aguilar',     'laguilar@uni.edu',    '2004-02-22', '2023-08-20', NULL,  'activo');  -- nuevo, sin notas

-- Cursos

INSERT INTO cursos (codigo, nombre, creditos, profesor_id, departamento_id, cupo_maximo, semestre) VALUES
    ('COMP101', 'Introducción a la Programación', 4,    1, 1, 30, '2026-1'),
    ('COMP201', 'Estructuras de Datos',           4,    3, 1, 25, '2026-1'),
    ('COMP301', 'Bases de Datos',                 4,    4, 1, 25, '2026-1'),
    ('MATH101', 'Cálculo Diferencial',            5,    2, 2, 35, '2026-1'),
    ('MATH201', 'Álgebra Lineal',                 4,    5, 2, 30, '2026-1'),
    ('PHYS101', 'Física General',                 4,    6, 3, 30, '2026-1'),
    ('PHYS202', 'Mecánica Cuántica',              5,    7, 3, 20, '2026-1'),
    ('HUMA101', 'Filosofía Contemporánea',        3,    8, 4, 40, '2026-1'),
    ('HUMA201', 'Literatura Latinoamericana',     3,   11, 4, 40, '2026-1'),
    ('BIOL101', 'Biología Celular',               4,    9, 5, 28, '2026-1'),
    ('BIOL202', 'Genética Molecular',             5,   10, 5, 22, '2026-1'),
    ('COMP401', 'Sistemas Distribuidos',          4, NULL, 1, 20, '2026-1');  -- Sin profesor asignado

-- Inscripciones (N:M)

INSERT INTO inscripciones (estudiante_id, curso_id, calificacion, estado) VALUES
    -- Alicia
    (1, 1,  9.0, 'aprobado'),
    (1, 4,  8.5, 'aprobado'),
    (1, 6, NULL, 'cursando'),
    -- Brian
    (2, 1,  7.0, 'aprobado'),
    (2, 4,  6.5, 'reprobado'),
    (2, 8, NULL, 'cursando'),
    -- Camila
    (3, 1,  9.5, 'aprobado'),
    (3, 2,  9.0, 'aprobado'),
    (3, 3, NULL, 'cursando'),
    (3, 4,  9.8, 'aprobado'),
    -- Daniel
    (4, 1,  8.5, 'aprobado'),
    (4, 2,  9.0, 'aprobado'),
    (4, 3, NULL, 'cursando'),
    -- Estefania (ya graduada)
    (5, 1,  9.5,  'aprobado'),
    (5, 2,  9.8,  'aprobado'),
    (5, 3,  9.5,  'aprobado'),
    (5, 4, 10.0,  'aprobado'),
    -- Federico
    (6, 4,  5.5, 'reprobado'),
    (6, 8,  7.0, 'aprobado'),
    -- Gabriela
    (7, 6,  8.5, 'aprobado'),
    (7, 7, NULL, 'cursando'),
    -- Hugo
    (8, 1, NULL, 'cursando'),
    (8, 4, NULL, 'cursando'),
    -- Javier
    (10, 8,  7.5, 'aprobado'),
    (10, 9, NULL, 'cursando'),
    -- Karla (recién ingresada)
    (11, 1, NULL, 'cursando'),
    (11, 4, NULL, 'cursando');

-- Verificación del setup
SELECT 'departamentos' AS tabla, COUNT(*) AS filas FROM departamentos
UNION ALL SELECT 'profesores',   COUNT(*) FROM profesores
UNION ALL SELECT 'estudiantes',  COUNT(*) FROM estudiantes
UNION ALL SELECT 'cursos',       COUNT(*) FROM cursos
UNION ALL SELECT 'inscripciones',COUNT(*) FROM inscripciones;

-- Ejercicio adicional: verificar restricción de PRIMARY KEY

-- INSERT INTO inscripciones (estudiante_id, curso_id, calificacion, estado)
-- VALUES (2, 1, NULL, 'cursando');