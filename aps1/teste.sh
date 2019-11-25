export VIRTUALENVWRAPPER_PYTHON=$(which python)
export VIRTUALENVWRAPPER_VIRTUALENV=/home/ubuntu/.local/bin/virtualenv
export WORKON_HOME=~/Envs
cd /home/ubuntu/.local/bin/
source virtualenvwrapper.sh
mkvirtualenv my-env
workon my-env
cd ~/Cloud-APS1/aps1/
export FLASK_CONFIG=development
export FLASK_APP=run.py
flask db init
flask run
