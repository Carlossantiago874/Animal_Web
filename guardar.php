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
	$nombres =$_POST['nombres'];
	$apellidos =$_POST['apellidos'];
	$telefono =$_POST['telefono'];
	$email =$_POST['email'];
	$password =$_POST['password'];
	//hacemos la sentencia de sql
	$sql="INSERT INTO registro VALUES('',
								   '$nombres',
								   '$apellidos',
								   '$telefono',
								   '$email',
								   '$password')";

	$verificar_correo = mysqli_query($con,"SELECT*FROM registro WHERE email='$email' ");
	if(mysqli_num_rows($verificar_correo) >0 ){
		echo'
		<script> 
		alert("El Correo ya esta regristrado intenta con otro diferente");
		window.location="registrate.html";
		</script>
		'
		;
		exit();
	}


    $verificar_telefono = mysqli_query($con,"SELECT*FROM registro WHERE telefono='$telefono' ");
	if(mysqli_num_rows($verificar_telefono) >0 ){
		echo'
		<script> 
		alert("El telefono ya esta regristrado intenta con otro diferente");
		window.location="registrate.html";
		</script>
		'
		;
		exit();
	}
   

    //ejecutamos la sentencia de sql
 $ejecutar=mysqli_query($con,$sql);
 //verificamos la ejecucion
 if(!$ejecutar){
  echo"Hubo Algun Error";
 }else{
    
  echo "<script>alert('Te has registrado correctamente');</script>"; 
  
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
            <li><a href="registrate.html">Registrate</a>
                
            </li>
            <li><a href="ingresa.php">Ingresa</a></li>
        </ul>
    </nav>
    <p class="titulo">Animal Web</p>
    <div class="imagen1">
       <img src="imagenes/logo animal web.PNG" > 
    </div>
    <div class="mapa">
        <iframe  src="https://www.google.com/maps/embed?pb=!1m12!1m8!1m3!1d127265.95225589824!2d-74.1441352!3d4.5830696!3m2!1i1024!2i768!4f13.1!2m1!1s%20tienda%20de%20mascotas%20tunal!5e0!3m2!1ses!2sco!4v1624573543222!5m2!1ses!2sco" width="500px" height="500px" style="border:0;" allowfullscreen="" loading="lazy"></iframe>

    </div>
    <div class="parrafo">
       <p>Quienes somos: <br>
        <br>
        somos una pagina web unificada con tiendas de mascotas con el objetivo de hacer tu vida y la de tu mascota mas fácil, nuestras asociaciones tienen unas estrictas reglas las cuales ayudaran a que su pedido llegue a tiempo sano y salvo y de la mejor calidad posible <br>
        <br>
        
        Adopción: <br>
        <br>
        AnimalWeb también te da la oportunidad de poder adoptar un fiel compañero lo único que debes es cumplir ciertos requisitos para saber que nuestros animalitos estarán en las mejores y optimas condiciones
        </p>
        
    </div>
    
    
</body>
</html>