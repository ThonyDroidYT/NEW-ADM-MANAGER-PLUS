#!/bin/bash
#VERIF VERSION
P_SERVER="https://www.admplus.tk"
v1=$(wget -qO- https://git.io/admplusv)
v2=$(cat /etc/ger-frm/version.txt)
v3=$(curl -sSL "${P_SERVER}/version.txt")
#Fun_Trans
fun_trans () { 
local texto
local retorno
declare -A texto
SCPdir="/etc/newadm"
SCPidioma="${SCPdir}/idioma"
[[ ! -e ${SCPidioma} ]] && touch ${SCPidioma}
local LINGUAGE=$(cat ${SCPidioma})
[[ -z $LINGUAGE ]] && LINGUAGE=es
[[ $LINGUAGE = "es" ]] && echo "$@" && return
[[ ! -e /usr/bin/trans ]] && wget -O /usr/bin/trans https://git.io/trans &> /dev/null
[[ ! -e /etc/texto-adm ]] && touch /etc/texto-adm
source /etc/texto-adm
if [[ -z "$(echo ${texto[$@]})" ]]; then
#ENGINES=(aspell google deepl bing spell hunspell apertium yandex)
#NUM="$(($RANDOM%${#ENGINES[@]}))"
retorno="$(source trans -e bing -b es:${LINGUAGE} "$@"|sed -e 's/[^a-z0-9 -]//ig' 2>/dev/null)"
echo "texto[$@]='$retorno'"  >> /etc/texto-adm
echo "$retorno"
else
echo "${texto[$@]}"
fi
}
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
version_admplusfix () {
[[ $v1 = $v2 ]] && vesaoSCT="\033[1;32m$(fun_trans "ACTUALIZADA")" || vesaoSCT="\033[1;31m!$(fun_trans "NO ACTUALIZADA")"
#msg -bar
msg -purple "$(fun_trans "ADM-Plus Versión Instalada:") \033[1;33m[\033[1;31m$(cat ${SCPfrm}/version.txt)\033[1;33m] \033[1;31m[${vesaoSCT}\033[1;31m]\033[0m"
#msg -bar
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
mejor="\033[1;31mMejorado:"
#CAMBIOS
cambios () {
clear
msg -bar
msg -verd "RESELLER: $mensaje"
msg -verd "KEY: \e[1;31m$key"
version_admplusfix
msg -bar
msg -azu "Lista de Cambios ${name} ${yellow}${version} ${plain}"
msg -bar
msg -ama "${add} ${yellow}SSLH"
msg -ama "${add} BADVPN - SOPORTE NETFLIX"
msg -ama "${mejor} CAMBIADOR DE COLORES"
msg -ama "${add} CAMBIADOR DE ZONA HORARIA"
msg -ama "${add} AGREGADOR DE MAS PUERTOS SSL"
msg -bar
}
cambios
