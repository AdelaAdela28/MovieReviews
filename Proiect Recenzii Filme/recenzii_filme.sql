create database recenzii_filme;
use recenzii_filme;

#2 Realizarea operatiilor LDD: 
# Crearea tabelelor: create table (minim 4 tabele) 

create table film(
	film_id int not null auto_increment primary key,
    titlu varchar(100),
    an_lansare int,
    gen enum('Drama','Romance','Crime','Thriller','SF','Horror','Comedy', 'Adventure')
);

create table premii(
	premiu_id int not null auto_increment primary key,
    titlu enum('Primetime Emmy', 'Golden Globe', 'Bafta'),
    an int not null,
    tara varchar(100)
);

create table castigator(
	castigator_id int not null auto_increment primary key,
	premiu_id int,
    film_id int,
    foreign key(premiu_id) references premii(premiu_id),
    foreign key(film_id) references film(film_id)
);

create table user(
	user_id int not null auto_increment primary key,
    username varchar(50) not null
);

create table recenzie(
	recenzie_id int not null,
    rating DECIMAL(4,2) not null default 0,
    data_creare timestamp default now(),
    film_id int,
    user_id int,
    foreign key(film_id) references film(film_id),
    foreign key(user_id) references user(user_id)
);

# Modificarea structurii tabelelor: alter table (minim 5 exemple) 

-- Redenumire tabel 
alter table premii rename to premiu;

-- Redenumire coloana si modificare proprietati
alter table film change titlu titlu_film varchar(255) not null;

-- Adaugare coloana noua 
alter table user add data_creare timestamp default now();

-- Stergere coloana 
alter table premiu drop tara;

-- Adaugare primary key si modificare proprietati (adaugare auto_increment)
alter table recenzie add primary key(recenzie_id);
alter table recenzie change recenzie_id recenzie_id int not null auto_increment;

 #3. Actualizarea datelor
 
 -- Insert (minimum 10 inregistrari in fiecare tabela)
 
insert into film values
	(null, 'The Blacklist', 2013, 'Crime');
 
