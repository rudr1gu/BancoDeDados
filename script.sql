-- Criação da tabela
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    email VARCHAR(100)
);

-- Inserção de dados na tabela
INSERT INTO clientes (id, nome, idade, email)
VALUES (1, 'João', 25, 'joao@email.com'),
       (2, 'Maria', 30, 'maria@email.com');

-- Consulta dos dados na tabela
SELECT * FROM clientes;

-- Atualização de um registro na tabela
UPDATE clientes
SET idade = 35
WHERE id = 1;

-- Exclusão de um registro na tabela
DELETE FROM clientes
WHERE id = 2;