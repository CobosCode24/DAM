/*
La empresa PELICULÓN SL desea actualizar su sistema de almacenamiento de información sobre los alquileres de películas. Para ello, se nos proporciona las siguientes tablas:

CREATE TABLE Peliculas (
    IdPelicula BIGINT UNSIGNED NOT NULL,
    Titulo varchar(100) NOT NULL,
    Tema enum('Comedia','Drama','Acción','Suspense') DEFAULT NULL,
    Anio varchar(10) NOT NULL,
    Pais varchar(100) NOT NULL,
    Precio double(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Socios (
IdSocio BIGINT UNSIGNED NOT NULL,
    DNI varchar(9) NOT NULL,
    Nombre varchar(100) NOT NULL,
    Fecha_alta timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Telefono varchar(9) NOT NULL,
    Direccion varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Alquiler (
    IDSocio BIGINT UNSIGNED NOT NULL,
    IDPelicula BIGINT UNSIGNED NOT NULL,
    Fecha_alquiler date NOT NULL,
    Fecha_devolucion date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE Peliculas
ADD PRIMARY KEY (IdPelicula);

ALTER TABLE Socios
ADD PRIMARY KEY (`IdSocio`),
ADD UNIQUE KEY `DNI` (`DNI`);

ALTER TABLE Alquiler
ADD CONSTRAINT alquiler_ibfk_1
FOREIGN KEY (IDSocio) REFERENCES Socios (IdSocio),
ADD CONSTRAINT alquiler_ibfk_2
FOREIGN KEY (IDPelicula) REFERENCES Peliculas (IdPelicula);

ALTER TABLE Alquiler
ADD PRIMARY KEY (IDSocio, IDPelicula, Fecha_alquiler);

Se pide:
1. Consultar el código, nombre y fecha de ingreso en la plataforma de los socios con apellido López.
2. ¿Cuántas personas se hicieron socias en el último trimestre de 2010.
3. Consultar los datos de los socios ordenados por la fecha de ingreso.
4. ¿Cuál es el precio medio de una película en el videoclub?
5. ¿Cuántas películas están por encima del precio medio?
6. Consultar los préstamos que han tenido una duración superior a dos días, debes visualizar el nombre del socio y el título de la película.
7. Consultar el nombre de los socios que han alquilado la película “Desperado”.
8. Mostrar la lista de socios y la cantidad de películas que han alquilado cada uno.
9. Mostrar el precio que ha pagado el socio al alquilar la película 4.
10. Mostrar la lista de películas que no han sido alquiladas.
11. Mostrar cuánto ha ganado el videoclub en el año 2010.
12. Mostrar las películas que están actualmente alquiladas.
13. Mostrar el “top manta”, la lista de películas y las veces que han sido alquiladas ordenada por las veces que han sido alquiladas.
14. Mostrar el nombre y el número de teléfono de socios que tienen películas en su casa.
15. ¿Cuánto dinero ha gastado 'Teresa Sánchez López' en el videoclub?
16. Consultar los nombres y códigos de socios que han alquilado películas de suspense o acción ordenados por código de socio
17. Consultar el nombre y código del socio junto con el dinero total gastado de aquellos socios que han gastado más de 5 euros en el videoclub
18. Mostrar las fechas en que ha sido alquilada la película “Desperado”.
19. Mostrar la lista de películas que ha alquilado el socio con DNI 27711498D.
20. ¿Cuál es la película española que más se alquila?

*/

-- 1. Consultar el código, nombre y fecha de ingreso en el videoclub de los socios con apellido López
SELECT IdSocio, Nombre, Fecha_alta
FROM Socios
WHERE Nombre LIKE "%Lopez%";

-- 2. ¿Cuántas personas se hicieron socias en el último trimestre de 2010.
SELECT 	Count(*) as Total
FROM 	Socios
WHERE 	Fecha_alta BETWEEN '2010-10-01' AND '2010-12-31';

-- 3. Consultar los datos de los socios ordenados por la fecha de ingreso.
SELECT * 
FROM Socios
ORDER BY Fecha_alta ASC;

-- 4. ¿Cuál es el precio medio de una película en el videoclub?
SELECT FORMAT(AVG(precio),2) as Precio_Medio
FROM Peliculas;

-- 5. ¿Cuántas películas están por encima del precio medio?
SELECT Count(*) as Total
FROM Peliculas
WHERE precio > (SELECT AVG(precio) FROM Peliculas);

-- 6. Consultar los préstamos que han tenido una duración superior a dos días, debes visualizar el nombre del socio y el título de la película.
SELECT 	S.Nombre, P.Titulo
FROM 	Socios S
JOIN		Alquiler A ON S.IdSocio = A.IdSocio
JOIN		Peliculas P ON A.IdPelicula = P.IdPelicula
WHERE 	DATEDIFF(A.Fecha_devolucion,A.Fecha_alquiler)>=2;

