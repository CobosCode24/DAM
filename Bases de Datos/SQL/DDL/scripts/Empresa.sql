/*
Se desea tener una base de datos que almacene la información sobre los empleados de una empresa, los departamentos en los que trabajan y los estudios que disponen.
Guardaremos el historial laboral y salarial de todos los empleados. Para ello contamos con las siguientes tablas:

EMPLEADOS (
    DNI VARCHAR(9) PRIMARY KEY,
    NOMBRE varchar(30) NOT NULL,
    APELLIDO1 varchar(30) NOT NULL,
    APELLIDO2 varchar(15),
    DIRECC1 varchar(25) NOT NULL,
    DIRECC2 varchar(25),
    CIUDAD varchar(20) NOT NULL,
    PROVINCIA varchar(20) NOT NULL,
    COD_POSTAL varchar(5),
    SEXO varchar(1) NOT NULL,
    FECHA_NAC date NOT NULL
);

UNIVERSIDAD (
    UNIV_COD number(5) PRIMARY KEY,
    NOMBRE_UNI varchar(25) NOT NULL,
    CIUDAD varchar(20) NOT NULL,
    MUNICIPIO varchar(2) NOT NULL,
    COD_POSTAL varchar(5) NOT NULL
);

DEPARTAMENTOS (
    DPTO_COD number(5) PRIMARY KEY,
    NOMBRE_DPTO varchar(30) NOT NULL,
    DPTO_PADRE number(5) NOT NULL,
    PRESUPUESTO number NOT NULL,
    PRES_ACTUAL number,
    CONSTRAINT fk_dpto FOREIGN KEY (DPTO_PADRE)
    REFERENCES DEPARTAMENTOS (DPTO_COD )
);

ESTUDIOS(
    EMPLEADO_DNI VARCHAR(9),
    UNIVERSIDAD number(5),
    AÑO number NOT NULL,
    GRADO varchar(3) NOT NULL,
    ESPECIALIDAD varchar(20) NOT NULL,
    PRIMARY KEY (EMPLEADO_DNI,UNIVERSIDAD),
    CONSTRAINT fk_estudios_DNI FOREIGN KEY (EMPLEADO_DNI)
    REFERENCES EMPLEADOS (DNI),
    CONSTRAINT fk_estudios_UNIV_COD FOREIGN KEY (UNIVERSIDAD)
    REFERENCES UNIVERSIDADES (UNIV_COD)
);

TRABAJOS(
    TRABAJO_COD number(5) PRIMARY KEY,
    NOMBRE_TRAB varchar(20) NOT NULL,
    SALARIO_MIN number(2) NOT NULL,
    SALARIO_MAX number(2) NOT NULL
);

HISTORIAL_LABORAL(
    EMPLEADO_DNI VARCHAR(9),
    TRABAJO_COD number(5) NOT NULL,
    FECHA_INICIO date NOT NULL,
    FECHA_FIN date,
    DPTO_COD number(5) NOT NULL,
    SUPERVISOR_DNI VARCHAR(9) ,
    PRIMARY KEY (EMPLEADO_DNI,TRABAJO_COD,FECHA_INICIO),
    CONSTRAINT fk_hist_lab_DNI FOREIGN KEY (EMPLEADO_DNI)
    REFERENCES EMPLEADOS (DNI),
    CONSTRAINT fk_hist_lab_Trabajo_COD FOREIGN KEY (TRABAJO_COD)
    REFERENCES TRABAJOS (TRABAJO_COD)
    CONSTRAINT fk_hist_lab_DNI_SUPERVISOR FOREIGN KEY (SUPERVISOR_DNI) REFERENCES EMPLEADOS (DNI),
    CONSTRAINT fk_hist_lab_DPTO_COD FOREIGN KEY (DPTO_COD)
    REFERENCES DEPARTAMENTOS (DPTO_COD)
);

HISTORIAL_SALARIAL(
    EMPLEADO_DNI VARCHAR(9),
    SALARIO number NOT NULL,
    FECHA COMIENZO date NOT NULL,
    FECHA_FIN date,
    PRIMARY KEY (EMPLEADO_DNI,SALARIO,FECHA_COMIENZO),
    CONSTRAINT fk_hist_Sal_DNI FOREIGN KEY (EMPLEADO_DNI)
    REFERENCES EMPLEADOS (DNI)
);

Controlar las siguientes restricciones:
1. Los siguientes atributos son obligatorios:
    >NOMBRE (en todas las tablas),
    > APELLIDO1 en EMPLEADOS,
    > PRESUPUESTO en DEPARTAMENTOS,
    > SALARIO en HISTORIAL_SALARIAL y
    > SALARIO_MIN y SALARIO_MAX en TRABAJOS.
*/

