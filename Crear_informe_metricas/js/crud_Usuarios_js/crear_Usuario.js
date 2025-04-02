document.getElementById("guardar_usuario_btn").addEventListener("click", async function() {
    const formData = {
        Nombre_Usuario: document.getElementById("nombre_modal_crear_usuario").value.trim(),
        Apellido_Usuario: document.getElementById("apellido_modal_crear_usuario").value.trim(),
        Usuario: document.getElementById("usuario_modal_crear_usuario").value.trim(),
        Clave: document.getElementById("clave_modal_crear_usuario").value.trim(),
        Perfil: document.getElementById("perfil_modal_crear_usuario").value
    };

    // Validación básica
    if (!formData.Nombre_Usuario || !formData.Clave) {
        alert("Nombre y clave son obligatorios");
        return;
    }
    fetch('http://localhost:8080/Crear_informe_metricas/src/php/crud_Usuarios_php/guardar_usuarios.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData)
    })
        .then(response => response.json())
        .then(data => {
            if(data.status === "success") {
                alert("Usuario guardado!");
                // Cerrar modal y recargar
                bootstrap.Modal.getInstance(document.getElementById('exampleModal')).hide();
                location.reload();
            } else {
                throw new Error(data.message);
            }
    })
    .catch(error => {
        console.error("Error: ", error);
        alert("Error: " + error.message);
    });
});