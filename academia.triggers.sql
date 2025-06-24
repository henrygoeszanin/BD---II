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
    -- Removing this update as it will be handled by the after_insert_agendamento trigger
    -- ELSE
    --    UPDATE aulas SET alunos_registrados = alunos_registrados + 1 WHERE id = NEW.id_aula;
    END IF;
END;//
DELIMITER ;

-- TRIGGER para decrementar o contador de alunos quando um agendamento é removido
DELIMITER //
CREATE TRIGGER after_delete_agendamento
AFTER DELETE ON agendamentos
FOR EACH ROW
BEGIN
    UPDATE aulas SET alunos_registrados = alunos_registrados - 1 WHERE id = OLD.id_aula;
END;//
DELIMITER ;

-- TRIGGER para incrementar o contador de alunos quando um agendamento é adicionado
DELIMITER //
CREATE TRIGGER after_insert_agendamento
AFTER INSERT ON agendamentos
FOR EACH ROW
BEGIN
    UPDATE aulas SET alunos_registrados = alunos_registrados + 1 WHERE id = NEW.id_aula;
END;//
DELIMITER ;