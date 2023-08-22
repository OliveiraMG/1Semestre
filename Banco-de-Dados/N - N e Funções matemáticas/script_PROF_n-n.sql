CREATE DATABASE relacaonton;

USE relacaonton;

CREATE TABLE pessoa (
idPessoa int primary key auto_increment,
nome varchar(45),
salario decimal(10,2)
);

CREATE TABLE endereco (
idEnd int primary key auto_increment,
cep char(9),
bairro varchar(45),
cidade varchar(45)
)auto_increment = 100;

-- criar a nossa tabela associativa
CREATE TABLE endCompleto (
fkEnd int,
foreign key (fkEnd) references endereco(idEnd),
fkPessoa int,
foreign key (fkPessoa) references pessoa(idPessoa),
primary key (fkEnd,fkPessoa),
numero int,
complemento varchar(45)
);

INSERT INTO pessoa VALUES
	(null, 'Vivian',1.99),
	(null, 'Paulo',1.59),
	(null, 'Nison',0.09);
    
INSERT INTO endereco VALUES 
	(null, '01414-905','Cerqueira Cesar', 'São Paulo'),
	(null, '04253-000','Sacomã', 'São Paulo'),
	(null, '88050-000','Centro', 'Florianópolis');

SELECT * FROM pessoa;
SELECT * FROM endereco;

desc endCompleto;
INSERT INTO endCompleto VALUES
	(101,1, 1500, 'apto 100'),
	(100,2, 595, '10 andar'),
	(100,3, 595, '6 andar');

SELECT * FROM pessoa
	JOIN endCompleto ON idPessoa = fkPessoa
    JOIN endereco ON fkEnd = idEnd;
    
SELECT pessoa.nome as Nome,
	endereco.bairro as Bairro
    FROM pessoa
	JOIN endCompleto ON idPessoa = fkPessoa
    JOIN endereco ON fkEnd = idEnd;

SELECT * FROM pessoa
	JOIN endCompleto ON idPessoa = fkPessoa
    RIGHT JOIN endereco ON fkEnd = idEnd;
    
INSERT INTO pessoa VALUES 
	(null, 'Murilo', 0.99);
    
SELECT nome,
	bairro
    FROM pessoa 
    JOIN endCompleto ON idPessoa = fkPessoa
    JOIN endereco ON fkEnd = idEnd;

SELECT nome,
	bairro
    FROM pessoa 
    LEFT JOIN endCompleto ON idPessoa = fkPessoa
    RIGHT JOIN endereco ON fkEnd = idEnd;
    
SELECT nome,
	bairro
    FROM pessoa 
    RIGHT JOIN endCompleto ON idPessoa = fkPessoa
    RIGHT JOIN endereco ON fkEnd = idEnd
UNION
SELECT nome,
	bairro
    FROM pessoa 
    LEFT JOIN endCompleto ON idPessoa = fkPessoa
    LEFT JOIN endereco ON fkEnd = idEnd;
    
SELECT nome,
	bairro
    FROM pessoa 
    RIGHT JOIN endCompleto ON idPessoa = fkPessoa
    RIGHT JOIN endereco ON fkEnd = idEnd
    WHERE fkEnd IS NULL
UNION
SELECT nome,
	bairro
    FROM pessoa 
    LEFT JOIN endCompleto ON idPessoa = fkPessoa
    LEFT JOIN endereco ON fkEnd = idEnd
    WHERE fkPessoa IS NULL;
    
-- FUNÇÕES MATEMÁTICAS
-- QUANTIDADE REGISTROS NA TABELA PESSOA
-- COUNT()
SELECT COUNT(*) FROM pessoa;
SELECT * FROM pessoa;

INSERT INTO pessoa VALUES 
	(null, 'Estela', null);
    
SELECT COUNT(salario) 'Salário' FROM pessoa;

-- LIMIT
SELECT nome FROM pessoa limit 1;
SELECT nome FROM pessoa limit 3,2;
-- SQL Server - top select top 1 campo1 from tabela1;

-- MAX E MIN
SELECT max(salario) 'Maior salário',
		min(salario) 'Menor salário'
        FROM pessoa;

-- SUM
SELECT sum(salario) FROM pessoa;

-- AVG
SELECT avg(salario) from pessoa;
-- ROUND
SELECT ROUND(AVG(salario),2) FROM pessoa;

INSERT INTO pessoa VALUES 
	(null, 'Nauana', 1.09);
    
INSERT INTO pessoa VALUES 
	(null, 'Thiago', 5199);    
    
-- truncate
SELECT truncate(avg(salario),2) FROM pessoa;

INSERT INTO pessoa VALUES 
	(null, 'Marcus', 1.09);
    
SELECT * FROM pessoa;
-- distinct
SELECT AVG(distinct salario) FROM pessoa;
SELECT SUM(distinct salario) FROM pessoa;
SELECT SUM(salario) FROM pessoa;

SELECT distinct salario FROM pessoa;

-- até aqui sucesso!! 
-- GROUP BY
SELECT bairro,
	avg(salario)
    FROM pessoa
    JOIN endCompleto ON idPessoa = fkPessoa
    JOIN endereco ON idEnd = fkEnd
    GROUP BY bairro;
    
SELECT nome, salario from pessoa
	WHERE salario = (select min(salario) from pessoa);
    
SELECT nome, salario from pessoa
	WHERE salario = (select max(salario) from pessoa);
    
SELECT nome, salario from pessoa
	WHERE salario = (select min(salario) from pessoa)
UNION
SELECT nome, salario from pessoa
	WHERE salario = (select max(salario) from pessoa);
    
SELECT nome, salario FROM pessoa
	WHERE salario <= (select avg(salario) from pessoa);
    
SELECT nome, salario from pessoa
	WHERE salario = (select min(salario) from pessoa)
	or salario = (select max(salario) from pessoa);
    
SELECT nome, salario from pessoa
	WHERE salario in 
		((select min(salario) from pessoa),(select max(salario) from pessoa));