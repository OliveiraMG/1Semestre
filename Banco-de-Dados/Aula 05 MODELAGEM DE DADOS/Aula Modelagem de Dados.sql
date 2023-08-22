use faculdade1adsc;

create table Empresa (
IdEmpresa int primary key auto_increment,
nome varchar(50) NOT NULL,
responsavel varchar(50) default 'Alguém'
);
alter table aluno ADD COLUMN fkEmpresa int;
ALTER TABLE aluno add foreign key (fkEmpresa)
references empresa(idEmpresa);

update aluno set fkEmpresa = 1 WHERE ra = '01212166';
update aluno set fkEmpresa = 2 WHERE ra = '01222004';
select * from aluno;
select * from empresa;
insert into empresa (nome, responsavel) values
('SPTECH', 'Alguém'),
('C6Bank', 'Alguém');
select aluno.nome, empresa.nome FROM aluno JOIN empresa ON idEmpresa = fkEmpresa;
select aluno.nome as Aluno, empresa.nome as Empresa FROM aluno JOIN empresa ON idEmpresa = fkEmpresa;