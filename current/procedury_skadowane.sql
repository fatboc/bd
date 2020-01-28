DROP PROCEDURE IF EXISTS Dodaj_osobe;
delimiter //
create procedure Dodaj_osobe(in imie varchar(45),in nazwisko varchar(45), in data_urodzenia date,in PESEL CHAR(11))
begin

declare blad char(15);
declare rok varchar(4);
declare miesiac varchar(2);
declare dzien varchar(2);

set @rok = year(data_urodzenia);

INSERT INTO `mydb`.`Osoba` ( `Imię`, `Nazwisko`, `Data_urodzenia`, `PESEL`, `Uprawnienia`) 
VALUES (imie, nazwisko, data_urodzenia, PESEL, 0);

end; //
delimiter ;

DROP PROCEDURE IF EXISTS Dodaj_rodzaj_kontaktu;
delimiter //
create procedure Dodaj_rodzaj_kontaktu(in nazwa_rodzaju_kontaktu varchar(45))
begin

INSERT INTO `mydb`.`Rodzaj_kontaktu` (`Nazwa`) 
VALUES (nazwa_rodzaju_kontaktu);

end; //
delimiter ;


DROP PROCEDURE IF EXISTS Dodaj_kontakt;
delimiter //
create procedure Dodaj_kontakt(in nazwa_rodzaju_kontaktu varchar(45),in adres_kontaktowy varchar(45), in PESEL CHAR(11))
begin

declare id_rodzaju_kontaktu TINYINT UNSIGNED;
declare id_osoby SMALLINT;

select idRodzaj_kontaktu  into id_rodzaju_kontaktu from `mydb`.`Rodzaj_kontaktu`
where (nazwa_rodzaju_kontaktu = Rodzaj_kontaktu.Nazwa );

select idOsoba  into id_osoby from `mydb`.`Osoba`
where (PESEL = Osoba.PESEL );

INSERT INTO `mydb`.`Kontakt` (`ID_Osoby`, `ID_rodzaju_kontaktu`, `adres_kontaktowy`) 
VALUES (id_osoby ,id_rodzaju_kontaktu, adres_kontaktowy);

end; //
delimiter ;

DROP PROCEDURE IF EXISTS Dodaj_nauczyciela;
delimiter //
create procedure Dodaj_nauczyciela(in PESEL_nauczyciela CHAR(11), stopien_naukowy VARCHAR(45))
begin

declare id_osoby SMALLINT;

select idOsoba  into id_osoby from `mydb`.`Osoba`
where (PESEL_nauczyciela = Osoba.PESEL );

INSERT INTO `mydb`.`Nauczyciel` (`ID_osoby`,`Stopień_naukowy`) 
VALUES (id_osoby,stopien_naukowy);

end; //
delimiter ;


DROP PROCEDURE IF EXISTS Dodaj_klase;
delimiter //
create procedure Dodaj_klase(in nazwa_klasy varchar(45),rok_szkolny YEAR(4),PESEL_wychowawcy char(11))
begin

declare id_osoby_wychowawcy SMALLINT;
declare id_wychowawcy TINYINT UNSIGNED;

select idOsoba  into id_osoby_wychowawcy from `mydb`.`Osoba`
where (PESEL_wychowawcy = Osoba.PESEL );

select idNauczyciel into id_wychowawcy from `mydb`.`Nauczyciel`
where ( id_osoby_wychowawcy = Nauczyciel.ID_osoby );

INSERT INTO `mydb`.`Klasa` (`ID_wychowawcy`,`Nazwa_klasy`,`Rok_szkolny`) 
VALUES (id_wychowawcy,nazwa_klasy,rok_szkolny);

end; //
delimiter ;


DROP PROCEDURE IF EXISTS Dodaj_ucznia;
delimiter //
create procedure Dodaj_ucznia(in PESEL_ucznia CHAR(11), in PESEL_opiekuna CHAR(11), in nazwa_klasy varchar(45))
begin

declare id_klasy TINYINT;
declare id_ucznia SMALLINT;
declare id_osoby_ucznia SMALLINT;
declare id_osoby_opiekuna SMALLINT;

select idKlasa  into id_klasy from `mydb`.`Klasa`
where (nazwa_klasy = Klasa.Nazwa_klasy );

select idOsoba  into id_osoby_ucznia from `mydb`.`Osoba`
where (PESEL_ucznia = Osoba.PESEL );

select idOsoba  into id_osoby_opiekuna from `mydb`.`Osoba`
where (PESEL_opiekuna = Osoba.PESEL );

insert into `mydb`.`Uczeń` (`ID_osoby`, `ID_klasy`)
 value (id_osoby_ucznia, id_klasy);
 
 select idUczeń into id_ucznia from `mydb`.`Uczeń`
 where ( id_osoby_ucznia = Uczeń.ID_osoby );
 
 insert into `mydb`.`Uczeń_Opiekun` (`ID_Ucznia`,`ID_opiekuna`)
 value (id_ucznia,id_osoby_opiekuna);

