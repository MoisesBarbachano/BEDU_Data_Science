USE tienda;
------------------------ RETO 1
SELECT * from articulo WHERE nombre LIKE "%Pasta%";
SELECT * from articulo WHERE nombre LIKE "%Cannelloni%";
SELECT * from articulo WHERE nombre LIKE "% - %";
SELECT * from puesto WHERE nombre LIKE "%Designer%";
SELECT * from puesto WHERE nombre LIKE "%Developer%";
------------------------ RETO 2
SELECT round(avg(salario), 2) from puesto;
SELECT count(*) from articulo WHERE nombre LIKE '%Pasta%'; 
SELECT min(salario) as "mínimo", max(salario) as "máximo" from puesto;
SELECT SUM(salario) FROM (SELECT salario FROM puesto ORDER BY id_puesto DESC LIMIT 5) AS LastFiveIdPuesto;
------------------------ RETO 3
SELECT nombre, count(*) AS cantidad_puesto from puesto GROUP BY nombre;
SELECT nombre, SUM(salario) AS total_salario from puesto GROUP BY nombre;
SELECT id_empleado, count(*) AS cantidad_ventas from venta GROUP BY id_empleado;
SELECT id_articulo, count(*) AS cantidad_ventas from venta GROUP BY id_articulo;