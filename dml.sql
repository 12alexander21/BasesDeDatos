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

--

SELECT
FROM
WHERE
