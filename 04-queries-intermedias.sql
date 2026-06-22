--  Universidad TechMaster — Queries Intermedias (LEFT JOIN)
--  Queries 4 a 7
--  Week 4 SQL Bootcamp
--  Nombre: Katherin Beltran
--  Fecha: [22/06/2026]

USE universidad_techmaster;

-- Query 4: TODOS los cursos, incluyendo los sin profesor asignado

SELECT
    c.codigo,
    c.nombre,
    COALESCE(p.nombre, '(sin asignar)') AS profesor
FROM cursos c
LEFT JOIN profesores p ON c.profesor_id = p.id
ORDER BY c.codigo;

-- Query 5: TODOS los estudiantes con el número de cursos inscritos

SELECT
    e.nombre       AS estudiante,
    COUNT(i.curso_id) AS num_cursos
FROM estudiantes e
LEFT JOIN inscripciones i ON e.id = i.estudiante_id
GROUP BY e.id, e.nombre
ORDER BY num_cursos DESC, e.nombre;

-- Query 6: Por departamento — cuántos profesores y cuántos cursos

SELECT
    d.nombre               AS departamento,
    COUNT(DISTINCT p.id)   AS num_profesores,
    COUNT(DISTINCT c.id)   AS num_cursos
FROM departamentos d
LEFT JOIN profesores p ON d.id = p.departamento_id
LEFT JOIN cursos c     ON d.id = c.departamento_id
GROUP BY d.id, d.nombre
ORDER BY d.nombre;

-- Query 7: Qué cursos tiene cada estudiante

SELECT
    e.nombre       AS estudiante,
    c.codigo,
    c.nombre       AS curso,
    i.calificacion,
    i.estado
FROM estudiantes e
INNER JOIN inscripciones i ON e.id       = i.estudiante_id
INNER JOIN cursos c        ON i.curso_id = c.id
ORDER BY e.nombre, c.codigo;