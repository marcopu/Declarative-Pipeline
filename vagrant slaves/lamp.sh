#!/bin/bash

sudo -i

#Update iniziale
apt-get update

#Installazione Apache Web Server e PHP7
echo "Installazione Apache Web Server e PHP7"
apt-get -y install apache2
apt-get -y install php7.0 libapache2-mod-php7.0 
export DEBIAN_FRONTEND="noninteractive"

#Installazione MySql Server
echo "Installazione MySql Server"
apt-get -y install mysql-server

#Riavvio apache2
systemctl restart apache2

#Installazione Java8
echo "Installazione Java8"
  echo debconf shared/accepted-oracle-license-v1-1 select true | \
  debconf-set-selections
  echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  debconf-set-selections
  add-apt-repository ppa:webupd8team/java
  apt-get update
  apt-get -y install oracle-java8-installer

#Installazione Maven
echo "Installazione Maven"
  apt-get update
  apt-get -y install maven

#Set timezone
echo "Set timezone"
timedatectl set-timezone Europe/Rome

#Settaggio permessi root SSH
echo "Setting SSH permissions"
sed -i "s/PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
