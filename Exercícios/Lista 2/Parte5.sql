-- Parte 2.5 - Visões

/* 1. Escreva uma visão que exiba o número do pedido, codcliente e prazo de entrega */
CREATE OR REPLACE VIEW view_1 AS
  SELECT num_pedido, cod_cliente, prazo_entrega
  FROM pedido;

SELECT * FROM view_1;

/* 2. Escreva uma visão que liste todos os produtos com unidade = 'KG' */
CREATE OR REPLACE VIEW view_2 AS
  SELECT * FROM produto
  WHERE unidade = 'KG';

SELECT * FROM view_2;

/* 3. Escreva uma visão que liste todos os produtos com valor unitário menor que a média */
CREATE OR REPLACE VIEW view_3 AS
  SELECT * FROM produto
  WHERE valor_unitario < (SELECT AVG(valor_unitario) FROM produto);

SELECT * FROM view_3;

/* 4. Escreva uma visão que liste o número total de pedidos feitos por vendedor. Deve conter o código do vendedor, nome e número total de pedidos */
CREATE OR REPLACE VIEW view_4 AS
  SELECT p.cod_vendedor, v.nome_vendedor, COUNT(*) "Total de pedidos"
  FROM pedido p, vendedor v
  WHERE p.cod_vendedor = v.cod_vendedor
  GROUP BY p.cod_vendedor, v.nome_vendedor;

SELECT * FROM view_4;
