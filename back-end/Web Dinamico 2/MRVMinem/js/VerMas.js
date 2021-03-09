var arrAIV = [];

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

    if ($("#medida_ID_MEDMIT").val() == 4) {
        resumenAuditada();
        resumenVerificada();
        resumenPotencial();
        armarTablaAuditor();
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
    //CargarSector();

    nombreresumen($("#medida_ID_MEDMIT").val(), $('#txt-enfoque').data("enfoque"));

    if (sindetalle == 0)
        generarAcumulado();

    fn_cargarUbicacion();
    fn_cargarEnergetico();
    fn_cargarGei();

    CargarDatosAuditoria();

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

                    //let resumen_total = 0.0;
                    //$('[id^=acum-]').each((x, y) => {
                    //    resumen_total += parseFloat($(y).html().replace(/,/gi, ''));
                    //});
                    //$("#total-detalle").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
                    //$("#total-detalle2").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
                    //$("#cuerpoTablaIndicador").data("total", resumen_total);
                    arrAIV = arrRevisionAIV;
                    let resumen_total = 0.0, resumen_energia = 0.0, resumen_emisiones_potencial = 0.0, resumen_energia_total = 0.0, resumen_total_auditada = 0.0, resumen_energia_auditada = 0.0, resumen_total_verificada = 0.0, resumen_energia_verificada = 0.0;
                    if ($("#medida_ID_MEDMIT").val() == 4) {
                        //$('#cuerpoTablaIndicador').find('.validar-implementado').each((x, y) => {
                        //    let emision = parseFloat($(y).parent().parent().parent().find('[data-param = 11]').val().replace(/,/gi, ''));
                        //    let energia = parseFloat($(y).parent().parent().parent().find('.energia-total').val().replace(/,/gi, ''));
                        //    resumen_emisiones_potencial += $(y).val() == null ? 0 : emision;
                        //    resumen_energia_total += $(y).val() == null ? 0 : energia;
                        //    //resumen_total += $(y).data('valor') == null ? 0 : $(y).data('valor') > 2 ? emision : 0;
                        //    //resumen_energia += $(y).data('valor') == null ? 0 : $(y).data('valor') > 2 ? energia : 0;
                        //    resumen_total_auditada += $(y).data('valor') == null ? 0 : $(y).data('valor') > 0 ? emision : 0;
                        //    resumen_energia_auditada += $(y).data('valor') == null ? 0 : $(y).data('valor') > 0 ? energia : 0;
                        //    resumen_total += $(y).data('valor') == null ? 0 : $(y).data('valor') > 1 ? emision : 0;
                        //    resumen_energia += $(y).data('valor') == null ? 0 : $(y).data('valor') > 1 ? energia : 0;
                        //    resumen_total_verificada += $(y).data('valor') == null ? 0 : $(y).data('valor') > 2 ? emision : 0;
                        //    resumen_energia_verificada += $(y).data('valor') == null ? 0 : $(y).data('valor') > 2 ? energia : 0;
                        //});
                        for (var i = 0; i < arrAIV.length; i++) {
                            resumen_emisiones_potencial += arrAIV[i].AUDITADO == null ? 0 : arrAIV[i].AUDITADO;
                            resumen_energia_total += arrAIV[i].ENERGIA_AUDITADO == null ? 0 : arrAIV[i].ENERGIA_AUDITADO;
                            resumen_total_auditada += arrAIV[i].AUDITADO == null ? 0 : arrAIV[i].AUDITADO;
                            resumen_energia_auditada += arrAIV[i].ENERGIA_AUDITADO == null ? 0 : arrAIV[i].ENERGIA_AUDITADO;
                            resumen_total += arrAIV[i].IMPLEMENTADO == null ? 0 : arrAIV[i].IMPLEMENTADO;
                            resumen_energia += arrAIV[i].ENERGIA_IMPLEMENTADO == null ? 0 : arrAIV[i].ENERGIA_IMPLEMENTADO;
                            resumen_total_verificada += arrAIV[i].VERIFICADO == null ? 0 : arrAIV[i].VERIFICADO;
                            resumen_energia_verificada += arrAIV[i].ENERGIA_VERIFICADO == null ? 0 : arrAIV[i].ENERGIA_VERIFICADO;
                        }
                        $("#total-detalle").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
                        $("#total-detalle2").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
                        $("#total-detalle-energia").html("").append(formatoMiles(Math.round(resumen_energia * 100) / 100));
                        $("#cuerpoTablaIndicador").data("total", resumen_total);

                        //potencial
                        $("#total-detalle-emisiones-2").html("").append(formatoMiles(resumen_emisiones_potencial));
                        $("#total-detalle-energia-2").html("").append(formatoMiles(resumen_energia_total));

                        //auditada
                        $("#total-detalle-emisiones-auditada").html("").append(formatoMiles(resumen_total_auditada));
                        $("#total-detalle-energia-auditada").html("").append(formatoMiles(resumen_energia_auditada));

                        //verificada
                        $("#total-detalle-emisiones-verificada").html("").append(formatoMiles(resumen_total_verificada));
                        $("#total-detalle-energia-verificada").html("").append(formatoMiles(resumen_energia_verificada));
                    } else {
                        $('[id^=acum-]').each((x, y) => {
                            resumen_total += parseFloat($(y).html().replace(/,/gi, ''));
                        });
                        $("#total-detalle").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
                        $("#total-detalle2").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
                        $("#total-detalle-energia").html("").append(formatoMiles(0.00));
                        $("#cuerpoTablaIndicador").data("total", resumen_total);
                    }

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

function CargarSector() {
    var item = {
    };
    vurl = baseUrl + "Portal/ListaSectorInstitucion";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#cbo-sector").append('<option value="0">Seleccionar</option>');
                    for (var i = 0; i < data.length; i++) {
                        $("#cbo-sector").append('<option value="' + data[i]["ID_SECTOR_INST"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                    }
                }
            }
        }
    });
}

