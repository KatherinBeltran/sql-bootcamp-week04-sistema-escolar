--  Universidad TechMaster — Queries Expert (negocio real)
--  Queries 12 a 15
--  Week 4 SQL Bootcamp
--  Nombre: Katherin Beltran
--  Fecha: [22/06/2026]

USE universidad_techmaster;

-- Query 12: Top 3 cursos con más estudiantes inscritos

SELECT
    c.codigo,
    c.nombre                    AS curso,
    COUNT(i.estudiante_id)      AS total_inscritos
FROM cursos c
INNER JOIN inscripciones i ON c.id = i.curso_id
WHERE i.estado <> 'retirado'
GROUP BY c.id, c.codigo, c.nombre
ORDER BY total_inscritos DESC
LIMIT 3;

-- Query 13: Estudiantes inscritos en cursos de 2+ departamentos

SELECT
    e.nombre                            AS estudiante,
    COUNT(DISTINCT c.departamento_id)   AS num_departamentos
FROM estudiantes e
INNER JOIN inscripciones i ON e.id       = i.estudiante_id
INNER JOIN cursos c        ON i.curso_id = c.id
GROUP BY e.id, e.nombre
HAVING COUNT(DISTINCT c.departamento_id) >= 2
ORDER BY num_departamentos DESC;

-- Query 14: Profesores que NO tienen cursos asignados este semestre

SELECT
    p.nombre,
    d.nombre AS departamento
FROM profesores p
LEFT JOIN  cursos c      ON p.id            = c.profesor_id
INNER JOIN departamentos d ON p.departamento_id = d.id
WHERE c.id IS NULL
ORDER BY d.nombre, p.nombre;

-- Query 15: Reporte completo por departamento

SELECT
    d.nombre                        AS departamento,
    COUNT(DISTINCT p.id)            AS num_profesores,
    COUNT(DISTINCT c.id)            AS num_cursos,
    COUNT(DISTINCT i.estudiante_id) AS estudiantes_unicos
FROM departamentos d
LEFT JOIN profesores    p ON d.id = p.departamento_id
LEFT JOIN cursos        c ON d.id = c.departamento_id
LEFT JOIN inscripciones i ON c.id = i.curso_id
GROUP BY d.id, d.nombre
ORDER BY num_profesores DESC;