<?php
require "../conexion.php";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $usuario = $_POST['usuario'];
    $clave = password_hash($_POST['clave'], PASSWORD_BCRYPT); // Ahora encripta la contraseña
    $perfil = $_POST['perfil']; // Viene como 1 o 2
    $estado = 1; // Se asume activo por defecto

    $sql = "INSERT INTO Usuarios (nombre, apellido, usuario, clave, perfil, estado) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssii", $nombre, $apellido, $usuario, $clave, $perfil, $estado);
    
    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Usuario agregado correctamente"]);
    } else {
        echo json_encode(["status" => "error", "message" => "Error al agregar usuario"]);
    }

    $stmt->close();
    $conn->close();
}
?>
