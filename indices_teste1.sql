/*USAR O ID DE CLIENTE COMO INDEX*/
create table clientes (
	codigo int(11) not null auto_increment,
    nome varchar(100) not null, 
    email varchar(100) not null, 
    telefone varchar(100) not null, 
    primary key (codigo)
    );
    drop table clientes;
    insert into clientes(codigo,nome,email,telefone)
    values		(1,'cristian ramos dos santos','cristian@gmail.com','9999-444555'),
				(2,'cristiane ramos dos santos','cristiane@gmail.com','3125-56689'),
                (3,'adriano ramos dos santos','adriano@gmail.com','7894545-565465'),
                (4,'rosilane da costa sarrazin','rosilane@gmail.com','412235-444555'),
                (5,'cristiano','cristiano@gmail.com','1414496-152545');
		
                select * from clientes;
                create index idx_email on clientes(email desc);
                show index from clientes;
                drop index idx_email on clientes;
                explain select * from clientes where nome='rosilane';
                explain select * from clientes where email='rosilane@gmail.com';
/* USAR UM INDEX PARA PESQUISAR O NOME DA EDITORA*/
CREATE TABLE Editora 
(
    Id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    NomeEditora VARCHAR(40) NOT NULL,
    index(NomeEditora)
);
INSERT INTO Editora (NomeEditora)
VALUES 
('Senac'),
('Mc Graw-Hill'),
('Apress'),
('Bookman'),
('Bookboon'),
('Packtpub'), 
('O´Reilly'),
('Springer'),
('Érica'),
('For Dummies'),
('Novatec'),
('Microsoft Press'),
('Cisco Press'),
('Addison-Wesley'),
('Companhia das Letras'),
('Artech House'),
('Wiley'),
('CRC Press'),
('Manning'),
('Penguin Books'),
('Sage Publishing');
select * from editora;
select * from editora where NomeEditora='springer';
EXPLAIN select * from editora where NomeEditora='Sage Publishing';
create index index_NomeEditora on Editora(NomeEditora desc);
drop index index_NomeEditora on Editora;
SHOW INDEX FROM editora;
show index from cliente;