insert into film (titlu_film, an_lansare, gen) values
	('Game of Thrones', 2011, 'Adventure'),
    ('Friends', 1994, 'Comedy'),
    ('Black Mirror', 2011, 'SF'),
    ("Grey's Anatomy", 2005, 'Romance'),
    ('House MD', 2004, 'Drama'),
    ('La casa de papel', 2017, 'Action'),
    ('The walking dead', 2010, 'Horror'),
    ('Criminal minds', 2005, 'Crime'),
    ('Ozark', 2017, 'Thriller'),
    ('Stranger things', 2016, 'SF'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Vikings', 2013, 'Adventure'),
    ('The 100', 2014, 'Drama'),
    ('How I met your mother', 2005, 'Romance');

insert into premiu (titlu, an) values
	('Golden Globe', 2014),
    ('Golden Globe', 2012),
    ('Golden Globe', 2007),
    ('Golden Globe', 2006),
    ('Golden Globe', 2003),
    ('Golden Globe', 1994),
    ('Primetime Emmy', 2018),
    ('Primetime Emmy', 2017),
    ('Primetime Emmy', 2016),
    ('Primetime Emmy', 2015),
    ('Primetime Emmy', 2014),
    ('Primetime Emmy', 2013),
    ('Primetime Emmy', 2012),
    ('Primetime Emmy', 2011),
    ('Primetime Emmy', 2010),
    ('Primetime Emmy', 2009),
    ('Primetime Emmy', 2008),
    ('Primetime Emmy', 2007),
    ('Primetime Emmy', 2003),
    ('Primetime Emmy', 2000),
    ('Primetime Emmy', 1997),
    ('BAFTA', 2017),
    ('BAFTA', 2013),
    ('BAFTA', 1998),
    ('Golden Globe', 2013),
    ('Golden Globe', 2011),
	('BAFTA', 2018);

insert into castigator(premiu_id, film_id) values
	(1,1),
    (2,2),
    (3,5),
    (3,6),
    (4,5),
    (4,6),
    (5,12),
    (6,3),
    (7,2),
    (7,4),
    (7,11),
    (8,4),
    (8,11),
    (9,2),
    (10,2),
    (11,2),
    (11,15),
    (12,2),
    (12,15),
    (13,2),
    (13,8),
    (13,15),
    (14,2),
    (14,5),
    (14,6),
    (14,8),
    (14,15),
    (15,5),
    (16,5),
    (16,6),
    (16,15),
    (17,6),
    (17,15),
    (18,5),
    (18,6),
    (18,15),
    (19,3),
    (20,3),
    (21,12),
    (22,4),
    (23,2),
    (24,3);

insert into user (username, data_creare) values
	('adelat', '2018-10-28'),
	('user12345', '2017-11-04'),
    ('victorm', '2016-08-08'),
    ('otilia12', '2015-03-09'),
    ('dragos_c', '2014-05-10');
    
insert into user (username) values
    ('flavius2fl'),
    ('user5647'),
    ('andrei_mc'),
    ('andreea125'),
    ('cristina_pop'),
    ('angela_m_123'),
    ('netflix_user'),
    ('flavia_andreea'),
    ('tudor_m');
 
 insert into recenzie values
	(null, 8.9, '2017-11-11', 1, 1),
    (null, 9.7, '2010-10-28', 2, 1),
    (null, 9.3, '2016-04-30', 3, 1),
    (null, 7.9, '2018-02-28', 7, 1);
    
 insert into recenzie(rating, film_id, user_id) values
    (9.3, 8, 2),
    (9.8, 1, 2), 
    (8.5, 2, 2),
    (8.8, 15, 2),
    (8.6, 14, 3),
    (9.5, 13, 3),
    (5.7, 12, 3),
    (7.5, 11, 3),
    (8.3, 10, 3),
    (8.4, 10, 4),
    (8.9, 9, 4),
    (9.3, 8, 4),
    (8.9, 7, 4),
    (9.1, 6, 5),
    (9.6, 5, 5),
    (8.4, 4, 6),
    (9.1, 3, 6),
    (8.4, 2, 7),
    (8.7, 1, 7),
    (10.0, 2, 8),
    (10.0, 7, 9),
    (4.5, 8, 10),
    (9.5, 8, 11),
    (7.9, 7, 12),
    (8.9, 10, 12),
    (9.8, 10, 13),
    (5.8, 6, 13);

 -- Update (minimum 3 exemple)
 
select*from user where username like '%user%';
update user set data_creare='2018-12-12 20:30:00' where username like '%user%';

select*from user where user_id between 9 and 11;
update user set data_creare='2016-05-23 08:10:23' where user_id between 9 and 11;

select*from user where user_id >=12 and user_id<=15;
update user set data_creare='2014-09-08 11:30:20' where user_id >=4 and user_id<=5;

select*from recenzie where rating between 5 and 6;
update recenzie set rating=6 where rating between 5 and 6;

select*from film where film_id=7;
update film set gen='Crime' where film_id=7;

 -- Delete (minimum 3 exemple)
 
select*from premiu where premiu_id>=25;
delete from premiu where premiu_id>=25;

select*from recenzie where rating<=6 order by rating limit 1;
delete from recenzie where rating<=6 order by rating limit 1;

select*from castigator where premiu_id=11 order by film_id desc;
delete from castigator where premiu_id=11 order by film_id desc;

#4 Interogări variate cu select

-- Subinterogari (minimum 3 exemple)

-- sa se afiseze toate filmele care au aparut in acelasi an cu 'game of thrones'
select*from film 
where an_lansare=(select an_lansare from film where titlu_film='game of thrones');

-- sa se afiseze toate recenziile care au acelasi rating ca prima recenzie din tabel (recenzie_id=1) si data crearii acestora
select recenzie_id, rating, data_creare from recenzie
where rating=(select rating from recenzie where recenzie_id=1);

-- sa se afiseze toate premiile din acelasi an cu primul premiu din tabel (premiu_id=1)
select*from premiu 
where an=(select an from premiu where premiu_id=1);

-- Join-inner/outer (minimum 3 exemple)

-- sa se afiseze toate filmele care au castigat premii 'golden globe' de-a lungul timpului si anul castigarii
select titlu_film, titlu, an 
from film f
	join castigator c on f.film_id=c.film_id
	join premiu p on p.premiu_id=c.premiu_id 
where titlu='golden globe';

-- sa se afiseze filmele care nu au castigat premii de-a lungul timpului 
select titlu_film 
from film f
	left join castigator c on f.film_id=c.film_id
where c.castigator_id is null;

-- sa se afiseze userii, toate rating-urile pe care le-a dat fiecare si filmele aferente  
select username, titlu_film, rating
from user u
	join recenzie r on u.user_id=r.user_id
    join film f on f.film_id=r.film_id;

-- sa se afiseze userii care nu au dat recenzii niciunui film
select username
from user u
	left join recenzie r on u.user_id=r.user_id
where r.recenzie_id is null;

-- sa se afiseze premiile care nu au fost castigate si anul aferent
select titlu, an
from castigator c
	right join premiu p on c.premiu_id=p.premiu_id
where castigator_id is null;

-- Functii de grup/having (minimum 3 exemple)

-- sa se afiseze in ordine descrescatoare filmele cu cel mai mare rating
select titlu_film, max(rating) as rating_maxim
from film f
	join recenzie r on f.film_id=r.film_id
group by titlu_film
order by rating_maxim desc;

-- sa se afiseze media ratingurilor >= 8 pentru fiecare film, ordonate crescator dupa aceasta
select titlu_film, round(avg(rating),2) as rating_mediu
from film f
	join recenzie r on f.film_id=r.film_id
group by titlu_film
having rating_mediu>=8
order by rating_mediu;

-- sa se afiseze numarul de recenzii date de fiecare user (>3), ordonate descrescator dupa acesta 
select username, count(rating) as nr_recenzii
from user u
	join recenzie r on u.user_id=r.user_id 
group by username
having nr_recenzii>3
order by nr_recenzii desc;

-- Funcţii predefinite MySQL: matematice, de comparare, condiţionale, pentru şiruri de caractere, pentru date calendaristice (minimum 3 exemple) 

-- media tuturor rating-urilor rotunjite cu 2 zecimale
select round(avg(rating),2) as medie_rating from recenzie;

-- incadrare film intr-o categorie
select titlu_film, an_lansare, 
	   if(an_lansare>2000, 'Modern', 'Old' ) as categorie
from film
order by titlu_film;

-- lungime sir de caractere pentru fiecare titlu de film
select titlu_film, char_length(titlu_film) as nr_caractere from film
order by nr_caractere desc;

-- coduri filme = primele 2 caractere din numele filmului + ultimele doua cifre din an
select titlu_film, an_lansare, concat(
										substr(titlu_film, 1,2), 
										right(an_lansare,2) 
                                        ) as cod_film
from film;

-- afisare data_creare username in format ex '2nd April 2019' 
select username, date_format(data_creare, '%D %M %Y') as data_creare from user;

#5 View-uri (minimum 2 exemple) 

-- sa se creeze un view cu media rating-ului pentru fiecare film, in ordine crescatoare
create view v$_medie_rating as 
select titlu_film, round(avg(rating),2) as medie_rating
from film f
	join recenzie r on f.film_id=r.film_id 
group by titlu_film
order by medie_rating;

desc v$_medie_rating;
select*from v$_medie_rating;

-- sa se creeze un view pentru categoriile de filme si media rating-urilor pentru fiecare >=8, ordonate descrescator
create view v$_gen_medie_rating as 
select gen, ifnull(round(avg(rating),2),0) as medie_rating
from film f
	join recenzie r on f.film_id=r.film_id
group by gen
having medie_rating>=8
order by medie_rating desc;

desc v$_gen_medie_rating;
select*from v$_gen_medie_rating;

#6 Functii (minimum 3 exemple)

-- functie care returneaza categoria in care se incadreaza un anumit film in functie de anul lansarii

delimiter //
create function categorie_film (p_film_id int)
returns varchar(50)
begin
	declare categorie varchar(50);
	declare v_an_lansare int;
    
	select an_lansare into v_an_lansare
    from film
    where film_id=p_film_id;
    
	if(v_an_lansare>2000) then set categorie='modern movie';
    else set categorie='old movie';
    end if;
    
    return categorie;
end
//
delimiter ;

select categorie_film(3);
select categorie_film(1);

-- functie care primeste ca parametru 'user_id' si returneaza un mesaj care il incadreaza intr-o categorie
-- in functie de numarul recenziilor date, mesajul este:
-- nr recenzii intre 0-1 - 'bronze user'
-- nr recenzii intre 2-4 - 'silver user'
-- nr recenzii >=5 - 'gold user'

delimiter //
create function recenzii_user (p_user_id int)
returns varchar(20)
begin
	declare v_nr_recenzii decimal(4,2);
    declare v_mesaj_final varchar(50);
    
	select count(rating) into v_nr_recenzii
    from user u
		left join recenzie r on u.user_id=r.user_id 
    where u.user_id=p_user_id
    group by u.user_id;
    
    if v_nr_recenzii>=5 then set v_mesaj_final='Gold user';
	elseif v_nr_recenzii>2 and v_nr_recenzii<5 then set v_mesaj_final='Silver user';
    else set v_mesaj_final='Bronze user';
    end if;
    
	return v_mesaj_final;
end
//
delimiter ;

select recenzii_user(10);
select recenzii_user(3);

-- functie pentru afisare medie_rating pentru un anumit gen de film

delimiter //
create function rating_gen (p_gen varchar(100))
returns decimal(5,2)
begin
    declare medie_rating decimal(5,2);
    
	select avg(rating) into medie_rating
	from film f
		left join recenzie r on f.film_id=r.film_id
	where f.gen=p_gen
	group by f.gen;
    
	return medie_rating;
end
//
delimiter ;

select rating_gen('Romance');
select rating_gen('Drama');

#7 Proceduri (minimum 3 exemple)

-- procedura pentru afisare username si numarul de recenzii date pana in prezent

delimiter //
create procedure nr_recenzii_user(in p_user_id int, out p_username varchar(50), out p_nr_recenzii int)
begin
    select username, count(rating)
		into p_username, p_nr_recenzii
	from user u
			left join recenzie r on u.user_id=r.user_id
	where u.user_id=p_user_id;
end
//
delimiter ;

call nr_recenzii_user(1, @username, @nr_recenzii);
select @username, @nr_recenzii;

-- procedura pentru afisare film si medie rating aferenta 

delimiter //
create procedure rating_film (in p_film_id int, out p_titlu_film varchar(255), out p_medie_rating decimal(4,2))
begin
	select titlu_film, avg(rating) 
		into p_titlu_film, p_medie_rating
	from film f
		left join recenzie r on f.film_id=r.film_id
	where f.film_id=p_film_id;
end
//
delimiter ;

call rating_film(3, @titlu_film, @medie_rating);
select @titlu_film, @medie_rating;

-- procedura pentru afisare cod film format din primele doua caractere din nume + ultimele doua cifre din an

delimiter //
create procedure cod_film (in p_film_id int, out p_titlu varchar(255), out p_an int, out p_cod varchar(5))
begin
	select titlu_film, an_lansare, 
		   concat(substr(titlu_film,1,2), right(an_lansare,2))
		into p_titlu, p_an, p_cod
	from film
    where film_id=p_film_id;
end
//
delimiter ;

call cod_film(12, @titlu, @an, @cod);
select @titlu, @an, @cod;

#7 Cursori (minimum 3 exemple)

-- Procedura care foloseste un cursor pentru a afisa userii creati dupa un anumit an primit ca parametru si nr de recenzii date pana in prezent
-- informatiile vor fi salvate intr-un tabel

create table user_nr_recenzii(
	id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
	username varchar(100),
    data_creare date,
    nr_recenzii int
);
    
delimiter //
create procedure user_nr_recenzii(in p_an int)
begin 
	declare v_username varchar(100);
    declare v_data_creare date;
    declare v_nr_recenzii int;
	declare semafor varchar(20) default 'verde';
	declare cursor1 cursor for select username, u.data_creare, count(rating) 
							    from user u
									left join recenzie r on u.user_id=r.user_id
								where year(u.data_creare)>p_an
                                group by username;
	declare continue handler for not found 
		begin 
			set semafor ='rosu';
		end;
        
	truncate user_nr_recenzii;
    
	open cursor1;
    bucla: loop
		fetch cursor1 into v_username, v_data_creare, v_nr_recenzii;
        insert into user_nr_recenzii(username, data_creare, nr_recenzii) values
			(v_username, v_data_creare, v_nr_recenzii);
            
		if(semafor='rosu') then leave bucla;
		end if;
	end loop bucla;
    close cursor1;
    
    select*from user_nr_recenzii;
end
//
delimiter ;

call user_nr_recenzii(2016);

-- Procedura care foloseste un cursor pentru a returna numele filmelor, daca media rating-urilor>=9
-- numele filmelor vor fi stocate intr-o lista, separate prin ';'

delimiter // 
create procedure film_rating()
begin
	declare v_titlu_film varchar(100);
    declare v_medie_rating decimal(5,2);
	declare v_lista varchar(255);
	declare semafor varchar(20) default 'verde';
	declare cursor2 cursor for select titlu_film, avg(rating)
								from film f
									join recenzie r on f.film_id=r.film_id
								group by titlu_film;
	declare continue handler for not found 
		begin
			set semafor='rosu';
        end;
	open cursor2;
    bucla: loop
		fetch cursor2 into v_titlu_film, v_medie_rating;
        
		if (semafor='rosu') then leave bucla;
		end if;
        
		if (v_medie_rating>=9) then
			set v_lista=concat_ws('; ', v_lista, v_titlu_film);
		end if;
	end loop bucla;
	close cursor2;
    
    select v_lista;
end
//
delimiter ;

call film_rating();

-- Functie care foloseste un cursor ce returneaza nr total de recenzii date de userii creati dupa un anumit an dat ca parametru

delimiter //
create function nr_recenzii(p_an int)
returns int
begin
    declare v_nr_recenzii int;
    declare v_total_recenzii int;
	declare semafor varchar(20) default 'verde';
	declare cursor3 cursor for select count(rating)
								from user u
									left join recenzie r on u.user_id=r.user_id
                                    where year(u.data_creare)>p_an
								group by username;
	declare continue handler for not found
		begin
			set semafor='rosu';
        end;
	
    set v_total_recenzii=0;
    
	open cursor3;
    bucla: loop
		fetch cursor3 into v_nr_recenzii;
		
        if(semafor='rosu') then leave bucla;
		end if;
        
		set v_total_recenzii=v_total_recenzii+v_nr_recenzii;
    end loop bucla;
    return v_total_recenzii;
end
//
delimiter ;

 select nr_recenzii(2016);

-- Functie care foloseste un cursor pentru a afisa media rating-urilor date pana acum, in functie de numarul de useri

delimiter //
create function medie_recenzii()
returns decimal(5,2)
begin
    declare v_total_rating decimal(5,2);
    declare v_contor int;
    declare v_rating decimal(5,2);
	declare semafor varchar(20) default 'verde';
	declare cursor3 cursor for select rating from recenzie;
	declare continue handler for not found
		begin
			set semafor='rosu';
        end;
	
    set v_total_rating=0;
    set v_contor=0;
    
	open cursor3;
    bucla: loop
		fetch cursor3 into v_rating;
        if(semafor='rosu') then leave bucla;
		end if;
        
		set v_total_rating=v_total_rating+v_rating;
        set v_contor=v_contor+1;
    end loop bucla;
    return v_total_rating/v_contor;
end
//
delimiter ;

# Triggeri (minimum 3 exemple)

-- In tabelul nou creat 'insert_logs' vom afisa un mesaj cu datele pentru care am facut modificari 

create table insert_logs(
	id int auto_increment primary key,
    mesaj varchar(255) not null
);

-- Trigger pentru tabela 'film' in care sa tinem cont de noile date care se vor insera

delimiter //
create trigger film_insert after insert on film for each row
begin
	declare v_mesaj_inserat varchar(255);
    set v_mesaj_inserat = concat(' S-au inserat valorile: ', new.titlu_film, ', ', new.an_lansare, ', ', new.gen);
	insert into insert_logs values (null, v_mesaj_inserat);
end
//
delimiter ;

insert into film values (null, 'Lucifer', 2015, 'Crime');
select*from film;
select*from insert_logs;

-- Trigger pentru tabela 'user' in care sa tinem cont de noile date care se vor insera

delimiter //
create trigger user_insert after insert on user for each row
begin
	declare v_mesaj_inserat varchar(255);
    set v_mesaj_inserat = concat(' S-au inserat valorile: ', new.username, ', ', new.data_creare);
	insert into insert_logs values (null, v_mesaj_inserat);
end
//
delimiter ;

insert into user values (null, 'adela987', null);
select*from user;
select*from insert_logs;

-- Trigger pentru tabela 'user' in care sa tinem cont de update-urile facute

delimiter //
create trigger user_update after update on user for each row
begin
	declare v_mesaj_inserat varchar(255);
    set v_mesaj_inserat=concat(' Valorile vechi: ', old.username, ' si ', old.data_creare, ' au devenit: ', new.username, ' si ', new.data_creare);
    insert into insert_logs values (null, v_mesaj_inserat);
end
//
delimiter ;

select*from user where year(data_creare)=2014;
update user set data_creare='2014-10-23' where year(data_creare)=2014 and username like '%ot%';
select*from insert_logs;

-- Trigger pentru tabela 'user' in care sa tinem cont de delete-urile facute

delimiter //
create trigger user_delete before delete on user for each row
begin
	declare v_mesaj_inserat varchar(255);
    set v_mesaj_inserat=concat('S-au sters valorile: ', old.username, ', ', old.data_creare);
    insert into insert_logs values (null, v_mesaj_inserat);
end
//
delimiter ;

select*from user where user_id>=15;
delete from user where user_id>=15;
select*from insert_logs;

