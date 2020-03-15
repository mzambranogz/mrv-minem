
function CargarListaSectorInstitucion() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Portal/ListaSectorInstitucion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#cbo-sector").append('<option value="' + data[i]["ID_SECTOR_INST"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                    }
                }
            }
        }
    });
}

function fn_verificarEmail() {
    item = {
        EMAIL_USUARIO: $("#txt-user").val()
    };
    var url = baseUrl + "Portal/VerificarEmail";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        fn_registrarUsuario();
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
        //msj = msj + '                                <hr><small class="mb-0">El correo ingresado ya existe, utilice un correo válido para su registro.</small>';
        msj = msj + '                                <hr><small class="mb-0">Ocurrio un problema durante el registro.</small>';
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#seccionMensaje").append(msj);
    }
}

function dirigir() {
    location.href = baseUrl + "Home/Index";
}

function fn_validar(e) {
    var arr = [];
    var clave = $("#txt-pswd").val();
    var validar = $("#txt-re-pswd").val();
    $("#seccionMensaje #errorRegistro").remove();

    if (!(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test($("#txt-user").val()))) {
        arr.push("Ingrese un correo electrónico válido");
    }

    if ($("#txt-nombre").val().trim() === "") {
        arr.push("Ingrese su(s) nombre(s)");
    }

    if ($("#txt-apellido").val().trim() === "") {
        arr.push("Ingrese su(s) apellido(s)");
    }

    //if ($("#rad-01").prop("checked")) {
        if ($("#txt-telefono").val().trim() === "") {
            arr.push("Ingrese un teléfono");
        }
    //}

    //if ($("#rad-02").prop("checked")) {
        if ($("#txt-celular").val().trim() === "") {
            arr.push("Ingrese un celular");
        }
    //}

    if ($("#txt-institucion").val().trim() === "") {
        arr.push("Ingrese el nombre de la Institución");
    }

    if ($("#txt-ruc").val().length < 11) {
        arr.push("El ruc debe contener 11 caracteres");
    }

    if ($("#cbo-sector").val() == 0) {
        arr.push("Debe seleccionar un Sector");
    }

    if (clave == validar) {
        if (!(/[a-zñ]/.test(clave) && /[A-ZÑ]/.test(clave) && /[0-9]/.test(clave) && /[@#.]/.test(clave))) {
            arr.push("La contraseña debe contener minúscula(s), mayúscula(s), número(s) y caracter(es) especial(es) [@#.]");
        }
        if (clave.length < 6) {
            arr.push("La contraseña debe contener 6 o más caracteres por seguridad");
        }
    } else {
        arr.push("Las contraseñas no coinciden");
    }

    //if ($("#cbo-sector").val() == 2) {
    //    if (!($('#fledeclaracion').val())) {
    //        arr.push("Debe adjuntar la declaración jurada");
    //    }
    //}    

    if (!($("#chk-terminos-condiciones").prop("checked"))) {
        arr.push("Debe aceptar los términos y condiciones");
    }

    if (grecaptcha.getResponse() == "") {
        e.preventDefault();
        arr.push("Por favor verificar el captcha.");
    }

    if (arr.length == 0) {
        fn_verificarEmail();
        return true;
    } else {
        var error = '<ul>';
        $.each(arr, function (ind, elem) {
            error = error + '<li><small class="mb-0">' + elem + '</li></small>';
        });
        error = error + '</ul>';
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
        msj = msj + error;
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#seccionMensaje").append(msj);
        return false;
    }
}

//$("#formRegistrar").on("submit", function (e) {
//    e.preventDefault();
//    var arr = [];
//    var clave = $("#txt-pswd").val();
//    var validar = $("#txt-re-pswd").val();
//    $("#seccionMensaje #errorRegistro").remove();
//    //debugger;
//    if (clave == validar) {
//        if (!(/[a-zñ]/.test(clave) && /[A-ZÑ]/.test(clave) && /[0-9]/.test(clave))) {
//            arr.push("La contraseña debe contener minuscula(s), mayúscula(s) y número(s)");
//        }
//        if (clave.length < 6) {
//            arr.push("La contraseña debe contener 6 o más caracteres");
//        }
//    } else {
//        arr.push("Las contraseñas no coinciden");
//    }

//    if (!($('#fle-declaracion').val())) {
//        arr.push("Debe adjuntar la declaración jurada");
//    }

//    if (!($("#chk-terminos-condiciones").prop("checked"))) {
//        arr.push("Debe aceptar los términos y condiciones");
//    }

//    if (arr.length == 0) {
//        fn_verificarEmail();
//        return true;
//    } else {
//        var error = '<ul>';
//        $.each(arr, function (ind, elem) {
//            error = error + '<li><small class="mb-0">' + elem + '</li></small>';
//        });
//        error = error + '</ul>';
//        var msj = '                      <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="errorRegistro">';
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
//        msj = msj + '                                <h6>Error de registro</h6>';
//        msj = msj + error;
//        msj = msj + '                            </div>';
//        msj = msj + '                        </div>';
//        $("#seccionMensaje").append(msj);
//        return false;
//    }
//});


function fn_registrarUsuario() {
    var url = baseUrl + "Portal/RegistrarUsuario2";
    var item = {
        EMAIL_USUARIO: $("#txt-user").val(),
        NOMBRES_USUARIO: $("#txt-nombre").val(),
        APELLIDOS_USUARIO: $("#txt-apellido").val(),
        PASSWORD_USUARIO: $("#txt-pswd").val(),
        TELEFONO_USUARIO: $("#txt-telefono").val(),
        CELULAR_USUARIO: $("#txt-celular").val(),
        ANEXO_USUARIO: $("#txt-anexo").val(),
        ID_ROL: 1,
        ID_ESTADO_USUARIO: '0',
        ID_SECTOR_INST: $("#cbo-sector").val(),
        INSTITUCION: $("#txt-institucion").val(),
        RUC: $("#txt-ruc").val(),
        DIRECCION: $("#txt-direccion").val(),
        TERMINOS: '1'
    };

    var options = {
        type: "POST",
        dataType: "json",
        contentType: false,
        url: url,
        processData: false,
        data: ({
            EMAIL_USUARIO: $("#txt-user").val(),
            NOMBRES_USUARIO: $("#txt-nombre").val(),
            APELLIDOS_USUARIO: $("#txt-apellido").val(),
            PASSWORD_USUARIO: $("#txt-pswd").val(),
            TELEFONO_USUARIO: $("#txt-telefono").val(),
            CELULAR_USUARIO: $("#txt-celular").val(),
            ANEXO_USUARIO: $("#txt-anexo").val(),
            ID_ROL: 1,
            ID_ESTADO_USUARIO: '0',
            ID_SECTOR_INST: $("#cbo-sector").val(),
            INSTITUCION: $("#txt-institucion").val(),
            RUC: $("#txt-ruc").val(),
            DIRECCION: $("#txt-direccion").val(),
            TERMINOS: '1'
        }),
        xhr: function () {  // Custom XMLHttpRequest
            var myXhr = $.ajaxSettings.xhr();
            if (myXhr.upload) { // Check if upload property exists
                //myXhr.upload.addEventListener('progress', progressHandlingFunction, false); // For handling the progress of the upload
            }
            return myXhr;
        },
        resetForm: false,
        beforeSubmit: function (formData, jqForm, options) {
            return true;
        },
        success: function (response, textStatus, myXhr) {
            if (response.success) {
                var msj = '                       <div class="alert alert-success d-flex align-items-stretch" role="alert">';
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
                msj = msj + '                                <hr><small class="mb-0">Su registro fue exitoso, en breve le notificaremos el estado a través de un email.</small>';
                msj = msj + '                            </div>';
                msj = msj + '                        </div>';
                $("#btnRegistrar").hide();
                $("#seccionMensaje").append(msj);
                setTimeout(dirigir, 5000);
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
                msj = msj + '                                <hr><small class="mb-0">Ocurrio un problema durante el registro.</small>';
                msj = msj + '                            </div>';
                msj = msj + '                        </div>';
                $("#seccionMensaje").append(msj);
            }
        },
        error: function (myXhr, textStatus, errorThrown) {
            console.log(myXhr);
            console.log(textStatus);
            console.log(errorThrown);
        }
    };

    $("#formRegistrar").ajaxForm(options);
    $("#formRegistrar").submit();


    //var respuesta = MRV.Ajax(url, item, false);
    //if (respuesta.success) {
    //    var msj = '                       <div class="alert alert-success d-flex align-items-stretch" role="alert">';
    //    msj = msj + '                            <div class="alert-wrap mr-3">';
    //    msj = msj + '                                <div class="sa">';
    //    msj = msj + '                                    <div class="sa-success">';
    //    msj = msj + '                                        <div class="sa-success-tip"></div>';
    //    msj = msj + '                                        <div class="sa-success-long"></div>';
    //    msj = msj + '                                        <div class="sa-success-placeholder"></div>';
    //    msj = msj + '                                        <div class="sa-success-fix"></div>';
    //    msj = msj + '                                    </div>';
    //    msj = msj + '                                </div>';
    //    msj = msj + '                            </div>';
    //    msj = msj + '                            <div class="alert-wrap">';
    //    msj = msj + '                                <h6>Bien hecho</h6>';
    //    msj = msj + '                                <hr><small class="mb-0">Su registro fue exitoso, en breve le notificaremos el estado a través de un email.</small>';
    //    msj = msj + '                            </div>';
    //    msj = msj + '                        </div>';
    //    $("#seccionMensaje").append(msj);
    //    setTimeout(dirigir, 10000);
    //} else {
    //    var msj = '                      <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="errorRegistro">';
    //    msj = msj + '                           <div class="alert-wrap mr-3">';
    //    msj = msj + '                                <div class="sa">';
    //    msj = msj + '                                    <div class="sa-error">';
    //    msj = msj + '                                        <div class="sa-error-x">';
    //    msj = msj + '                                            <div class="sa-error-left"></div>';
    //    msj = msj + '                                            <div class="sa-error-right"></div>';
    //    msj = msj + '                                        </div>';
    //    msj = msj + '                                        <div class="sa-error-placeholder"></div>';
    //    msj = msj + '                                        <div class="sa-error-fix"></div>';
    //    msj = msj + '                                    </div>';
    //    msj = msj + '                                </div>';
    //    msj = msj + '                            </div>';
    //    msj = msj + '                            <div class="alert-wrap">';
    //    msj = msj + '                                <h6>Error de registro</h6>';
    //    msj = msj + '                                <hr><small class="mb-0">Ocurrio un problema durante el registro.</small>';
    //    msj = msj + '                            </div>';
    //    msj = msj + '                        </div>';
    //    $("#seccionMensaje").append(msj);
    //}
}



$(function () {
    $(".validar").keydown(function (event) {
        //alert(event.keyCode);
        if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105) && event.keyCode !== 190 && event.keyCode !== 110 && event.keyCode !== 8 && event.keyCode !== 9) {
            return false;
        }
    });
});

