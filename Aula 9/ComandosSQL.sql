SELECT COUNT(p.nome) as total 
FROM produto p, categoria c
WHERE p.id_categoria = c.id
AND c.descricao = '';

SELECT * FROM produto ORDER BY id DESC LIMIT 1;

SELECT p.*, c.* 
FROM produto p, categoria c
WHERE c.id = p.id_categoria;

SELECT p.*, c.descricao FROM produto p 
INNER JOIN categoria c
ON c.id = p.id_categoria;


-- Se vc rodar o INNER JOIN, ele buscará pelos clientes que fizeram pedido 
SELECT pedido.idPedido, cliente.nome
FROM cliente
INNER JOIN pedido
ON pedido.idCliente = cliente.idCliente;

-- Se vc rodar o LEFT JOIN, ele buscará os clientes que fizeram pedido e os que não fizeram. Por que LEFT? 
-- Cliente é a table indicada em from, ou seja, está a esquerda do esquema, ela pega informações de cliente amarradas com pedido ou não
SELECT pedido.idPedido, cliente.nome 
FROM cliente
LEFT JOIN pedido
ON pedido.idCliente = cliente.idCliente;


-------------------------------------------------------------------------------------------------
-- Outra coisa, vamos supor que vc tenha que trabalhar com 3 tables usando INNER JOIN fica assim:

SELECT a.nome, b.descricao 
FROM a
INNER join b
ON a.id_fk = b.id
INNER JOIN c
ON a.id_fk = c.id;
