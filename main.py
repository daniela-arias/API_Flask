from flask import Flask, request
from flask import jsonify
import src.sql_tools as sqt

app = Flask(__name__)

@app.route("/")
def inicio():
    return "The big bang theory"

@app.route("/personajes")
def devuelve_personajes():
    persons = sqt.personajes()
    return jsonify(persons)

app.run(debug=True)