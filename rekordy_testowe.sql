INSERT INTO `mydb`.`Osoba` (`idOsoba`, `Imię`, `Nazwisko`, `Data_urodzenia`, `PESEL`, `Uprawnienia`)
 VALUES (1, 'Jest', 'Kowalski', '01.01.2000', '00010101354', 1);
INSERT INTO `mydb`.`Osoba` (`idOsoba`, `Imię`, `Nazwisko`, `Data_urodzenia`, `PESEL`, `Uprawnienia`) 
VALUES (2, 'Naucza', 'Przedmiotu', '01.01.2000', '00010101356', 1);
INSERT INTO `mydb`.`Osoba` ( `Imię`, `Nazwisko`, `Data_urodzenia`, `PESEL`, `Uprawnienia`) 
VALUES ('Pan', 'Matematyk', '01.01.2000', '00010101359', 1);
INSERT INTO `mydb`.`Osoba` ( `Imię`, `Nazwisko`, `Data_urodzenia`, `PESEL`, `Uprawnienia`) 
VALUES ('Panna', 'Polska', '01.01.2000', '00010101381', 1);
INSERT INTO `mydb`.`Osoba` ( `Imię`, `Nazwisko`, `Data_urodzenia`, `PESEL`, `Uprawnienia`) 
VALUES ('Uczynny', 'Test', '01.01.2000', '00010101399', 1);
INSERT INTO `mydb`.`Osoba` ( `Imię`, `Nazwisko`, `Data_urodzenia`, `PESEL`, `Uprawnienia`) 
VALUES ('Żałosny', 'Uczniak', '01.01.2000', '0001010138', 1);

insert into `mydb`.`Nauczyciel` (`idNauczyciel`, `ID_osoby`, `Stopień_naukowy`)
values (1, 1, 'Magister');
insert into `mydb`.`Nauczyciel` (`ID_osoby`, `Stopień_naukowy`)
values (2, 'Profesor');
insert into `mydb`.`Nauczyciel` (`ID_osoby`, `Stopień_naukowy`)
values (3, 'Nikt');

insert into `mydb`.`Klasa` (`idKlasa`, `ID_wychowawcy`, `Nazwa_klasy`, `Rok_szkolny`)
 values (1, 1, '1A', 2012);
 insert into `mydb`.`Klasa` (`ID_wychowawcy`, `Nazwa_klasy`, `Rok_szkolny`)
values (2, '1B', 2015);

insert into `mydb`.`Rodzaj_przedmiotu` (`idRodzaj_przedmiotu`, `Nazwa_rodzaju_przedmiotu`) 
values (1, 'Matematyka');
insert into `mydb`.`Rodzaj_przedmiotu` (`Nazwa_rodzaju_przedmiotu`) 
values ('J. Polski');

insert into `mydb`.`Przedmiot` (`idPrzedmiot`, `ID_Rodzaj_przedmiotu`, `ID_klasy`)
 values (1, 1, 1);
 insert into `mydb`.`Przedmiot` (`ID_Rodzaj_przedmiotu`, `ID_klasy`)
 values (2, 1);
 insert into `mydb`.`Przedmiot` (`ID_Rodzaj_przedmiotu`, `ID_klasy`)
 values (1, 2);
 insert into `mydb`.`Przedmiot` (`ID_Rodzaj_przedmiotu`, `ID_klasy`)
 values (2, 2);

-- wiazanie przedmiotu z nauczycielem
insert into `mydb`.`Nauczyciel_Przedmiot` (`ID_Nauczyciel`, `ID_Przedmiot`)
values (1,1);
insert into `mydb`.`Nauczyciel_Przedmiot` (`ID_Nauczyciel`, `ID_Przedmiot`)
values (2,1);
insert into `mydb`.`Nauczyciel_Przedmiot` (`ID_Nauczyciel`, `ID_Przedmiot`)
values (3,4);
insert into `mydb`.`Nauczyciel_Przedmiot` (`ID_Nauczyciel`, `ID_Przedmiot`)
values (3,2);

insert into `mydb`.`Uczeń` (`idUczeń`, `ID_osoby`, `ID_klasy`)
 value (1, 4, 1);
 insert into `mydb`.`Uczeń` (`idUczeń`, `ID_osoby`, `ID_klasy`)
 value (2, 5, 1);
 insert into `mydb`.`Uczeń` (`idUczeń`, `ID_osoby`, `ID_klasy`)
 value (3, 6, 2);


