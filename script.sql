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
