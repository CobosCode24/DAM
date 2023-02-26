/*

Esquema lógico:
ALUMNOS (NIF, NOMBRE, APELLIDO1, APELLIDO2, DIRECCIÓN, SEXO, CURSO)
    PK: NIF
    FK: CURSO -> CURSOS
CURSOS (CODIGO, NOMBRE, TOTAL-PLAZAS, FECHA-INICIO, FECHA-FINAL, TOTAL-HORAS, PROFESOR)
    PK: CODIGO
    FK: PROFESOR -> PROFESORES.
PROFESORES (NIF, NOMBRE, APELLIDOO1, APELLIDO2, DIRECCIÓN, TITULACIÓN, SALARIO)
    PK: NIF

EJERCICIO 1:
> Vamos a crear las tablas del esquema anterior con sentencias de SQL (una única sentencia para cada tabla) de modo que se cumplan las siguientes restricciones:
> Debes elegir los tipos de datos adecuados en función del contenido de los campos.
> Los nombres de las tablas, campos y restricciones deben ser descriptivos.
> Establecer las claves primarias que se indican en el esquema lógico.
> Se deben cumplir la regla de integridad referencial (claves ajenas) del esquema lógico.
> El alumno o alumna no debe matricularse obligatoriamente en un curso. Un curso sí tiene obligatoriamente un profesor.
> El dominio del atributo sexo es el carácter M para mujer y H para hombre.
> Dos cursos no pueden llamarse igual.
> La fecha de comienzo del curso nunca puede ser mayor que la fecha de finalización.

EJERCICIO 2:
> Vamos a modificar las tablas creadas en el ejercicio anterior:
> Añade un nuevo atributo llamado EDAD de tipo numérico a la tabla ALUMNOS (las edades deben estar comprendidas entre 14 y 65 años).
> Modifica el campo Número de horas del CURSO de manera que sólo pueda haber cursos con 30, 40 ó 60 horas.
> Elimina la restricción que controla los valores que puede tomar el atributo Sexo.
> Elimina la columna DIRECCIÓN de la tabla PROFESORES.  
> Cambia el nombre de la tabla PROFESORES por TUTORES.
> Elimina la tabla ALUMNOS.
> Elimina la restricción de clave primaria de la tabla CURSOS.
> Haz que la clave primaria de CURSOS sea CÓDIGO + FECHA_INICIO.
> Cambia la clave primaria de la tabla TUTORES por Nombre y Apellidos.

*/

DROP DATABASE IF EXISTS Academia_informatica;
CREATE DATABASE Academia_informatica CHARSET utf8mb4;
USE Academia_informatica;

CREATE TABLE PROFESORES(
    NIF	NCHAR(9) NOT NULL CONSTRAINT profesores_pk  PRIMARY KEY,
    nombre	VARCHAR(15) NOT NULL,
    apellido1	VARCHAR(15) NOT NULL,
    apellido2 	VARCHAR(15),
    dirección	VARCHAR(20),
    titulación	VARCHAR(20),
    salario		NUMBER(8, 2)
);

CREATE TABLE CURSOS(
    código		VARCHAR(15) NOT NULL CONSTRAINT cursos_PK PRIMARY KEY,
    nombre	VARCHAR(20) UNIQUE,
    total_plazas	NUMBER(3),
    fecha_inicio	DATE,
    CONSTRAINT fecha_CK CHECK(fecha_inicio < fecha_fin),
    duración	NUMBER(3),
    profesor	NCHAR(9) NOT NULL,
    CONSTRAINT	 profesor_FK	FOREIGN KEY(Profesor) REFERENCES Profesores(NIF)
);

CREATE TABLE ALUMNOS(
    NIF	NCHAR(9) NOT NULL,
    nombre	VARCHAR(15) NOT NULL,
    apellido1	VARCHAR(15) NOT NULL,
    apellido2 	VARCHAR(15),
    dirección	VARCHAR(20),
    sexo		CHAR(1) CONSTRAINT sexo_CK CHECK(sexo=’M’ OR sexo=’H’),
    curso		VARCHAR(15),
    CONSTRAINT curso_FK FOREIGN KEY(CURSOS) REFERENCES CURSOS(código),
    CONSTRAINT alumnos_PK PRIMARY KEY(NIF)
);

ALTER TABLE ALUMNOS ADD edad NUMBER(2) CONSTRAINT edad_CK CHECK(14 <=edad AND edad<=65);

ALTER TABLE CURSOS ADD CONSTRAINT num_horas_CK CHECK(duración IN (30,40,60));

ALTER TABLE ALUMNOS DROP CONSTRAINT sexo_CK;

ALTER TABLE PROFESORES DROP COLUMN dirección;

RENAME TABLE PROFESORES TO TUTORES;

DROP TABLE ALUMNOS;

ALTER TABLE CURSOS DROP PRIMARY KEY CASCADE;

ALTER TABLE CURSOS ADD CONSTRAINT cursos_PK PRIMARY KEY (codigo, fecha_inicio);

ALTER TABLE Cursos DROP CONSTRAINT Profesor_fk;
ALTER TABLE TUTORES DROP CONSTRAINT profesores_pk CASCADE;
ALTER TABLE TUTORES ADD CONSTRAINT tutores_pk PRIMARY KEY(nombre, apellido1);
ALTER TABLE Cursos ADD COLUMN Nombre_tutores VARCHAR(50) NOT NULL;
ALTER TABLE Cursos ADD COLUMN Apellido1_tutores VARCHAR(50) NOT NULL;
ALTER TABLE Cursos ADD CONSTRAINT cursos_tutores_fk FOREIGN KEY (nombre_tutores, apellido1_tutores) REFERENCES TUTORES (nombre, apellido1)