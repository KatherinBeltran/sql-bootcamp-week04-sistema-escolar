# Sistema Escolar — SQL Joins Project

Proyecto de Week 4 del SQL Bootcamp: base de datos completa de una universidad ficticia con 15 queries que demuestran dominio de JOINs en MySQL.

## Schema

5 tablas relacionadas:
- `departamentos` (5 filas)
- `profesores` (11 filas, con jerarquía)
- `estudiantes` (12 filas)
- `cursos` (12 filas)
- `inscripciones` (~25 filas, relación N:M)

### Diagrama de relaciones

```
departamentos ◄──── profesores (jefe_id → self)
      │                  │
      └──── cursos ───────┘
                │
          inscripciones
                │
           estudiantes
```

## Setup

```Setup en windows con MySQL Workbench

-- Paso 1: Abrir el archivo 01-schema.sql
-- File > Open SQL Script
-- Ejecutar el script completo con el botón Execute (⚡)

-- Paso 2: Abrir el archivo 02-data.sql
-- Seleccionar el esquema universidad_techmaster
-- Ejecutar el script completo con el botón Execute (⚡)

-- Paso 3: Abrir el archivo 03-queries-basicas.sql
-- Seleccionar el esquema universidad_techmaster
-- Ejecutar el script completo con el botón Execute (⚡)
```

## Estructura de archivos

```
sistema-escolar/
├── README.md                  ← este archivo
├── 01-schema.sql              ← CREATE DATABASE + 5 tablas + constraints
├── 02-data.sql                ← INSERTs + verificación de conteos
├── 03-queries-basicas.sql     ← Queries 1–3  (INNER JOIN)
├── 04-queries-intermedias.sql ← Queries 4–7  (LEFT JOIN, múltiples JOINs)
├── 05-queries-avanzadas.sql   ← Queries 8–11 (SELF JOIN)
└── 06-queries-expert.sql      ← Queries 12–15 (reportes de negocio)
```

## Skills demostrados

- ✅ `INNER JOIN` — Queries 1, 2, 3
- ✅ `LEFT JOIN` con preservación de filas — Queries 4, 5
- ✅ Múltiples JOINs encadenados — Queries 6, 7, 11, 15
- ✅ `SELF JOIN` para jerarquías — Query 8
- ✅ `SELF JOIN` con condiciones complejas — Queries 9, 10
- ✅ `COUNT(DISTINCT)` con `LEFT JOIN` — Queries 5, 6, 13, 15
- ✅ Detección de registros huérfanos — Query 14
- ✅ `HAVING` para filtrar grupos — Query 13
- ✅ `COALESCE` para valores nulos — Queries 4, 8, 11
- ✅ `LIMIT` para top-N — Query 12

## Queries destacadas

**Query 12 — Top 3 cursos con más inscritos:**
```sql
SELECT
    c.codigo,
    c.nombre                AS curso,
    COUNT(i.estudiante_id)  AS total_inscritos
FROM cursos c
INNER JOIN inscripciones i ON c.id = i.curso_id
WHERE i.estado <> 'retirado'
GROUP BY c.id, c.codigo, c.nombre
ORDER BY total_inscritos DESC
LIMIT 3;
```

**Query 15 — Reporte completo por departamento:**
```sql
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
```

## Entorno

- MySQL 8.0+
- Compatible con MariaDB 10.6+
