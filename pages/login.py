import streamlit as st

st.title("🔐 User Login")

email = st.text_input("Email")
password = st.text_input("Password", type="password")

if st.button("Login"):

    if not email or not password:
        st.warning("Please enter both email and password.")
    else:
        st.success("Login details received!")