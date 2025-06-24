CREATE Database IF NOT EXISTS academia;

USE academia;
-- Habilitar suporte a UUID no MySQL (não é necessário extensão extra)
-- Tabela de alunos
CREATE TABLE alunos (
    id CHAR(36) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100) UNIQUE
);

-- Tabela de professores
CREATE TABLE professores (
    id CHAR(36) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100)
);

-- Tabela de modalidades
CREATE TABLE modalidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela de aulas
CREATE TABLE aulas (
    id CHAR(36) PRIMARY KEY,
    id_modalidade INT,
    id_professor CHAR(36),
    data_hora DATETIME NOT NULL,
    limite_alunos INT NOT NULL,
    alunos_registrados INT NOT NULL DEFAULT 0,
    FOREIGN KEY (id_modalidade) REFERENCES modalidades(id),
    FOREIGN KEY (id_professor) REFERENCES professores(id)
);

-- Tabela de agendamento de alunos em aulas
CREATE TABLE agendamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_aula CHAR(36),
    id_aluno CHAR(36),
    data_agendamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (id_aula, id_aluno),
    FOREIGN KEY (id_aula) REFERENCES aulas(id),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id)
);

