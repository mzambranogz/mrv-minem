﻿$(document).ready(function () {
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarMedidaMitigacion", "#regMitigacion", "ID_MEDMIT", "NOMBRE_MEDMIT");
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarMoneda", "#regMoneda", "ID_MONEDA", "DESCRIPCION");
    fn_ObtenerInformacionUsuario();
    fn_ListarGEI();
    fn_ListarENERG();
    //alert($("#Control").data("usuario"));
});

function fn_ObtenerMedidaMitigacion() {

    var select = $("#regMitigacion").val();
    if (select > 0) {
        var Item = {
            ID_MEDMIT: select
        };

        $.ajax({
            url: baseUrl + "Administrado/Gestion/ObtenerMedidaMitigacion",
            type: 'POST',
            datatype: 'json',
            data: Item,
            success: function (data) {
                if (data != null && data != "") {
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            $("#regCategoria").val(data[i]["IPSC_MEDMIT"]);                            
                            $("#regObjetivo").val(data[i]["OBJETIVO_MEDMIT"]);
                            $("#regDescripcion").val(data[i]["DESCRIPCION_MEDMIT"]);
                            $("#regCategoria").prop("disabled", true);
                            $("#regObjetivo").prop("disabled", true);
                            $("#regDescripcion").prop("disabled", true);
                        }
                    }
                }
            }
        });
    }

}


function fn_ObtenerInformacionUsuario() {

    var select = $("#Control").data("usuario");
    //alert(select);
    if (select > 0) {
        var Item = {
            ID_USUARIO: select
        };

        $.ajax({
            url: baseUrl + "Administrado/Gestion/ObtenerInformacionUsuario",
            type: 'POST',
            datatype: 'json',
            data: Item,
            success: function (data) {
                if (data != null && data != "") {
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            $("#regNombreResponsable").val(data[i]["NOMBRES_USUARIO"] + ' ' + data[i]["APELLIDOS_USUARIO"]);
                            $("#regCorreoResponsable").val(data[i]["EMAIL_USUARIO"]);
                            $("#regNombreInstitucion").val(data[i]["INSTITUCION"]);
                            $("#regDireccionInstitucion").val(data[i]["DIRECCION"]);
                            $("#regSectorInstitucion").val(data[i]["SECTOR"]);
                            $("#regNombreResponsable").prop("disabled", true);
                            $("#regCorreoResponsable").prop("disabled", true);
                            $("#regNombreInstitucion").prop("disabled", true);
                            $("#regDireccionInstitucion").prop("disabled", true);
                            $("#regSectorInstitucion").prop("disabled", true);
                        }
                    }
                }
            }
        });
    }

}

function fn_ListarGEI() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Administrado/Gestion/ListarGEI",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var check = '<div class="form-group">';
                            check = check + '<div class="custom-control custom-checkbox">';
                            check = check + '    <div class="custom-control custom-checkbox">';
                            check = check +         '<input class="custom-control-input" type="checkbox" id="G'+data[i]["ID_GEI"]+'">';
                            check = check +         '<label class="custom-control-label" for="G' + data[i]["ID_GEI"] + '">' + data[i]["DESCRIPCION"] + '</label>';
                            check = check +     '</div>';
                            check = check + '</div>';
                            $("#listaGEI").append(check);
                    }
                }
            }
        }
    });
}

function fn_ListarENERG() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Administrado/Gestion/ListarENERG",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var check = '<div class="form-group">';
                        check = check + '<div class="custom-control custom-checkbox">';
                        check = check + '    <div class="custom-control custom-checkbox">';
                        check = check + '<input class="custom-control-input" type="checkbox" id="E' + data[i]["ID_ENERG"] + '">';
                        check = check + '<label class="custom-control-label" for="E' + data[i]["ID_ENERG"] + '">' + data[i]["DESCRIPCION"] + '</label>';
                        check = check + '</div>';
                        check = check + '</div>';
                        $("#listaENERG").append(check);
                    }
                }
            }
        }
    });
}

function fn_RegistrarIniciativaMitigacion() {
    var url = baseUrl + "Administrado/Gestion/RegistrarIniciativaMitigacion";
    var terminos = $("input:checkbox[id=regPrivacidad]:checked").val();
    var privacidad = '0';
    if (terminos) {
        privacidad = '1'; //0 - PRIVADO : 1 - PUBLICO
    }
    alert(privacidad);
    var item = {
        ID_MEDMIT: $("#regMitigacion").val(),
        ID_USUARIO: $("#Control").data("usuario"),
        NOMBRE_INICIATIVA: $("#regNombreIniciativa").val(),
        DESC_INICIATIVA: $("#regDescripcionMedida").val(),
        PRIVACIDAD_INICIATIVA: privacidad,
        INVERSION_INICIATIVA: $("#regMontoInversion").val(),
        ID_MONEDA: $("#regMoneda").val(),
        FECHA_IMPLE_INICIATIVA: $("#regFechaImplementacion").val()
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Registro de Iniciativa Satisfacttorio',
            showConfirmButton: false,
            timer: 1700
        })

    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante el registro de la Iniciativa'
        })
    }
}