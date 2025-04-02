function mostrarCrud(id) {
    // Oculta todos los CRUDs
    let crudContainers = document.querySelectorAll('.crud-container');
    crudContainers.forEach(container => container.style.display = 'none');

    // Muestra el CRUD seleccionado
    document.getElementById(id).style.display = 'block';
}

function cargarUsuarios() {
    fetch("../php/crud_Usuarios_php/obtener_usuarios.php")
        .then(response => response.json())
        .then(data => {
            let tabla = document.getElementById('tablaUsuarios');
            tabla.innerHTML = '';

            data.forEach(usuarios => {
                let fila = 
                `<tr>
                    <td>${usuarios.Id_Usuario}</td>
                    <td>${usuarios.Nombre_Usuario}</td>
                    <td>${usuarios.Apellido_Usuario}</td>
                    <td>${usuarios.Usuario}</td>
                    <td>${usuarios.Perfil == 1 ? 'Administrador' : 'Usuario'}</td>
                    <td>${usuarios.Estado_Usuario == 1 ? 'Activo' : 'Desactivado'}</td>
                    <td>
                        
                        <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#Modal_Editar id = "Editar_Usuario_Label_Modal">Editar</button>
                        <button class="btn btn-danger" id = "Eliminar_Usuario_Label_Modal">Eliminar</button>
                    </td>
                </tr>`;
                tabla.innerHTML += fila;
            });
        })
        .catch(error => console.error('Error:', error));
}
document.addEventListener('DOMContentLoaded', cargarUsuarios);

/*function configurarEventosEdicion() {
    document.querySelectorAll('.btn-editar').forEach(btn => {
        btn.addEventListener('click', function() {
            const idUsuario = this.closest('tr').dataset.id;
            cargarUsuarioParaEditar(idUsuario);
        });
    });
}

function mostrarCrud(id) {
    const crudContainers = document.querySelectorAll('.crud-container');
    crudContainers.forEach(container => container.style.display = 'none');
    document.getElementById(id).style.display = 'block';
}

async function cargarUsuarios() {
    try {
        const response = await fetch("../php/crud_Usuarios_php/obtener_usuarios.php");
        const data = await response.json();
        const tabla = document.getElementById('tablaUsuarios');
        
        tabla.innerHTML = data.map(usuario => `
            <tr data-id="${usuario.id_usuario}">
                <td>${usuario.id_usuario}</td>
                <td>${usuario.nombre_usuario}</td>
                <td>${usuario.apellido}</td>
                <td>${usuario.usuario}</td>
                <td>${usuario.perfil === 1 ? 'Administrador' : 'Usuario'}</td>
                <td>${usuario.usuario_estado === 1 ? 'Activo' : 'Desactivado'}</td>
                <td>
                    <button class="btn btn-warning btn-editar" data-bs-toggle="modal" data-bs-target="#Modal_Editar">Editar</button>
                    <button class="btn btn-danger btn-eliminar">Eliminar</button>
                </td>
            </tr>
        `).join('');

        configurarEventosEdicion();
        
    } catch (error) {
        console.error('Error al cargar usuarios:', error);
        alert('Error al cargar la lista de usuarios');
    }
}

function configurarEventosEdicion() {
    document.querySelectorAll('.btn-editar').forEach(btn => {
        btn.addEventListener('click', function() {
            const idUsuario = this.closest('tr').dataset.id;
            cargarUsuarioParaEditar(idUsuario);
        });
    });
}

// Función para cargar datos en el modal de edición
async function cargarUsuarioParaEditar(id) {
    try {
        const response = await fetch(`../../php/crud_Usuarios_php/obtener_usuario.php?id=${id}`);
        const usuario = await response.json();
        
        document.getElementById('id_usuario').value = usuario.id_usuario;
        document.getElementById('nombre_modal_editar_usuario').value = usuario.nombre_usuario;
        document.getElementById('apellido_modal_editar_usuario').value = usuario.apellido;
        document.getElementById('usuario_modal_editar_usuario').value = usuario.usuario;
        document.getElementById('perfil_modal_editar_usuario').value = usuario.perfil;
        document.getElementById('estado_modal_editar_usuario').value = usuario.usuario_estado;
        
    } catch (error) {
        console.error('Error al cargar usuario:', error);
        alert('Error al cargar datos del usuario');
    }
}

document.addEventListener('DOMContentLoaded', () => {
    cargarUsuarios();
    mostrarCrud('usuarios'); // Mostrar CRUD de usuarios por defecto
});*/

