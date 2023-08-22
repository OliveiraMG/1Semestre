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