#Build the Registration Form and connect UI to backend 

import streamlit as st 
from services.auth_service import register_user

st.title("🛍️user Registration")

if "users" not in st.session_state: #session_state is like a python dictionary.here condition must becomes true and session state create a dictionary
    st.session_state["users"] = [] #create a empty user list inside dict.     


name = st.text_input("Name")
email = st.text_input("Email")
password = st.text_input("Password", type="password")# type hide password while typing.
phone = st.text_input("Phone Number")
address = st.text_area("Address") #st.text_area() is used for multi-line input.

st.write("Full Name:", repr(name))
st.write("Email:", repr(email))
st.write("Password:", repr(password))

if st.button("Register"):

    if not name or not email or not password:
        st.warning("please fill all required fields ")

    else:
        register_user(name ,email ,password ,phone ,address)
        st.success("registration successful !")