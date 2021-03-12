-- EXERCICIO O3 -- 
-- Crie um banco de dados --
CREATE DATABASE db_farmacia_do_bem;

-- Crie uma tabela de categorias  e determine 3 atributos -- 
CREATE TABLE db_farmacia_do_bem.tb_categoria(
nome varchar(45) unique not null,
receita_medica boolean,
primary key (nome)
);
-- Crie uma tabela de tb_produto e determine 5 atributos -- 
CREATE TABLE db_farmacia_do_bem.tb_produto(
nome varchar(45) unique  not null,
preco double(5,2),
FK_categoria varchar(45),
primary key (nome),
foreign key(FK_categoria) references tb_categoria(nome)
);

-- Popule esta tabela Categoria com até 5 dados. -- 
INSERT INTO db_farmacia_do_bem.tb_categoria VALUES
("Comestisco",false),
("Tarja Preta",true),
("Tarja Vermelha",true),
("Genericos",true),
("Tarja Branca",false);

-- Popule esta tabela Produto com até 8 dados. -- 
INSERT INTO db_farmacia_do_bem.tb_produto VALUES 
("AntiGripal",28.75,"Tarja Branca"),("Xarope",55.00,"Tarja Branca"),
("Protetor Solar",31.75,"Comestisco"),("QualquerUm",35.75,"Tarja Vermelha"),
("Protetor Solar Vegano",15.75,"Comestisco"),("QualquerUm Generico",15.75,"Tarja Vermelha"),
("Shampoo",9.75,"Comestisco"),("QualquerDois",235.75,"Tarja Preta");

-- Faça um select que retorne os Produtos com o valor maior do que 50 reais. -- 
SELECT * FROM db_farmacia_do_bem.tb_produto WHERE preco >50;

-- Faça um select trazendo os Produtos com valor entre 3 e 60 reais. -- 
SELECT * FROM db_farmacia_do_bem.tb_produto WHERE preco >3 and preco < 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra B. -- 
SELECT * FROM db_farmacia_do_bem.tb_produto WHERE nome  LIKE "%B%";

-- Faça um um select com Inner join entre tabela categoria e pizza. -- 
SELECT * FROM db_farmacia_do_bem.tb_categoria
INNER JOIN db_farmacia_do_bem.tb_produto
ON tb_categoria.nome = tb_produto.FK_categoria;

-- Faça um um select com Inner join entre tabela categoria e produto. -- 
SELECT * FROM db_farmacia_do_bem.tb_categoria
INNER JOIN  db_farmacia_do_bem.tb_produto
ON tb_categoria.nome = tb_produto.FK_categoria WHERE tb_categoria.nome = "Tarja Preta";