DROP DATABASE IF EXISTS Empresa;
CREATE DATABASE Empresa;
USE Empresa;

CREATE TABLE EMPLEADOS (
    DNI VARCHAR(9) PRIMARY KEY,
    NOMBRE varchar(30) NOT NULL,
    APELLIDO1 varchar(30) NOT NULL,
    APELLIDO2 varchar(15),
    DIRECC1 varchar(25) NOT NULL,
    DIRECC2 varchar(25),
    CIUDAD varchar(20) NOT NULL,
    PROVINCIA varchar(20) NOT NULL,
    COD_POSTAL varchar(5),
    SEXO varchar(1) NOT NULL,
    FECHA_NAC date NOT NULL
);

CREATE TABLE UNIVERSIDAD (
    UNIV_COD number(5) PRIMARY KEY,
    NOMBRE_UNI varchar(25) NOT NULL,
    CIUDAD varchar(20) NOT NULL,
    MUNICIPIO varchar(2) NOT NULL,
    COD_POSTAL varchar(5) NOT NULL
);

CREATE TABLE DEPARTAMENTOS (
    DPTO_COD number(5) PRIMARY KEY,
    NOMBRE_DPTO varchar(30) NOT NULL,
    DPTO_PADRE number(5) NOT NULL,
    PRESUPUESTO number NOT NULL,
    PRES_ACTUAL number,
    CONSTRAINT fk_dpto FOREIGN KEY (DPTO_PADRE)
    REFERENCES DEPARTAMENTOS (DPTO_COD )
);

CREATE TABLE ESTUDIOS(
    EMPLEADO_DNI VARCHAR(9),
    UNIVERSIDAD number(5),
    AÑO number NOT NULL,
    GRADO varchar(3) NOT NULL,
    ESPECIALIDAD varchar(20) NOT NULL,
    PRIMARY KEY (EMPLEADO_DNI,UNIVERSIDAD),
    CONSTRAINT fk_estudios_DNI FOREIGN KEY (EMPLEADO_DNI)
    REFERENCES EMPLEADOS (DNI),
    CONSTRAINT fk_estudios_UNIV_COD FOREIGN KEY (UNIVERSIDAD)
    REFERENCES UNIVERSIDADES (UNIV_COD)
);

CREATE TABLE TRABAJOS(
    TRABAJO_COD number(5) PRIMARY KEY,
    NOMBRE_TRAB varchar(20) NOT NULL,
    SALARIO_MIN number(2) NOT NULL,
    SALARIO_MAX number(2) NOT NULL
);

CREATE TABLE HISTORIAL_LABORAL(
    EMPLEADO_DNI VARCHAR(9),
    TRABAJO_COD number(5) NOT NULL,
    FECHA_INICIO date NOT NULL,
    FECHA_FIN date,
    DPTO_COD number(5) NOT NULL,
    SUPERVISOR_DNI VARCHAR(9) ,
    PRIMARY KEY (EMPLEADO_DNI,TRABAJO_COD,FECHA_INICIO),
    CONSTRAINT fk_hist_lab_DNI FOREIGN KEY (EMPLEADO_DNI)
    REFERENCES EMPLEADOS (DNI),
    CONSTRAINT fk_hist_lab_Trabajo_COD FOREIGN KEY (TRABAJO_COD)
    REFERENCES TRABAJOS (TRABAJO_COD)
    CONSTRAINT fk_hist_lab_DNI_SUPERVISOR FOREIGN KEY (SUPERVISOR_DNI) REFERENCES EMPLEADOS (DNI),
    CONSTRAINT fk_hist_lab_DPTO_COD FOREIGN KEY (DPTO_COD)
    REFERENCES DEPARTAMENTOS (DPTO_COD)
);

CREATE TABLE HISTORIAL_SALARIAL(
    EMPLEADO_DNI VARCHAR(9),
    SALARIO number NOT NULL,
    FECHA COMIENZO date NOT NULL,
    FECHA_FIN date,
    PRIMARY KEY (EMPLEADO_DNI,SALARIO,FECHA_COMIENZO),
    CONSTRAINT fk_hist_Sal_DNI FOREIGN KEY (EMPLEADO_DNI)
    REFERENCES EMPLEADOS (DNI)
);


-- 2. El atributo SEXO en EMPLEADOS sólo puede tomar los valores H para hombre y M para mujer.
ALTER TABLE empleados ADD CONSTRAINT ck_sexo
CHECK (sexo = ‘H’ OR sexo = ‘M’);

