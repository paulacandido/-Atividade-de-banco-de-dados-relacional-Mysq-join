-- EXERCICIO O5 -- 
-- Crie um banco de dados --
CREATE DATABASE db_construindo_a_nossa_vida;

-- Crie uma tabela de categorias  e determine 3 atributos -- 
CREATE TABLE db_construindo_a_nossa_vida.tb_categoria(
nome varchar(45) unique not null,
descricao text(1000),
primary key (nome)
);
-- Crie uma tabela de tb_produto e determine 5 atributos -- 
CREATE TABLE db_construindo_a_nossa_vida.tb_produto(
nome varchar(45) unique  not null,
preco double(5,2),
disponibilidade_estoque boolean,
FK_categoria varchar(45),
primary key (nome),
foreign key(FK_categoria) references tb_categoria(nome)
);

-- Popule esta tabela Categoria com até 5 dados. -- 
INSERT INTO db_construindo_a_nossa_vida.tb_categoria (nome) VALUES
("Carpintaria"),
("Hidraulico"),
("Eletrico"),
("Portas/Janelas"),
("Fundação");

-- Popule esta tabela Produto com até 8 dados. -- 
INSERT INTO db_construindo_a_nossa_vida.tb_produto VALUES 
("Treliça",5.75,true,"Carpintaria"),("Rodapé",75.00,true,"Carpintaria"),
("Tomada",2.5,true,"Eletrico"),("Fio para cabeamento",19.99,true,"Eletrico"),
("Porta corrediçã",930.75,false,"Portas/Janelas"),("Janela Fluz",175.00,true,"Portas/Janelas"),
("Cimento",5.75,true,"Fundação"),("Gesso",4.75,true,"Fundação");

-- Faça um select que retorne os Produtos com o valor maior do que 50 reais. -- 
SELECT * FROM db_construindo_a_nossa_vida.tb_produto WHERE preco >50;

-- Faça um select trazendo os Produtos com valor entre 3 e 60 reais. -- 
SELECT * FROM db_construindo_a_nossa_vida.tb_produto WHERE preco >3 and preco < 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra B. -- 
SELECT * FROM db_construindo_a_nossa_vida.tb_produto WHERE nome  LIKE "%C%";

-- Faça um um select com Inner join entre tabela categoria e pizza. -- 
SELECT * FROM db_construindo_a_nossa_vida.tb_categoria
INNER JOIN db_construindo_a_nossa_vida.tb_produto
ON tb_categoria.nome = tb_produto.FK_categoria;

-- Faça um um select com Inner join entre tabela categoria e produto. -- 
SELECT * FROM db_construindo_a_nossa_vida.tb_categoria
INNER JOIN  db_construindo_a_nossa_vida.tb_produto
ON tb_categoria.nome = tb_produto.FK_categoria WHERE tb_categoria.nome = "Hidraulico";