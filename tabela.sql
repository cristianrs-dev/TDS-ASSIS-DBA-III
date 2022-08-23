CREATE DATABASE Eventos;
USE Eventos;
CREATE TABLE participantes(
    idParticipante INT (9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200),
    dt_nasc DATE,
    genero VARCHAR(2),
    logradouro VARCHAR(200),
    bairro VARCHAR(200),
    cidade VARCHAR(200),
    complemento VARCHAR(200),
    uf VARCHAR(2),
    cep VARCHAR(200),
    comunidade VARCHAR(200),
    participa VARCHAR(1),
    movimento VARCHAR(1),
    escola VARCHAR(200),
    sabendo VARCHAR(200)
);