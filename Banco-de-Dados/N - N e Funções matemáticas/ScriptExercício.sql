-- Criar um Banco de Dados chamado venda
CREATE DATABASE Venda;

-- Selecionar esse banco de dados
USE Venda;

-- Criar as tabelas correspondentes à sua modelagem
CREATE TABLE Cliente (
idCliente INT primary key auto_increment,
Nome VARCHAR(45),
Email VARCHAR(45),
Cep CHAR(9),
Cidade VARCHAR(45),
Bairro VARCHAR(45),
Logradouro VARCHAR(45),
fkClienteInd int,
foreign key (fkClienteInd) references Cliente(idCliente)
)auto_increment = 500;

CREATE TABLE Venda (
idVendas INT,
VendaT DECIMAL(10,2),
DataVenda DATE,
fkCliente int,
foreign key(fkCLiente) references Cliente(idCliente),
primary key(idVendas, fkCliente)
);

CREATE TABLE Produto (
idProduto INT primary key,
Nome VARCHAR(45),
Descricao VARCHAR(45),
Preco DECIMAL(10,2)
);

CREATE TABLE CupomFiscal (
fkProduto int,
foreign key(fkProduto) references Produto(idProduto),
fkVenda int,
foreign key(fkVenda) references Venda(idVendas),
fkCliente int,
foreign key(fkCliente) references Venda(fkCliente),
primary key(fkProduto, fkVenda, fkCliente)
);

-- Inserir dados nas tabelas

INSERT INTO Cliente VALUES 
(null, 'Clayton', 'clay@gmail.com', '04345120', 'São Paulo', 'Saúde', 'Rua das graças', null),
(null, 'Maria', 'mary@gmail.com', '02355100', 'São Paulo', 'Sacomã', 'Rua alencar de araripe', null),
(null, 'Johnatan', 'john@gmail.com', '03367020', 'São Paulo', 'Jardins', 'Rua do limoeiro', null),
(null, 'Joana', 'joo@gmail.com', '13344910', 'São Paulo', 'Morumbi', 'Rua do grito', null),
(null, 'Walter', 'walwal@gmail.com', '01325000', 'São Paulo', 'Ipiranga', 'Rua cipriano barata', null),
(null, 'Amanda', 'mands@gmail.com', '03167480', 'São Paulo', 'Liberdade', 'Rua dos hashis', null);

UPDATE Cliente SET fkClienteInd = 502 WHERE idCliente in(503, 505);
UPDATE Cliente SET fkClienteInd = 504 WHERE idCliente in(500, 502);
UPDATE Cliente SET fkClienteInd = 503 WHERE idCliente in(504);


INSERT INTO Venda VALUES 
(1, 6.99, '2022-10-10', 500),
(2, 7.99, '2020-11-08', 501),
(3, 5.99, '2019-09-09', 500),
(4, 6.99, '2020-01-02', 501),
(5, 10.99, '2021-03-09', 502),
(6, 15.99, '2022-01-01', 503),
(7, 4.99, '2021-07-03', 502),
(8, 3.99, '2021-09-02', 503),
(9, 6.99, '2022-12-08', 504),
(10, 5.99, '2021-05-12', 504),
(11, 7.99, '2020-08-10', 505),
(12, 10.00, '2021-09-01', 505);

INSERT INTO Produto VALUES 
(1001, 'Aliança de Prata', 'Roupas e Acessórios', 1.99),
(1002, 'Kit Maquiagem', 'Cosméticos', 1.99),
(1003, 'Jaqueta puffer', 'Roupas e Acessórios', 3.99),
(1004, 'Hoodie Personalizada', 'Roupas e Acessórios', 3.99),
(1005, 'Aliança de Ouro Branco', 'Roupas e Acessórios', 5.00);

INSERT INTO CupomFiscal VALUES
(1003, 1, 500),
(1004, 2, 501),
(1002, 3, 500),
(1002, 4, 501),
(1005, 5, 502),
(1005, 6, 503),
(1001, 7, 502),
(1002, 8, 503),
(1004, 9, 504),
(1003, 10, 504),
(1004, 11, 505),
(1005, 12, 505);

-- Exibir todos os dados de cada tabela criada, separadamente

SELECT * FROM Cliente;
SELECT * FROM Venda;
SELECT * FROM Produto;
SELECT * FROM CupomFiscal;

-- Exibir os dados dos clientes e os dados de suas respectivas vendas
SELECT * FROM Cliente
	JOIN Venda ON idCliente = fkCLiente;
    
-- Exibir os dados de um determinado cliente e os dados de suas respectivas vendas.
SELECT * FROM Cliente
	JOIN Venda ON idCliente = fkCLiente WHERE Cliente.nome = 'Clayton';
    
-- Exibir os dados dos clientes e de suas respectivas indicações de clientes.
SELECT * FROM Cliente as Indicador
	JOIN Cliente as Indicado ON Indicador.idCliente = Indicado.fkClienteInd;
    
--  Exibir os dados dos clientes indicados e os dados dos respectivos clientes indicadores, porém somente de um determinado cliente indicador
SELECT * FROM Cliente as Indicador
	JOIN Cliente as Indicado ON Indicador.idCliente = Indicado.fkClienteInd WHERE Indicador.Nome = 'Walter';
    
-- Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos
SELECT Indicador.*, Venda.*, Produto.*, CupomFiscal.* FROM CupomFiscal 
    JOIN Venda ON Venda.idVendas = CupomFiscal.fkVenda
    JOIN Produto ON fkProduto = idProduto 
    JOIN Cliente as Indicador ON Indicador.idCliente = Venda.fkCliente
	JOIN Cliente as Indicado ON Indicador.idCliente = Indicado.fkClienteInd;
    
-- Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.

SELECT v.DataVenda,p.nome, cf.fkProduto FROM Venda AS v 
	JOIN CupomFiscal AS cf ON v.idVendas = cf.fkVenda 
    JOIN Produto AS p ON p.idProduto = cf.fkProduto;

-- Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto.

-- NÃO SOUBE FAZER

--  Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, e os clientes que não realizaram nenhuma venda.

INSERT INTO Cliente values
  (null, 'Caroline', 'carol@gmail.com', '01215230', 'São Paulo', 'Morumbi', 'Rua muito longe', null);
  
  SELECT * FROM Cliente LEFT JOIN Venda ON idCliente = fkCliente;

-- Exibir o valor mínimo e o valor máximo dos preços dos produtos

SELECT min(preco) 'Menor Preço' , max(preco) 'Maior Preço' FROM Produto;

-- Exibir a soma e a média dos preços dos produtos

SELECT SUM(preco)'Soma do preço',AVG(preco)'Media de preço' FROM Produto;

-- Exibir a quantidade de preços acima da média entre todos os produtos

SELECT COUNT(preco) 'Quantidade de Preços Acima da Média' FROM produto WHERE preco > (select AVG(preco) from produto);

-- Exibir a soma dos preços distintos dos produtos

SELECT SUM(DISTINCT preco)'Soma do preços disntintos dos produtos' FROM Produto;

-- Exibir a soma dos preços dos produtos agrupado por uma determinada venda

SELECT sum(preco) FROM CupomFiscal JOIN Venda AS v ON v.idVendas = fkVenda JOIN produto AS p ON p.idProduto = fkProduto;