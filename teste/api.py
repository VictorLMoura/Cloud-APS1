from flask import Flask, request, redirect
import requests
import json
import os

app = Flask(__name__)

@app.route('/tarefa', methods=['GET', 'POST'])
def lista_tarefas():
    """
    Lista as tarefas ja criadas
    """
    if request.method == 'POST':
        dic_temp["texto"] = request.json["texto"]
        r = requests.post("http://" + os.environ['IPSERVER'] + ":8080/tarefa", json=dic_temp)
        return (r.text, r.status_code, r.headers.items())

    if request.method == 'GET':
        r = requests.get("http://" + os.environ['IPSERVER'] + ":8080/tarefa")
        return (r.text, r.status_code, r.headers.items())

    return "404"

@app.route('/tarefa/<int:id>', methods=['GET', 'PUT', 'DELETE'])
def altera_tarefas(id):
    """
    Altera uma tarefa
    """
    if request.method == 'PUT':
        dic_temp["texto"] = request.json["texto"]
        r = requests.put("http://" + os.environ['IPSERVER'] + ":8080/tarefa/"+id, json=dic_temp)
        return (r.text, r.status_code, r.headers.items())
    
    if request.method == 'DELETE':
        r = requests.delete("http://"+ os.environ['IPSERVER'] +":8080/tarefa/"+id)
        return (r.text, r.status_code, r.headers.items())
    
    return "404"


if __name__ == '__main__':
    app.run(debug=True)