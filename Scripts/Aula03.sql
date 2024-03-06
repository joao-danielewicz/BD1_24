-- Criar novo BD
CREATE DATABASE GREENHOUSE;

-- Utilizando o BD
USE GREENHOUSE;

-- CRIANDO UMA TABELA
CREATE TABLE `GREENHOUSE`.`PLANTS` (
	`PLANT_NAME` CHAR(30) NOT NULL,
    `SENSOR_VALUE` FLOAT DEFAULT NULL,
    `SENSOR_EVENT` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `SENSOR_LEVEL` CHAR(5) DEFAULT NULL,
    PRIMARY KEY `PK_LANT_NAME` (`PLANT_NAME`)
);

-- COMANDOS DML DE INSERÇÃO DE DADOS

INSERT INTO `plants` VALUES ('Absinto',19,'HIGH'),
							('Alfazema',15.8,'HIGH'),
							('Arruda',19.9,'HIGH'),
							('Cânfora',29,'HIGH'),
							('Cravo Chabaud',6.3,'HIGH'),
							('Estragão',28.7,'HIGH'),
							('Gerânio',21,'HIGH'),
							('Girassol',13,'LOW'),
							('Lírio do Vale',9.5,'LOW'),
							('Rosa de Saron',11.6,'LOW'),
							('Tagetes',12,'LOW'),
							('Violeta',25,'HIGH');

-- Selecionando tudo
SELECT  * FROM `GREENHOUSE`.`PLANTS`;

-- Selecionando apenas colunas específicas
SELECT PLANT_NAME, SENSOR_EVENT FROM PLANTS;

-- Aplicando filtros na consulta
SELECT PLANT_NAME FROM PLANTS WHERE SENSOR_LEVEL = 'HIGH';

-- Aplicando filtros booleanos
SELECT * FROM PLANTS WHERE SENSOR_LEVEL = 'HIGH' AND 10 <SENSOR_LEVEL< 20;

-- Objetos numa coleção
SELECT * FROM PLANTS WHERE SENSOR_LEVEL IN ('HIGH', 'LOW');

-- Cláusula de ordenação
SELECT * FROM PLANTS WHERE SENSOR_VALUE <15 ORDER BY SENSOR_VALUE DESC;

-- Funções de agrupamento
-- Mostra a quantidade de registros, separados por um registro contido na instrução group by.
SELECT COUNT(*), SENSOR_LEVEL FROM PLANTS GROUP BY SENSOR_LEVEL;

-- EXEMPLO SELECT TOP
SELECT * FROM PLANTS WHERE SENSOR_VALUE>18 LIMIT 3;

-- EXEMPLO MIN E MAX
SELECT MIN(SENSOR_VALUE) FROM PLANTS WHERE SENSOR_LEVEL = 'HIGH';
SELECT MAX(SENSOR_VALUE) FROM PLANTS WHERE SENSOR_LEVEL = 'LOW';

-- EXEMPLO COUNT
SELECT COUNT(*) FROM PLANTS WHERE SENSOR_LEVEL = 'LOW';

-- EXEMPLO SUM
SELECT SUM(SENSOR_VALUE) FROM PLANTS;

-- EXEMPLO AVG
SELECT AVG(SENSOR_VALUE) FROM PLANTS;

-- EXEMPLO LIKE
SELECT * FROM PLANTS WHERE PLANT_NAME LIKE 'A%';
SELECT * FROM PLANTS WHERE PLANT_NAME LIKE '%ni%';
SELECT * FROM PLANTS WHERE PLANT_NAME LIKE '%O';

-- Comando UPDATE para atualizar registros de dados
SELECT * FROM PLANTS;

UPDATE PLANTS SET SENSOR_VALUE = 34, SENSOR_LEVEL = ('HIGH') WHERE PLANT_NAME = ('Rosa de Saron');
