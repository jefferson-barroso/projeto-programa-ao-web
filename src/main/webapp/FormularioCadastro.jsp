<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
      integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
      crossorigin="anonymous">
      
<title>Cadastro de Cliente</title>
 <style>
        /* CSS atualizado */
        html, body {
            height: 100%;
            margin: ;
            padding: 0;
        }

        body {
            display: flex;
            justify-content: center;    
            align-items: center;
            background-color: #f8f9fa;
             background-image: url('https://media4.giphy.com/media/aRZ4vTsHnyW6A/giphy.webp?cid=790b7611bx0haop6cnvkcvzk7x23f9niaryf38vwbtdrwsde&ep=v1_gifs_search&rid=giphy.webp&ct=g');
		    background-size: cover;     
		    background-position: center; 
		    background-repeat: no-repeat;
        }

        .wrapper {
            width: 100%;
            max-height: 100%;            
            padding: 5rem 0;             
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            width: 25rem;
            margin-top: 10rem;
            margin-bottom: 5rem;
        }

        .card-img-top {
            width: 50%;
            margin: 0 auto;
            display: block;
            padding-top: 15px;
        }

        input[type=number]::-webkit-outer-spin-button,
        input[type=number]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        input[type=number] {
            -moz-appearance: textfield;
        }
    </style>
</head>
<body>


<div class="card text-center">
  <img class="card-img-top" src="imagem/logo.png" alt="Imagem de capa do card">
  <div class="card-body">
  
  
    <h2>Cadastro de Cliente</h2>
    <h1>${loja != null ? 'Editar Cliente' : 'Novo Cliente'}</h1>
    <form action="loja?action=${loja != null ? 'update' : 'insert'}" method="get">
    <div class="form-group">
        <label for="nome">Nome:</label>
        <input type="text" class="form-control" name="nome" 
               value="${loja != null ? loja.nome : ''}"  />
      </div>
      <input type="hidden" name="id" value="${loja != null ? loja.id : ''}" />
      <div class="form-group">
        <label for="cpf">CPF:</label>
        <input type="number" class="form-control" name="cpf" 
               value="${loja != null ? loja.cpf : ''}"    pattern="\d{11}" 
         maxlength="11" 
         title="O CPF deve ter exatamente 11 dígitos" required/>
      </div>
      
      <div class="form-group">
        <label for="telefone">Telefone:</label>
        <input type="number" class="form-control" placeholder="99 999999999" name="telefone" 
               value="${loja != null ? loja.telefone : ''}"  />
      </div>
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" class="form-control" name="email" 
               value="${loja != null ? loja.email : ''}"  />
      </div>
      <button type="submit" class="btn btn-primary">Cadastrar</button>
    </form>
  </div>
</div>


<a> href="loja?action=</a>

</body>
</html>
