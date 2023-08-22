use sprint2;
create table Curso (
idCurso int primary key auto_increment,
nome varchar(50),
sigla varchar(3),
coordenador varchar(50)
);
insert into curso (nome, sigla, coordenador) values
('Ciências da Computação', 'CCO', 'Roberto'),
('Análise e desenvolvimento de sistemas', 'ADS', 'Douglas'),
('Sistemas de informação', 'SIS', 'Rodrigo');

create table alunos (
idAluno int primary key auto_increment,
nomeAluno varchar(50),
sobrenomeAluno varchar(50),
bairro varchar(50)
);
insert into alunos (nomeAluno, sobrenomeAluno, bairro) values
('Matheus', 'Oliveira', 'Sacomã'),
('Mathias', 'Matos', 'Ipiranga'),
('João', 'Duarte', 'Vila Madalena'),
('Lucas', 'Vieira', 'Pinheiros'),
('Kauan', 'Pereira', 'Freguesia do Ó'),
('Henrique', 'Lopes', 'Morumbi');

alter table curso ADD COLUMN fkAlunos int;
ALTER TABLE curso add foreign key (fkAlunos)
references alunos(idAluno);
select * from curso;
update curso set fkAlunos = '1' where idCurso = '1';
update curso set fkAlunos = '2' where idCurso = '2';
update curso set fkAlunos = '3' where idCurso = '3';
update curso set fkAlunos = '4' where idCurso = '1';
update curso set fkAlunos = '5' where idCurso = '2';
update curso set fkAlunos = '6' where idCurso = '3';

select * from Alunos join curso on idAluno = fkAlunos;
select * from Alunos;
select * from curso;
select * from Alunos join curso on idAluno = fkAlunos where nomeAluno = 'Lucas';
alter table curso add constraint chcksigla check (sigla in('ADS', 'CCO', 'SIS'));