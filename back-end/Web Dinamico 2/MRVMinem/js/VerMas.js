

function fn_cargarUbicacion() {
    var Item =
    {
        ID_INICIATIVA: $("#iniciativa").val()
    };

    $.ajax({
        url: baseUrl + "Gestion/CargarSeleccionUbicacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var msj = '<textarea class="form-control-plaintext" id="txa-ubicacion" aria-describedby="inputGroup9" cols="30" rows="5" readonly placeholder="Ingrese una descripción para su iniciativa">';
                    for (var j = 0; j < data.length; j++) {
                        msj = msj + data[j]["DESCRIPCION"] + '&nbsp\n';
                    }
                    msj = msj + ' </textarea>';
                    $("#campoUbicacion").append(msj);
                }
            }
        }
    });

}

function fn_cargarGei() {
    var Item =
    {
        ID_INICIATIVA: $("#iniciativa").val()
    };
    $.ajax({
        url: baseUrl + "Gestion/CargarSeleccionGei",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var msj = '<textarea class="form-control-plaintext" id="mlt-energetico" aria-describedby="inputGroup9" cols="30" rows="5" readonly placeholder="Ingrese una descripción para su iniciativa">';
                    for (var j = 0; j < data.length; j++) {
                        msj = msj + data[j]["DESCRIPCION"] + '&nbsp\n';
                    }
                    msj = msj + ' </textarea>';
                    $("#campoGei").append(msj);
                }
            }
        }
    });
}

function fn_cargarEnergetico() {
    var Item =
    {
        ID_INICIATIVA: $("#iniciativa").val()
    };
    $.ajax({
        url: baseUrl + "Gestion/CargarSeleccionEnergetico",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var msj = '<textarea class="form-control-plaintext" id="mlt-energetico" aria-describedby="inputGroup9" cols="30" rows="5" readonly placeholder="Ingrese una descripción para su iniciativa">';
                    for (var j = 0; j < data.length; j++) {
                        msj = msj + data[j]["DESCRIPCION"] + '&nbsp\n';
                    }
                    msj = msj + ' </textarea>';
                    $("#campoEnerg").append(msj);
                }
            }
        }
    });
}

function CargarDetalleIndicadorVerMas() {
    var Item = {
        ID_INICIATIVA: $("#iniciativa").val()
    };
    $.ajax({
        url: baseUrl + "Gestion/ListarDetalleIndicadorRevision",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
        if (data != null && data != "") {
            $("#cuerpoTablaIndicador").html("");
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var tr = "";
                    tr = tr + '<tr>';
                    tr = tr + '                        <th class="text-center" data-encabezado="Número" scope="row">' + (i + 1) + '</th>';
                    tr = tr + '                        <td data-encabezado="Columna 01">' + data[i]["ANNOB"] + '</td>';
                    tr = tr + '                        <td data-encabezado="Columna 02">' + data[i]["TIPO_VEHICULO"] + '</td>';
                    tr = tr + '                        <td data-encabezado="Columna 03">' + data[i]["TIPO_COMBUSTIBLE"] + '</td>';
                    tr = tr + '                        <td data-encabezado="Columna 04">' + data[i]["KRVB"] + '</td>';
                    tr = tr + '                        <td data-encabezado="Columna 05">' + data[i]["CANTIDADB"] + '</td>';
                    tr = tr + '                        <td data-encabezado="Columna 06">' + data[i]["RENDIMIENTO"] + '</td>';
                    tr = tr + '                        <td data-encabezado="Columna 07">' + data[i]["TOTAL_GEI_INIMIT"] + '</td>';
                    tr = tr + '                        <td data-encabezado="Columna 08">' + data[i]["TOTAL_GEI_INIMIT"] + '</td>';
                    tr = tr + '                        <td data-encabezado="Columna 09">' + data[i]["TOTAL_GEI_REDUCIDO"] + '</td>';
                    tr = tr + '</tr>';
                    $("#cuerpoTablaIndicador").append(tr);
                    $("#cuerpoTablaIndicador").data("total", $("#cuerpoTablaIndicador").data("total") + data[i]["TOTAL_GEI_REDUCIDO"]);
                    $("#total-detalle #total").remove();
                    $("#total-detalle").append('<strong id="total">' + (Math.round($("#cuerpoTablaIndicador").data("total") * 100) / 100) + ' tCO<sub>2</sub>eq</strong>');
                }
            }
        } else {
            $("#total-detalle").append('<strong id="total">0.00</strong>');
        }
    });
}

