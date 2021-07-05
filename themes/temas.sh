#!/bin/bash
echo -e "\033[1;33mAplicando Tema $1\033[0m"
rm -rf /etc/new-adm-color
rm -rf /etc/newadm/barra
sleep 1s
case $1 in
1)
color="7 6 5 4 3 2 1 1"
;;
2)
color="6 6 6 6 6 6 1 1"
;;
3)
color="6 5 2 3 4 7 1 1"
;;
4)
color="3 4 5 1 6 7 1"
;;
*)
color="$@"
esac
echo "${color}" >> /etc/new-adm-color
echo "1" >> /etc/newadm/barra
echo -e "\033[1;32mTema $1 aplicado con éxito\033[0m"