insert into `mydb`.`Rodzaj_Oceny` (`idRodzaj_Oceny`, `Nazwa`, `Waga`)
 value (1, 'Sprawdzian', 100);
 insert into `mydb`.`Rodzaj_Oceny` (`Nazwa`, `Waga`)
 value ('Karkówka', 50);
 
 insert into `mydb`.`Ocena` (`idOcena`, `ID_przedmiotu`, `ID_rodzaju_oceny`, `ID_ucznia`, `wartość_oceny`, `data_oceny`, `uwagi_do_oceny`, `ID_Nauczyciela`)
 values (1, 1, 1, 1, 1, current_timestamp(), 'uwaga do oceny', 1);
 insert into `mydb`.`Ocena` (`ID_przedmiotu`, `ID_rodzaju_oceny`, `ID_ucznia`, `wartość_oceny`, `data_oceny`, `uwagi_do_oceny`, `ID_Nauczyciela`)
 values (1, 2, 1, 2.5, current_timestamp(), 'uwaga do oceny', 2);
  insert into `mydb`.`Ocena` (`ID_przedmiotu`, `ID_rodzaju_oceny`, `ID_ucznia`, `wartość_oceny`, `data_oceny`, `uwagi_do_oceny`, `ID_Nauczyciela`)
 values (2, 1, 1, 5, current_timestamp(), 'uwaga do oceny', 3);
 insert into `mydb`.`Ocena` (`ID_przedmiotu`, `ID_rodzaju_oceny`, `ID_ucznia`, `wartość_oceny`, `data_oceny`, `uwagi_do_oceny`, `ID_Nauczyciela`)
 values (2, 2, 1, 3.5, current_timestamp(), 'uwaga do oceny', 1);
 
 insert into `mydb`.`Ocena` (`ID_przedmiotu`, `ID_rodzaju_oceny`, `ID_ucznia`, `wartość_oceny`, `data_oceny`, `uwagi_do_oceny`, `ID_Nauczyciela`)
 values (1, 2, 2, 6, current_timestamp(), 'uwaga do oceny', 1);
  insert into `mydb`.`Ocena` (`ID_przedmiotu`, `ID_rodzaju_oceny`, `ID_ucznia`, `wartość_oceny`, `data_oceny`, `uwagi_do_oceny`, `ID_Nauczyciela`)
 values (2, 1, 2, 1, current_timestamp(), 'uwaga do oceny', 2);
 insert into `mydb`.`Ocena` (`ID_przedmiotu`, `ID_rodzaju_oceny`, `ID_ucznia`, `wartość_oceny`, `data_oceny`, `uwagi_do_oceny`, `ID_Nauczyciela`)
 values (2, 2, 2, 5, current_timestamp(), 'uwaga do oceny', 1);
 
 insert into `mydb`.`Ocena` (`ID_przedmiotu`, `ID_rodzaju_oceny`, `ID_ucznia`, `wartość_oceny`, `data_oceny`, `uwagi_do_oceny`, `ID_Nauczyciela`)
 values (3, 1, 3, 2.5, current_timestamp(), 'uwaga do oceny', 3);
  insert into `mydb`.`Ocena` (`ID_przedmiotu`, `ID_rodzaju_oceny`, `ID_ucznia`, `wartość_oceny`, `data_oceny`, `uwagi_do_oceny`, `ID_Nauczyciela`)
 values (4, 1, 3, 5, current_timestamp(), 'uwaga do oceny', 3);
 insert into `mydb`.`Ocena` (`ID_przedmiotu`, `ID_rodzaju_oceny`, `ID_ucznia`, `wartość_oceny`, `data_oceny`, `uwagi_do_oceny`, `ID_Nauczyciela`)
 values (3, 2, 3, 3.5, current_timestamp(), 'uwaga do oceny', 2);

 insert into `mydb`.`Uczeń_Opiekun` (`ID_Ucznia`,`ID_opiekuna`) values (1,1);
  insert into `mydb`.`Uczeń_Opiekun` (`ID_Ucznia`,`ID_opiekuna`) values (2,2);
  insert into `mydb`.`Uczeń_Opiekun` (`ID_Ucznia`,`ID_opiekuna`) values (3,1);
  insert into `mydb`.`Uczeń_Opiekun` (`ID_Ucznia`,`ID_opiekuna`) values (1,3);
 



