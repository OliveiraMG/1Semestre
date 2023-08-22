use sprint1bd;
create table Professor (
idProfessor int primary key,
nome varchar(50),
sobrenome varchar(30),
especialidade1 varchar(40),
especialidade2 varchar(40)
);
insert into Professor values
('1', 'Rodolfo', 'Moraes', 'História', 'Geografia'),
('2', 'Rodrigo', 'Lopes', 'Física', 'Matemática'),
('3', 'Alex', 'Moura', 'Física', 'Química'),
('4', 'João', 'Oliveira', 'Química', 'Matemática'),
('5', 'Mathias', 'Duarte', 'História', 'Português'),
('6', 'Marcos', 'Pereira', 'Sociologia', 'Filosofia');

create table Disciplina (
idDisc int primary key,
nomeDisc varchar(45)
);
insert into Disciplina values
('1', 'História'),
('2', 'Geografia'),
('3', 'Física'),
('4', 'Matemática'),
('5', 'Química'),
('6', 'Sociologia'),
('7', 'Filosofia');

alter table Professor add column fKDisciplina int;
alter table Professor add foreign key (fkDisciplina)
references Disciplina(idDisc);

select * from professor;
select * from disciplina;

alter table professor drop column fkDisciplina;
alter table professor drop foreign key fkDisciplina;
alter table professor drop foreign key professor_ibfk_1;
alter table professor drop column fkDisciplina;

select * from professor;
alter table Disciplina add column fkProfessor int;
alter table Disciplina add foreign key (fkProfessor)
references Professor(idProfessor);

select * from disciplina;
update disciplina set fkProfessor = '1' where idDisc = '1';
update disciplina set fkProfessor = '1' where idDisc = '2';
update disciplina set fkProfessor = '2' where idDisc = '3';
update disciplina set fkProfessor = '3' where idDisc = '3';
update disciplina set fkProfessor = '4' where idDisc = '4';
update disciplina set fkProfessor = '4' where idDisc = '5';
update disciplina set fkProfessor = '6' where idDisc = '6';

select * from professor join disciplina on idProfessor = fkProfessor;
select professor.nome, disciplina.nomeDisc from professor join disciplina on idProfessor = fkProfessor;
select * from professor join disciplina on idProfessor = fkProfessor where sobrenome = 'Moura';
select professor.especialidade1, disciplina.nomeDisc from professor join disciplina on idProfessor = fkProfessor order by especialidade1;