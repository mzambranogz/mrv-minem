﻿
$("#frmLogin").on("submit", function (e) {

    grecaptcha.ready(function () {

        grecaptcha.execute(key, { action: 'Gestion/AccionMitigacion' }).then(function (token) {
            debugger;
            var url = baseUrl + "Home/ValidarCaptcha";
            var item = {
                USUARIO: $("#USUARIO").val(),
                PASSWORD_USUARIO: $("#PASSWORD_USUARIO").val(),
                TOKEN: token
            };
            var respuesta = MRV.Ajax(url, item, false);
            if (respuesta.success) {
                location.href = baseUrl + "Gestion/AccionMitigacion";
            } else {
                $("#seccionMensaje #errorLogin").remove();
                var msj = '                      <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="errorLogin">';
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
                msj = msj + '                                <h6>Error de acceso</h6>';
                msj = msj + '                                <hr><small class="mb-0">' + respuesta.extra + '</small>';
                msj = msj + '                            </div>';
                msj = msj + '                        </div>';
                $("#seccionMensaje").append(msj);
                return false;
            }

        });
    });

    return false;

//    if (grecaptcha.getResponse() == "") {
//        e.preventDefault();
//        $("#seccionMensaje #errorLogin").remove();
//        var msj = '                      <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="errorLogin">';
//        msj = msj + '                           <div class="alert-wrap mr-3">';
//        msj = msj + '                                <div class="sa">';
//        msj = msj + '                                    <div class="sa-error">';
//        msj = msj + '                                        <div class="sa-error-x">';
//        msj = msj + '                                            <div class="sa-error-left"></div>';
//        msj = msj + '                                            <div class="sa-error-right"></div>';
//        msj = msj + '                                        </div>';
//        msj = msj + '                                        <div class="sa-error-placeholder"></div>';
//        msj = msj + '                                        <div class="sa-error-fix"></div>';
//        msj = msj + '                                    </div>';
//        msj = msj + '                                </div>';
//        msj = msj + '                            </div>';
//        msj = msj + '                            <div class="alert-wrap">';
//        msj = msj + '                                <h6>Error de acceso</h6>';
//        msj = msj + '                                <hr><small class="mb-0">Por favor verificar el captcha.</small>';
//        msj = msj + '                            </div>';
//        msj = msj + '                        </div>';
//        $("#seccionMensaje").append(msj);
//        return false;
//    } else {
//        fn_iniciarSesion();
//        return false;
//    }
});

function fn_iniciarSesion() {
    var url = baseUrl + "Portal/IniciarSesion";
    var item = {
        USUARIO: $("#txt-user").val(),
        PASSWORD_USUARIO: $("#txt-pswd").val()
    };

    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    } else {
        $("#seccionMensaje #errorLogin").remove();
        var msj = '                      <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="errorLogin">';
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
        msj = msj + '                                <h6>Error de acceso</h6>';
        msj = msj + '                                <hr><small class="mb-0">' + respuesta.extra + '</small>';
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#seccionMensaje").append(msj);
    }
    return false;
}



