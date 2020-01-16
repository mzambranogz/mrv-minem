function CargarDatosIniciativa() {
    $("#nombreResponsable").val($("#Control").data("nombres"));
    $("#nombreInstitucion").val($("#Control").data("institucion"));
    $("#correoElectronico").val($("#Control").data("correo"));
    $("#direccionInstitucion").val($("#Control").data("direccion"));
    $("#sectorInstitucion").val($("#Control").data("sector"));
    //$("#errorRegistroIniciativa").hide();
    //$("#correctoRegistroIniciativa").hide();
}

function CargarInicio() {
    CargarDatosIniciativa();
    if ($("#Control").data("iniciativa") > 0) {
        fn_cargarAvance();
        if ($("#Control").data("rol") == 2) {
            $("#correctoRevisarIniciativa").hide();
            $("#correctoObservacionIniciativa").hide();
        }
    } else {
        fn_ObtenerMedidaMitigacion($("#Control").data("mitigacion"));        
    }
}

function CargarMoneda() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Administrado/Gestion/ListarMoneda",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
        if (data != null && data != "") {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $("#regMoneda").append('<option value="' + data[i]["ID_MONEDA"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                }
            }
        }
        CargarInicio();
    });
}

function fn_ListarUbicacion() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Administrado/Gestion/ListarUbicacion",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
        if (data != null && data != "") {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var check = '<div class="col-auto my-1">';
                    check = check + '<div class="custom-control custom-checkbox mr-sm-2">';
                    check = check + '   <input class="custom-control-input" type="checkbox" id="U' + (i + 1) + '" data-value="' + data[i]["ID_UBICACION"] + '" >';
                    check = check + '   <label class="custom-control-label" for="U' + (i + 1) + '">';
                    check = check + '           ' + data[i]["DESCRIPCION"];
                    check = check + '   </label>';
                    check = check + '</div>';
                    check = check + '</div>';
                    $("#listaUbicacion").append(check);
                }
                $("#listaUbicacion").data("cantidad", data.length);
            }
        }
        CargarMoneda();
    });
}

function fn_ListarENERG() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Administrado/Gestion/ListarENERG",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
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
        fn_ListarUbicacion();
    });
}

function fn_ListarGEI() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Administrado/Gestion/ListarGEI",
        type: 'POST',
        datatype: 'json',
        data: Item
    })
    .done(function (data) {
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
        fn_ListarENERG();
    });
}


$(document).ready(function () {
    $("#Control").data("mitigacion", $("#identificador").val());
    fn_ListarGEI();
});
