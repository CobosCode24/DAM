/*
La empresa BAK formación desea informatizar las matriculaciones de los cursos de formación que ofrece la empresa. 
Se nos proporciona la siguiente información:
    Alumnos     (DNI, Nombre, Dirección, Localidad, Código_postal)
    Cursos      (Código, Nombre, Precio, Horas, Materia)
    Ediciones   (NúmeroEdición, CódigoCurso, FechaInicio, FechaFin, CódigoProfesor)
    Matrículas  (NúmeroEdición, CódigoCurso, DNIAlumno, Pagado)
    Profesores  (Código, Nombre, Titulación, Teléfono).

Ten en cuenta:
> Ningún campo debe permitir nulos.
> Los cursos tienen ediciones y los alumnos se matriculan en ediciones de cursos, o sea, la tabla Matrículas está relacionada con Ediciones, no con Cursos. También existe una relación entre Matrículas y Alumnos.
> El campo Pagado de la tabla Matrículas debe permitir únicamente los valores Sí o No. Por defecto No.
> Los campos Código de curso y código de profesor se autoincrementarán.
> Los campos que guardan fechas deben tener un tipo de datos acorde con el valor que almacenan.

Todas las relaciones se crearán con la acción referencial NO ACTION, salvo la existente entre Ediciones y Matrículas que será CASCADE tanto para borrado como para actualización.
Añade un índice a la tabla Cursos que facilite búsquedas frecuentes por Nombre sin duplicados.
*/

CREATE DATABASE IF NOT EXISTS Bak;
USE Bak;

DROP TABLE IF EXISTS Alumnos;
CREATE TABLE Alumnos(
    DNI char(9) PRIMARY KEY,
    Nombre varchar(25) NOT NULL,
    Direccion varchar(100) NOT NULL,
    Localidad varchar(50) NOT NULL,
    Codigo_Postal varchar(5) NOT NULL
);

DROP TABLE IF EXISTS Cursos;
CREATE TABLE Cursos(
    Codigo int(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre varchar(25) NOT NULL,
    Precio decimal (3,2) NOT NULL,
    Horas varchar(3) NOT NULL,
    Material varchar(25) NOT NULL
);

DROP TABLE IF EXISTS Profesores;
CREATE TABLE Profesores(
    Codigo int(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre varchar(25) NOT NULL,
    Titulacion varchar(50) NOT NULL,
    Telefono varchar(9) NOT NULL
);

DROP TABLE IF EXISTS Ediciones;
CREATE TABLE Ediciones(
    Numero_Edicion int(4) NOT NULL,
    Fecha_Inicio date NOT NULL,
    Fecha_Fin date NOT NULL,
    Codigo_Curso int(4) NOT NULL
    Codigo_Profesor int(4) NOT NULL,
    CONSTRAINT pk_ediciones PRIMARY KEY (Numero_Edicion,Codigo_Curso),
    CONSTRAINT Codigo_Curso_ediciones_fk FOREIGN KEY (Codigo_Curso) REFERENCES Cursos(Codigo)
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION,
    CONSTRAINT Codigo_Profesor_ediciones_fk FOREIGN KEY (Codigo_Profesor) REFERENCES Profesores(Codigo) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION
);

DROP TABLE IF EXISTS Matriculas;
CREATE TABLE Matriculas(
    Numero_Edicion int(4) NOT NULL,
    Codigo_Curso int(4) NOT NULL,
    DNI_Alumno varchar(9) NOT NULL,
    Pagado enum ('Si','No') NOT NULL DEFAULT 'No',
    PRIMARY KEY (Numero_Edicion, Codigo_Curso, DNI_Alumno),
    FOREIGN KEY (Numero_Edicion,Codigo_Curso)
    REFERENCES Ediciones(Numero_Edicion,Codigo_Curso)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (DNI_Alumno)
    REFERENCES Alumnos(DNI)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

ALTER TABLE Cursos ADD UNIQUE INDEX idx_Nombres (Nombre);
