<!DOCTYPE <!DOCTYPE html>
<html>
<head>
	<title>Registrarse</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="style/basic.css">
	<link rel="shortcut icon" href="favicon.ico">
</head>
<body>
<?php
	function test_input($data){
		$data = trim($data); //SE DESHACE DE LOS ESPACIOS EN BLANCO AL FINAL
		$data = stripslashes($data); //ELIMINA BACKSLASHES
		$data = htmlspecialchars($data); //CONVIERTE CARACTERES ESPECIALES A ENTIDADES HTML (!!!PREVIENE ATAQUES)
		return $data;
	}

	$errNombre = $errUser = $errPass = $errPass2 = $errEmail = $errEmail2 = $errFecha = $errGenero = "";
	$txtNombre = $txtUser = $txtPass = $txtEmail = $txtFecha = "";

	if ($_SERVER["REQUEST_METHOD"] == "POST"){
		$valido = true;
		//LEER LOS DATOS
		if (empty($_POST["txNombre"])){
			$errNombre = "";
		} else {
			$txtNombre = test_input($_POST["txNombre"]);	
		}
		if (empty($_POST["txUser"])){
			$errUser = "El nombre de usuario es requerido";
			$valido = false;
		} else {
			$txtUser = test_input($_POST["txUser"]);	
		}
		if (empty($_POST["txPass"])){
			$errPass = "La contraseña es requerida";
			$valido = false;
		} else if ($_POST["txPass"] == $_POST["txPass2"]){
			$txtPass = test_input($_POST["txPass"]);
		} else {
			$errPass2 = "Las contraseñas no coinciden";
			$valido = false;
		}
		if (empty($_POST["txEmail"])){
			$errEmail = "El email es requerido";
			$valido = false;
		} else if ($_POST["txEmail"] == $_POST["txEmail2"]){
			$txtEmail = test_input($_POST["txEmail"]);
			if (!filter_var($txtEmail, FILTER_VALIDATE_EMAIL)){
				$errEmail = "Ingresa un email valido";
				$valido = false;
			}
		} else {
			$errEmail2 = "Los emails no coinciden";
			$valido = false;
		}
		if (empty($_POST["txYear"]) or empty($_POST["txMes"]) or empty($_POST["txDia"])){
			$errFecha = "Ingrese una fecha valida";
			$valido = false;
		} else {
			$txtFecha = test_input($_POST["txYear"] . "-" . $_POST["txMes"] . "-" . $_POST["txDia"]);
		}
		if (empty($_POST["txGenero"])){
			$errGenero = "El genero es requerido";
			$valido = false;
		} else {
			$txtGenero = test_input($_POST["txGenero"]);
		}
		if ($valido){
			//REALIZAR LA CONEXION CON LA BASE DE DATOS
			include("Conexion.php");
			$conn = mysqli_connect($host, $user, $pw, $dbname);
			if (!$conn){
				die("Connection Failed ". mysqli_connect_error());
			}
			//echo "Connected successfully <br>";
			$txtNombre = mysqli_real_escape_string($conn, $txtNombre);
			$txtUser = mysqli_real_escape_string($conn, $txtUser);
			$txtPass = mysqli_real_escape_string($conn, $txtPass);
			$txtEmail = mysqli_real_escape_string($conn, $txtEmail);
			$txtFecha = mysqli_real_escape_string($conn, $txtFecha);
			$txtGenero = mysqli_real_escape_string($conn, $txtGenero);
			$test = "SELECT userid FROM USUARIO where username = '$txtUser'";
			$testr = mysqli_query($conn, $test);
			if (mysqli_num_rows($testr) == 0){
				$sql = "INSERT INTO USUARIO VALUES('',
				'$txtNombre', 
				'$txtUser', 
				'$txtPass', 
				'$txtEmail', 
				'$txtFecha',
				$txtGenero);";
				if (mysqli_query($conn, $sql)){
					//AGREGADO CORRECTAMENTE
					//¡¡¡¡¡¡¡¡¡¡ABRIR PAGINA DE INICIAR SESION!!!!!!!!!! xdxdxd
					header("Location:Inicio.html");
				} else {
					//echo "Error " . $sql . "<br>" . mysqli_error($conn);
				}	
			} else {
				$errUser = "El nombre de usuario ya existe";
			}
			
			mysqli_close($conn);	
		}
		

	}
