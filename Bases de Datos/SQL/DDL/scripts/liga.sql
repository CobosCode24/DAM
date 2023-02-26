/*
La liga de futbol promesa de Extremadura quiere diseñar un sistema de gestión que les permite almacenar la información de equipos, jugadores, partidos y estadísticas.
Se nos proporciona las siguientes tablas:

EQUIPOS (nombre, ciudad, conferencia, división)
ESTADISTICAS (temporada, juugador, puntos_por_partido, asistencias_por_partido, tapones_por_partido, Rebotes_por_partido)
JUGADORES (codigo, Nombre, Procedencia, Altura, Peso, Posición, Nombre_equipo)
PARTIDOS (codigo, equipo_local, equipo_visitante, puntos_local, puntos_visitante, temporada)

Se pide:
> Realizar el diseño físico usando SQL.
*/

CREATE DATABASE IF NOT EXISTS LIGA;
USE LIGA;

CREATE TABLE equipos (
    Nombre VARCHAR(60) PRIMARY KEY,
    Ciudad varchar(60),
    Conferencia varchar(12),
    Division varchar(27)
);

CREATE TABLE jugadores(
    Codigo int(11) PRIMARY KEY,
    Nombre varchar(90) NOT NULL,
    Procedencia varchar(60),
    Altura INT(3),
    Peso int(11)
    Posicion varchar(15),
    Nombre_equipo varchar(60),
    CONSTRAINT Nombre_jugadores_fk FOREIGN KEY (Nombre_equipo)
    REFERENCES Equipos(Nombre)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE estadisticas(
    Temporada varchar(15) PRIMARY KEY,
    Jugador int (11),
    Puntos_por_partido double,
    Asistencias_por_partido double,
    Tapones_por_partido double,
    Rebotes_por_partido double,
    CONSTRAINT Jugador_estadisticas_fk FOREIGN KEY (Jugador)
    REFERENCES jugadores (Codigo) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

CREATE TABLE partidos(
    Codigo int(11) PRIMARY KEY,
    Equipo_local varchar(60),
    Equipo_visitante varchar(60),
    puntos_local int(11),
    puntos_visitante int(11),
    temporada varchar(15),
    CONSTRAINT Equipo_local_partidos_fk FOREIGN KEY (Equipo_local)
    REFERENCES equipos (Nombre) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    CONSTRAINT Equipo_visitante_partidos_fk FOREIGN KEY (Equipo_visitante) REFERENCES equipos (Nombre) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);
