#hash password securely 

import bcrypt   
from models.user_model import create_user


def register_user(full_name, email ,password ,phone ,address ):

        #hash password 
        hashed_password = bcrypt.hashpw(
                password.encode("utf-8"), #string to byte 
                bcrypt.gensalt() #genrate a salt.salt is a value that mix into the password before hashing  
        )

        #convert bytes to string 
        hashed_password = hashed_password.decode("utf-8")

        create_user(full_name,email,hashed_password,phone,address)

        return True