call Dodaj_osobe('Radovan','Karadzic','1992-02-03','92020303256');
call Dodaj_rodzaj_kontaktu('Telefon');
call Dodaj_kontakt('Telefon','665632750','92020303256');
call Dodaj_osobe('Radko','Mladic','1995-02-11','95021104444');
call Dodaj_rodzaj_kontaktu('Email');
call Dodaj_kontakt('Email','mladic@gmail.com','95021104444');
call Dodaj_osobe('Ti','To','1962-02-11','62021104444');
call Dodaj_nauczyciela('92020303256','dr');
call Dodaj_klase('IA Lic','1992','92020303256');
call Dodaj_ucznia('95021104444','62021104444','IA Lic');
call Dodaj_rodzaj_przedmiotu('Matematyka 1R LIC');
call Dodaj_przedmiot('Matematyka 1R LIC','IA Lic');
call Wiazanie_nauczyciel_przedmiot('Matematyka 1R LIC','IA Lic','92020303256');
call Dodaj_rodzaj_oceny('Zachowanie',0);
call Dodaj_ocene('Matematyka 1R LIC','Zachowanie','95021104444',2.5,'Brak uwag','92020303256');
call Dodaj_obecnosc('Matematyka 1R LIC','95021104444',1,1,'92020303256');
