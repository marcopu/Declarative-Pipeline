#!/bin/bash

#chmod +x lampscript.sh

#sudo ./lampscript.sh

#su -c 'sh -s' <<EOF

sudo -i

#Update iniziale
apt-get update

#Installazione Apache Web Server e PHP7
echo "INSTALLING APACHE AND PHP7 ----------"
apt-get -y install apache2
apt-get -y install php7.0 libapache2-mod-php7.0 

export DEBIAN_FRONTEND="noninteractive"

#Installazione MySql Server
echo "INSTALLING MYSQL SERVER ----------"
apt-get -y install mysql-server
# debconf-set-selections <<< 'mysql-server mysql-server/root_password password PASSWORD'
# debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password PASSWORD'


#Riavvio apache2
systemctl restart apache2

#Installazione Java8
echo "INSTALLING JAVA ----------"
  echo debconf shared/accepted-oracle-license-v1-1 select true | \
  debconf-set-selections
  echo debconf shared/accepted-oracle-license-v1-1 seen true | \
  debconf-set-selections

  add-apt-repository ppa:webupd8team/java
  apt-get update
  apt-get -y install oracle-java8-installer
  

# #Installazione Tomcat7
# echo "INSTALLING TOMCAT7 ----------"
  # wget mirror.nohup.it/apache/tomcat/tomcat-7/v7.0.82/bin/apache-tomcat-7.0.82.tar.gz
  # tar xvzf apache-tomcat-7.0.82.tar.gz
  # mv apache-tomcat-7.0.82 /opt/tomcat
  # cd /root; sudo echo 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle' >> .bashrc
  # echo 'export CATALINA_HOME=/opt/tomcat' >> .bashrc
 # echo "Starting . . . . . "
 # /opt/tomcat/bin/startup.sh
 

#Installazione Maven
echo "INSTALLING MAVEN ----------"
  apt-get update
  apt-get -y install maven

  
#Set timezone
echo "SETTING TIMEZONE ----------"
timedatectl set-timezone Europe/Rome

echo "SETTING SSH PERMISSION ----------"
sed -i "s/PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
