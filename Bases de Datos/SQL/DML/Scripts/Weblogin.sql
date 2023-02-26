/*
La empresa WebLogin se dedica a trabajar la seguridad de los usuarios que se loguean en un sistema web online. 


CREATE DATABASE IF NOT EXISTS weblogin;
USE weblogin;

CREATE TABLE tblUsuarios (
    idx INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(20) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    sexo VARCHAR(1) NOT NULL,
    nivel TINYINT UNSIGNED NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    compañía VARCHAR(50) NOT NULL,
    saldo FLOAT(6,2) NOT NULL,
    activo BOOLEAN NOT NULL
);

> A partir de esta tabla, realiza:

*/

-- Listar los nombres de los usuarios.
SELECT nombre FROM tblUsuarios;

-- Calcular el saldo máximo y mínimo de los usuarios de sexo ‘Mujer’.
SELECT MAX(saldo) AS "Saldo Máximo"
FROM tblUsuarios
WHERE sexo = 'M';

-- Listar nombre y teléfono de los usuarios con teléfono NOKIA, BACKBERRY o SONY.
SELECT nombre, telefono
FROM tblusuarios
WHERE marca IN ('NOKIA','BLACKBERRY','SONY');

-- Contar los usuarios sin saldos o inactivos.
SELECT COUNT(*) AS "Número de usuarios"
FROM tblusuarios
WHERE saldo=0 OR activo=FALSE;

-- Listar el login de los usuarios y su nivel con nivel 1,2 o 3.
SELECT usuario FROM tblusuarios WHERE nivel IN (1,2,3);

-- Calcular la suma de los saldos de los usuarios de la compañía telefónica NEXTEL.
SELECT SUM(saldo) AS "Total saldo"
FROM tblUsuarios
WHERE compania LIKE 'NEXTEL';

-- Contar el número de usuarios por compañía telefónica.
SELECT compania, COUNT(*) AS num_usuarios
FROM tblUsuarios
GROUP BY compania;

-- Listar los usuarios y sus email que usan gmail.
SELECT usuario, email
FROM tblUsuarios WHERE email LIKE '%gmail.com';

--Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG o SAMSUNG.
SELECT nombre, telefono
FROM tblUsuarios
WHERE marca NOT IN ('LG','SAMSUNG');

-- Listar los usuarios y sus email que no usan yahoo.
SELECT usuario, email
FROM tblUsuarios
WHERE email NOT LIKE '%yahoo%';

-- Listar las diferentes marcas de teléfonos en orden alfabético descendentemente.
SELECT DISTINCT marca
FROM tblUsuarios
ORDER BY marca DESC;

-- Calcular el saldo promedio (sin decimales) de los usuarios que tienen teléfono marca LG.
SELECT TRUNCATE(AVG(saldo),0) AS "Saldo promedio"
FROM tblUsuarios
WHERE marca LIKE 'LG';

-- Calcular el saldo mínimo de los usuarios de sexo ‘Hombre’.
SELECT MIN(saldo) AS "Saldo Mínimo"
FROM tblUsuarios WHERE sexo LIKE 'H';

-- Listar los números de teléfonos con saldo mayor a 300.
SELECT telefono FROM tblUsuarios WHERE saldo > 300;

-- Listar las diferentes marcas de teléfonos en orden alfabético aleatorio.
SELECT DISTINCT marca AS Marcas
FROM tblUsuarios
ORDER BY RAND();

-- Listar los tres primeros caracteres de su campo usuario y llámalo alias y su fecha de nacimiento con un formato como el siguiente: Viernes, 20 de marzo de 2022, pero solo de aquellos usuarios que tengan como email cuentas en gmail.
SELECT idx, SUBSTRING(nombre,1,3) AS alias,
DATE_FORMAT(fecha_nacimiento, "%W, %d de %M de %Y")
FROM tblUsuarios
WHERE email LIKE '%gmail%';
