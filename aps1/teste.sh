cd ..
cd ..
cd ..
cd usr/local/bin/
source virtualenvwrapper.sh
workon my-env
cd ~/aps1/
export FLASK_CONFIG=development
export FLASK_APP=run.py
flask db init
flask db migrate
flask db upgrade
flask run
