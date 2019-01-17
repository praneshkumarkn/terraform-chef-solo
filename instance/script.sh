#/bin/bash
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce -y

sudo docker run hello-world

sudo mkdir /home/ubuntu/apache
sudo cd /home/ubuntu/apache
sudo wget https://s3.amazonaws.com/suppi2/apache/Dockerfile.txt

sudo mkdir /home/ubuntu/tomcat
sudo cd /home/ubuntu/tomcat
sudo wget https://s3.amazonaws.com/suppi2/tomcat/Dockerfile
sudo wget https://s3.amazonaws.com/suppi2/tomcat/LoginWebApp.war

sudo mkdir /home/ubuntu/mysql
sudo cd /home/ubuntu/mysql
sudo wget https://s3.amazonaws.com/suppi2/mysql/Dockerfile.txt

sudo wget https://s3.amazonaws.com/suppi2/docker-compose.yml


