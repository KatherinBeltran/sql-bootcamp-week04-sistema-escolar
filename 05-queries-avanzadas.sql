--  Universidad TechMaster — Queries Avanzadas (SELF JOIN)
--  Queries 8 a 11
--  Week 4 SQL Bootcamp
--  Nombre: Katherin Beltran
--  Fecha: [22/06/2026]

USE universidad_techmaster;

-- Query 8: Para cada profesor, mostrar el nombre de su jefe directo

SELECT
    p.nombre                      AS profesor,
    COALESCE(j.nombre, 'Sin jefe') AS jefe
FROM profesores p
LEFT JOIN profesores j ON p.jefe_id = j.id
ORDER BY p.nombre;

-- Query 9: Profesores que ganan MÁS que su propio jefe

SELECT
    p.nombre   AS profesor,
    p.salario  AS salario_profesor,
    j.nombre   AS jefe,
    j.salario  AS salario_jefe
FROM profesores p
INNER JOIN profesores j ON p.jefe_id = j.id
WHERE p.salario > j.salario;

-- Query 10: Pares únicos de profesores del mismo departamento

SELECT
    p1.nombre  AS profesor_a,
    p2.nombre  AS profesor_b,
    d.nombre   AS departamento
FROM profesores p1
INNER JOIN profesores p2
    ON  p1.departamento_id = p2.departamento_id
    AND p1.id < p2.id
INNER JOIN departamentos d ON p1.departamento_id = d.id
ORDER BY d.nombre, p1.nombre, p2.nombre;

-- Query 11: Estudiantes inscritos en cursos de Computación

SELECT
    e.nombre                               AS estudiante,
    c.nombre                               AS curso,
    COALESCE(p.nombre, '(sin asignar)')    AS profesor
FROM estudiantes e
INNER JOIN inscripciones i  ON e.id              = i.estudiante_id
INNER JOIN cursos c         ON i.curso_id         = c.id
INNER JOIN departamentos d  ON c.departamento_id  = d.id
LEFT  JOIN profesores p     ON c.profesor_id      = p.id
WHERE d.nombre = 'Computación'
ORDER BY e.nombre, c.codigo;