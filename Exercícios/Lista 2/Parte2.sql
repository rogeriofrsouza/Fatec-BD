-- Parte 2.2 - Realizando consultas

/* 1. Listar número do pedido e prazo de entrega de todos os pedidos */
SELECT num_pedido, prazo_entrega
FROM pedido;

/* 2. Listar a descrição e o valor unitário dos produtos */
SELECT descricao, valor_unitario
FROM produto;

/* 3. Listar nome e endereço de todos os clientes */
SELECT nome_cliente, endereco
FROM cliente;

/* 4. Listar nome de todos os vendedores */
SELECT nome_vendedor FROM vendedor;

/* 5. Listar todas as informações da tabela de clientes */
SELECT * FROM cliente;

/* 6. Listar todas as informações da tabela produtos */
SELECT * FROM produto;

/* 7. Listar o nome de todos os vendedores. Alterar o cabeçalho para nome */
SELECT nome_vendedor "Nome" FROM vendedor;

/* 8. Listar o preço dos produtos simulando um aumento em 10% */
SELECT valor_unitario * 1.1
FROM produto;

/* 9. Listar o salário fixo dos vendedores simulando um aumento em 5% */
SELECT salario_fixo * 1.05
FROM vendedor;

/* 10. Listar o nome dos clientes que moram em Sorocaba */
SELECT nome_cliente FROM cliente
WHERE cidade = 'Sorocaba';

/* 11. Listar todos os dados dos vendedores com salário fixo menor que R$400,00 */
SELECT * FROM vendedor
WHERE salario_fixo < 400.00;

/* 12. Listar o código e a descrição dos produtos cuja unidade é igual a 'KG' */
SELECT cod_produto, descricao
FROM produto
WHERE unidade = 'KG';

/* 13. Listar o número dos pedidos com prazo de entrega entre 01/05/2022 a 01/06/2012 */
SELECT num_pedido FROM pedido
WHERE prazo_entrega BETWEEN '01/05/2022' AND '01/06/2022';

/* 14. Listar o pedido e o prazo de entrega dos pedidos com data de entrega no ano de 2004 */
SELECT num_pedido, prazo_entrega
FROM pedido
WHERE EXTRACT(YEAR FROM prazo_entrega) = 2004;

/* 15. Listar os dados dos produtos cujo valor unitário seja maior que R$100,00 e menor que R$200,00 */
SELECT * FROM produto
WHERE valor_unitario BETWEEN 100.00 AND 200.00;

/* 16. Listar o número do pedido e o código do produto cuja quantidade esteja entre 1000 e 1500 */
SELECT num_pedido, cod_produto
FROM item_pedido
WHERE quantidade BETWEEN 1000 AND 1500;

/* 17. Listar o nome dos vendedores cujo nome comece por 'José' */
SELECT nome_vendedor FROM vendedor
WHERE nome_vendedor LIKE 'José%';

/* 18. Listar o nome de todos os clientes cujo último nome seja 'Silva' */
SELECT nome_cliente FROM cliente
WHERE nome_cliente LIKE '%Silva';

/* 19. Listar a descrição e o código dos produtos com a sequência 'AC' em qualquer parte da descrição */
SELECT descricao, cod_produto
FROM produto
WHERE descricao LIKE '%AC%';

/* 20. Listar os nomes dos clientes que não tenham endereço cadastrado */
SELECT nome_cliente FROM cliente
WHERE endereco IS NULL;

/* 21. Listar as cidades onde moram os clientes (exibir cada cidade apenas uma vez) */
SELECT DISTINCT cidade FROM cliente;

/* 22. Listar os dados dos clientes por ordem alfabética de nome */
SELECT * FROM cliente
ORDER BY nome_cliente;

/* 23. Listar os dados dos clientes por ordem alfabética decrescente de cidade */
SELECT * FROM cliente
ORDER BY cidade DESC;

/* 24. Listar os dados dos clientes por ordem de cidade e por ordem do nome */
SELECT * FROM cliente
ORDER BY cidade, nome_cliente;

/* 25. Listar os códigos e a descrição dos produtos cuja unidade é igual a 'Kg', por ordem alfabética de descrição */
SELECT cod_produto, descricao
FROM produto
WHERE unidade = 'KG'
ORDER BY descricao;
