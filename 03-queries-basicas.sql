--  Universidad TechMaster — Queries Básicas (INNER JOIN)
--  Queries 1 a 3
--  Week 4 SQL Bootcamp
--  Nombre: Katherin Beltran
--  Fecha: [22/06/2026]

USE universidad_techmaster;

-- Query 1: Todos los profesores con el nombre de su departamento

SELECT
    p.nombre AS profesor,
    d.nombre AS departamento
FROM profesores p
INNER JOIN departamentos d ON p.departamento_id = d.id
ORDER BY d.nombre, p.nombre;

-- Query 2: Cursos con el profesor que los imparte y su departamento

SELECT
    c.codigo,
    c.nombre         AS curso,
    p.nombre         AS profesor,
    d.nombre         AS departamento
FROM cursos c
INNER JOIN profesores p    ON c.profesor_id     = p.id
INNER JOIN departamentos d ON c.departamento_id = d.id
ORDER BY d.nombre, c.codigo;

-- Query 3: Estudiantes inscritos en Cálculo Diferencial (MATH101)

SELECT
    e.nombre       AS estudiante,
    i.calificacion,
    i.estado
FROM estudiantes e
INNER JOIN inscripciones i ON e.id        = i.estudiante_id
INNER JOIN cursos c        ON i.curso_id  = c.id
WHERE c.codigo = 'MATH101'
  AND i.calificacion IS NOT NULL
ORDER BY i.calificacion DESC;