$(document).ready(function () {
    CargarListaSectorInstitucion();
    $("#txt-user").attr("pattern", "^[a-zA-Z0-9.!#$%&amp;’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:.[a-zA-Z0-9-]+)*$");
    $("#txt-nombre").attr("pattern", "[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{3,54}");
    $("#txt-apellido").attr("pattern", "[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{8,54}");
    $("#txt-institucion").attr("pattern", "[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{8,70}");
    $("#txt-direccion").attr("pattern", "[a-zA-Z0-9 /\@#$%&amp;]+");
    $("#txt-pswd").attr("pattern", "(?=.*\d)(?=.*[!@#$&*])(?=.*[a-z])(?=.*[A-Z]).{6,}");
    //$("#btnRegistrar").prop("disabled", true);

    //$("#btnRegistrar").removeClass("btn-primary").addClass("btn-default");
    $("#btnRegistrar").click(function (e) {
        fn_validar(e);
    });
});

$(document).on('change', '#fledeclaracion', function () {
    var fileInput = this.value;
    var fileName = this.files[0].name;
    var fileSize = this.files[0].size;

    var ext = /(.pdf)$/i;
    //$("#mensajeFile #msj").remove();
    if (ext.exec(fileInput) /*&& fileName == "modelo-declaracion-jurada.pdf"*/ && (fileSize <= 1000000)) {
        //$("#mensajeFile").append('<small style="color: green;" id="msj">Documento cargado</small>');
    } else {
        $("#txt-declaracion").val("");
        this.value = '';
        //$("#mensajeFile").append('<small style="color: red;" id="msj">*archivo no permitido</small>');
    }
});

$(document).on('change', '#cbo-sector', function () {
    if ($("#cbo-sector").val() == 1) {
        $("#txt-declaracion").val("");
        $("#fledeclaracion").val("");
    }
});