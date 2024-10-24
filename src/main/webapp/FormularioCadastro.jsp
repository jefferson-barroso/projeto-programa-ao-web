<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Cliente</title>
</head>
<body>

<h2>Cadastro de Cliente</h2>
<!-- Aproveitar esse jsp para os dois casos -->
<h1>${loja !=null? 'Editar Cliente': 'Novo Cliente'}</h1>
<form action="loja?action${loja != null ? 'update' : 'insert'  }"  method="get">
	<input type="hidden" name="id" value="${loja != null ? loja.id: ' ' }" />
cpf: <input type="number" name="cpf" value="${loja != null ? loja.cpf: ' ' }" /><br>
nome: <input type="text" name="nome" value="${loja != null ? loja.nome: ' ' }" /><br>
telefone  <input type="number" name="telefone" value="${loja != null ? loja.telefone: ' ' }"/><br>
email: <input type="email" name="email" value="${loja != null ? loja.email: ' ' }" /><br>

<input type="submit" value="Cadastrar">


</form>

<a> href="loja?action=</a>
</body>
</html>