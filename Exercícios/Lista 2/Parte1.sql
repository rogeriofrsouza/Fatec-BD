-- Parte 2.1 - Criando e manipulando o banco de dados

/* 1. Criar as tabelas do modelo acima nomeando as constraints */
CREATE TABLE cliente (
  cod_cliente NUMBER(5),
  nome_cliente VARCHAR2(30),
  endereco VARCHAR2(25),
  cidade VARCHAR2(20),
  cep VARCHAR2(10),
  uf VARCHAR2(2)
);

CREATE TABLE vendedor (
  cod_vendedor NUMBER(5),
  nome_vendedor VARCHAR2(30),
  faixa_comissao NUMBER(2,2),
  salario_fixo NUMBER(5,2)
);

CREATE TABLE produto (
  cod_produto NUMBER(3),
  descricao VARCHAR2(20),
  unidade VARCHAR2(2),
  valor_unitario NUMBER(6,2)
);

CREATE TABLE pedido (
  num_pedido NUMBER(5),
  prazo_entrega DATE,
  cod_cliente NUMBER(5),
  cod_vendedor NUMBER(5)
);

CREATE TABLE item_pedido (
  num_pedido NUMBER(5),
  cod_produto NUMBER(5),
  quantidade NUMBER(5)
);

----------------------------------------------------
ALTER TABLE cliente
ADD CONSTRAINT pk_cliente_codcliente PRIMARY KEY (cod_cliente);

ALTER TABLE vendedor
ADD CONSTRAINT pk_vendedor_codvendedor PRIMARY KEY (cod_vendedor);

ALTER TABLE produto
ADD CONSTRAINT pk_produto_codproduto PRIMARY KEY (cod_produto);

ALTER TABLE pedido
ADD CONSTRAINT pk_pedido_numpedido PRIMARY KEY (num_pedido);

ALTER TABLE item_pedido
ADD CONSTRAINT pk_itempedido PRIMARY KEY (num_pedido, cod_produto);

----------------------------------------------------
ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_codcliente 
FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente);

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_codvendedor 
FOREIGN KEY (cod_vendedor) REFERENCES vendedor(cod_vendedor);

ALTER TABLE item_pedido
ADD CONSTRAINT fk_itempedido_numpedido 
FOREIGN KEY (num_pedido) REFERENCES pedido(num_pedido);

ALTER TABLE item_pedido
ADD CONSTRAINT fk_itempedido_cod_produto 
FOREIGN KEY (cod_produto) REFERENCES produto(cod_produto);

----------------------------------------------------
/* 2. Inserir pelo menos 5 linhas de dados para cada tabela */
INSERT INTO cliente VALUES (30, 'João da Silva', 'Av Matt Hoffman, 1100', 'São Paulo', '97056-001', 'SP');
INSERT INTO cliente VALUES (31, 'Lucas Antunes', 'Rua Trodani, 120', 'Sorocaba', '19658-023', 'SP');
INSERT INTO cliente VALUES (32, 'Laura Strauss', 'Rua Tulipas, 650', 'Primavera', '18556-025', 'SP');
INSERT INTO cliente VALUES (33, 'Maria Joana', 'Rua Marques, 80', 'Itu', '18136-122', 'SP');
INSERT INTO cliente VALUES (34, 'Fabrício dos Santos', 'Av Mangueiras, 326', 'Osasco', '18728-060', 'SP');

INSERT INTO vendedor VALUES (5, 'Antonio Pedro', 5.0, 400);
INSERT INTO vendedor VALUES (15, 'Carlos Sola', 0.0, 400);
INSERT INTO vendedor VALUES (25, 'Ana Carolina', 1.0, 200);
INSERT INTO vendedor VALUES (35, 'Solange Almeida', 1.0, 300);
INSERT INTO vendedor VALUES (45, 'Marcos João', 3.0, 300);

INSERT INTO produto VALUES (11, 'Apple Watch', 'UN', 975.99);
INSERT INTO produto VALUES (12, 'IPAD', 'UN', 999.70);
INSERT INTO produto VALUES (13, 'PÓ PARA TONER', 'KG', 85.60);
INSERT INTO produto VALUES (14, 'Mouse', 'UN', 45.60);
INSERT INTO produto VALUES (15, 'Caneta digital', 'UN', 100.00);
INSERT INTO produto VALUES (40, 'Mouse sem fio', 'UN', 68.90);
INSERT INTO produto VALUES (42, 'FIO HDMI', 'UN', 18.00);
INSERT INTO produto VALUES (43, 'Pendrive Star Wars', 'UN', 48.00);
INSERT INTO produto VALUES (44, 'Mouse com fio', 'UN', 28.00);
INSERT INTO produto VALUES (45, 'Pendrive do Mickey', 'UN', 50.00);

INSERT INTO pedido VALUES (7, '26/02/2020', 31, 15);
INSERT INTO pedido VALUES (8, '23/05/2020', 32, 25);
INSERT INTO pedido VALUES (9, '21/02/2020', 32, 5);
INSERT INTO pedido VALUES (10, '20/02/2020', 30, 5);
INSERT INTO pedido VALUES (11, '07/03/2021', 31, 5);

INSERT INTO item_pedido VALUES (7, 11, 1);
INSERT INTO item_pedido VALUES (7, 40, 2);
INSERT INTO item_pedido VALUES (7, 42, 1);
INSERT INTO item_pedido VALUES (8, 43, 5);
INSERT INTO item_pedido VALUES (9, 12, 1);
INSERT INTO item_pedido VALUES (10, 11, 1);
INSERT INTO item_pedido VALUES (10, 43, 1);
INSERT INTO item_pedido VALUES (10, 13, 2);
INSERT INTO item_pedido VALUES (8, 40, 1);

----------------------------------------------------
/* 3. Alterar o campo endereco da tabela cliente para 30 posições */
ALTER TABLE cliente
MODIFY endereco VARCHAR2(30);

/* 4. Acrescentar um novo campo de nome preco_unitario numérico com 4 inteiros e duas decimais em item_pedido */
ALTER TABLE item_pedido
ADD preco_unitario NUMBER(4,2);

/* 5. Alterar o cep de todos os clientes da cidade de Sorocaba para '18035-400' */
UPDATE cliente
SET cep = '18035-400'
WHERE cidade = 'Sorocaba';

/* 6. Alterar o prazo de entrega de todos os pedidos do cliente de codigo 20 para mais 10 dias */
UPDATE pedido
SET prazo_entrega = prazo_entrega + 10
WHERE cod_cliente = 20;

/* 7. Alterar o valor_unitario para mais 10% para todos os produtos com unidade = 'KG' */
UPDATE produto
SET valor_unitario = valor_unitario * 1.1
WHERE unidade = 'KG';

/* 8. Excluir todos os produtos com unidade = 'CX' e valor_unitario superior a 50.00 */
DELETE FROM produto
WHERE unidade = 'CX'
AND valor_unitario > 50.00;
