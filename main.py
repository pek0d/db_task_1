import psycopg2


def connect():
    """Установка соединения с базой данных"""
    conn = psycopg2.connect(
        dbname="netology_db",
        user="postgres",
        password="",
    )
    return conn


def create_table():
    """Создание таблицы в базе данных"""
    conn = connect()
    cur = conn.cursor()
    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS clients (
            id SERIAL PRIMARY KEY,
            first_name TEXT,
            last_name TEXT,
            email TEXT UNIQUE,
            phone TEXT[]
        )
        """
    )
    conn.commit()
    conn.close()


def add_client(first_name: str, last_name: str, email: str):
    """Добавление нового клиента"""
    conn = connect()
    cur = conn.cursor()
    cur.execute(
        """
        INSERT INTO clients (first_name, last_name, email) VALUES (%s, %s, %s)
        """,
        (first_name, last_name, email),
    )
    conn.commit()
    conn.close()


def add_phone(client_id: int, phone: str):
    """Добавление телефона для существующего клиента"""
    conn = connect()
    cur = conn.cursor()
    cur.execute(
        """
        UPDATE clients SET phone = array_append(phone, %s) WHERE id = %s
        """,
        (phone, client_id),
    )
    conn.commit()
    conn.close()


def update_client(
    client_id: int, first_name: str, last_name: str, email: str, phone: str
):
    """Обновление информации о существующем клиенте"""
    conn = connect()
    cur = conn.cursor()
    cur.execute(
        """
        UPDATE clients SET first_name = %s, last_name = %s, email = %s, phone = %s WHERE id = %s
        """,
        (first_name, last_name, email, phone, client_id),
    )
    conn.commit()
    conn.close()


def delete_phone(client_id: int, phone: str):
    """Удаление телефона для существующего клиента"""
    conn = connect()
    cur = conn.cursor()
    cur.execute(
        """
        UPDATE clients SET phone = array_remove(phone, %s) WHERE id = %s
        """,
        (phone, client_id),
    )
    conn.commit()
    conn.close()


def delete_client(client_id: int):
    """Удаление существующего клиента"""
    conn = connect()
    cur = conn.cursor()
    cur.execute(
        """
        DELETE FROM clients WHERE id = %s
        """,
        (client_id,),
    )
    conn.commit()
    conn.close()


def find_client(data: str) -> list:
    """Поиск клиента по имени, фамилии или почте"""
    conn = connect()
    cur = conn.cursor()
    cur.execute(
        """
        SELECT * FROM clients WHERE first_name = %s OR last_name = %s OR email = %s OR %s = ANY(phone)
        """,
        (data, data, data, data),
    )
    result = cur.fetchall()
    conn.close()
    return result


def get_client_info() -> list:
    """Получение информации о всех клиентах"""
    conn = connect()
    cur = conn.cursor()
    cur.execute(
        """
        SELECT id, first_name, last_name, email FROM clients
        """
    )
    result = cur.fetchall()
    conn.close()
    return result


# create_table()
# add_client("Xьюго", "Лоскин", "hugo@boss.com")
# add_client("Бен", "Кеноби", "jd@stars.com")
# add_client("Cэм", "Джексон", "english@home.com")
# add_phone(2, "+723456732323")
# update_client(2, "Леон", "Тучков", "ivan@mail.com", ["+723456801"])
# delete_phone(2, "+723456801")
delete_client(2)
print(get_client_info())
# print(find_client("ivan@mail.com"))
