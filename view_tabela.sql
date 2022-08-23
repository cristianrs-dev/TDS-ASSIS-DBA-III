CREATE DATABASE Agencia;
USE Agencia;
CREATE TABLE Usuario (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (128),
    login VARCHAR (128),
    senha VARCHAR (128),
    datanascimento DATETIME NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE Destino (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (128),
    origem VARCHAR (128),
    destino VARCHAR (128),
    atrativos VARCHAR (1024),
    saida DATETIME NOT NULL,
    retorno DATETIME NOT NULL,
    id_usuario INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_usuario) REFERENCES Usuario (id)
);