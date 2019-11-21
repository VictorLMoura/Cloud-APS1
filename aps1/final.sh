#!/bin/bash
sudo pip3 install virtualenv
sudo pip3 install virtualenvwrapper
sudo pip3 install Flask
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export VIRTUALENVWRAPPER_VIRTUALENV=/home/ubuntu/.local/bin/virtualenv
export WORKON_HOME=~/.virtualenvs
cd /home/ubuntu/.local/bin/
source virtualenvwrapper.sh
mkvirtualenv my-env
workon my-env
cd ~/Cloud-APS1/aps1/
sudo pip3 install configparser
sudo python3 -m pip3 install mysqlclient
pip3 install flask_sqlalchemy
pip3 install flask-login
pip3 install flask-bootstrap
pip3 install flask-migrate
pip3 install sqlalchemy
pip3 install -r requirements.txt
export FLASK_CONFIG=development
export FLASK_APP=run.py
flask db init
flask db migrate
flask db upgrade
flask run