-- 7. Consultar el nombre de los socios que han alquilado la película “Desperado”.
SELECT 	S.IdSocio, S.Nombre
FROM 	Socios S
JOIN 		Alquiler A ON S.IdSocio = A.IdSocio
JOIN 		Peliculas P ON P.IdPelicula = A.IdPelicula
WHERE 	P.Titulo LIKE "%Desperado%";

-- 8. Mostrar la lista de socios y la cantidad de películas que han alquilado.
SELECT S.DNI, S.Nombre, Count(Alquiler.IDSocio) as Cantidad_Películas
FROM Socios S
JOIN	Alquiler A ON S.IdSocio = A.IdSocio
GROUP BY S.DNI, S.Nombre;

-- 9. Mostrar el precio que ha pagado el socio al alquilar la película 4.
SELECT	S.Socio, P.Precio
FROM 	Peliculas P
JOIN 		Alquiler A ON P.IdPelicula=A.IdPelicula
JOIN 		Socios S ON A.IdSocio = S.IdSocio
WHERE 	P.IdPelicula =4;

-- 10. Mostrar la lista de películas que no han sido alquiladas.
SELECT P.* FROM Peliculas P
WHERE P.IdPelicula NOT IN (SELECT IDPelicula FROM Alquiler);

-- 11. Mostrar cuánto ha ganado el videoclub en el año 2010.
SELECT SUM(P.Precio) as Recaudacion
FROM Peliculas P
INNER JOIN Alquiler A ON P.Pelicula = A.IDPelicula
WHERE A.Fecha_alquiler BETWEEN '2010-01-01' AND '2010-12-31';

-- 12. Mostrar las películas que están actualmente alquiladas.
SELECT P.Pelicula, P.Titulo
FROM Peliculas P
INNER JOIN Alquiler A ON P.IdPelicula = A.IDPelicula
WHERE A.Fecha_devolucion IS NULL
ORDER BY PId.Pelicula;

-- 13. Mostrar el “top”, la lista de películas y las veces que han sido alquiladas ordenada por las veces que han sido alquiladas.
SELECT P.Titulo, Count(*) as Top
FROM Peliculas P
INNER JOIN Alquiler A ON P.IdPelicula = A.IDPelicula
GROUP BY P.Titulo;

-- 14. Mostrar el nombre y el número de teléfono de socios que tienen películas en su casa.
SELECT S.Nombre, S.Telefono
FROM Socios S, Alquiler A
WHERE S.Socio = A.IDSocio
AND A.Fecha_devolucion IS NULL;

-- 15. ¿Cuánto dinero ha gastado 'Teresa Sánchez López' en el videoclub?
SELECT S.Nombre, SUM(P.Precio) as Gasto
FROM Socios S
INNER JOIN Alquiler A ON S.Socio = A.IDSocio
INNER JOIN Peliculas P ON A.IDPelicula = P.Pelicula
WHERE S.Nombre = 'Teresa Sánchez López'
GROUP BY S.IdSocio,S.Nombre;

-- 16. Consultar los nombres y códigos de socios que han alquilado películas de suspense o acción ordenados por código de socio.
SELECT S.IdSocio, S.Nombre 
FROM Socios S
INNER JOIN Alquiler A ON S.Socio = A.IDSocio
INNER JOIN Peliculas P ON A.IDPelicula = P.Pelicula
WHERE P.tema = 'Acción' OR P.tema = "Suspense"
GROUP BY S.IdSocio, S.nombre;

-- 17. Consultar el nombre y código del socio junto con el dinero total gastado de aquellos socios que han gastado más de 5 euros en el videoclub.
SELECT S.IdSocio, S.Nombre, SUM(P.Precio) as Cantidad
FROM Socios S
INNER JOIN Alquiler A ON S.Socio = A.IDSocio
INNER JOIN Peliculas P ON A.IDPelicula = P.Pelicula
GROUP BY S.IdSocio 
HAVING SUM(P.Precio) > 5;

-- 18. Mostrar las fechas en que ha sido alquilada la película “Desperado”.
SELECT DOSTINCT A.Fecha_alquiler
FROM Alquiler A
INNER JOIN Peliculas P ON A.IDPelicula = P.Pelicula
WHERE P.Titulo = "Desperado";

-- 19. Mostrar la lista de películas que ha alquilado el socio con DNI 27711498D.
SELECT P.Titulo, A.Fecha_alquiler
FROM Alquiler A
INNER JOIN Peliculas P ON A.IDPelicula = P.Pelicula
INNER JOIN Socios S ON A.IDSocio = S.Socio
WHERE S.DNI LIKE ‘27711498D’;

-- 20. ¿Cuál es la película española que más se alquila?
SELECT P.Titulo, Count(*) as Vista_TOP
FROM Alquiler A
INNER JOIN Peliculas P ON A.IDPelicula = PId.Pelicula
INNER JOIN Socios S ON A.IDSocio = S.Socio
WHERE P.Pais LIKE 'España'
GROUP BY P.Titulo;
