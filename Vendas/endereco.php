<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro de Endereço</title>
  <link rel="stylesheet" type="text/css" href="styleLogin.css">
</head>
<body>
  <div class="wrapper">
    <div class="form-wrapper sign-in">
      <form action="cadastro_endereco.php" method="POST">
        <h2>Cadastro de Endereço</h2>
        <input type="hidden" name="cliente_id" value="<?php echo $_GET['cliente_id']; ?>">
        <div class="input-group">
          <input type="text" name="logradouro" required>
          <label for="logradouro">Logradouro</label>
        </div>
        <div class="input-group">
          <input type="text" name="numero" required>
          <label for="numero">Número</label>
        </div>
        <div class="input-group">
          <input type="text" name="complemento">
          <label for="complemento">Complemento</label>
        </div>
        <div class="input-group">
          <input type="text" name="bairro" required>
          <label for="bairro">Bairro</label>
        </div>
        <div class="input-group">
          <input type="text" name="cidade" required>
          <label for="cidade">Cidade</label>
        </div>
        <button type="submit">Cadastrar Endereço</button>
      </form>
    </div>
  </div>
  <script src="script.js"></script>
</body>
</html>