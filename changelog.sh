#!/bin/bash
SCPdir="/etc/newadm" #&& [[ ! -d ${SCPdir} ]] && exit
SCPfrm="/etc/ger-frm" #&& [[ ! -d ${SCPfrm} ]] && exit
SCPinst="/etc/ger-inst" #&& [[ ! -d ${SCPinst} ]] && exit
SCPusr="/etc/ger-user" #&& [[ ! -d ${SCPusr} ]] && exit
#VERIF VERSION
P_SERVER="https://www.admplus.tk"
v1=$(wget -qO- https://git.io/admplusv)
v2=$(cat /etc/ger-frm/version.txt)
v3=$(curl -sSL "${P_SERVER}/version.txt")
version_admplusfix () {
[[ $v1 = $v2 ]] && vesaoSCT="\033[1;32m$(fun_trans "ACTUALIZADA")" || vesaoSCT="\033[1;31m!$(fun_trans "NO ACTUALIZADA")"
#msg -bar
msg -ama "$(fun_trans "ADM-Plus Versión Instalada:") \033[1;33m[\033[1;31m$(cat /etc/ger-frm/version.txt)\033[1;33m] \033[1;31m[${vesaoSCT}\033[1;31m]\033[0m"
#msg -bar
}
version2="\033[1;32m7.0"
#version=$(wget -qO- https://git.io/admplusv)
version=$(curl -sSL "https://git.io/admplusv")
update1=$(wget -qO- https://www.admplus.tk/update.txt)
key=$(cat /etc/newadm/key.txt)
mensaje=$(cat /etc/newadm/message.txt)
name="\033[1;32m[NEW-ADMPlus]"
plain="\033[0m"
cyan="\033[1;36m"
red="\033[1;31m"
purple="\033[1;35m"
yellow="\e[1;33m"
green="\033[1;32m"
add="$(msg -verd "$(fun_trans "Agregado"):")"
fix="$(msg -verm2 "$(fun_trans "Corregido"):")"
mejor="$(msg -purple "$(fun_trans "Mejorado"):")"
#UPDATE
update="[29/05/2021]"
#CAMBIOS
cambios () {
clear
#msg -ama "\033[44m              $(fun_trans "CRÉDITOS Y REGISTRO DE CAMBIOS")             "
msg -bar
msg -ama "\033[1;100m              $(fun_trans "CRÉDITOS Y REGISTRO DE CAMBIOS")             "
msg -bar
msg -verm2 "$(fun_trans "RESELLER AUTORIZADO"): $(msg -bra "$mensaje")"
msg -verm2 "$(fun_trans "KEY USADA"): $(msg -bra "$key")"
version_admplusfix
msg -bar
msg -azu "$(fun_trans "Lista de Cambios") ${name} ${yellow}${version} ${cyan}${update} ${plain}"
msg -bar
msg -ama "${add} $(msg -ama "$(fun_trans "Cosas nuevas xd")")"
msg -bar
msg -azu "$(fun_trans "Lista de Cambios") ${name} ${yellow}v7.2 ${cyan}[21/02/2021] ${plain}"
msg -bar
msg -ama "${add} $(msg -ama "$(fun_trans "SSLH MULTIPLEX")")"
msg -ama "${add} $(msg -ama "$(fun_trans "BADVPN - SOPORTE NETFLIX")")"
msg -ama "${mejor} $(msg -ama "$(fun_trans "CAMBIADOR DE COLORES")")"
msg -ama "${add} $(msg -ama "$(fun_trans "CAMBIADOR DE ZONA HORARIA")")"
msg -ama "${add} $(msg -ama "$(fun_trans "AGREGADOR DE MAS PUERTOS SSL")")"
msg -bar
}
cambios
