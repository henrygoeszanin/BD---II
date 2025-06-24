-- CRUD de INSERT
-- Inserir aluno
INSERT INTO alunos (id, nome, data_nascimento, email) VALUES (UUID(), 'João Silva', '2000-01-01', 'joao@email.com');

-- Inserir professor
INSERT INTO professores (id, nome, especialidade) VALUES (UUID(), 'Maria Souza', 'Musculação');

-- Inserir modalidade
INSERT INTO modalidades (nome) VALUES ('Musculação');

-- Inserir aula
INSERT INTO aulas (id, id_modalidade, id_professor, data_hora, limite_alunos) VALUES (UUID(), 1, 'coloque-uuid-professor', '2025-07-01 10:00:00', 10);

-- Inserir agendamento (aluno em aula)
INSERT INTO agendamentos (id_aula, id_aluno) VALUES ('coloque-uuid-aula', 'coloque-uuid-aluno');

-- CRUD de UPDATE
-- Atualizar email de um aluno
UPDATE alunos SET email = 'novo@email.com' WHERE id = 'coloque-uuid-aluno';

-- Atualizar limite de alunos em uma aula
UPDATE aulas SET limite_alunos = 15 WHERE id = 'coloque-uuid-aula';

-- CRUD de DELETE
-- Remover um aluno
DELETE FROM alunos WHERE id = 'coloque-uuid-aluno';

-- Remover um agendamento
DELETE FROM agendamentos WHERE id = 1;

-- Remover uma aula
DELETE FROM aulas WHERE id = 'coloque-uuid-aula';
