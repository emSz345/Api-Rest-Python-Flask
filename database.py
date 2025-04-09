
from sqlalchemy import create_engine

def get_db_connection():
    return create_engine('mysql+mysqlconnector://root:@localhost/projeto')