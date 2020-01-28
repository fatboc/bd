create or replace view `view_uczniowie_klasy` as
select Klasa.Nazwa_klasy, Osoba_ucznia.Imię as Imię_ucznia, Osoba_ucznia.Nazwisko as Nazwisko_ucznia
from Klasa
join Uczeń on (Uczeń.ID_klasy = Klasa.idKlasa)
join Osoba as Osoba_ucznia on ( Uczeń.ID_osoby = Osoba_ucznia.idOsoba );

create or replace view `view_przedmioty_klasy` as
select Klasa.Nazwa_klasy, Rodzaj_przedmiotu.Nazwa_rodzaju_przedmiotu, Osoba_nauczyciela.Imię, Osoba_nauczyciela.Nazwisko
from Klasa
join Przedmiot on ( Przedmiot.ID_klasy = Klasa.idKlasa )
join Rodzaj_przedmiotu on (Rodzaj_przedmiotu.idRodzaj_przedmiotu = Przedmiot.ID_Rodzaj_przedmiotu)
join Nauczyciel_Przedmiot on ( Nauczyciel_Przedmiot.ID_Przedmiot = Przedmiot.idPrzedmiot )
join Nauczyciel on ( Nauczyciel_Przedmiot.ID_Nauczyciel = Nauczyciel.idNauczyciel)
join Osoba as Osoba_nauczyciela on ( Nauczyciel.ID_osoby = Osoba_nauczyciela.idOsoba );

create or replace view `view_wychowawcy_klas` as
select Klasa.Nazwa_klasy, Osoba_wychowawcy.Imię, Osoba_wychowawcy.Nazwisko
from Klasa
join Nauczyciel on (Klasa.ID_wychowawcy = Nauczyciel.idNauczyciel)
join Osoba as Osoba_wychowawcy on ( Nauczyciel.ID_osoby = Osoba_wychowawcy.idOsoba );

create or replace view `view_opiekunowie_uczniów` as
select Osoba_ucznia.Imię as Imię_ucznia, Osoba_ucznia.Nazwisko as Nazwisko_ucznia, Osoba_opiekuna.Imię as Imię_Opiekuna, Osoba_opiekuna.Nazwisko as Nazwisko_opiekuna
from Uczeń_Opiekun
join Uczeń on ( Uczeń_Opiekun.ID_Ucznia = idUczeń)
join Osoba as Osoba_ucznia on ( Uczeń.ID_osoby = Osoba_ucznia.idOsoba )
join Osoba as Osoba_opiekuna on ( Uczeń_Opiekun.ID_Opiekuna = Osoba_opiekuna.idOsoba );