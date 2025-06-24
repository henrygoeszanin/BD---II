-- CRUD de INSERT

-- Inserir alunos
INSERT INTO alunos (id, nome, data_nascimento, email) VALUES 
(UUID(), 'João Silva', '2000-01-01', 'joao.silva@email.com'),
(UUID(), 'Maria Santos', '1998-05-15', 'maria.santos@email.com'),
(UUID(), 'Pedro Oliveira', '1995-12-20', 'pedro.oliveira@email.com'),
(UUID(), 'Ana Costa', '2001-03-10', 'ana.costa@email.com'),
(UUID(), 'Carlos Ferreira', '1990-08-25', 'carlos.ferreira@email.com'),
(UUID(), 'Juliana Lima', '1999-11-03', 'juliana.lima@email.com'),
(UUID(), 'Rafael Almeida', '1997-07-18', 'rafael.almeida@email.com'),
(UUID(), 'Camila Rodrigues', '2002-02-28', 'camila.rodrigues@email.com'),
(UUID(), 'Lucas Pereira', '1996-09-12', 'lucas.pereira@email.com'),
(UUID(), 'Fernanda Gomes', '2000-06-07', 'fernanda.gomes@email.com');

-- Inserir professores
INSERT INTO professores (id, nome, especialidade) VALUES 
(UUID(), 'Maria Souza', 'Musculação'),
(UUID(), 'Carlos Alberto', 'Pilates'),
(UUID(), 'Ana Paula', 'Yoga'),
(UUID(), 'Roberto Silva', 'Natação'),
(UUID(), 'Juliana Fernandes', 'Zumba'),
(UUID(), 'Marcos Andrade', 'CrossFit'),
(UUID(), 'Patricia Lima', 'Spinning'),
(UUID(), 'Felipe Santos', 'Boxe'),
(UUID(), 'Carla Menezes', 'Funcional'),
(UUID(), 'Diego Costa', 'Hidroginástica');

-- Inserir modalidades
INSERT INTO modalidades (nome) VALUES 
('Musculação'),
('Pilates'),
('Yoga'),
('Natação'),
('Zumba'),
('CrossFit'),
('Spinning'),
('Boxe'),
('Funcional'),
('Hidroginástica');

-- Inserir aulas
INSERT INTO aulas (id, id_modalidade, id_professor, data_hora, limite_alunos) VALUES 
(UUID(), 1, (SELECT id FROM professores WHERE nome = 'Maria Souza'), '2025-07-01 08:00:00', 10),
(UUID(), 2, (SELECT id FROM professores WHERE nome = 'Carlos Alberto'), '2025-07-01 09:00:00', 10),
(UUID(), 3, (SELECT id FROM professores WHERE nome = 'Ana Paula'), '2025-07-01 10:00:00', 10),
(UUID(), 4, (SELECT id FROM professores WHERE nome = 'Roberto Silva'), '2025-07-01 11:00:00', 10),
(UUID(), 5, (SELECT id FROM professores WHERE nome = 'Juliana Fernandes'), '2025-07-01 12:00:00', 10),
(UUID(), 6, (SELECT id FROM professores WHERE nome = 'Marcos Andrade'), '2025-07-01 13:00:00', 10),
(UUID(), 7, (SELECT id FROM professores WHERE nome = 'Patricia Lima'), '2025-07-01 14:00:00', 10),
(UUID(), 8, (SELECT id FROM professores WHERE nome = 'Felipe Santos'), '2025-07-01 15:00:00', 10),
(UUID(), 9, (SELECT id FROM professores WHERE nome = 'Carla Menezes'), '2025-07-01 16:00:00', 10),
(UUID(), 10, (SELECT id FROM professores WHERE nome = 'Diego Costa'), '2025-07-01 17:00:00', 10);

-- Inserir agendamentos (alunos em aulas)
-- Utilizando variáveis para evitar erro de trigger no MySQL (não pode atualizar a mesma tabela referenciada na subquery)
SET @aula_id1 = (SELECT id FROM aulas WHERE data_hora = '2025-07-01 08:00:00' LIMIT 1);
SET @aluno_id1 = (SELECT id FROM alunos WHERE nome = 'João Silva');
INSERT INTO agendamentos (id_aula, id_aluno) VALUES (@aula_id1, @aluno_id1);

SET @aula_id2 = (SELECT id FROM aulas WHERE data_hora = '2025-07-01 09:00:00' LIMIT 1);
SET @aluno_id2 = (SELECT id FROM alunos WHERE nome = 'Maria Santos');
INSERT INTO agendamentos (id_aula, id_aluno) VALUES (@aula_id2, @aluno_id2);

