-- EXERCICIO O1 -- 
-- Crie um banco de dados --
CREATE DATABASE db_generation_game_online;

-- Crie uma tabela tb_classe utilizando e determine 3 atributos -- 
CREATE TABLE db_generation_game_online.tb_classe(
nome varchar(45) unique not null,
habilidade varchar(90),
clã varchar(45), 
primary key (nome,clã)
);
-- Crie uma tabela tb_personagem e determine 5 atributos -- 
CREATE TABLE db_generation_game_online.tb_personagem(
nome varchar(45) unique not null,
ataque integer(5),
defesa bigint(5), 
poder_especial boolean,
FK_classe varchar(45),
primary key (nome),
foreign key(FK_classe) references tb_classe(nome)
);

-- Popule esta tabela classe com até 5 dados -- 
INSERT INTO db_generation_game_online.tb_classe values 
("Impretuosity","Destruição","Guerra"),
("Poisedon","Cura e controle d'agua","Aqua"),
("Sabio","Amparo dos anciãos","Magia"),
("Cartomante","Frenesi Incontrolavel","Magia"),
("Arqueiro","Ataque Invisivel","Guerra");

-- Popule esta tabela personagem com até 8 dados -- 
INSERT INTO db_generation_game_online.tb_personagem values 
("Zoonaty",1245,3456,false,"Poisedon"),("Azala",6798,4568,true,"Impretuosity"),
("Lunny",2345,4567,false,"Sabio"),("Tempestuosa",2345,4567,false,"Cartomante"),
("Illias",2345,1456,false,"Sabio"),("Baauz",2500,1750,true,"Impretuosity"),
("Nala",8960,9856,true,"Poisedon"),("Gaara",2345,3566,true,"Arqueiro");

-- Faça um select que retorne os personagens com o poder de ataque maior do que 2000. -- 
SELECT * FROM db_generation_game_online.tb_personagem WHERE ataque >2000;

-- Faça um select trazendo os personagens com poder de defesa entre 1000 e 2000. -- 
SELECT * FROM db_generation_game_online.tb_personagem WHERE ataque >1000 and ataque < 2000;

-- Faça um select utilizando LIKE buscando os personagens com a letra C. -- 
SELECT * FROM db_generation_game_online.tb_personagem WHERE nome  LIKE "%C%";

-- Faça um um select com Inner join entre tabela classe e personagem. -- 
SELECT * FROM db_generation_game_online.tb_classe
INNER JOIN db_generation_game_online.tb_personagem 
ON tb_classe.nome = tb_personagem.FK_classe;

-- Faça um select onde traga todos os personagem de uma classe específica  -- 
SELECT * FROM db_generation_game_online.tb_classe
INNER JOIN db_generation_game_online.tb_personagem 
ON tb_classe.nome = tb_personagem.FK_classe WHERE tb_classe.nome = "Arqueiro";