create database exViws1
go 
use exViws1

create table fabricante(
	codFabr int primary key identity(1,1) not null,
	razaoSocial varchar(40) not null,
	cidade varchar(20) default 'Franca',
	uf varchar(3)check(uf in ('SP', 'MG', 'RJ'))
)

create table categoria(
	codCat int primary key identity(1,1) not null check(codCat between 1 and 999),
	descricao varchar(40) not null check (descricao between 0 and 999999),
	estatus varchar(40) check(estatus in ('Ativo','Inativo'))
)

create table produto(
	codPro int primary key identity(1,1) not null,
	descricao varchar(40),
	preco money check(preco>0),
	estoque int,
	codCat int constraint produtoPkcategoria foreign key references categoria(codCat),
	codFabr int constraint produtoPkfabricante foreign key references fabricante(codFabr)
)

select * from produto
drop table produto

insert into fabricante values(
	'blablabla',
	'rio branco',
	'MG'
)
insert into categoria values ()
insert into produto  values (
	'blablabla',
	34,
	12,
	1,
	1
),
(
	'é nois',
	12.00,
	32.00,
	2,
	2
),(
	'sfnklsjfn',
	3.00,
	2,
	3,
	3
)
select * from produto full outer join categoria on produto.codCat = categoria.codCat where produto.codCat = categoria.codCat
