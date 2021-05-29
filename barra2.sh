#!/bin/bash
SCPdir="/etc/newadm"
SCPusr="${SCPdir}/ger-user"
SCPfrm="/etc/ger-frm"
SCPinst="/etc/ger-inst"
sed -i "s;msg -bar2;msg -bar;g" ${SCPdir}/menu
sed -i "s;msg -bar2;msg -bar;g" ${SCPfrm}/*.sh
sed -i "s;msg -bar2;msg -bar;g" ${SCPinst}/*.sh
sed -i "s;msg -bar2;msg -bar;g" ${SCPusr}/usercodes
#ADMbot
#sed -i "s;$LIN3;$LINE;g" /etc/ger-frm/ADMbot.sh
