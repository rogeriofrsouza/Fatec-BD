-- Selecionando todos os registros
SELECT * FROM categoria;

-- Selecionando uma coluna
SELECT descricao FROM categoria;

-- Utilizando um alias
SELECT c.descricao FROM categoria c;

-- Utilizando um alias e cláusula WHERE
SELECT c.* FROM categoria c WHERE c.id = 10;

-- Cláusula WHERE e LIKE
SELECT * FROM categoria WHERE descricao LIKE 'p%';
SELECT * FROM categoria WHERE descricao LIKE '%a';
SELECT * FROM categoria WHERE descricao LIKE '%a%';
SELECT * FROM categoria WHERE descricao LIKE '%a%' AND id = 10;
SELECT c.* FROM categoria c WHERE c.descricao LIKE '%a%' AND c.id = 10;

-- Cláusula ORDER BY, ASC, DESC
SELECT * FROM categoria ORDER BY descricao;
SELECT * FROM categoria ORDER BY descricao ASC;
SELECT * FROM categoria ORDER BY descricao DESC;

SELECT descricao FROM categoria 
WHERE id > 12 
ORDER BY descricao DESC;

SELECT * FROM produto;

-- Amarrando tabelas
SELECT p.nome, c.descricao 
FROM produto p, categoria c 
WHERE p.id_categoria = c.id;

SELECT p.nome, c.descricao, p.preco 
FROM produto p, categoria c 
WHERE p.data_fab BETWEEN '2022-01-01' AND '2022-04-20' 
AND p.id_categoria = c.id;

-- AVG
SELECT AVG(preco) as 'Média dos valores' FROM produto;
