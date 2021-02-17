if cat /root/.bashrc | grep ADMPlus; then
echo -e ":)"
else
echo "export PATH=$PATH:/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/sbin:/bin:/usr/games;" >> .bashrc
echo "clear" >> .bashrc
#echo "figlet ADMPlus | lolcat -a -d 5" >> .bashrc
echo 'DATE=$(date +"%d-%m-%y")' >> .bashrc
echo 'TIME=$(date +"%T")' >> .bashrc
#echo 'echo -e ""' >> .bashrc
echo 'echo -e "Nombre del Servidor : $HOSTNAME"' >> .bashrc
echo 'echo -e "Fecha del Servidor : $DATE"' >> .bashrc
echo 'echo -e "Hora del Servidor : $TIME"' >> .bashrc
#echo 'echo -e ""' >> .bashrc
echo 'echo -e "Bienvenido!"' >> .bashrc
echo 'echo -e "Teclee vpspack para ver el listado de comandos."' >> .bashrc
echo 'echo -e ""' >> .bashrc
fi
