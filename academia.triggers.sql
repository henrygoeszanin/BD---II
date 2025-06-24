
-- TRIGGER para controlar limite de alunos na aula
DELIMITER //
CREATE TRIGGER before_insert_agendamento
BEFORE INSERT ON agendamentos
FOR EACH ROW
BEGIN
    DECLARE total INT;
    DECLARE limite INT;
    SELECT alunos_registrados, limite_alunos INTO total, limite FROM aulas WHERE id = NEW.id_aula;
    IF total >= limite THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Aula cheia, não é possível agendar mais alunos.';
    ELSE
        UPDATE aulas SET alunos_registrados = alunos_registrados + 1 WHERE id = NEW.id_aula;
    END IF;
END;//
DELIMITER ;