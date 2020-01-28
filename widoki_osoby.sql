create or replace view view_przedmioty_klasy as
select Przedmiot.idPrzedmiot, Rodzaj_Przedmiotu.Nazwa_rodzaju_przedmiotu
from Przedmiot
join Rodzaj_przedmiotu as Rodzaj_Przedmiotu on 
	(Przedmiot.ID_rodzaj_przedmiotu = Rodzaj_Przedmiotu.idRodzaj_Przedmiotu)
join Klasa on (Przedmiot.ID_klasy = Klasa.idKlasa);

create or replace view view_przedmioty_nauczyciela as
select Przedmiot.idPrzedmiot, Rodzaj_przedmiotu.Nazwa_rodzaju_przedmiotu
from Nauczyciel_Przedmiot
join Przedmiot as Przedmiot on
	(Przedmiot.idPrzedmiot=Nauczyciel_Przedmiot.ID_Przedmiot)
join Rodzaj_przedmiotu as Rodzaj_przedmiotu on 
	(Przedmiot.ID_rodzaj_przedmiotu = Rodzaj_przedmiotu.idRodzaj_przedmiotu)
join Nauczyciel as Nauczyciel on
	(Nauczyciel_Przedmiot.ID_Nauczyciel=Nauczyciel.idNauczyciel);
    
create or replace view view_nauczyciele_przedmiotu as
select Nauczyciel.idNauczyciel, Nauczyciel.Stopień_Naukowy, Osoba.Imię, Osoba.Nazwisko
	from Nauczyciel_Przedmiot
    join Nauczyciel as Nauczyciel on
		(Nauczyciel_Przedmiot.idNauczyciel_Przedmiot=Nauczyciel.idNauczyciel)
    join Osoba as Osoba on
		(Nauczyciel.ID_osoby = Osoba.idOsoba)
	join Przedmiot as Przedmiot on
		(Nauczyciel_Przedmiot.ID_Przedmiot=Przedmiot.idPrzedmiot);
        
create or replace view view_przedmiot_oceny as
select Ocena.idOcena, Ocena.wartość_oceny, Rodzaj_Oceny.Waga, Rodzaj_Oceny.Nazwa 
	from Ocena
	join Rodzaj_Oceny as Rodzaj_Oceny on
		(Ocena.ID_rodzaju_oceny=Rodzaj_Oceny.idRodzaj_Oceny)
	join Przedmiot on
		(Ocena.ID_przedmiotu=Przedmiot.idPrzedmiot);
        
create or replace view view_oceny_ucznia as
select Ocena.idOcena, Ocena.wartość_oceny, Rodzaj_Oceny.Waga, Rodzaj_Oceny.Nazwa
	from Ocena
	join Rodzaj_Oceny as Rodzaj_Oceny on
		(Ocena.ID_rodzaju_oceny=Rodzaj_Oceny.idRodzaj_Oceny)
    join Uczeń on
		(Ocena.ID_ucznia=Uczeń.idUczeń);


        
create or replace view view_oceny_nauczyciela as
select Ocena.idOcena, Ocena.wartość_oceny, Rodzaj_Oceny.Waga, Rodzaj_Oceny.Nazwa
	from Ocena
	join Rodzaj_Oceny as Rodzaj_Oceny on
		(Ocena.ID_rodzaju_oceny=Rodzaj_Oceny.idRodzaj_Oceny)
	join Nauczyciel on
		(Ocena.ID_Nauczyciela=Nauczyciel.idNauczyciel);
    
        
create or replace view view_przedmioty_ucznia as
select * from view_przedmioty_klasy
join Uczeń_Przedmiot as Uczeń_Przedmiot on
	(view_przedmioty_klasy.idPrzedmiot=Uczeń_Przedmiot.id_Przedmiot)
join Uczeń as Uczeń on
	(Uczeń_Przedmiot.id_Uczeń=Uczeń.idUczeń);

create or replace view view_oceny_użytkownika as 
select 
	(select * from view_oceny_ucznia
		join Ocena on
			(view_oceny_ucznia.idOcena=Ocena.idOcena or view_oceny_nauczyciela.idOcena=idOcena)
		join view_przedmioty_użytkownika on
			(view_przedmioty_użytkownika.idPrzedmiotu=Ocena.ID_przedmiotu)
union
select * from view_oceny_nauczyciela
	join Ocena on
		(view_oceny_ucznia.idOcena=Ocena.idOcena or view_oceny_nauczyciela.idOcena=idOcena)
	join view_przedmioty_użytkownika on
		(view_przedmioty_użytkownika.idPrzedmiotu=Ocena.ID_przedmiotu));
        
#create or replace view view_przedmioty_użytkownika as
#select if (id

create or replace view view_osoba as
select Osoba.idOsoba from osoba
union
wybór_osoby(Użytkownik.id_roli_użytkownika)

from Użytkownik;

create or replace view view_nauczyciel as
select Użytkownik.idUżytkownik, Użytkownik.nazwa_użytkownika, Nauczyciel.idNauczyciel
from Użytkownik
	join Nauczyciel on 
    (Użytkownik.ID_osoby=Nauczyciel.ID_osoby);
    
create or replace view view_uczeń as
select Użytkownik.idUżytkownik, Użytkownik.nazwa_użytkownika, Uczeń.idUcznia
from Użytkownik
	join Uczeń on 
    (Użytkownik.ID_osoby=Uczeń.ID_osoby);
