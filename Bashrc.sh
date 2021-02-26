#!/bin/bash
#/16/02/2021
if cat /root/.bashrc | grep ADMPlus; then
echo -e ":)"
exit
else
cp .bashrc .bashrc.backup
echo "export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin:/usr/games;" >> .bashrc
echo "clear" >> .bashrc
echo "figlet ADMPlus | lolcat -a -d 10" >> .bashrc
#echo "figlet -p -f smslant ADMPlus | lolcat" >> .bashrc
#echo "figlet -p -f smslant < /etc/newadm/nick | lolcat" >> .bashrc
echo 'DATE=$(date +"%d-%m-%y")' >> .bashrc
echo 'TIME=$(date +"%T")' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e "Nombre del Servidor : $HOSTNAME"' >> .bashrc
echo 'echo -e "Fecha del Servidor : $DATE"' >> .bashrc
echo 'echo -e "Hora del Servidor : $TIME"' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e "                Bienvenido!               \e[0m"' >> .bashrc
echo 'echo -e "Teclee menu,adm,plus para abrir el script"' >> .bashrc
echo 'echo -e ""' >> .bashrc
fi
