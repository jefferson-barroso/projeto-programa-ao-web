<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="pt-br">
<head>
    <!-- Definindo o conjunto de caracteres para a p�gina -->
    <meta charset="UTF-8">
    <!-- Tornando o site responsivo, ajustando a escala conforme o dispositivo -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes da Loja QUERO 4</title>

    <style>
        /* Resetando margens e padding padr�o para garantir um layout consistente */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box; /* A caixa de cada elemento inclui border e padding */
        }

        /* Estilo do corpo da p�gina */
        body {
            display: flex; /* Usando flexbox para centralizar o conte�do */
            justify-content: center; /* Alinha horizontalmente no centro */
            align-items: center; /* Alinha verticalmente no centro */
            background-color: #f8f9fa; /* Cor de fundo suave para o body */
            background-image: url('https://media4.giphy.com/media/aRZ4vTsHnyW6A/giphy.webp'); /* Imagem de fundo */
            background-size: cover; /* Faz com que a imagem de fundo cubra toda a tela */
            background-position: center; /* Centraliza a imagem de fundo */
            background-repeat: no-repeat; /* Impede que a imagem se repita */
            font-family: 'Arial', sans-serif; /* Fonte limpa e leg�vel */
            color: #000; /* Cor preta para o texto */
            height: 100vh; /* A altura do body � 100% da altura da viewport */
            margin: 0; /* Remove as margens padr�o do body */
        }

        /* Container que centraliza o conte�do */
        .container {
            background-color: #ffffff; /* Fundo branco para o container */
            border-radius: 12px; /* Bordas arredondadas */
            width: 90%; /* Largura do container ocupa 90% da tela */
            max-width: 1000px; /* Tamanho m�ximo de 1000px */
            padding: 30px; /* Espa�amento interno */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Sombra suave ao redor do container */
            overflow: hidden; /* Impede que o conte�do transborde do container */
            transform: translateY(30px); /* Desloca o container ligeiramente para baixo inicialmente */
            transition: transform 0.3s ease-in-out; /* Transi��o suave para o efeito de hover */
        }

        /* Efeito de anima��o no hover para o container */
        .container:hover {
            transform: translateY(0); /* Ao passar o mouse, o container volta � posi��o original */
        }

        /* Estilo do t�tulo principal */
        h1 {
            text-align: center; /* Alinha o t�tulo ao centro */
            font-size: 2.5em; /* Tamanho grande para o t�tulo */
            color: #000; /* Cor preta para o t�tulo */
            margin-bottom: 20px; /* Espa�o abaixo do t�tulo */
        }

        /* Estilo do link para o novo cadastro de cliente */
        a {
            display: inline-block; /* Torna o link um bloco inline */
            margin-bottom: 20px; /* Espa�o abaixo do link */
            color: #000000; /* Cor preta para o link */
            font-size: 1.1em; /* Tamanho de fonte maior para o link */
            text-decoration: none; /* Remove o sublinhado do link */
            font-weight: 600; /* Deixa o texto do link em negrito */
            transition: color 0.3s ease; /* Transi��o suave para a cor */
        }

        /* Efeito de hover no link */
        a:hover {
            color: #FF0000; /* Muda a cor para vermelho quando o mouse passa sobre o link */
        }

        /* Estilo para a tabela de clientes */
        table {
            width: 100%; /* Tabela ocupa 100% da largura do container */
            border-collapse: collapse; /* Remove espa�amento entre as c�lulas */
            margin-top: 20px; /* Espa�o acima da tabela */
        }

        th, td {
            padding: 12px; /* Espa�amento interno nas c�lulas */
            text-align: center; /* Centraliza o texto nas c�lulas */
            font-size: 1.1em; /* Tamanho da fonte um pouco maior nas c�lulas */
            color: #000000; /* Cor preta para o texto nas c�lulas */
            border: 1px solid #ccc; /* Borda fina de cor cinza entre as c�lulas */
        }

        /* Estilo do cabe�alho da tabela */
        th {
            background: linear-gradient(185deg, #008080, #00FFFF); /* Gradiente de cores no cabe�alho */
            color: #000; /* Cor preta para o texto do cabe�alho */
            font-weight: bold; /* Negrito para o texto do cabe�alho */
            letter-spacing: 1px; /* Aumenta o espa�amento entre as letras */
        }

        /* Estilo para linhas alternadas da tabela */
        tr:nth-child(even) {
            background-color: #f5f5f5; /* Cor de fundo clara para linhas pares */
        }

        tr:nth-child(odd) {
            background-color: #fafafa; /* Cor de fundo mais clara para linhas �mpares */
        }

        /* Estilo para os links de a��o (editar e deletar) */
        td a {
            text-decoration: none; /* Remove o sublinhado */
            font-weight: 500; /* Peso da fonte para o link */
            padding: 5px 10px; /* Espa�amento interno para os links */
            border-radius: 5px; /* Borda arredondada nos links */
            transition: all 0.3s ease; /* Transi��o suave para os links */
        }

        /* Estilo para o bot�o de editar */
        td a.edit {
            color: black;
            background-color: #A9A9A9; /* Cor de fundo cinza para editar */
            border: 1px solid #A9A9A9; /* Borda cinza */
        }

        td a.edit:hover {
            background-color: #32CD32; /* Muda para verde claro ao passar o mouse */
        }

        /* Estilo para o bot�o de deletar */
        td a.delete {
            color: black;
            background-color: #A9A9A9; /* Cor de fundo cinza para deletar */
            border: 1px solid #A9A9A9; /* Borda cinza */
        }

        td a.delete:hover {
            background-color: #FF0000; /* Muda para vermelho ao passar o mouse */
        }

        /* Estilo do rodap� ou informa��es adicionais */
        .footer {
            text-align: center; /* Centraliza o texto */
            margin-top: 30px; /* Espa�o acima do rodap� */
            color: #aaa; /* Cor de texto suave */
            font-size: 0.9em; /* Tamanho menor para o rodap� */
        }

    </style>
</head>
<body>
    <div class="container">
        <h1>Lista de Clientes da Loja</h1>

        <!-- Formul�rio de pesquisa -->
        <form action="loja" method="get" style="text-align: center; margin-bottom: 20px;">
            <input type="hidden" name="action" value="search">
            <input type="text" name="query" placeholder="Pesquisar por Nome ou CPF" required>
            <button type="submit">Pesquisar</button>
        </form>

        <div style="text-align: center;">
            <a href="loja?action=new">Novo Cadastro de Cliente</a>
        </div>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>CPF</th>
                    <th>Nome</th>
                    <th>Telefone</th>
                    <th>Email</th>
                    <th>A��es</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="loja" items="${listLoja}">
                    <tr>
                        <td>${loja.id}</td>
                        <td>${loja.cpf}</td>
                        <td>${loja.nome}</td>
                        <td>${loja.telefone}</td>
                        <td>${loja.email}</td>
                        <td>
                            <a href="loja?action=edit&id=${loja.id}" class="edit">Editar</a> | 
                            <a href="loja?action=delete&id=${loja.id}" class="delete">Deletar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>