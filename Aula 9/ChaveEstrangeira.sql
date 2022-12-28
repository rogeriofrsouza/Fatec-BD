CREATE DATABASE teste_alter;

CREATE TABLE pessoa (
  id int PRIMARY KEY AUTO_INCREMENT,
  nome varchar(50),
  email varchar(50)
);

CREATE TABLE carro (
  id integer PRIMARY KEY AUTO_INCREMENT,
  modelo varchar(50)
);

---------------------------------------------------------------------
-- Nesse esquema, carro deverá possuir FK de pessoa. Como prosseguir?
---------------------------------------------------------------------

-- #1
ALTER TABLE carro ADD id_pessoa int;

-- #2
ALTER TABLE carro ADD CONSTRAINT fk_pessoacarro FOREIGN KEY (id_pessoa) REFERENCES pessoa (id);
