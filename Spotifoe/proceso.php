<!DOCTYPE HTML>
<html>
<head>
	<title>
		Pagina Principal
	</title>
</head>
<body>
	<?php
	include("Conexion.php");

	
	if(isset($_POST['Usuario']) && !empty($_POST['Usuario']) 
		&& isset($_POST['Password']) && !empty($_POST['Password']))
	{
		$usuario = $_POST['Usuario'];
		$contrasenia = $_POST['Password'];

		$con = mysqli_connect($host,$user,$pw,$dbname) or die("Problemas al conectar");

		$query = mysqli_query($con,"SELECT USERNAME,PASSWORD FROM usuario WHERE USERNAME='$usuario' AND PASSWORD='$contrasenia'");

		

		if(mysqli_num_rows($query) == 1)
		{
			echo "Iniciaste Sesion";

		}
		else
		{
			echo "Usuario y Contrasenia Incorrectos";	
		}

	}
	elseif (isset($_POST['btnreg']))
	{
		header("Location:RegUs.php");
	}
	else
	{
		echo "Vuelve a la pagina anterior y llena tus datos...";
	}
	?>
</body>
</html>