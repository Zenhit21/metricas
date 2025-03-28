<?php
$host = "localhost"; // Cambia de 127.0.0.1 a localhost
$port = 3307; // Si el otro servidor está en 3306
$user = "root";
$password = "";
$dbname = "proyecto_informe_metricas";

$conn = new mysqli($host, $user, $password, $dbname, $port);
?>