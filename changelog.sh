#!/bin/bash
SCPdir="/etc/newadm" #&& [[ ! -d ${SCPdir} ]] && exit
SCPfrm="/etc/ger-frm" #&& [[ ! -d ${SCPfrm} ]] && exit
SCPinst="/etc/ger-inst" #&& [[ ! -d ${SCPinst} ]] && exit
SCPusr="/etc/ger-user" #&& [[ ! -d ${SCPusr} ]] && exit
#VERIF VERSION
P_SERVER="https://www.admplus.tk"
v1=$(curl -sSL "https://git.io/admplusv")
v2=$(cat ${SCPfrm}/version.txt)
v3=$(curl -sSL "${P_SERVER}/version.txt")
version_admplusfix () {
[[ $v1 = $v2 ]] && vesaoSCT="$(msg -verd "$(fun_trans "ACTUALIZADA")")" || vesaoSCT="$(msg -verm2 "$(fun_trans "NO ACTUALIZADA")!")"
#[[ -e "$HOME/bar2" ]] && msg -bar2 || msg -bar
msg -purple "$(fun_trans "ADM-Plus Versión Instalada"): $(msg -ama "[")$(msg -verm2 "$(cat ${SCPfrm}/version.txt)")$(msg -ama "]") $(msg -verm2 "[")${vesaoSCT}$(msg -verm2 "]")"
#[[ -e "$HOME/bar2" ]] && msg -bar2 || msg -bar
}
version2="$(msg -verd "7.0")"
version=$(curl -sSL "https://git.io/admplusv")
update1=$(wget -qO- https://www.admplus.tk/update.txt)
key=$(cat ${SCPdir}/key.txt)
mensaje=$(cat ${SCPdir}/message.txt)
name="$(msg -verd "[NEW-ADMPlus]")"
add="$(msg -verd "$(fun_trans "Agregado"):")"
fix="$(msg -verm2 "$(fun_trans "Corregido"):")"
mejor="$(msg -purple "$(fun_trans "Mejorado"):")"
#UPDATE
update="[29/05/2021]"
#CAMBIOS
cambios () {
clear
#msg -ama "\033[44m              $(fun_trans "CRÉDITOS Y REGISTRO DE CAMBIOS")             "
[[ -e "$HOME/bar2" ]] && msg -bar2 || msg -bar
msg -ama "\033[1;100m              $(fun_trans "CRÉDITOS Y REGISTRO DE CAMBIOS")             "
[[ -e "$HOME/bar2" ]] && msg -bar2 || msg -bar
msg -verm2 "$(fun_trans "RESELLER AUTORIZADO"): $(msg -bra "$mensaje")"
msg -verm2 "$(fun_trans "KEY USADA"): $(msg -bra "$key")"
version_admplusfix
[[ -e "$HOME/bar2" ]] && msg -bar2 || msg -bar
msg -azu "$(fun_trans "Lista de Cambios") ${name} $(msg -ama "${version}") $(msg -azu "${update}")"
[[ -e "$HOME/bar2" ]] && msg -bar2 || msg -bar
msg -ama "${mejor} $(msg -ama "$(fun_trans "Instalador de Trojan")")"
msg -ama "${mejor} $(msg -ama "$(fun_trans "Creador de usuarios temporales")")"
msg -ama "${add} $(msg -ama "$(fun_trans "Agregador de Puertos OpenSSH")")"
msg -ama "${add} $(msg -ama "$(fun_trans "Instalador de Privoxy (HTTP Proxy)")")"
msg -ama "${add} $(msg -ama "$(fun_trans "Instalador de OpenHTTPuncher (OHP-Proxy)")")"
msg -ama "${mejor} $(msg -ama "$(fun_trans "Bot de Administración Telegram")")"
msg -ama "${add} $(msg -ama "$(fun_trans "Nuevos comandos al Bot de Telegram")")"
msg -ama "${add} $(msg -ama "$(fun_trans "Creador de usuarios temporales (Bot Telegram)")")"
[[ -e "$HOME/bar2" ]] && msg -bar2 || msg -bar
msg -azu "$(fun_trans "Lista de Cambios") ${name} $(msg -ama "v7.2") $(msg -azu "10/02/2021")"
[[ -e "$HOME/bar2" ]] && msg -bar2 || msg -bar
msg -ama "${add} $(msg -ama "$(fun_trans "SSLH MULTIPLEX")")"
msg -ama "${add} $(msg -ama "$(fun_trans "BADVPN - SOPORTE NETFLIX")")"
msg -ama "${mejor} $(msg -ama "$(fun_trans "CAMBIADOR DE COLORES")")"
msg -ama "${add} $(msg -ama "$(fun_trans "CAMBIADOR DE ZONA HORARIA")")"
msg -ama "${add} $(msg -ama "$(fun_trans "AGREGADOR DE MAS PUERTOS SSL")")"
[[ -e "$HOME/bar2" ]] && msg -bar2 || msg -bar
}
cambios
