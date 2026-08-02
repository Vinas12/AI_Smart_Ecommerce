import mysql.connector
import config


def get_connection():
    try:
        connection = mysql.connector.connect(
            host=config.HOST,
            user=config.USER,
            password=config.PASSWORD,
            database=config.DATABASE
        )

        if connection.is_connected():
            print(" Database Connected Successfully!")

        return connection

    except mysql.connector.Error as err:
        print(" Database Connection Error:", err)
        return None