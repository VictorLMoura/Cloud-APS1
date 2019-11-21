# Download and Install the Latest Updates for the OS
# sudo apt-get update && apt-get upgrade -y
# send \"y\r"

# sudo dpkg-reconfigure -f noninteractive tzdata
#send \"y\r"

# Enable Ubuntu Firewall and allow SSH & MySQL Ports
#sudo ufw enable
#sudo ufw allow 22
#sudo ufw allow 3306

# Install essential packages
sudo apt-get -y install zsh htop

# Install MySQL Server in a Non-Interactive mode. Default root password will be "root"
echo "mysql-server-5.6 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.6 mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get -y install mysql-server
sudo mysql_secure_instalation
./secure.sh

mysql -uroot -proot << EOF
CREATE USER IF NOT EXISTS "victor"@"localhost" IDENTIFIED BY "Vlm1998!!!";
CREATE DATABASE aps1;
GRANT ALL PRIVILEGES ON aps1 . * TO "victor"@"localhost";
EOF

sudo service mysql restart
