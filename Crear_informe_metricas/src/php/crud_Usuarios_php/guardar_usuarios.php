<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");

require __DIR__ . '/../conexion.php';

// Obtener datos JSON
$json = file_get_contents('php://input');
$data = json_decode($json, true);

// Validar datos requeridos
$required = ['Nombre_Usuario', 'Apellido_Usuario', 'Usuario', 'Clave', 'Perfil'];
foreach ($required as $field) {
    if (empty($data[$field])) {
        http_response_code(400);
        die(json_encode(["status" => "error", "message" => "Falta el campo $field"]));
    }
}

try {
    $stmt = $conn->prepare("INSERT INTO Usuarios (Nombre_Usuario, Apellido_Usuario, Usuario, Clave, Perfil, Estado_Usuario) VALUES (?, ?, ?, ?, ?, ?)");
    
    $password = password_hash($data['Clave'], PASSWORD_BCRYPT);
    $estado = 1;
    $stmt->bind_param('sssssi', $data['Nombre_Usuario'], $data['Apellido_Usuario'], $data['Usuario'], $password, $data['Perfil'], $estado);
    
    if ($stmt->execute()) {
        echo json_encode(["status" => "success", "message" => "Usuario agregado"]);
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



/*header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
require __DIR__ . '/../conexion.php';

$json = file_get_contents('php://input');
$data = json_decode($json, true);

// Validar datos comunes
$required = ['nombre_usuario', 'apellido', 'usuario', 'perfil'];
foreach ($required as $field) {
    if (empty($data[$field])) {
        http_response_code(400);
        die(json_encode(["status" => "error", "message" => "Falta el campo $field"]));
    }
}

try {
    // Modo Edición
    if (!empty($data['id_usuario'])) {
        $sql = "UPDATE Usuarios SET 
                nombre_usuario = ?, 
                apellido = ?, 
                usuario = ?, 
                perfil = ?, 
                usuario_estado = ? 
                ".(!empty($data['clave']) ? ", clave = ?" : "")."
                WHERE id_usuario = ?";
        
        $stmt = $conn->prepare($sql);
        
        $params = [
            $data['nombre_usuario'],
            $data['apellido'],
            $data['usuario'],
            $data['perfil'],
            $data['usuario_estado'] ?? 1 // Default a activo si no existe
        ];
        
        if (!empty($data['clave'])) {
            $params[] = password_hash($data['clave'], PASSWORD_BCRYPT);
        }
        
        $params[] = $data['id_usuario'];
        
        $types = str_repeat('s', count($params) - 1) . 'i'; // Todos string excepto el último ID
        $stmt->bind_param($types, ...$params);
        
        $action = "actualizado";
    }
    // Modo Creación
    else {
        if (empty($data['clave'])) {
            http_response_code(400);
            die(json_encode(["status" => "error", "message" => "La clave es requerida"]));
        }
        
        $sql = "INSERT INTO Usuarios (nombre_usuario, apellido, usuario, clave, perfil, usuario_estado) 
                VALUES (?, ?, ?, ?, ?, ?)";
        
        $stmt = $conn->prepare($sql);
        $clave_hash = password_hash($data['clave'], PASSWORD_BCRYPT);
        $estado = $data['usuario_estado'] ?? 1; // Default a activo
        
        $stmt->bind_param("sssssi", 
            $data['nombre_usuario'],
            $data['apellido'],
            $data['usuario'],
            $clave_hash,
            $data['perfil'],
            $estado
        );
        
        $action = "creado";
    }

    if ($stmt->execute()) {
        $response = [
            "status" => "success", 
            "message" => "Usuario $action correctamente",
            "id" => !empty($data['id_usuario']) ? $data['id_usuario'] : $stmt->insert_id
        ];
        
        echo json_encode($response);
    } else {
        throw new Exception($stmt->error);
    }
    
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        "status" => "error", 
        "message" => $e->getMessage(),
        "error_code" => $e->getCode()
    ]);
} finally {
    if (isset($stmt)) $stmt->close();
    $conn->close();
}
?>*/