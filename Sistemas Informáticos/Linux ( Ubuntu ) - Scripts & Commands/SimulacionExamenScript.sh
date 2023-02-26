#!/bin/bash

##########################

# Comprobamos si lel usuario que ejecuta el script es root.
if [ $(id -u) -ne 0 ]; then
	echo "Error - El usuario que ejecuta el script debe ser administrador."
	exit 1
fi

function mostrarmenu (){
	clear
	echo "Menu de opciones:"
	echo
	echo "1. Crear rama de directorios."
	echo "2. Pedir nombre de usuario por pantalla. Si existe saludar, si no crearlo."
	echo "3. Crear examen.txt y cambiar de propietario del fichero al id 1002."
	echo "4. MOstrar fecha del sistema."
	echo
	echo "Pulsa ENTER sin insertar opción para salir"
}

function hacerop(){
	case $operacion in
	1)
	
	echo "Redirigiendo al directorio HOME del usuario..."
	homeusu=/home/manuel

	echo "Creando los directorios..."
	mkdir -p $homeusu/examen/{test{batch,linux},script/menu}
	echo "Directorios Creados..."
	;;
	
	2)
	echo "Introduce un nombre de usuario: "
	read usuario
	userFind=$(cat /etc/passwd | grep $usuario: | cut -d: -f1)
	
	if [ "$userFind" == "$usuario" ]; then
		echo "Bienvenido al sistema $usuario. "
		exit 1
	fi
	adduser $usuario
	echo "Nuevo usuario creado."	
	;;
	
	3)
	
	touch examen.txt
	user_id=$( cat /etc/passwd | grep 1002 | cut -d: -f3)
	if [ "$user_id" != "1002" ]; then
		echo "No se puede asignar el fichero examen.txt al usuario con id 1002. "
		exit 1
	fi
	
	name_user=$( cat /etc/passwd | grep 1002 | cut -d: -f1 )
	chown $name_user examen.txt
	;;
	
	4)

	echo "La fecha del sistema es --> " 
	date
	;;
	
	*)
	
	echo "Opcion incorrecta."
	
	;;
	esac
	echo
	read -p "Pulsa una tecla para continuar"
}

function leerop(){
	read -p "Inserta el codigo de operación a leer" operacion
}

mostrarmenu
leerop

while [ ! -z $operacion ]; do
	hacerop
	mostrarmenu
	leerop
done

##########################
