USE tienda;
################################ RETO 1
#1
SELECT nombre, apellido_paterno, apellido_materno
FROM empleado WHERE id_puesto IN (SELECT id_puesto FROM puesto WHERE salario < 10000 );
#2
SELECT id_empleado, MIN(ventas), MAX(ventas)
FROM (
	SELECT clave, id_empleado, COUNT(*) AS ventas
	FROM venta
    GROUP BY clave, id_empleado) AS cantidades
GROUP BY id_empleado ORDER BY id_empleado;
#3
SELECT clave, id_articulo FROM venta
WHERE id_articulo IN (SELECT id_articulo FROM articulo WHERE precio > 5000) ORDER BY clave;

################################### RETO 2
#1
SELECT clave, nombre, apellido_paterno, apellido_materno FROM empleado AS e
JOIN venta as v
USING(id_empleado) ORDER BY clave;
#2
SELECT clave, nombre FROM articulo AS a
JOIN venta as v
USING(id_articulo) ORDER BY clave;
#3
SELECT clave, sum(precio) AS total FROM venta AS v
JOIN articulo AS a
USING (id_articulo)
GROUP BY clave ORDER by clave;

################################### RETO 3
#1
CREATE VIEW puestos_083 AS
SELECT concat(e.nombre, ' ', e.apellido_paterno, ' ', e.apellido_materno), p.nombre FROM empleado AS e
JOIN puesto AS p
USING(id_puesto);

SELECT * FROM puestos_083;
#2
CREATE VIEW articulos_vendidos_083 AS
SELECT v.clave, concat(e.nombre, ' ', e.apellido_paterno, ' ', e.apellido_materno) AS nombre_empleado, a.nombre as articulo_vendido
FROM venta AS v JOIN empleado AS e
USING(id_empleado)
JOIN articulo as a
USING(id_articulo);

SELECT * FROM articulos_vendidos_083 ORDER BY clave;
#3
CREATE VIEW puesto_mas_ventas_083 AS
SELECT p.nombre, count(v.clave) as total_ventas
FROM venta AS v JOIN empleado AS e
USING(id_empleado)
JOIN puesto as p
USING(id_puesto)
GROUP BY p.nombre ORDER BY total_ventas DESC LIMIT 1;

SELECT * FROM puesto_mas_ventas_083;

