#!/bin/bash
echo -e "\033[1;33mAplicando Tema 3\033[0m"
rm -rf /etc/new-adm-color
rm -rf /etc/newadm/barra
sleep 2s
echo "6 5 2 3 4 7 1 1" >> /etc/new-adm-color
echo "3" >> /etc/newadm/barra
echo -e "\033[1;32mTema aplicado con éxito\033[0m"
