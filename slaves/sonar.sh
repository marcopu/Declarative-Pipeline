#!/bin/bash

#chmod +x build.sh

#sudo ./build.sh


#su -c 'sh -s' <<EOF

sudo -i

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

#SonarQube Parametri Boot
# echo "CONFIGURING SONARQUBE SERVER ----------"
sysctl -w vm.max_map_count=262144
sysctl -w fs.file-max=65536


#Set timezone
echo "SETTING TIMEZONE ----------"
timedatectl set-timezone Europe/Rome

echo "SETTING SSH PERMISSION ----------"
sed -i "s/PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config