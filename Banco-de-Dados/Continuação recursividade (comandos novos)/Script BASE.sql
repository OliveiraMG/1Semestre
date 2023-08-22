create database domingos;

use domingos;

create table funcionario (
idFunc int primary key auto_increment,
nome varchar(45),
salario decimal(10,2),
fkSuper int,
foreign key (fkSuper) references funcionario(idFunc)
);

create table dependente (
idDep int,
fkFunc int,
foreign key (fkFunc) references funcionario(idFunc),
primary key (idDep, fkFunc),
nome varchar(45),
parentesco varchar(45)
);

show tables;

-- Criar um funcionário supervisor
insert into funcionario values
(null, 'Domingos', 8.99, null);

select * from funcionario;
select * from dependente;

-- Inserir os funcionários supervisionados pelo Domingos
insert into funcionario values
(null, 'Vivian', 1.99, 1),
(null, 'Paulo', 1.99, 1);

insert into funcionario (nome, salario, fkSuper) values
('Thiago', 0.09, 2);

insert into dependente values
(1, 1, 'Sábado', 'Esposa'),
(1, 2, 'Betinha', 'Mãe');

insert into dependente values
(2, 1, 'Feriado', 'Pai'),
(1, 4, 'Tânia', 'Irmã');

select f.nome as NomeFunc,
s.nome as NomeSuper
from funcionario as f
join funcionario as s
on f.fkSuper = s.idFunc;

select f.nome as NomeFunc,
s.nome as NomeSuper,
d.nome as NomeDep
from funcionario as f
join funcionario as s
on f.fkSuper = s.idFunc
join dependente as d
on d.fkFunc = f.idFunc;

select f.nome as NomeFunc,
IFNULL(d.nome, 'SEM DEPENDENTE') as NomeDep
from funcionario as f left join dependente as d
on f.idFunc = d.fkFunc;

select f.*,
s.nome as Supervisor
from funcionario as f left join funcionario as s
on f.fkSuper = s.idFunc
where f.fkSuper is null;