#!/bin/bash

sudo -i

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

#SonarQube e relativi Parametri Boot
wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-5.6.4.zip
unzip sonarqube-5.6.4.zip
mv sonarqube-5.6.4 /opt/sonar

echo "Configurazione parametri SonarQube Server"
sysctl -w vm.max_map_count=262144
sysctl -w fs.file-max=65536

#Set timezone
echo "SETTING TIMEZONE ----------"
timedatectl set-timezone Europe/Rome

#Settaggio permessi root SSH
echo "Setting SSH permissions"
sed -i "s/PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