end; //
delimiter ;

DROP PROCEDURE IF EXISTS Wiazanie_uczen_opiekun;
delimiter //
create procedure  Wiazanie_uczen_opiekun(in PESEL_ucznia CHAR(11), in PESEL_opiekuna CHAR(11))
begin

declare id_ucznia SMALLINT;
declare id_osoby_ucznia SMALLINT;
declare id_osoby_opiekuna SMALLINT;

select idOsoba  into id_osoby_ucznia from `mydb`.`Osoba`
where (PESEL_ucznia = Osoba.PESEL );

select idUczeń into id_ucznia from `mydb`.`Uczeń`
 where ( id_osoby_ucznia = Uczeń.ID_osoby );
 
select idOsoba  into id_osoby_opiekuna from `mydb`.`Osoba`
where (PESEL_opiekuna = Osoba.PESEL );

insert into `mydb`.`Uczeń_Opiekun` (`ID_Ucznia`,`ID_opiekuna`)
 value (id_ucznia,id_osoby_opiekuna);


end; //
delimiter ;

DROP PROCEDURE IF EXISTS Dodaj_rodzaj_przedmiotu;
delimiter //
create procedure Dodaj_rodzaj_przedmiotu(in nazwa_rodzaju_przedmiotu varchar(45))
begin

INSERT INTO `mydb`.`Rodzaj_przedmiotu` (`Nazwa_rodzaju_przedmiotu`) 
VALUES (nazwa_rodzaju_przedmiotu);

end; //
delimiter ;

DROP PROCEDURE IF EXISTS Dodaj_przedmiot;
delimiter //
create procedure Dodaj_przedmiot(in nazwa_rodzaju_przedmiotu varchar(45), in nazwa_klasy varchar(45))
begin

declare id_rodzaju_przedmiotu SMALLINT;
declare id_klasy TINYINT;

select idRodzaj_przedmiotu  into id_rodzaju_przedmiotu from `mydb`.`Rodzaj_przedmiotu`
where (nazwa_rodzaju_przedmiotu = Rodzaj_przedmiotu.Nazwa_rodzaju_przedmiotu );

select idKlasa  into id_klasy from `mydb`.`Klasa`
where (nazwa_klasy = Klasa.Nazwa_klasy );

INSERT INTO `mydb`.`Przedmiot` (`ID_Rodzaj_przedmiotu`,`ID_klasy`) 
VALUES (id_rodzaju_przedmiotu,id_klasy);

end; //
delimiter ;

DROP PROCEDURE IF EXISTS Wiazanie_nauczyciel_przedmiot;
delimiter //
create procedure Wiazanie_nauczyciel_przedmiot(in nazwa_rodzaju_przedmiotu varchar(45), in nazwa_klasy varchar(45), in PESEL_nauczyciela CHAR(11))
begin

declare id_rodzaju_przedmiotu SMALLINT;
declare id_klasy TINYINT;
declare id_przedmiotu SMALLINT;
declare id_osoby_nauczyciela SMALLINT;
declare id_nauczyciela TINYINT UNSIGNED;

select idOsoba  into id_osoby_nauczyciela from `mydb`.`Osoba`
where (PESEL_nauczyciela = Osoba.PESEL );

select idNauczyciel into id_nauczyciela from `mydb`.`Nauczyciel`
 where ( id_osoby_nauczyciela = Nauczyciel.ID_osoby );

select idRodzaj_przedmiotu  into id_rodzaju_przedmiotu from `mydb`.`Rodzaj_przedmiotu`
where (nazwa_rodzaju_przedmiotu = Rodzaj_przedmiotu.Nazwa_rodzaju_przedmiotu );

select idKlasa  into id_klasy from `mydb`.`Klasa`
where (nazwa_klasy = Klasa.Nazwa_klasy );

select idPrzedmiot into id_przedmiotu from `mydb`.`Przedmiot`
where ( id_klasy = Przedmiot.ID_klasy and id_rodzaju_przedmiotu = Przedmiot.ID_Rodzaj_przedmiotu );

INSERT INTO `mydb`.`Nauczyciel_Przedmiot` (`ID_Nauczyciel`,`ID_Przedmiot`) 
VALUES (id_nauczyciela,id_przedmiotu);

end; //
delimiter ;

DROP PROCEDURE IF EXISTS Dodaj_rodzaj_oceny;
delimiter //
create procedure Dodaj_rodzaj_oceny(in nazwa_rodzaju_oceny varchar(45), in waga_oceny DECIMAL(3))
begin

INSERT INTO `mydb`.`Rodzaj_Oceny` (`Nazwa`,`Waga`) 
VALUES (nazwa_rodzaju_oceny,waga_oceny);

end; //
delimiter ;


