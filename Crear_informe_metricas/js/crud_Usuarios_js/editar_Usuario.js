/*document.addEventListener('DOMContentLoaded', function() {
    // Verificar que el botón existe
    const guardarBtn = document.getElementById('guardar_usuario_btn');
    
    if (!guardarBtn) {
        console.error('El botón guardar_usuario_btn no fue encontrado');
        return;
    }
    
    // Configurar evento
    guardarBtn.addEventListener('click', async function() {
        const formData = {
            id_usuario: document.getElementById('id_usuario').value,
            nombre_usuario: document.getElementById('nombre_modal_editar_usuario').value,
            apellido: document.getElementById('apellido_modal_editar_usuario').value,
            usuario: document.getElementById('usuario_modal_editar_usuario').value,
            clave: document.getElementById('clave_modal_editar_usuario').value,
            perfil: document.getElementById('perfil_modal_editar_usuario').value,
            usuario_estado: document.getElementById('estado_modal_editar_usuario').value
        };
        
        try {
            const response = await fetch('http://localhost:8080/Crear_informe_metricas/src/php/crud_Usuarios_php/guardar_usuarios.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(formData)
            });
            
            const resultado = await response.json();
            
            if (resultado.status === 'success') {
                alert('Cambios guardados exitosamente');
                bootstrap.Modal.getInstance(document.getElementById('Modal_Editar')).hide();
                cargarUsuarios();
            } else {
                throw new Error(resultado.message);
            }
        } catch (error) {
            console.error('Error:', error);
            alert('Error al guardar cambios: ' + error.message);
        }
    });
});*/

