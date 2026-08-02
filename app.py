import streamlit as st
from database.db_connection import get_connection

st.title("AI Smart Ecommerce")

try:
    conn = get_connection()

    if conn.is_connected():
        st.success("✅ Database Connected Successfully!")

    conn.close()

except Exception as e:
    st.error(f"Connection Failed: {e}")