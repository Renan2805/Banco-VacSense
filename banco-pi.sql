create database sprint1;
use sprint1;

create table tbEmpresa (
  idEmpresa int primary key auto_increment,
  nomeEmpresa varchar(60) not null,
  cnpj char(14) not null,
  segmento varchar(20) not null,
  tel char(10) not null,
  email varchar(30) not null,
  cep char(8) not null,
  numero varchar(5) not null,
  complemento varchar(20)
) auto_increment = 100;

create table tbUsuario (
  idUsuario int primary key auto_increment,
  nomeUsuario varchar(60) not null,
  senha varchar(60) not null,
  -- Permissão basica: Apenas visualização dos dados;
  -- Permissão intermediario: Visualização dos dados, permissão para alterar algumas configurações;
  -- Permissão total: Permissão para realizar todas as ações dentro do sistema, incluindo criar novos usuarios dentro da empresa.
  permissoes varchar(30) constraint chkPermissao check (permissoes in ('basico', 'intermediario', 'total')),
  idEmpresa int
) auto_increment = 1000;

create table tbSensor (
  idSensor int primary key auto_increment,
  tipoSensor varchar(30) constraint chkTipo check (tipoSensor in ('presenca', 'temperatura')),
  dtInstalacao date not null,
  localInstalacao varchar(60) not null,
  idEmpresa int
);

create table tbEntradaSensor (
  idEntrada int primary key auto_increment,
  valorEntrada float not null, -- No caso do sensor de presença será 0 ou 1
  dtEntrada datetime not null,
  idSensor int
) auto_increment = 10000;

insert into tbEmpresa values
	(default, 'QLL Logistica', '12610534000119', 'Saúde Humana', '1149667355', 'contato@qll.com.br', '07182000', '58', null);
    
select * from tbEmpresa;

insert into tbUsuario values
	(default, 'admin_QLL', '9pewriopwefg9', 'total', 100),
    (default, 'usuario01_QLL', 'uigasd86123s', 'intermediario', 100),
    (default, 'usuario02_QLL', '9ussdasd08', 'basico', 100);
    
select * from tbUsuario;

insert into tbSensor values
	(default, 'presenca', current_date(), 'Frezzer 1', 100),
    (default, 'temperatura', current_date(), 'Frezzer 1', 100);
    
select * from tbSensor where idEmpresa = 100;