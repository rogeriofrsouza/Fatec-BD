-- Parte 2.3 - Consultas usando funções

/* 1. Listar a maior quantidade que conste na tabela de item do pedido */
SELECT MAX(quantidade) FROM item_pedido;

/* 2. Listar o menor valor unitário da tabela de produtos */
SELECT MIN(valor_unitario) FROM produto;

/* 3. Listar a somatória dos salários fixos pagos aos vendedores */
SELECT SUM(salario_fixo) FROM vendedor;

/* 4. Listar o número de produtos cuja unidade seja igual a 'Lt' */
SELECT COUNT(*) FROM produto
WHERE unidade = 'Lt';

/* 5. Listar o número de clientes agrupados por cidade */
SELECT COUNT(*), cidade
FROM cliente
GROUP BY cidade;

/* 6. Listar quantos pedidos cada vendedor realizou */
SELECT COUNT(*), cod_vendedor
FROM pedido
GROUP BY cod_vendedor;

/* 7. Listar o maior e o menor valor unitário para cada tipo de unidade de produto */
SELECT MIN(valor_unitario), MAX(valor_unitario), unidade
FROM produto
GROUP BY unidade;

/* 8. Listar o número de clientes, agrupados por cidade, para todas as cidades que aparecem mais de 4 vezes */
SELECT COUNT(*), cidade
FROM cliente
GROUP BY cidade
HAVING COUNT(*) > 4;
