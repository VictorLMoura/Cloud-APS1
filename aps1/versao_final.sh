#!/bin/bash
cd /home/ubuntu/
sudo apt-get update -y
sudo apt-get install python-pip -y
git clone https://github.com/VictorLMoura/Cloud-APS1.git
sudo pip install wheel
sudo apt-get install libssl-dev -y
cd Cloud-APS1/
cd aps1/
#Download and Configure MySQL
sudo apt-get -y install zsh htop
# Install MySQL Server in a Non-Interactive mode. Default root password will be "root"
echo "mysql-server-5.6 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.6 mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get -y install mysql-server
sudo mysql_secure_instalation

#Script para instalacao segura
sudo apt install expect -y
MYSQL_ROOT_PASSWORD=root
SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"$MYSQL\r\"
expect \"Change the root password?\"
send \"n\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
")
echo "$SECURE_MYSQL"
sudo apt purge expect -y
#Fim do script para instalacao segura

mysql -uroot -proot << EOF
CREATE USER IF NOT EXISTS "victor"@"localhost" IDENTIFIED BY "Vlm1998!!!";
CREATE DATABASE aps1;
GRANT ALL PRIVILEGES ON aps1 . * TO "victor"@"localhost";
EOF
sudo service mysql restart
#Fim do MySQL Script

sudo apt-get install libmysqlclient-dev -y
sudo apt-get install python-dev -y
sudo pip install -r /home/ubuntu/Cloud-APS1/aps1/requirements.txt
export FLASK_CONFIG=development
export FLASK_APP=/home/ubuntu/Cloud-APS1/aps1/run.py
flask db init
flask db migrate
flask db upgrade
flask run

