export FLASK_CONFIG=development
export FLASK_APP=/home/ubuntu/Cloud-APS1/aps1/run.py
/usr/local/bin/flask db init
/usr/local/bin/flask db migrate
/usr/local/bin/flask db upgrade
/usr/local/bin/flask run
