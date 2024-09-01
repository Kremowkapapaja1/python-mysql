import mysql.connector
from mysql.connector import Error

def create_connection():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="password!", 
            database="baza" 
        )
        if connection.is_connected():
            print("Połączono z bazą danych MySQL")
            return connection
    except Error as e:
        print(f"Błąd: {e}")
        return None

def create_table(connection, table_name, columns):
    try:
        cursor = connection.cursor()
        
        create_table_query = f"CREATE TABLE {table_name} ({columns})"
        cursor.execute(create_table_query)
        connection.commit()
        print(f"Tabela {table_name} została utworzona.")
    except Error as e:
        print(f"Błąd przy tworzeniu tabeli {table_name}: {e}")


new_table_name = "Zamowienia"
new_columns = """
    ZamowienieID INT PRIMARY KEY AUTO_INCREMENT,
    KlientID INT,
    ProduktID INT,
    Ilosc INT,
    DataZamowienia DATE,
    FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID),
    FOREIGN KEY (ProduktID) REFERENCES Produkty(ProduktID)
"""


connection = create_connection()


if connection:
    create_table(connection, new_table_name, new_columns)
    

    connection.close()
