CREATE DATABASE loja;

CREATE TABLE endereco (
	id int AUTO_INCREMENT PRIMARY KEY,
	cep int(8),
	logradouro varchar(60),
	numero int(5)
);

CREATE TABLE cliente ( 
	id int PRIMARY KEY AUTO_INCREMENT, 
	nome varchar(50) not null, 
	email varchar(50), 
	data_nasc date, 
	id_endereco int, 
	FOREIGN KEY (id_endereco) REFERENCES endereco (id)
);

CREATE TABLE setor ( 
	id int PRIMARY KEY, 
	nome varchar(50) not null, 
	nr_funcionarios int(5) 
);

CREATE TABLE vendedor ( 
	id int PRIMARY KEY AUTO_INCREMENT, 
	ramal int(3), 
	data_nasc date,
  nome varchar(50) not null,  
	id_setor int, 
	FOREIGN KEY (id_setor) REFERENCES setor (id) 
);

CREATE TABLE venda ( 
	id int AUTO_INCREMENT PRIMARY KEY, 
	total_itens int, 
	valor_total float(10,2), 
	data_venda datetime, 
	id_cliente int, 
	FOREIGN KEY (id_cliente) REFERENCES cliente (id), 
	id_vendedor int, 
	FOREIGN KEY (id_vendedor) REFERENCES vendedor (id) 
);

ALTER TABLE produto ADD (
  estoque int,
  preco float(10,2)
);

CREATE TABLE carrinho ( 
	itens_vendidos int, 
	valor_vendido float(10,2), 
	id_venda int, 
	FOREIGN KEY (id_venda) REFERENCES venda (id), 
	id_produto int, 
	FOREIGN KEY (id_produto) REFERENCES produto (id) 
);

--------------------------------------------------------
-- DDL: Data Definition Language (CREATE, DROP E ALTER)

-- CREATE DATABASE loja;
-- CREATE TABLE cliente;

-- DROP DATABASE loja;
-- DROP TABLE cliente;

-- ALTER TABLE ADD/ MODIFY/ DROP COLUMN
