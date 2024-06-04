-- INSERÇÃO DE DADOS NO SIMPÓSIO
-- ORGANIZADOR
INSERT INTO PESSOA(
    NOME,
    MATRICULA ,
    DATA_NASC ,
    CONTATO 
) VALUES ('Robson de Lima', 145, 19800614, 'robson@robson.com');

INSERT INTO ORGANIZADOR(
    MATRICULA,
    CARGO,
    ID_PESSOA
) VALUES ('145', 'Professor', 1);


-- SIMPOSIO
INSERT INTO SIMPOSIO(
    NOME,
    DATA_INICIO,
    DATA_FIM,
    LOCAL_REALIZACAO,
    ID_ORGANIZADOR
    
) VALUES('Semana Acadêmica de Computação', 20240514, 20240521, 'Unoesc', 1);

-- TIPOS DE EVENTO
INSERT INTO TIPO_EVENTO(
    DESCRICAO
) VALUES ('CURSO'), ('PALESTRA');

-- MINISTRANTE 

INSERT INTO PESSOA(
    NOME,
    MATRICULA ,
    DATA_NASC ,
    CONTATO 
) VALUES ('Cleusa Nunes', 142, 19951013, 'cleusa.nunes@uni.com'),
		('Lúcio Luft', 187, 19920820, 'lucio.luft@outlook.com'),
        ('Kate Bush', 159, 19580730, 'kate@bush.com'),
        ('Rony Weasley', 879, 19800301, 'rony@weasley.com'),
        ('Jane Fonda', 201, 19371221, 'jane@fonda.com');
        
INSERT INTO MINISTRANTE(
    MATRICULA,
    CARGO,
    ID_PESSOA
) VALUES (142, 'Aluna', 2),
		(187, 'Professor', 3),
        (159, 'Diretora', 4),
        (879, 'Aluno', 5),
        (201, 'Coordenadora', 6);

-- EVENTOS
INSERT INTO EVENTO(
    ASSUNTO,
    CARGA_HORARIA,
    DATA_INICIO,
    DATA_FIM,
    ID_TIPO_EVENTO,
    ID_SIMPOSIO,
    ID_MINISTRANTE
) VALUES ('Curso de Programação', 10, 20240515, 20240517, 1, 1, 2),
		('Curso de Banco de Dados', 12, 20240516, 20240520, 1, 1, 5),
        ('Motivação nos Estudos', 5, 20240514, 20240514, 2, 1, 3),
        ('Business Inteligence', 8, 20240517, 20240520, 2, 1, 1),
        ('Perspectiva de Emprego', 7, 20240521, 20240521, 2, 1, 4);

        
-- TEMAS
INSERT INTO TEMA(
    NOME,
    DESCRICAO,
    ID_SIMPOSIO
) VALUES ('Banco de Dados', 'Método para armazenamento de informações de modo estruturado.', 1),
		('Programação', 'Escrita de algoritmos para entrada e saída de dados e resolução de problemas.', 1),
        ('Eng. de Software', 'Representação da escrita e mudança de aplicações.', 1),
        ('Arquitetura de PCs', 'Montagem e organização de peças para o funcionamento de computadores', 1),
        ('Sists. Operacionais', 'Conjunto de instruções e softwares que operam o hardware, como Linux e Windows', 1);

-- AUTORES DE ARTIGOS
INSERT INTO PESSOA(
    NOME,
    MATRICULA ,
    DATA_NASC ,
    CONTATO 
) VALUES ('Bilbo Bolseiro', 958, 19580506, 'bilbo.bolseiro@midearth.com'),
		('Tom Bombadil', 472, 19691004, 'tom@gmail.com'),
        ('Sancho Pança', 226, 19800513, 's.pança12@lamancha.com'),
        ('Chiquinha Madruga', 909, 20010908, 'chilindrina@televisa.com'),
        ('Henry Ford', 330, 19640604, 'ford@gmotors.com');

