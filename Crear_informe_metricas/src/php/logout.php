<?php
session_start();
session_destroy(); // Elimina todas las variables de sesión
header("Location: ../html/login.php"); // Redirige al login
exit();
?>