$(document).ready(function () {
    fn_ListarGEI();
    fn_ListarENERG();
    fn_ListarUbicacion();

    //alert($("#Control").data("iniciativa"));
    if ($("#Control").data("iniciativa") > 0) {
        //alert("entre");
        CargarDatosIniciativa();
        fn_cargarAvance();
        if ($("#Control").data("rol") == 2){
            fn_deshabilitarCampo();
            $("#botonRegistrar").hide();
            $("#botonRevisar").show();
            $("#correctoRevisarIniciativa").hide();
        } else {
            $("#botonRevisar").hide();
        }
    } else {
        fn_ObtenerMedidaMitigacion($("#Control").data("mitigacion"));
        CargarDatosIniciativa();
    }
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
                        var check = '<div class="col-auto my-1">';
                        check = check + '<div class="custom-control custom-checkbox mr-sm-2">';
                        check = check + '    <input class="custom-control-input" type="checkbox" id="G' + (i + 1) + '" data-value="' + data[i]["ID_GEI"] + '" >';
                        check = check + '    <label class="custom-control-label" for="G' + (i + 1) + '">' + data[i]["DESCRIPCION"] + '</label>';
                        check = check + '</div>';
                        check = check + '</div>';
                        $("#listaGei").append(check);
                    }
                    $("#listaGei").data("cantidad", data.length);
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
                        var check = '<div class="col-auto my-1">';
                        check = check + '<div class="custom-control custom-checkbox mr-sm-2">';
                        check = check + '    <input class="custom-control-input" type="checkbox" id="E' + (i + 1) + '" data-value="' + data[i]["ID_ENERG"] + '" >';
                        check = check + '    <label class="custom-control-label" for="E' + (i + 1) + '">' + data[i]["DESCRIPCION"] + '</label>';
                        check = check + '</div>';
                        check = check + '</div>';
                        $("#listaEnerg").append(check);
                    }
                    $("#listaEnerg").data("cantidad", data.length);
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
                        var check = '<div class="col-auto my-1">';
                        check = check + '<div class="custom-control custom-checkbox mr-sm-2">';
                        check = check + '   <input class="custom-control-input" type="checkbox" id="U' + (i + 1) + '" data-value="' + data[i]["ID_UBICACION"] + '" >';
                        check = check + '   <label class="custom-control-label" for="U' + (i + 1) + '">';
                        check = check + '           '+ data[i]["DESCRIPCION"];
                        check = check + '   </label>';
                        check = check + '</div>';
                        check = check + '</div>';
                        $("#listaUbicacion").append(check);
                    }
                    $("#listaUbicacion").data("cantidad", data.length);
                }
            }
        }
    });
}

function CargarDatosIniciativa() {
    $("#nombreResponsable").val($("#Control").data("nombres"));
    $("#nombreInstitucion").val($("#Control").data("institucion"));
    $("#correoElectronico").val($("#Control").data("correo"));
    $("#direccionInstitucion").val($("#Control").data("direccion"));
    $("#sectorInstitucion").val($("#Control").data("sector"));
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarMoneda", "#regMoneda", "ID_MONEDA", "DESCRIPCION");
    $("#errorRegistroIniciativa").hide();
    $("#correctoRegistroIniciativa").hide();
}