SET @aula_id3 = (SELECT id FROM aulas WHERE data_hora = '2025-07-01 10:00:00' LIMIT 1);
SET @aluno_id3 = (SELECT id FROM alunos WHERE nome = 'Pedro Oliveira');
INSERT INTO agendamentos (id_aula, id_aluno) VALUES (@aula_id3, @aluno_id3);

SET @aula_id4 = (SELECT id FROM aulas WHERE data_hora = '2025-07-01 11:00:00' LIMIT 1);
SET @aluno_id4 = (SELECT id FROM alunos WHERE nome = 'Ana Costa');
INSERT INTO agendamentos (id_aula, id_aluno) VALUES (@aula_id4, @aluno_id4);

SET @aula_id5 = (SELECT id FROM aulas WHERE data_hora = '2025-07-01 12:00:00' LIMIT 1);
SET @aluno_id5 = (SELECT id FROM alunos WHERE nome = 'Carlos Ferreira');
INSERT INTO agendamentos (id_aula, id_aluno) VALUES (@aula_id5, @aluno_id5);

SET @aula_id6 = (SELECT id FROM aulas WHERE data_hora = '2025-07-01 13:00:00' LIMIT 1);
SET @aluno_id6 = (SELECT id FROM alunos WHERE nome = 'Juliana Lima');
INSERT INTO agendamentos (id_aula, id_aluno) VALUES (@aula_id6, @aluno_id6);

SET @aula_id7 = (SELECT id FROM aulas WHERE data_hora = '2025-07-01 14:00:00' LIMIT 1);
SET @aluno_id7 = (SELECT id FROM alunos WHERE nome = 'Rafael Almeida');
INSERT INTO agendamentos (id_aula, id_aluno) VALUES (@aula_id7, @aluno_id7);

SET @aula_id8 = (SELECT id FROM aulas WHERE data_hora = '2025-07-01 15:00:00' LIMIT 1);
SET @aluno_id8 = (SELECT id FROM alunos WHERE nome = 'Camila Rodrigues');
INSERT INTO agendamentos (id_aula, id_aluno) VALUES (@aula_id8, @aluno_id8);

SET @aula_id9 = (SELECT id FROM aulas WHERE data_hora = '2025-07-01 16:00:00' LIMIT 1);
SET @aluno_id9 = (SELECT id FROM alunos WHERE nome = 'Lucas Pereira');
INSERT INTO agendamentos (id_aula, id_aluno) VALUES (@aula_id9, @aluno_id9);

SET @aula_id10 = (SELECT id FROM aulas WHERE data_hora = '2025-07-01 17:00:00' LIMIT 1);
SET @aluno_id10 = (SELECT id FROM alunos WHERE nome = 'Fernanda Gomes');
INSERT INTO agendamentos (id_aula, id_aluno) VALUES (@aula_id10, @aluno_id10);

-- CRUD de UPDATE

-- Atualizar email de alunos
UPDATE alunos SET email = 'joao.silva.novo@email.com' WHERE nome = 'João Silva';
UPDATE alunos SET email = 'maria.santos.novo@email.com' WHERE nome = 'Maria Santos';

-- Atualizar especialidade de professores
UPDATE professores SET especialidade = 'Musculação e Funcional' WHERE nome = 'Maria Souza';
UPDATE professores SET especialidade = 'Pilates e Yoga' WHERE nome = 'Carlos Alberto';

-- Atualizar limite de alunos em aulas
UPDATE aulas SET limite_alunos = 20 WHERE data_hora = '2025-07-01 08:00:00';
UPDATE aulas SET limite_alunos = 25 WHERE data_hora = '2025-07-01 18:00:00';

-- Atualizar data de nascimento de um aluno
UPDATE alunos SET data_nascimento = '2000-01-15' WHERE nome = 'João Silva';

-- Atualizar horário de uma aula
UPDATE aulas SET data_hora = '2025-07-01 08:30:00' WHERE data_hora = '2025-07-01 08:00:00' AND id_modalidade = 1;

-- CRUD de DELETE

-- Remover agendamentos específicos
DELETE FROM agendamentos WHERE id_aluno = (SELECT id FROM alunos WHERE nome = 'Lucas Pereira') 
AND id_aula = (SELECT id FROM aulas WHERE data_hora = '2025-07-01 20:00:00' LIMIT 1);

