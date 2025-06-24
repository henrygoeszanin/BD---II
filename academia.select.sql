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