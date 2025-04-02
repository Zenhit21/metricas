<?php
$host = "localhost"; 
$port = 3307; 
$user = "root";
$password = "";
$dbname = "Informe_Metricas_DB";

$conn = new mysqli($host, $user, $password, $dbname, $port);
if ($conn->connect_error) {
    error_log("Error de conexión: " . $conn->connect_error);
    die("Error de conexión");
}
?>