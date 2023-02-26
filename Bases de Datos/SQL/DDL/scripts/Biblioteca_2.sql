/*
Considerar el siguiente modelo de datos que corresponde a los préstamos de libros
de una biblioteca:

         (1,N)      (N:M)      (1,M)
LIBRO ----------- PRESTAMO ----------- SOCIO

Pasa este modelo a tablas sabiendo lo siguiente:

    > Los atributos de libros son: ISBN, Título, Editorial y Número de páginas.
    > Los atributos de Préstamos son fecha de préstamo, fecha de devolución, devuelto (que tendrá los valores S ó N), ISBN y DNI.
    > Los atributos de Socios serán DNI, nombre, fecha de nacimiento y provincia.
    > La provincia por defecto del socio será Almería, Córdoba, Málaga o Granada.
    > El socio debe de ser mayor de edad. Tomaremos para eso fechas de nacimiento anteriores al 11/10/2012.

Se pide:
    > Generar la definición de tablas.
*/

CREATE DATABASE IF NOT EXISTS Biblioteca_2;
USE Biblioteca_2;

CREATE TABLE LIBROS(
    ISBN number( 13 ) PRIMARY KEY,
    Titulo varchar( 70 ),
    Editorial varchar( 40 ),
    NumPaginas number( 4 )
);

CREATE TABLE SOCIOS(
    DNI char( 9 ) PRIMARY KEY,
    Nombre varchar( 70 ) NOT NULL,
    Provincia varchar(20) NOT NULL,
    Fecha_nac DATE NOT NULL,
    CONSTRAINT Provincia_socios_ck CHECK (Provincia IN (‘Almería’, ‘Córdoba’, ‘Málaga’, ‘Granada’),
    CONSTRAINT Fecha_nac_socios_ck CHECK (Fecha_nac < ’11/10/2012’)
);

CREATE TABLE PRESTAMOS(
    ISBN number( 13 ),
    DNI varchar( 11 ),
    Fecha_Prestamo DATE,
    Fecha_Devolucion DATE,
    Devuelto varchar( 1 ),
    CONSTRAINT Devuelto_ck CHECK ( Devuelto IN ( ‘S’, ‘N’ ) ),
    CONSTRAINT prestamos_pk PRIMARY KEY (ISBN, DNI, Fecha_Prestamo ),
    CONSTRAINT ISBN_prestamos_fk FOREIGN KEY (ISBN) REFERENCES LIBROS ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT DNI_prestamos_fk FOREIGN KEY (DNI) REFERENCES SOCIOS ON DELETE CASCADE ON UPDATE CASCADE
);
