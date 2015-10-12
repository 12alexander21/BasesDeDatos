CREATE TABLE localidades(
	codloc integer NOT NULL PRIMARY KEY,
	nombre text NOT NULL,
	censo integer NOT NULL,
	habitantes integer NOT NULL,
	codprov int NOT NULL
);

CREATE TABLE provinicias(
	codprov integer NOT NULL PRIMARY KEY,
	nombreP text NOT NULL,
	comunidad text NOT NULL
);

ALTER TABLE localidades
ADD CONSTRAINT fk_provincia FOREIGN KEY (codeprov)
REFERENCES provincias(codprov);

CREATE TABLE tramos (
	codloca integer NOT NULL,
	codlocb integer NOT NULL,
	distancia decimal(5,2) NOT NULL,
	PRIMARY KEY(codloca, codlocb)
);

ALTER TABLE tramos
ADD CONSTRAINT fk_loca FOREIGN KEY (codloca)
REFERENCES localidades(codloc)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE tramos
ADD CONSTRAINT fk_locb FOREIGN KEY (codlocb)
REFERENCES localidades(codloc);









CREATE TABLE sazon(
	idSazon integer NOT NULL PRIMARY KEY,
	nombre text NOT NULL,
	popularidad integer NOT NULL
);


CREATE TABLE barco(
	idBarco integer NOT NULL PRIMARY KEY,
	material text NOT NULL,
	capacidad integer NOT NULL
);


CREATE TABLE pais(
	nombre text NOT NULL  PRIMARY KEY,
	habitantes integer NOT NULL
);


CREATE TABLE pescador(
	idPescador integer NOT NULL PRIMARY KEY,
	nombre text NOT NULL,
	apellido text NOT NULL,
	tamanio integer NOT NULL,
	pais_fk text NOT NULL,
	barco_fk integer NOT NULL,
	popularidad integer NOT NULL
);


CREATE TABLE pez(
	idPez integer NOT NULL PRIMARY KEY,
	nombre text NOT NULL,
	especie text NOT NULL,
	idsazon integer NOT NULL,
	idpescador integer NOT NULL,
	edad integer NOT NULL
);

ALTER TABLE pez
ADD CONSTRAINT sazon_fk FOREIGN KEY (idsazon)
REFERENCES sazon (idsazon);

ALTER TABLE pescador
ADD CONSTRAINT pais_fk FOREIGN KEY (nombre)
REFERENCES pais (nombre);

ALTER TABLE pescador
ADD CONSTRAINT barco_fk FOREIGN KEY (idbarco)
REFERENCES barco (idbarco);


ALTER TABLE pez
ADD CONSTRAINT pescador_fk FOREIGN KEY (idpescador)
REFERENCES pescador (idpescador);
