-- MOSTRAR BANCOS CRIADOS NO SERVIDOR
SHOW DATABASES;

-- SELECIONAR O BANCO DE DADOS 1ADSC
USE faculdade1adsc;

-- MOSTRAR AS TABELAS DO MEU BANCO DE DADOS
SHOW TABLES;

-- CRIAR TABELA CHAMADA PESSOA

CREATE TABLE pessoa (
    id INT PRIMARY KEY,
    nome VARCHAR(50),
    peso FLOAT,
    altura DOUBLE,
    salario DECIMAL(10,2)
);

-- NÚMEROS DECIMAIS
-- FLOAT 8 DÍGITOS (32 BITS)
-- DOUBLE 15 DÍGITOS (64 BITS)
-- DECIMAL(10,2) 28 DÍGITOS (128 BITS)
-- 12345678,90
-- DECIMAL(4,2) 12,34

SHOW TABLES;
/*
+--------------------------+
| Tables_in_faculdade1adsc |
+--------------------------+
| aluno                    |
| empresa                  |
| pessoa                   |
+--------------------------
*/

DESC pessoa;

INSERT INTO pessoa VALUES (1, 'Cebolinha', 87.9, 1.55, 1.99);

SELECT * FROM pessoa;
/*
+----+-----------+------+--------+---------+
| id | nome      | peso | altura | salario |
+----+-----------+------+--------+---------+
|  1 | Cebolinha | 87.9 |   1.55 |    1.99 |
+----+-----------+------+--------+---------+
*/

ALTER TABLE pessoa MODIFY COLUMN id INT AUTO_INCREMENT;

INSERT INTO pessoa VALUES (null, 'Mônica', 90.3, 1.40, 2.99);

ALTER TABLE pessoa AUTO_INCREMENT = 100;

INSERT INTO pessoa (nome, peso, altura, salario) 
    VALUES ('Cascão', 78.2, 1.52, 2.50);

SELECT * FROM pessoa;
/*
+-----+-----------+------+--------+---------+
| id  | nome      | peso | altura | salario |
+-----+-----------+------+--------+---------+
|   1 | Cebolinha | 87.9 |   1.55 |    1.99 |
|   2 | Mônica    | 90.3 |    1.4 |    2.99 |
| 100 | Cascão    | 78.2 |   1.52 |    2.50 |
+-----+-----------+------+--------+---------
*/

-- FRASE: A pessoa XPTO pesa XPTO, mede XPTO e ganha XPTO!
SELECT CONCAT('A pessoa ', nome, ' pesa ', peso, ', mede ', altura,
    ' e ganha ', salario, '!') FROM pessoa;

-- Apelidando o meu campo CONCAT utilizando o AS (ALIASES)
SELECT CONCAT('A pessoa ', nome, ' pesa ', peso, ', mede ', altura,
    ' e ganha ', salario, '!') as Frase FROM pessoa ORDER BY nome;
/*
+-------------------------------------------------------+
| Frase                                                 |
+-------------------------------------------------------+
| A pessoa Cebolinha pesa 87.9, mede 1.55 e ganha 1.99! |
| A pessoa Mônica pesa 90.3, mede 1.4 e ganha 2.99!     |
| A pessoa Cascão pesa 78.2, mede 1.52 e ganha 2.50!    |
+-------------------------------------------------------
*/
