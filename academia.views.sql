-- View: Listagem de aulas com detalhes de professor e modalidade
CREATE OR REPLACE VIEW vw_aulas_detalhes AS
SELECT a.id, a.data_hora, a.limite_alunos, a.alunos_registrados,
       m.nome AS modalidade, p.nome AS professor
FROM aulas a
JOIN modalidades m ON a.id_modalidade = m.id
JOIN professores p ON a.id_professor = p.id;

-- View: Agendamentos detalhados (aluno, aula, modalidade, professor)
CREATE OR REPLACE VIEW vw_agendamentos_detalhados AS
SELECT ag.id AS id_agendamento, ag.data_agendamento, 
       al.nome AS aluno, au.data_hora AS data_aula, 
       mo.nome AS modalidade, pr.nome AS professor
FROM agendamentos ag
JOIN alunos al ON ag.id_aluno = al.id
JOIN aulas au ON ag.id_aula = au.id
JOIN modalidades mo ON au.id_modalidade = mo.id
JOIN professores pr ON au.id_professor = pr.id;

-- View: Próximas aulas (a partir de hoje)
CREATE OR REPLACE VIEW vw_proximas_aulas AS
SELECT a.*, m.nome AS modalidade, p.nome AS professor
FROM aulas a
JOIN modalidades m ON a.id_modalidade = m.id
JOIN professores p ON a.id_professor = p.id
WHERE a.data_hora >= NOW();