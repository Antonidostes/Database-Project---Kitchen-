Funkcje AntBie:

CREATE OR REPLACE FUNCTION awans(id_pracownik INTEGER)
RETURNS VOID AS $$
BEGIN
	UPDATE PRACOWNICY
	SET stopien_zaawansowania = stopien_zaawansowania + 1
	WHERE id_pracownika = id_pracownik;
END;
$$ LANGUAGE plpgsql;

, termin DATE, godzina_rozpoczecia TIME, godzina_zakonczenia TIME

B)
CREATE OR REPLACE FUNCTION sprawdz_zaaw(id_przepis INTEGER, id_pracownik INTEGER)
RETURNS BOOLEAN AS $$
DECLARE
	zaawansowanie INTEGER;
	trudnosc INTEGER;
BEGIN
	SELECT pracownicy.stopien_zaawansowania INTO zaawansowanie FROM PRACOWNICY WHERE pracownicy.id_pracownika = id_pracownik;
	SELECT przepisy.stopien_trudnosci INTO trudnosc FROM PRZEPISY WHERE przepisy.id_przepisu = id_przepis;
	IF (zaawansowanie < trudnosc) THEN
			RAISE EXCEPTION 'Dany pracownik nie może zrealizować danego przepisu, jest on dla niego za trudny.';
	END IF;
RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

select sprawdz_zaaw(4,1);
select sprawdz_zaaw(1,4);

CREATE OR REPLACE FUNCTION sprawdz_dostep(id_pracownik INTEGER, godzina_rozpoczec TIME, godzina_zakonczen TIME, termin DATE)
RETURNS BOOLEAN AS $$
DECLARE
	krotka RECORD;
BEGIN
	FOR krotka IN SELECT * FROM REZERWACJE LOOP
		IF (krotka.id_rezerwujacego = id_pracownik) THEN
			IF (krotka.termin = termin) THEN
				IF ((krotka.godzina_rozpoczecia <= godzina_rozpoczec AND godzina_rozpoczec <= krotka.godzina_zakonczenia)
				OR (krotka.godzina_rozpoczecia <= godzina_zakonczen AND godzina_zakonczen <= krotka.godzina_zakonczenia)) THEN
					RAISE EXCEPTION 'Dany pracownik jest juz w tym terminie zajety, nie moze zrealizowac przepisu.';
				END IF;
			END IF;
		END IF;
	END LOOP;
RETURN TRUE;	
END;
$$ LANGUAGE plpgsql;

select sprawdz_dostep(2,'15:00:00','16:00:00','2024.01.29');

###################### od Ali:

CREATE OR REPLACE FUNCTION czy_jest_dostepny_produkt(typ_produktu TEXT, ilosc DECIMAL)
 RETURNS BOOLEAN  AS $$
 DECLARE ilosc_produktu DECIMAL;
 BEGIN 
	 SELECT ilosc into ilosc_produktu
	 from dostepne_produkty_suma 
	 where typ_produktu=typ_produktu;
	 
	 RETURN (ilosc_produktu>=ilosc);
 END;
$$LANGUAGE 'plpgsql';

create view dostepne_produkty_suma AS
SELECT Produkty.typ_produktu, sum(ilosc) as ilosc, jednostka_ilosci
from Produkty, Typy_produktu
where id_rezerwacji IS NULL 
	and termin_przydatnosci > (SELECT max(data_dzis) from DANE_OGOLNE)
group by Produkty.typ_produktu, jednostka_ilosci;

select * from dostepne_produkty_suma;
--drop view dostepne_produkty_suma;

################################ Znowu Twoje:

CREATE OR REPLACE FUNCTION REZERWACJA(id_pracownik INTEGER, id_przepis INTEGER, godzina_rozpoczec TIME, godzina_zakonczen TIME, termin DATE)
RETURNS BOOLEAN AS $$
DECLARE
	krotka RECORD;
BEGIN
	IF (sprawdz_zaaw(id_przepis, id_pracownik) = TRUE AND sprawdz_dostep(id_pracownik, godzina_rozpoczec, godzina_zakonczen, termin) = TRUE)
		FOR krotka IN SELECT * FROM Skladniki_przepisu LOOP
			IF krotka.id_przepisu = id_przepis
				
			END IF;
	END IF;
END;
$$ LANGUAGE plpgsql;
