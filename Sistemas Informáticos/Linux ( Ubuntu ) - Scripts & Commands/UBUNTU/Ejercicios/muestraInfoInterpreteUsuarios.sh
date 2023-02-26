#!/bin/bash

# Este Script muestra informacion de los usuarios del sistema que utilizan como intérprete /bin/bash
# -w          --> es para buscar una palabra.
# /bin/bash$  --> Es el string que va a buscar.
# Cuando se pone $ es porque queremos que termine justo ahí el String a buscar.
# /etc/passwd --> Es en que fichero lo va a buscar.
# -d          --> Es el delimitador. En este caso la informacion que queremos está delimitada por :
# -f 	      --> Indicamos el numero del campo que vamos a cortar.
# Cuando se pone $(...comandos...) es porque lo de dentro del () devuelve un derminado valor.

for linea in $(grep -w /bin/bash$ /etc/passwd); do
	nombre_usuario=$(echo $linea | cut -d: -f1)
	id_usuario=$(echo $linea | cut -d: -f3)
	home_usuario=$(echo $linea | cut -d: -f6)

	echo "El nombre del usuario es: $nombre_usuario."
	echo "El id del usuario es: $id_usuario."
	echo "El home del usuario es: $home_usuario."
	echo ""
done
