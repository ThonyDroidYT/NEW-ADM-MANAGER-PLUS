function goinst(){
echo -e "A continuacion se instalara el paquete GO Lang"
echo -e "Continuar?"
while [[ ${yesno} != @(s|S|y|Y|n|N) ]]; do
read -p "[S/N]: " yesno
tput cuu1 && tput dl1
done
if [[ ${yesno} = @(s|S|y|Y) ]]; then
echo -e "Instalando..."
cd
rm -rf /usr/local/go 1> /dev/null 2> /dev/null
wget https://golang.org/dl/go1.15.linux-amd64.tar.gz 1> /dev/null 2> /dev/null
tar -C /usr/local -xzf go1.15.linux-amd64.tar.gz
if cat /root/.bashrc | grep GOROOT; then
echo -e "Ya existe un GoROOT - Skipping"
else
sed -i '$a export GOROOT=/usr/local/go' /root/.bashrc
sed -i '$a export GOPATH=$HOME/go' /root/.bashrc
sed -i '$a export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' /root/.bashrc
rm go1.15.linux-amd64.tar.gz
source /root/.bashrc
fi
sleep 5
echo -e "Reiniciando Fuente de Terminal..."
fi
echo -e "\033[1;33m Para finalizar el proceso de Instalacion de GO escribe :\033[0m"
echo -e "\033[1;32m source ~/.profile\033[0m"
echo -e "\033[1;31mPRESIONE ENTER PARA CONTINUAR\033[0m"
read -p " "
exit 0
}
goinst
