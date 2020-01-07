$(document).ready(function () {
    //MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarMedidaMitigacion", "#regMitigacion", "ID_MEDMIT", "NOMBRE_MEDMIT");
    fn_ObtenerMedidaMitigacion($("#Control").data("mitigacion"))
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarMoneda", "#regMoneda", "ID_MONEDA", "DESCRIPCION");
    //fn_ObtenerInformacionUsuario();
    fn_ListarGEI();
    fn_ListarENERG();
    fn_ListarUbicacion();
    //alert($("#Control").data("usuario"));
});

function fn_ObtenerMedidaMitigacion(id) {

    var Item = {
        ID_MEDMIT: id
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
                        /*$("#regCategoria").prop("disabled", true);
                        $("#regObjetivo").prop("disabled", true);
                        $("#regDescripcion").prop("disabled", true);*/
                    }
                }
            }
        }
    });

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
                        check = check + '<input class="custom-control-input" type="checkbox" id="G' + (i + 1) + '" data-value="' + data[i]["ID_GEI"] + '" >';
                        check = check + '<label class="custom-control-label" for="G' + (i + 1) + '">' + data[i]["DESCRIPCION"] + '</label>';
                        check = check + '</div>';
                        check = check + '</div>';
                        $("#listaGEI").append(check);
                    }
                    $("#listaGEI").data("cantidad", data.length);
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
                        check = check + '<input class="custom-control-input" type="checkbox" id="E' + (i + 1) + '" data-value="' + data[i]["ID_ENERG"] + '" >';
                        check = check + '<label class="custom-control-label" for="E' + (i + 1) + '">' + data[i]["DESCRIPCION"] + '</label>';
                        check = check + '</div>';
                        check = check + '</div>';
                        $("#listaENERG").append(check);
                    }
                    $("#listaENERG").data("cantidad", data.length);
                }
            }
        }
    });
}

function fn_ListarUbicacion() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Administrado/Gestion/ListarUbicacion",
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
                        check = check + '<input class="custom-control-input" type="checkbox" id="U' + (i + 1) + '" data-value="' + data[i]["ID_UBICACION"] + '" >';
                        check = check + '<label class="custom-control-label" for="U' + (i + 1) + '">' + data[i]["DESCRIPCION"] + '</label>';
                        check = check + '</div>';
                        check = check + '</div>';
                        $("#listaUBICACION").append(check);
                    }
                    $("#listaUBICACION").data("cantidad", data.length);
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

    var energetico = "";
    for (var i = 0; i < $("#listaENERG").data("cantidad") ; i++) {
        if ($('#E' + (i + 1)).prop('checked')) {
            //alert($('#E'+(i+1)).data("value"));
            energetico = energetico + $('#E' + (i + 1)).data("value") + "," + "1/";
        }
        //else {
        //  energetico = energetico + $('#E' + (i + 1)).data("value") + "," + "0/";
        //}
    }
    energetico = energetico.substring(0, energetico.length - 1);

    var gei = "";
    for (var i = 0; i < $("#listaGEI").data("cantidad") ; i++) {
        if ($('#G' + (i + 1)).prop('checked')) {
            gei = gei + $('#G' + (i + 1)).data("value") + "," + "1/";
        }
    }
    gei = gei.substring(0, gei.length - 1);
    //alert(gei);

    var ubicacion = "";
    for (var i = 0; i < $("#listaUBICACION").data("cantidad") ; i++) {
        if ($('#U' + (i + 1)).prop('checked')) {
            ubicacion = ubicacion + $('#U' + (i + 1)).data("value") + "," + "1/";
        }
    }
    ubicacion = ubicacion.substring(0, ubicacion.length - 1);
    //alert(ubicacion);

    var item = {
        ID_MEDMIT: $("#regMitigacion").val(),
        ID_USUARIO: $("#Control").data("usuario"),
        NOMBRE_INICIATIVA: $("#regNombreIniciativa").val(),
        DESC_INICIATIVA: $("#regDescripcionMedida").val(),
        PRIVACIDAD_INICIATIVA: privacidad,
        INVERSION_INICIATIVA: $("#regMontoInversion").val(),
        ID_MONEDA: $("#regMoneda").val(),
        FECHA_IMPLE_INICIATIVA: $("#regFechaImplementacion").val(),
        ENERGETICO: energetico,
        GEI: gei,
        UBICACION: ubicacion
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