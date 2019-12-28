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

    var clave = $("#UsuPassword").val();
    var validar = $("#ConUsuPassword").val();
    console.log("entre");
    if (clave == validar) {
        fn_GrabarUsuario();
    } else {
        alert("Las contraseñas no coinciden");
    }
});

function fn_GrabarUsuario() {
    var url = baseUrl + "Publico/Portal/RegistrarUsuario";
    var item = {
        USUEMAIL: $("#UsuEmail").val(),
        USUNOM: $("#UsuNombre").val(),
        USUAPE: $("#UsuApellido").val(),
        USUPASS: $("#UsuPassword").val(),
        USUTELEFONO: $("#UsuTelefono").val(),
        USUCELULAR: $("#UsuCelular").val(),
        ID_SECTOR_INST: $("#UsuSector").val(),
        INSTITUCION: $("#UsuInstitucion").val(),
        RUC: $("#UsuRuc").val(),
        DIRECCION: $("#UsuDireccion").val()
    };
    
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        MRV.Alert('Registro', 'Registro de Usuario correcto');
    } else {
        MRV.Alert('Registro', 'Ocurrio error durante el registro del Usuario');
    }
}