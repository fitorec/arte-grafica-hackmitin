#!/bin/bash
# Descripcion: instalar de fuentes y todo lo necesario para que los usuarios puedan
#              correr el arte grafica del hackmitin
#Autor:        fitorec
#

# Colores solo para que se distinga un poco mejor(creo yo) los procesos que
# realiza el script.
cyan='\e[0;36m'
light='\e[1;36m'
red="\e[0;31m\033[1m"
yellow="\e[0;33m"
white="\e[0;37m"
end='\e[0m'

############## seccion de funciones ###########################################

# Muestra un splash
function	splash() {
	splash=`ls "./splashes/" | sort -R | head -1`
	echo -e "${light}Arte graica Hackmitin 2012${end}";
	echo -ne "${red}\r"
	cat "./splashes/$splash"
	echo -e "${end}";
}
# Copia archivos de fuentes ttf a las carpeta del usuario
function copy_ttfs() {
	echo -e "${light}Copiando las fuentes .ttf a tu carpeta de usaurio${end}";
	for file in $(ls fonts)
	do
		echo -ne "${yellow}fuente ${file}${end}\t";
		if [ ! -f $HOME/.fonts/ ]
		then
			cp fonts/$file $HOME/.fonts/$file;
			echo -e "${cyan}Copiado${end}\t";
		else
			echo -e "${red}Archivo ya existente${end}\t";
		fi
		rm $HOME/.fonts/$file;
	done;
}
#####################################################################


splash;
copy_ttfs;