-- Remover uma aula específica (primeiro remover agendamentos relacionados)
DELETE FROM agendamentos WHERE id_aula = (SELECT id FROM aulas WHERE data_hora = '2025-07-02 17:00:00' LIMIT 1);
DELETE FROM aulas WHERE data_hora = '2025-07-02 17:00:00';

-- Remover um aluno (primeiro remover seus agendamentos)
DELETE FROM agendamentos WHERE id_aluno = (SELECT id FROM alunos WHERE nome = 'Carlos Ferreira');
DELETE FROM alunos WHERE nome = 'Carlos Ferreira';

-- Remover uma modalidade (cuidado com dependências)
-- DELETE FROM modalidades WHERE nome = 'Tai Chi Chuan';

-- Remover professor (primeiro verificar se não tem aulas ativas)
-- DELETE FROM professores WHERE nome = 'Diego Costa' AND id NOT IN (SELECT DISTINCT id_professor FROM aulas);

-- Limpar agendamentos de aulas antigas (exemplo: anteriores a uma data)
DELETE FROM agendamentos WHERE id_aula IN (
    SELECT id FROM aulas WHERE data_hora < '2025-06-01'
);

-- Remover aulas antigas
DELETE FROM aulas WHERE data_hora < '2025-06-01';

-- CRUD de SELECT

-- Selecionar todos os alunos
SELECT * FROM alunos ORDER BY nome;

-- Selecionar alunos por faixa etária
SELECT nome, data_nascimento, YEAR(CURDATE()) - YEAR(data_nascimento) AS idade 
FROM alunos 
WHERE YEAR(CURDATE()) - YEAR(data_nascimento) BETWEEN 18 AND 25
ORDER BY idade;

-- Selecionar todos os professores e suas especialidades
SELECT * FROM professores ORDER BY especialidade, nome;

-- Selecionar todas as modalidades disponíveis
SELECT * FROM modalidades ORDER BY nome;

-- Selecionar aulas de um dia específico
SELECT a.id, m.nome AS modalidade, p.nome AS professor, a.data_hora, a.limite_alunos, a.alunos_registrados
FROM aulas a
JOIN modalidades m ON a.id_modalidade = m.id
JOIN professores p ON a.id_professor = p.id
WHERE DATE(a.data_hora) = '2025-07-01'
ORDER BY a.data_hora;

-- Selecionar agendamentos com detalhes
SELECT ag.id, al.nome AS aluno, au.data_hora, m.nome AS modalidade, p.nome AS professor
FROM agendamentos ag
JOIN alunos al ON ag.id_aluno = al.id
JOIN aulas au ON ag.id_aula = au.id
JOIN modalidades m ON au.id_modalidade = m.id
JOIN professores p ON au.id_professor = p.id
ORDER BY au.data_hora, al.nome;

-- Selecionar aulas com vagas disponíveis
SELECT a.id, m.nome AS modalidade, p.nome AS professor, a.data_hora, 
       a.limite_alunos, a.alunos_registrados, 
       (a.limite_alunos - a.alunos_registrados) AS vagas_disponiveis
FROM aulas a
JOIN modalidades m ON a.id_modalidade = m.id
JOIN professores p ON a.id_professor = p.id
WHERE a.alunos_registrados < a.limite_alunos
ORDER BY a.data_hora;

-- Selecionar alunos de uma aula específica
SELECT al.nome, al.email, ag.data_agendamento
FROM agendamentos ag
JOIN alunos al ON ag.id_aluno = al.id
JOIN aulas au ON ag.id_aula = au.id
WHERE au.data_hora = '2025-07-01 08:00:00'
ORDER BY al.nome;

-- Contar agendamentos por modalidade
SELECT m.nome AS modalidade, COUNT(ag.id) AS total_agendamentos
FROM modalidades m
LEFT JOIN aulas a ON m.id = a.id_modalidade
LEFT JOIN agendamentos ag ON a.id = ag.id_aula
GROUP BY m.id, m.nome
ORDER BY total_agendamentos DESC;

-- Selecionar professores mais populares (com mais aulas agendadas)
SELECT p.nome AS professor, p.especialidade, COUNT(ag.id) AS total_agendamentos
FROM professores p
LEFT JOIN aulas a ON p.id = a.id_professor
LEFT JOIN agendamentos ag ON a.id = ag.id_aula
GROUP BY p.id, p.nome, p.especialidade
HAVING COUNT(ag.id) > 0
ORDER BY total_agendamentos DESC;
