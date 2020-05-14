$(document).ready(function () {
    var item = {
        ID_USUARIO: $("#identificador").val()
    };
    url = vurl + "Portal/validarConfirmarCorreo";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#respuesta").append('Su correo electronico ha sido aprobado, por favor espere un momento para redireccionarlo a la pantalla de inicio de sesion o puede pulsar <a href="#" onclick="fn_irLogin();">aqui</a>');
    } else {
        var msj = '                      <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="errorRegistro">';
        msj = msj + '                           <div class="alert-wrap mr-3">';
        msj = msj + '                                <div class="sa">';
        msj = msj + '                                    <div class="sa-error">';
        msj = msj + '                                        <div class="sa-error-x">';
        msj = msj + '                                            <div class="sa-error-left"></div>';
        msj = msj + '                                            <div class="sa-error-right"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                        <div class="sa-error-placeholder"></div>';
        msj = msj + '                                        <div class="sa-error-fix"></div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        msj = msj + '                            <div class="alert-wrap">';
        msj = msj + '                                <h6>Error de registro</h6>';
        msj = msj + '                                <hr><small class="mb-0">El correo ingresado ya existe, utilice un correo válido para su registro.</small>';
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#seccionMensaje").append(msj);
    }
});

function fn_irLogin() {
    alert("entre");
    location.href = vurl + "Home/login";
}