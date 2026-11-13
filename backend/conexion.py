
import mysql.connector

def get_conection():
    conexion = mysql.connector.connect(
        host="127.0.0.1",
        user="root",
        password="12345",
        database="amco",
        port=3307   
    )
    

    return conexion
