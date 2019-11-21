#!/bin/bash
pip3 install mysqlclient==1.3.12
sudo pip3 install flask_sqlalchemy
sudo pip3 install flask-login
sudo pip3 install flask-bootstrap
sudo pip3 install flask-migrate
sudo pip3 install sqlalchemy
sudo pip3 install -r requirements.txt
sudo pip3 install virtualenv
sudo pip3 install virtualenvwrapper
sudo pip3 install Flask
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export VIRTUALENVWRAPPER_VIRTUALENV=/home/ubuntu/.local/bin/virtualenv
export WORKON_HOME=~/.virtualenvs
cd /home/ubuntu/.local/bin/
source virtualenvwrapper.sh
mkvirtualenv my-env
