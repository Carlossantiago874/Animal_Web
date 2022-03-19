<?php

session_start();

session_destroy();

header("location: ingresa.php");
exit();

?>