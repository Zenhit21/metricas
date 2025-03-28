<?php
require_once "../conexion.php";

$sql = "SELECT id_usuario, nombre, apellido, usuario, clave, perfil, estado FROM Usuarios";
$result = $conn->query($sql);

$usuarios = [];
while ($row = $result->fetch_assoc()) {
    $usuarios[] = $row;
}

echo json_encode($usuarios);
?> 
