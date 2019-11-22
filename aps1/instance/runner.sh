export FLASK_CONFIG=development
export FLASK_APP=/home/ubuntu/Cloud-APS1/aps1/run.py
flask db init
flask db migrate
flask db upgrade
flask run