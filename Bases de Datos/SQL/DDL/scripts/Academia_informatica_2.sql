/*
Crear las tablas para una academia donde se imparten distintos cursos de la especialidad de informática. La estructura de la base de datos está compuesta por las siguientes tablas:

> Tabla Alumnos recogerá información sobre el alumnado: nombre, apellido1, apellido2, NIF, dirección, sexo, fecha de nacimiento y curso en el que se matricula.
> Tabla Cursos con los siguientes campos: nombre del curso, código del curso, NIF del profesor, máximo número de alumnos recomendados, fecha de inicio, fecha final, número de horas totales del curso. Los alumnos no pueden compaginar varios cursos a la vez.
> Tabla Profesores con los siguientes campos: nombre, apellido1, apellido2, NIF, dirección, titulación y salario.

Se pide:
a) Elegir los nombres más adecuados para los atributos teniendo en cuenta las reglas.

b) Elegir los tipos de datos adecuados en función del contenido de los campos.

c) Debes establecer las siguientes restricciones:
    1. El alumno debe matricularse en un curso en el momento de darse de alta.
    2. En un curso, el número de horas es un dato que no puede faltar, es obligatorio que
    contenga información.
    3. En la tabla profesores, el atributo salario no puede estar vacío.
    4. Dos cursos no pueden llamarse de la misma forma.
    5. Dos profesores no pueden llamarse igual.
    6. Se diferencian las tuplas de la tabla cursos por el código del curso.
    7. Se diferencian las tuplas de la tabla profesores y alumnos por el NIF.
    8. La fecha de comienzo del curso debe ser menor que la fecha de finalización.
    9. El dominio del atributo sexo es M(mujer) y H(hombre).

d) Se pide realizar los siguientes cambios:
    1. Crear un nuevo atributo llamado “edad” de tipo numérico a la tabla alumnos.
    2. Modifica el campo número de horas del curso de manera que solo pueda haber
    cursos con 30, 40 o 60 horas.
    3. Modifica el campo edad del alumno para que su valor esté comprendido entre 14 y
    65 años.
    4. No podemos añadir un curso si su número máximo de alumnos es inferior a 15.
    5. Elimina la restricción que controla los valores que puede tomar el atributo sexo.
    6. Elimina la columna dirección de la tabla profesores.
    7. Cambia la clave primaria de la tabla profesores por nombre y apellidos.
    8. Renombre la tabla profesores por tutores.
    9. Elimina la tabla alumnos.
*/

CREATE TABLE Profesores(
    NIF char(9) PRIMARY KEY,
    Nombre varchar(50) NOT NULL,
    Apellidos1 varchar(50) NOT NULL,
    Apellidos2 varchar(50),
    Direccion varchar(50) NOT NULL,
    Titulacion varchar(50) NOT NULL,
    Salario decimal(9,2) NOT NULL,
    CONSTRAINT Nombre_Unico UNIQUE(Nombre,Apellidos1)
);

CREATE TABLE Cursos(
    Codigo int(3) PRIMARY KEY AUTO_INCREMENT,
    Nombre varchar(50) UNIQUE,
    NIF_Profesor char(9) NOT NULL,
    Max_Alum int(3) NOT NULL,
    Fecha_Inicio date NOT NULL,
    Fecha_Fin date NOT NULL,
    Horas number(3) NOT NULL,
    CONSTRAINT cursos_ck CHECK (Fecha_Inicio < Fecha_Fin)
    CONSTRAINT fk_profesores FOREIGN KEY (NIFProfesor) REFERENCES Profesores(NIF)
);

CREATE TABLE Alumnos(
    NIF char(9) PRIMARY KEY,
    Nombre varchar(50) NOT NULL,
    Apellidos1 varchar(50) NOT NULL,
    Apellidos2 varchar(50),
    Direccion varchar(50) NOT NULL,
    Sexo varchar(1) NOT NULL,
    Fecha_Nac date NOT NULL,
    Cod_Curso int(3) NOT NULL,
    CONSTRAINT fk_cursos FOREIGN KEY (CodCurso) REFERENCES Cursos(Codigo), 
    CONSTRAINT ck_sexo CHECK (Sexo IN ('M','H'))
);

ALTER TABLE Alumnos ADD (Edad int(2));

ALTER TABLE Cursos ADD CONSTRAINT ck_horas CHECK (Horas IN (30,40,60));

ALTER TABLE Alumnos MODIFY (Edad int(2) CONSTRAINT ck_edad CHECK (Edad BETWEEN 14 and 65));

ALTER TABLE Cursos ADD CONSTRAINT ck_num_alumnos CHECK (Max_alumnos <=15);

ALTER TABLE Cursos DROP CONSTRAINT ck_sexo;

ALTER TABLE Profesores DROP COLUMN Direccion;

ALTER TABLE Cursos DROP CONSTRAINT fk_profesores;
ALTER TABLE Profesores DROP CONSTRAINT profesores_pk;
ALTER TABLE Profesores ADD CONSTRAINT PRIMARY KEY(Nombre,Apellidos1,Apellidos2);

RENAME Profesores TO Tutores;

DROP TABLE Alumnos;
