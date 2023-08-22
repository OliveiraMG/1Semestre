-- Criar tabela atleta que contenham dados: idAtleta, nome, modalidade, qtd medalha
create database Atleta;
 
 -- Selecionar banco de dados
 use atleta;
 
 -- Criar tabela
 
 create table Atleta (
 idAtleta int primary key,
 Nome varchar(40),
 Modalidade varchar(40),
 Medalhas int
 );
 
 insert into atleta values
 ('1', 'Pedro', 'Natação', '2'),
('2', 'Igor', 'Atletismo', '3'),
('3', 'Luiz', 'Boxe', '2'),
('4', 'Jonathan', 'Atletismo', '5'),
('5', 'Douglas', 'Natação', '1'),
('6', 'Lucas', 'Futebol', '4'),
('7', 'João', 'Boxe', '3'),
('8', 'Matheus', 'Futebol', '6');
 
 -- Exibir todos os dados da Tabela
 select * from atleta;
 
 -- Exibir nomes e medalhas
 select nome, medalhas from atleta;
 
 -- Exibir dados de atleta de uma modalidade
 select * from atleta where modalidade = 'futebol';
 
 -- Exibir dados da tabela ordenados pela modalidade ordem alfabética
 select * from atleta order by modalidade asc;
 
 -- Exibir dados da tabelo por quantidade de medalhas decrescente
 select * from atleta order by medalhas desc;
 
 -- Exibir atletas que contenham a letra s
 select * from atleta
 where nome like '%s%';
 
 -- Exibir atletas que o nome comece com a letra P
 select * from atleta
 where nome like 'p%';
 
 -- Exibir dados da tabela que o nome termine com a letra O
 select * from atleta
 where nome like '%o';
 
 -- Exibir dados da tabela que o nome tenha a penúltima letra R 
 select * from atleta
 where nome like '%r_';
 
 -- Eliminar tabela
 drop table atleta;
 
 
 -- Criar tabela Musica que contenham dados: idMusica, titulo, artista, genero
create database Musica;
 
 -- Selecionar banco de dados
 use Musica;
 
 -- Criar tabela
 create table Musica (
 idMusica int primary key,
 titulo varchar(40),
 artista varchar (40),
 genero varchar (40)
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

-- Exibir todos os dados da tabela
select * from Musica;

-- Exibir títulos e artistas da música
select titulo, artista from musica;

-- Exibir apenas as músicas de um determinado gênero
select * from musica where genero = 'trap';

-- Exibir apenas as músicas de um determinado artista
select * from musica where artista = 'Levi Menezes';

-- Exibir os dados ordenados pelo título da música
select * from musica order by titulo asc;

-- Exibir dados ordenados por artista em ordem decrescente
select * from musica order by artista desc;

-- Exibir músicas que comecem com a letra S
select * from musica
where titulo like 's%';

-- Exibir dados de um artista que termine com S
select * from musica
where artista like '%s';

-- Exibir dados de uma música que tenha como segunda letra R
select * from musica
where genero like '_r%';

-- Exibir músicas com a penúltima letra i
select * from musica
where titulo like '%i_';

drop table musica;

-- Criar tabela Filme que contenham dados: idFilme, titulo, genero, diretor
create database Filme;
 
 -- Selecionar banco de dados
 use Filme;
 
 -- Criar tabela
 create table Filme (
 idFilme int primary key,
 titulo varchar(50),
 genero varchar (40),
 diretor varchar (40)
 );
 
 insert into Filme values
 ('1', 'IT: A coisa', 'Terror', 'Stephen King'),
('2', 'Kill Bill', 'Ação', 'Quentin Tarantino'),
('3', 'O Iluminado', 'Terror', 'Stephen King'),
('4', 'Titanic', 'Romance', 'James Cameron'),
('5', 'The Boy', 'Terror','William Brent Bell'),
('6', 'Fuja', 'Suspense', 'Aneesh Chaganty'),
('7', 'Velozes e Furiosos 7', 'Ação', 'James Wan'),
('8', 'Gente Grande', 'Comédia', 'Dennis Dugan');

-- Exibir todos os dados
select * from filme;

-- Exibir titulos e diretores
select titulo, diretor from filme;

-- Exibir dados de filmes de um determinado de genero
select * from filme where genero = 'terror';

-- Exibir dados de filmes de um diretor
select * from filme where diretor = 'Stephen King';

-- Exibir dados em ordem pelo titulo
select * from filme order by titulo asc;

-- Exibir dados em ordem decrescente pelo diretor
select * from filme order by diretor desc;

-- Exibir dados de filmes que começam em T
select * from filme
where titulo like 't%';

-- Exibir dados de diretor que termina em N
select * from filme
where diretor like '%n';

-- Exibir dados de filmes que tenham a segunda letra E
select * from filme
where titulo like '_e%';

-- Exibir dados de filmes que tenham como penultima letra O
select * from filme
where titulo like '%o_';

drop table filme;