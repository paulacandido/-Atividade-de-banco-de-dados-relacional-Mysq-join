-- EXERCICIO O5 -- 
-- Crie um banco de dados --
CREATE DATABASE db_cursoDaMinhaVida;

-- Crie uma tabela de categorias  e determine 3 atributos -- 
CREATE TABLE db_cursoDaMinhaVida.tb_categoria(
nome varchar(45) unique not null,
area varchar(60),
primary key (nome)
);
-- Crie uma tabela de tb_produto e determine 5 atributos -- 
CREATE TABLE db_cursoDaMinhaVida.tb_cursos(
nome varchar(45)  not null,
preco double(5,2),
numerodealunos int,
descricao text(100),
FK_categoria varchar(45),
primary key (nome),
foreign key(FK_categoria) references tb_categoria(nome)
);

-- Popule esta tabela Categoria com até 5 dados. -- 
INSERT INTO db_cursoDaMinhaVida.tb_categoria  VALUES
("JAVA","TI"),
("Modelagem","Design"),
("Python","Programação"),
("C++","TI"),
("Inglês","Idiomas");

-- Popule esta tabela Produto com até 8 dados. -- 
INSERT INTO db_cursoDaMinhaVida.tb_cursos VALUES 
("POO",150.00,15,"Encapsulamento, Abstração,etc...", "JAVA"),("Estruturas de Dados",175.00,5,"Fila, pilha, etc","JAVA"),
("Estruturas de Dados II",145.00,9,"Fila, pilha, etc","Python"),("Inglês Instrumental",45.00,15,"Escrita e leitura", "Inglês"),
("Animação 3D",180.00,35,"Criação de personagens", "Modelagem"),("Logica de Programação em C#",35.00,27,"If,else,while,case","C++"),
("Introdução ao Maya/Blender",40.99,67,"Introdução as ferramentas","Modelagem"),("Desenvolvimento de Jogos",39.75,68,"Pygame","Python");

-- Faça um select que retorne os Produtos com o valor maior do que 50 reais. -- 
SELECT * FROM db_cursoDaMinhaVida.tb_cursos WHERE preco >50;

-- Faça um select trazendo os Produtos com valor entre 3 e 60 reais. -- 
SELECT * FROM db_cursoDaMinhaVida.tb_cursos WHERE preco >3 and preco < 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra B. -- 
SELECT * FROM db_cursoDaMinhaVida.tb_cursos WHERE nome  LIKE "%J%";

-- Faça um um select com Inner join entre tabela categoria e pizza. -- 
SELECT * FROM db_cursoDaMinhaVida.tb_categoria
INNER JOIN db_cursoDaMinhaVida.tb_cursos
ON tb_categoria.nome = tb_cursos.FK_categoria;

-- Faça um um select com Inner join entre tabela categoria e produto. -- 
SELECT * FROM db_cursoDaMinhaVida.tb_categoria
INNER JOIN  db_cursoDaMinhaVida.tb_cursos
ON tb_categoria.nome = tb_cursos.FK_categoria WHERE tb_categoria.nome = "JAVA";