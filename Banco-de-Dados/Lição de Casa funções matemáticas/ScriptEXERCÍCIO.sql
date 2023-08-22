-- CRIAR DATABASE
CREATE DATABASE Grupo;

-- USAR DATABASE
USE Grupo;

-- CRIAR AS TABELAS DE ACORDO COM A MODELAGEM
CREATE TABLE Professor (
idProfessor int primary key auto_increment,
NomeProfessor VARCHAR(45),
Disciplina VARCHAR(45)
)auto_increment = 10000;

CREATE TABLE Grupo (
idGrupo int primary key auto_increment,
NomeGrupo VARCHAR(45),
Descricao VARCHAR(45)
);

CREATE TABLE Aluno (
raAluno int,
NomeAluno VARCHAR(45),
Email VARCHAR(45),
fkGrupo int,
foreign key (fkGrupo) references Grupo(idGrupo),
primary key (raAluno, fkGrupo)
);

CREATE TABLE Avaliação (
fkGrupo int,
foreign key (fkGrupo) references Grupo(idGrupo),
fkProfessor int,
foreign key (fkProfessor) references Professor(idProfessor),
DataHora DATETIME,
Nota DOUBLE
);

-- INSERIR DADOS NAS TABELAS

INSERT INTO Professor VALUES
(null, 'Vivian', 'Banco de Dados'),
(null, 'Yoshi', 'Algoritmos'),
(null, 'Mônica', 'Tecnologia da Informação'),
(null, 'Chola', 'Arquitetura Computacional');

INSERT INTO Grupo VALUES
(null, 'ThermoData', 'DataCenter'),
(null, 'SojaTech', 'Monitoramento Soja');

INSERT INTO Aluno VALUES
('01222130', 'Wesley', 'wes123@gmail.com', '1'),
('01222131', 'José', 'jose12@gmail.com', '2'),
('01222132', 'Kauan', 'kauan23@gmail.com', '2'),
('01222133', 'Henrique', 'henri145@gmail.com', '1'),
('01222134', 'Matheus', 'math145@gmail.com', '1');

INSERT INTO Avaliação VALUES
('1', '10001', '2022-10-03 13:45:30', '7'),
('2', '10000', '2022-09-25 15:34:21' , '8');

-- EXIBIR TODOS OS DADOS DE CADA TABELA SEPARADAMENTE

SELECT * FROM Professor;

SELECT * FROM Grupo;

SELECT * FROM Aluno;

SELECT * FROM Avaliação;

-- EXIBIR OS DADOS DOS GRUPOS E OS DADOS DOS RESPECTIVOS ALUNOS

SELECT * FROM Grupo
	JOIN ALUNO ON fkGrupo = idGrupo;

-- EXIBIR OS DADOS DE UM DETERMINADO GRUPO E SEUS ALUNOS

SELECT * FROM Grupo
	JOIN ALUNO ON fkGrupo = idGrupo
    WHERE NomeGrupo = 'ThermoData';
    
-- EXIBIR AS MÉDIAS DAS NOTAS ATRIBUÍDAS AOS GRUPOS

SELECT AVG(Nota) as Nota FROM Avaliação;

-- EXIBIR A NOTA MINIMA E MAXIMA ATRIBUIDA AOS GRUPOS

SELECT MIN(Nota) 'Menor Nota', MAX(Nota) 'Maior Nota' FROM Avaliação;

-- EXIBIR A SOMA DAS NOTAS DOS GRUPOS
SELECT SUM(Nota) FROM Avaliação;

-- EXIBIR OS PROFESSORES QUE AVALIARAM CADA GRUPO, DADOS DOS GRUPOS E DATA E HORÁRIO DA AVALIAÇÃO
SELECT Professor.*, Grupo.*, Avaliação.DataHora FROM Avaliação
	JOIN Grupo ON fkGrupo = idGrupo 
    JOIN Professor ON fkProfessor = idProfessor;
    
-- EXIBIR OS DADOS DOS PROFESSORES QUE AVALIARAM UM DETERMINADO GRUPO, DADOS DO GRUPO E DATA E HORÁRIO
SELECT Professor.*, Grupo.*, Avaliação.DataHora FROM Avaliação
	JOIN Grupo ON fkGrupo = idGrupo 
    JOIN Professor ON fkProfessor = idProfessor
    WHERE NomeGrupo = 'SojaTech';
    
-- EXIBIR OS NOMES DOS GRUPOS QUE FORAM AVALIADOS POR UM DETERMINADO PROFESSOR
SELECT Grupo.NomeGrupo FROM Grupo
	JOIN Avaliação ON fkGrupo = idGrupo
	JOIN Professor ON fkProfessor = idProfessor
    WHERE NomeProfessor = 'Vivian';
    
-- EXIBIR OS DADOS DOS GRUPOS, ALUNOS, PROFESSORES E DATA E HORÁRIO
SELECT Grupo.*, Aluno.*, Professor.*, Avaliação.DataHora FROM Grupo	
	JOIN Aluno ON Grupo.idGrupo = Aluno.fkGrupo
    JOIN Avaliação ON Avaliação.fkGrupo = Grupo.idGrupo
    JOIN Professor ON fkProfessor = idProfessor;
    
-- EXIBIR A QUANTIDADE DE NOTAS DISTINTAS
SELECT count(distinct Nota) FROM Avaliação;

-- EXIBIR A IDENTIFICAÇÃO DO PROFESSOR, MÉDIA DAS NOTAS E SOMA AGRUPADAS POR PROFESSOR		
SELECT Professor.NomeProfessor, sum(Nota), AVG(Nota) FROM Avaliação
	JOIN Professor ON fkProfessor = idProfessor
    group by NomeProfessor;
    
-- EXIBIR A IDENTIFICAÇÃO DO GRUPO, MÉDIA DAS NOTAS E SOMA AGRUPADAS POR GRUPO	
SELECT Grupo.NomeGrupo, sum(Nota), AVG(Nota) FROM Avaliação
	JOIN Grupo ON fkGrupo = idGrupo
    group by NomeGrupo;
    
-- EXIBIR A IDENTIFICAÇÃO DO PROFESSOR A MENOR NOTA E A MAIOR ATRIBUÍDA AGRUPADO POR PROFESSOR
SELECT MIN(Nota) 'Menor Nota', MAX(Nota) 'Maior Nota' FROM Avaliação
	JOIN Professor ON fkProfessor = idProfessor
    group by NomeProfessor;
    
-- EXIBIR A IDENTIFICAÇÃO DO GRUPO A MENOR NOTA E A MAIOR ATRIBUÍDA AGRUPADO POR GRUPO
SELECT MIN(Nota) 'Menor Nota', MAX(Nota) 'Maior Nota' FROM Avaliação
	JOIN Grupo ON fkGrupo = idGrupo
    group by NomeGrupo;