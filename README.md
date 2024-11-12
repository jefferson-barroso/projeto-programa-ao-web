
# Projeto Loja (QUERO 4) - CRUD de Clientes

Este projeto é uma aplicação web desenvolvida em Java, utilizando JSP, Servlets e JDBC para realizar operações CRUD (Create, Read, Update, Delete) de uma loja. O projeto permite cadastrar, listar, atualizar e deletar informações de clientes.

## Estrutura do Projeto

- `Controller`: Contém o `LojaServlet`, responsável por controlar as requisições e direcioná-las para as operações apropriadas.
- `DAO`: Contém a classe `LojaDAO` que interage diretamente com o banco de dados para executar as operações CRUD.
- `Model`: Contém a classe `Loja`, que representa a entidade do cliente.
- `src/main/webapp`: Contém as páginas JSP e arquivos de configuração da aplicação.

## Pré-requisitos

Antes de configurar o projeto, certifique-se de ter:

- **Java JDK 8+**
- **Apache Tomcat 9+** (ou outro servidor compatível com Servlets e JSP)
- **MySQL** (ou outro banco de dados configurado)
- **JDBC Driver** para MySQL (ou para o banco de dados que está sendo utilizado)

## Configuração do Banco de Dados

1. Crie um banco de dados MySQL chamado `loja`.
2. Crie a tabela `loja` com o seguinte comando SQL:

   ```sql
   CREATE TABLE loja (
       id INT AUTO_INCREMENT PRIMARY KEY,
       cpf VARCHAR(11) NOT NULL,
       nome VARCHAR(100) NOT NULL,
       telefone VARCHAR(15),
       email VARCHAR(100)
   );
3. Insira as credenciais do banco de dados no arquivo LojaDAO.java, substituindo as variáveis jdbcURL, jdbcUsername e jdbcPassword com suas informações:

private String jdbcURL = "jdbc:mysql://localhost:3307/loja"; <br>
private String jdbcUsername = "root"; <br>
private String jdbcPassword = "12345"; <br>

## Configuração e Execução do Projeto
- Clone o repositório:
    - git clone https://github.com/jefferson-barroso/projeto-programa-ao-web.git
    - cd projeto-programa-ao-web

- Importe o projeto:
- Abra o Eclipse (ou sua IDE Java preferida).
- Importe o projeto como um "Projeto Maven Existente" para garantir que todas as dependências sejam gerenciadas corretamente.
- Configure o servidor:
- Adicione o Apache Tomcat (ou o servidor de sua escolha) ao projeto.
- Verifique se o Tomcat está configurado para rodar na porta 8080 (ou ajuste conforme necessário).
- Execute o projeto:
- Inicie o servidor Tomcat pela IDE.
- Acesse a aplicação em http://localhost:8080/projeto-programa-ao-web/loja?action=list.

## Funcionalidades
- Listar Clientes: Exibe uma lista de todos os clientes cadastrados.
- Cadastrar Cliente: Permite cadastrar um novo cliente.
- Editar Cliente: Permite editar as informações de um cliente existente.
- Deletar Cliente: Permite deletar um cliente do banco de dados.
- Pesquisar: Pesquisa nos registros por nome e CPF;
  
## Estrutura das Páginas JSP
- FormularioCadastro.jsp: Página para cadastrar e editar um cliente. <br>
- lojaListaAtualizada.jsp: Página que exibe a lista de clientes cadastrados e as opções de edição e exclusão. <br>

## Tecnologias Utilizadas
- Java Servlet e JSP para o backend e renderização das páginas.
- JDBC para conexão e operações no banco de dados.
- HTML e Bootstrap para o layout das páginas.
- MySQL como banco de dados.
- javascript
