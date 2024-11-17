-- Criação da Tabela Categoria
CREATE TABLE Categoria (
    ID_Categoria INTEGER PRIMARY KEY,
    Nome_Categoria VARCHAR(100) NOT NULL,
    Descricao TEXT
);

-- Criação da Tabela Editora
CREATE TABLE Editora (
    ID_Editora INTEGER PRIMARY KEY,
    Nome_Editora VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(20)
);

-- Criação da Tabela Livro
CREATE TABLE Livro (
    ID_Livro INTEGER PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Ano_Publicacao INTEGER,
    ID_Categoria INTEGER,
    ID_Editora INTEGER,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria),
    FOREIGN KEY (ID_Editora) REFERENCES Editora(ID_Editora)
);

-- Criação da Tabela Autor
CREATE TABLE Autor (
    ID_Autor INTEGER PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Sobrenome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE
);

-- Criação da Tabela Membro
CREATE TABLE Membro (
    ID_Membro INTEGER PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Sobrenome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Data_Registro DATE
);

-- Criação da Tabela Emprestimo
CREATE TABLE Emprestimo (
    ID_Emprestimo INTEGER PRIMARY KEY,
    Data_Emprestimo DATE NOT NULL,
    Data_Devolucao DATE,
    ID_Membro INTEGER,
    FOREIGN KEY (ID_Membro) REFERENCES Membro(ID_Membro)
);

-- Criação da Tabela Associativa Livro_Autor
CREATE TABLE Livro_Autor (
    ID_Livro INTEGER,
    ID_Autor INTEGER,
    Ordem_Autor INTEGER,
    PRIMARY KEY (ID_Livro, ID_Autor),
    FOREIGN KEY (ID_Livro) REFERENCES Livro(ID_Livro),
    FOREIGN KEY (ID_Autor) REFERENCES Autor(ID_Autor)
);

-- Criação da Tabela Associativa Emprestimo_Livro
CREATE TABLE Emprestimo_Livro (
    ID_Emprestimo INTEGER,
    ID_Livro INTEGER,
    Quantidade INTEGER,
    PRIMARY KEY (ID_Emprestimo, ID_Livro),
    FOREIGN KEY (ID_Emprestimo) REFERENCES Emprestimo(ID_Emprestimo),
    FOREIGN KEY (ID_Livro) REFERENCES Livro(ID_Livro)
);
