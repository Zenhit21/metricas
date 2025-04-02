<?php
/*
header('Content-Type: application/json');
require "/../conexion.php";

if ($_SERVER['REQUEST_METHOD'] !== 'DELETE') {
    http_response_code(405);
    die(json_encode(["status" => "error", "message" => "Método no permitido"]));
}

$id = $_GET['id'] ?? null;
if (!$id) {
    http_response_code(400);
    die(json_encode(["status" => "error", "message" => "ID no proporcionado"]));
}

try {
    // Cambiar estado a 0 (eliminación lógica)
    $stmt = $conn->prepare("UPDATE Usuarios SET usuario_estado = 0 WHERE id_usuario = ?");
    $stmt->bind_param("i", $id);
    
    // Para eliminación física (si prefieres):
    // $stmt = $conn->prepare("DELETE FROM Usuarios WHERE id_usuario = ?");
    
    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Usuario eliminado"]);
    } else {
        throw new Exception($stmt->error);
    }
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
} finally {
    if (isset($stmt)) $stmt->close();
    $conn->close();
}
    */
?>