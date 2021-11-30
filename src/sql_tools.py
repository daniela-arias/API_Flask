from config.configurations import engine
import pandas as pd


def personajes():
    query = list(engine.execute("SELECT Actors(Name) From tbb.Actors"))
    lista =  [{"nombre": elemento[0]} for elemento in query]
    return lista


 