/*
Se pide:
1. Crea una tabla nueva llamada algunosTrabajadores que tenga un campo denominado nombreTrabajador y otro código para guardar el id del trabajador. Determina tú el tipo de datos que debe tener.
2. Haz una consulta en la que se obtengan todos los trabajadores que están en la obra 6 indicando el nombre del trabajador y su código.
3. Inserta en la tabla algunosTrabajadores todos los trabajadores que están en la obra 8 de la localidad de Cáceres.
4. Borra de la tabla algunosTrabajadores los trabajadores cuyo código sea mayor que 10.
5. Borra todos los registros de la tabla algunosTrabajadores.
6. Incrementa el salario diario en un 5% para las especialidades cuyo salario diario es inferior a 15 euros.
7. Incrementa el salario diario en un 5% para la especialidad en la que hay más trabajadores.
8. Haz una consulta que muestre los clientes que han adquirido una vivienda superior a 20.000€ en la localidad de Cáceres.
9. Haz una consulta que muestre los clientes que realizaron los 10 contratos de mayor importe realizados en el mes de enero de 2023 en la localidad de Badajoz.
10. Muestra los datos de las promociones terminadas de cada una de las localidades, mostrando primero la más reciente.
11. Contar el número de trabajadores por especialidad. Debe aparecer el nombre de la especialidad y el número de trabajadores ordenados de más a menos.
12. Calcular el salario promedio diario (sin decimales) de los trabajadores para cada una de las especialidades.
*/

-- 1. Crea una tabla nueva llamada algunosTrabajadores que tenga un campo denominado nombreTrabajador y otro código para guardar el id del trabajador. Determina tú el tipo de datos que debe tener y las claves y restricciones correspondientes.
CREATE TABLE algunosTrabajadores(
    nombreTrabajador varchar(25) not null,
    codigo int(11) PRIMARY KEY,
    CONSTRAINT Codigo_trabajador FOREIGN KEY(codigo) REFERENCES Trabajadores(idTrab) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 2. Haz una consulta en la que se obtengan todos los trabajadores que están en la obra 6 indicando el nombre del trabajador y su código.
SELECT t.nombreTrabajador,t.idTrab
FROM trabajadores t
    INNER JOIN trabajan tr ON t.idTrab = tr.idTrab
WHERE tr.fechaFin IS NULL 
AND tr.id= 6;

-- 3. Inserta en la tabla algunosTrabajadores todos los trabajadores que están en la obra 8 de la localidad de Cáceres.
INSERT INTO algunosTrabajadores
SELECT t.nombreTrabajador,t.codigo
FROM trabajadores t
    INNER JOIN trabajan tr ON t.idTrab = tr.idTrab
    INNER JOIN obra_promocion op ON op.id = tr.id
WHERE op.id = 8 
AND op.localidad =’Cáceres’;

-- 4. Borra de la tabla algunosTrabajadores los trabajadores cuyo código sea mayor que 10.
DELETE FROM algunosTrabajadores
WHERE codigo > 10;

-- 5. Borra todos los registros de la tabla algunosTrabajadores.
DELETE FROM algunosTrabajadores;
TRUNCATE TABLE algunosTrabajadores;

-- 6. Incrementa el salario diario en un 5% para las especialidades cuyo salario diario es inferior a 15 euros.
UPDATE especialidad
SET salarioDia = salarioDia * 1.05
WHERE salarioDia< 15;

-- 7. Incrementa el salario diario en un 5% para la especialidad en la que hay más trabajadores.
UPDATE especialidad
SET salarioDia = salarioDia * 1.05
WHERE idEspecialidad IN (

    SELECT idEspecialidad
    FROM trabajadores
    GROUP BY idEspecialidad
    ORDER BY COUNT(*) DESC
    LIMIT 1

);

-- 8. Haz una consulta que muestre los clientes que han adquirido una vivienda superior a 20.000€ en la localidad de Cáceres.
SELECT c.nif, c.nombreCliente
FROM cliente c
    INNER JOIN compra co ON c.nif = co.nif
    INNER JOIN viviendas v ON v.idVivienda = co.idVivienda
WHERE v.importe > 20.000
AND v.localidad=’Cáceres’;

-- 9. Haz una consulta que muestre los clientes que realizaron los 10 contratos de mayor importe realizados en el mes de enero de 2023 en la localidad de Badajoz.
-- Opción 1.
SELECT c.nif, c.nombreCliente, ct.importe 
FROM cliente c
    INNER JOIN compra co ON c.nif = co.nif
    INNER JOIN viviendas v ON v.idVivienda = co.idVivienda
    INNER JOIN contrato ct ON co.idContrato = ct.IdContrato
WHERE MONTH (ct.fecha=01) 
AND YEAR (ct.fecha=2023)
AND v.localidad=’Badajoz’
ORDER BY 3 DESC
LIMIT 10;

-- Opción 2.
SELECT c.nif, c.nombreCliente, ct.importe 
FROM cliente c
    INNER JOIN compra co ON c.nif = co.nif
    INNER JOIN viviendas v ON v.idVivienda = co.idVivienda
    INNER JOIN contrato ct ON co.idContrato = ct.IdContrato
WHERE ct.fecha BETWEEN ‘20230101’ AND ‘20230131’ 
AND v.localidad=’Badajoz’
ORDER BY 3 DESC
LIMIT 10;

-- 10. Muestra los datos de las promociones terminadas de cada una de las localidades, mostrando primero la más reciente.
SELECT op.localidad, op.nombre, t.fechaFin
FROM obra_promocion op
    INNER JOIN trabajan t ON op.id = t.id
GROUP BY op.localidad
HAVING t.FechaFin IS NOT NULL
ORDER BY op.localidad, t.fechaFin DESC;

-- 11. Contar el número de trabajadores por especialidad. Debe aparecer el nombre de la especialidad y el número de trabajadores ordenados de más a menos.
SELECT  e.Especialidad, COUNT(e.idTrab) AS num_trabajadores
FROM trabajadores t
    INNER JOIN especialidad e ON t.idEspecialidad = e.idEspecialidad
GROUP BY e.Especialidad
ORDER BY 2 DESC;

-- 12. Calcular el salario promedio diario (sin decimales) de los trabajadores para cada una de las especialidades.
SELECT e.Especialidad, TRUNCATE(AVG(e.salarioDia),0) AS "Salario_promedio_diario"
FROM trabajadores t
    INNER JOIN especialidad e ON t.idEspecialidad = e,idEspecialidad
GROUP BY  e.Especialidad
ORDER BY  e.Especialidad;