-- 3. Dos DEPARTAMENTOS no se llaman igual. Dos TRABAJOS tampoco.
ALTER TABLE Departamentos ADD CONSTRAINT uq_nombre_dpto
UNIQUE (NOMBRE_DPTO ) ;
ALTER TABLE Trabajos ADD CONSTRAINT uq_nombre_trab
UNIQUE (NOMBRE_TRAB ) ;

-- 4. Cada empleado tiene un solo salario en cada momento. También, cada empleado tendrá asignado un solo trabajo en cada momento.
-- Si no lo teníais ya establecido sería:
ALTER TABLE historial_salarial ADD CONSTRAINT pk_historial_salarial
PRIMARY KEY (empleado_dni, salario, fecha_comienzo) ;
-- Si no lo teníais ya establecido sería:
ALTER TABLE historial_ laboral ADD CONSTRAINT pk_historial_ laboral
PRIMARY KEY (empleado_dni, trabajo_cod, fecha_inicio) ;

-- 5. Añada un nuevo atributo VALORACIÓN en la tabla de EMPLEADOS que indique  de 1 a 10 la valoración que obtuvo el empleado en su entrevista de trabajo al iniciar su andadura en la empresa. Ponga el valor por defecto 5 para ese campo.
ALTER TABLE empleados ADD valoracion NUMBER DEFAULT 5 ;
ALTER TABLE empleados ADD CONSTRAINT ck_valoracion
CHECK (valoración BETWEEN 1 AND 10) ;

-- 6. Elimine la restricción de que el atributo NOMBRE de la tabla EMPLEADOS no puede ser nulo.
ALTER TABLE Empleados MODIFY nombre VARCHAR(30) NULL ;

-- 7. Modificar el tipo de datos de DIREC1 de la tabla EMPLEADOS a cadena de caracteres de 40 como máximo.
ALTER TABLE empleados MODIFY direcc1 VARCHAR(40) NOT NULL;

-- 8. ¿Podría modificar el tipo de datos del atributo FECHA_NAC de la tabla EMPLEADOS y convertirla a tipo cadena?
-- Se pueden realizar cambios en los tipos de datos siempre que el contenido de los campos que se pretenden modificar cumplan o sean compatibles con los nuevos tipos de datos. Siempre es mejor utilizar VARCHAR en lugar de CHAR.
ALTER TABLE EMPLEADOS MODIFY FECHA_NAC VARCHAR(8) NOT NULL;

/*9. Cambiar la clave primaria de EMPLEADOS al NOMBRE y los dos APELLIDOS.
Si alguna tabla tuviera una clave ajena apuntando a la clave primaria de empleados, no sería posible crear la nueva clave primaria sin antes haber eliminado dichas claves ajenas. Además, el campo DNI debería ser NOT NULL EN TODO CASO.
Por tanto, en este caso deberíamos seguir siempre estos pasos:*/
-- 1.- Quitar todas las FK que existan en la base de datos con respecto al campo correspondiente que es ahora la PK, es decir, el DNI de la tabla EMPLEADOS.
-- En la tabla Estudios
ALTER TABLE ESTUDIOS DROP CONSTRAINT fk_estudios_DNI;
-- En la tabla Historial_Laboral
ALTER TABLE HISTORIAL_LABORAL DROP CONSTRAINT fk_hist_lab_DNI_SUPERVISOR;
-- En la tabla Historial_Salarial
ALTER TABLE HISTORIAL_SALARIAL DROP CONSTRAINT fk_hist_Sal_DNI; 
-- 2.- Eliminar la PK requerida.
ALTER TABLE Empleados DROP PRIMARY KEY ;
-- Establecer la nueva PK.
--¡Ojo puede haber problemas con el apellido2 porque hasta ahora no era obligatorio.
ALTER TABLE Empleados ADD PRIMARY KEY (nombre, apellido1, apellido2) ;


-- 4.- Restablecer las FK eliminadas en el punto 1.
--  En la tabla Estudios
ALTER TABLE ESTUDIOS ADD CONSTRAINT fk_estudios_DNI FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS (DNI);
-- En la tabla Historial_Laboral
ALTER TABLE HISTORIAL_LABORAL ADD CONSTRAINT fk_hist_lab_DNI_SUPERVISOR FOREIGN KEY (SUPERVISOR_DNI) REFERENCES EMPLEADOS (DNI);
-- En la tabla Historial_Salarial
ALTER TABLE HISTORIAL_LABORAL ADD CONSTRAINT fk_hist_Sal_DNI FOREIGN KEY (EMPLEADO_DNI) REFERENCES EMPLEADOS (DNI);
