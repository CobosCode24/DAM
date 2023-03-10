-- 2. Muestra los caladeros en los que se han capturado más de 1000 kilos de pescado azul en los últimos tres meses.
SELECT C.Nombre
FROM Caladeros C
	JOIN Capturas ct ON C.codigo = ct.CodigoCaladero
	JOIN Especies e ON ct.codEspecie = e.codigo
WHERE e.tipo = ‘Pescado Azul’
AND TIMESTAMPDIFF (MONTH, ct.Fecha, NOW()) <= 3
GROUP BY C.nombre
HAVING SUM (ct.numKilos) > 1000;

-- 3. Añade una columna KilosTotalesCapturados a la tabla Caladeros y realiza las operaciones necesarias para rellenarla a partir de los datos de la tabla Capturas.
ALTER TABLE caladeros
ADD KilosTotalesCapturados NUMERIC (12) DEFAULT 0;

UPDATE Calendarios C
SET KilosTotalesCapturados = (
SELECT SUM (numKilos)
	FROM Capturas ct
WHERE ct.codCaladero = c.codigo
);

-- 4. Crea una vista con el nombre de los barcos, el código del último lote que vendió, el nombre de la especie del lote y el dinero que ganaron en la operación.
CREATE VIEW vista AS 
    SELECT b.Nombre, l.codigo, e.nombre, l.PPKA*l.NumKilos
    ORDER BY 2 DESC
    LIMIT 1;

-- 5. Muestra los barcos que han capturado más de 1200 kilos de sardinas en el caladero llamado 'Terranova'.
SELECT b.nombre
FROM barcos b
WHERE b.matricula IN (
	SELECT matricula
	FROM Capturas ct
	WHERE C.codCaladero = (
        SELECT codigo
        FROM Caladeros C
        WHERE nombre=’Terranova’
        ) AND (t.codEspecie = (
                SELECT codigo
                FROM Especies e
                WHERE UPPER (nombre) = ‘SARDINA’
                GROUP BY b.matricula
                HAVING SUM(NUMkILOS) > 1200	
            )
        )
);

-- 6. Muestra los nombres de las especies ordenadas por número de kilos vendidos en Febrero.
SELECT e.nombre
FROM especies e
	JOIN Lotes l ON e.codigo = l.codigoEspecie
WHERE MONTH(l.fechaVenta) LIKE ‘Febrero’ 
ORDER BY l.numKilos;


-- 7. Muestra el nombre de los barcos que han superado el cupo de capturas de alguna especie.
SELECT b.Nombre
FROM Barcos b
	JOIN Capturas c ON b.Matricula = c.Matricula
	JOIN Especies e ON c.CodEspecie = e.Codigo
WHERE c.NumKilos > e.CupoPorBarco;

-- 8. Muestra el nombre del armador que ha ingresado más dinero por la venta de pescado de sus barcos.
SELECT b.armador
FROM Barcos b
	JOIN Capturas c ON b.Matricula = c.Matricula
ORDER BY SUM(NumKilos) DESC
LIMIT 1;

-- 9. Muestra los barcos que han capturado más pescado de cada nacionalidad.
SELECT b.matricula
FROM Barcos b
	JOIN Capturas c ON b.Matricula = c.Matricula
GROUP BY b.Nacionalidad
ORDER BY c.NumKilos DESC;
