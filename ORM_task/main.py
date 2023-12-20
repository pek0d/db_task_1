import json
import os

from dotenv import load_dotenv

load_dotenv()
import sqlalchemy
from sqlalchemy.orm import sessionmaker

from models import Book, Publisher, Sale, Shop, Stock, create_tables

db_name = os.getenv("DB_NAME")
db_user = os.getenv("DB_USER")
DSN = "postgresql://%s:@localhost:5432/%s" % (db_user, db_name)

engine = sqlalchemy.create_engine(DSN)

create_tables(engine)

Session = sessionmaker(bind=engine)
session = Session()

with open("fixtures/tests_data.json", "r") as fd:
    data = json.load(fd)

for record in data:
    model = {
        "publisher": Publisher,
        "book": Book,
        "shop": Shop,
        "stock": Stock,
        "sale": Sale,
    }[record["model"]]
    session.add(model(id=record["pk"], **record["fields"]))


session.commit()
session.close()
