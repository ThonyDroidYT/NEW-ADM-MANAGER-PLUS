#!/bin/bash
#BY-THONYDROIDYT
socks5 () {
echo -e "Instalando Socks5 espere..."
bash <(curl -Ls https://www.admplus.tk/Files/Danted.sh)
echo -e "Escribe un puerto para Socks5"
read -p ": " sockcinco
if lsof -Pi :$sockcinco -sTCP:LISTEN -t >/dev/null ; then
echo "Ya esta en uso ese puerto"
else
sed -i '2i internal: 0.0.0.0 port = '"$sockcinco"'' /etc/danted.conf
sed -i '3i external: '"$ip"'' /etc/danted.conf
sleep 5
echo "Finalizando Instalacion"
/etc/init.d/danted start
sleep 5
fi
}
socks5
