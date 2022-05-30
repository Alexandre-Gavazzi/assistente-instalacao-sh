CREATE TABLE companhia_aerea (
    id_aeroporto int primary key IDENTITY(1,1),
    razao_aeroporto varchar(150),
    cnpj_aeroporto char (15),
    responsavel_aeroporto varchar(150),
    localidade_aeroporto varchar(150)
);

CREATE TABLE usuario(
    id_usuario int primary key IDENTITY(1,1),
    nome_usuario varchar(150),
    email_usuario varchar(150),
    senha_usuario varchar(150),
    cargo_usuario varchar(150),
    fk_aeroporto int FOREIGN KEY REFERENCES companhia_aerea (id_aeroporto)
);

create table maquina (
    id_maquina int primary key IDENTITY(1,1),
    hostname varchar(150),
    sistema_operacional varchar(150),
    fk_aeroporto in FOREIGN KEY REFERENCES companhia_aerea (id_aeroporto)
    -- NÃO USA LOCALMENTE NO DOCKER, POIS NÃO TEM AEROPORTO CADASTRADO NEM USUARIO NO BANCO DO DOCKER
);

CREATE TABLE status_maquina (
    id_status INT PRIMARY KEY IDENTITY(1,1),
    status_maquina varchar(150),
    fk_maquina INT FOREIGN KEY REFERENCES maquina (id_maquina)
);

create table disco (
    id_disco int primary key IDENTITY(1,1),
    nome varchar(150),
    modelo varchar(150),
    fk_maquina int foreign key references maquina (id_maquina)
);

create table memoria (
    id_memoria int primary key IDENTITY(1,1),
    total float,
    fk_maquina int foreign key references maquina (id_maquina)
);

create table cpu (
    id_cpu int primary key IDENTITY(1,1),
    nome_processador varchar(150),
    identificador varchar(150),
    fabricante varchar(150),
    fk_maquina int foreign key references maquina (id_maquina)
);

create table logs_disco(
    id_logs_disco int primary key IDENTITY(1,1),
    tamanho_do_volume float,
    volume_utilizado float,
    volume_disponivel float,
    data_hora datetime DEFAULT getdate(),
    fk_disco int,
    time_res_seconds float foreign key references disco (id_disco)
);

create table logs_cpu(
    id_logs_cpu int primary key IDENTITY(1,1),
    em_uso float,
    data_hora datetime DEFAULT getdate(),
    fk_cpu int foreign key references cpu (id_cpu)
);

create table logs_memoria(
    id_logs_memoria int primary key IDENTITY(1,1),
    ram_disponivel float,
    ram_uso float,
    ram_porcentagem float,
    data_hora datetime DEFAULT getdate(),
    fk_memoria int foreign key references memoria (id_memoria)
);