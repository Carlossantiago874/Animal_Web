<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title></title> 
	<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
	<link rel="stylesheet" href="estilos/estilos2.css">
	

</head>  
<body>
<a href="index.html"><input type="submit" value="Inicio" class="button"></a>
<form action="validar.php" method="post" class="formulario">
    
    <h1>Login</h1>
     <div class="contenedor">  
         <div class="input-contenedor">
         <i class="fas fa-envelope icon"></i>
         <input type="text"  placeholder="Correo Electronico"name="email">
         
         </div>
         
         <div class="input-contenedor">
        <i class="fas fa-key icon"></i>
         <input type="password" placeholder="Contraseña"name="contraseña">
         
         </div>
         <input type="submit" value="Ingresa" class="button">
         
        

         <p>¿No tienes una cuenta? <a class="link" href="registrate.html">Registrate </a></p>
     </div>
    </form>
</body>
</html>
