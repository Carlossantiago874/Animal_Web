<?php
 //conectamos Con el servidor
 $host ="localhost";
 $user ="root";
 $pass ="";
 $db="animalweb";
	//verificamos la conexion
	 //funcion llamada conexion con (dominio,usuarios,contraseña,base_de_datos)
 $con = mysqli_connect($host,$user,$pass,$db)or die("Problemas al Conectar");
 mysqli_select_db($con,$db)or die("problemas al conectar con la base de datos");
	//recuperar las variables
	$nombre =$_POST['nombre'];
	$apellidos =$_POST['apellidos'];
	$telefono =$_POST['telefono'];
	$email =$_POST['email'];
	$id_animal=$_POST['id_animal'];
	$peticion =$_POST['peticion'];
	//hacemos la sentencia de sql
	$sql="INSERT INTO enviar VALUES('',
								   '$nombre',
								   '$apellidos',
								   '$telefono',
								   '$email',
								   '$id_animal',
								   '$peticion')";

    //ejecutamos la sentencia de sql
 $ejecutar=mysqli_query($con,$sql);
 //verificamos la ejecucion
 if(!$ejecutar){
  echo"Hubo Algun Error";
 }else{
    
  echo "<script>alert('En Hora Buena!!');</script>"; 
  
 }
?>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="estilos/estilos.css">
    <title>Animal_Web</title>
</head>
<body>
    <nav>
        <label class="logo">Animal Web</label>
        
        <ul>
            
            
            <li><a href="#">Redes Sociales</a>
                <ul>
                    <li><a href="http://www.facebook.com/">facebook</a></li>
                    <li><a href="http://www.twitter.com/">twiter</a></li>
                </ul>
            </li>
            <li><a href="adoption.html">Atras</a></li>
            <li><a href="index.html">salir</a></li>
    
        </ul>
    </nav>
    <p class="titulo">Animal Web</p>
    

	<h1 class="peticion">Tu peticion esta siendo revisada por nuestro equipo espera la respuesta por correo electronico</h1>
    

	<footer>

	© 2021 Animal Web - Todos los derechos reservados
	</footer>
</body>
</html>




