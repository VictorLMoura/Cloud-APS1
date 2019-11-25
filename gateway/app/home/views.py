# app/home/views.py

from flask import flash, render_template, request, redirect, g, jsonify
from flask_login import login_required
from ..models import Tarefa
from .. import db
from ..models import Tarefa
from . import home
from sqlalchemy.ext.declarative import DeclarativeMeta
import json

@home.route('/tarefa', methods=['GET', 'POST'])
def lista_tarefas():
    """
    Lista as tarefas ja criadas
    """
    if request.method == 'POST':
        dic_temp["texto"] = request.json["texto"])
        r = requests.post("http://" + os.environ['IPSERVER'] + ":5000/tarefa", json=dic_temp)
        return r

    if request.method == 'GET':
        r = requests.get('http://127.0.0.1:5000/tarefa')
        return r

    return "404"

@home.route('/tarefa/<int:id>', methods=['GET', 'PUT', 'DELETE'])
def altera_tarefas(id):
    """
    Altera uma tarefa
    """
    if request.method == 'PUT':
        dic_temp["texto"] = request.json["texto"])
        r = requests.put("http://" + os.environ['IPSERVER'] + ":5000/tarefa/"+id, json=dic_temp)
        return r
    
    if request.method == 'DELETE':
        r = requests.delete("http://"+ os.environ['IPSERVER'] +":5000/tarefa/"+id)
        return r
    
    return "404"
