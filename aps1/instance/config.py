# instance/config.py
import os
SECRET_KEY = 'p9Bv<3Eid9%$i01'
path = 'mysql://victor:Vlm1998!!!@' + os.environ['IPDB']  + '/aps1'
SQLALCHEMY_DATABASE_URI = path
