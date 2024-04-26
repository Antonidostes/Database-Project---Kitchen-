# Uzupełnianie tabel:

######################## UZUPEŁNIANIE TABEL

--1 Rodzaje_produktu

INSERT INTO RODZAJE_PRODUKTU(rodzaj_produktu) VALUES
('ryby'),('pieczywo'),('nabial'),('przyprawy'),('warzywa'),
	('owoce'),('mieso');

--2 Typ_sprzetu:

INSERT INTO TYPY_SPRZETU(typ_sprzetu) VALUES
('parowar'),
('garnek'),
('patelnia'),
('parownica'),
('piekarnik'),
('mikrofala'),
('mikser');

--3 Pracownicy:

INSERT INTO PRACOWNICY(imie,nazwisko,stopien_zaawansowania) VALUES
('Adam','Abacki', 5),
('Bartosz','Babacki',6),
('Grzegorz', 'Brzeczyszczykiewicz', 8),
('Anna','Nowak', 7),
('Jan','Kowalski',10);

--4 Spiżarnia:

INSERT INTO SPIZARNIA(miejsce) VALUES
('lodówka nr 1'),
('lodówka nr 2'),
('szuflada nr 1'),
('szafka nr 1'), 
('szafka nr 2'), 
('szafka nr 3'),
('chlebak nr 1'), 
('chlebak nr. 2'), 
('zamrażarka');

--5 Typy_produktu:

INSERT INTO TYPY_PRODUKTU(typ_produktu,jednostka_ilosci,rodzaj_produktu) VALUES
('losos', 'kg', 'ryby'),
('brokuly', 'kg', 'warzywa'),
('koperek', 'kg', 'warzywa'),
('schab', 'kg', 'mieso'),
('ziemniaki', 'kg', 'warzywa'),
('bulka pszenna','szt.','pieczywo'),
('marchew','kg', 'warzywa'),
('jablko szara reneta', 'kg', 'owoce'),
('mleko UHT', 'l','nabial')
('szynka biala parzona', 'kg', 'mieso'), 
('ser zolty', 'kg', 'nabial'),
('bulka','szt.','pieczywo'),
('jablko', 'kg', 'owoce'),
('mleko', 'l','nabial');

--6 Produkty:

INSERT INTO PRODUKTY(ilosc, typ_produktu, lokalizacja, id_rezerwacji, termin_przydatnosci) VALUES
(4, 'losos', 'lodówka nr 1', NULL, '25.01.2024'),
(2, 'losos', 'lodówka nr 1', NULL, '30.01.2024'),
(1.5, 'brokuly', 'szafka nr 3', NULL, '20.02.2024'),
(0.2, 'koperek', 'lodówka nr 2', NULL, '03.02.2024'),
(2, 'schab', 'lodówka nr 2', NULL, '01.02.2024'),
(5, 'ziemniaki', 'lodówka nr 2', NULL, '10.02.2024'),
(0.5, 'ser zolty', 'lodówka nr 1', NULL, '28.01.2024'),
(1, 'mleko UHT', 'lodówka nr 1', NULL, '29.01.2024'),
(6, 'mleko UHT', 'szafka nr 1', NULL, '15.02.2024'),
(20, 'marchew', 'lodówka nr 2', NULL, '05.02.2024'),
(5, 'bulka pszenna', 'chlebak nr. 2', NULL, '31.01.2024');

--7 Sprzety:

INSERT INTO SPRZETY(nazwa, czy_sprawny, typ_sprzetu) VALUES
('gar 5 litrów', TRUE, 'garnek'),
('garnek 2 litry', TRUE, 'garnek'),
('patelnia teflonowa', TRUE, 'patelnia'),
('parowar RAVEN EP002', TRUE, 'parowar'),
('piekarnik Bosch', TRUE, 'piekarnik'),
('mikser AD2024', TRUE, 'mikser'),
('mikrofalówka A12', TRUE, 'mikrofala'),
('garnek 2 litry', FALSE, 'garnek'),
('garnek 2 litry', TRUE, 'garnek');

--8 Przepisy:

INSERT INTO PRZEPISY(tytul, opis, czas_przygotowania_minuty, dla_ilu_osob, stopien_trudnosci) VALUES
('kotlet schabowy z ziemniakami i tartą marchewką','Klasyczny polski kotlet schabowy','120', '4', 5),
('łosoś na parze', 'zdrowe danie rybne', 200, 4, 9);

--9 SPRZETY_przepisu:

INSERT INTO SPRZETY_przepisu(id_przepisu, typ_sprzetu) VALUES
(3,'garnek'),
(4,'garnek'),
(4,'parowar');

--10 SKLADNIKI_PRZEPISU:

INSERT INTO SKLADNIKI_PRZEPISU(id_przepisu, typ_produktu, ilosc, czy_konieczny) VALUES
(3, 'schab', 1, TRUE),
(3, 'ziemniaki', 1, TRUE),
(3, 'marchew', 0.5, TRUE),
(3, 'koperek', 0.1, FALSE),
(4, 'losos', 1.2, TRUE),
(4, 'ziemniaki', 1, TRUE),
(4, 'brokuly', 0.5, TRUE);

-- Rezerwacja na schabowe
--11 Rezerwacje:

INSERT INTO REZERWACJE(termin, godzina_rozpoczecia, godzina_zakonczenia, id_rezerwujacego) VALUES
('29.01.2024', '15:00', '17:00', 2);

--12 REZERWACJE_SPRZETOW:

INSERT INTO REZERWACJE_SPRZETOW(id_rezerwacji, id_sprzetu) VALUES
(2, 1);

--13 Dane ogólne:

INSERT INTO DANE_OGOLNE(data_dzis) VALUES 
(CURRENT_DATE);
SELECT * from DANE_OGOLNE;