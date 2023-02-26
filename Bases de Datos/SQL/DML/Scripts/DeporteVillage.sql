/*
La empresa de comercio online DEPORTEVILLAGE desean tener informatizados los datos correspondientes a sus servicios. Estos servicios están organizados de la siguiente forma:

Se pide:
1. Mostrar el nombre de los clientes que viven en Buenos Aires.
2. Mostrar a todos los clientes sin teléfono y que su nombre contenga la cadena "rrier". Las columnas que se mostrarán serán: código y nombre concatenados denominado "cliente", la dirección, la localidad y código postal.
3. Listar el número y nombre de los productos cuyo idioma esté en español.
4. Listar los productos que no tengan un precio entre 100 y 200e.
5. Listar los vendedores que no tienen localidad.
6. Listar los vendedores que viven en zafra cuyo sueldo es mayor que la comisión.
7. Seleccionar el precio medio de los productos del stock de la empresa, así como el precio mayor y menor.
8. Seleccionar los números de ventas y clientes que han realizado compras pero sin repetirse, y que esté pagada la compra.
9. ¿Cuántos clientes han realizado compras con el vendedor nº 4?
10. Nombre de vendedor y número de ventas que gestionó (contar). Deben aparecer los vendedores con y sin ventas. La columna que almacena la cuenta debe mostrar el encabezado TotalVentas.
11. Mostrar por cada producto la suma de unidades vendidas: número de producto, nombre y suma de las unidades vendidas (TotalUnidadesVendidas). Los datos deben mostrarse en orden descendente según la suma de las unidades vendidas.
12. Modifica la sentencia anterior para que aparezcan sólo los productos con más de 50 unidades vendidas (la suma). Utilizar el mismo orden que antes.
13. Mostrar de las ventas de enero de 2003, fecha de la venta, número de la venta e importe total de la misma, suma de los importes de cada línea de detalle. Es decir, suma de los productos unidades vendidas por precio.
14. Mostrar los datos de los clientes que residan en la misma localidad que el cliente con nombre Maria Anders. Deben aparecer todas las columnas de la tabla clientes.
15. Mostrar los nombres de los productos que ha comprado el cliente con código ANTON.
16. Mostrar el nombre del producto y el nombre del cliente de la venta de mayor precio, es decir, qué cliente ha comprado el producto más caro.
17. Mostrar el nombre de los vendedores que no han realizado ninguna venta.
18. ¿Cuántos clientes todavía no han pagado sus compras?
19. Mostrar para cada nombre de producto cuántas unidades se han vendido en total.
20. Mostrar el nombre de los cinco primeros clientes que han realizado más compras.

*/

-- 1. Mostrar el nombre de los clientes que viven en Buenos Aires.
SELECT nombre
FROM cliente
WHERE localidad = ‘Buenos Aires’;

-- 2. Mostrar a todos los clientes sin teléfono y que su nombre contenga la cadena "rrier". Las columnas que se mostrarán serán: código y nombre concatenados denominado "cliente", la dirección, la localidad y código postal.
SELECT CONCAT(código, ‘ ‘, nombre) as cliente, direccion, localidad, cpostal
FROM cliente
WHERE nombre LIKE ‘%rrier%’ 
AND telefono IS NULL;

-- 3. Listar el número y nombre de los productos cuyo idioma esté en español.
SELECT numeroproducto, nombreproduto
FROM productos
WHERE idioma LIKE ‘%Español%’;

-- 4. Listar los productos que no tengan un precio entre 100 y 200€.
SELECT nombreproduto
FROM productos
WHERE precio NOT BETWEEN 100 AND 200;

-- 5. Listar los vendedores que no tienen localidad.
SELECT *
FROM vendedor
WHERE localidad IS NULL;

-- 6. Listar los vendedores que viven en zafra cuyo sueldo es mayor que la comisión.
SELECT *
FROM vendedor
WHERE UPPER(localidad) = ‘ZAFRA’
AND sueldo > comision;

-- 7. Seleccionar el precio medio de los productos del stock de la empresa, así como el precio mayor y menor.
SELECT FORMAT(AVG(precio),3) AS PrecioMedio,
MAX(precio) AS PrecioMayor,
MIN(precio) AS PrecioMenor,
FROM productos;

-- 8. Seleccionar los números de ventas y clientes que han realizado compras pero sin repetirse, y que esté pagada la compra.
SELECT DISTINCT cliente, numeroventa
FROM ventas
WHERE pagado = 1;

-- 9. ¿Cuántos clientes han realizado compras con el vendedor nº 4?
SELECT COUNT(cliente) AS TotalClientes
FROM ventas
WHERE vendedor = 4;

