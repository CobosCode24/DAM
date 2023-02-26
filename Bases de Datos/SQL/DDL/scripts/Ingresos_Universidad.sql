/*
Para que un alumno ingrese en la Universidad, debe realizar una preinscripción,
especificando a qué estudios desea acceder en orden de preferencia. Dicha información se guarda en una base de datos cuyo modelo de datos responde al siguiente diagrama:

          (1,N)         (N:M)         (1,M)
ALUMNO ------------ PREINSCRIPCIÓN ------------ ESTUDIO
                      |       |
                admitido    orden

Sabiendo que:
> El campo Opción de la tabla alumnos tomará los valores A,B, C o D.
> La nota de corte ha de ser mayor que 5.
> El atributo admitido tomará los valores S ó N.

Se pide:
> Generar la definición de tablas en SQL con todos los campos necesarios.
> Realizar las siguientes modificaciones:
    > Añadir una columna apellidos que pueda admitir valores nulos.
    > Cambiar el motor de almacenamiento de la tabla estudios a InnoDB.
    > Eliminar el campo nota de la tabla alumnos.
    > Añadir un índice denominado idxalumno para agilizar las búsquedas de los campos nombres y apellidos.
    > Añadir un índice único sobre la tabla preinscripciones.
    > Añadir un campo auto incremental inicializado a 10 en la tabla preinscripciones.
    > Cambiar el nombre de la columna COD por CODIGO de la tabla preinscripciones.
    > Cambiar el nombre de la columna NOTA por NOTAS de la tabla estudio y su tipo de datos a decimal.
*/

CREATE DATABASE IF NOT EXISTS Academia_Universidad;
USE Academia_Universidad;

CREATE TABLE ALUMNOS (
    DNI varchar( 9 ) PRIMARY KEY,
    NOM varchar( 40 ) NOT NULL,
    OPCION varchar( 3 ) NOT NULL,
    NOTA Number NOT NULL,
    CONSTRAINT OPCION_ALUMNOS_CK CHECK (OPCION IN (‘A’, ‘B’, ‘C’, ‘D’) )
);

CREATE TABLE ESTUDIOS (
    COD varchar( 4 ) PRIMARY KEY,
    NOM varchar( 20 ),
    NOTA number,
    CONSTRAINT NOTA_ESTUDIO_CK CHECK(NOTA>5)
);

CREATE TABLE PREINSCRIPCIONES (
    DNI varchar( 9 ),
    COD varchar( 4 ),
    ORDEN number( 2 ),
    ADMITIDO varchar( 1 ),
    CONSTRAINT PREINSCRIPCIONES_PK PRIMARY KEY (DNI, COD),
    CONSTRAINT ADM_PREINSCRIPCIONES_CK CHECK ( ADM IN ( ‘S’, ‘N’) ),
    CONSTRAINT DNI_preinscripciones_fk FOREIGN KEY (DNI) REFERENCES ALUMNOS ON DELETE CASCADE,
    CONSTRAINT COD_preinscripciones_fk FOREIGN KEY (COD) REFERENCES ESTUDIOS ON DELETE CASCADE
);


ALTER TABLE alumnos ADD apellidos varchar(50) NULL;

ALTER TABLE estudios ENGINE = InnoDB;

ALTER TABLE alumnos DROP COLUMN NOTA;

CREATE INDEX idxalumno ON alumnos (nombre, apellidos);

ALTER TABLE preinscripciones ADD UNIQUE INDEX uk_pre (dni,cod);

ALTER TABLE preinscripciones ID INT INSIGNED AUTO_INCREMENT = 10;

ALTER TABLE preinscripciones CHANGE COD CODIGO;

ALTER TABLE estudios CHANGE NOTA NOTAS decimal(5,2);
