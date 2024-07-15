start transaction;

CREATE TABLE autor (
    documento bigint NOT NULL PRIMARY KEY
);


CREATE TABLE editorial (
    codigo integer NOT NULL PRIMARY KEY, 
    nombre character varying(50)
);

CREATE TABLE revista (
    issn bigint NOT NULL PRIMARY KEY,
    nombre character varying(50),
    editorial integer REFERENCES editorial(codigo) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE libro (
    isbn bigint NOT NULL PRIMARY KEY,
    nombre character varying(50),
    editorial integer REFERENCES editorial(codigo) ON UPDATE CASCADE ON DELETE RESTRICT,
    autor integer REFERENCES autor(documento) ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE numero (
    revista bigint NOT NULL REFERENCES revista(issn) ON UPDATE CASCADE ON DELETE CASCADE,
    numero integer NOT NULL,
    fecha date NOT NULL,
    paginas integer NOT NULL,
    PRIMARY KEY (revista, numero)
);


CREATE TABLE persona (
    documento bigint NOT NULL PRIMARY KEY, 
    nombre character varying(50)
);


commit;