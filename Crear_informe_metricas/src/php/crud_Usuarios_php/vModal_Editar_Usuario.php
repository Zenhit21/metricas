<!-- Modal 
<div class="modal fade" id="Modal_Editar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">    
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="Editar_Usuario_Label_Modal">Editar Usuario</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="form-editar-usuario-modal" onsubmit="event.preventDefault(); guardarUsuario()">
                     Campo oculto para el ID del usuario 
                    <input type="hidden" id="id_usuario" name="id_usuario">
                    
                     Campos del formulario 
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre_modal_editar_usuario" name="nombre_usuario">
                    </div>
                    <div class="mb-3">
                        <label for="apellido" class="form-label">Apellido</label>
                        <input type="text" class="form-control" id="apellido_modal_editar_usuario" name="apellido">
                    </div>
                    <div class="mb-3">
                        <label for="usuario" class="form-label">Usuario</label>
                        <input type="text" class="form-control" id="usuario_modal_editar_usuario" name="usuario">
                    </div>
                    <div class="mb-3">
                        <label for="clave" class="form-label">Clave</label>
                        <input type="password" class="form-control" id="clave_modal_editar_usuario" name="clave">
                    </div>
                    <div class="mb-3">
                        <label for="perfil" class="form-label">Perfil</label>
                        <select class="form-select" id="perfil_modal_editar_usuario" name="perfil">
                            <option value="1">Administrador</option>
                            <option value="2">Ejecutivo</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="estado" class="form-label">Estado</label>
                        <select class="form-select" id="estado_modal_editar_usuario" name="usuario_estado">
                            <option value="1">Activo</option>
                            <option value="0">Inactivo</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="guardar_usuario_btn">Guardar Cambios</button>
            </div>
        </div>
    </div>
</div> -->