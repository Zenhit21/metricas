<?php
session_start();
require_once __DIR__ . "/conexion.php";  // Asegúrate de que la ruta esté correcta

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = trim($_POST['usuario']);
    $clave = trim($_POST['clave']);

    if (!empty($usuario) && !empty($clave)) {
        $sql = "SELECT id_usuario, usuario, clave, perfil FROM Usuarios WHERE usuario = ? AND estado = 1";
        if ($stmt = $conn->prepare($sql)) {
            $stmt->bind_param("s", $usuario);
            $stmt->execute();
            $stmt->store_result();

            if ($stmt->num_rows == 1) {
                $stmt->bind_result($id_usuario, $usuario, $hashed_password, $perfil);
                $stmt->fetch();

                // COMPARAR LA CONTRASEÑA INGRESADA SIN USAR password_verify() (para pruebas)
                if ($clave === "1234") {  // Comparar directamente la contraseña ingresada
                    // Iniciar sesión
                    $_SESSION["id_usuario"] = $id_usuario;
                    $_SESSION["usuario"] = $usuario;
                    $_SESSION["perfil"] = $perfil;

                    // Redirigir a dashboard.php
                    header("Location: ../php/vista_administrador.php");
                    exit();
                } else {
                    $error = "Contraseña incorrecta.";
                }
            } else {
                $error = "Usuario no encontrado o inactivo.";
            }
            $stmt->close();
        }
    } else {
        $error = "Por favor, complete todos los campos.";
    }
    $conn->close();
}
?>



<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4 shadow-lg" style="width: 350px;">
        <h3 class="text-center">Iniciar Sesión</h3>
        <?php if (isset($error)): ?>
            <div class="alert alert-danger"><?= $error ?></div>
        <?php endif; ?>
        <form method="POST" action="login.php">
            <div class="mb-3">
                <label for="usuario" class="form-label">Usuario</label>
                <input type="text" class="form-control" id="usuario" name="usuario" required>
            </div>
            <div class="mb-3">
                <label for="clave" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="clave" name="clave" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Ingresar</button>
        </form>
    </div>
</body>
</html>
