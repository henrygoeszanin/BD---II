-- Função: Contar agendamentos de um aluno
DELIMITER //
CREATE FUNCTION fn_total_agendamentos_aluno(aluno_id CHAR(36))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM agendamentos WHERE id_aluno = aluno_id;
    RETURN total;
END//
DELIMITER ;

-- Função: Buscar próximas aulas de um professor
DELIMITER //
CREATE FUNCTION fn_proximas_aulas_professor(prof_id CHAR(36))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM aulas WHERE id_professor = prof_id AND data_hora >= NOW();
    RETURN total;
END//
DELIMITER ;

-- Função: Verificar se aluno está agendado em uma aula
DELIMITER //
CREATE FUNCTION fn_aluno_agendado(id_aula CHAR(36), id_aluno CHAR(36))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe FROM agendamentos WHERE id_aula = id_aula AND id_aluno = id_aluno;
    RETURN existe > 0;
END//
DELIMITER ;