$("#frmCambiarClave").on("submit", function (e) {

    var arr = [];
    var clave = $("#txt-pswd").val();
    var reclave = $("#txt-re-pswd").val();
    $("#frmCambiarClave #errorCambiar").remove();
    $("#frmCambiarClave #correctoCambiar").remove();
    debugger;
    if (clave == reclave) {
        if (!(/[a-zñ]/.test(clave) && /[A-ZÑ]/.test(clave) && /[0-9]/.test(clave))) {
            arr.push("La nueva contraseña debe contener minuscula(s), mayúscula(s) y número(s)");
        }
        if (clave.length < 6) {
            arr.push("La nueva contraseña debe contener 6 o más caracteres");
        }
    } else {
        arr.push("Compruebe que ambas contraseñas son iguales.");
    }

    if (grecaptcha.getResponse() == "") {
        e.preventDefault();
        arr.push("Por favor verificar el captcha.");
    }

    if (arr.length == 0) {
        fn_verificarClave();
        return false;
    } else {
        //var error = '<ul>';
        var error = '';
        $.each(arr, function (ind, elem) {
            error = error + '<p><small class="mb-0">' + elem + '</small></p>';
        });
        //error = error + '</ul>';
        var msj = '                      <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="errorCambiar">';
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
        msj = msj + error;
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#seccionMensaje").append(msj);
        return false;
    }
});

function fn_verificarClave() {
    var item = {
        ID_USUARIO: $("#Control").data("usuario"),
        PASSWORD_USUARIO: $("#txt-now-pswd").val()
    };
    var url = baseUrl + "Gestion/VerificarClave";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        fn_cambiarClave();
    } else {
        var msj = '                      <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="errorCambiar">';
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
        msj = msj + '                                <hr><small class="mb-0">' + respuesta.extra + '</small>';
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#seccionMensaje").append(msj);
        return false;
    }
}

function fn_cambiarClave() {
    var url = baseUrl + "Gestion/CambiarNuevaClave";
    var item = {
        ID_USUARIO: $("#Control").data("usuario"),
        NUEVO_PASSWORD_USUARIO: $("#txt-pswd").val()
    };
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        var msj = '                       <div class="alert alert-success d-flex align-items-stretch" role="alert" id="correctoCambiar">';
        msj = msj + '                            <div class="alert-wrap mr-3">';
        msj = msj + '                                <div class="sa">';
        msj = msj + '                                    <div class="sa-success">';
        msj = msj + '                                        <div class="sa-success-tip"></div>';
        msj = msj + '                                        <div class="sa-success-long"></div>';
        msj = msj + '                                        <div class="sa-success-placeholder"></div>';
        msj = msj + '                                        <div class="sa-success-fix"></div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        msj = msj + '                            <div class="alert-wrap">';
        msj = msj + '                                <h6>Bien hecho</h6>';
        msj = msj + '                                <hr><small class="mb-0">Ya puede utilizar su nueva contraseña, cierre sesión y verifíquelo por favor.</small>';
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#frmCambiarClave #botonCambiar").hide();
        $("#seccionMensaje").append(msj);
        return false;
    } else {
        var msj = '                      <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="errorCambiar">';
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
        msj = msj + '                                <hr><small class="mb-0">Ocurrio un problema durante el proceso de cambio de contraseña, inténtelo nuevamente.</small>';
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#seccionMensaje").append(msj);
        return false;
    }
}