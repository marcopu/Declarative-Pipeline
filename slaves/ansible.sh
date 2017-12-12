#!/bin/bash

#chmod +x lampscript.sh

#sudo ./lampscript.sh

#su -c 'sh -s' <<EOF

sudo -i

#Update iniziale
apt-get update

#Installazione Java8
echo "INSTALLING JAVA ----------"
  echo debconf shared/accepted-oracle-license-v1-1 select true | \
  debconf-set-selections
  echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  debconf-set-selections

  add-apt-repository ppa:webupd8team/java
  apt-get update
  apt-get -y install oracle-java8-installer
  
 

#Installazione Maven
echo "INSTALLING MAVEN ----------"
  apt-get update
  apt-get -y install maven

#Installazione Ansible
echo "INSTALLING ANSIBLE ----------"
  apt-get update
  apt-get -y install software-properties-common
  apt-add-repository -y ppa:ansible/ansible
  apt-get update
  apt-get -y install ansible
  
  
  
#Set timezone
echo "SETTING TIMEZONE ----------"
timedatectl set-timezone Europe/Rome

echo "SETTING SSH PERMISSION ----------"
sed -i "s/PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
