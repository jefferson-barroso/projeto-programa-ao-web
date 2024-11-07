<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title> Clientes da Loja - QUERO 4</title></head>
<body>
<h1>Lista de Clientes da Loja - QUERO 4</h1>
<a href="loja?action=new">Novo Cadastro de Cliente</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>CPF</th>
        <th>Nome</th>
        <th>Telefone</th>
        <th>Email</th>
        <th>Ações</th>
    </tr>
    <c:forEach var="loja" items="${listLoja}">
        <tr>
            <td>${loja.id}</td>
            <td>${loja.cpf}</td>
            <td>${loja.nome}</td>
            <td>${loja.telefone}</td>
            <td>${loja.email}</td>
            <td>
                <a href="loja?action=edit&id=${loja.id}">Editar</a> | 
                <a href="loja?action=delete&id=${loja.id}">Deletar</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
