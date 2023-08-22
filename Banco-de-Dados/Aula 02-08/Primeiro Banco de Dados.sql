-- CRIAR BANCO DE DADOS
create database faculdade1adsc;

-- SELECIONAR O BANCO DE DADOS
USE faculdade1adsc;

-- CRIAR TABLE ALUNO
create table ALUNO (
ra char(8) primary key,
nome varchar(50),
bairro varchar(50)
);

-- EXIBIR OS DADOS DA TABELA
select * from aluno;

-- INSERIR DADOS NA TABELA
insert into aluno values
('01222100', 'Matheus Gabriel', 'Sacomã');

-- INSERIR MAIS DE UM ALUNO DE UMA VEZ
insert into aluno values
('01212166', 'Pedro', 'Guaianazes'),
('01222136', 'Igor', 'Grajaú'),
('01222167', 'Luiz', 'Vila Medeiros');

-- EXIBIR OS ALUNOS EM ORDEM ALFABÉTICA
-- CRESCENTE
select * from aluno order by nome asc;
-- DECRESCENTE
select * from aluno order by nome desc;

-- Aula 09/08
-- INSERIR MAIS DE UM ALUNO DE UMA VEZ
insert into aluno values
('01222004', 'Letícia', 'Taboão'),
('01222999', 'Vivian', 'Paraíso');

use faculdade1adsc;
select * from aluno;

-- EXIBIR O ALUNOS QUE O NOME É LUIZ
select * from aluno where nome = 'Luiz';

-- Atualizar o nome do Luiz
update aluno set nome = 'Luiz Difícil'
where ra = '01222167';

-- Descrever a estrutura da tabela
DESC aluno;
describe aluno;


-- Exibir o nome do Aluno que começa com luiz
select * from aluno
where nome like 'Luiz %'; -- porcentagem significa que não importa o que vem depois

-- Exibir os nomes dos alunos que o segundo nome comaça com D
select * from aluno
where nome like '% D%'; -- antes do D nada importa, assim só aparecerá o início do sobrenome, afinal tem o espaço

-- Exibir os nomes que contém D
select * from aluno
where nome like '%d%'; -- Nada importa antes ou depois, dessa forma irá puxar todos os nomes com D

-- Exibir o nome que a segunda letra é g
select * from aluno
where nome like '_g%'; -- o Underline substitui o caractere anterior, assim vindo a segunda

-- Exibir o nome que a penultima letra é o
select * from aluno
where nome like '%o_';
