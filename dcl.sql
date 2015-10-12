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
