-- Criar database
create database AlunoProjeto;

-- Usar database
use AlunoProjeto;

-- Criar as tabelas equivalentes à modelagem
create table Projeto (
idProjeto int primary key auto_increment,
NomeP varchar(45),
DescriçãoP varchar(100)
);

create table Aluno (
RA char(8) primary key,
NomeAl varchar(45),
Telefone char(12),
fkProjeto int,
fkRepresentante char(8),
foreign key (fkProjeto) references Projeto(idProjeto),
foreign key (fkRepresentante) references Aluno(RA)
);

create table Acompanhante (
idAcompanhante INT auto_increment,
NomeAc varchar(45),
Relação varchar(45),
fkAluno char(8),
foreign key(fkAluno) references Aluno(RA),
primary key (idAcompanhante, fkAluno)
)auto_increment = 100;

-- Inserir dados nas tabelas
insert into Projeto values
(null, 'OncOrganization','Projeto que usa sensores de temperatura e umidade para monitoramento de remédios oncológicos'),
(null, 'OncSoja','Projeto que usa sensores de temperatura, umidade e luminosidade para monitoramento de Soja'),
(null, 'ThermoData','Projeto que usa sensores de temperatura e umidade para monitoramento de DataCenter'),
(null, 'MeatOrg','Projeto que usa sensores de temperatura e umidade para monitoramento de carnes');

insert into Aluno values
('01222100', 'Matheus', '11912345678', 3, null),
('01222101', 'João', '11922345678', 1, null),
('01222102', 'Walter', '11932345678', 3, null),
('01222103', 'Maria', '11942345678', 2, null),
('01222104', 'Joana', '11952345678', 4, null);

insert into Acompanhante values
(null, 'Juliana', 'mãe', '01222100'),
(null, 'Julia', 'Irmã', '01222103'),
(null, 'Robson', 'Pai', '01222101'),
(null, 'Diego', 'Tio', '01222102'),
(null, 'Douglas', 'Irmão', '01222104');

-- Exibir todos os dados de cada tabela criada separadamente
select * from Projeto;
select * from Aluno;
select * from Acompanhante;

-- Acrescentando alunos representantes
update Aluno set fkRepresentante = '01222101' where RA in('01222100','01222102');
update Aluno set fkRepresentante = '01222103' where RA = '01222101';
update Aluno set fkRepresentante = '01222102' where RA = '01222103';
update Aluno set fkRepresentante = '01222100' where RA = '01222104';

-- Exibir dados dos alunos e dos projetos correspondentes
select * from  aluno join projeto on fkProjeto = idProjeto;

-- Exibir dados dos alunos e dos seus acompanhantes
select * from aluno join acompanhante on fkAluno = RA;

-- Exibir os dados dos alunos e de seus representantes
select * from aluno as al join aluno as au on al.fkRepresentante = au.RA;

-- Exibir dados de alunos de um determinado projeto
select * from aluno join projeto on fkProjeto = idProjeto where nomeP = 'ThermoData';

-- Exibir os dados dos alunos, projetos correspondentes e seus acompanhantes
select * from aluno join projeto on fkProjeto = idProjeto join acompanhante on fkAluno = RA;

-- Exercício 02
-- Crie um banco de dados chamado campanha
create database campanha;

-- Selecione este banco de dados
use campanha;

-- Crie as tabelas feitas na modelagem
create table Organizador (
idOrganizador int primary key auto_increment,
Nome varchar(45),
Rua varchar(60),
Bairro varchar(45),
Email varchar(60),
fkExperiente int,
foreign key (fkExperiente) references organizador(idOrganizador)
)auto_increment = 30;

create table campanha (
idCampanha int auto_increment,
Categoria varchar(45),
Instituição1 varchar(45),
Instituição2 VARCHAR(45),
dtFinalCampanha DATE,
fkOrganizador int,
foreign key (fkOrganizador) references Organizador(idOrganizador),
primary key (idCampanha)
)auto_increment = 500;

-- Inserir dados nas tabelas
insert into Organizador values
(null, 'Matheus', 'Virgínia Cardoso', 'Sacomã', 'theus_oliveiramoura@gmail.com', null),
(null, 'Mathias', 'Haddock Lobo', 'Consolação', 'mathias_123@gmail.com', null),
(null, 'Maria', 'Padre Arlindo Vieira', 'Vila das Mercês', 'maria123_lopes@gmail.com', null),
(null, 'Diogo', 'Cipriano Barata', 'Ipiranga', 'Diogo12.martins@gmail.com', null),
(null, 'José', 'Celso Garcia', 'Carrão', 'Jos3_12@gmail.com', null),
(null, 'Luana', 'Bandeirantes', 'Vila Bocaína', 'lulu123_vieira@gmail.com', null);

