#!/bin/bash
#/16/02/2021
if cat /root/.bashrc | grep ADMPlus; then
echo -e ":)"
else
cp .bashrc .bashrc.backup
echo "export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin:/usr/games;" >> .bashrc
echo "clear" >> .bashrc
echo "figlet ADMPlus | lolcat -a -d 5" >> .bashrc
#echo "figlet -p -f smslant ADMPlus | lolcat" >> .bashrc
#echo "figlet -p -f smslant < /etc/newadm/nick | lolcat" >> .bashrc
echo 'DATE=$(date +"%d-%m-%y")' >> .bashrc
echo 'TIME=$(date +"%T")' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e "\e[1;31mNombre del Servidor : \e[1;37m$HOSTNAME\e[0m"' >> .bashrc
echo 'echo -e "\e[1;31mFecha del Servidor : \e[1;37m$DATE\e[0m"' >> .bashrc
echo 'echo -e "\e[1;31mHora del Servidor : \e[1;37m$TIME\e[0m"' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e "\e[1;33m                Bienvenido!               \e[0m"' >> .bashrc
echo 'echo -e "\e[1;36mTeclee menu,adm,plus para abrir el script.\e[0m"' >> .bashrc
echo 'echo -e ""' >> .bashrc
fi
