CREATE DATABASE universoLeitura;

USE universoLeitura;

CREATE TABLE associados(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
rg CHAR (7),
nome VARCHAR (50),
sobrenome VARCHAR(50),
endereco VARCHAR(150),
cidade VARCHAR(50),
estado VARCHAR(2)
);

CREATE TABLE autores (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
sobrenome VARCHAR(100),
nome VARCHAR (100)
);

CREATE TABLE editoras (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
razao_social VARCHAR (150),
telefone VARCHAR (100)
);

CREATE TABLE telefones(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
telefone_socio VARCHAR (100),
codAssoc INT,
FOREIGN KEY (codAssoc) REFERENCES associados (id)
);

CREATE TABLE emprestimos(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
codAssoc INT,
data_emprestimo DATE,
prazo_devolucao DATE,
data_devolucao DATE,
FOREIGN KEY (codAssoc) REFERENCES associados (id)
);

CREATE TABLE livros(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cod_ISBN VARCHAR(13),
titulo VARCHAR(200),
ano_criacao DATE,
cod_autor INT,
ano_publicacao DATE,
cod_editora INT,
FOREIGN KEY (cod_autor) REFERENCES autores (id),
FOREIGN KEY (cod_editora) REFERENCES editoras (id)
);

CREATE TABLE exemplares(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cod_livro INT,
sinistro BOOL,
FOREIGN KEY (cod_livro) REFERENCES livros (id)
);

CREATE TABLE emprestimos_exemplares(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cod_emprestimo INT,
cod_exemplar INT,
FOREIGN KEY (cod_emprestimo) REFERENCES emprestimos (id),
FOREIGN KEY (cod_exemplar) REFERENCES exemplares (id)
);