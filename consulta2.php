<?php include 'credenciales.php'; ?>
<?php

//leer json de origen
$obj = json_decode($_GET["x"], true);

$zonas = array();

//Crear la conexión
$conexion = mysqli_connect($server, $user, $pass,$bd) 
or die("Ha sucedido un error inexperado en la conexion de la base de datos");

//generar la consulta de restaurante
if ($obj["especialidad"] == 0) {
	$sql2 = "SELECT * FROM trestaurante";
	mysqli_set_charset($conexion, "utf8"); //formato de datos utf8

	if(!$result = mysqli_query($conexion, $sql2)) die();

	$ubicaciones = array(); //crear un array

	while($row = mysqli_fetch_array($result)) 
	{ 
	    $idtrestaurante=$row['idtrestaurante'];
	    $razonsocial=$row['razonsocial'];
	    $direccion=$row['direccion'];
	    $telefono=$row['telefono'];
	    $mapslat=$row['mapslat'];
	    $mapslng=$row['mapslng'];
	    
	    $ubicaciones[] = array('idtrestaurante'=> $idtrestaurante, 'razonsocial'=> $razonsocial, 'direccion'=> $direccion, 'telefono'=> $telefono, 'lat' => $mapslat, 'lng' => $mapslng);
	}
}else{
	$sql2 = "SELECT * FROM trestaurante WHERE especialidad = " .$obj["especialidad"];
	mysqli_set_charset($conexion, "utf8"); //formato de datos utf8

	if(!$result = mysqli_query($conexion, $sql2)) die();

	$ubicaciones = array(); //crear un array

	while($row = mysqli_fetch_array($result)) 
	{ 
	    $idtrestaurante=$row['idtrestaurante'];
	    $razonsocial=$row['razonsocial'];
	    $direccion=$row['direccion'];
	    $telefono=$row['telefono'];
	    $mapslat=$row['mapslat'];
	    $mapslng=$row['mapslng'];
	    
	    $ubicaciones[] = array('idtrestaurante'=> $idtrestaurante, 'razonsocial'=> $razonsocial, 'direccion'=> $direccion, 'telefono'=> $telefono, 'lat' => $mapslat, 'lng' => $mapslng);
	}
}

$sql3 = "SELECT COUNT(*) AS total FROM trestaurante WHERE especialidad = " .$obj["especialidad"]." AND ubicacion = ".$obj["ubicacion"];
mysqli_set_charset($conexion, "utf8"); //formato de datos utf8

if(!$result = mysqli_query($conexion, $sql3)) die();

$control = array(); //crear un array

while($row = mysqli_fetch_array($result)) 
{ 
    $total=$row['total'];
    
    $control = array('total'=> $total);
}

//desconectar la base de datos
$close = mysqli_close($conexion) 
or die("Ha sucedido un error inexperado en la desconexion de la base de datos");

echo "filtro_esp(".json_encode($ubicaciones).")";
echo "\n";
echo "control(".json_encode($control).")";

?>