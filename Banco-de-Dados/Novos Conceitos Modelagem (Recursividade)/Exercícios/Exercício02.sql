-- CÒDIGOS DER Pessoas e gastos

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