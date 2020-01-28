delimiter $$


drop function if exists średnia_nauczyciel$$
create function średnia_nauczyciel(nauczyciel SMALLINT)
returns decimal(3,2)
begin
	
    declare sr_id smallint;
	declare suma int;
    declare punkty int;
    declare wynik decimal(3,2);
    
	select Ostatni_index('Średnia') into sr_id;

    
select SUM(view_oceny_nauczyciela.Waga)
	from view_oceny_nauczyciela
    join Ocena as Ocena on 
    (Ocena.ID_Nauczyciel=nauczyciel)
    into suma;
    
select SUM(view_oceny_nauczyciela.wartość_oceny*view_oceny_nauczyciela.Waga)
	from view_oceny_nauczyciela
    join Ocena as Ocena on 
    (Ocena.ID_Nauczyciel=nauczyciel)
    into punkty;
    
    set wynik := suma/punkty;
    
	insert into Średnia
    values
    (sr_id+1, znajdź_osobę(nauczyciel), Nowa_modyfikacja(), wynik);
    
    return sr_id;
end $$

drop function if exists średnia_uczeń$$
create function średnia_uczeń(uczeń SMALLINT)
returns decimal(3,2)
begin

    declare sr_id smallint;
	declare suma int;
    declare punkty int;
    declare wynik decimal(3,2);
    
	select Ostatni_index('Średnia') into sr_id;
    
select SUM(view_oceny_ucznia.Waga)
	from view_oceny_ucznia
    join Ocena as Ocena on 
    (Ocena.ID_Ucznia=uczeń)
    into suma;
    
select SUM(view_oceny_ucznia.wartość_oceny*view_oceny_ucznia.Waga)
	from view_oceny_ucznia
    join Ocena as Ocena on 
    (Ocena.ID_Ucznia=uczeń)
    into punkty;
    
    set wynik := suma/punkty;
    
    insert into Średnia
    values
    (sr_id+1, znajdź_osobę(uczeń), Nowa_modyfikacja(), wynik);
    
    return sr_id;
end $$

drop trigger if exists średnia_ins$$
create trigger średnia_ins after insert on Ocena
for each row
begin

	declare so_id smallint;
    
    select Ostatni_index('Średnia_Ocena') into so_id;
    
	insert into Średnia_Ocena
    values (so_id+1, NEW.idOcena, sr_id, Nowa_Modyfikacja());
end $$
    
create trigger średnia_ins after insert on Ocena
for each row
begin

	declare so_id smallint;
    
    select Ostatni_index('Średnia_Ocena') into so_id;
    
	insert into Średnia_Ocena
    values (so_id+1, NEW.idOcena, sr_id, Nowa_Modyfikacja());
end $$

create trigger średnia_ins after insert on Ocena
for each row
begin

	declare so_id smallint;
    
    select Ostatni_index('Średnia_Ocena') into so_id;
    
	insert into Średnia_Ocena
    values (so_id+1, NEW.idOcena, sr_id, Nowa_Modyfikacja());
end $$


delimiter ;