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
        tarefa = Tarefa(texto=request.json["texto"])
        db.session.add(tarefa)
        db.session.commit()
        return "Uso: /tarefa /tarefa/<int:id>"

    if request.method == 'GET':
        dict_tarefas = {}
        for t in Tarefa.query.all():
            dict_tarefas[t.id] = t.texto
        return jsonify(dict_tarefas)

    return "Uso: /tarefa /tarefa/<int:id>"

@home.route('/tarefa/<int:id>', methods=['GET', 'PUT', 'DELETE'])
def altera_tarefas(id):
    """
    Altera uma tarefa
    """
    if request.method == 'PUT':
        new_text = request.json["texto"]
        tarefa = Tarefa.query.filter_by(id=id).first()
        tarefa.texto = new_text
        db.session.commit()    
        return "Uso: /tarefa /tarefa/<int:id>"
    
    if request.method == 'DELETE':
        tarefa = Tarefa.query.filter_by(id=id).first()
        db.session.delete(tarefa)
        db.session.commit()
        return "Uso: /tarefa /tarefa/<int:id>"
    
    return "Uso: /tarefa /tarefa/<int:id>"
