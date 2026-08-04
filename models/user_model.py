#Create Database Insert Function

from database.db_connection import get_connection

def create_user (full_name,email,password,phone,address):
    conn = get_connection()
    cursor = conn.cursor()

    query = """
         INSERT INTO users(full_name, email, password, phone, address)
"""

    cursor.execute(query)
    conn.commit()

    cursor.close()
    conn.close()