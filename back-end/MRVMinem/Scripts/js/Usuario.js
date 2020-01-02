$(document).ready(function () {
    CargarListaSectorInstitucion();
});

function CargarListaSectorInstitucion() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Publico/Portal/ListaSectorInstitucion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#UsuSector").append('<option value="' + data[i]["ID_SECTOR_INST"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                    }
                }
            }
        }
    });
}

$("#UsuGrabar").click(function (e) {

    var mensajes = "";
    var clave = $("#UsuPassword").val();
    var validar = $("#ConUsuPassword").val();
    var terminos = $("input:checkbox[id=UsuTerminos]:checked").val();
    if (clave == validar) {

        if (!(/[a-zñ]/.test(clave) && /[A-ZÑ]/.test(clave) && /[0-9]/.test(clave))) {
            mensajes = mensajes + "<small>La contraseña debe contener minuscula(s), mayúscula(s) y número(s) </small><br>";
        }
        if (clave.length < 6) {
            mensajes = mensajes + "<small>La contraseña debe contener 6 o más caracteres </small><br>";
        }

    } else {
        mensajes = mensajes + "<small>Las contraseñas no coinciden </small><br>";
    }

    if (!(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test($("#UsuEmail").val()))) {
        mensajes = mensajes + "<small>Ingrese un correo electrónico válido </small><br>";
    }

    if (!(terminos)){
        mensajes = mensajes + "<small>Debe aceptar los términos y condiciones </small><br>";
    }

    if (mensajes == "") {
        fn_GrabarUsuario();
    } else {
        Swal.fire({
            icon: 'error',
            html: mensajes
        })
    }

});

function fn_GrabarUsuario() {
    var url = baseUrl + "Publico/Portal/RegistrarUsuario";
    var item = {
        EMAIL_USUARIO: $("#UsuEmail").val(),
        NOMBRES_USUARIO: $("#UsuNombre").val(),
        APELLIDOS_USUARIO: $("#UsuApellido").val(),
        PASSWORD_USUARIO: $("#UsuPassword").val(),
        TELEFONO_USUARIO: $("#UsuTelefono").val(),
        CELULAR_USUARIO: $("#UsuCelular").val(),
        ID_SECTOR_INST: $("#UsuSector").val(),
        INSTITUCION: $("#UsuInstitucion").val(),
        RUC: $("#UsuRuc").val(),
        DIRECCION: $("#UsuDireccion").val(),
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