INSERT INTO AUTOR(
    MATRICULA,
    CARGO,
    ID_PESSOA
) VALUES (958, 'Aluno', 7),
		(472, 'Aluno', 8),
        (226, 'Secretário', 9),
        (909, 'Aluna', 10),
        (330, 'Aluno emérito', 11);

-- ARTIGOS
INSERT INTO ARTIGO(
    TITULO,
    RESUMO,
    TEXTO,
    ID_TEMA,
    ID_AUTOR
) VALUES ('Soluções de Problemas Utilizando a Procedural Language PGSQL em PostgreSQL.', 'lorem ipsum', 'lorem ipsum', 1, 1),
		('Novas Abordagens para Ponteiros em Linguagens Orientadas a Objetos.', 'lorem ipsum', 'lorem ipsum', 2, 2),
        ('Simplificação de Diagramas para Ensino Prático em Escolas de Ensino Médio/Técnico.', 'lorem ipsum', 'lorem ipsum', 3, 3),
        ('Revolução de Peças: Inovação em Organização de Componentes e Periféricos.', 'lorem ipsum', 'lorem ipsum', 4, 4),
        ('Análise de Sistemas Operacionais Baseados em Linux e suas Compatibilidades com Programas Populares.', 'lorem ipsum', 'lorem ipsum', 5, 5);
        
-- COMISSÃO CIENTÍFICA
INSERT INTO COMISSAO_CIENTIFICA(
    ID_TEMA,
    ID_ARTIGO
)VALUES (1,1),
		(2,2),
        (3,3),
        (4,4),
        (5,5);
        
-- AVALIADORES DA COMISSÃO
INSERT INTO PESSOA(
    NOME,
    MATRICULA ,
    DATA_NASC ,
    CONTATO 
) VALUES ('Ringo Starr', 487, 19600205, 'ringost.arr@btls.com'),
		('Clara Nunes', 689, 20021214, 'clanunes@mpb.com'),
        ('José Monteiro', 842, 20000628, 'igor123@pbsd.com'),
        ('Isabela Kleber', 271, 19970723, 'isabelabela13@klebinho.com'),
        ('Matheus Henrique', 1002, 20030918, 'matheush@btuva.com');
select * from pessoa;

INSERT INTO JURADO(
    CARGO,
    MATRICULA,
    ID_PESSOA,
    ID_COMISSAO_CIENTIFICA
) VALUES ('Professor', 487, 12, 1),
		('Professora', 689, 13, 2),
		('Diretor de curso', 842, 14, 3),
        ('Pesquisadora', 271, 15, 4),
        ('Professor', 1002, 16, 5);

-- PARECERES DA AVALIAÇÃO
INSERT INTO PARECER(
    NOTA,
    DESCRICAO,
    ID_ARTIGO,
    ID_JURADO
) VALUES (10, 'Ótimo esclarecimento e simplificação da PL/PGSQL.', 1, 2),
		(9, 'Bons usos dos recursos propostos e baixo acoplamento.', 2, 5),
        (8, 'Método bom, mas a didática deverá ser melhorada.', 3, 3),
        (9, 'São notáveis os aspectos da reusabilidade das peças e economia de energia.', 4, 1),
        (7, 'Tema vago e não abrangente, mas que com esforço pode ser desenvolvido.', 5, 4);

-- PARTICIPANTES COMUNS 
INSERT INTO PESSOA (NOME, MATRICULA, DATA_NASC, CONTATO) VALUES
 ('Wilson', 8574, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Willow', 4251, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Wolfgang', 2689, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Wendy', 1574, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Wickerbottom', 1245, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Woodie', 8749, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Wes', 1487, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Maxwell', 1289, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Wigfrid', 1204, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Webber', 1259, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Winona', 9875, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Warly', 1023, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Wortox', 986, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Wormwood', 1478, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Wurt', 1254, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Walter', 8579, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999))),
 ('Wanda', 9987, (SELECT TIMESTAMP('1980-01-01') + INTERVAL FLOOR( RAND( ) * 30) YEAR), (SELECT FLOOR(RAND()*99999999)));
 