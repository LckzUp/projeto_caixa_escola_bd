/*drop database caixa_escola;*/

create database caixa_escola;

use caixa_escola;

create table funcionario(
	pk int not null auto_increment, primary key(pk),
    nome varchar(255) not null,
    login varchar(255) not null
);

create table produto(
	pk int not null auto_increment, primary key(pk),
    nome varchar(255) not null,
    valor decimal(25) not null
);

create table venda(
	pk int not null auto_increment, primary key(pk),
    data_venda datetime not null,
    horario datetime not null,
    funcionario_fk int not null, foreign key(funcionario_fk) references funcionario(pk),
    produto_fk int not null, foreign key(produto_fk) references produto(pk)
);

create table pix(
	pk int not null auto_increment, primary key(pk),
    aluno_nome varchar(255) not null,
    aluno_turma varchar(255) not null,
    venda_fk int not null, foreign key(venda_fk) references venda(pk)
);

create table caixa(
	pk int not null auto_increment, primary key(pk),
    nome varchar(255) not null,
    venda_fk int not null, foreign key(venda_fk) references venda(pk)
);

create table historico_venda(
	pk int not null auto_increment, primary key(pk),
	data_venda datetime not null,
	operador varchar(255) not null,
	valor decimal(2) not null,
	funcionario_fk int not null, foreign key(funcionario_fk) references funcionario(pk),
	venda_fk int not null, foreign key(venda_fk) references venda(pk)
);

/*funcinario*/

insert into funcionario (nome, login) value ("Norberto", "norbertomatadordeporco");
insert into funcionario (nome, login) value ("Gisele", "giselesalgados");
insert into funcionario (nome, login) value ("Sérgio", "tchuqui");
insert into funcionario (nome, login) value ("Dinael", "pinduquinha123");
insert into funcionario (nome, login) value ("Eleia", "geleinha123");

select * from funcionario;

/*produto*/

insert into produto (nome, valor) value ("Perâ", '27,98');
insert into produto (nome, valor) value ("Calabreso", '30,57');
insert into produto (nome, valor) value ("Escova de Dente", '1,50');
insert into produto (nome, valor) value ("Piruca", '20,99');
insert into produto (nome, valor) value ("Ak-47", '1500,00');

select * from produto;
