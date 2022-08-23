INSERT INTO Usuario (nome, login, senha, datanascimento)
VALUES 
('Ana', 'Ana', '123', '2000-10-10'),
('João', 'João', '123', '1995-05-05'),
('Tiburcio','Tiburcio','123','1975-02-23');

INSERT INTO Destino (nome, origem, destino, atrativos, saida, retorno, id_usuario)
VALUES (
'Rio de Janeiro', 'Curitiba', 'Rio de Janeiro', 'Cidade Maravilhosa', '2022-02-20', '2022-02-28', 2);
INSERT INTO Destino (nome, origem, destino, atrativos, saida, retorno, id_usuario)
VALUES (
'Londres', 'Curitiba', 'Londres', 'Cidade Inglesa', '2022-02-20', '2022-02-28', 1 );
INSERT INTO Destino (nome, origem, destino, atrativos, saida, retorno, id_usuario)
VALUES (
'Nova Zelandia', 'Curitiba', 'Londres', 'Ilha turistica', '2022-02-20', '2022-02-28', 3);

select * from usuario;
select * from destino;

SELECT D.nome AS Pacote, D.Destino AS Cidade, U.Nome AS responsavel
FROM Destino AS D
INNER JOIN Usuario AS U
ON D.ID_usuario = U.ID;