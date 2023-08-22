-- Criar banco de dados
create database PraticaFuncionario;

-- Selecionar o banco de dados
use PraticaFuncionario;

-- Criar tabelas
create table Setor (
idSetor int primary key auto_increment,
Nome VARCHAR(45),
Andar CHAR(3)
);
create table Funcionario (
idFunc int,
Nome VARCHAR(45),
Sobrenome VARCHAR(45),
Telefone CHAR(12),
Salário DECIMAL(6,2),
fkSetor int,
foreign key (fkSetor) references Setor(idSetor),
primary key (idFunc, fkSetor)
);
create table Acompanhante (
idAcomp int,
Nome VARCHAR(45),
Sobrenome VARCHAR(45),
Relação VARCHAR(45),
dtNasc DATE,
fkFunc int,
foreign key (fkFunc) references Funcionario(idFunc),
primary key (idAcomp, fkFunc)
);

-- Inserir dados na tabela
insert into Setor values
(null, 'Alpha', '001'),
(null, 'Bravo', '002'),
(null, 'Charlie', '003');

insert into Funcionario values
(100, "Henrique", "Vieira", "11912345678", "1860.57", "1"),
(101, "João", "Silva", "11922345678", "1900.87", "2"),
(102, "Joshua", "Duarte", "11932345678", "1578.99", "3"),
(103, "Julia", "Pereira", "11942345678", "2540.87", "2"),
(104, "Matheus", "Oliveira", "11952345678", "3267.09", "3"),
(105, "Mathias", "Pereira", "11962345678", "2436.08", "1");

insert into Acompanhante values
(1, "Lucas", "Vieira", "Irmão", "2000-09-20", "100"),
(2, "Valter", "Silva", "Irmão", "1999-03-4", "101"),
(3, "Marcos", "Duarte", "Tio", "1990-05-09", "102"),
(4, "Marcelo", "Pereira", "Pai", "1980-09-14", "103"),
(5, "Paulo", "Oliveira", "Irmão", "2004-07-05", "104"),
(6, "Henrique", "Pereira", "Sobrinho", "2000-08-16", "105");

-- Exibir dados de cada tabela separadamente
select * from Setor;
select * from Funcionario;
select * from Acompanhante;

-- Exibir os dados dos setores e seus respectivos funcionários
select * from Setor join Funcionario on Setor.idSetor = Funcionario.fkSetor;

-- Exibir os dados de um determinado setor (Informando o nome na consulta)
select * from Setor join Funcionario on Setor.idSetor = Funcionario.fkSetor where Setor.Nome = "Bravo";

-- Exibir os dados dos funcionarios e seus acompanhantes
select * from Funcionario as func join Acompanhante as acomp on Func.idFunc = acomp.fkFunc;

-- Exibir os dados de apenas um funcionario (pelo nome) e seus acompanhantes
select * from Funcionario as func join Acompanhante as acomp on func.idFunc = acomp.fkFunc where func.Nome = "Matheus";

-- Exibir os dados dos funcionarios, seus setores e acompanhantes
select * from Funcionario as func join Acompanhante as acomp on func.idFunc = acomp.fkFunc join setor on func.fkSetor = setor.idSetor;