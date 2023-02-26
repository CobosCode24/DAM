#/bin/bash

# ENUNCIADO EJERCICIO.

# Se crean todos los usuarios pasados en la lista de parámetros, siempre y cuando no existan.
# Para cada usuario lo vamos a añadir al grupo miEmpresa y crearemos un directorio de usuario
# con el mismo nombre que el usuario. Ese directorio estará en el directorio miEmpresa.
# Da los permisos necesarios a ese directorio para que:
#	Usuario: Todos los permisos.
#	Los demás: Nada (incluidos los de su grupo).


# Comprobamos que el Script está siendo ejecutado por el Administrador (root).
if [ $(id -u) -ne 0 ]; then
	echo "Error - El script debe ser ejecutado con permisos de Administrador."
	exit 1
fi


# Comprobamos que el numero de parámetros es al menos 1.
if [ $# -lt 1 ]; then
	echo "Error - Debes introducir al menos un parámetro."
	exit 1
fi


# Comprobamos si existe el grupo miEmpresa.
grupo=$(cat /etc/group | grep ^miEmpresa: | cut -d: -f1)
if [ "$grupo" == "miEmpresa" ]; then    #if [ -z $grupo ]
	groupadd miEmpresa
fi

    # Creo la carpeta empleados.
    dirEmpleado=/miEmpresa/empleados
    mkdir -p $dirEmpleado


# Comenzamos a recorrer la lista de parametros pasados, para así crear todos los usuarios que nos han pasado por parametros.
for usuario in $*; do

	# Si no existe el usuario lo creamos.
	if ! id $usuario &>/dev/null; then
		adduser $usuario
	fi
	# CReamos el directorio /miEmpresa/empleados/pepito.
	mkdir -p $dirEmpleado/$usuario
	# Añadimos el usuario al grupo miEmpresa.
	adduser $usuario miEmpresa &>/dev/null
	# Ponemos que el propietario de la carpeta /miEmpresa/empleados/pepito sea pepito y nadie mas.
	chown $usuario $dirEmpleado/$usuario
	# Asignamos que pepito tenga todos los permisos en la carpeta /miEpresa/empleados/pepito 
	chmod 700 $dirEmpleado/$usuario
done
