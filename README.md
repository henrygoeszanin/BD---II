# Documentação do Banco de Dados - Academia

## Visão Geral
Este projeto implementa o banco de dados de uma academia, permitindo o cadastro de alunos, professores, modalidades, aulas, agendamentos, além de funções, views e triggers para facilitar operações e garantir regras de negócio.

## Estrutura das Tabelas
- **alunos**: Armazena informações dos alunos (id, nome, data de nascimento, email).
- **professores**: Dados dos professores (id, nome, especialidade).
- **modalidades**: Modalidades de atividades oferecidas (id, nome).
- **aulas**: Aulas agendadas, com referência à modalidade e professor, data/hora, limite e total de alunos registrados.
- **agendamentos**: Relaciona alunos às aulas, registrando inscrições.

## Procedures
- **sp_agendar_aluno**: Realiza o agendamento de um aluno em uma aula, verificando a disponibilidade de vagas.

## Constraints
- **chk_limite_positive**: Garante que o limite de alunos em uma aula seja sempre um número positivo.
- **chk_alunos_registrados_nao_negativo**: Assegura que o número de alunos registrados não seja negativo.

## Triggers
- **before_insert_agendamento**: Garante que o número de alunos em uma aula não ultrapasse o limite definido. Impede agendamento se a aula estiver cheia.

## Funções
- **fn_total_agendamentos_aluno**: Retorna o total de agendamentos de um aluno.
- **fn_proximas_aulas_professor**: Retorna o total de próximas aulas de um professor.
- **fn_aluno_agendado**: Verifica se um aluno está agendado em uma aula específica.

## Views
- **vw_aulas_detalhes**: Lista aulas com detalhes de professor e modalidade.
- **vw_agendamentos_detalhados**: Mostra agendamentos com informações completas de aluno, aula, modalidade e professor.
- **vw_proximas_aulas**: Exibe apenas as aulas futuras.

## Scripts SQL
- **academia.init.sql**: Criação do banco e tabelas.
- **academia.triggers.sql**: Criação dos triggers.
- **academia.functions.sql**: Criação das funções auxiliares.
- **academia.views.sql**: Criação das views.
- **academia.procedure.sql**: Criação das procedures.
- **academia.constraints.sql**: Criação das restrições.
- **academia.crud.sql**: Exemplos de operações CRUD e inserção de dados.

## Execução
Consulte o arquivo `sequencia de execucao.md` para a ordem correta de execução dos scripts e inicialização do ambiente Docker.

## Observações
- Chaves Primárias:
  - **alunos**: `id` (UUID - CHAR(36))
  - **professores**: `id` (UUID - CHAR(36))
  - **aulas**: `id` (UUID - CHAR(36))
  - **modalidades**: `id` (INT AUTO_INCREMENT)
  - **agendamentos**: `id` (INT AUTO_INCREMENT)
- O ambiente padrão utiliza MySQL.