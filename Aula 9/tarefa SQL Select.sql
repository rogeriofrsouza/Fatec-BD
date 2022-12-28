-- #1 - Listar o nome do cliente, email e nome da cidade.
SELECT c.nome, c.email, t.nome AS cidade
FROM cliente c
INNER JOIN cidade t
ON c.idCidade = t.idCidade;

-- #2 - Listar o nome do cliente, email, nome da cidade e nome do estado apenas das cidades do estado de SP.
SELECT c.nome, c.email, t.nome AS cidade, e.nome AS estado
FROM cliente c
INNER JOIN cidade t
ON c.idCidade = t.idCidade
INNER JOIN estado e
ON c.idEstado = e.idEstado
WHERE e.nome = 'SP';

-- #3 - Listar o nome do cliente, email, nome da cidade e nome do estado apenas das cidades que tenham a letra "ó" no nome do cliente.
SELECT c.nome, c.email, t.nome AS cidade, e.nome AS estado
FROM cliente c
INNER JOIN cidade t
ON c.idCidade = t.idCidade
INNER JOIN estado e
ON c.idEstado = e.idEstado
WHERE c.nome LIKE '%o%';

-- #4 - Listar o nome do produto e nome da marca dos produtos que custem entre 1000 e 3000 reais.
SELECT p.nome, m.nome AS marca
FROM produto p
INNER JOIN marca m
ON p.idMarca = m.idMarca
WHERE p.preco BETWEEN 1000 AND 3000;

-- #5 - Listar o nome do produto, nome da marca e nome da categoria dos produtos que tenham a letra "e" no nome do produto.
SELECT p.nome, m.nome AS marca, c.nome AS categoria
FROM produto p
INNER JOIN marca m
ON p.idMarca = m.idMarca
INNER JOIN categoria c
ON p.idCategoria = c.idCategoria
WHERE p.nome LIKE '%e%';

-- #6 - Listar o número do pedido, a data do pedido e nome do cliente dos pedidos realizados no mês 08/2016.
SELECT p.idPedido, p.data_pedido, c.nome AS cliente
FROM pedido p
INNER JOIN cliente c
ON p.idCliente = c.idCliente
WHERE p.data_pedido BETWEEN '2016-08-01' AND '2016-08-31';

-- #7 - Listar o número do pedido, a data do pedido, nome do cliente e nome do vendedor dos pedidos realizados no mês 07/2016.
SELECT p.idPedido, p.data_pedido, c.nome AS cliente, v.nome AS vendedor
from pedido p
INNER JOIN cliente c
ON p.idCliente = c.idCliente
INNER JOIN vendedor v
ON p.idVendedor = v.idVendedor
WHERE p.data_pedido BETWEEN '2016-07-01' AND '2016-07-31';

-- #8 - Listar os nome e preço dos produtos comprados pelo cliente de id=1
SELECT p.nome, p.preco, c.nome AS cliente
FROM produto p
INNER JOIN itens_pedido i
ON i.idProduto = p.idProduto
INNER JOIN pedido s
ON s.idPedido = i.idPedido
INNER JOIN cliente c
ON c.idCliente = s.idCliente
WHERE c.idCliente = 1;
