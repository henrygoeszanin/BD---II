-- Procedure para agendar um aluno em uma aula
DELIMITER //
CREATE PROCEDURE sp_agendar_aluno(
  IN p_aula_id CHAR(36),
  IN p_aluno_id CHAR(36)
)
BEGIN
  DECLARE v_total INT;
  DECLARE v_limite INT;

  SELECT alunos_registrados, limite_alunos
    INTO v_total, v_limite
  FROM aulas
  WHERE id = p_aula_id;

  IF v_total >= v_limite THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Aula cheia. Não é possível agendar mais alunos.';
  ELSE
    INSERT INTO agendamentos (id_aula, id_aluno)
    VALUES (p_aula_id, p_aluno_id);
  END IF;
END;
//
DELIMITER ;