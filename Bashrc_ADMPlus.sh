#!/bin/bash
#/16/02/2021
if cat /root/.bashrc | grep ADMPlus; then
echo -e ":)"
else
echo "export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin:/usr/games;" >> .bashrc
echo "clear" >> .bashrc
echo "figlet ADMPlus | lolcat -a -d 5" >> .bashrc
echo 'DATE=$(date +"%d-%m-%y")' >> .bashrc
echo 'TIME=$(date +"%T")' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e "\e[1;32mNombre del Servidor : \e[1;32m$HOSTNAME\e[0m"' >> .bashrc
echo 'echo -e "\e[1;33mFecha del Servidor : \e[1;32m$DATE\e[0m"' >> .bashrc
echo 'echo -e "\e[1;35mHora del Servidor : \e[1;32m$TIME\e[0m"' >> .bashrc
echo 'echo -e ""' >> .bashrc
echo 'echo -e "\e[1;33m                Bienvenido!               \e[0m"' >> .bashrc
echo 'echo -e "\e[1;36mTeclee menu,adm,plus para abrir el script.\e[0m"' >> .bashrc
echo 'echo -e ""' >> .bashrc
fi
