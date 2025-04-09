from flask import Flask, request, jsonify
from flask_cors import CORS
from sqlalchemy import create_engine, text

import database

db_connect = database.get_db_connection()

def get():
    try:
        conn = db_connect.connect()
        result = conn.execute(text('SELECT * FROM bairros ORDER BY id DESC LIMIT 10'))
        data = [dict(zip(result.keys(), row)) for row in result]
        conn.close()
        return jsonify(data), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
   
def getBy(id):
    try:              
        conn = db_connect.connect()
        result = conn.execute(text('SELECT * FROM bairros WHERE id = :id ORDER BY id DESC LIMIT 1'), {"id": id})
        conn.commit()
        data = [dict(zip(result.keys(), row)) for row in result]
        conn.close()
        return jsonify(data), 200
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500 

def post():
    try:
        data = request.json
        bairro, id_cidade = data.get('bairro'), data.get('id_cidade')
        
        conn = db_connect.connect()
        conn.execute(text("INSERT INTO bairros (bairro, id_cidade ) VALUES (:bairro, :id_cidade)"), 
                     {"bairro": bairro, "id_cidade": id_cidade })
        conn.commit()

        result = conn.execute(text('SELECT * FROM bairros ORDER BY id DESC LIMIT 1'))
        data = [dict(zip(result.keys(), row)) for row in result]
        conn.close()
        return jsonify(data), 201
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500

def alterar(id):
    try:
        data = request.json
        bairro, id_cidade = data.get('bairro'), data.get('id_cidade')
        
        conn = db_connect.connect()
        conn.execute(text("UPDATE bairros SET bairro = :bairro, id_cidade = :id_cidade WHERE id = :id"), {"bairro": bairro, "id_cidade": id_cidade , "id" : id })
        conn.commit()

        result = conn.execute(text('SELECT * FROM bairros WHERE id = :id ORDER BY id DESC LIMIT 1'), {"id": id})
        data = [dict(zip(result.keys(), row)) for row in result]
        conn.close()
        return jsonify(data), 203
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
def apagar(id):
    try:                
        conn = db_connect.connect()
        conn.execute(text("DELETE FROM bairros WHERE id = :id"), {"id": id })
        conn.commit()
        conn.close()
        return jsonify({"message": "Registro apagado com Sucesso!"}), 204
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500 

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3002, debug=True)
