
$("#frmRecuperarClave").on("submit", function (e) {
    var item = {
        TOKEN: $("#TOKEN").val()
    };
    var url = baseUrl + "Home/VerificarCaptcha";
    var respuesta = MRV.Ajax(url, item, false);

    // if (grecaptcha.getResponse() == "") {
    if (!respuesta) {
        e.preventDefault();
        $("#frmRecuperarClave #errorCambiar").remove();
        $("#frmRecuperarClave #correctoCambiar").remove();
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
        msj = msj + '                                <hr><small class="mb-0">Por favor verificar el captcha.</small>';
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#seccionMensaje").append(msj);
        return false;
    } else {
        fn_verificarEmailRecuperar();
        return false;
    }
    return false;

});

function fn_verificarEmailRecuperar() {
    item = {
        EMAIL_USUARIO: $("#txt-user").val()
    };
    var url = baseUrl + "Portal/VerificarEmailRecuperar";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        fn_enviarCorreoRecuperacion();
        return false;
    } else {
        $("#frmRecuperarClave #errorCambiar").remove();
        $("#frmRecuperarClave #correctoCambiar").remove();
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
        msj = msj + '                                <hr><small class="mb-0">El correo ingresado no existe o fue ingresado erradamente.</small>';
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#seccionMensaje").append(msj);
        return false;
    }
}

function fn_enviarCorreoRecuperacion() {
    item = {
        EMAIL_USUARIO: $("#txt-user").val()
    };
    var url = baseUrl + "Portal/EnviarCorreoRecuperar";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#frmRecuperarClave #errorCambiar").remove();
        $("#frmRecuperarClave #correctoCambiar").remove();
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
        msj = msj + '                                <hr><small class="mb-0">Siga las instrucciones enviadas a su correo para obtener su contraseña.</small>';
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#frmRecuperarClave #botonCambiar").hide();
        $("#seccionMensaje").append(msj);
        return false;
    } else {
        $("#frmRecuperarClave #errorCambiar").remove();
        $("#frmRecuperarClave #correctoCambiar").remove();
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
        msj = msj + '                                <hr><small class="mb-0">Ocurrió un error durante el proceso de su solicitud, inténtelo nuevamente.</small>';
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#seccionMensaje").append(msj);
        return false;
    }
}

$("#frmReestablecerClave").on("submit", function (e) {

    grecaptcha.ready(function () {

        grecaptcha.execute(key, { action: 'Gestion/AccionMitigacion' }).then(function (token) {
            var item = {
                TOKEN: token
            };
            var url = baseUrl + "Home/VerificarCaptcha";
            var respuesta = MRV.Ajax(url, item, false);
            if (!respuesta.success) {

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
                msj = msj + '                                <ul><li><small class="mb-0">Por favor verificar el captcha.</small></li></ul>';
                msj = msj + '                            </div>';
                msj = msj + '                        </div>';
                $("#seccionMensaje").append(msj);

            } else {
                fn_validar();
            }

        });
    });
    return false;

});

function fn_validar() {
    var arr = [];
    var clave = $("#txt-pswd").val();
    var reclave = $("#txt-re-pswd").val();
    $("#frmReestablecerClave #errorCambiar").remove();
    $("#frmReestablecerClave #correctoCambiar").remove();

    //if (clave == reclave) {
    //    if (!(/[a-zñ]/.test(clave) && /[A-ZÑ]/.test(clave) && /[0-9]/.test(clave) && /[@#.]/.test(clave))) {
    //        arr.push("La contraseña debe contener minúscula(s), mayúscula(s), número(s) y caracter(es) especial(es) [@#.]");
    //    }
    //    if (clave.length < 6) {
    //        arr.push("La contraseña debe contener 6 o más caracteres por seguridad");
    //    }
    //} else {
    //    arr.push("Compruebe que ambas contraseñas sean iguales.");
    //}

    if (clave == reclave) {
        //if (!(/[a-zñ]/.test(clave) && /[A-ZÑ]/.test(clave) && /[0-9]/.test(clave) && /[#$%&]/.test(clave))) {
        if (!(/[a-zñ]/.test(clave) && /[A-ZÑ]/.test(clave) && /[0-9]/.test(clave) && /\W/.test(clave))) {
            arr.push("La contraseña debe contener minúscula(s), mayúscula(s), número(s) y caracter(es) especial(es)");
        }
        if (clave.length < 6) {
            arr.push("La contraseña debe contener 6 o más caracteres por seguridad");
        }
    } else {
        arr.push("Las contraseñas no coinciden");
    }

    //var item = {
    //    TOKEN: $("#TOKEN").val()
    //};
    //var url = baseUrl + "Home/VerificarCaptcha";
    //var respuesta = MRV.Ajax(url, item, false);

    //if (!respuesta.success) {
    //    //if (grecaptcha.getResponse() == "") {
    //    e.preventDefault();
    //    arr.push("Por favor verificar el captcha.");
    //}

    if (arr.length == 0) {
        fn_reestablecerClave();
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
}


function fn_reestablecerClave() {
    var url = baseUrl + "Portal/CambiarNuevaClave";
    var item = {
        ID_USUARIO: $("#identificador").val(),
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
        msj = msj + '                                <hr><small class="mb-0">Ya puede utilizar su nueva contraseña, verifíquelo iniciando sesión por favor.</small>';
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#frmReestablecerClave #botonCambiar").hide();
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