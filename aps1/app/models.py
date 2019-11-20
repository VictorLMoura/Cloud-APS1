# app/models.py

from flask_login import UserMixin

from app import db


class Tarefa(UserMixin, db.Model):
    """
    Cria as tarefas
    """

    # Ensures table will be named in plural and not in singular
    # as is the name of the model
    __tablename__ = 'tarefas'

    id = db.Column(db.Integer, primary_key=True)
    texto = db.Column(db.String(60), index=True)

    def __repr__(self):
        return "Texto: {}".format(self.texto)
