#!/bin/bash

#chmod +x build.sh

#sudo ./build.sh


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

#Installazione Jenkins
echo "INSTALLING JENKINS ----------"
  wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
  echo 'deb https://pkg.jenkins.io/debian-stable binary/' >> /etc/apt/sources.list
  apt-get update
  apt-get --assume-yes install jenkins
  cd /etc/default
  sed -i "s/HTTP_PORT=8080/HTTP_PORT=8282/g" jenkins
  service jenkins restart

#Installazione Maven
echo "INSTALLING MAVEN ----------"
 apt-get update
 apt-get -y install maven
 
#Set timezone
echo "SETTING TIMEZONE ----------"
timedatectl set-timezone Europe/Rome

echo "SETTING SSH PERMISSION ----------"
sed -i "s/PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config