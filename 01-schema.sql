--  Universidad TechMaster — Schema
--  Week 4 SQL Bootcamp
--  Nombre: Katherin Beltran
--  Fecha: [22/06/2026]

DROP DATABASE IF EXISTS universidad_techmaster;
CREATE DATABASE universidad_techmaster;
USE universidad_techmaster;

-- 1. Departamentos
CREATE TABLE departamentos (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100)    NOT NULL UNIQUE,
    presupuesto     DECIMAL(12, 2),
    fecha_fundacion DATE
);

-- 2. Profesores (con jefe — relación recursiva)
CREATE TABLE profesores (
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    nombre             VARCHAR(100)  NOT NULL,
    email              VARCHAR(150)  UNIQUE,
    departamento_id    INT,
    jefe_id            INT,
    salario            DECIMAL(10, 2),
    fecha_contratacion DATE,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id),
    FOREIGN KEY (jefe_id)         REFERENCES profesores(id)
);

-- 3. Estudiantes
CREATE TABLE estudiantes (
    id                INT AUTO_INCREMENT PRIMARY KEY,
    nombre            VARCHAR(100)  NOT NULL,
    email             VARCHAR(150)  UNIQUE,
    fecha_nacimiento  DATE,
    fecha_ingreso     DATE,
    promedio_general  DECIMAL(4, 2),
    estado            ENUM('activo', 'graduado', 'baja') DEFAULT 'activo'
);

-- 4. Cursos (impartido por un profesor, en un departamento)
CREATE TABLE cursos (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    codigo          VARCHAR(20)   NOT NULL UNIQUE,
    nombre          VARCHAR(100)  NOT NULL,
    creditos        INT           NOT NULL CHECK (creditos > 0),
    profesor_id     INT,
    departamento_id INT           NOT NULL,
    cupo_maximo     INT           DEFAULT 30,
    semestre        VARCHAR(10),
    FOREIGN KEY (profesor_id)     REFERENCES profesores(id),
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

-- 5. Inscripciones (relación N:M entre estudiantes y cursos)
CREATE TABLE inscripciones (
    estudiante_id    INT,
    curso_id         INT,
    fecha_inscripcion DATE DEFAULT (CURRENT_DATE),
    calificacion     DECIMAL(4, 2) CHECK (calificacion >= 0 AND calificacion <= 100),
    estado           ENUM('cursando', 'aprobado', 'reprobado', 'retirado') DEFAULT 'cursando',
    PRIMARY KEY (estudiante_id, curso_id),
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id)      REFERENCES cursos(id)      ON DELETE CASCADE
);