/*
Dada las siguientes tablas:
a) Definir su diseño físico implementando las tablas necesarias:
    COCHES:
        matrícula (matrícula del coche, 8 caracteres y llave primaria)
        marca (15 caracteres)
        anio_fab (año de fabricación, número de 2 dígitos)
    MECÁNICOS:
        dni (9 caracteres, llave primaria)
        nombre (15 caracteres)
        puesto (15 caracteres)
        parcial (1 caracter)
    TRABAJOS:
        matrícula at (la matrícula del coche, llave externa respecto de COCHES)
        dni (el dni del mecánico)
        horas (número de 3 cifras con 1 decimal, debe ser mayor de 0.5)
        fecha_rep (tipo fecha)
b) Modificar las tablas para que:
    > Añadir a la tabla COCHES el atributo modelo (15 caracteres)
    > Ampliar a 4 la longitud del atributo anio_fab de la tabla COCHES.
    > Añadir una restricción para que el nombre de las marcas de coche no sea superior a 50.
    > Eliminar la columna fecha_rep de la tabla TRABAJO.

*/

CREATE DATABASE IF NOT EXISTS Taller
USE Taller;

CREATE TABLE coches (
    matrícula VARCHAR(8) PRIMARY KEY,
    marca VARCHAR(15),
    anio_fab NUMBER(2)
);

CREATE TABLE mecánicos (
    dni CHAR(9) PRIMARY KEY,
    nombre VARCHAR(15),
    puesto VARCHAR(15),
    parcial VARCHAR(1)
);

CREATE TABLE trabajos (
    matrícula VARCHAR(8),
    dni CHAR(9),
    horas NUMBER(3,1),
    fecha_rep DATE,
    CONSTRAINT trabajos_pk PRIMARY KEY (matrícula,dni),
    CONSTRAINT matricula_trabajos_fk FOREIGN KEY (matrícula) REFERENCES coches(matrícula),
    CONSTRAINT dni_trabajos_fk FOREIGN KEY (dni) REFERENCES mecánicos(dni),
    CONSTRAINT horas_trabajo_ck CHECK (horas>0.5)
);

ALTER TABLE coches ADD modelo VARCHAR(15);

ALTER TABLE coches MODIFY anio_fab NUMBER(4);

ALTER TABLE coches MODIFY marca VARCHAR(50);
ALTER TABLE coches ADD CONSTRAINT marca_coches_ck CHECK (marca <= 50);

ALTER TABLE trabajos DROP COLUMN fecha_rep;