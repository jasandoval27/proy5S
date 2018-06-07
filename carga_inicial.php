<?php include 'credenciales.php'; ?>
<?php 

//Crear la conexión
$conexion = mysqli_connect($server, $user, $pass,$bd) 
or die("Ha sucedido un error inexperado en la conexion de la base de datos");

//generar la consulta de restaurante
$sql = "SELECT * FROM trestaurante";
mysqli_set_charset($conexion, "utf8"); //formato de datos utf8

if(!$result = mysqli_query($conexion, $sql)) die();

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

//generar la consulta de zonas
$sql1 = "SELECT * FROM tubicacion";
mysqli_set_charset($conexion, "utf8"); //formato de datos utf8

if(!$result1 = mysqli_query($conexion, $sql1)) die();

$zonas = array(); //crear un array

while($row = mysqli_fetch_array($result1)) 
{ 
    $idtubicacion=$row['idtubicacion'];
    $zona=$row['zona'];
    
    $zonas[] = array('idtubicacion'=> $idtubicacion, 'zona'=> $zona);
}

//generar la consulta de especialidad
$sql2 = "SELECT * FROM tespecialidad";
mysqli_set_charset($conexion, "utf8"); //formato de datos utf8

if(!$result2 = mysqli_query($conexion, $sql2)) die();

$especialidades = array(); //crear un array

while($row = mysqli_fetch_array($result2)) 
{ 
    $idtespecialidad=$row['idtespecialidad'];
    $especialidad=$row['especialidad'];
    
    $especialidades[] = array('idtespecialidad'=> $idtespecialidad, 'especialidad'=> $especialidad);
}
    
//desconectar la base de datos
$close = mysqli_close($conexion) 
or die("Ha sucedido un error inexperado en la desconexion de la base de datos");
  

//Crear el JSON
$json_string = json_encode($ubicaciones, JSON_UNESCAPED_UNICODE);
$json_string1 = json_encode($zonas, JSON_UNESCAPED_UNICODE);
$json_string2 = json_encode($especialidades, JSON_UNESCAPED_UNICODE);
echo "localizacion(".$json_string.")";
echo "\n";
echo "zonas(".$json_string1.")";
echo "\n";
echo "especialidades(".$json_string2.")";

?>