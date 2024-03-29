CREATE DATABASE UNOESC_BANK;

CREATE TABLE CLIENTE(
	ID INT NOT NULL auto_increment PRIMARY KEY,
    NOME VARCHAR(255) 
);

CREATE TABLE CONTA(
	ID INT NOT NULL auto_increment PRIMARY KEY,
    NRO_CONTA VARCHAR(10) NOT NULL,
    ID_CLIENTE INT NOT NULL,
    CONSTRAINT FK_ID_CLIENTE_CONTA FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(ID)
);

CREATE TABLE TRANSACAO(
	ID INT NOT NULL auto_increment PRIMARY KEY,
    ID_CONTA INT NOT NULL,
    TIPO_TRANSACAO INT NOT NULL,
    DATA_HORA DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    VALOR FLOAT NOT NULL
    -- ,CONSTRAINT FK_ID_CONTA_TRANSACAO FOREIGN KEY(ID_CONTA) REFERENCES CONTA.ID
);

-- Definindo uma FK posteriormente à criação da tabela.
ALTER TABLE TRANSACAO 
ADD FOREIGN KEY (ID_CONTA) REFERENCES CONTA(ID);

-- Criando índices
CREATE INDEX IDX_TRANSACAO_TP_TRANSACAO
ON TRANSACAO (TIPO_TRANSACAO);

CREATE INDEX IDX_TRANSACAO_DATA_HORA
ON TRANSACAO (DATA_HORA);

CREATE TABLE CARTEIRA(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_CONTA INT NOT NULL,
    SALDO FLOAT NOT NULL,
	CONSTRAINT FK_ID_CONTA_CARTEIRA FOREIGN KEY(ID_CONTA) REFERENCES CONTA(ID)
);
