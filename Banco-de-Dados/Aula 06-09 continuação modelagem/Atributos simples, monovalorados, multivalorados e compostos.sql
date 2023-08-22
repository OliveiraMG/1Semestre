use sprint2;


create table funcionario (
idFunc int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
telefoneFixo char(11),
telefoneCel char(12),
ddd char(2),
prefixo char(5),
sufixo char(4)
);

insert into funcionario (nome, telefoneFixo) values
('Vivian', '11-54321111');

select * from funcionario;
insert into funcionario (sobrenome, ddd, prefixo, sufixo) values
('Souza', '11', '98765', '3344');

select * from funcionario;

insert into funcionario (nome, sobrenome, ddd, prefixo, sufixo) values
('Paulo', 'Silva', '51', '98080', '3344');

select concat ('Meu nome completo é ', nome, ' ', sobrenome) as Completo from funcionario;

select concat('Meu nome completo é ', ifnull(nome, ''),
 ' ', ifnull(sobrenome, '')) as Completo 
 from funcionario;