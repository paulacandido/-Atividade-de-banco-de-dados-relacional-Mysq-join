-- EXERCICIO O2 -- 
-- Crie um banco de dados --
CREATE DATABASE db_pizzaria_legal;

-- Crie uma tabela tb_classe utilizando e determine 3 atributos -- 
CREATE TABLE db_pizzaria_legal.tb_categoria(
nome varchar(45) unique not null,
refrigratis boolean,
elegivelpromocao boolean, 
primary key (nome)
);
-- Crie uma tabela tb_personagem e determine 5 atributos -- 
CREATE TABLE db_pizzaria_legal.tb_pizza(
id int auto_increment,
nome varchar(45)  not null,
preco numeric(4,2),
ingredientes varchar(120),
FK_categoria varchar(45),
primary key (id),
foreign key(FK_categoria) references tb_categoria(nome)
);

-- Popule esta tabela Categoria com até 5 dados. -- 
INSERT INTO db_pizzaria_legal.tb_categoria VALUES
("Doces",false,true),
("Salgadas",false,true),
("Broto",false,false),
("Especiais",true,false),
("Familia",true,true);

-- Popule esta tabela pizza com até 8 dados. -- 
INSERT INTO db_pizzaria_legal.tb_pizza(nome,preco,ingredientes,FK_categoria) VALUES 
("Calabresa",28.75,"Molho, calabresa e queijo","Salgadas"),("4QUEIJOS",55.00,"Catupiry,Mussarela,Parmessão,Gongonzola","Salgadas"),
("Brigadeiro",31.75,"Morango ou Banana com brigaderiro","Doces"),("Oreo",35.75,"Leite Condensado com oreo","Broto"),
("Atum",78.90,"Queijo,cebola e atum","Familia"),("Romeu e Julieta",49.90,"Queijo com goiabada","Doces"),
("Nuninho",29.90,"Nutella com ninho","Broto"),("3 Sabores/9 Pedaços",89.90,"4 Queijos, Calabresa, Portuguesa, Frango","Especiais");

-- Faça um select que retorne os Produtos com o valor maior do que 45 reais. -- 
SELECT * FROM db_pizzaria_legal.tb_pizza WHERE preco >50;

-- Faça um select trazendo os Produtos com valor entre 29 e 60 reais. -- 
SELECT * FROM db_pizzaria_legal.tb_pizza WHERE preco >29 and preco < 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra C. -- 
SELECT * FROM db_pizzaria_legal.tb_pizza WHERE nome  LIKE "%C%";

-- Faça um um select com Inner join entre tabela categoria e pizza. -- 
SELECT * FROM db_pizzaria_legal.tb_categoria
INNER JOIN db_pizzaria_legal.tb_pizza
ON tb_categoria.nome = tb_pizza.FK_categoria;

-- Faça um select onde traga todos os Produtos de uma categoria específica.  -- 
SELECT * FROM db_pizzaria_legal.tb_categoria
INNER JOIN db_pizzaria_legal.tb_pizza
ON tb_categoria.nome = tb_pizza.FK_categoria WHERE tb_categoria.nome = "Doces";