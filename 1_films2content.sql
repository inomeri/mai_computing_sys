DROP TABLE IF EXISTS films, persons, persons2content;

create table persons (
  id serial not null primary key,
  fio varchar (128) not null
);

create table films (
  title varchar(128) not null,
  id serial not null primary key,
  country varchar(64) not null,
  box_office bigint not null,
  release_date date not null
);

create table persons2content (
  person_id int REFERENCES persons (id),
  film_id int REFERENCES films (id),
  person_type varchar(128) not null
);

insert into films values 
  ('Pulp Fiction', 1, 'USA', 213928762, '1994-05-21'),
  ('Lock, Stock and Two Smoking Barrels', 2, 'Great Britain', 3753929, '1998-08-23'),
  ('Hauru no ugoku shiro', 3, 'Japan', 235347345, '2005-09-05'),
  ('Blade Runner', 4, 'USA', 27615743, '1982-06-25'),
  ('Star Wars: Episode VII - The Force Awakens', 5, 'USA', 2068223624, '2015-12-14');

insert into persons values
  (1, 'John Travolta'), (2, 'Guy Ritchie'), (3, 'Joe Hisaishi'), (4, 'Ridley Scott'), (5, 'Rick Carter');

insert into persons2content values
  (5, 5, 'artist'),
  (4, 4, 'producer'),
  (3, 3, 'musician'),
  (2, 2, 'screenwriter'),
  (1, 1, 'actor');
  
select * from films;
select * from persons;
select * from persons2content;