function CargarDatosAuditoria() {
    var Item =
    {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    };
    $.ajax({
        url: baseUrl + "Portal/CargarSeleccionIniciativa",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        if (data[i]["ID_MEDMIT"] == 4) {
                            if (data[i]["DESCRIPCION_TIPO_AUDITORIA"] != null || data[i]["INSTITUCION_AUDITADA"] != null || data[i]["SECTOR_INST"] != null || data[i]["TIPO_AUDITORIA"] != null || data[i]["AUDITOR_AUDITORIA"] != null || data[i]["NOMBRE_INSTITUCION"] != null || data[i]["FECHA_AUDITORIA"] != null) {
                                $('#cbo-sector').val(data[i]["SECTOR_INST"] == null ? '0' : data[i]["SECTOR_INST"]);
                                $('#txt-institucion').val(data[i]["INSTITUCION_AUDITADA"] == null ? '' : data[i]["INSTITUCION_AUDITADA"]);
                                $('#cbo-tipo_auditoria').val(data[i]["TIPO_AUDITORIA"] == null ? '0' : data[i]["TIPO_AUDITORIA"]);
                                $('#txt-descripcion-tipo-auditoria').val(data[i]["DESCRIPCION_TIPO_AUDITORIA"] == null ? '' : data[i]["DESCRIPCION_TIPO_AUDITORIA"]);
                                $('#txt-auditor').val(data[i]["AUDITOR_AUDITORIA"] == null ? '' : data[i]["AUDITOR_AUDITORIA"]);
                                $('#txt-institucion-auditor').val(data[i]["NOMBRE_INSTITUCION"] == null ? '' : data[i]["NOMBRE_INSTITUCION"]);
                                $('#fch-fecha-auditoria').val(data[i]["FECHA_AUDITORIA"] == null ? '' : data[i]["FECHA_AUDITORIA"]);
                            }
                        }
                    }
                }
            }
        }
    });
}