function fn_RegistrarIniciativaMitigacion() {
    var url = baseUrl + "Administrado/Gestion/RegistrarIniciativaMitigacion";
    var terminos = $("input:checkbox[id=regPrivacidad]:checked").val();
    var privacidad = '0';
    if (terminos) {
        privacidad = '1'; //0 - PRIVADO : 1 - PUBLICO
    }

    var energetico = "";
    for (var i = 0; i < $("#listaEnerg").data("cantidad") ; i++) {
        if ($('#E' + (i + 1)).prop('checked')) {
            energetico = energetico + $('#E' + (i + 1)).data("value") + "," + "1/";
        }
    }
    energetico = energetico.substring(0, energetico.length - 1);

    var gei = "";
    for (var i = 0; i < $("#listaGei").data("cantidad") ; i++) {
        if ($('#G' + (i + 1)).prop('checked')) {
            gei = gei + $('#G' + (i + 1)).data("value") + "," + "1/";
        }
    }
    gei = gei.substring(0, gei.length - 1);

    var ubicacion = "";
    for (var i = 0; i < $("#listaUbicacion").data("cantidad") ; i++) {
        if ($('#U' + (i + 1)).prop('checked')) {
            ubicacion = ubicacion + $('#U' + (i + 1)).data("value") + "," + "1/";
        }
    }
    ubicacion = ubicacion.substring(0, ubicacion.length - 1);

    var item = {
        ID_MEDMIT: $("#Control").data("mitigacion"),
        ID_USUARIO: $("#Control").data("usuario"),
        NOMBRE_INICIATIVA: $("#regNombreIniciativa").val(),
        DESC_INICIATIVA: $("#regDescripcionMedida").val(),
        PRIVACIDAD_INICIATIVA: privacidad,
        INVERSION_INICIATIVA: $("#regMontoInversion").val(),
        ID_MONEDA: $("#regMoneda").val(),
        FECHA_IMPLE_INICIATIVA: $("#regFechaImplementacion").val(),
        ID_ESTADO: 1,
        ENERGETICO: energetico,
        GEI: gei,
        UBICACION: ubicacion
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        /*Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Registro de Iniciativa Satisfacttorio',
            showConfirmButton: false,
            timer: 1700
        })*/

        $("#cabeceraSolicitud").hide();
        $("#publicarDatos").hide();
        $("#errorRegistroIniciativa").hide();
        $("#pieModalIniciativa").hide();
        $("#correctoRegistroIniciativa").show();          
        $("#Control").data("modal", 1);
        if (respuesta.extra == "1") {
            if (ws != null) ws.send(respuesta.extra);
        }
    } else {
        /*Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante el registro de la Iniciativa'
        })*/

        $("#cabeceraSolicitud").hide();
        $("#publicarDatos").hide();
        $("#pieModalIniciativa").hide();
        $("#correctoRegistroIniciativa").hide();
        $("#errorRegistroIniciativa").show();        
    }


    $("#solicitar-revision").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            fn_accionesMitigacion(); //Invocado desde SesionLayout
        } else {
            $("#cabeceraSolicitud").show();
            $("#publicarDatos").show();
            $("#pieModalIniciativa").show();
            $("#correctoRegistroIniciativa").hide();
            $("#errorRegistroIniciativa").hide();
        }
        
    });

}

