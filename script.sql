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
CREATE TABLE calendario(
    id,
    datadecriacao,
);
CREATE TABLE alunos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80),
    enail VARCHAR(80),
    senha VARCHAR(20),
    rg char(9),
    cpf char(11),
    rm char(7)
    data_nascimento TIMESTAMP,
    id_endereco int,
    telefone VARCHAR(13),
    turma VARCHAR(25),
    genero char(1)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_endereco) REFERENCES endereco_aluno(id) ON DELETE CASCADE
);
CREATE TABLE endereco_aluno(
    id int PRIMARY KEY AUTO_INCREMENT,
    cep char(8),
    nome_rua VARCHAR (80),
    numero int,
    complemento varchar(30)
);