#!/bin/bash
#/16/02/2021
if cat /root/.bashrc | grep ADMPlus; then
#echo -e ":)"
exit
else
cp .bashrc .bashrc.backup
echo '
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
' >> .bashrc
echo "export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin:/usr/games;" >> .bashrc
echo "clear" >> .bashrc
echo "figlet ADMPlus | lolcat -a -d 08" >> .bashrc
#echo "figlet -p -f smslant ADMPlus | lolcat" >> .bashrc
#echo "figlet -p -f smslant < /etc/newadm/nick | lolcat" >> .bashrc
echo 'DATE=$(date +"%d-%m-%y")' >> .bashrc
echo 'TIME=$(date +"%T")' >> .bashrc
#echo 'echo -e ""' >> .bashrc
echo 'echo -e "Nombre del Servidor : $HOSTNAME"' >> .bashrc
echo 'echo -e "Fecha del Servidor : $DATE"' >> .bashrc
echo 'echo -e "Hora del Servidor : $TIME"' >> .bashrc
echo 'echo -e ""' >> .bashrc
#echo 'echo -e "                Bienvenido!               \e[0m"' >> .bashrc
 echo 'echo -e "                $(fun_trans "Bienvenido") \e[0m"' >> .bashrc
echo 'echo -e "Teclee menu,adm,plus para abrir el script"' >> .bashrc
echo 'echo -e ""' >> .bashrc
fi
