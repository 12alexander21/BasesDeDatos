-- Bitacora
CREATE TABLE LOG (
  id serial PRIMARY KEY,
  facha timestamp DEFAULT now(),
  usuario text NOT NULL,
  tabla text NOT NULL,
  operacion char NOT NULL
);

-- Triger function
-- ponemos click derecho, crear trigger function
BEGIN
  INSERT INTO log (usuario, tabla, operacion)
  VALUES (USER, TG_TABLE_NAME, TG_OP);

  RETURN new;
END





BEGIN
  DECLARE stock int := 0;
  SELECT stock INTO stock_actual FROM cervezas WHERE NEW.codc = codc;
  IF (stock_actual < NEW.cantidad) THEN
    RAISE NOTICE 'no hay stock suficiente de la cerveza con código %', NEW.codc ;
  END IF;
  RETURN NEW;
END
