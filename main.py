import psycopg2


def create_table(conn):
    """Создание таблицы в базе данных"""
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


def add_client(conn, first_name: str, last_name: str, email: str):
    """Добавление нового клиента"""
    cur = conn.cursor()
    cur.execute(
        """
        INSERT INTO clients (first_name, last_name, email) VALUES (%s, %s, %s)
        """,
        (first_name, last_name, email),
    )


def add_phone(client_id: int, phone: str):
    """Добавление телефона для существующего клиента"""
    cur = conn.cursor()
    cur.execute(
        """
        UPDATE clients SET phone = array_append(phone, %s) WHERE id = %s
        """,
        (phone, client_id),
    )


def update_client(conn, client_id, **kwargs):
    """Обновление существующего клиента"""
    set_clause = ", ".join([f"{field} = %s" for field in kwargs.keys()])
    values = list(kwargs.values())
    values.append(client_id)

    with conn.cursor() as cur:
        cur.execute(
            f"""
            UPDATE clients
            SET {set_clause}
            WHERE id = %s
        """,
            values,
        )


def delete_phone(conn, client_id: int, phone: str):
    """Удаление телефона для существующего клиента"""
    cur = conn.cursor()
    cur.execute(
        """
        UPDATE clients SET phone = array_remove(phone, %s) WHERE id = %s
        """,
        (phone, client_id),
    )


def delete_client(conn, client_id: int):
    """Удаление существующего клиента"""
    cur = conn.cursor()
    cur.execute(
        """
        DELETE FROM clients WHERE id = %s
        """,
        (client_id,),
    )


def find_client(conn, data: str) -> list:
    """Поиск клиента по имени, фамилии или почте"""
    cur = conn.cursor()
    cur.execute(
        """
        SELECT * FROM clients WHERE first_name = %s OR last_name = %s OR email = %s OR %s = ANY(phone)
        """,
        (data, data, data, data),
    )
    result = cur.fetchall()
    return result


def get_client_info(conn) -> list:
    """Получение информации о всех клиентах"""
    cur = conn.cursor()
    cur.execute(
        """
        SELECT id, first_name, last_name, email FROM clients
        """
    )
    result = cur.fetchall()
    return result


with psycopg2.connect(database="netology_db", user="postgres", password="") as conn:
    if __name__ == "__main__":
        # create_table()
        # add_client(conn, "Xьюго", "Лоскин", "hugo@boss.com")
        # add_client(conn, "Бен", "Кеноби", "jd@stars.com")
        add_client(conn, "Cэм", "Джексон", "english@home.com")
        # add_phone(2, "+723456732323")
        # update_client(conn, 7, last_name="Чубака")
        # update_client(conn, 7, first_name="Вася")
        update_client(
            conn, 7, first_name="Вася", last_name="Пупкин", email="vue@sue.com"
        )
        # delete_phone(2, "+723456801")
        # delete_client(conn, 2)
        # print(get_client_info(conn))
        # print(find_client("ivan@mail.com"))
conn.close()
