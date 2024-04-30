-- Acadêmicos: João Vitor Danielewicz, Allana Paganini, Jaqueline Camargo e Bianca Maccarini
DROP SCHEMA IF EXISTS ORGANIZACAO_SIMPOSIO;
CREATE SCHEMA ORGANIZACAO_SIMPOSIO;
USE ORGANIZACAO_SIMPOSIO;

-- SIMPÓSIO E ORGANIZADOR GERAL

CREATE TABLE SIMPOSIO(
	ID_SIMPOSIO INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(50) NOT NULL,
    DATA_INICIO DATETIME NOT NULL,
    DATA_FIM DATETIME NOT NULL,
    LOCAL_REALIZACAO VARCHAR(30) NOT NULL,
    PRIMARY KEY(ID_SIMPOSIO)
);

CREATE TABLE ORGANIZADOR(
	ID_ORGANIZADOR INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(50) NOT NULL,
    MATRICULA INT NOT NULL,
    DATA_NASC DATETIME NOT NULL,
    CONTATO VARCHAR(50) NOT NULL,
    CARGO VARCHAR(20) NOT NULL,
    ID_SIMPOSIO INT NOT NULL,
    PRIMARY KEY(ID_ORGANIZADOR),
    CONSTRAINT FK_ID_SIMPOSIO_ORGANIZADOR FOREIGN KEY(ID_SIMPOSIO) REFERENCES SIMPOSIO(ID_SIMPOSIO)
);

-- TIPO DO EVENTO, EVENTO E MINISTRANTE

CREATE TABLE TIPO_EVENTO(
	ID_TIPO_EVENTO INT NOT NULL AUTO_INCREMENT,
    DESCRICAO VARCHAR(256) NOT NULL,
    PRIMARY KEY(ID_TIPO_EVENTO)
);

CREATE TABLE EVENTO(
	ID_EVENTO INT NOT NULL AUTO_INCREMENT,
    ASSUNTO VARCHAR(256) NOT NULL,
    CARGA_HORARIA INT NOT NULL,
    DATA_INICIO DATETIME NOT NULL,
    DATA_FIM DATETIME NOT NULL,
    ID_TIPO_EVENTO INT NOT NULL,
    ID_SIMPOSIO INT NOT NULL,
    PRIMARY KEY(ID_EVENTO),
    CONSTRAINT FK_ID_TIPO_EVENTO FOREIGN KEY(ID_TIPO_EVENTO) REFERENCES TIPO_EVENTO(ID_TIPO_EVENTO),
    CONSTRAINT FK_ID_SIMPOSIO_EVENTO FOREIGN KEY(ID_SIMPOSIO) REFERENCES SIMPOSIO(ID_SIMPOSIO)
);

CREATE TABLE MINISTRANTE(
	ID_MINISTRANTE INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(50) NOT NULL,
    DATA_NASC DATETIME NOT NULL,
    ID_EVENTO INT NOT NULL,
    PRIMARY KEY(ID_MINISTRANTE),
    CONSTRAINT FK_ID_EVENTO_MINISTRANTE FOREIGN KEY(ID_EVENTO) REFERENCES EVENTO(ID_EVENTO)
);

-- INSCRIÇÃO NO SIMPÓSIO, PARTICIPANTE E PARTICIPAÇÃO NOS EVENTOS

CREATE TABLE INSCRICAO(
	ID_INSCRICAO INT NOT NULL AUTO_INCREMENT,
    VALOR FLOAT NOT NULL,
    DATA_INSCRICAO DATETIME NOT NULL,
    ID_SIMPOSIO INT NOT NULL,
    PRIMARY KEY(ID_INSCRICAO),
    CONSTRAINT FK_ID_SIMPOSIO_INSCRICAO FOREIGN KEY(ID_SIMPOSIO) REFERENCES SIMPOSIO(ID_SIMPOSIO)
);

CREATE TABLE PARTICIPANTE(
	ID_PARTICIPANTE INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(50) NOT NULL,
    MATRICULA INT NOT NULL,
    DATA_NASC DATETIME NOT NULL,
    CONTATO VARCHAR(50) NOT NULL,
    ID_INSCRICAO INT NOT NULL,
    PRIMARY KEY(ID_PARTICIPANTE),
    CONSTRAINT FK_ID_INSCRICAO FOREIGN KEY(ID_INSCRICAO) REFERENCES INSCRICAO(ID_INSCRICAO)
);

