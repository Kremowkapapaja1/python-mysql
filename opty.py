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

def add_data_to_table(connection, table_name, data):
    try:
        cursor = connection.cursor()
        
        if table_name == 'Produkty':
            insert_query = '''
            INSERT INTO Produkty (Nazwa, Cena, Opis, Kategoria) 
            VALUES (%s, %s, %s, %s)
            '''
        elif table_name == 'Klienci':
            insert_query = '''
            INSERT INTO Klienci (Imie, Nazwisko, Email, Telefon, Adres) 
            VALUES (%s, %s, %s, %s, %s)
            '''
        elif table_name == 'Pracownicy':
            insert_query = '''
            INSERT INTO Pracownicy (Imie, Nazwisko, Stanowisko, Email, Telefon, Adres) 
            VALUES (%s, %s, %s, %s, %s, %s)
            '''
        elif table_name == 'Faktury':
            insert_query = '''
            INSERT INTO Faktury (KlientID, PracownikID, Data) 
            VALUES (%s, %s, %s)
            '''
        else:
            print("Nieznana tabela!")
            return

        cursor.executemany(insert_query, data)
        connection.commit()
        print(f"{cursor.rowcount} rekordów dodanych do tabeli {table_name}.")
    except Error as e:
        print(f"Błąd przy dodawaniu danych do tabeli {table_name}: {e}")
        connection.rollback()

# Przykładowe dane
produkty = [
    ("Produkt A", 10.99, "Opis produktu A", "Kategoria 1"),
    ("Produkt B", 25.50, "Opis produktu B", "Kategoria 2")
]

klienci = [
    ("Jan", "Kowalski", "jan.kowalski@example.com", "123456789", "ul. Przyklad 1"),
    ("Anna", "Nowak", "anna.nowak@example.com", "987654321", "ul. Przyklad 2")
]

pracownicy = [
    ("Adam", "Nowicki", "Manager", "adam.nowicki@example.com", "654321987", "ul. Pracownik 1"),
    ("Ewa", "Kowalczyk", "Sprzedawca", "ewa.kowalczyk@example.com", "789456123", "ul. Pracownik 2")
]

faktury = [
    (1, 1, "2024-01-01"),
    (2, 2, "2024-02-01")
]

connection = create_connection()

if connection:
    add_data_to_table(connection, 'Produkty', produkty)
    add_data_to_table(connection, 'Klienci', klienci)
    add_data_to_table(connection, 'Pracownicy', pracownicy)
    add_data_to_table(connection, 'Faktury', faktury)
    

    connection.close()
