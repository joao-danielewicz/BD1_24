CREATE DATABASE NORMALIZACAO;
USE NORMALIZACAO; 

/*
1FN 


CREATE TABLE NOTA_FISCAL(
	NRO_NOTA INT AUTO_INCREMENT NOT NULL,
    NOME_CLIENTE VARCHAR(50) NOT NULL,
    END_CLIENTE VARCHAR(255) NOT NULL,
    NOME_VENDEDOR VARCHAR(50) NOT NULL,
    DATA_EMISSAO DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    VALOR_TOTAL FLOAT NOT NULL,
    CONSTRAINT PK_NRO_NOTA PRIMARY KEY (NRO_NOTA)
);

CREATE TABLE ITEM_NOTA_FISCAL(
	NRO_NOTA INT NOT NULL,
    COD_PRODUTO INT NOT NULL,
    DESC_PRODUTO VARCHAR(255) NOT NULL,
    QTD_PRODUTO INT NOT NULL,
    VALOR_PRODUTO FLOAT NOT NULL,
    VALOR_TOTAL FLOAT NOT NULL,
    CONSTRAINT PK_ITEM_NOTA_FISCAL PRIMARY KEY(NRO_NOTA, COD_PRODUTO)
);
*/

CREATE TABLE NOTA_FISCAL(
	NRO_NOTA INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NOME_CLIENTE VARCHAR(50) NOT NULL,
    END_CLIENTE VARCHAR(255) NOT NULL,
    NOME_VENDEDOR VARCHAR(50) NOT NULL,
    DATA_EMISSAO DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    VALOR_TOTAL FLOAT NOT NULL
);

CREATE TABLE PRODUTO(
	COD_PRODUTO INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    DESC_PRODUTO VARCHAR(255) NOT NULL,
    UN_MED VARCHAR(15) NOT NULL,
    VL_PRODUTO FLOAT NOT NULL
);

CREATE TABLE ITEM_NOTA_FISCAL(
	NRO_NOTA INT NOT NULL,
    COD_PRODUTO INT NOT NULL,
    QTD_PRODUTO INT NOT NULL,
    VALOR_PRECO FLOAT NOT NULL,
    VALOR_TOTAL FLOAT NOT NULL,
    DESC_PRODUTO VARCHAR(255) NOT NULL,
    PRIMARY KEY(NRO_NOTA, COD_PRODUTO),
    CONSTRAINT FK_NRO_NOTA_NOTA_FISCAL FOREIGN KEY (NRO_NOTA) REFERENCES NOTA_FISCAL(NRO_NOTA),
    CONSTRAINT FK_COD_PRODUTO_PRODUTO FOREIGN KEY (COD_PRODUTO) REFERENCES PRODUTO(COD_PRODUTO)
);

INSERT INTO PRODUTO (DESC_PRODUTO, UN_MED, VL_PRODUTO) VALUES ("Banana", "KG", 2.50);
INSERT INTO PRODUTO (DESC_PRODUTO, UN_MED, VL_PRODUTO) VALUES ("Leite", "L", 3.60);
INSERT INTO PRODUTO (DESC_PRODUTO, UN_MED, VL_PRODUTO) VALUES ("Desodorante", "UN", 12);
INSERT INTO PRODUTO (DESC_PRODUTO, UN_MED, VL_PRODUTO) VALUES 
					("Salame", "KG", 40),
                    ("Queijo", "KG", 56),
                    ("Pão", "KG", 8),
                    ("Cuca", "KG", 29.99),
                    ("Bolacha", "UN", 4.70),
                    ("Chocolate", "UN", 6),
                    ("Coxinha", "UN", 7),
                    ("Caqui", "KG", 9),
                    ("Maçã", "KG", 13),
                    ("Pinhão", "KG", 10),
                    ("Toddynho", "UN", 2.99),
                    ("Presunto", "KG", 43),
                    ("Enroladinho", "UN", 5),
                    ("Ovo", "Dúzia", 20),
                    ("Arroz", "KG", 6.99),
                    ("Feijão", "KG", 9),
                    ("Macarrão", "Meio KG", 5.99),
                    ("Lasanha", "UN", 12),
                    ("Pizza", "UN", 15),
                    ("Lámen", "UN", 5.75),
                    ("Suco", "L", 23),
                    ("Refrigerante", "2L", 10);
                                        

INSERT INTO NOTA_FISCAL (NOME_CLIENTE, END_CLIENTE, NOME_VENDEDOR, VALOR_TOTAL) VALUES 
						("João Danielewicz", "Rua Tal, 0", "Bianca", 50.00),
                        ("Bianca Stolz", "Comunidade Ananda", "Samila", 75.00),
                        ("Kate Bush", "Devon, Reino Unido", "Heathcliff", 560),
                        ("Kati Outinen", "Tampere, Finlândia", "Aki", 12),
                        ("Catherine Earnshaw", "Wuthering Heights", "Nelly", 99),
                        ("Galadriel", "Lothloren", "Mithrandir", 112),
                        ("Kenji Miyazawa", "Ajigasawa", "Kannon", 50.00),
                        ("Jaqueline Camargo", "Rua Jaque", "Bianca", 610),
                        ("José Igor Monteiro", "Santa Cruz do Capibaribe", "Josayne", 45),
                        ("Gabriel Perez", "Anápolis - GO", "Esmeralda", 48),
                        ("Wigfrid", "Constant", "Wes", 82),
                        ("Wanda", "Constant", "Wes", 17),
                        ("Matti Pellonpää", "Vaasa, Finlândia", "Valto", 75),
                        ("Helmut Grokenberger", "Brooklyn", "Yoyo", 13),
                        ("Emma Stone", "Lisboa", "Bella Baxter", 470);

INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VALOR_PRECO, VALOR_TOTAL, DESC_PRODUTO) 
VALUES (1, 1, 20, 2.50, 50, "Banana-da-terra"), (1, 2, 2, 3.50, 7, "Leite"), (1, 3, 1, 12, 12, "Desodorante Old Spice"),
	   (2, 1, 1 , 1.75, 17.5, "Banana-nanica"), (2, 2, 10, 3.60, 36, "Leite Longa Vida"), (2, 3, 2, 8, 16, "Desodorante Herbissimo"),
       (3, 1, 5, 6, 30, "Banana-prata"), (3, 2, 12, 4.5, 54, "Leite Tirol"), (3, 3, 3, 15, 45, "Desodorante Dove"),
       (4, 4, 1, 35, 35, "Salame"), (4, 2, 6, 5, 30, "Leite Aurora");

INSERT INTO NOTA_FISCAL (NOME_CLIENTE, END_CLIENTE, NOME_VENDEDOR, VALOR_TOTAL) VALUES
						("Kate Bush", "Devon, Reino Unido", "Heathcliff", 60);
                        
INSERT INTO ITEM_NOTA_FISCAL (NRO_NOTA, COD_PRODUTO, QTD_PRODUTO, VALOR_PRECO, VALOR_TOTAL, DESC_PRODUTO) 
VALUES (16, 1, 4, 10, 40, "Banana-maçã");

SELECT * FROM PRODUTO;
SELECT * FROM ITEM_NOTA_FISCAL;
SELECT * FROM NOTA_FISCAL;






select * from nota_fiscal;