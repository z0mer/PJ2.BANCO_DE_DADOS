-- 1. Listar todos os livros com seus autores
SELECT 
    Livro.Titulo AS "Título do Livro", 
    Autor.Nome AS "Nome do Autor", 
    Autor.Sobrenome AS "Sobrenome do Autor"
FROM 
    Livro
JOIN 
    Livro_Autor ON Livro.ID_Livro = Livro_Autor.ID_Livro
JOIN 
    Autor ON Livro_Autor.ID_Autor = Autor.ID_Autor
ORDER BY 
    Livro.Titulo, Livro_Autor.Ordem_Autor;

-- 2. Contar o número de livros por categoria
SELECT 
    Categoria.Nome_Categoria AS "Categoria", 
    COUNT(Livro.ID_Livro) AS "Total de Livros"
FROM 
    Categoria
JOIN 
    Livro ON Categoria.ID_Categoria = Livro.ID_Categoria
GROUP BY 
    Categoria.Nome_Categoria
ORDER BY 
    "Total de Livros" DESC;

-- 3. Listar os 5 livros mais emprestados
SELECT 
    Livro.Titulo AS "Título do Livro",
    COUNT(Emprestimo_Livro.ID_Emprestimo) AS "Número de Empréstimos"
FROM 
    Livro
JOIN 
    Emprestimo_Livro ON Livro.ID_Livro = Emprestimo_Livro.ID_Livro
GROUP BY 
    Livro.ID_Livro
ORDER BY 
    "Número de Empréstimos" DESC
LIMIT 5;

-- 4. Listar os autores com mais livros emprestados
SELECT 
    Autor.Nome AS "Nome do Autor", 
    Autor.Sobrenome AS "Sobrenome do Autor", 
    COUNT(Emprestimo_Livro.ID_Emprestimo) AS "Total de Empréstimos"
FROM 
    Autor
JOIN 
    Livro_Autor ON Autor.ID_Autor = Livro_Autor.ID_Autor
JOIN 
    Emprestimo_Livro ON Livro_Autor.ID_Livro = Emprestimo_Livro.ID_Livro
GROUP BY 
    Autor.ID_Autor
ORDER BY 
    "Total de Empréstimos" DESC;

-- 5. Listar todos os empréstimos e os livros correspondentes
SELECT 
    Emprestimo.ID_Emprestimo AS "ID do Empréstimo",
    Membro.Nome AS "Nome do Membro", 
    Membro.Sobrenome AS "Sobrenome do Membro", 
    Livro.Titulo AS "Título do Livro", 
    Emprestimo_Livro.Quantidade AS "Quantidade"
FROM 
    Emprestimo
JOIN 
    Membro ON Emprestimo.ID_Membro = Membro.ID_Membro
JOIN 
    Emprestimo_Livro ON Emprestimo.ID_Emprestimo = Emprestimo_Livro.ID_Emprestimo
JOIN 
    Livro ON Emprestimo_Livro.ID_Livro = Livro.ID_Livro
ORDER BY 
    Emprestimo.ID_Emprestimo, Livro.Titulo;

-- 6. Listar os membros que mais emprestaram livros
SELECT 
    Membro.Nome AS "Nome do Membro", 
    Membro.Sobrenome AS "Sobrenome do Membro",
    COUNT(Emprestimo.ID_Emprestimo) AS "Total de Empréstimos"
FROM 
    Membro
JOIN 
    Emprestimo ON Membro.ID_Membro = Emprestimo.ID_Membro
GROUP BY 
    Membro.ID_Membro
ORDER BY 
    "Total de Empréstimos" DESC
LIMIT 5;

-- 7. Listar editoras e o número de livros publicados por cada uma
SELECT 
    Editora.Nome_Editora AS "Editora", 
    COUNT(Livro.ID_Livro) AS "Total de Livros Publicados"
FROM 
    Editora
JOIN 
    Livro ON Editora.ID_Editora = Livro.ID_Editora
GROUP BY 
    Editora.ID_Editora
ORDER BY 
    "Total de Livros Publicados" DESC;

-- 8. Obter a data de registro e o número de empréstimos de cada membro
SELECT 
    Membro.Nome AS "Nome do Membro", 
    Membro.Sobrenome AS "Sobrenome do Membro", 
    Membro.Data_Registro AS "Data de Registro", 
    COUNT(Emprestimo.ID_Emprestimo) AS "Total de Empréstimos"
FROM 
    Membro
LEFT JOIN 
    Emprestimo ON Membro.ID_Membro = Emprestimo.ID_Membro
GROUP BY 
    Membro.ID_Membro
ORDER BY 
    "Total de Empréstimos" DESC;

-- 9. Listar os membros que mais emprestaram livros em um período específico
SELECT 
    Membro.Nome AS "Nome do Membro", 
    Membro.Sobrenome AS "Sobrenome do Membro",
    COUNT(Emprestimo.ID_Emprestimo) AS "Total de Empréstimos"
FROM 
    Membro
JOIN 
    Emprestimo ON Membro.ID_Membro = Emprestimo.ID_Membro
WHERE 
    Emprestimo.Data_Emprestimo BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY 
    Membro.ID_Membro
ORDER BY 
    "Total de Empréstimos" DESC;

-- 10. Analisar a distribuição de livros por ano de publicação
SELECT 
    Ano_Publicacao AS "Ano de Publicação",
    COUNT(ID_Livro) AS "Número de Livros"
FROM 
    Livro
GROUP BY 
    Ano_Publicacao
ORDER BY 
    Ano_Publicacao ASC;
