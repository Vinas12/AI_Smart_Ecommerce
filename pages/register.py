import streamlit as st 

st.title = ("user Registration")

full_name = st.text_input("Full Name")
email = st.text_input("Email")
password = st.text_input("Password", type="password")
phone = st.text_input("Phone Number")
address = st.text_area("Address")

if st.button("Register"):
    st.write("Register button clicked!")