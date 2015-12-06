#!/bin/bash
echo 'pgrep uim-fep || uim-fep' >> /etc/skel/.bashrc
CONUSER=${CUSER:-"docker"}
CONPASSWD=${CPASSWD:-"docker"}
/usr/sbin/useradd -m $CONUSER -G sudo -s /bin/bash
echo 
echo $CONUSER:"$CONPASSWD" | /usr/sbin/chpasswd
echo "user $CONUSER created"
IP=$(/sbin/ifconfig eth0 | awk -F : '/inet addr/{print $2;}' | cut -d ' ' -f 1)
echo "$IP is container address"
mkdir /var/run/sshd
/usr/sbin/sshd -D