function fn_registrarAvance() {
    var url = baseUrl + "Administrado/Gestion/RegistrarIniciativaMitigacion";
    var terminos = $("input:checkbox[id=regPrivacidad]:checked").val();
    var privacidad = '0';
    if (terminos) {
        privacidad = '1'; //0 - PRIVADO : 1 - PUBLICO
    }

    var energetico = "";
    for (var i = 0; i < $("#listaEnerg").data("cantidad") ; i++) {
        if ($('#E' + (i + 1)).prop('checked')) {
            energetico = energetico + $('#E' + (i + 1)).data("value") + "," + "1/";
        }
    }
    energetico = energetico.substring(0, energetico.length - 1);

    var gei = "";
    for (var i = 0; i < $("#listaGei").data("cantidad") ; i++) {
        if ($('#G' + (i + 1)).prop('checked')) {
            gei = gei + $('#G' + (i + 1)).data("value") + "," + "1/";
        }
    }
    gei = gei.substring(0, gei.length - 1);

    var ubicacion = "";
    for (var i = 0; i < $("#listaUbicacion").data("cantidad") ; i++) {
        if ($('#U' + (i + 1)).prop('checked')) {
            ubicacion = ubicacion + $('#U' + (i + 1)).data("value") + "," + "1/";
        }
    }
    ubicacion = ubicacion.substring(0, ubicacion.length - 1);

    var item = {
        ID_MEDMIT: $("#Control").data("mitigacion"),
        ID_USUARIO: $("#Control").data("usuario"),
        NOMBRE_INICIATIVA: $("#regNombreIniciativa").val(),
        DESC_INICIATIVA: $("#regDescripcionMedida").val(),
        PRIVACIDAD_INICIATIVA: privacidad,
        INVERSION_INICIATIVA: $("#regMontoInversion").val(),
        ID_MONEDA: $("#regMoneda").val(),
        FECHA_IMPLE_INICIATIVA: $("#regFechaImplementacion").val(),
        ID_ESTADO: 0,
        ENERGETICO: energetico,
        GEI: gei,
        UBICACION: ubicacion
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        /*Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Registro de Iniciativa Satisfacttorio',
            showConfirmButton: false,
            timer: 1700
        })*/

        $("#cabeceraSolicitud").hide();
        $("#publicarDatos").hide();
        $("#errorRegistroIniciativa").hide();
        $("#pieModalIniciativa").hide();
        $("#correctoRegistroIniciativa").show();
        $("#Control").data("modal", 1);
    } else {

        $("#cabeceraSolicitud").hide();
        $("#publicarDatos").hide();
        $("#pieModalIniciativa").hide();
        $("#correctoRegistroIniciativa").hide();
        $("#errorRegistroIniciativa").show();
    }
}

function fn_actualizarAvance() {
    var url = baseUrl + "Administrado/Gestion/RegistrarIniciativaMitigacion";
    var terminos = $("input:checkbox[id=regPrivacidad]:checked").val();
    var privacidad = '0';
    if (terminos) {
        privacidad = '1'; //0 - PRIVADO : 1 - PUBLICO
    }

    var energetico = "";
    for (var i = 0; i < $("#listaEnerg").data("cantidad") ; i++) {
        if ($('#E' + (i + 1)).prop('checked')) {
            energetico = energetico + $('#E' + (i + 1)).data("value") + "," + "1/";
        }
    }
    energetico = energetico.substring(0, energetico.length - 1);

    var gei = "";
    for (var i = 0; i < $("#listaGei").data("cantidad") ; i++) {
        if ($('#G' + (i + 1)).prop('checked')) {
            gei = gei + $('#G' + (i + 1)).data("value") + "," + "1/";
        }
    }
    gei = gei.substring(0, gei.length - 1);

    var ubicacion = "";
    for (var i = 0; i < $("#listaUbicacion").data("cantidad") ; i++) {
        if ($('#U' + (i + 1)).prop('checked')) {
            ubicacion = ubicacion + $('#U' + (i + 1)).data("value") + "," + "1/";
        }
    }
    ubicacion = ubicacion.substring(0, ubicacion.length - 1);

    var item = {
        ID_MEDMIT: $("#Control").data("mitigacion"),
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
        /*Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Registro de Iniciativa Satisfacttorio',
            showConfirmButton: false,
            timer: 1700
        })*/

        $("#cabeceraSolicitud").hide();
        $("#publicarDatos").hide();
        $("#errorRegistroIniciativa").hide();
        $("#pieModalIniciativa").hide();
        $("#correctoRegistroIniciativa").show();
        $("#Control").data("modal", 1);
    } else {

        $("#cabeceraSolicitud").hide();
        $("#publicarDatos").hide();
        $("#pieModalIniciativa").hide();
        $("#correctoRegistroIniciativa").hide();
        $("#errorRegistroIniciativa").show();
    }
}

function fn_guardarAvances() {
    if ($("#Control").data("iniciativa") == 0) {
        fn_registrarAvance();
    } else {
        fn_actualizarAvance($("#Control").data("iniciativa"));
    }
}

function fn_cargarAvance() {
    fn_cargarUbicacion();
    fn_cargarGei();
    fn_cargarEnergetico();
    fn_cargarIniciativa();
}

