-- Adiciona restrições à tabela aulas

ALTER TABLE aulas
  ADD CONSTRAINT chk_limite_positive CHECK (limite_alunos > 0),
  ADD CONSTRAINT chk_alunos_registrados_nao_negativo CHECK (alunos_registrados >= 0);