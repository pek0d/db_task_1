import json
import os

from dotenv import load_dotenv

load_dotenv()

import models

DSN = "postgresql://postgres:@localhost:5432/books_db"
engine = sqlalchemy.create_engine(DSN)
Session = sessionmaker(bind=engine)
session = Session()

session.close