insert into campanha values
(null, 'Alimentação', 'Lutando contra a fome', 'Enfrentando a fome', '2022-09-30', '32'),
(null, 'Higiene', 'Tudo Limpo', 'PureClean', '2022-04-08', '31'),
(null, 'Saneamento básico', 'Reconstruindo lares', null, '2021-01-26', '31'),
(null, 'Vacina', 'AntiDoenças', 'AvantiVacina', '2022-12-27', '33'),
(null, 'Máscaras de proteção', 'Defendendo sua respiração', 'CleanAir', '2021-11-17', '35'),
(null, 'Abrigos', 'Protegendo desabrigados', 'Reconstruindo tetos', '2020-03-30', '34'),
(null, 'Alimentação', 'Adeus a fome', null , '2022-05-09', '30');

-- Exibir dados das tabelas separadamente
select * from campanha;
select * from organizador;

-- Acertos da chave estrangeira
update Organizador set fkExperiente = '30' where idOrganizador in(31, 35);
update Organizador set fkExperiente = '32' where idOrganizador in(33, 34);

-- Exibir dados dos organizadores e da suas respectivas campanhas
select * from Organizador join Campanha on idOrganizador = fkOrganizador;

-- Exibir os dados de somente um organizador e suas campanhas
select * from Organizador join campanha on idOrganizador = fkOrganizador where Nome = 'Mathias';

-- Exibir os dados dos organizadores novatos e de seus respectivos orientadores
select * from Organizador as OrgN join Organizador as OrgE on OrgN.fkExperiente = OrgE.idOrganizador;

-- Exibir os dados de somente um organizador orientador e seus novatos
select * from Organizador as OrgN join Organizador as OrgE on OrgN.fkExperiente = OrgE.idOrganizador where OrgE.Nome = 'Matheus';

-- Exibir os dados dos novatos, das respectivas campanhas e respectivos orientadores
select * from Organizador as OrgN join campanha on OrgN.idOrganizador = fkOrganizador join organizador as OrgE on OrgN.fkExperiente = OrgE.idOrganizador;

-- Exibir dados de somente um novato, de sua respectiva campanha e respectivo orientador
select * from Organizador as OrgN join campanha on OrgN.idOrganizador = fkOrganizador join organizador as OrgE on OrgN.fkExperiente = OrgE.idOrganizador where OrgE.Nome = 'Matheus';

-- EXERCÍCIO TREINADOR E NADADOR
-- Criar banco de dados chamado Treinador
create database treinador;

-- Use o database treinador
use treinador;

-- Criando as tabelas correspondentes a modelagem
create table treinador (
idTreinador int primary key auto_increment,
Nome varchar(45),
Telefone DECIMAL(12),
email varchar(80),
fkTreinador int,
foreign key (fkTreinador) references treinador(idTreinador)
)auto_increment = 10;

create table nadador (
idNadador int primary key auto_increment,
Nome Varchar(45),
Estado varchar(45),
dtNasc DATE,
fkTreinador int,
foreign key (fkTreinador) references treinador(idTreinador)
)auto_increment = 100;

-- Inserir dados na tabela
insert into treinador values
(null, 'Diego', '11912345678', 'diego12.@gmail.com', null),
(null, 'Vagner', '11922345678', 'vagner..123.@gmail.com', null),
(null, 'Walace', '11932345678', 'walace.maia12@gmail.com', null),
(null, 'Aline', '11942345678', 'aline15@gmail.com', null),
(null, 'Mathias', '11952345678', 'mathias123.@gmail.com', null),
(null, 'Douglas', '11962345678', 'douglas123@gmail.com', null);

insert into nadador values
(null, 'Jorge', 'Paraíba', '2000-05-18', 10),
(null, 'Lays', 'Paraná', '1998-03-20', 11),
(null, 'Lucia', 'Minas Gerais', '1997-02-10', 10),
(null, 'Thiago', 'Amapá', '2001-08-13', 12),
(null, 'Sofia', 'Mato Grosso', '2003-07-25', 13),
(null, 'Amanda', 'São Paulo', '1999-06-13', 14);

-- Exibir os dados de cada tabela separadamente
select * from treinador;
select * from nadador;

-- Acertos chaves estrangeiras
update treinador set fkExperiente = 14 where idTreinador in(10,12);
update treinador set fkExperiente = 15 where idTreinador in(11,13);

-- Exibir os dados dos treinadores e de seus respectivos nadadores
select * from treinador join nadador on fkTreinador = idTreinador;

-- Exibir os dados de um determinado treinador e seus respectivos nadadores
select * from treinador join nadador on fkTreinador = idTreinador where treinador.Nome = "Diego";

-- Exibir os dados dos treinadores e dos seus experientes
select * from treinador as trN join treinador as trE on trN.fkExperiente = trE.idTreinador;

-- Exibir os dados de um determinado treinador e seus respectivos orientados
select * from treinador as trN join treinador as trE on trN.fkExperiente = trE.idTreinador where trE.Nome = 'Mathias';

-- Exibir os dados dos treinadores, nadadores e orientados
select * from treinador as trN join nadador on fkTreinador = idTreinador join treinador as trE on trN.fkExperiente = trE.idTreinador;

-- Exibir os dados de um determinado treinador, seus nadadores e orientados
select * from treinador as trN join nadador on fkTreinador = idTreinador join treinador as trE on trN.fkExperiente = trE.idTreinador where trE.Nome = 'Mathias';