function fn_cargarUbicacion() {
    var Item =
    {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    };

    $.ajax({
        url: baseUrl + "Administrado/Gestion/CargarSeleccionUbicacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var j = 0; j < data.length; j++) {
                        for (var i = 0; i < $("#listaUbicacion").data("cantidad") ; i++) {
                            if ($('#U' + (i + 1)).data("value") == data[j]["ID_UBICACION"]) {
                                $('#U' + (i + 1)).prop('checked', true);
                            }
                        }
                    }
                }
            }
        }
    });

}

function fn_cargarGei() {
    var Item =
    {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    };
    $.ajax({
        url: baseUrl + "Administrado/Gestion/CargarSeleccionGei",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var j = 0; j < data.length; j++) {
                        //alert("T:" + $("#listaUbicacion").data("cantidad"));
                        for (var i = 0; i < $("#listaGei").data("cantidad") ; i++) {
                            //alert("IDF:" + $('#U' + (i + 1)).data("value") + "  idbd:" + data[j]["ID_UBICACION"]);
                            if ($('#G' + (i + 1)).data("value") == data[j]["ID_GEI"]) {
                                $('#G' + (i + 1)).prop('checked', true);
                            }
                        }
                    }
                }
            }
        }
    });
}

function fn_cargarEnergetico() {
    var Item =
    {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    };
    $.ajax({
        url: baseUrl + "Administrado/Gestion/CargarSeleccionEnergetico",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var j = 0; j < data.length; j++) {
                        for (var i = 0; i < $("#listaEnerg").data("cantidad") ; i++) {
                            if ($('#E' + (i + 1)).data("value") == data[j]["ID_ENERG"]) {
                                $('#E' + (i + 1)).prop('checked', true);
                            }
                        }
                    }
                }
            }
        }
    });
}

function fn_cargarIniciativa() {
    var Item =
    {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    };
    $.ajax({
        url: baseUrl + "Administrado/Gestion/CargarSeleccionIniciativa",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                alert("entre");
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        fn_ObtenerMedidaMitigacion(data[i]["ID_MEDMIT"]);
                        $("#Control").data("mitigacion", data[i]["ID_MEDMIT"]);
                        $("#regNombreIniciativa").val(data[i]["NOMBRE_INICIATIVA"]);
                        $("#regDescripcionMedida").val(data[i]["DESC_INICIATIVA"]);
                        $("#regMontoInversion").val(data[i]["INVERSION_INICIATIVA"]);
                        $("#regMoneda").val(data[i]["ID_MONEDA"]);
                        $("#regFechaImplementacion").val(data[i]["FECHA_IMPLE_INICIATIVA"]);
                        if (data[i]["PRIVACIDAD_INICIATIVA"] == 1) {
                            $("regPrivacidad").prop("checked", true);
                        }
                    }
                }
            }
        }
    });
}

function fn_deshabilitarCampo() {
    $('#regNombreIniciativa').attr('readonly', 'readonly');
    $('#regDescripcionMedida').prop('readonly', true);
    $('#regMontoInversion').attr('readonly', true);
    $('#regMoneda').attr('readonly', true);
    $('#regNombreIniciativa').attr('readonly', true);
    $('#regFechaImplementacion').attr('readonly', true);
}

function fn_revisarIniciativaMitigacion() {
    alert($("#Control").data("iniciativa") + ' ' + $("#Control").data("usuario"));
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario")
    }
    url = baseUrl + "Administrado/Gestion/AprobarIniciativaMitigacion";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        /*Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Se aprobó la revisión de la iniciativa',
            showConfirmButton: false,
            timer: 1700
        })*/
        $("#correctoRevisarIniciativa").show();
        $("#pieRevisarModal").hide();        
        $("#Control").data("modal", 1);
    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la aprobación'
        })
    }

    $("#revision").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            fn_accionesMitigacion(); //Invocado desde SesionLayout
        } else {
            $("#correctoRevisarIniciativa").hide();
            $("#pieRevisarModal").show();
        }

    });
}