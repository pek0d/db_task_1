import json

import sqlalchemy
from sqlalchemy.orm import sessionmaker

from models import Book, Publisher, Sale, Shop, Stock, create_tables
from settings import db_name, db_user

# подключение к базе
DSN = "postgresql://%s:@localhost:5432/%s" % (db_user, db_name)

engine = sqlalchemy.create_engine(DSN)

# создание таблиц
create_tables(engine)

# создание сессии
Session = sessionmaker(bind=engine)
session = Session()

# загрузка данных
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

# ввод имени или id издателя
publisher_input = input("Введите имя или id издателя: ")

# поиск издателя
try:
    publisher_id = int(publisher_input)
    publisher = session.query(Publisher).filter_by(id=publisher_id).first()
except ValueError:
    publisher = session.query(Publisher).filter_by(name=publisher_input).first()


if publisher:
    # поиск книги данного издателя
    books = session.query(Book).filter_by(id_publisher=publisher.id).all()

    if books:
        # поиск магазинов, продающие эти книги
        shops = (
            session.query(Shop)
            .join(Stock)
            .join(Book)
            .filter(Book.id.in_([book.id for book in books]))
            .distinct(Shop.id)
            .all()
        )

        if shops:
            print("Покупки книг издателя", publisher.name, ":")
            for book in books:
                for stock in book.stock:
                    for sale in stock.sales:
                        print(
                            f"{book.title} | {stock.shop.name} | {sale.price} | {sale.date_sale}"
                        )
        else:
            print("Не найдено магазинов, продающих книги издателя", publisher.name)
    else:
        print("Для издателя", publisher.name, "не найдено книг")
else:
    print("Издатель с именем или id", publisher_input, "не найден в базе данных")


session.close()
