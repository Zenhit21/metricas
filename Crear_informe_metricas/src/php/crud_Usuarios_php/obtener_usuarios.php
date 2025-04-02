<?php
require "../conexion.php";

// Asegúrate de seleccionar los campos exactos como están en la tabla
$sql = "SELECT Id_Usuario, Nombre_Usuario, Apellido_Usuario, Usuario, Clave, Perfil, Estado_Usuario FROM Usuarios";
$result = $conn->query($sql);

$usuarios = [];
while ($row = $result->fetch_assoc()) {
    $usuarios[] = $row;
}

echo json_encode($usuarios);
?>