CREATE TABLE PARTICIPACAO_EVENTO(
	ID_PARTICIPACAO_EVENTO INT NOT NULL AUTO_INCREMENT,
    ID_EVENTO INT NOT NULL,
    ID_PARTICIPANTE INT NOT NULL,
    PRIMARY KEY(ID_PARTICIPACAO_EVENTO),
    CONSTRAINT FK_ID_EVENTO_PARTICIPACAO FOREIGN KEY(ID_EVENTO) REFERENCES EVENTO(ID_EVENTO),
    CONSTRAINT FK_ID_PARTICIPANTE FOREIGN KEY(ID_PARTICIPANTE) REFERENCES PARTICIPANTE(ID_PARTICIPANTE)
);

-- TEMA, COMISSÃO CIENTÍFICA DO TEMA, JURADO DA COMISSÃO, ARTIGO DO TEMA, AUTOR DO ARTIGO, PARECER DO JURADO SOBRE O ARTIGO

CREATE TABLE TEMA(
	ID_TEMA INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(20) NOT NULL,
    DESCRICAO VARCHAR(256) NOT NULL,
    ID_SIMPOSIO INT NOT NULL,
    PRIMARY KEY(ID_TEMA),
    CONSTRAINT FK_ID_SIMPOSIO_TEMA FOREIGN KEY(ID_SIMPOSIO) REFERENCES SIMPOSIO(ID_SIMPOSIO)
);

CREATE TABLE AUTOR(
	ID_AUTOR INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(50) NOT NULL,
    MATRICULA INT NOT NULL,
    DATA_NASC DATETIME NOT NULL,
    CURSO VARCHAR(20) NOT NULL,
    CONTATO INT NOT NULL,
    PRIMARY KEY(ID_AUTOR)
);

CREATE TABLE ARTIGO(
	ID_ARTIGO INT NOT NULL AUTO_INCREMENT,
    TITULO TEXT NOT NULL,
    RESUMO TEXT NOT NULL,
    TEXTO TEXT NOT NULL,
    ID_TEMA INT NOT NULL,
    ID_AUTOR INT NOT NULL,
    PRIMARY KEY(ID_ARTIGO),
    CONSTRAINT FK_ID_TEMA_ARTIGO FOREIGN KEY(ID_TEMA) REFERENCES TEMA(ID_TEMA),
    CONSTRAINT FK_ID_AUTOR FOREIGN KEY(ID_AUTOR) REFERENCES AUTOR(ID_AUTOR)
);

CREATE TABLE COMISSAO_CIENTIFICA(
	ID_COMISSAO INT NOT NULL AUTO_INCREMENT,
    ID_TEMA INT NOT NULL,
    ID_ARTIGO INT NOT NULL,
    PRIMARY KEY(ID_COMISSAO),
    CONSTRAINT FK_ID_TEMA_COMISSAO FOREIGN KEY(ID_TEMA) REFERENCES TEMA(ID_TEMA),
    CONSTRAINT FK_ID_ARTIGO_COMISSAO FOREIGN KEY(ID_ARTIGO) REFERENCES ARTIGO(ID_ARTIGO)
);

CREATE TABLE JURADO(
	ID_JURADO INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(50) NOT NULL,
    CARGO VARCHAR(20) NOT NULL,
    CONTATO VARCHAR(50) NOT NULL,
    ID_COMISSAO INT NOT NULL,
    PRIMARY KEY(ID_JURADO),
    CONSTRAINT FK_ID_COMISSAO FOREIGN KEY(ID_COMISSAO) REFERENCES COMISSAO_CIENTIFICA(ID_COMISSAO)    
);

CREATE TABLE PARECER(
	ID_PARECER INT AUTO_INCREMENT NOT NULL,
    NOTA FLOAT NOT NULL,
    DESCRICAO VARCHAR(256) NOT NULL,
    ID_JURADO INT NOT NULL,
    ID_ARTIGO INT NOT NULL,
    PRIMARY KEY(ID_PARECER),
    CONSTRAINT FK_ID_JURADO FOREIGN KEY(ID_JURADO) REFERENCES JURADO(ID_JURADO),
    CONSTRAINT FK_ID_ARTIGO_PARECER FOREIGN KEY(ID_ARTIGO) REFERENCES ARTIGO(ID_ARTIGO)
);

