$(document).ready(function () {
    //CargarListaSectorInstitucion();
});

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
    alert("entre");
    item = {
        EMAIL_USUARIO: $("#txt-user").val()
    };
    var url = baseUrl + "Portal/VerificarEmail";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        //fn_GrabarUsuario();
        //alert("aqui");
    } else {
        //alert("no aqui");
    }
}

function dirigir() {
    location.href = baseUrl + "Home/Index";
}

$("#formRegistrar").on("submit", function () {
    var arr = [];
    var msj = "";
    var error = "";
    var clave = $("#txt-pswd").val();
    var validar = $("#txt-re-pswd").val();
    $("#seccionMensaje #errorRegistro").remove();
    if (clave == validar) {
        if (!(/[a-zñ]/.test(clave) && /[A-ZÑ]/.test(clave) && /[0-9]/.test(clave))) {
            arr.push("La contraseña debe contener minuscula(s), mayúscula(s) y número(s)");
        }
        if (clave.length < 6) {
            arr.push("La contraseña debe contener 6 o más caracteres");
        }
    } else {
        arr.push("Las contraseñas no coinciden");
    }

    if (!($('#fle-declaracion').val())) {
        arr.push("Debe adjuntar la declaración jurada");
    }

    if (!($("#chk-terminos-condiciones").prop("checked"))) {
        arr.push("Debe aceptar los términos y condiciones");
    }    

    if (arr.length == 0) {
        msj = msj + '                       <div class="alert alert-success d-flex align-items-stretch" role="alert">';
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
        $("#seccionMensaje").append(msj);
        setTimeout(dirigir, 10000);
        return false;
    } else {
        error = error + '<ul>'
        $.each(arr, function (ind, elem) {
            error = error + '<li><small class="mb-0">' + elem + '</li></small>';
        });
        error = error + '</ul>';
        msj = msj + '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="errorRegistro">';
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
        msj = msj + error;
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#seccionMensaje").append(msj);        
        return false;
    }   
});





function fn_registrarUsuario() {

}




function fn_GrabarUsuario() {
    var url = baseUrl + "Publico/Portal/RegistrarUsuario";
    var item = {
        EMAIL_USUARIO: $("#txt-user").val(),
        NOMBRES_USUARIO: $("#txt-nombre").val(),
        APELLIDOS_USUARIO: $("#txt-pswd").val(),
        PASSWORD_USUARIO: $("#txt-pswd").val(),
        TELEFONO_USUARIO: $("#txt-telefono").val(),
        CELULAR_USUARIO: $("#txt-celular").val(),
        ANEXO_USUARIO: $("#txt-anexo").val(),
        ID_SECTOR_INST: $("#cbo-sector").val(),
        INSTITUCION: $("#txt-institucion").val(),
        RUC: $("#txt-ruc").val(),
        DIRECCION: $("#txt-direccion").val(),
        TERMINOS: '1'
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Registro de Usuario correcto',
            showConfirmButton: false,
            timer: 1700
        })

        fn_Home();
    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante el registro del Usuario'
        })
    }

}