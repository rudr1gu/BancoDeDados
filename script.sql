CREATE DATABASE Rede_de_Apoio;

USE Rede_de_Apoio;

-- Tabela Aluno
CREATE TABLE Aluno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(60) NOT NULL,
    rg CHAR(9),
    cpf CHAR(11),
    matricula CHAR(7),
    data_nascimento DATE,
    id_endereco INT,
    telefone VARCHAR(15),
    turma VARCHAR(50),
    genero CHAR(1),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_endereco) REFERENCES Endereco_Aluno(id) ON DELETE CASCADE
);

-- Tabela Endereco_Aluno
CREATE TABLE Endereco_Aluno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8),
    rua VARCHAR(100),
    numero INT,
    complemento VARCHAR(50)
);

-- Tabela Professor
CREATE TABLE Professor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(60) NOT NULL,
    rg CHAR(9),
    cpf CHAR(11),
    codigo_professor VARCHAR(50),
    data_nascimento DATE,
    id_endereco INT,
    telefone VARCHAR(15),
    genero CHAR(1),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_endereco) REFERENCES Endereco_Professor(id) ON DELETE CASCADE
);


-- Tabela Endereco_Professor
CREATE TABLE Endereco_Professor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8),
    rua VARCHAR(100),
    numero INT,
    complemento VARCHAR(50)
);


-- Tabela Curso
CREATE TABLE Curso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_grade INT,
    nome_professor VARCHAR(100),
    data_inicio DATE,
    carga_horaria INT, 
    id_turma INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_turma) REFERENCES Turma(id) ON DELETE CASCADE,
    FOREIGN KEY (id_grade) REFERENCES Grade(id) ON DELETE CASCADE  
);

-- Tabela Turma
CREATE TABLE Turma (
    id INT PRIMARY KEY AUTO_INCREMENT,
    turno VARCHAR(50),
    modulo VARCHAR(10),
    id_aluno INT,
    id_professor INT,
    nome_curso VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_professor) REFERENCES Professor(id) ON DELETE CASCADE
);

-- Tabela Grade
CREATE TABLE Grade (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100),
    carga_horaria INT
);

-- Tabela Postagem
CREATE TABLE Postagem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    conteudo TEXT NOT NULL,
    url_imagem VARCHAR(255),
    quantidade_estrelas INT DEFAULT 0,
    nome_autor VARCHAR(100),
    tags VARCHAR(100),
    id_aluno INT,
    id_professor INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id) ON DELETE CASCADE,
    FOREIGN KEY (id_professor) REFERENCES Professor(id) ON DELETE CASCADE
);

-- Tabela Comentario
CREATE TABLE Comentario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_postagem INT,
    conteudo TEXT NOT NULL,
    quantidade_estrelas INT DEFAULT 0,
    nome_autor VARCHAR(100),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_postagem) REFERENCES Postagem(id) ON DELETE CASCADE
);