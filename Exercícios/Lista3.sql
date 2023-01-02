-- Lista número 3

/* 1. Criar uma sequência automática para o número do pedido da tabela pedido. Incluir duas tuplas usando este recursto */
CREATE SEQUENCE num_pedido_seq
  INCREMENT BY 1
  START WITH 1;

INSERT INTO pedido VALUES (num_pedido_seq.nextval, TO_DATE('23/05/2022', 'dd/mm/yyyy'), 34, 5);
INSERT INTO pedido VALUES (num_pedido_seq.nextval, TO_DATE('01/02/2023', 'dd/mm/yyyy'), 30, 15);

/* 2. Criar uma tabela de nome itens_bkp a partir da tabela de itens. Esta nova tabela deverá conter os campos: num_pedido, cod_produto para os pedidos do ano de 2017 */
CREATE TABLE itens_bkp AS
  SELECT p.num_pedido, ip.cod_produto
  FROM item_pedido ip, pedido p
  WHERE p.num_pedido = ip.num_pedido
  AND EXTRACT(YEAR FROM p.prazo_entrega) = 2017;

/* 3. Listar o nome de todas as tabelas de seu banco de dados e o nome dos campos que são chave estrangeira nestas tabelas */
SELECT table_name, column_name
FROM user_cons_columns
WHERE constraint_name LIKE 'FK%';

/* 4. Listar todas as constraints da tabela pedido */
SELECT * FROM user_cons_columns
WHERE table_name = 'PEDIDO';

/* 5. Listar o nome de todas as visões que você criou em seu banco de dados e o seu respectivo texto */
SELECT view_name, text 
FROM user_views;

/* 6. Listar todas as cláusulas CHECK e o nome da tabela a qual pertence */
SELECT constraint_name, search_condition, table_name
FROM user_constraints
WHERE constraint_type = 'C';

/* 7. Crie uma visão que exiba o nome da tabela, nome da coluna, tipo e a constraint (P, R, C) caso exista */
CREATE OR REPLACE VIEW tabelas_constraints AS
  SELECT ucc.table_name, ucc.column_name, uc.constraint_type 
  FROM user_cons_columns ucc
  INNER JOIN user_constraints uc
  ON ucc.constraint_name = uc.constraint_name
  ORDER BY ucc.table_name, ucc.column_name;
