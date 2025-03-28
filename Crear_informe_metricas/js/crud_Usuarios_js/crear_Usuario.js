document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("guardar_usuario_btn").addEventListener("click", function () {
        let formData = new FormData(document.getElementById("form-crear-usuario-modal"));

        fetch("php/crud_Usuarios_php/guardar_usuarios.php", { // 🔹 Ruta corregida
            method: "POST",
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            if (data.status === "success") {
                location.reload(); // Recargar la página para ver el nuevo usuario
            }
        })
        .catch(error => console.error("Error:", error));
    });
});
