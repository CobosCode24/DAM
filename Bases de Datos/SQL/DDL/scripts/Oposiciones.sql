/*
La Consejería de Educación y Empleo desea automatizar los procesos de oposición almacenando la información de los opositores, tribunales, exámenes y notas. Se nos proporcionan las siguientes tablas sin conexión alguna.

examenes (
    CODIGOEXA tinyint(4) PRIMARY KEY
    DESCRIPCIONEXA varchar(50)
)

tribunales (
    CODIGOTRIBUNAL tinyint(4) PRIMARY KEY
    PRESIDENTE varchar(50)
    SECRETARIO varchar(50)
    VOCAL1 varchar(50)
    VOCAL2 varchar(50)
    VOCAL3 varchar(50)
)

opositores (
    DNI char(9) PRIMARY KEY,
    NOMBRE varchar(255)
    CIUDAD varchar(255)
    TELEFONO varchar(14)
    TRIBUNALOPOSITOR tinyint(4) FOREIGN KEY
)

notas(
    DNIOPOSITOR char(9) FK
    CODIGOEXAMEN tinyint(4) FK
    NOTA tinyint(4),
    PRIMARY KEY DNIOPOSITOR y CODIGOEXAMEN
)

Se pide:
> Realizar el diseño físico usando SQL. 
> Inserta filas en todas las tablas en el orden correcto, teniendo en cuenta que haya notas de suspensos y aprobados. Al menos 10 opositores, 3 tribunales, 2 exámenes y se presentan todos los opositores. 
> Muestra los valores de todas las tablas.
> Borra a todos los opositores que hayan suspendido.

*/

CREATE DATABASE Oposiciones;
USE Oposiciones;

CREATE TABLE examenes (
    CODIGOEXA tinyint(4) PRIMARY KEY,
    DESCRIPCIONEXA varchar(50) NOT NULL,
    CONSTRAINT uq_descripcion UNIQUE (DESCRIPCIONEXA)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE tribunales (
    CODIGOTRIBUNAL tinyint(4) PRIMARY KEY,
    PRESIDENTE varchar(50) NOT NULL,
    SECRETARIO varchar(50) NOT NULL,
    VOCAL1 varchar(50) NOT NULL,
    VOCAL2 varchar(50) NOT NULL,
    VOCAL3 varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE opositores (
    DNI char(9) PRIMARY KEY,
    NOMBRE varchar(255) NOT NULL,
    CIUDAD varchar(255) NOT NULL,
    TELEFONO varchar(14) NOT NULL,
    TRIBUNALOPOSITOR tinyint(4) NOT NULL,
    CONSTRAINT fk_opositores_TRIBUNALOPOSITOR FOREIGN KEY (TRIBUNALOPOSITOR) REFERENCES tribunales (CODIGOTRIBUNAL) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE notas(
    DNIOPOSITOR char(9) NOT NULL,
    CODIGOEXAMEN tinyint(4) NOT NULL,
    NOTA tinyint(4) NOT NULL,
    PRIMARY KEY (DNIOPOSITOR, CODIGOEXAMEN),
    CONSTRAINT fk_notas_DNI FOREIGN KEY (DNIOPOSITOR) REFERENCES opositores(DNI),
    CONSTRAINT fk_notas_CODIGOEXA FOREIGN KEY (CODIGOEXAMEN) REFERENCES examenes (CODIGOEXA)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO TABLE tribunales VALUES (1,’Presidente1’,’Secretario1’,’Vocal11’,’Vocal21’,’Vocal31’);
INSERT INTO TABLE tribunales VALUES (2,’Presidente2’,’Secretario2’,’Vocal21’,’Vocal22’,’Vocal32’);
INSERT INTO TABLE tribunales VALUES (3,’Presidente3’,’Secretario3’,’Vocal13’,’Vocal23’,’Vocal33’);


INSERT INTO TABLE examenes VALUES (1,’DESCRIPCIONEXA1’);
INSERT INTO TABLE examenes VALUES (2,’DESCRIPCIONEXA2’);
INSERT INTO TABLE examenes VALUES (3,’DESCRIPCIONEXA3’);


INSERT INTO TABLE opositores VALUES (‘12345678A’,‘OPOSITOR1’,‘CIUDAD1’,‘627515154’,1);
INSERT INTO TABLE opositores VALUES (‘22345678B’,‘OPOSITOR2’,‘CIUDAD2’,‘627515155’,1);
INSERT INTO TABLE opositores VALUES (‘32345678C’,‘OPOSITOR3’,‘CIUDAD3’,‘627515156’,1);
INSERT INTO TABLE opositores VALUES (‘12345679A’,‘OPOSITOR4’,‘CIUDAD4’,‘627515156’,2);
INSERT INTO TABLE opositores VALUES (‘22348678B’,‘OPOSITOR5’,‘CIUDAD5’,‘627515555’,2);
INSERT INTO TABLE opositores VALUES (‘32345678C’,‘OPOSITOR6’,‘CIUDAD6’,‘627516666’,2);
INSERT INTO TABLE opositores VALUES (‘11345679A’,‘OPOSITOR7’,‘CIUDAD7’,‘627517777’,3);
INSERT INTO TABLE opositores VALUES (‘22248678B’,‘OPOSITOR8’,‘CIUDAD8’,‘627518888’,3);
INSERT INTO TABLE opositores VALUES (‘32339998F’,‘OPOSITOR9’,‘CIUDAD9’,‘627519999’,3);
INSERT INTO TABLE opositores VALUES (‘32335698D’,‘OPOSITOR10’,‘CIUDAD10’,‘627511010’,3);


INSERT INTO TABLE notas VALUES (‘32335698D’,1,1);
INSERT INTO TABLE notas VALUES (‘32339998F’,1,5);
INSERT INTO TABLE notas VALUES (‘22248678B’,1,8);

INSERT INTO TABLE notas VALUES (‘32335698D’,2,4);
INSERT INTO TABLE notas VALUES (‘11345679A’,2,8);
INSERT INTO TABLE notas VALUES (‘32345678C’,2,9);
INSERT INTO TABLE notas VALUES (‘32345678C’,2,4);

INSERT INTO TABLE notas VALUES (‘32335698D’,3,4);
INSERT INTO TABLE notas VALUES (‘11345679A’,3,8);
INSERT INTO TABLE notas VALUES (‘32345678C’,3,9);
INSERT INTO TABLE notas (DNIOPOSITOR, CODIGOEXAMEN, NOTA) VALUES (‘32345678C’,3,6);


SELECT * FROM tribunales;
SELECT * FROM examenes;
SELECT * FROM notas;
SELECT * FROM opositores;


DELETE FROM Opositores
WHERE DNI IN (
    SELECT DNIOPOSITOR 
    FROM notas 
    WHERE CODIGOEXAMEN=1 AND NOTA<5
);