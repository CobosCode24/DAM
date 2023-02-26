DROP DATABASE IF EXISTS proveedores;
CREATE DATABASE proveedores CHARSET utf8mb4;
USE proveedores;

CREATE TABLE categoria (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE pieza (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    color  VARCHAR(50) NOT NULL,
    precio DECIMAL(7,2) NOT NULL CHECK (precio > 0),
    codigo_categoria INT UNSIGNED NOT NULL,
    FOREIGN KEY (codigo_categoria) REFERENCES
    categoria(codigo)
);