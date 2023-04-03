#!bin/bash
sudo yum update -y
sudo yum install java-11-openjdk
sudo amazon-linux-extras install java-openjdk11
wget -O /opt/apache-tomcat-9.0.73-windows-x64.zip https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73-windows-x64.zip
cd /opt

unzip  apache-tomcat-9.0.73-windows-x64.zip
mv apache-tomcat-9.0.73 tomcat9

wget https://www.oracle.com/webfolder/technetwork/tutorials/obe/fmw/wls/10g/r3/cluster/session_state/files/shoppingcart.zip

unzip shoppingcart.zip

cp shoppingcart.war /opt/tomcat9/webapps/
