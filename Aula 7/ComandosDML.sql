-- Data Manipulation Language: comandos que alteram informações nas tabelas, seja para inserir, atualizar ou excluir dados (ex: insert, update e delete)

CREATE TABLE produto (
  id int AUTO_INCREMENT PRIMARY KEY,
  nome varchar(50),
  preco float(10,2),
  estoque int,
  data_fab date,
  id_categoria int,
  FOREIGN KEY (id_categoria) REFERENCES categoria (id)
);

-- 1) INSERT

-- Uma linha
INSERT INTO categoria (id, descricao) VALUES (NULL, 'bvcb');
INSERT INTO categoria VALUES (NULL, 'bvcb');

-- Mais de uma linha
INSERT INTO categoria (id, descricao) VALUES (NULL, 'bvcb'), (NULL, 'bcvb');
INSERT INTO categoria VALUES (NULL, 'abc'), (NULL, 'def');

-- Invertendo a ordem
INSERT INTO categoria (descricao, id) VALUES ('teste', null);

INSERT INTO produto VALUES 
(null, 'Pneu Aro 13', 100.50, 100, '2022-10-31', 11),
(null, 'Pneu Aro 14', 100.50, 100, '2022-10-31', 11),
(null, 'Pneu Aro 15', 140.50, 100, '2022-01-31', 11),
(null, 'Pneu Aro 16', 160.50, 100, '2022-04-20', 12),
(null, 'Pneu Aro 17', 180.50, 100, '2022-12-31', 12),
(null, 'Roda Aro 14', 130.50, 100, '2022-02-28', 13),
(null, 'Roda Aro 15', 300.50, 100, '2022-10-31', 13),
(null, 'Roda Aro 16', 600.50, 100, '2022-05-31', 13),
(null, 'Roda Aro 17', 700.50, 100, '2022-10-01', 14);


-- 2) DELETE

-- Limpar table
DELETE FROM categoria...

-- Apagar 1 registro
DELETE FROM produto WHERE id = 7;

-- Vários produtos por categoria
DELETE FROM produto WHERE id_categoria = 13;

DELETE FROM produto WHERE id = 1 AND id_categoria = 1; 
DELETE FROM produto WHERE id = 1 OR id_categoria = 1; 
-----------------------------------------------------


-- 3) UPDATE
UPDATE categoria SET descricao = 'teste ABC' WHERE id = 1;

UPDATE produto SET data_fab = '2022-05-05' WHERE id_categoria = 13;

UPDATE produto SET estoque = 200 WHERE preco > 200;

UPDATE produto SET nome = 'novo nome', preco = 350.75, estoque = 450, data_fab = '2022-09-24' WHERE id = 1;

UPDATE produto SET nome = 'teste ABC' WHERE preco < 200 AND data_fab = '2022-05-05' AND estoque <= 100;

UPDATE produto SET nome = 'teste ABC' WHERE preco < 200 OR data_fab = '2022-05-05' AND estoque <= 100;

UPDATE produto SET nome = 'teste ABC' WHERE preco < 200 OR data_fab = '2022-05-05' OR estoque <= 100;
