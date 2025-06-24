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

-- CRUD de SELECT
-- Selecionar todos os alunos
SELECT * FROM alunos;

-- Selecionar todas as aulas com informações de professor e modalidade
SELECT a.id, a.data_hora, a.limite_alunos, a.alunos_registrados, m.nome AS modalidade, p.nome AS professor
FROM aulas a
JOIN modalidades m ON a.id_modalidade = m.id
JOIN professores p ON a.id_professor = p.id;

-- Selecionar agendamentos de um aluno específico
SELECT ag.*, au.nome AS aluno, al.data_hora, mo.nome AS modalidade
FROM agendamentos ag
JOIN alunos au ON ag.id_aluno = au.id
JOIN aulas al ON ag.id_aula = al.id
JOIN modalidades mo ON al.id_modalidade = mo.id
WHERE ag.id_aluno = 'coloque-uuid-aluno';

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
