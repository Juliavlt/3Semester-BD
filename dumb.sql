-- Julia Valente
create database `bd1_parte1`;

use bd1_parte1;

-- Julia Valente
create table departamento (
codigo int not null,
nome varchar(50),
constraint departamento_pk primary key (codigo)
);

desc departamento;

-- Julia Valente
create table funcionario (
codigo int not null,
cpf varchar(12),
nome varchar(50),
tipo varchar(45),
salario int,
codDepartamento int,
constraint funcionario_pk primary key (codigo),
constraint func_depto_fk foreign key (codDepartamento) references departamento(codigo) 
);


desc funcionario;

-- Julia Valente
create table motorista (
cnh int,
codFuncionario int,
constraint motorista_pk primary key (codFuncionario,cnh),
constraint mot_func_fk foreign key (codFuncionario) references funcionario(codigo)
);

desc motorista;

-- Julia Valente
create table secretaria (
codFuncionario int,
constraint secretaria_pk primary key (codFuncionario),
constraint sec_func_fk foreign key (codFuncionario) references funcionario(codigo)
);
desc secretaria;

-- Julia Valente
create table processadorTextos (
codigo int,
codSecretaria int,
nome varchar(50),
constraint procTextos_pk primary key (codigo,codSecretaria),
constraint proc_sec_fk foreign key (codSecretaria) references funcionario(codigo)
);
desc processadorTextos;

-- Julia Valente
create table ramoEngenharia(
codigo int,
nome varchar(50),
constraint ramo_pk primary key (codigo)
);
desc ramoEngenharia;

-- Julia Valente
create table engenheiro (
codFuncionario int,
ramoEngenharia int,
CREA varchar(40),
constraint engenheiro_pk primary key (codFuncionario),
constraint eng_func_fk foreign key (codFuncionario) references funcionario(codigo),
constraint eng_ramo_fk foreign key (ramoEngenharia) references ramoEngenharia(codigo)
);
desc engenheiro;

-- Julia Valente
create table engenheiro_participa_projeto (
	codProjeto int,
	codEngenheiro int,
    constraint participa_pk primary key (codEngenheiro,codProjeto),
    constraint eng_proj1_fk foreign key (codEngenheiro) references funcionario(codigo),
    constraint eng_proj2_fk foreign key (codProjeto) references projetoEngenharia(codigo)
);

-- Julia Valente
create table projetoEngenharia(
codigo int,
nome varchar(40),
constraint projeto_pk primary key (codigo)
);
desc projetoEngenharia;


-- ------------------------------------------------ INSERTS -----------------------------------------------------------

-- Julia Valente
insert into departamento (codigo, nome) values (1,'Departamento Administrativo');
insert into departamento (codigo, nome) values (2,'Departamento Financeiro');
insert into departamento (codigo, nome) values (3,'Departamento de RH');
insert into departamento (codigo, nome) values (4,'Departamento de Engenharia');

-- Julia Valente
insert into funcionario(codigo,cpf,nome,tipo,salario,codDepartamento) values
(12,32904184345,'Julia Valente','engenheiro',3000,1),
(13,43985012489,'Pedro Lucas Silva','engenheiro',9888,1),
(14,14857128974,'Leonardo Balestero','engenheiro',7666,1),
(15,52385702984,'Lorenzo Bianco','engenheiro',5778,4),
(21,23565892791,'Guilherme Bianco','motorista',2000,2),
(22,47575020100,'Helena Martins da Rosa','motorista',2334,2),
(31,23848585858,'Gabriela Bianchin','secretária',4000,3),
(32,13492483333,'Hugo Prando','secretária',4500,3),
(33,24158710294,'Luiza Verardi','secretária', 6000,1),
(34,99191938338,'Julia Ferreira','secretária',3124,3),
(01,34588589930,'Rachel Lazarini','funcionario',4500,2),
(02,12837839849,'Lara da Silva','funcionario',1235,4),
(03,32748904590,'José dos Campos Valente','funcionario',19999,4);


-- Julia Valente
insert into engenheiro (codFuncionario, CREA) 
values (12,'123-4'), 
(13,'134-5'),
(14,'175-4'),
(15,'120-2');

-- Julia Valente
insert into motorista (cnh, codFuncionario) 
values(345675,21),(235764,22);

-- Julia Valente
insert into processadortextos(codigo,codSecretaria,nome) 
values (1,31,'PowerPoint'),(2,32,'Word'),(3,33,'Excel'),(4,34,'GoogleDocs');

-- Julia Valente
insert into projetoengenharia (codigo, nome) 
values 
(1,'Projeto Novo Processador de Textos'),
(2,'Projeto Mecatronica'),
(3,'Projeto Criação do Site da Empresa X');

-- Julia Valente
insert into engenheiro_participa_projeto(codProjeto,codEngenheiro)
values 
(1,13),(3,12);

-- Julia Valente
insert into ramoengenharia(codigo,nome)
values 
(1,'Engenharia Mecatrônica'),
(2,'Engenharia da Computação'),
(3,'Engenharia Civil'),
(4,'Engenharia de Materiais'),
(5,'Engenharia Aeronáutica');

-- Julia Valente
insert into secretaria(codFuncionario)
values
(31),(32),(33),(34);