function fn_ObtenerMedidaMitigacion(id) {
    var Item = {
        ID_MEDMIT: id
    };
    $.ajax({
        url: baseUrl + "Gestion/ObtenerMedidaMitigacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#txt-categoria").val(data[i]["IPSC_MEDMIT"]);
                        $("#txa-objetivo").val(data[i]["OBJETIVO_MEDMIT"]);
                        $("#txa-descripcion").val(data[i]["DESCRIPCION_MEDMIT"]);
                        $("#resumen-detalle").append(data[i]["IPSC_MEDMIT"]);
                    }
                }
            }
        }
    });
}

function CargarDatosIniciativa() {
    var Item =
    {
        ID_INICIATIVA: $("#iniciativa").val()
    };
    $.ajax({
        url: baseUrl + "Gestion/CargarSeleccionIniciativa",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        fn_ObtenerMedidaMitigacion(data[i]["ID_MEDMIT"]);
                        $("#Control").data("mitigacion", data[i]["ID_MEDMIT"]);
                        $("#txa-nombre-iniciativa").val(data[i]["NOMBRE_INICIATIVA"]);
                        $("#txa-descripcion-medida").val(data[i]["DESC_INICIATIVA"]);
                        $("#txt-nombre-responsable").val(data[i]["NOMBRES"]);
                        $("#txt-correo-electronico").val(data[i]["CORREO"]);
                        $("#txt-nombre-institucion").val(data[i]["INSTITUCION"]);
                        $("#txt-direccion").val(data[i]["DIRECCION"]);
                        $("#txt-sector-institucion").val(data[i]["SECTOR"]);
                        if (data[i]["INVERSION_INICIATIVA"] != 0) {
                            $("#txt-monto-inversion").val(data[i]["INVERSION_INICIATIVA"]);
                        }
                        $("#txt-moneda").val(data[i]["MONEDA"]);
                        //if (data[i]["FECHA"].toString() != "01/01/0001") {
                        //    $("#txt-fecha-inicio").val(data[i]["FECHA"].toString());
                        //}
                        //if (data[i]["PRIVACIDAD_INICIATIVA"] == 1) {
                        //    $("#chk-publicar").prop("checked", true);
                        //}
                        //if (data[i]["PRIVACIDAD_INVERSION"] == 1) {
                        //    $("#chk-publicar-monto-inversion").prop("checked", true);
                        //}
                    }
                }
            }
        }
    });
}


function fn_verfilesutento(idIniciativaSustento) {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_INICIATIVA_SUSTENTATORIO: idIniciativaSustento
    };
    var url = baseUrl + 'Gestion/GeIniciativaSustento';
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        var urlMostrar = baseUrl + "Temp/" + respuesta.extra;
        window.open(urlMostrar, "_blank");
    }
}

function fn_verfilesutento2(idIniciativaSustento) {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_INICIATIVA_SUSTENTATORIO: idIniciativaSustento
    };
    var url = baseUrl + 'Portal/GeIniciativaSustento';
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        var urlMostrar = baseUrl + "Temp/" + respuesta.extra;
        window.open(urlMostrar, "_blank");
    }
}

function formatoMiles(n) { //add20
    var m = n * 1;
    return m.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
}

$(document).ready(function () {
    var monto = $("#txt-monto-inversion").val();
    //$("#txt-monto-inversion").val(formatoMiles(monto)); //add20

    if (monto != "------") { // add 030620
        $("#txt-monto-inversion").val(formatoMiles(monto)); //add20
    }

    //$("#Control").data("iniciativa", $("#iniciativa").val());
    if ($("#iniciativa_mit_ID_INICIATIVA").val() > 0) {
        $("#Control").data("iniciativa", $("#iniciativa_mit_ID_INICIATIVA").val());
    } else {
        $("#Control").data("iniciativa", $("#identificador").val());
    }
    //if ($("#detalle").val() == 1) {
    //    CargarDetalleIndicadorVerMas();
    //}
    //CargarDatosIniciativa();

    generarAcumulado();

    fn_cargarUbicacion();
    fn_cargarEnergetico();
    fn_cargarGei();

    let resumen_total = 0.0;
    $('[id^=acum-]').each((x, y) => {
        resumen_total += parseFloat($(y).html().replace(/,/gi, ''));
    });
    $("#total-detalle").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
    $("#total-detalle2").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
    $("#cuerpoTablaIndicador").data("total", resumen_total);
});

