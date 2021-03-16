#!/bin/bash
apt-get remove dante-server -y &> /dev/null
apt-get purge dante-server -y &> /dev/null
apt-get install dante-server -y &> /dev/null
cp /etc/danted.conf /etc/danted.conf-bak
cat >/etc/danted.conf <<-EOF
logoutput: /var/log/danted.log
method: username none
user.privileged: proxy
user.notprivileged: nobody
user.libwrap: nobody
client pass {
from: 0.0.0.0/0 to: 0.0.0.0/0
          log: connect disconnect
}
pass {
from: 0.0.0.0/0 to: 0.0.0.0/0 port gt 1023
          command: bind
          log: connect disconnect
}
pass {
from: 0.0.0.0/0 to: 0.0.0.0/0
          command: connect udpassociate
          log: connect disconnect
}
block {
from: 0.0.0.0/0 to: 0.0.0.0/0
          log: connect error
}
EOF
