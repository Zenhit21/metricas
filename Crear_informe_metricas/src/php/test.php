<?php
$host = "localhost";
$port = 3307;
$user = "root";
$password = "";
$dbname = "proyecto_informe_metricas";

$conn = new mysqli($host, $user, $password, $dbname, $port);

header('Content-Type: application/json');
echo json_encode([
    'status' => $conn->connect_error ? 'error' : 'success',
    'connection_info' => [
        'host' => $host,
        'port' => $port,
        'database' => $dbname,
        'server_version' => $conn->server_info,
        'host_info' => $conn->host_info,
        'protocol_version' => $conn->protocol_version
    ],
    'error' => $conn->connect_error
]);
?>