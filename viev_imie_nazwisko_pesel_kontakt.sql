-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view_imie_nazwisko_pesel_kontakt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view_imie_nazwisko_pesel_kontakt` (`Imię` INT, `Nazwisko` INT, `PESEL` INT, `Rodzaj_kontaktu` INT, `adres_kontaktowy` INT);

-- -----------------------------------------------------
-- View `mydb`.`view_imie_nazwisko_pesel_kontakt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view_imie_nazwisko_pesel_kontakt`;
USE `mydb`;
CREATE  OR REPLACE VIEW `view_imie_nazwisko_pesel_kontakt` AS
SELECT Osoba.Imię, Osoba.Nazwisko as Nazwisko, Osoba.PESEL, Rodzaj_kontaktu.Nazwa as Rodzaj_kontaktu, Kontakt.adres_kontaktowy

FROM Osoba
left join Kontakt on ( Osoba.IdOsoba = Kontakt.ID_Osoby )
 left join Rodzaj_kontaktu on ( Kontakt.ID_rodzaju_kontaktu = Rodzaj_kontaktu.idRodzaj_kontaktu );

-- widoki testowe i w trakcie opracowywania

create or replace view `view_Uczeń_bez_opiekuna` as
SELECT Uczeń.idUczeń, Osoba.Imię, Osoba.Nazwisko, Klasa.Nazwa_klasy as "Klasa"
from Uczeń
join Osoba on ( Uczeń.ID_osoby = Osoba.idOsoba )
join Klasa on ( Uczeń.ID_klasy = Klasa.idKlasa );

create or replace view `view_Nauczyciel` as
select Nauczyciel.idNauczyciel, Osoba.Imię, Osoba.Nazwisko, Nauczyciel.Stopień_naukowy
from Nauczyciel
join Osoba on ( Nauczyciel.ID_osoby = Osoba.idOsoba );

create or replace view `view_Przedmiot_bez_nauczycieli` as
select Przedmiot.idPrzedmiot, concat( Rodzaj_przedmiotu.Nazwa_rodzaju_przedmiotu, ' ', Klasa.Nazwa_klasy ) as Przedmiot
from Przedmiot
join Rodzaj_przedmiotu on (Rodzaj_przedmiotu.idRodzaj_przedmiotu = Przedmiot.ID_Rodzaj_przedmiotu)
join Klasa on ( Klasa.idKlasa = Przedmiot.ID_klasy );
