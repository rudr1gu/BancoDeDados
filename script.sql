-- Tabela Postagem
CREATE TABLE Postagem (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    conteudo TEXT NOT NULL,
    imagem VARCHAR(255),
    qntd_estrelas INT DEFAULT 0,
    autor VARCHAR(100) NOT NULL,
    tags VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabela Comentários
CREATE TABLE Comentarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_postagem INT,
    conteudo TEXT NOT NULL,
    qntd_estrelas INT DEFAULT 0,
    autor VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_postagem) REFERENCES Postagem(id) ON DELETE CASCADE
);

-- Tabela Alunos
CREATE TABLE alunos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80),
    email VARCHAR(80),
    senha VARCHAR(20),
    rg CHAR(9),
    cpf CHAR(11),
    rm CHAR(7)
    data_nascimento DATETIME,
    id_endereco INT,
    telefone VARCHAR(13),
    turma VARCHAR(25),
    genero CHAR(1)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_endereco) REFERENCES endereco_aluno(id) ON DELETE CASCADE
);

-- Endereços Alunos
CREATE TABLE endereco_aluno(
    id INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR(8),
    nome_rua VARCHAR (80),
    numero INT,
    complemento VARCHAR(30)
);

-- Tabela Professor
CREATE TABLE professor(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80),
    email VARCHAR(100),
    senha VARCHAR(30),
    rg char(9),
    cpf char(11),
    cod_professor VARCHAR(80),
    data_nascimento TIMESTAMP,
    id_endereco INT,
    telefone VARCHAR(13),
    genero char(1),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_endereco) REFERENCES endereco_professor(id) ON DELETE CASCADE
 
);

--Tabela Curso
CREATE TABLE curso(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_grade VARCHAR(),
    professor VARCHAR(),
    data_inicio TIMESTAMP,
    duracao VARCHAR(),
    id_turma INT FOREIGN key,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,    
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_turma) REFERENCES turma(id) ON DELETE CASCADE
  FOREIGN KEY (id_grade) REFERENCES grade(id) ON DELETE CASCADE  
);

-- Tabela Turma
CREATE TABLE turma (
    id INT PRIMARY KEY AUTO_INCREMENT,
    turno VARCHAR(30),
    modulo CHAR(5),
    aluno VARCHAR(80),
    id_professor INT,
    curso VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_professor) REFERENCES professor(id) ON DELETE CASCADE
);

--Tabela Grade
create TABLE grade(
    id INT PRIMARY key AUTO_INCREMENT,
    curso VARCHAR(60),
    carga_horaria INT,
);
 