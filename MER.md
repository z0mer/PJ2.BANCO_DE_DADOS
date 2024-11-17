# Modelo Entidade-Relacional

## Entidades

**CATEGORIA**
- `ID_Categoria` (PK)
- `Nome_Categoria`
- `Descricao`

**EDITORA**
- `ID_Editora` (PK)
- `Nome_Editora`
- `Endereco`
- `Telefone`

**AUTOR**
- `ID_Autor` (PK)
- `Nome`
- `Sobrenome`
- `Data_Nascimento`
  
**LIVRO**
- `ID_Livro` (PK)
- `Titulo`
- `ISBN` (único)
- `Ano_Publicacao`
- `ID_Categoria` (FK)
- `ID_Editora` (FK)
  
**MEMBRO**
- `ID_Membro` (PK)
- `Nome`
- `Sobrenome`
- `Email` (único)
- `Data_Registro`
  
**EMPRESTIMO**
- `ID_Emprestimo` (PK)
- `Data_Emprestimo`
- `Data_Devolucao`
- `ID_Membro` (FK)

**LIVRO_AUTOR (Tabela Associativa)**
- `ID_Livro` (FK)
- `ID_Autor` (FK)
- `Ordem_Autor`
  
**EMPRESTIMO_LIVRO (Tabela Associativa)**
- `ID_Emprestimo` (FK)
- `ID_Livro` (FK)
- `Quantidade`

# Diagrama MER

```mermaid
---
title: Modelo Entidade-Relacionamento - Gerenciamento de Biblioteca
---

classDiagram
    class Categoria{
        ID_Categoria PK
        Nome_Categoria
        Descricao
    }

    class Editora{
        ID_Editora PK
        Nome_Editora
        Endereco
        Telefone
    }

    class Autor{
        ID_Autor PK
        Nome
        Sobrenome
        Data_Nascimento
    }

    class Livro{
        ID_Livro PK
        Titulo
        ISBN (único)
        Ano_Publicacao
        ID_Categoria FK
        ID_Editora FK
    }

    class Membro{
        ID_Membro PK
        Nome
        Sobrenome
        Email (único)
        Data_Registro
    }

    class Emprestimo{
        ID_Emprestimo PK
        Data_Emprestimo
        Data_Devolucao
        ID_Membro FK
    }

    class Livro_Autor{
        ID_Livro FK
        ID_Autor FK
        Ordem_Autor
    }

    class Emprestimo_Livro{
        ID_Emprestimo FK
        ID_Livro FK
        Quantidade
    }

    %% Relacionamentos

    Categoria "1" --> "n" Livro : "possui"
    Editora "1" --> "n" Livro : "publica"
    Autor "1" --> "n" Livro_Autor : "escreve"
    Livro "1" --> "n" Livro_Autor : "tem"
    Membro "1" --> "n" Emprestimo : "realiza"
    Emprestimo "1" --> "n" Emprestimo_Livro : "contém"
    Livro "1" --> "n" Emprestimo_Livro : "está em"
```
