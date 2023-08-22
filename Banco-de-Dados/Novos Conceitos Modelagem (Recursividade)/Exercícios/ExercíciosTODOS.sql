-- EXERCÍCIO 01	
-- Criar Banco de Dados
create database Pet;
-- Usar banco de dados
use Pet;
-- Criar as tabelas equivalente a modelagem
create table cliente (
idCLiente int primary key auto_increment,
Nome varchar(45),
Sobrenome varchar(45),
TelefoneFixo char(12),
TelefoneCelular char(12),
Rua varchar(45),
Bairro varchar(45),
Número varchar(45),
Cidade varchar(45)
);
create table Pets (
idPet int auto_increment,
Tipo varchar(45),
Nome varchar(45),
Raça varchar(45),
dtNasc date,
fkCliente int,
foreign key (fkCliente) references Cliente(idCliente),
primary key (idPet, fkCliente)
)auto_increment=101;

-- Inserir Dados nas Tabelas
insert into Cliente values
(null, 'Matheus', 'Oliveira', '1112345678', '11912345678', 'Rua vírginia Cardoso', 'Sacomã', '198', 'São Paulo'),
(null, 'Juliana', 'Oliveira', '1122345678', '11922345678', 'Rua do grito', 'Sacomã', '228', 'São Paulo'),
(null, 'Henrique', 'Duarte', '1132345678', '11932345678', 'Rua Cipriano Barata', 'Ipiranga', '98', 'São Paulo'),
(null, 'Vanessa', 'Lima', '1142345678', '11942345678', 'Rua Haddock Lobo', 'Consolação', '213', 'São Paulo'),
(null, 'Deivid', 'Santos', '1152345678', '11952345678', 'Rua Almirante Nunes', 'Heliópolis', '152', 'São Paulo'),
(null, 'Mathias', 'Lima', '1162345678', '11962345678', 'Rua Marquês de Maricá', 'Sacomã', '435', 'São Paulo');

insert into pets values 
(null, 'Cachorro', 'Rex', 'Pastor Alemão', '2019-08-17', 1),
(null, 'Gato', 'Stella', 'Siames', '2016-07-16', 2),
(null, 'Roedor', 'Claudinho', 'Hamster', '2017-06-30', 3),
(null, 'Macaco', 'Kiko', 'Sagui', '2019-04-26', 4),
(null, 'Cachorro', 'Tobby', 'Husky', '2020-02-01', 5),
(null, 'Gato', 'Lady', 'Maine coon', '2015-10-25', 2),
(null, 'Cachorro', 'Jeff', 'Pastor Belga', '2017-08-22', 6);

-- Exibir todos os dados de cada tabela separadamente
select * from pets;
select * from cliente;

-- Altere o tamanho da coluna nome do cliente
alter table cliente modify column nome varchar(75);

-- Exibir dados de todos os pets que são de um determinao tipo
select * from pets where tipo = 'gato';

-- Exibir apenas o nome e a data de nascimento dos pets
select nome, dtNasc from pets;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome
select * from pets order by nome;

-- Exibir os dados dos clientes em ordem decrescente pelo bairro
select * from cliente order by bairro desc;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra
select * from pets where nome like "K%";

-- Exibir os dados dos clientes que tem o mesmo sobrenome
select * from cliente where sobrenome = "Oliveira";

-- Alterar o telefone de um determinado cliente
update cliente set telefoneFixo = "1112348888" where idCliente = 1;

-- Exibir os dados dos clientes para verificar se alterou
select * from cliente;

-- Exibir os dados dos pets e seus respectivos donos 
SELECT 
    *
FROM
    cliente AS cli
        JOIN
    pets AS pet ON cli.idCliente = pet.fkCliente;
    
-- Exibir somente os dados de 1 dono e seu(s) pet(s)
select * from cliente as cli join pets as pet on cli.idCliente = pet.fkCliente where idCliente = 2;

-- Excluir algum pet
delete from pets where idPet = 102;

-- Exibir os dados dos pets para verificar se excluiu
select * from pets;

-- Excluir as tabelas
drop table pets;
drop table cliente;

-- EXERCÍCIO 02
-- Criar as tabelas
create table pessoa (
idPessoa int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
dtNasc DATE,
profissão varchar(45)
);
create table gasto (
idGasto int auto_increment,
dtGasto DATE,
valor decimal(6,2),
descricao varchar(45),
fkPessoa int,
foreign key (fkPessoa) references Pessoa(idPessoa),
primary key (idGasto, fkPessoa)
);

-- Inserindo dados na tabela
insert into pessoa values
(null, "Edgar", "Vieira", '2000-12-04', "Engenheiro"),
(null, "Mathias", "Oliveira", '1997-02-17', "Médico"),
(null, "Oscar", "Vieira", '1990-09-27', "Médico"),
(null, "Johnatan", "Pereira", '1995-03-07', "Professor"),
(null, "Esdras", "Moreira", '2001-09-06', "Nutricionista"),
(null, "Felipe", "Moura", '2000-10-18', "Garçom")
;
insert into gasto values
(null, '2022-05-04', '1567.00', 'Roupas e acessórios', 1),
(null, '2022-08-16', '699.00', 'Mercado', 2),
(null, '2022-06-28', '90.00', 'Conta de água', 3),
(null, '2022-07-10', '65.00', 'Cabeleireiro', 4),
(null, '2022-09-01', '800.00', 'Mensalidade faculdade', 5),
(null, '2022-07-05', '600.00', 'Roupas e acessórios', 6)
;

-- Exiba os dados de cada tabela individualmente
select * from pessoa;
select * from gasto;

-- Exiba as tabelas filtrando por algum dado 
select * from pessoa where profissão = 'Médico';
select * from gasto where descricao = 'Roupas e acessórios';

-- Exiba os dados das pessoas e seus gastos correspondentes
select * from pessoa join gasto on pessoa.idPessoa = gasto.fkPessoa;
select * from pessoa join gasto on pessoa.idPessoa = gasto.fkPessoa where idPessoa = '3';

-- Atualize valores já inseridos na tabela
update gasto set valor = 800.00, descricao = 'Pintura do carro' where idGasto = '1';
update gasto set valor = 400.00, descricao = 'Conserto da moto' where idGAsto = '2';

-- Exclua um ou mais registros da tabela
delete from gasto where idGasto = '1';
delete from pessoa where idPessoa = '1';

-- EXERCÍCIO 03
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
)auto_increment = 100;
create table Acompanhante (
idAcomp int auto_increment,
Nome VARCHAR(45),
Sobrenome VARCHAR(45),
Relação VARCHAR(45),
dtNasc DATE,
fkFunc int,
foreign key (fkFunc) references Funcionario(idFunc),
primary key (idAcomp, fkFunc)
)auto_increment = 10;

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

-- Exercício 04 (Não consegui realizar devido a dificuldade em recursividade)