var armarTablaAuditor = () => {
    //let head1 = `<th class="text-center grupo-columna-03" scope="col"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="Tipo de sector al que pertenece la entidad a quien se realiza la auditoría" data-original-title="Tipo de sector al que pertenece la entidad a quien se realiza la auditoría"></i>Sector&nbsp;</span></th>`;
    //let head2 = `<th class="text-center grupo-columna-03" scope="col"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="Nombre de la entidad a quien se realiza la auditoría" data-original-title="Nombre de la entidad a quien se realiza la auditoría"></i>Institución auditada&nbsp;</span></th>`;
    //let head3 = `<th class="text-center grupo-columna-03" scope="col"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="Seleccionar entre tipo 1, 2 o 3" data-original-title="Seleccionar entre tipo 1, 2 o 3"></i>Tipo auditoría&nbsp;</span></th>`;
    //let head4 = `<th class="text-center grupo-columna-03" scope="col"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="La descripción responderá al tipo de auditoría que se realice en la entidad según el nivel de esfuerzo" data-original-title="La descripción responderá al tipo de auditoría que se realice en la entidad según el nivel de esfuerzo"></i>Descripción de tipo auditoría&nbsp;</span></th>`;
    //let head5 = `<th class="text-center grupo-columna-03" scope="col"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="Seleccionar si la auditoría está realizada por una persona o una empresa" data-original-title="Seleccionar si la auditoría está realizada por una persona o una empresa"></i>Auditado por&nbsp;</span></th>`;
    //let head6 = `<th class="text-center grupo-columna-03" scope="col"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="Nombre de la persona o empresa responsable de realizar la auditoría" data-original-title="Nombre de la persona o empresa responsable de realizar la auditoría"></i>Nombre de institución / auditor&nbsp;</span></th>`;
    //let head7 = `<th class="text-center grupo-columna-03" scope="col"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="Fecha de la realización de la auditoría" data-original-title="Fecha de la realización de la auditoría"></i>Fecha de auditoría&nbsp;</span></th>`;
    //$('#tablaAuditor').find('thead').html(`<tr class="bg-primary text-white">${head1}${head2}${head3}${head4}${head5}${head6}${head7}</tr>`);

    let head1 = `<th class="text-center grupo-columna-03"><div class="d-flex flex-column justify-content-between align-items-center"><div class="d-flex justify-content-center align-items-center">Sector&nbsp;</div><div class="d-flex justify-content-center align-items-center"><i class="fas fa-info-circle mr-1" data-toggle="tooltip" data-placement="right" title="Tipo de sector al que pertenece la entidad a quien se realiza la auditoría"></i></div></div></th>`;
    let head2 = `<th class="text-center grupo-columna-03"><div class="d-flex flex-column justify-content-between align-items-center"><div class="d-flex justify-content-center align-items-center">Institución auditada&nbsp;</div><div class="d-flex justify-content-center align-items-center"><i class="fas fa-info-circle mr-1" data-toggle="tooltip" data-placement="right" title="Nombre de la entidad a quien se realiza la auditoría"></i></div></div></th>`;
    let head3 = `<th class="text-center grupo-columna-03"><div class="d-flex flex-column justify-content-between align-items-center"><div class="d-flex justify-content-center align-items-center">Tipo auditoría&nbsp;</div><div class="d-flex justify-content-center align-items-center"><i class="fas fa-info-circle mr-1" data-toggle="tooltip" data-placement="right" title="Seleccionar entre tipo 1, 2 o 3"></i></div></div></th>`;
    let head4 = `<th class="text-center grupo-columna-03"><div class="d-flex flex-column justify-content-between align-items-center"><div class="d-flex justify-content-center align-items-center">Descripción de tipo auditoría&nbsp;</div><div class="d-flex justify-content-center align-items-center"><i class="fas fa-info-circle mr-1" data-toggle="tooltip" data-placement="right" title="La descripción responderá al tipo de auditoría que se realice en la entidad según el nivel de esfuerzo"></i></div></div></th>`;
    let head5 = `<th class="text-center grupo-columna-03"><div class="d-flex flex-column justify-content-between align-items-center"><div class="d-flex justify-content-center align-items-center">Auditado por&nbsp;</div><div class="d-flex justify-content-center align-items-center"><i class="fas fa-info-circle mr-1" data-toggle="tooltip" data-placement="right" title="Seleccionar si la auditoría está realizada por una persona o una empresa"></i></div></div></th>`;
    let head6 = `<th class="text-center grupo-columna-03"><div class="d-flex flex-column justify-content-between align-items-center"><div class="d-flex justify-content-center align-items-center">Nombre de institución / auditor&nbsp;</div><div class="d-flex justify-content-center align-items-center"><i class="fas fa-info-circle mr-1" data-toggle="tooltip" data-placement="right" title="Nombre de la persona o empresa responsable de realizar la auditoría"></i></div></div></th>`;
    let head7 = `<th class="text-center grupo-columna-03"><div class="d-flex flex-column justify-content-between align-items-center"><div class="d-flex justify-content-center align-items-center">Fecha de auditoría&nbsp;</div><div class="d-flex justify-content-center align-items-center"><i class="fas fa-info-circle mr-1" data-toggle="tooltip" data-placement="right" title="Fecha de la realización de la auditoría"></i></div></div></th>`;
    $('#tablaAuditor').find('thead').html(`<tr class="bg-primary text-white">${head1}${head2}${head3}${head4}${head5}${head6}${head7}</tr>`);
    $("[data-toggle='tooltip']").tooltip();

    let body1 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><select class="form-control form-control-sm" id="cbo-sector" disabled><option value="0">Seleccionar</option><option value="1">Administrativo</option><option value="2">Público</option><option value="3">Educación</option><option value="4">Salud</option></select></div></td>`;
    let body2 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><input class="form-control form-control-sm text-left" type="text" placeholder="" id="txt-institucion" maxlength="120" autocomplete="off" readonly></div></td>`;
    let body3 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><select class="form-control form-control-sm" id="cbo-tipo_auditoria" disabled><option value="0">Seleccionar</option><option value="1">Tipo 1</option><option value="2">Tipo 2</option><option value="3">Tipo 3</option></select></div></td>`;
    let body4 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><input class="form-control form-control-sm text-left" type="text" placeholder="" id="txt-descripcion-tipo-auditoria" maxlength="500" autocomplete="off" readonly></div></td>`;
    let body5 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><select class="form-control form-control-sm" id="txt-auditor" disabled><option value="0">Seleccionar</option><option value="1">EMSE</option><option value="2">Auditor acreditado</option></select></div></td>`;
    let body6 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><input class="form-control form-control-sm text-left" type="text" placeholder="" id="txt-institucion-auditor" maxlength="120" autocomplete="off" readonly></div></td>`;
    let body7 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><input class="form-control form-control-sm text-center" type="date" placeholder="" id="fch-fecha-auditoria" readonly></div></td>`;
    $('#tablaAuditor').find('tbody').html(`<tr id="detalles-1" data-ind="1" data-rev="0">${body1}${body2}${body3}${body4}${body5}${body6}${body7}</tr>`);

}

var resumenAuditada = () => {
    let body2 = `<tr><th class="text-center" data-encabezado="Número" scope="row">2</th><td data-encabezado="Resumen">Energía total reducida</td><td data-encabezado="Total"><strong id="total-detalle-energia-auditada">0.00</strong><strong>&nbsp;MJ</strong></td></tr>`;
    let body1 = `<tr><th class="text-center" data-encabezado="Número" scope="row">1</th><td data-encabezado="Resumen">Emisiones de GEI reducidas</td><td data-encabezado="Total"><strong id="total-detalle-emisiones-auditada">0.00</strong><strong>&nbsp;tCO<sub>2</sub>eq</strong></td></tr>`;
    let heads = `<th class="text-center" scope="col" width="2%"><span>N°&nbsp;</span></th><th scope="col" width="88%"><span>Por las mejoras auditadas</span></th><th scope="col" width="10%"><span>Total</span></th>`;
    let tabla = `<table class="table table-hover"><thead><tr class="bg-primary text-white">${heads}</tr></thead><tbody>${body1}${body2}</tbody></table>`;
    let row = `<div class="row"><div class="col-12"><div class="table-responsive tabla-principal mt-3">${tabla}</div></div></div>`;
    $('#resumenauditada').html(row);
}

var resumenVerificada = () => {
    let body2 = `<tr><th class="text-center" data-encabezado="Número" scope="row">2</th><td data-encabezado="Resumen">Energía total reducida</td><td data-encabezado="Total"><strong id="total-detalle-energia-verificada">0.00</strong><strong>&nbsp;MJ</strong></td></tr>`;
    let body1 = `<tr><th class="text-center" data-encabezado="Número" scope="row">1</th><td data-encabezado="Resumen">Emisiones de GEI reducidas</td><td data-encabezado="Total"><strong id="total-detalle-emisiones-verificada">0.00</strong><strong>&nbsp;tCO<sub>2</sub>eq</strong></td></tr>`;
    let heads = `<th class="text-center" scope="col" width="2%"><span>N°&nbsp;</span></th><th scope="col" width="88%"><span>Por las mejoras verificadas</span></th><th scope="col" width="10%"><span>Total</span></th>`;
    let tabla = `<table class="table table-hover"><thead><tr class="bg-primary text-white">${heads}</tr></thead><tbody>${body1}${body2}</tbody></table>`;
    let row = `<div class="row"><div class="col-12"><div class="table-responsive tabla-principal mt-3">${tabla}</div></div></div>`;
    $('#resumenverificada').html(row);
}

var resumenPotencial = () => {
    let body2 = `<tr><th class="text-center" data-encabezado="Número" scope="row">2</th><td data-encabezado="Resumen">Energía total reducida</td><td data-encabezado="Total"><strong id="total-detalle-energia-2">0.00</strong><strong>&nbsp;MJ</strong></td></tr>`;
    let body1 = `<tr><th class="text-center" data-encabezado="Número" scope="row">1</th><td data-encabezado="Resumen">Emisiones de GEI reducidas</td><td data-encabezado="Total"><strong id="total-detalle-emisiones-2">0.00</strong><strong>&nbsp;tCO<sub>2</sub>eq</strong></td></tr>`;
    let heads = `<th class="text-center" scope="col" width="2%"><span>N°&nbsp;</span></th><th scope="col" width="88%"><span>Resumen potencial de las mejoras</span></th><th scope="col" width="10%"><span>Total</span></th>`;
    let tabla = `<table class="table table-hover"><thead><tr class="bg-primary text-white">${heads}</tr></thead><tbody>${body1}${body2}</tbody></table>`;
    let row = `<div class="row"><div class="col-12"><div class="table-responsive tabla-principal mt-3">${tabla}</div></div></div>`;
    $('#resumenpotencial').html(row);
}

var nombreresumen = (medida, enfoque) => {
    if (medida == 12 || medida == 4 || enfoque == 6 || enfoque == 9)
        $('#nombre-resumen').html("Emisiones de GEI reducidas");
    else
        $('#nombre-resumen').html("Emisiones de GEI reducidas de forma acumulada");
}