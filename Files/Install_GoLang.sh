#!/bin/bash
funtion removego(){
rm -rf /usr/local/go
}
function goinst(){
echo -e "\e[1;33mA continuacion se instalara el paquete GO Lang\e[0m"
echo -e "\e[1;33mContinuar?\e[0m"
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
read -p "[S/N]: " yesno
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
echo -e "\e[1;32mInstalando...\e[0m"
cd
rm -rf /usr/local/go 1> /dev/null 2> /dev/null
wget https://golang.org/dl/go1.15.linux-amd64.tar.gz 1> /dev/null 2> /dev/null
tar -C /usr/local -xzf go1.15.linux-amd64.tar.gz
if cat /root/.bashrc | grep GOROOT; then
echo -e "\e[1;31mYa existe un GoROOT - Skipping\e[0m"
else
sed -i '$a export GOROOT=/usr/local/go' /root/.bashrc
sed -i '$a export GOPATH=$HOME/go' /root/.bashrc
sed -i '$a export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' /root/.bashrc
rm go1.15.linux-amd64.tar.gz
source /root/.bashrc
fi
sleep 5
echo -e "\e[1;32mReiniciando Fuente de Terminal...\e[0m"
fi
echo -e "\033[1;33m Para finalizar el proceso de Instalacion de GO escribe :\033[0m"
echo -e "\033[1;32m source ~/.profile\033[0m"
#echo -e "\033[1;31mPRESIONE ENTER PARA CONTINUAR\033[0m"
#read -p " "
#exit 0
}
gomenu () {
echo "${barra}"
echo -e "\e[1;36m     GO Lang    \e[1;32m[NEW-ADM-PLUS] \e[0m"
echo "${barra}"
echo -e "\e[1;32m[1] \e[1;31m> \e[1;36mINSTALAR GO Lang \e[0m"
echo -e "\e[1;32m[2] \e[1;31m> \e[1;36mDESINSTALAR GO Lang \e[0m"
read -p "Opción: 》" opcion
case $opcion in
0)
clear
exit;;
1)goinst;;
2)removego;;
*)echo -e "\e[1;31m¡Porfavor Escoge la Opción Correcta!\e[0m"
gomenu
;;
esac
}
gomenu
