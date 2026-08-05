#Create Database Insert Function

from database.db_connection import get_connection

def create_user (name,email,password,phone,address):
    conn = get_connection() #create connection
    cursor = conn.cursor() #.cursor is a object for cursor creation ,it is used for python to directly communicate with mysql database.

    query = """
         INSERT INTO users(name, email, password, phone, address)
         VALUES (%s, %s, %s, %s, %s)
"""

    cursor.execute(query,(name, email, password, phone, address))
    conn.commit()

    cursor.close()
    conn.close()