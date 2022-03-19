<?php
include('db.php');
$email=$_POST['email'];
$contraseña=$_POST['contraseña'];
session_start();
$_SESSION['email']=$email;


$conexion=mysqli_connect("localhost","root","","animalweb");

$consulta="SELECT*FROM registro where email='$email' and password='$contraseña'";
$resultado=mysqli_query($conexion,$consulta);

$filas=mysqli_num_rows($resultado);

if($filas){
  
    header("location:opciones.html");

}else{
    ?>
    <?php
    include("ingresa.php");

  ?>
  <script>alert('Tu Correo o Contraseña estan Incorrectos intenta de nuevo');</script>;
  <?php
}
mysqli_free_result($resultado);
mysqli_close($conexion);