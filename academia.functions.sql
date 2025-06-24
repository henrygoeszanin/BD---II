-- Função: Contar agendamentos de um aluno
DELIMITER //
CREATE FUNCTION fn_total_agendamentos_aluno(p_aluno_id CHAR(36))
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM agendamentos WHERE id_aluno = p_aluno_id;
    RETURN total;
END//
DELIMITER ;

-- Função: Buscar próximas aulas de um professor
DELIMITER //
CREATE FUNCTION fn_proximas_aulas_professor(p_prof_id CHAR(36))
RETURNS INT
READS SQL DATA
NOT DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM aulas WHERE id_professor = p_prof_id AND data_hora >= NOW();
    RETURN total;
END//
DELIMITER ;

-- Função: Verificar se aluno está agendado em uma aula
DELIMITER //
CREATE FUNCTION fn_aluno_agendado(p_id_aula CHAR(36), p_id_aluno CHAR(36))
RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe FROM agendamentos 
    WHERE id_aula = p_id_aula AND id_aluno = p_id_aluno;
    RETURN existe > 0;
END//
DELIMITER ;