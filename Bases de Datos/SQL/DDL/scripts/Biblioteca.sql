/*
Dadas las siguientes tablas:

Libros (código, autor, título, editor, clase, prestado)
Usuarios (secuencia, nombre, dirección, fecha_ingreso)
Clases (clave, tiempo_de_prestamo)
Préstamos (código, secuencia, fecha_inicio)

Con las siguientes claves foráneas:

Libros.clase -> Clases
Prestamos.codigo -> Libros
Prestamos.secuencia -> Usuarios

Y las siguientes restricciones:
Prestado debe tomar por defecto el valor 1.
fecha_ingreso es un campo obligatorio.

Se pide:

a) Crear las tablas y determinar los tipos de datos.
b) Realizar las siguientes modificaciones:

*/

CREATE DATABASE IF NOT EXISTS Biblioteca;
USE Biblioteca;

CREATE TABLE clases (
    clave CHAR(5) PRIMARY KEY,
    tiempo_de_prestamo INT UNSIGNED
);

CREATE TABLE libros(
    codigo VARCHAR(10) PRIMARY KEY,
    autor VARCHAR(50),
    titulo VARCHAR(50),
    editor VARCHAR(30),
    prestado UNSIGNED INT DEFAULT 1,
    clase CHAR(5),
    CONSTRAINT clase_libros_fk FOREIGN KEY (clase) REFERENCES clases (clave)
);

CREATE TABLE usuarios(
    secuencia VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(50),
    fecha_ingreso DATETIME NOT NULL
);

CREATE TABLE prestamos (
    codigo VARCHAR(10),
    secuencia VARCHAR(10),
    fecha_inicio DATETIME,
    CONSTRAINT prestamos_pk PRIMARY KEY (codigo, secuencia),
    CONSTRAINT codigo_prestamos_fk FOREIGN KEY (codigo) REFERENCES libros(codigo),
    CONSTRAINT secuencia_prestamos_fk FOREIGN KEY (secuencia) REFERENCES usuarios(secuencia)
);

ALTER TABLE usuarios ADD sexo char(1);

ALTER TABLE libros ADD indice int;

ALTER TABLE usuarios MODIFY nombre VARCHAR(50) NOT NULL;

ALTER TABLE clases RENAME clases_nueva.

ALTER TABLE prestamos ADD cuantía number(4,2) FIRST;

ALTER TABLE clases ADD planta TinyInt AFTER clave;

ALTER TABLE usuarios DROP PRIMARY KEY;
-- ALTER TABLE usuarios DROP CONSTRAINT usuarios_pk; ( No hacer de esta forma ).