-- 10. Nombre de vendedor y número de ventas que gestionó (contar). Deben aparecer los vendedores con y sin ventas. La columna que almacena la cuenta debe mostrar el encabezado TotalVentas.
SELECT v.nombre, COUNT(ve.numeroventa) AS TotalVentas
FROM vendedor v
LEFT JOIN ventas ve ON v.idvendedor = ve.vendedor
GROUP BY v.nombre;

-- 11. Mostrar por cada producto la suma de unidades vendidas: número de producto, nombre y suma de las unidades vendidas (TotalUnidadesVendidas). Los datos deben mostrarse en orden descendente según la suma de las unidades vendidas.
SELECT p.numeroproducto, p.nombreproducto, SUM(d.unidadesvendidas)
FROM productos p
INNER JOIN detalle d ON p.numeroproducto = d.numproducto
GROUP BY p.nombreproducto
ORDER BY 3 DESC;

-- 12. Modifica la sentencia anterior para que aparezcan sólo los productos con más de 50 unidades vendidas (la suma). Utilizar el mismo orden que antes.
SELECT p.numeroproducto, p.nombreproducto, SUM(d.unidadesvendidas) Masde50UnidadesVendidas
FROM productos p
INNER JOIN detalle d ON p.numeroproducto = d.numproducto
GROUP BY p.nombreproducto
HAVING SUM(d.unidadesvendidas) > 50
ORDER BY 3 DESC;

-- 13. Mostrar de las ventas de enero de 2003, fecha de la venta, número de la venta e importe total de la misma, suma de los importes de cada línea de detalle. Es decir, suma de los productos unidades vendidas por precio.
SELECT v.fechaventa, v.numeroventa,
FORMAT(SUM(d.unidadesvendidas * p.precio),3) AS ImporteTotal
FROM ventas v
INNER JOIN detalle d ON v.numeroventa = d.numeroventa
INNER JOIN productos p ON d.numproducto = p.numeroproducto
WHERE YEAR(v.fechaventa) = 2003 
AND MONTH (v.fechaventa) = 1
GROUP BY v.numeroventa;

-- 14. Mostrar los datos de los clientes que residan en la misma localidad que el cliente con nombre Maria Anders. Deben aparecer todas las columnas de la tabla clientes.
SELECT *
FROM cliente
WHERE localidad LIKE (SELECT localidad
FROM cliente
WHERE nombre = ‘Maria Anders’);

-- 15. Mostrar los nombres de los productos que ha comprado el cliente con código ANTON.
SELECT p.numeroproducto, p.nombreproducto,
FROM productos p
INNER JOIN detalle d ON p.numeroproducto = d.numproducto
INNER JOIN ventas v ON d.numeroventa = v.numeroventa
WHERE v.cliente = ‘ANTON’;

-- 16. Mostrar el nombre del producto y el nombre del cliente de la venta del producto de mayor precio, es decir, qué cliente ha comprado el producto más caro.
SELECT c.nombre, p.nombreproducto, MAX(p.precio)
FROM productos p
INNER JOIN detalle d ON p.numeroproducto = d.numproducto
INNER JOIN ventas v ON d.numeroventa = v.numeroventa
INNER JOIN cliente c ON v.cliente = c.codigo
GROUP BY p.nombreproducto
ORDER BY p.precio DESC
LIMIT 1;

-- 17. Mostrar el nombre de los vendedores que no han realizado ninguna venta.
SELECT v.nombre
FROM vendedor v
LEFT JOIN ventas ve ON v.idvendedor = ve.vendedor
WHERE ve.vendedor IS NULL;
----------------------------------------------------
SELECT v.nombre
FROM vendedor v
WHERE V.IdVendedor NOT IN (SELECT ve.vendedor
FROM ventas ve;

-- 18. ¿Cuántos clientes todavía no han pagado sus compras?
SELECT cliente, COUNT(cliente) NUM_IMPAGOS
FROM ventas
WHERE pagado = 0
GROUP BY (cliente);

-- 19. Mostrar para cada nombre de producto cuántas unidades se han vendido en total.
SELECT p.nombreproducto, SUM(d.unidadesvendidas) TOTAL_UD_VENDIDAS
FROM productos p
INNER JOIN detalle d ON p.numeroproducto = d.numproducto
GROUP BY p.nombreproducto;

-- 20. Mostrar el nombre de los cinco primeros clientes que han realizado más compras.
SELECT c.nombre, COUNT(v.numeroventa) as Cantidad
FROM cliente c
INNER JOIN ventas v d ON v.cliente = c.codigo
GROUP BY c.codigo
ORDER BY Cantidad DESC
LIMIT 5;
