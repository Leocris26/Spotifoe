<!DOCTYPE <!DOCTYPE html>
<html>
<head>
	<title>Letra</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="../style/basicLetraCancion.css">
	<link rel="shortcut icon" href="../favicon.ico">
</head>
<body>
<?php
	function test_input($data){
		$data = trim($data); //SE DESHACE DE LOS ESPACIOS EN BLANCO AL FINAL
		$data = stripslashes($data); //ELIMINA BACKSLASHES
		$data = htmlspecialchars($data); //CONVIERTE CARACTERES ESPECIALES A ENTIDADES HTML (!!!PREVIENE ATAQUES)
		return $data;
	}

	$tituloCancion = "Cancion de prueba";
	$artistaCancion = "Artista de prueba";
	$letraCancion = "Prueba prueba <br> prueba prueba pruebaaaa";

	if ($_SERVER["REQUEST_METHOD"] == "POST"){
		$seEncontro = false;
		//LEER LOS DATOS
		$tituloCancion = test_input($_POST["titulo"]);
		$artistaCancion = test_input($_POST["artista"]);
		/* IMPORTANTE: CONSEGUIR BASE DE DATOS DE LETRAS
		//REALIZAR LA CONEXION CON LA BASE DE DATOS
		$conn = mysqli_connect("localhost", "root", "", "!!!!!!!!!!!!!!!!!!!!!!!!!!");
		if (!$conn){
			die("Connection Failed ". mysqli_connect_error());
		}
		$tituloCancion = mysqli_real_escape_string($conn, $tituloCancion);
		$artistaCancion = mysqli_real_escape_string($conn, $artistaCancion);
		$consulta = "SELECT letra FROM USUARIO where username = '$txtUser'"; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		$resultadosConsulta = mysqli_query($conn, $consulta);
		if (mysqli_num_rows($resultadosConsulta) == 0){
			$lineaResultado = mysqli_fetch_assoc($resultadosConsulta);
			$letraCancion = $lineaResultado["letra"];	
			$seEncontro = true;
		} else {
			$letraCancion = "Lo sentimos, pero no pudimos encontrar la letra de esa canción";
		}
		
		mysqli_close($conn);	
		*/
	}
?>
<div id="header">
	<p id="titulo"><?php echo $tituloCancion . " - " . $artistaCancion; ?></p><br>
</div>
<div id="contenido">
<p id="letra"> <?php echo $letraCancion; ?> </p>
</div>
</form>
</body>
</html>