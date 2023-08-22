-- Criar o Banco de dados Treinador
create database treinador;

-- Usar o Banco de dados Treinador
use treinador;

-- Criar as tabelas correspondentes
create table treinador (
idTreinador int auto_increment primary key,
nome varchar(45),
telefone char(12),
email varchar(80)
)auto_increment=10;

create table nadador (
idNadador int auto_increment,
nome varchar(45),
estado varchar(45),
dtNasc DATE,
fkTreinador int,
foreign key (fkTreinador) references treinador(idTreinador),
primary key (idNadador, fkTreinador)
)auto_increment=100;