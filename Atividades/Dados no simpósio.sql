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

-- EVENTOS
INSERT INTO TIPO_EVENTO(
    DESCRICAO
) VALUES ('CURSO'), ('PALESTRA');

-- MINISTRANTE 
INSERT INTO PESSOA(
    NOME,
    MATRICULA ,
    DATA_NASC ,
    CONTATO 
) VALUES ('Jimin', 142, 19951013, 'jimin@jimin.com'),
		('Demi', 187, 19920820, 'demi@lovato.com'),
        ('Kate Bush', 159, 19580730, 'kate@bush.com'),
        ('Rony', 879, 19800301, 'rony@weasley.com'),
        ('Jane Fonda', 201, 19371221, 'jane@fonda.com');
INSERT INTO MINISTRANTE(
    MATRICULA,
    CARGO,
    ID_PESSOA
) VALUES (142, 'Aluno', 2),
		(187, 'Professora', 3),
        (159, 'Diretora', 4),
        (879, 'Aluno', 5),
        (201, 'Coordenadora', 6);


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

