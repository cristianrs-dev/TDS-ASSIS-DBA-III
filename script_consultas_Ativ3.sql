use uc4atividades;

/***
consulta para um relatório de todas as vendas pagas em dinheiro. 
Necessários para o relatório data da venda, valor total; produtos vendidos, quantidade e valor unitário;
 nome do cliente, cpf e telefone.
Ordena-se pela data de venda, as mais recentes primeiro.
**/
/*ANTES DAS OTIMIZACOES
ROWS = 800 linhas
index = 2 retornos com index
TEMPO DE EXECUCAO LADO CLIENTE =0:00:0,01500000
TEMPO DE EXECUCAO PELO SERVICO = 188940 usando (,)VIRGULA E  WHERE
*/
/*DEPOIS DAS OTIMIZACOES
ROWS = 248 linhas
index = 3 retornos com index
TEMPO DE EXECUCAO LADO CLIENTE =0:00:0,00000000
TEMPO DE EXECUCAO PELO SERVICO = 0:00:0.00156410 usando INNER JOIN E ON
*/
/*INDEX*/
create index idx_tipo_pagamento on venda(tipo_pagamento desc);
create index idx_data on venda(data desc);
show index from venda;

/*EXPLAIN*/
EXPLAIN SELECT v.data,iv.nome_produto, iv.quantidade,iv.valor_unitario,iv.subtotal,
c.nome,c.cpf,c.telefone  
FROM venda v inner join item_venda iv inner join produto p inner join cliente c inner join funcionario f
on v.id = iv.venda_id 
and c.id = v.cliente_id 
AND p.id = iv.produto_id 
AND f.id = v.funcionario_id 
and tipo_pagamento = 'D'
order by v.data desc;

/*VIEW*/
create view forma_de_pagamento as SELECT v.data,iv.nome_produto, iv.quantidade,iv.valor_unitario,iv.subtotal,
v.tipo_pagamento, c.nome,c.cpf,c.telefone  
FROM venda v inner join item_venda iv inner join produto p inner join cliente c inner join funcionario f
on v.id = iv.venda_id 
and c.id = v.cliente_id 
AND p.id = iv.produto_id 
AND f.id = v.funcionario_id 
order by v.data desc;

select * from forma_de_pagamento where tipo_pagamento ="D";


/***
consulta para encontrar todas as vendas de produtos de um dado fabricante
Mostrar dados do produto, quantidade vendida, data da venda.
Ordena-se pelo nome do produto.
***/

/*ANTES DAS OTIMIZACOES
ROWS = 51 linhas
index = 
TEMPO DE EXECUCAO LADO CLIENTE =0:00:0,00000000
TEMPO DE EXECUCAO PELO SERVICO = 0:00:0.00987310 usando (,)VIRGULA E  WHERE
*/
/*DEPOIS DAS OTIMIZACOES
ROWS = 14 linhas
index = 3 retornos com index
TEMPO DE EXECUCAO LADO CLIENTE =0:00:0,00000000
TEMPO DE EXECUCAO PELO SERVICO = 0:00:0.00156410 usando INNER JOIN E ON
*/
/*INDEX*/
select * from produto;
create index idx_fabricante on produto(fabricante desc);
create index idx_nome on produto(nome desc);
show index from produto;

/*EXPLAIN*/
EXPLAIN SELECT p.fabricante, p.nome, iv.quantidade qtd_vendida,iv.valor_unitario, iv.subtotal, v.data  
FROM produto p inner join item_venda iv inner join venda v
on p.id = iv.produto_id 
AND v.id = iv.venda_id 
AND p.fabricante='ultralar' order by p.nome;

/*VIEW*/

 CREATE VIEW produtos_por_fabricante as SELECT p.fabricante, p.nome, iv.quantidade qtd_vendida,iv.valor_unitario, iv.subtotal, v.data  
FROM produto p inner join item_venda iv inner join venda v
on p.id = iv.produto_id 
AND v.id = iv.venda_id 
 order by p.nome;

select * from produtos_por_fabricante where fabricante='Bons Ventos';
 
/***
Relatório de vendas de produto por cliente.
Mostrar dados do cliente, dados do produto e valor e quantidade totais de venda ao cliente de cada produto.
*/
/*ANTES DAS OTIMIZACOES
ROWS = 232 linhas
index = 1 linhas usando index
TEMPO DE EXECUCAO LADO CLIENTE =0:00:0,00000000
TEMPO DE EXECUCAO PELO SERVICO = 0:00:0.0038240 usando (,)VIRGULA E  WHERE
*/
/*DEPOIS DAS OTIMIZACOES
ROWS =  232 linhas
index =  2 retornos com index
TEMPO DE EXECUCAO LADO CLIENTE =0:00:0,00000000
TEMPO DE EXECUCAO PELO SERVICO = 0:00:0.00000000 usando INNER JOIN E ON
*/
/*INDEX*/
create index idx_nome on cliente(nome desc);
show index from item_venda;

/*EXPLAIN*/
explain SELECT p.nome,iv.valor_unitario, SUM(iv.subtotal) valorTotal,
 SUM(iv.quantidade) quantidade,c.nome cliente
FROM produto p inner join item_venda iv inner join venda v inner join cliente c
on p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id
GROUP BY c.nome, p.nome;

/*VIEW*/
CREATE VIEW vendas_produtosPor_cliente as SELECT p.nome,iv.valor_unitario, SUM(iv.subtotal) valorTotal,
 SUM(iv.quantidade) quantidade,c.nome cliente
FROM produto p inner join item_venda iv inner join venda v inner join cliente c
on p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id
GROUP BY c.nome, p.nome;

select * from vendas_produtosPor_cliente where cliente='Tamar Valente';

