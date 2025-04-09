from flask import request, jsonify
from sqlalchemy import  text

import database

db_connect = database.get_db_connection()

def get():
    try:
        conn = db_connect.connect()
        result = conn.execute(text('SELECT * FROM cidades ORDER BY id DESC LIMIT 10'))
        data = [dict(zip(result.keys(), row)) for row in result]
        conn.close()
        return jsonify(data), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
   
def getBy(id):
    try:              
        conn = db_connect.connect()
        result = conn.execute(text('SELECT * FROM cidades WHERE id = :id ORDER BY id DESC LIMIT 1'), {"id": id})
        conn.commit()
        data = [dict(zip(result.keys(), row)) for row in result]
        conn.close()
        return jsonify(data), 200
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500 

def post():
    try:
        data = request.json
        cidade, idestado = data.get('cidade'), data.get('idestado')
        
        conn = db_connect.connect()
        conn.execute(text("INSERT INTO cidades (cidade, idestado ) VALUES (:cidade, :idestado)"), 
                     {"cidade": cidade, "idestado": idestado })
        conn.commit()

        result = conn.execute(text('SELECT * FROM cidades ORDER BY id DESC LIMIT 1'))
        data = [dict(zip(result.keys(), row)) for row in result]
        conn.close()
        return jsonify(data), 201
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500

def alterar(id):
    try:
        data = request.json
        cidade, idestado = data.get('cidade'), data.get('idestado')
        
        conn = db_connect.connect()
        conn.execute(text("UPDATE cidades SET cidade = :cidade, idestado = :idestado WHERE id = :id"), {"cidade": cidade, "idestado": idestado , "id" : id })
        conn.commit()

        result = conn.execute(text('SELECT * FROM cidades WHERE id = :id ORDER BY id DESC LIMIT 1'), {"id": id})
        data = [dict(zip(result.keys(), row)) for row in result]
        conn.close()
        return jsonify(data), 203
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
def apagar(id):
    try:                
        conn = db_connect.connect()
        conn.execute(text("DELETE FROM cidades WHERE id = :id"), {"id": id })
        conn.commit()
        conn.close()
        return jsonify({"message": "Registro apagado com Sucesso!"}), 204
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500 