function generarAcumulado() {

    var cabecera = "";
    var cuerpo = "";

    var item = {
    };

    $.ajax({
        url: baseUrl + 'Portal/MostrarAcumulado',

        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify(item),

        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        armarAcumuladosRevision(data[i].listaAcumulado, data[i].ID_INDICADOR);
                    }

                    let resumen_total = 0.0;
                    $('[id^=acum-]').each((x, y) => {
                        resumen_total += parseFloat($(y).html().replace(/,/gi, ''));
                    });
                    $("#total-detalle").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
                    $("#total-detalle2").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
                    $("#cuerpoTablaIndicador").data("total", resumen_total);

                }
            } else {
            }
        },
        failure: function (msg) {
            console.log(msg);
        },
        error: function (xhr, status, error) {
            console.log(error);
            location.href = baseUrl + "Home/login";
        },
        beforeSend: function () { //add 28-09-2020
            console.log('before send');
            $("#carga-preload-ini").html("<i Class='fas fa-spinner fa-spin px-1 fa-2x'></i>");
            $("#titulo-carga-ini").removeClass("d-none");
            $('#modal-carga').modal('show');
            $("#block-page-carga").show();
        },
        complete: function () {
            console.log('complete send');
            $("#block-page-carga").hide();
            $("#carga-preload-ini").html("");
            $("#titulo-carga-ini").addClass("d-none");
            $('#modal-carga').modal('hide');
        }
    });
}

var armarAcumuladosRevision = (data, f) => {
    let cuerpo = "";
    if (data != null && data != "") {
        if (data.length > 0) {
            let num = $("#cuerpo-acumulado-total").find("tr").length + 1;
            var verf = 0, anio = 2010, acumulado_ini = parseInt(data[0]["anio"]) - anio;
            var fila = $("#cuerpo-acumulado-total").find("tr");
            fila.each(function (index, value) {
                var id = $(value).attr("id");
                if (id == "f-" + f) { verf = 1; }
            });

            if (verf == 0) {
                cuerpo += '<tr id="f-' + f + '">';
                cuerpo += '<td class="text-center estrecho">' + num + '</td>';
                if (acumulado_ini > 0) {
                    for (var m = 0; m < acumulado_ini; m++) {
                        cuerpo += '<td class="text-center estrecho" data-encabezado="' + anio + '" id="a-' + anio + '-' + f + '">' + 0.00 + '</td>';
                        anio += 1;
                    }
                }

                var valor_acumulado = 0.0;
                for (var j = 0; j < data.length; j++) {
                    valor_acumulado = Math.round(data[j]["reducido"] * 100) / 100;// add
                    var acumulado_col = parseFloat($("#acum-" + anio).html().replace(/,/gi, '')) + valor_acumulado;
                    $("#acum-" + anio).html(formatoMiles(Math.round(acumulado_col * 100) / 100));
                    cuerpo += '<td class="text-center estrecho" data-encabezado="' + data[j]["anio"] + '" id="a-' + anio + '-' + f + '">' + formatoMiles(Math.round(data[j]["reducido"] * 100) / 100) + '</td>';
                    anio += 1;
                }

                anio -= 1;
                var acumulado_fin = 2030 - anio;
                if (acumulado_fin > 0) {
                    for (var n = 0; n < acumulado_fin; n++) {
                        anio += 1;
                        cuerpo += '<td class="text-center estrecho" data-encabezado="' + anio + '" id="a-' + anio + '-' + f + '">' + 0.00 + '</td>';
                    }
                }
                cuerpo += '</tr>';
                $("#cuerpo-acumulado-total").append(cuerpo);
            } else {
                var valor_acumulado = 0.0;
                var valor_descuento = 0.0;

                if (acumulado_ini > 0) {
                    for (var m = 0; m < acumulado_ini; m++) {
                        var valor = parseFloat($("#a-" + anio + '-' + f).html().replace(/,/gi, ''));
                        valor_descuento = valor; //add
                        acumulado_col = parseFloat($("#acum-" + anio).html().replace(/,/gi, '')) - valor_descuento;
                        $("#a-" + anio + '-' + f).html(0);
                        $("#acum-" + anio).html(formatoMiles(Math.round(acumulado_col * 100) / 100));
                        anio += 1;
                    }
                }

                for (var j = 0; j < data.length; j++) {
                    var acumulado_col = 0.0;
                    var valor = parseFloat($("#a-" + anio + '-' + f).html().replace(/,/gi, ''));
                    valor_acumulado = Math.round(data[j]["reducido"] * 100) / 100; //add
                    valor_descuento = valor; //add
                    acumulado_col = parseFloat($("#acum-" + anio).html().replace(/,/gi, '')) - valor_descuento;
                    acumulado_col = acumulado_col + valor_acumulado;
                    $("#a-" + anio + '-' + f).html(formatoMiles(Math.round(data[j]["reducido"] * 100) / 100));
                    $("#acum-" + anio).html(formatoMiles(Math.round(acumulado_col * 100) / 100));
                    anio += 1;
                }
            }
        }
    } else {
    }
}