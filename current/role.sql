delimiter $$
 
drop function if exists Nowa_modyfikacja $$
CREATE function Nowa_modyfikacja() returns smallint
BEGIN
    declare ctr SMALLINT;
    declare t datetime;
    declare u VARCHAR(45);
    
    select Ostatni_index('Modyfikacja') into ctr;
    
    select now into t;
    
    select current_user() into u;
    
    insert HIGH_PRIORITY
    into Modyfikacja
    (idModyfikacja, data_modyfikacji, id_Użytkownika)
    values
    (ctr, t, u);
    
    return ctr;
END $$

DELIMITER $$

drop function if exists Ostatni_index $$
CREATE function Ostatni_index (tablica varchar(45))
RETURNS SMALLINT
BEGIN
	declare ctr smallint;
	select 'auto_increment'
    into ctr
    from INFORMATION_SCHEMA.TABLES
    where table_name = tablica;
    
    return ctr;	
END $$

drop procedure if exists wybór_osoby $$
create procedure wybór_osoby(in rola smallint)
case rola
	when 2 then select * from view_nauczyciel;
	when 4 then select * from view_uczeń;
end case;
end $$

drop function if exists znajdź_osobę$$
create function znajdź_osobę (id SMALLINT)
returns SMALLINT
begin
	declare id_osoby smallint;
    select idOsoby from Osoba
    join Uczeń on
    (Uczeń.ID_osoby=Osoba.idOsoby)
    join Nauczyciel on
    (Nauczyciel.ID_osoby=Osoba.idOsoby)
    into id_osoby;
end$$

drop trigger if exists Rola_użytkownika_modyfikacja $$
CREATE TRIGGER Rola_użytkownika_modyfikacja
before update on Rola_użytkownika
for each row
begin
	Nowa_modyfikacja();
end $$


delimiter ;

    
select @i := Ostatni_index('Rola_użytkownika');
    
INSERT INTO `mydb`.`Rola_użytkownika` 
(`idRola_użytkownika`, `opis_roli_użytkownika`, `idModyfikacji`)
 VALUES (1, 'admin', i+1);
 
 INSERT INTO `mydb`.`Rola_użytkownika` 
(`idRola_użytkownika`, `opis_roli_użytkownika`, `idModyfikacji`)
 VALUES (2, 'Uczeń', i+2);
 
 INSERT INTO `mydb`.`Rola_użytkownika` 
(`idRola_użytkownika`, `opis_roli_użytkownika`, `idModyfikacji`)
 VALUES (3, 'Opiekun', i+3);
 
 INSERT INTO `mydb`.`Rola_użytkownika` 
(`idRola_użytkownika`, `opis_roli_użytkownika`, `idModyfikacji`)
 VALUES (4, 'Nauczyciel', i+4);