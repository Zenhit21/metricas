function mostrarCrud(id) {
    // Oculta todos los CRUDs
    let crudContainers = document.querySelectorAll('.crud-container');
    crudContainers.forEach(container => container.style.display = 'none');

    // Muestra el CRUD seleccionado
    document.getElementById(id).style.display = 'block';
}

function cargarUsuarios() {
    fetch("crud_Usuarios_php/obtener_usuarios.php")
        .then(response => response.json())
        .then(data => {
            let tabla = document.getElementById('tablaUsuarios');
            tabla.innerHTML = '';

            data.forEach(usuarios => {
                let fila = `<tr>
                    <td>${usuarios.id_usuario}</td>
                    <td>${usuarios.nombre}</td>
                    <td>${usuarios.apellido}</td>
                    <td>${usuarios.usuario}</td>
                    <td>${usuarios.perfil == 1 ? 'Administrador' : 'Usuario'}</td>
                    <td>${usuarios.estado == 1 ? 'Activo' : 'Desactivado'}</td>
                    <td>
                        <button class="btn btn-warning">Editar</button>
                        <button class="btn btn-danger">Eliminar</button>
                    </td>
                </tr>`;
                tabla.innerHTML += fila;
            });
        })
        .catch(error => console.error('Error:', error));
}

document.addEventListener('DOMContentLoaded', cargarUsuarios);