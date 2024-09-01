-- Tworzenie tabeli Produkty
CREATE TABLE Produkty (
    ProduktID INT PRIMARY KEY AUTO_INCREMENT,
    Nazwa VARCHAR(255) NOT NULL,
    Cena DECIMAL(10, 2) NOT NULL,
    Opis TEXT,
    Kategoria VARCHAR(100)
);

-- Tworzenie tabeli Klienci
CREATE TABLE Klienci (
    KlientID INT PRIMARY KEY AUTO_INCREMENT,
    Imie VARCHAR(50) NOT NULL,
    Nazwisko VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telefon VARCHAR(20),
    Adres VARCHAR(255)
);

-- Tworzenie tabeli Pracownicy
CREATE TABLE Pracownicy (
    PracownikID INT PRIMARY KEY AUTO_INCREMENT,
    Imie VARCHAR(50) NOT NULL,
    Nazwisko VARCHAR(50) NOT NULL,
    Stanowisko VARCHAR(100),
    Email VARCHAR(100) NOT NULL,
    Telefon VARCHAR(20),
    Adres VARCHAR(255)
);

-- Tworzenie tabeli Faktury
CREATE TABLE Faktury (
    FakturaID INT PRIMARY KEY AUTO_INCREMENT,
    KlientID INT,
    PracownikID INT,
    Data DATE,
    FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID),
    FOREIGN KEY (PracownikID) REFERENCES Pracownicy(PracownikID)
);

-- Tworzenie tabeli Zamówienia
CREATE TABLE Zamowienia (
    ZamowienieID INT PRIMARY KEY AUTO_INCREMENT,
    KlientID INT,
    ProduktID INT,
    Data DATE,
    Ilosc INT,
    FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID),
    FOREIGN KEY (ProduktID) REFERENCES Produkty(ProduktID)
);

-- Tworzenie tabeli Sprzedaż
CREATE TABLE Sprzedaz (
    SprzedazID INT PRIMARY KEY AUTO_INCREMENT,
    ProduktID INT,
    Data DATE,
    Ilosc INT,
    FOREIGN KEY (ProduktID) REFERENCES Produkty(ProduktID)
);

-- Tworzenie tabeli Recenzje
CREATE TABLE Recenzje (
    RecenzjaID INT PRIMARY KEY AUTO_INCREMENT,
    ProduktID INT,
    KlientID INT,
    Ocena INT,
    Komentarz TEXT,
    FOREIGN KEY (ProduktID) REFERENCES Produkty(ProduktID),
    FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID)
);
-- Tworzenie tabeli Produkty
CREATE TABLE Produkty (
    ProduktID INT PRIMARY KEY AUTO_INCREMENT,
    Nazwa VARCHAR(255) NOT NULL,
    Cena DECIMAL(10, 2) NOT NULL,
    Opis TEXT,
    Kategoria VARCHAR(100)
);

-- Tworzenie tabeli Klienci
CREATE TABLE Klienci (
    KlientID INT PRIMARY KEY AUTO_INCREMENT,
    Imie VARCHAR(50) NOT NULL,
    Nazwisko VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telefon VARCHAR(20),
    Adres VARCHAR(255),
    DataRejestracji DATE DEFAULT NOW()
);

-- Tworzenie tabeli Pracownicy
CREATE TABLE Pracownicy (
    PracownikID INT PRIMARY KEY AUTO_INCREMENT,
    Imie VARCHAR(50) NOT NULL,
    Nazwisko VARCHAR(50) NOT NULL,
    Stanowisko VARCHAR(100),
    Email VARCHAR(100) NOT NULL,
    Telefon VARCHAR(20),
    Adres VARCHAR(255),
    DataUrodzenia DATE
);

-- Tworzenie tabeli Faktury
CREATE TABLE Faktury (
    FakturaID INT PRIMARY KEY AUTO_INCREMENT,
    KlientID INT,
    PracownikID INT,
    Data DATE,
    FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID),
    FOREIGN KEY (PracownikID) REFERENCES Pracownicy(PracownikID)
);

-- Tworzenie tabeli Zamowienia
CREATE TABLE Zamowienia (
    ZamowienieID INT PRIMARY KEY AUTO_INCREMENT,
    KlientID INT,
    ProduktID INT,
    Data DATE,
    Ilosc INT,
    FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID),
    FOREIGN KEY (ProduktID) REFERENCES Produkty(ProduktID)
);

-- Tworzenie tabeli Sprzedaz
CREATE TABLE Sprzedaz (
    SprzedazID INT PRIMARY KEY AUTO_INCREMENT,
    ProduktID INT,
    Data DATE,
    Ilosc INT,
    FOREIGN KEY (ProduktID) REFERENCES Produkty(ProduktID)
);

-- Tworzenie tabeli Recenzje
CREATE TABLE Recenzje (
    RecenzjaID INT PRIMARY KEY AUTO_INCREMENT,
    ProduktID INT,
    KlientID INT,
    Ocena INT,
    Komentarz TEXT,
    FOREIGN KEY (ProduktID) REFERENCES Produkty(ProduktID),
    FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID)
);

-- Tworzenie tabeli Adresy
CREATE TABLE Adresy (
    AdresID INT PRIMARY KEY AUTO_INCREMENT,
    KlientID INT,
    TypAdresu VARCHAR(50),
    Adres VARCHAR(255),
    FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID)
);

-- Tworzenie tabeli LogowanieKlienci
CREATE TABLE LogowanieKlienci (
    LogowanieID INT PRIMARY KEY AUTO_INCREMENT,
    KlientID INT,
    Login VARCHAR(50),
    Haslo VARCHAR(255),
    FOREIGN KEY (KlientID) REFERENCES Klienci(KlientID)
);

-- Tworzenie tabeli LogowaniePracownicy
CREATE TABLE LogowaniePracownicy (
    LogowanieID INT PRIMARY KEY AUTO_INCREMENT,
    PracownikID INT,
    Login VARCHAR(50),
    Haslo VARCHAR(255),
    FOREIGN KEY (PracownikID) REFERENCES Pracownicy(PracownikID)
);

-- Tworzenie tabeli Producenci
CREATE TABLE Producenci (
    ProducentID INT PRIMARY KEY AUTO_INCREMENT,
    Nazwa VARCHAR(255)
);

-- Dodanie kolumny ProducentID do tabeli Produkty
ALTER TABLE Produkty ADD ProducentID INT;

-- Dodanie klucza obcego do tabeli Produkty
ALTER TABLE Produkty ADD CONSTRAINT FK_Produkty_Producenci FOREIGN KEY (ProducentID) REFERENCES Producenci(ProducentID);