DROP DATABASE IF EXISTS agencia;
CREATE DATABASE agencia CHARSET utf8mb4;
USE agencia;

CREATE TABLE turista (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(9) NOT NULL
);

CREATE TABLE hotel (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    ciudad VARCHAR(25) NOT NULL,
    plazas INTEGER NOT NULL,
    telefono VARCHAR(9) NOT NULL
);
CREATE TABLE reserva (
    id_turista INT UNSIGNED NOT NULL,
    id_hotel INT UNSIGNED NOT NULL,
    fecha_entrada DATETIME NOT NULL,
    fecha_salida DATETIME NOT NULL,
    regimen ENUM('MP', 'PC'),
    PRIMARY KEY (id_turista,id_hotel),
    FOREIGN KEY (id_turista) REFERENCES turista(id),
    FOREIGN KEY (id_hotel) REFERENCES hotel(id)
);