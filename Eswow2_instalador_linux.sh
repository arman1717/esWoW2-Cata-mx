#!/bin/bash

user="" #user de mysql
pass="" #contraseña mysql
wdb="" #db del mundo
sd2db="" #db de lo ScriptDev2
server="localhost" #Servidor mysql
port="3306" #Puerto mysql

#No tocar

archivos="./PSDB/"

############################################################################
#
# Main program
#
############################################################################
until [ "${option}" = "x" ]; do
echo " i - Instalar Eswow2 Rev.1 Beta Cataclysm"
echo
read -p " Selecciona una opcion: " option

#OPCION i

if [ "${option}" = "i" ]; then

	max=`ls -1 "${archivos}"/*.sql | wc -l`
	i=0
	for table in "${archivos}"/*.sql; do
		i=$((${i}+1))
		echo " [${i}/${max}] importando: ${table##*/}"
		mysql -h ${server} --user=${user} --port=${port} --password=${pass} ${wdb} < "${table}"
	done

	echo

	echo " Se han instalado las traducciones"

fi
done