?>
<div id="header">
	<p id="titulo">Disfruta de una biblioteca de música por Internet</p><br>
</div>
<div id="contenido">
<div id="imagen">
	<img src="images/imagen.png" width="200px" height="200px">
</div>
<form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method="post">
	<div id="inputs">
	<input type="text" class="texto" name="txNombre" placeholder="Nombre" value="<?php echo $txtNombre; ?>"><br>
	<span class="error"><?php echo $errNombre; ?></span><br>
	<input type="text" class="texto" name="txUser" placeholder="Usuario" value="<?php echo $txtUser; ?>"><br>
	<span class="error"><?php echo $errUser; ?></span><br>
	<input type="password" class="texto" name="txPass" placeholder="Contraseña"><br>
	<span class="error"><?php echo $errPass; ?></span><br>
	<input type="password" class="texto" name="txPass2" placeholder="Confirmar contraseña"><br>
	<span class="error"><?php echo $errPass2; ?></span><br>
	<input type="text" class="texto" name="txEmail" placeholder="Email" value="<?php echo $txtEmail; ?>"><br>
	<span class="error"><?php echo $errEmail; ?></span><br>
	<input type="text" class="texto" name="txEmail2" placeholder="Confirmar email"><br>
	<span class="error"><?php echo $errEmail2; ?></span><br>
	Fecha de Nacimiento:<br> 
	<input type="number" id="numeroDia" name="txDia" placeholder="Día" min="1" max="31" value="<?php echo substr($txtFecha, 8, 2);?>">
	<select name="txMes" class="numero">
		<option value selected disabled>Mes</option>
		<option value=01 <?php if (!empty($txtFecha) and substr($txtFecha, 5, 2) == 01) echo "selected"; ?>>Enero</option>
		<option value=02 <?php if (!empty($txtFecha) and substr($txtFecha, 5, 2) == 02) echo "selected"; ?>>Febrero</option>
		<option value=03 <?php if (!empty($txtFecha) and substr($txtFecha, 5, 2) == 03) echo "selected"; ?>>Marzo</option>
		<option value=04 <?php if (!empty($txtFecha) and substr($txtFecha, 5, 2) == 04) echo "selected"; ?>>Abril</option>
		<option value=05 <?php if (!empty($txtFecha) and substr($txtFecha, 5, 2) == 05) echo "selected"; ?>>Mayo</option>
		<option value=06 <?php if (!empty($txtFecha) and substr($txtFecha, 5, 2) == 06) echo "selected"; ?>>Junio</option>
		<option value=07 <?php if (!empty($txtFecha) and substr($txtFecha, 5, 2) == 07) echo "selected"; ?>>Julio</option>
		<option value=08 <?php if (!empty($txtFecha) and substr($txtFecha, 5, 2) == 08) echo "selected"; ?>>Agosto</option>
		<option value=09 <?php if (!empty($txtFecha) and substr($txtFecha, 5, 2) == 09) echo "selected"; ?>>Septiembre</option>
		<option value=10 <?php if (!empty($txtFecha) and substr($txtFecha, 5, 2) == 10) echo "selected"; ?>>Octubre</option>
		<option value=11 <?php if (!empty($txtFecha) and substr($txtFecha, 5, 2) == 11) echo "selected"; ?>>Noviembre</option>
		<option value=12 <?php if (!empty($txtFecha) and substr($txtFecha, 5, 2) == 12) echo "selected"; ?>>Diciembre</option>
	</select>
	<input type="number" class="numero" name="txYear" placeholder="Año" min="1900" max="2003" value="<?php echo substr($txtFecha, 0, 4);?>"><br>
	<span class="error"><?php echo $errFecha; ?></span>
	<br>
	Masculino <input type="radio" name="txGenero" <?php if (isset($txtGenero) and $txtGenero) echo "checked"; ?> value=true>
	Femenino <input type="radio" name="txGenero" <?php if (isset($txtGenero) and !$txtGenero) echo "checked"; ?> value=false><br>
	<span class="error"><?php echo $errGenero; ?></span><br><br>
	<input class="boton" type="submit" value="Registrarse">
	</div>
</div>
</form>
</body>
</html>