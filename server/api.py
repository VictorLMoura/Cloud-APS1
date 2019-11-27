from flask import Flask, request, redirect, jsonify
import requests
import json
import os
import pymysql

app = Flask(__name__)
conn = pymysql.connect(host=os.environ['IPDB'], user='victor', password='Vlm1998!!!', db='aps1', charset='utf8mb4', cursorclass=pymysql.cursors.DictCursor)

conn.autocommit(True)

@app.route('/tarefa', methods=['GET', 'POST'])
def lista_tarefas():
    """
    Lista as tarefas ja criadas
    """
    if request.method == 'POST':
        with conn.cursor() as cursor:
            try:
                cursor.execute('INSERT INTO tarefas (texto) VALUES (%s)', (request.json["texto"]))
                conn.commit()
                conn.close()
                return ""
            except pymysql.err.IntegrityError as e:
                raise ValueError(f'Não posso inserir {request.json["texto"]} na tabela')
                conn.close()
        return "Algo errado"
    if request.method == 'GET':
        with conn.cursor() as cursor:
            try:
                cursor.execute('SELECT * FROM tarefas')
                res = cursor.fetchall()
                conn.close()
                return {'res' : res}
            except pymysql.err.IntegrityError as e:
                raise ValueError(f'ERRO')
                conn.close()
                return "Algo errado"
    return "Algo errado"

@app.route('/tarefa/<int:id>', methods=['GET', 'PUT', 'DELETE'])
def altera_tarefas(id):
    """
    Altera uma tarefa
    """    
    if request.method == 'DELETE':
        try:
            with conn.cursor() as cursor:
                cursor.execute('DELETE FROM tarefas WHERE id=%s', (id))
                conn.close()
                return ""
        except pymysql.err.IntegrityError as e:
            raise ValueError(f'ERRO')
            conn.close()
            return "Algo errado"    
    return "Uso: /tarefa /tarefa/<int:id>"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8080)