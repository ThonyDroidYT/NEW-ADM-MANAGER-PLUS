#!/bin/bash
# Funcoes Globais
msg () {
local colors="/etc/new-adm-color"
if [[ ! -e $colors ]]; then
COLOR[0]='\033[1;37m' #BRAN='\033[1;37m'
COLOR[1]='\e[31m' #VERMELHO='\e[31m'
COLOR[2]='\e[32m' #VERDE='\e[32m'
COLOR[3]='\e[33m' #AMARELO='\e[33m'
COLOR[4]='\e[34m' #AZUL='\e[34m'
COLOR[5]='\e[35m' #MAGENTA='\e[35m'
COLOR[6]='\033[1;36m' #MAG='\033[1;36m'
else
local COL=0
for number in $(cat $colors); do
case $number in
1)COLOR[$COL]='\033[1;37m';;
2)COLOR[$COL]='\e[31m';;
3)COLOR[$COL]='\e[32m';;
4)COLOR[$COL]='\e[33m';;
5)COLOR[$COL]='\e[34m';;
6)COLOR[$COL]='\e[35m';;
7)COLOR[$COL]='\033[1;36m';;
esac
let COL++
done
fi
NEGRITO='\e[1m'
SEMCOR='\e[0m'
 case $1 in
  #color new
  -azul)cor="\033[44m${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -rojo)cor="\033[1;41m${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -gris)cor="\033[1;100m${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -purple)cor="${COLOR[5]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  #fin color
  -ne)cor="${COLOR[1]}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${COLOR[3]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${COLOR[3]}${NEGRITO}[!] ${COLOR[1]}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm2)cor="${COLOR[1]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${COLOR[6]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azule)cor="${COLOR[4]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${COLOR[2]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -bra)cor="${COLOR[0]}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  "-bar2"|"-bar")cor="${COLOR[4]}=========================================================" && echo -e "${SEMCOR}${cor}${SEMCOR}";;
 esac
}

version2="\033[1;32m7.0"
version=$(wget -qO- https://git.io/admplusv)
key=$(cat /etc/newadm/key.txt)
mensaje=$(cat /etc/newadm/message.txt)
name="\033[1;32m[NEW-ADM-PLUS]"
plain="\033[0m"
cyan="\033[1;36m"
red="\033[1;31m"
purple="\033[1;35m"
yellow="\e[1;33m"
green="\033[1;32m"
add="\033[1;32mAgregado:"
fix="\033[1;31mCorregido:"
#CAMBIOS
cambios () {
clear
msg -bar
msg -verd "RESELLER: $mensaje"
msg -verd "KEY: \e[1;31m$key"
msg -bar
msg -azu "Lista de Cambios ${name} ${yellow}${version} ${plain}"
msg -bar
msg -ama "${add} ${yellow}SSLH"
msg -bar
}
cambios
