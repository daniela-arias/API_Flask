from flask import Flask, request
from flask import jsonify
import tools.sql_tools as sqt

app = Flask(__name__)


@app.route("/")
def inicio():
    return "Hola Mundo"




app.run(debug=True)