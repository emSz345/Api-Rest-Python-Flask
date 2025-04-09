from flask import request, jsonify
from database import get_db_connection
from sqlalchemy import text


def get():
    engine = get_db_connection()
    with engine.connect() as conn:
        result = conn.execute(text("SELECT * FROM usuarios"))
        users = [dict(row._mapping) for row in result]
    return jsonify(users)


def getBy(id):
    engine = get_db_connection()
    with engine.connect() as conn:
        result = conn.execute("SELECT * FROM usuarios WHERE id = %s", (id,))
        row = result.fetchone()
    if row:
        return jsonify(dict(row._mapping))
    return jsonify({"erro": "Usuário não encontrado"}), 404


def post():
    data = request.get_json()
    engine = get_db_connection()
    with engine.begin() as conn:
        conn.execute("""
            INSERT INTO usuarios (email, password, nome, emailvalidado, perfil)
            VALUES (%s, %s, %s, %s, %s)
        """, (data['email'], data['password'], data.get('nome'), data.get('emailvalidado'), data.get('perfil', 'USER')))
    return jsonify({"mensagem": "Usuário cadastrado com sucesso!"})


def alterar(id):
    data = request.get_json()
    engine = get_db_connection()
    with engine.begin() as conn:
        conn.execute("""
            UPDATE usuarios
            SET email = %s, password = %s, nome = %s, emailvalidado = %s, perfil = %s
            WHERE id = %s
        """, (data['email'], data['password'], data.get('nome'), data.get('emailvalidado'), data.get('perfil', 'USER'), id))
    return jsonify({"mensagem": "Usuário atualizado com sucesso!"})


def apagar(id):
    engine = get_db_connection()
    with engine.begin() as conn:
        conn.execute("DELETE FROM usuarios WHERE id = %s", (id,))
    return jsonify({"mensagem": "Usuário excluído com sucesso!"})


def auth():
    data = request.get_json()
    engine = get_db_connection()
    with engine.connect() as conn:
        result = conn.execute("SELECT * FROM usuarios WHERE email = %s AND password = %s", (data['email'], data['password']))
        row = result.fetchone()
    if row:
        return jsonify({"auth": True, "usuario": dict(row._mapping)})
    return jsonify({"auth": False}), 401
