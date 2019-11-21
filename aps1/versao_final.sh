#!/bin/bash
sudo apt update
sudo apt install python-pip
#Yes
sudo pip install wheel
sudo apt install libssl-dev

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

sudo apt-get install libmysqlclient-dev python-dev
sudo pip install -r requirements.txt
export FLASK_CONFIG=development
export FLASK_APP=run.py
flask db init
flask db migrate
flask db upgrade
flask run

