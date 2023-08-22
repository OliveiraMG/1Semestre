create database relacaonton;

use relacaonton;

CREATE TABLE pessoa (
    idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    salario DECIMAL(10 , 2 )
);

CREATE TABLE endereco (
    idEnd INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(9),
    bairro VARCHAR(45),
    cidade VARCHAR(45)
)  AUTO_INCREMENT=100;

-- criar a nossa tabela associativa
CREATE TABLE endCompleto (
    fkEnd INT,
    FOREIGN KEY (fkEnd)
        REFERENCES endereco (idEnd),
    fkPessoa INT,
    FOREIGN KEY (fkPEssoa)
        REFERENCES pessoa (idPessoa),
    PRIMARY KEY (fkEnd , fkPessoa),
    numero INT,
    complemento VARCHAR(45)
);

insert into pessoa values
(null, 'Vivian', 1.99),
(null, 'Paulo', 1.59),
(null, 'Nison', 0.09);

insert into endereco values
(null, '01414-905', 'Cerqueira Cesar', 'São Paulo'),
(null, '04253-000', 'Sacomã', 'São Paulo'),
(null, '88050-000', 'Centro', 'Florianópolis');

select * from pessoa;
select * from endereco;

insert into endCompleto values
(101, 1, 1500, 'apto 100'),
(100, 2, 595, '10 andar'),
(100, 3, 595, '6 andar');

SELECT 
    *
FROM
    pessoa
        JOIN
    endCompleto ON idPessoa = fkPessoa
        JOIN
    endereco ON fkEnd = idEnd;


SELECT 
    pessoa.nome AS Nome, endereco.bairro AS Bairro
FROM
    pessoa
        JOIN
    endCompleto ON idPessoa = fkPessoa
        JOIN
    endereco ON fkEnd = idEnd;
   
    
SELECT 
    *
FROM
    pessoa
        RIGHT JOIN
    endCompleto ON idPessoa = fkPessoa
        RIGHT JOIN
    endereco ON fkEnd = idEnd;


insert into pessoa values
(null, 'Murilo', 0.99);



SELECT 
    *
FROM
    pessoa
        RIGHT JOIN
    endCompleto ON idPessoa = fkPessoa
        RIGHT JOIN
    endereco ON fkEnd = idEnd 
UNION SELECT 
    *
FROM
    pessoa
        LEFT JOIN
    endCompleto ON idPessoa = fkPessoa
        LEFT JOIN
    endereco ON fkEnd = idEnd
WHERE
    fkPessoa IS NULL;
  

-- FUNÇÕES MATEMÁTICAS
-- QUANTIDADE REGISTROS NA TABELA PESSOA

-- COUNT()

SELECT 
    COUNT(*)
FROM
    pessoa;
SELECT 
    *
FROM
    pessoa;

insert into pessoa values
(null, 'Estela', null);

SELECT 
    COUNT(salario)
FROM
    pessoa;
    
-- LIMIT
SELECT 
    nome
FROM
    pessoa
LIMIT 1;


SELECT 
    nome
FROM
    pessoa
LIMIT 3 , 2; -- O 3 SIGNIFICA QUE É A PARTIR DELE E O 2 É QUANTOS REGISTROS VOCÊ VAI QUERER APÓS O '3'
-- SQL Server - top select top 1 campo1 from tabela1;


-- MAX E MIN
SELECT 
    MAX(salario) 'Maior Salário', MIN(salario) 'Menor Salário'
FROM
    pessoa;
    
-- SUM
SELECT 
    SUM(salario)
FROM
    pessoa;

-- AVG (MÉDIA)
SELECT 
    AVG(salario)
FROM
    pessoa;

-- ROUND
SELECT 
    ROUND(AVG(salario), 2)
FROM
    pessoa;

insert into pessoa values
(null, 'Nauana', 1.09),
(null, 'Thiago', 5199);

-- truncate
SELECT 
    TRUNCATE(AVG(salario), 2)
FROM
    pessoa;
    
INSERT INTO pessoa VALUES
(null, 'Marcus', 1.09);

-- distinct APENAS VALORES DIFERENTES
SELECT 
    AVG(DISTINCT salario)
FROM
    pessoa;
    
SELECT 
    SUM(DISTINCT salario)
FROM
    pessoa;

SELECT 
    SUM(salario)
FROM
    pessoa;

SELECT DISTINCT
    salario
FROM
    pessoa;
    
-- ATÉ AQUI SUCESSO!!
-- GROUP BY

SELECT 
    bairro, AVG(salario)
FROM
    pessoa
        JOIN
    endCompleto ON idPessoa = fkPessoa
        JOIN
    endereco ON idEnd = fkEnd
GROUP BY bairro;


SELECT 
    nome, salario
FROM
    pessoa
WHERE
    salario = (SELECT 
            MIN(salario)
        FROM
            pessoa);
            
SELECT 
    nome, salario
FROM
    pessoa
WHERE
    salario = (SELECT 
            MAX(salario)
        FROM
            pessoa);
            
SELECT 
    nome, salario
FROM
    pessoa
WHERE
    salario = (SELECT 
            MIN(salario)
        FROM
            pessoa)
            
UNION
            
SELECT 
    nome, salario
FROM
    pessoa
WHERE
    salario = (SELECT 
            MAX(salario)
        FROM
            pessoa);
            
            
            
SELECT 
    nome, salario
FROM
    pessoa
WHERE
    salario <= (SELECT 
            MAX(salario)
        FROM
            pessoa);