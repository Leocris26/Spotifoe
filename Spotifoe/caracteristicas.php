<html>
 <head>
  <title>Caracteristicas</title>
 </head>
 <body>
  <?php 
 include("conection.php");
 ?>
<form action="caracteristicas.php" method="post">
Ingrese el nombre de la cancion:<br>
<input type="text" name="cancion" size="30"><br>
<input type="submit" value="Enviar">
</form>
------------------Datos------------------------ <br>
<?php
$valor = $_POST["cancion"];

$consulta = sprintf("SELECT * FROM musicas where Nombre = '$valor'");
$resultado = mysql_query($consulta);
if (!$resultado) {
    $mensaje  = 'Consulta no válida: ' . mysql_error() . "\n";
    $mensaje .= 'Consulta completa: ' . $consulta;
    die($mensaje);
}

while ($fila = mysql_fetch_assoc($resultado)) {
echo 'Nombre: ';
echo $fila ['Nombre'];
echo '<br>';
echo 'Artista: ';
echo $fila ['Artista'];
echo '<br>';
echo 'Calificacion: ';
echo $fila ['Calificacion'];
echo '<br>';
echo 'Duracion: ';
echo $fila ['Duracion'];
echo '<br>';
echo 'Album: ';
echo $fila ['Album'];
echo '<br>';
echo 'Anio: ';
echo $fila ['Anio'];
}


 ?>
 </body>
</html>