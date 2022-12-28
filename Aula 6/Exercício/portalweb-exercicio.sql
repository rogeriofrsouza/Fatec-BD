CREATE DATABASE portalweb;

CREATE TABLE usuario (
  id int PRIMARY KEY AUTO_INCREMENT,
  nome varchar(50) not null,
  email varchar(25),
  senha varchar(25)
);

CREATE TABLE imagem (
  id int PRIMARY KEY AUTO_INCREMENT,
  descricao varchar(50),
  endereco varchar(50)
);

CREATE TABLE noticia (
  id int PRIMARY KEY AUTO_INCREMENT,
  titulo varchar(50),
  texto text,
  data_publicacao datetime,
  id_usuario int,
  FOREIGN KEY (id_usuario) REFERENCES usuario (id)
);

CREATE TABLE cadastro (
  id_noticia int,
  FOREIGN KEY (id_noticia) REFERENCES noticia (id),
  id_usuario int,
  FOREIGN KEY (id_usuario) REFERENCES usuario (id)
);
