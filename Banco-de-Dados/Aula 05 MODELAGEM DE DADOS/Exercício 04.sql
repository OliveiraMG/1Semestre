create database sprint2;
use sprint2;
create table Atleta (
IdAtleta int primary key,
nome varchar(40),
modalidade varchar(40),
QtdMedalha int
);
insert into Atleta Values
('1', 'Douglas', 'Boxe', '8'),
('2', 'João', 'Futebol', '6'),
('3', 'Jhonatan', 'Surf', '7'),
('4', 'Matheus', 'Boxe', '3'),
('5', 'Wilson', 'Surf', '4'),
('6', 'Diogo', 'Futebol', '9');
create table País (
IdPaís int primary key,
nome varchar(30),
capital varchar(40)
);
insert into País Values
('1', 'Brasil', 'Brasília'),
('2', 'Finlândia', 'Helsinque'),
('3', 'Síria', 'Damasco');
alter table atleta add column fkPaís int;
alter table atleta add foreign key (fkPaís)
references País(IdPaís);
insert into país values
('4', 'Estados Unidos', 'Washington');
select * from País;
select * from Atleta;
update Atleta set fkPaís = 1 Where IdAtleta = '1';
update Atleta set fkPaís = 2 Where IdAtleta = '2';
update Atleta set fkPaís = 3 Where IdAtleta = '3';
update Atleta set fkPaís = 4 Where IdAtleta = '4';
update Atleta set fkPaís = 1 Where IdAtleta = '5';
update Atleta set fkPaís = 2 Where IdAtleta = '6';
select * from atleta;
select nome, fkPaís from atleta;
select atleta.nome, País.nome FROM Atleta JOIN País ON IdPaís = fkPaís;
select atleta.nome, País.nome, País.capital FROM Atleta JOIN País ON IdPaís = fkPaís;

-- Exercício 2
create table Musica (
IdMusica int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);
insert into Musica values
('1', 'Grillz', 'Levi Menezes', 'Trap'),
('2', 'Rap é compromisso', 'Sabotage', 'Rap'),
('3', 'Pisando descalço', 'Maneva', 'Reggae'),
('4', 'Interludio', 'Yunk Vino', 'Trap'),
('5', 'Mary Jane', 'Levi Menezes', 'Trap'),
('6', 'Sabe Fazer', 'Luccas Carlos', 'R&B'),
('7', 'Bipolar', 'MC Davi', 'Funk'),
('8', 'Da boca para fora', 'Jean Tassy', 'R&B');
create table Album (
IdAlbum int primary key,
Nome varchar(40),
Tipo varchar(40),
genero varchar(40),
dtLançamento date,
constraint chktipo check (tipo in ('Digital', 'Físico'))
);
insert into album values
('1', 'Diane', 'Digital', 'Trap', '2020-08-12'),
('2', '237', 'Digital', 'Trap', '2021-09-25'),
('3', 'Rap é compromisso', 'Físico', 'Rap', '2000-07-04'),
('4', 'Tempo de paz', 'Físico', 'Reggae', '2009-06-07'),
('5', 'Solar', 'Digital', 'R&B', '2021-04-29'),
('6', 'Fora de tempo', 'Digital', 'R&B', '2022-06-21'),
('7', 'Sentimentos', 'Digital', 'Funk', '2021-09-25');
alter table album drop column genero;
select * from album;
select * from musica;
alter table musica add column fkAlbum int;
alter table musica add foreign key (fkAlbum)
references Album(IdAlbum);
update musica set fkAlbum = 1 Where IdMusica = '1';
update musica set fkAlbum = 3 Where IdMusica = '2';
update musica set fkAlbum = 4 Where IdMusica = '3';
update musica set fkAlbum = 2 Where IdMusica = '4';
update musica set fkAlbum = 1 Where IdMusica = '5';
update musica set fkAlbum = 5 Where IdMusica = '6';
update musica set fkAlbum = 7 Where IdMusica = '5';
update musica set fkAlbum = 6 Where IdMusica = '6';
select titulo, fkAlbum from musica;
select musica.titulo, album.nome FROM Musica JOIN Album ON IdAlbum = fkAlbum;
select musica.titulo, album.nome, album.tipo FROM Musica JOIN Album ON IdAlbum = fkAlbum;