DROP PROCEDURE IF EXISTS Dodaj_ocene;
delimiter //
create procedure Dodaj_ocene(in nazwa_przedmiotu varchar(45), in nazwa_rodzaju_oceny varchar(45), in PESEL_ucznia char(11), wartosc_oceny DECIMAL(2,1), uwagi MEDIUMTEXT, in PESEL_nauczyciela char(11))
begin

declare id_przedmiotu SMALLINT;
declare id_rodzaju_oceny TINYINT UNSIGNED;
declare id_ucznia SMALLINT;
declare id_nauczyciela TINYINT UNSIGNED;
declare id_osoby_ucznia SMALLINT;
declare id_osoby_nauczyciela SMALLINT;
declare id_klasy_ucznia TINYINT;
declare id_rodzaju_przedmiotu SMALLINT;

select idOsoba  into id_osoby_ucznia from `mydb`.`Osoba`
where (PESEL_ucznia = Osoba.PESEL ) limit 1;

select idUczeń into id_ucznia from `mydb`.`Uczeń`
 where ( id_osoby_ucznia = Uczeń.ID_osoby ) limit 1;

select ID_klasy into id_klasy_ucznia from `mydb`.`Uczeń`
where ( id_ucznia = Uczeń.idUczeń ) limit 1;

select idRodzaj_przedmiotu  into id_rodzaju_przedmiotu from `mydb`.`Rodzaj_przedmiotu`
where (nazwa_przedmiotu = Rodzaj_przedmiotu.Nazwa_rodzaju_przedmiotu ) limit 1;

select idPrzedmiot into id_przedmiotu from `mydb`.`Przedmiot`
where ( id_klasy_ucznia = Przedmiot.ID_klasy and id_rodzaju_przedmiotu = Przedmiot.ID_Rodzaj_przedmiotu ) limit 1;

select idOsoba  into id_osoby_nauczyciela from `mydb`.`Osoba`
where (PESEL_nauczyciela = Osoba.PESEL );

select idNauczyciel into id_nauczyciela from `mydb`.`Nauczyciel`
where ( id_osoby_nauczyciela = Nauczyciel.ID_osoby );
 
select idRodzaj_oceny into id_rodzaju_oceny from `mydb`.`Rodzaj_Oceny`
where ( nazwa_rodzaju_oceny = Rodzaj_Oceny.Nazwa );

insert into `mydb`.`Ocena` (`ID_przedmiotu`, `ID_rodzaju_oceny`, `ID_ucznia`, `wartość_oceny`, `data_oceny`, `uwagi_do_oceny`, `ID_Nauczyciela`)
 values (id_przedmiotu, id_rodzaju_oceny, id_ucznia, wartosc_oceny, current_timestamp(), uwagi, id_nauczyciela);

end; //
delimiter ;


DROP PROCEDURE IF EXISTS Dodaj_obecnosc;
delimiter //
create procedure Dodaj_obecnosc(in nazwa_przedmiotu varchar(45), in PESEL_ucznia char(11), in czy_obecny TINYINT(1), in czy_usprawiedliwona TINYINT(1), in PESEL_nauczyciela char(11))
begin

declare id_przedmiotu SMALLINT;
declare id_ucznia SMALLINT;
declare id_nauczyciela TINYINT UNSIGNED;
declare id_osoby_ucznia SMALLINT;
declare id_osoby_nauczyciela SMALLINT;
declare id_klasy_ucznia TINYINT;
declare id_rodzaju_przedmiotu SMALLINT;

select idOsoba  into id_osoby_ucznia from `mydb`.`Osoba`
where (PESEL_ucznia = Osoba.PESEL );

select idUczeń into id_ucznia from `mydb`.`Uczeń`
 where ( id_osoby_ucznia = Uczeń.ID_osoby );

select ID_klasy into id_klasy_ucznia from `mydb`.`Uczeń`
where ( id_ucznia = Uczeń.idUczeń );

select idRodzaj_przedmiotu  into id_rodzaju_przedmiotu from `mydb`.`Rodzaj_przedmiotu`
where (nazwa_przedmiotu = Rodzaj_przedmiotu.Nazwa_rodzaju_przedmiotu );

select idPrzedmiot into id_przedmiotu from `mydb`.`Przedmiot`
where ( id_klasy_ucznia = Przedmiot.ID_klasy and id_rodzaju_przedmiotu = Przedmiot.ID_Rodzaj_przedmiotu );

select idOsoba  into id_osoby_nauczyciela from `mydb`.`Osoba`
where (PESEL_nauczyciela = Osoba.PESEL );

select idNauczyciel into id_nauczyciela from `mydb`.`Nauczyciel`
where ( id_osoby_nauczyciela = Nauczyciel.ID_osoby );
 

insert into `mydb`.`Obecność`(`ID_przedmiotu`, `ID_ucznia`, `Czy_obecny`, `data`, `Czy_usprawiedliwona`, `ID_nauczyciela`)
 values (id_przedmiotu, id_ucznia, czy_obecny, current_timestamp(), czy_usprawiedliwona, id_nauczyciela);

end; //
delimiter ;