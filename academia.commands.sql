-- Arquivo para testar Triggers, Views e Functions do Sistema de Academia

USE academia;

-- ==========================================
-- TESTE DE TRIGGERS
-- ==========================================

-- Teste do trigger before_insert_agendamento
-- Primeiro, vamos verificar uma aula específica
SELECT id, data_hora, limite_alunos, alunos_registrados FROM aulas WHERE data_hora >= '2025-07-01 04:30:00' LIMIT 5;

-- Salvando o ID da aula em uma variável para testes
SET @aula_teste = (SELECT id FROM aulas WHERE data_hora = '2025-07-01 08:00:00' LIMIT 1);

-- Obtendo alunos para teste que ainda não estão nessa aula
SET @aluno_teste1 = (SELECT id FROM alunos WHERE nome = 'Pedro Oliveira');
SET @aluno_teste2 = (SELECT id FROM alunos WHERE nome = 'Ana Costa');

-- Tentativa de inserção normal (deve funcionar se ainda não atingiu o limite)
INSERT INTO agendamentos (id_aula, id_aluno) VALUES (@aula_teste, @aluno_teste1);

-- Verificando se o contador de alunos foi incrementado pelo trigger
SELECT id, data_hora, limite_alunos, alunos_registrados FROM aulas WHERE id = @aula_teste;

-- Para testar o erro do trigger quando a aula está cheia, primeiro vamos preencher a aula até o limite
-- Nota: Esta operação pode dar erro se a aula já estiver cheia, o que demonstraria o trigger funcionando
-- (Comentado para evitar erros na execução completa do script)
/*
INSERT INTO agendamentos (id_aula, id_aluno)
SELECT @aula_teste, a.id
FROM alunos a 
LEFT JOIN agendamentos ag ON a.id = ag.id_aluno AND ag.id_aula = @aula_teste
WHERE ag.id IS NULL
LIMIT (SELECT limite_alunos - alunos_registrados FROM aulas WHERE id = @aula_teste);

-- Agora tenta inserir mais um aluno na aula já cheia (deve gerar um erro)
INSERT INTO agendamentos (id_aula, id_aluno) VALUES (@aula_teste, @aluno_teste2);
*/

-- ==========================================
-- TESTE DE VIEWS
-- ==========================================

-- Testando a view vw_aulas_detalhes
SELECT * FROM vw_aulas_detalhes LIMIT 10;

-- Testando a view vw_agendamentos_detalhados
SELECT * FROM vw_agendamentos_detalhados LIMIT 10;

-- Testando a view vw_proximas_aulas
SELECT * FROM vw_proximas_aulas LIMIT 10;

-- ==========================================
-- TESTE DE FUNCTIONS
-- ==========================================

-- Testando a function fn_total_agendamentos_aluno
-- Primeiro, vamos obter o ID de um aluno
SET @id_aluno_teste = (SELECT id FROM alunos WHERE nome = 'João Silva');

-- Agora vamos chamar a função para este aluno
SELECT nome, fn_total_agendamentos_aluno(@id_aluno_teste) AS total_agendamentos
FROM alunos WHERE id = @id_aluno_teste;

-- Testando a function fn_proximas_aulas_professor
-- Primeiro, vamos obter o ID de um professor
SET @id_professor_teste = (SELECT id FROM professores WHERE nome = 'Maria Souza');

-- Agora vamos chamar a função para este professor
SELECT nome, fn_proximas_aulas_professor(@id_professor_teste) AS proximas_aulas
FROM professores WHERE id = @id_professor_teste;

-- Testando a function fn_aluno_agendado
-- Primeiro, vamos obter o ID de uma aula e um aluno
SET @aula_verificar = (SELECT id FROM aulas LIMIT 1);
SET @aluno_verificar = (SELECT id FROM alunos WHERE nome = 'João Silva');

-- Verificando se este aluno está agendado nesta aula
SELECT a.nome AS aluno, 
       DATE_FORMAT(au.data_hora, '%d/%m/%Y %H:%i') AS data_aula, 
       fn_aluno_agendado(@aula_verificar, @aluno_verificar) AS esta_agendado
FROM alunos a, aulas au
WHERE a.id = @aluno_verificar AND au.id = @aula_verificar;

-- Verificando múltiplos alunos em uma aula específica
SELECT a.nome AS aluno, 
       fn_aluno_agendado(@aula_teste, a.id) AS esta_agendado
FROM alunos a
ORDER BY a.nome
LIMIT 10;