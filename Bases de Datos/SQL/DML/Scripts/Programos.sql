/*
La empresa PROGRAMAMOS SL desea mantener actualizada la información de sus empleados en base a los distintos departamentos de los que se compone la empresa. En concreto, desea gestionar los datos para la Comunidad Autónoma de Extremadura, y para ello nos proporciona la siguiente información:
Diseñar las estructuras de las tablas teniendo en cuenta las restricciones de clave primaria y clave ajena ya que debe permitir borrar y actualizar en cascada.

CREATE DATABASE IF NOT EXISTS PROGRAMAMOS ;
    USE PROGRAMAMOS ;
    CREATE TABLE DEPARTAMENTO(
    depto_no INT(3) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre_depto VARCHAR(30) NOT NULL,
    localizacion VARCHAR(20) NOT NULL
);

CREATE TABLE EMPLEADO(
    codigo_c VARCHAR(25) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    edad INTEGER(2) NOT NULL,
    oficio VARCHAR(20) NOT NULL,
    dir VARCHAR(20) NOT NULL,
    fecha_alt DATE NOT NULL,
    salario FLOAT(8,2),
    comision FLOAT(8,2),
    depto_no INT(3) UNSIGNED NOT NULL,
    CONSTRAINT emp_dep_fk FOREIGN KEY (depto_no)
    REFERENCES DEPARTAMENTO (depto_no)
    ON UPDATE CASCADE ON DELETE CASCADE
);
*/
-- > Se pide realizar las siguientes operaciones:

-- Insertar en la tabla EMPLEADO un empleado con código 081- 220678-0008U, nombre ‘Pérez Luis Carlos’ de 32 años, oficio Analista, vive en Zafra, fecha de alta en la empresa el 22-06- 2001, su salario es € 15600, no tiene comisión y pertenece al departamento 50.
INSERT INTO EMPLEADO VALUES ("081-220678-0008U","Pérez Luis
Carlos",32,"Analista","Matagalpa","2001-06-22",15600,0,50);

-- Insertar en la tabla BACKUP los datos de los empleados que pertenecen al departamento número 40 y tengan un salario comprendido entre 13000 y 18000.
CREATE TABLE BACKUP AS
(SELECT * FROM EMPLEADO
WHERE depto_no=40 AND salario BETWEEN 13000 AND 18000);

-- Doblar el salario a todos los empleados del departamento 30.
UPDATE EMPLEADO
SET salario=salario*2
WHERE depto_no=30;

-- Cambiar todos los empleados del departamento número 30 al departamento número 20.
UPDATE EMPLEADO
SET depto_no=20
WHERE depto_no=30;

-- Incrementar en un 10% el sueldo de los empleados del departamento 10.
UPDATE EMPLEADO
SET salario=salario*1.1
WHERE depto_no=10;

--Igualar el salario de ‘Esquivel Leonel Alfonso’ al salario de todos los empleados.
UPDATE EMPLEADO
SET salario=(SELECT salario FROM EMPLEADO
WHERE nombre = "Esquivel Leonel Alfonso");

--En la tabla DEPARTAMENTO borrar el departamento número 40.
DELETE FROM DEPARTAMENTO
WHERE depto_no=40;

-- Mostrar los nombres de los empleados ordenados alfabéticamente.
SELECT nombre 
FROM EMPLEADO
ORDER BY nombre ASC;

-- Seleccionar el nombre, el oficio y la localidad de los departamentos donde trabajan los vendedores.
SELECT nombre, oficio, localizacion
FROM EMPLEADO E
JOIN DEPARTAMENTO D ON E.depto_no=D.depto_no
WHERE E.oficio = 'Vendedor';

-- Listar los nombres de los empleados cuyo nombre termine con la letra ‘o’.
SELECT nombre 
FROM EMPLEADO
WHERE nombre LIKE ‘%O’;

--Seleccionar el nombre, salario y localidad donde trabajan los empleados que tengan un salario entre 10000 y 13000.
SELECT E.nombre, E.salario, D.localizacion
FROM EMPLEADO E
JOIN DEPARTAMENTO D ON E.depto_no=D.depto_no
WHERE salario BETWEEN 10000 AND 13000;

--Visualizar los departamentos con más de 5 empleados
SELECT count(depto_no), depto_no
FROM EMPLEADO
GROUP BY depto_no
HAVING count(depto_no)>5;

--Mostrar los datos de los empleados que trabajan en el departamento de contabilidad, ordenados por nombre.
SELECT E.*
FROM EMPLEADO E
JOIN DEPARTAMENTO D ON E.depto_no=D.depto_no
WHERE D.nombre_depto = 'Contabilidad'
ORDER BY E.nombre ASC;

--Mostrar los tres primeros dígitos del código de los empleados, el nombre en mayúscula y el sueldo real del empleado (sueldo + comisión).
SELECT SUBSTR(E..codigo_c,1,3) AS COD,
UPPER(E.nombre) AS Nombre,
(E.salario+E.comision) AS Sueldo_Real
FROM EMPLEADO E
JOIN DEPARTAMENTO D ON E.depto_no=D.depto_no
ORDER BY nombre ASC;

-- ¿Cuál es el máximo salario de los empleados del departamento 10?
SELECT MAX(salario) 
FROM EMPLEADO
WHERE depto_no=10;

-- Calcula el salario mínimo de los empleados del departamento ‘VENTAS’.
SELECT MIN(salario) 
FROM EMPLEADO E
JOIN DEPARTAMENTO D ON E.depto_no=D.depto_no
WHERE D.nombre_depto = "Ventas";

-- Visualizar el número de empleados de cada departamento.
SELECT E.depto_no, D.nombre_depto, COUNT(*) AS num_empleados
FROM EMPLEADO E
JOIN DEPARTAMENTO D ON E.depto_no=D.depto_no
GROUP BY E.depto_no;

-- Mostrar los departamentos que tengan más de dos personas trabajando en la misma profesión.
SELECT depto_no, count(*) AS num_personas
FROM EMPLEADO
GROUP BY depto_no, oficio
HAVING count(*)>2;

-- Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado por el nombre del departamento y en segundo lugar por el nombre de los empleados.
SELECT D.nombre_depto, E.codigo_c, E.nombre,
FROM EMPLEADO E
JOIN DEPARTAMENTO D ON E.depto_no=D.depto_no
ORDER BY 1, 3;

-- Devuelve un listado con el código y el nombre de departamento, solo de aquellos departamentos que tienen empleados.
SELECT D.dpto_no, D.nombre_depto
FROM EMPLEADO E
JOIN DEPARTAMENTO D ON E.depto_no=D.depto_no
GROUP BY D.Dept_no
ORDER BY D.dpto_no;

-- Devuelve el nombre del departamento donde trabaja el empleado Luis Perez.
SELECT D.nombre_depto, E.nombre
FROM EMPLEADO E
JOIN DEPARTAMENTO D ON E.depto_no=D.depto_no
WHERE E.nombre LIKE "%Luis Pérez%";
