-- Atividade - Teams

-- #1
CREATE DATABASE empresa;

-- #2
CREATE TABLE produtos(
  id int PRIMARY KEY AUTO_INCREMENT,
  produto varchar(60),
  estoque int,
  valor float(8,2),
  tipo varchar(60),
  unidade varchar(10),
  marca varchar(25),
  data_fabricacao date
);

-- #3
INSERT INTO produtos VALUES (null, 'Arroz Integral',100,15.00,'Alimentos','KG','Tio João','2016-01-20');
INSERT INTO produtos VALUES (null, 'Blu-Ray Player',25,550.00,'Eletrônico','Peça','Sony','2015-10-25');
INSERT INTO produtos VALUES (null, 'Notebook i7',10,2850.00,'Eletrônico','Peça','Samsung','2015-05-30');
INSERT INTO produtos VALUES (null, 'Iphone 5',30,2500.00,'Eletrônico','Peça','Apple','2016-02-10');
INSERT INTO produtos VALUES (null, 'Sabão em Pó',2000,8.00,'Produtos de Limpeza','Kilo','Omo','2015-04-15');
INSERT INTO produtos VALUES (null, 'Detergente',800,5.00,'Produtos de Limpeza','Litro','Limpol','2013-03-30');
INSERT INTO produtos VALUES (null, 'Palha de Aço',3000,4.00,'Produtos de Limpeza','Grama','Bombril','2016-02-15');
INSERT INTO produtos VALUES (null, 'Arroz',12,15.00,'Alimentos','Kilo','Panela de Ferro','2014-04-25');
INSERT INTO produtos VALUES (null, 'Feijão',30,18.00,'Alimentos','Kilo','Caldão','2014-05-02');
INSERT INTO produtos VALUES (null, 'Shampoo Anti Caspa',600,12.00,'Cosmeticos','Litro','Palmolive','2014-05-12');
INSERT INTO produtos VALUES (null, 'Escova de Dentes',1500,15.00,'Cosmeticos','Peça','Oral-B','2015-12-29');
INSERT INTO produtos VALUES (null, 'Sabonete',3000,2.00,'Cosmeticos','Unidade','Rexona','2015-12-29');
INSERT INTO produtos VALUES (null, 'Geladeira',40,2200.00,'Eletrodomestico','Peça','Brastemp','2013-12-12');
INSERT INTO produtos VALUES (null, 'Fogão de Embutir 5 Bocas',15,1600.00,'Eletrodomestico','Peça','Venox','2013-12-12');
INSERT INTO produtos VALUES (null, 'Forno Microondas',65,450.00,'Eletrodomestico','Peça','Consul','2013-12-01');

-- #4
UPDATE produtos 
SET valor = 13.00, marca = 'Panela de Ferro', data_fabricacao = '2014-05-05', tipo = 'Pacote' 
WHERE produto = 'Arroz Integral';

-- #5
UPDATE produtos 
SET valor = 25.00, data_fabricacao = '2016-03-30' 
WHERE tipo = 'Cosmeticos';

-- #6
SELECT AVG(valor) AS Media_Eletro 
FROM produtos 
WHERE tipo = 'Eletrodomesticos';

-- #7
DELETE FROM produtos WHERE valor > 300.00 AND id > 8;

-- #8
SELECT produto, estoque, valor FROM produtos;

-- #9
SHOW tables;

-- #10
SELECT MAX(valor) AS Maior_Valor FROM produtos;

-- #11
SELECT * FROM produtos WHERE valor < 18.00 AND tipo = 'Alimentos';

-- #12
SELECT produto, valor FROM produtos ORDER BY produto DESC;

-- #13
TRUNCATE produtos;
