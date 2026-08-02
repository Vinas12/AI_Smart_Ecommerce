import mysql.connector #MySQL library 
from config import DB_HOST, DB_USER, DB_PASSWORD, DB_NAME

def get_connection():
    connection = mysql.connector.connect( #tries to connect to MySQL.
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=DB_NAME
    )
    return connection