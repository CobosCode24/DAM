#!/bin/bash

# Comprobamos si el usuario que ejecuta el script es root.
if [ $(id -u) -ne 0 ]; then
	echo "Error - EL usuario que ejecuta el Script no es Administrador."
	exit 1
fi


# Comprobamos que ha pasado un parámetro.
if [ $# -eq 1 ]; then
	usuario=$1
else
	echo "Error - Tienes que introducir un parámetro."
	exit 1
fi


# Comprobamos que el usuario que hemos pasado por parámetros existe en el sistema.
if ! id $usuario &>/dev/null; then
	echo "Error - El usuario $usuario no existe en el sistema."
	exit 1
fi


# Una vez comprobado que el usuario existe, ha pasado un parametro, y lo esta ejecutando un Admin, creamos las carpetas en el home del usuaio.
dirHome=/home/$usuario
	echo "Creando directorios Ciclo, Proyectos y pruebas en el directorio del usuario $usuario."
	mkdir -p $dirHome/{Ciclo, Proyectos, Pruebas}
	echo "Bienvenido al sistema $usuario" > $dirHome/leeme.txt
	cp $dirHome/leeme.txt $dirHome/Ciclo
	cp $dirHome/leeme.txt $dirHome/Proyectos
	cp $dirHome/leeme.txt $dirHome/Pruebas
	mkdir -p $dirHome/Ciclos{2022,2023}/{SI,FOL,PROG,BBDD,LM,EEDD}
	chown -r $usuario:$usuario $dirHome/{Ciclos, Proyectos, Pruebas}
