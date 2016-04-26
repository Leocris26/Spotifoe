<!DOCTYPE html>
<html>
<head>
	<title>
		Buscador
	</title>
	<link rel = "stylesheet" href = "style/formato.css">
	<meta http-equiv="Content-Type" contents="text/html; charset=UTF-8">
</head>
<body
	class = "fondo;">
	<?php

	$host = "localhost";
	$dbname = "musica";
	$username = "root";
	$PASSWORD = "";


	$Nombre = $_POST["buscador"];
	$Album = $_POST["buscador"];


		//Seleccionar el servidor:
	$connection = mysqli_connect($host, $username, $PASSWORD, $dbname) or die ("No se pudo conectar con el servidor de la BD.");
	echo "Conexion establecida a MySQL<br />";

	//Seleccionar la BD con la que vamos a trabajar:
	//mysql_select_db($dbname, $connection) or die ("La BD no existe.");
	
	echo "BD selecconada: " . " " . $dbname. "<br />";


	if ($_POST["buscador"] == $Nombre)
	{
		echo "<h4> BUSCANDO...</h4>";
		$consulta = "SELECT * FROM CANCION WHERE Nombre = '$Nombre'";

		//PARA EJECUTAR LA CONSULTA:
		$ejecutar_consulta = mysqli_query($connection, $consulta) or die ("No se pudo ejecutar la consulta en la BD.");
		echo "Resultados De Busqueda: <br />";
		echo "    <br />";

		//mostrar el resultado de la consulta, dentro de un ciclo y en una variable ingresamos la funcion mySQL fetch array (la ejecicion dela consulta la guarda en un arreglo)
		while ($registro = mysqli_fetch_array($ejecutar_consulta))
		{
			echo $registro["Cod_cancion"]. " - " . $registro["Nombre"] . "<br />";
			echo "Album: ". $registro["Cod_album"]. "   ". $registro["Fecha_lan"]. "<br />";
		}
	}

	else if($_POST["buscador"] == $Album)
	{
		echo "<h4> BUSCANDO...</h4>";
		$consulta = "SELECT * FROM ALBUM WHERE Nombre = '$Album'";

		//PARA EJECUTAR LA CONSULTA:
		$ejecutar_consulta = mysqli_query($connection, $consulta) or die ("No se pudo ejecutar la consulta en la BD.");
		echo "Resultados De Busqueda: <br />";
		echo "    <br />";

		//mostrar el resultado de la consulta, dentro de un ciclo y en una variable ingresamos la funcion mySQL fetch array (la ejecicion dela consulta la guarda en un arreglo)
		while ($registro = mysqli_fetch_array($ejecutar_consulta))
		{
			echo $registro["Cod_album"]. " - " . $registro["Nombre"] . "<br />";
			echo "Año: ". $registro["Ano"]. "   ". $registro["Fecha_lan"]. "<br />";
		}
	}


	













/*	$sql = "SELECT * FROM CANCIONES";
$result = $connection->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo $row["CODIGO"]. " - " . $row["NOMBRE"]. "  Album: " . $row["ALBUM"]."  ". $row["ANIO"]. "<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>

*/








/*	if ($_POST["Buscar"])
	{
		$consulta = "SELECT * 
					FROM CANCION
					WHERE NOMBRE == $_POST[nombre]";

		$ejecutar_consulta = mysql_query($consulta, $connection); or die ("No se pudo ejecutar la consulta en la BD");
		echo "Consulta ejecutada:". " ". $consulta. " <br />";
	}
	else 
	{
		?>
		<form action = "post.php" method = "post">
			<p>
				Buscar: <input nCancion = "nombre" type = "text"/> 
			</p>
	
			<p>
				<input name = "Buscar" value = "Enviar datos" type = "submit" />
			</p>
		</form>
		<?php			














	
	public Cancion Buscar($NombreCancion)
	{
		/*Cancion $resultado = null;

		ResultSet $rs = null;
		
		miSQL.abrir();

		$consulta = "SELECT * 
					FROM CANCION"
					WHERE NOMBRE == $NombreCancion;

		$ejecutar_consulta = mysql_query($consulta, $connection); or die ("No se pudo ejecutar la consulta en la BD");
		echo "Consulta ejecutada <br />";

		while ($registro = mysqli_fetch_array($ejecutar_consulta))
		{
			echo $registro["codigo"]."<br />";
			echo $registro["nombre"]." - ".$registro["artista"]."<br />";
			echo $registro["album"];

		}



		if ($rs.next())
		{			
			$resultado = new Perfume(
					$rs = $Codigo,
					$rs = $NombreCancion,
					$rs = $Artista,
					miLeer
					);
		}
				
		miSQL.cerrar();
		
		echo "La cancion es: ". $resultado;

	}*/
?>

</body>
</html>


