<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Plataforma</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/style.css?v=<?php echo time(); ?>">
    
</head>
<body>
    <div class="container_mt-4">
        <h3 class="text-center_mb-4">Seleccione una opción</h3>
        <div class="row">
            <!-- Menú de botones alineado a la izquierda -->
            <div class="col-md-3">
                <div class="list-group custom-menu">
                    <button class="list-group-item list-group-item-action" onclick="mostrarCrud('usuarios')">Crear Usuario</button>
                    <button class="list-group-item list-group-item-action" onclick="mostrarCrud('rrss')">Mantenedor de RRSS</button>
                    <button class="list-group-item list-group-item-action" onclick="mostrarCrud('metrica')">Mantenedor de Métrica</button>
                    <button class="list-group-item list-group-item-action" onclick="mostrarCrud('clientes')">Mantenedor de Clientes</button>
                    <button class="list-group-item list-group-item-action" onclick="mostrarCrud('campanas')">Mantenedor de Campañas</button>
                    <button class="list-group-item list-group-item-action" onclick="mostrarCrud('informes')">Crear informe</button>
                </div>
            </div>

            <!-- Sección donde se mostrarán los CRUDs -->
            <div class="col-md-9">
                <div id="usuarios" class="crud-container" style="display: none;">
                    <h3>Lista de Usuarios</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Usuario</th>
                                <th>Perfil</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody id="tablaUsuarios">
                            <!-- DATOS JS -->
                        </tbody>
                    </table>
                    <?php include __DIR__.'/crud_Usuarios_php/vModal_Crear_Usuario.php';?> 
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        Agregar Usuario
                    </button>   
                </div>        
            </div>
                <div id="rrss" class="crud-container" style="display: none;">
                    <h3>Mantenedor de RRSS</h3>
                    <p>Contenido aquí...</p>
                </div>

                <div id="metrica" class="crud-container" style="display: none;">
                    <h3>Mantenedor de Métrica</h3>
                    <p>Contenido aquí...</p>
                </div>

                <div id="clientes" class="crud-container" style="display: none;">
                    <h3>Mantenedor de Clientes</h3>
                    <p>Contenido aquí...</p>
                </div>

                <div id="campanas" class="crud-container" style="display: none;">
                    <h3>Mantenedor de Campañas</h3>
                    <p>Contenido aquí...</p>
                </div>

                <div id="informes" class="crud-container" style="display: none;">
                    <h3>Crear Informe</h3>
                    <p>Contenido aquí...</p>
                </div>
            </div>
        </div>
    </div>
    <?php include __DIR__.'/crud_Usuarios_php/vModal_Editar_Usuario.php'; ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../js/vista_Crud.js"></script>
    <script src="../../js/crud_Usuarios_js/crear_Usuario.js"></script>
</body>
</html>
