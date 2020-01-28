USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view_imie_nazwisko_pesel_kontakt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view_uczen_oceny_ID` ( `ID_ucznia` INT, `Rodzaj_Oceny` INT, `Ocena` INT, `Przedmiot` INT, `Wystawiona_Przez` INT, `data` int);

-- -----------------------------------------------------
-- View `mydb`.`view_imie_nazwisko_pesel_kontakt`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view_uczen_oceny_ID`;
USE `mydb`;
CREATE  OR REPLACE VIEW `view_uczen_oceny_ID` AS
SELECT Osoba_ucznia.Imię as Imię_ucznia, Osoba_ucznia.Nazwisko as Nazwisko_ucznia, Klasa.Nazwa_klasy, Rodzaj_przedmiotu.Nazwa_rodzaju_przedmiotu as Nazwa_przedmiotu, Rodzaj_Oceny.Nazwa as Rodzaj_Oceny, Ocena.wartość_oceny as Ocena, Ocena.data_oceny as data_oceny, Osoba_nauczyciela.Imię as Imię_nauczyciela, Osoba_nauczyciela.Nazwisko as Nazwisko_nauczyciela, Nauczyciel.Stopień_naukowy as Tytuł_nauczyciela, Ocena.uwagi_do_oceny as Uwagi
FROM Ocena
join Przedmiot on ( Ocena.ID_przedmiotu = Przedmiot.idPrzedmiot )
join Rodzaj_przedmiotu on ( Przedmiot.ID_Rodzaj_przedmiotu = Rodzaj_przedmiotu.idRodzaj_przedmiotu )
join Rodzaj_Oceny on ( Ocena.ID_rodzaju_oceny = Rodzaj_Oceny.idRodzaj_Oceny )
join Uczeń on ( Ocena.ID_ucznia = Uczeń.idUczeń )
join Nauczyciel on ( Ocena.ID_Nauczyciela = Nauczyciel.idNauczyciel )
join Klasa on (Uczeń.ID_klasy = Klasa.idKlasa)
join Osoba as Osoba_ucznia on ( Uczeń.ID_osoby = Osoba_ucznia.idOsoba )
join Osoba as Osoba_nauczyciela on ( Nauczyciel.ID_osoby = Osoba_nauczyciela.idOsoba );