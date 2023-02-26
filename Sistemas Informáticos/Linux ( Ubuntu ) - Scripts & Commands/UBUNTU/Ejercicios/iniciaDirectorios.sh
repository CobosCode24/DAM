#!/bin/bash

# Nos situamos en la carpeta personal.
cd $HOME


# Creamos tres carpetas.
# El parámetro -p es para que en el caso de que existan esas carpetas, no de error y las cree de nuevo.
mkdir -p Ciclo Proyectos Pruebas


# Creamos un fichero llamado leeme.txt que da la bienvenida al usuario.
echo "Bienvenido al sistema $USER." > leeme.txt


# Copiamos el fichero leeme.txt en cada una de las carpetas creadas al inicio.
cp leeme.txt Ciclo
cp leeme.txt Proyectos
cp leeme.txt Pruebas


# Creamos una red de subcarpetas con los nombres que queremos.
# La estructura siempre es:
# carpetaContenedora/{carpetaHija, carpetaHija2,....}/{CarpetaNieta,CarpetaNieta,....}
mkdir -p ciclo/{2022,2023}/{SI,PROG,BBDD,EEDD,LM}
