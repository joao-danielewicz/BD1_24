USE AVIACAO;
DROP TRIGGER IF EXISTS INSERT_HORARIO;

DELIMITER $$
CREATE TRIGGER INSERT_HORARIO
AFTER INSERT ON VOO
FOR EACH ROW
BEGIN 

	DECLARE CONTADOR INT;
    DECLARE QTD INT;
	SET CONTADOR = 0;
    SET QTD = (SELECT QTD_POLTRONAS FROM AERONAVE WHERE NEW.ID_AERONAVE = AERONAVE.ID_AERONAVE);
    
    WHILE(CONTADOR < QTD) DO
    
		IF(CONTADOR < (QTD*0.25)) THEN
			INSERT INTO HORARIO (LADO_POLTRONA, LOCALIZACAO_POLTRONA, ID_VOO)
            VALUES('Direita', 'Janela', NEW.ID_VOO);
		ELSEIF(CONTADOR > (QTD*0.25)) AND CONTADOR < (QTD*0.50) THEN
			INSERT INTO HORARIO (LADO_POLTRONA, LOCALIZACAO_POLTRONA, ID_VOO)
            VALUES('Direita', 'Corredor', NEW.ID_VOO);
		ELSEIF(CONTADOR > (QTD*0.50)) AND CONTADOR < (QTD*0.75) THEN
			INSERT INTO HORARIO (LADO_POLTRONA, LOCALIZACAO_POLTRONA, ID_VOO)
            VALUES('Esquerda', 'Corredor', NEW.ID_VOO);
		ELSEIF(CONTADOR < QTD)THEN
			INSERT INTO HORARIO (LADO_POLTRONA, LOCALIZACAO_POLTRONA, ID_VOO)
            VALUES('Esquerda', 'Janela', NEW.ID_VOO);
        END IF;
        
        SET CONTADOR = CONTADOR + 1; 
	END WHILE;
END$$

