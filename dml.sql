-- Lenguaje de manipulacion de datos
--
-- en WHERE hay varios tipos de operadores:
--    SELECT
--    condicionales
--      >
--      <
--      <=
--      >=
--      ==
--      !=
--    logicps
--      AND
--      OR
--      NOT
--    otros
--      IN / NOT IN
--      IS NULL / IS NOT NULL
--      BETWEEN V1 AND V2 / NOT BETWEEN
--      LIKE / NOT LIKE
--    cuantificadores
--      ALL
--      ANY
--      SOME
--


SELECT cantidad, code AS "empleado", codc AS "cerveza", codb AS "bar", fecha
FROM  repartos
WHERE cantidad > 50 AND fecha >= '2005-10-23'

--

SELECT nombre, cif
FROM bares
WHERE cif IS NULL;

--

SELECT cantidad, fecha
FROM reparto
WHERE fecha BETWEEN '2005-10-20' AND '2005-10-23'

--

SELECT nombre
FROM bares
WHERE nombre LIKE '%to%' -- Todo lo que tiene to con cosas antes o despues
        --   ILIKE --  algunos dbms's
        -- Solo funciona para textos
--

SELECT codc
FROM reparto
WHERE fecha = '2005-10-21'
INTERSECT --  UNION, UNION ALL, EXCEPT,
SELECT codc
FROM reparto
WHERE fecha = '2005-10-23'

--

SELECT * FROM reparto
ORDER BY cantidad

--

SELECT SUM(cantidad)
FROM reparto

--

SELECT COUNT(*)
FROM reparto
WHERE fecha = '2005-10-22'

--

SELECT MIN(fecha) -- MAX, AVG(average)
FROM reparto

--

SELECT code, SUM(cantidad)
FROM reparto
GROUP BY code



-- Conectarse por consola a bluemix y hacer dbs
psql -h jumbo.db.elephantsql.com -d ayqfyukp -U ayqfyukp -W


-- Union natural
SELECT empleados.nombre AS "Empleado",
       cervezas.envase AS "Cerveza",
       bares.nombre AS "Bar",
       reparto.fecha
       reparto.cantidad
FROM reparto, empeados, bares, cervezas
WHERE reparto.code = empleados.code AND
      reparto.codc = cervezas.codc AND
      reparto.codb = bares.codb



-- Join
SELECT code AS "Empleado",
       codc AS "Cerveza",
       codb AS "Bar",
       fecha
       cantidad
FROM reparto
WHERE
      code IN (SELECT code FROM empleados) AND
      codc IN (SELECT codc FROM cervezas) AND
      codb IN (SELECT codb FROM bares)

-- Unir dos tablas y hacer una funcion agregada que sume todos los habitantes
--    de todas esas localidades
-- Solucion por union natural
SELECT p.comunidad, sum(l.habitantes)
FROM provincias p, localidades l
WHERE p.codprov = l.codprov
GROUP BY p.counidad



-- Subconsultas
SELECT * FROM localidades
WHERE codloca IN (SELECT codloc FROM localidades WHERE nombre = 'Cuenca')
-- LO mismo pero con join
SELECT *
FROM tramos JOIN localidades ON tramos.codloca = localidades.codloc
WHERE localidades.nombre = 'Cuenca'
-- Localidad que se repite muchas veces
SELECT codloca
FROM tramos JOIN localidades ON tramos.codloca = localidades.codloc
WHERE localidades.nombre = 'Madrid'
