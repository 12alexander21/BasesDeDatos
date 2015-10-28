--Obtener el nombre de los empleados que hayan repartido al bar Stop durante
--la semana del 17 al 23 de octubre de 2005.

-- Subconsultas
SELECT nombre
FROM empleados
WHERE code IN (
  SELECT code
  FROM reparto
  WHERE fecha BETWEEN '2005-10-17' AND '2005-10-23'
  AND codb IN(
    SELECT codb
    FROM bares
    WHERE nombre = 'stop'
))

-- union natural
SELECT e.nombre
FROM empleados e, reparto r, bares b
WHERE r.code = e.code AND
      r.codb = b.codb AND
      r.fecha BETWEEN '2005-10-17' AND '2005-10-23' AND
      b.nombre = 'Stop'

-- JOIN
SELECT DISTINCT e.nombre
FROM empleados e JOIN reparto ON r.code = e.code
     JOIN bares b ON r.codb = b.codb
WHERE r.fecha BETWEEN '2005-10-17' AND '2005-10-23' AND
      b.nombre = 'Stop'


-- Obtener el Cif y nombre de los bares a los que se ha repartido cerveza de
--tipo Botella y capacidad inferior a 1 litro, ordenados por localidad.
-- JOIN
SELECT b.nombre,



-- Obtener los repartos (nombre del bar, envase y capacidad de la bebida,
--fecha y cantidad) realizados por Prudencio Camionero.

SELECT b.nombre, c.envase, c.capacidad, r.fecha, r.cantidad
FROM reparto r, bares b, cervezas c, envases e


--Obtener los bares a los que se les ha repartido envases de tipo botella y
--capacidad 0.2 ó 0.33.
-- Subconsultas
SELECT nombre
FROM bares
WHERE codb IN(
  SELECT codb
  FROM reparto
  WHERE codc IN(
    SELECT codc
    FROM crevezas
    WHERE envase = 'Botella' AND
          capacidad IN (0.2, 0.33)
))



-- Obtener el nombre y número de viajes que ha realizado cada empleado fuera de Villa Botijo.

SELECT e.nombre, COUNT(r.code) AS "viajes"
FROM reparto r, bares b, empleados e
WHERE r.code = e.code AND
      r.codb = b.codb AND
      b.localidad != 'Villa Botijo'
GROUP BY (e.nombre)
