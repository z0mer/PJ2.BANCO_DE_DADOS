# MR -  Modelo Relacional 

```mermaid
erDiagram
    CATEGORIA {
        int ID_Categoria PK
        varchar(100) Nome_Categoria
        varchar(250) Descricao
    }

    EDITORA {
        int ID_Editora PK
        varchar(100) Nome_Editora
        varchar(255) Endereco
        varchar(20) Telefone
    }

    AUTOR {
        int ID_Autor PK
        varchar(100) Nome
        varchar(100) Sobrenome
        date Data_Nascimento
    }

    LIVRO {
        int ID_Livro PK
        varchar(255) Titulo
        varchar(20) ISBN
        int Ano_Publicacao
        int ID_Categoria FK
        int ID_Editora FK
    }

    MEMBRO {
        int ID_Membro PK
        varchar(100) Nome
        varchar(100) Sobrenome
        varchar(100) Email
        date Data_Registro
    }

    EMPRESTIMO {
        int ID_Emprestimo PK
        date Data_Emprestimo
        date Data_Devolucao
        int ID_Membro FK
    }

    LIVRO_AUTOR {
        int ID_Livro FK
        int ID_Autor FK
        int Ordem_Autor
    }

    EMPRESTIMO_LIVRO {
        int ID_Emprestimo FK
        int ID_Livro FK
        int Quantidade
    }

    %% Relacionamentos

    CATEGORIA ||--|{ LIVRO : "possui"
    EDITORA ||--|{ LIVRO : "publica"
    AUTOR ||--|{ LIVRO_AUTOR : "escreve"
    LIVRO ||--|{ LIVRO_AUTOR : "tem"
    MEMBRO ||--o{ EMPRESTIMO : "realiza"
    EMPRESTIMO ||--|{ EMPRESTIMO_LIVRO : "contém"
    LIVRO ||--|{ EMPRESTIMO_LIVRO : "está em"

```
