import sqlalchemy
import sqlalchemy as sq
from sqlalchemy.orm import declarative_base, relationship, sessionmaker

Base = declarative_base()


class Publisher(Base):
    __tablename__ = "publishers"

    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.String(length=60), unique=True, nullable=False)

    def __str__(self):
        return f"{self.id}: {self.name}"


class Book(Base):
    __tablename__ = "books"

    id = sq.Column(sq.Integer, primary_key=True)
    title = sq.Column(sq.String(length=60), nullable=False)
    id_publisher = sq.Column(sq.Integer, sq.ForeignKey("publishers.id"), nullable=False)

    publisher = relationship(Publisher, backref="books")

    def __str__(self):
        return f"{self.id}: {self.title}"


class Shop(Base):
    __tablename__ = "shops"

    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.String(length=60), unique=True, nullable=False)

    def __str__(self):
        return f"{self.id}: {self.name}"


class Stock(Base):
    __tablename__ = "stock"

    id = sq.Column(sq.Integer, primary_key=True)
    id_book = sq.Column(sq.Integer, sq.ForeignKey("books.id"), nullable=False)
    id_shop = sq.Column(sq.Integer, sq.ForeignKey("shops.id"), nullable=False)
    count = sq.Column(sq.Integer, nullable=False)

    book = relationship(Book, backref="stock")
    shop = relationship(Shop, backref="stock")

    def __str__(self):
        return f"{self.id}: {self.count}"


class Sale(Base):
    __tablename__ = "sales"

    id = sq.Column(sq.Integer, primary_key=True)
    price = sq.Column(sq.Float, nullable=False)
    date_sale = sq.Column(sq.Date, nullable=False)
    id_stock = sq.Column(sq.Integer, sq.ForeignKey("stock.id"), nullable=False)
    count = sq.Column(sq.Integer, nullable=False)

    stock = relationship(Stock, backref="sales")

    def __str__(self):
        return f"{self.id}: {self.price}"
