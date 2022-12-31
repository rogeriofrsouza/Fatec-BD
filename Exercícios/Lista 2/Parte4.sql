-- Parte 2.4 - Consultas avançadas

/* 1. Listar o código e o nome dos vendedores que efetuaram vendas para o cliente com código 10 */
SELECT DISTINCT p.cod_vendedor, v.nome_vendedor
FROM pedido p, vendedor v
WHERE p.cod_vendedor = v.cod_vendedor
AND p.cod_cliente = 10;

/* 2. Listar o número do pedido, prazo de entrega, quantidade e a descrição do produto com código 100 */
SELECT ped.num_pedido, ped.prazo_entrega, ip.quantidade, prod.descricao
FROM pedido ped
INNER JOIN item_pedido ip
ON ped.num_pedido = ip.num_pedido
INNER JOIN produto prod
ON ip.cod_produto = prod.cod_produto
WHERE ip.cod_produto = 100;

/* 3. Quais os vendedores (código e nome) fizeram pedidos para o cliente 'José da Silva' */
SELECT DISTINCT p.cod_vendedor, v.nome_vendedor
FROM pedido p
INNER JOIN vendedor v
ON p.cod_vendedor = v.cod_vendedor
INNER JOIN cliente c
ON p.cod_cliente = c.cod_cliente
WHERE c.nome_cliente = 'José da Silva';

/* 4. Listar o número do pedido, código do produto, descrição, código do vendedor, nome do vendedor e nome do cliente, para os clientes que moram em Sorocaba */
SELECT ip.num_pedido, ip.cod_produto, prod.descricao, ped.cod_vendedor, vend.nome_vendedor, cli.nome_cliente
FROM item_pedido ip
INNER JOIN produto prod
ON ip.cod_produto = prod.cod_produto
INNER JOIN pedido ped
ON ip.num_pedido = ped.num_pedido
INNER JOIN vendedor vend
ON ped.cod_vendedor = vend.cod_vendedor
INNER JOIN cliente cli
ON ped.cod_cliente = cli.cod_cliente
WHERE cli.cidade = 'Sorocaba';

/* 5. Listar o código do produto, descrição, quantidade e prazo de entrega para o pedido número 123 */
SELECT ip.cod_produto, prod.descricao, ip.quantidade, ped.prazo_entrega
FROM item_pedido ip
INNER JOIN produto prod
ON ip.cod_produto = prod.cod_produto
INNER JOIN pedido ped
ON ip.num_pedido = ped.num_pedido
WHERE ped.num_pedido = 123;

/* 6. Quais os clientes (nome e endereço) da cidade de Itu ou Sorocaba tiveram seus pedidos tirados com o vendedor de código 10 */
SELECT c.nome_cliente, c.endereco, p.num_pedido
FROM cliente c
INNER JOIN pedido p
ON c.cod_cliente = p.cod_cliente
WHERE p.cod_vendedor = 10
AND (c.cidade = 'Itu' OR c.cidade = 'Sorocaba');
