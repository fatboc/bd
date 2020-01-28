USE `mydb`;
select * from `view_Uczeń_bez_opiekuna`;
select * from `view_Nauczyciel`;
select * from `view_Przedmiot_bez_nauczycieli`;
select * from `view_uczen_oceny_ID`;

select * from `view_uczen_oceny_ID`
where Nazwisko_ucznia = 'Polska';
-- użycie widoku do szukania po PESEL
select *
 from `view_uczen_oceny_ID`
join Osoba as Szukany_uczeń on ( Szukany_uczeń.Nazwisko = view_uczen_oceny_ID.Nazwisko_ucznia )
where ( Szukany_uczeń.PESEL = 00010101399 );
