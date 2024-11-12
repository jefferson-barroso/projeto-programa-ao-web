<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes da Loja QUERO 4</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('https://media4.giphy.com/media/aRZ4vTsHnyW6A/giphy.webp');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            font-family: 'Arial', sans-serif;
            color: #000;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            border-radius: 12px;
            width: 90%;
            max-width: 1000px;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            transform: translateY(30px);
            transition: transform 0.3s ease-in-out;
        }

        .container:hover {
            transform: translateY(0);
        }

        h1 {
            text-align: center;
            font-size: 2.5em;
            color: #000;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            margin-bottom: 20px;
            color: #000000;
            font-size: 1.1em;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #FF0000;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: center;
            font-size: 1.1em;
            color: #000000;
            border: 1px solid #ccc;
        }

        th {
            background: linear-gradient(185deg, #008080, #00FFFF);
            color: #000;
            font-weight: bold;
            letter-spacing: 1px;
        }

        tr:nth-child(even) {
            background-color: #f5f5f5;
        }

        tr:nth-child(odd) {
            background-color: #fafafa;
        }

        td a {
            text-decoration: none;
            font-weight: 500;
            padding: 5px 10px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        td a.edit {
            color: black;
            background-color: #A9A9A9;
            border: 1px solid #A9A9A9;
        }

        td a.edit:hover {
            background-color: #32CD32;
        }

        td a.delete {
            color: black;
            background-color: #A9A9A9;
            border: 1px solid #A9A9A9;
        }

        td a.delete:hover {
            background-color: #FF0000;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
            color: #aaa;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Lista de Clientes da Loja</h1>

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
                    <th>Ações</th>
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
