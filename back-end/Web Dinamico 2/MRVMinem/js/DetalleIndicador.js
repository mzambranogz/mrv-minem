
var indicadores = new Array();
var documentos = new Array();




function fn_crearLinea(fila) {
    var tr = '<tr id="detalles-tr-' + fila + '" data-value="' + fila + '0" >';
    tr = tr + '         <th class="text-center" data-encabezado="Número" scope="row" id="row-' + fila + '">' + fila + '</th>';
    tr = tr + '         <td data-encabezado="Columna 01">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-det-1-' + fila + '" onchange="fn_calcularIndicadores2(' + fila + ')">';
    tr = tr + '                          <option value="2018">2018</option>';
    tr = tr + cargarAnio();
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 02">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-det-2-' + fila + '" onchange="fn_calcularIndicadores2(' + fila + ')">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 03">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-det-3-' + fila + '" onchange="fn_calcularIndicadores2(' + fila + ')">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    //tr = tr + '         <td data-encabezado="Columna 03">';
    //tr = tr + '              <div class="form-group m-0">';
    //tr = tr + '                      <input class="form-control form-control-sm txt-placas" type="text" placeholder="Texto aquí" id="txt-columna3-1" value="5">';
    //tr = tr + '              </div>';
    //tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-1-' + fila + '" onBlur="fn_calcularIndicadores2(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 05">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-2-' + fila + '" onBlur="fn_calcularIndicadores2(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 06">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-3-' + fila + '" onBlur="fn_calcularIndicadores2(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 07">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-4-' + fila + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 07">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-5-' + fila + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Subtotal">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-6-' + fila + '" disabled>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';
    //tr = tr + '         <td class="text-center" data-encabezado="Calcular">';
    //tr = tr + '                <div class="form-group m-0">';
    //tr = tr + '                       <button class="btn btn-secondary btn-sm m-0" onclick="fn_calcularIndicadores();"><i class="fas fa-upload mr-1"></i>+</button>';
    //tr = tr + '                </div>';
    //tr = tr + '         </td>';
    //tr = tr + '         <td class="text-center" data-encabezado="Sustento">';
    //tr = tr + '                <div class="form-group m-0">';
    //tr = tr + '                       <label class="btn btn-secondary btn-sm m-0" for="fledoc-' + fila + '"><i class="fas fa-upload mr-1"></i>Cargar</label>';
    //tr = tr + '                       <input class="d-none fil-file-control" type="file" name="fledoc" id="fledoc-' + fila + '">';
    //tr = tr + '                       <input class="d-none" type="file" name="fledoc" id="fledoc-' + fila + '">';
    //tr = tr + '                </div>';
    //tr = tr + '         </td>';
    tr = tr + '         <td class="text-center text-xs-right" data-encabezado="Acciones">';
    tr = tr + '                <div class="btn-group">';
    tr = tr + '                     <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
    tr = tr + '                          <div class="dropdown-menu dropdown-menu-right">';
    tr = tr + '                                  <a class="dropdown-item agregarCampos" href="#">';
    tr = tr + '                                         <i class="fas fa-plus-circle"></i>&nbsp;Agregar';
    tr = tr + '                                  </a><a class="dropdown-item quitarCampos" href="#" onclick="fn_restarTotalCO2();">';
    tr = tr + '                                         <i class="fas fa-minus-circle"></i>&nbsp;Eliminar';
    tr = tr + '                                  </a>';
    tr = tr + '                          </div>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';

    tr = tr + '         <td class="text-hide" data-encabezado="ID_INDICADOR" style="display:none;">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-7-' + fila + '" disabled>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';

    tr = tr + '</tr>';

    return tr;
}

function fn_restarTotalCO2() {
    var row = $(".tabla-detalle-indicadores").find("tbody").find("th").length - 1;
    $("#cuerpoTablaIndicador").data("row", row);
    if ($("#txt-det-6-" + $("#tablaIndicador").data("fila")).val() != '') {
        var t = parseFloat($("#txt-det-6-" + $("#tablaIndicador").data("fila")).val());
        var tt = parseFloat($("#cuerpoTablaIndicador").data("total")) - t;
        $("#cuerpoTablaIndicador").data("total", tt);
        $("#total-detalle #total").remove();
        $("#total-detalle").append('<strong id="total">' + (Math.round(tt * 100) / 100) + ' tCO<sub>2</sub>eq</strong>');
        $("#total-detalle2 #total2").remove();
        $("#total-detalle2").append('<strong id="total2">' + (Math.round(tt * 100) / 100) + ' tCO<sub>2</sub>eq</strong>');
        if ($("#txt-det-7-" + $("#tablaIndicador").data("fila")).val() != '') {
            var id_borrar = $("#cuerpoTablaIndicador").data("delete") + $("#txt-det-7-" + $("#tablaIndicador").data("fila")).val() + ",";
            $("#cuerpoTablaIndicador").data("delete", id_borrar);
        }
    }
}

function fn_calcularTotalCO2(row) {
    var total = 0.0;
    for (var i = 0; i < row; i++) {
        console.log($("#txt-det-6-" + (i + 1)).val());
        if ($("#txt-det-6-" + (i + 1)).val() != '') {
            total = total + parseFloat($("#txt-det-6-" + (i + 1)).val());
        }
    }
    $("#cuerpoTablaIndicador").data("total", total);
    $("#total-detalle #total").remove();
    $("#total-detalle").append('<strong id="total">' + (Math.round(total * 100) / 100) + ' tCO<sub>2</sub>eq</strong>');
    $("#total-detalle2 #total2").remove();
    $("#total-detalle2").append('<strong id="total2">' + (Math.round(total * 100) / 100) + ' tCO<sub>2</sub>eq</strong>');
}

function fn_calcularIndicadores() {
    var fila = $("#tablaIndicador").data("fila");
    if (validarCampo(fila)) {
        var item = {
            ID_INDICADOR: $("#detalles-tr-" + fila).data("value"),
            ID_INICIATIVA: $("#Control").data("iniciativa"),
            ANNOB: $("#cbo-det-1-" + fila).val(),
            ID_TIPO_VEHICULOB: $("#cbo-det-2-" + fila).val(),
            ID_TIPO_COMBUSTIBLEB: $("#cbo-det-3-" + fila).val(),
            KRVB: $("#txt-det-1-" + fila).val(),
            CANTIDADB: $("#txt-det-2-" + fila).val(),
            FACTOR_RENDIMIENTO: $("#txt-det-3-" + fila).val(),
            ID_TIPO_FUENTEI: $("#cbo-enfoque").val(),
        }
        $.ajax({
            url: baseUrl + 'Gestion/CalcularIndicador',
            type: 'POST',
            datatype: 'json',
            data: item,
            success: function (data) {
                if (data != null && data != "") {
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            $("#txt-det-4-" + fila).val(data[i]["TOTAL_GEI_BASE"]);
                            $("#txt-det-5-" + fila).val(data[i]["TOTAL_GEI_INIMIT"]);
                            $("#txt-det-6-" + fila).val(data[i]["TOTAL_GEI_REDUCIDO"]);
                            $("#detalles-tr-" + fila).data("value", data[i]["ID_INDICADOR"]);
                        }
                    }
                }

                var row = $(".tabla-detalle-indicadores").find("tbody").find("th").length;
                $("#cuerpoTablaIndicador").data("row", row);
                fn_calcularTotalCO2(row);
            }
        });
    }
}

function fn_calcularIndicadores2(fila) {
    if (validarCampo(fila)) {
        var item = {
            ID_INDICADOR: $("#detalles-tr-" + fila).data("value"),
            ID_INICIATIVA: $("#Control").data("iniciativa"),
            ANNOB: $("#cbo-det-1-" + fila).val(),
            ID_TIPO_VEHICULOB: $("#cbo-det-2-" + fila).val(),
            ID_TIPO_COMBUSTIBLEB: $("#cbo-det-3-" + fila).val(),
            KRVB: $("#txt-det-1-" + fila).val(),
            CANTIDADB: $("#txt-det-2-" + fila).val(),
            FACTOR_RENDIMIENTO: $("#txt-det-3-" + fila).val(),
            ID_TIPO_FUENTEI: $("#cbo-enfoque").val(),
        }
        $.ajax({
            url: baseUrl + 'Gestion/CalcularIndicador',
            type: 'POST',
            datatype: 'json',
            data: item,
            success: function (data) {
                if (data != null && data != "") {
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            $("#txt-det-3-" + fila).val(data[i]["FACTOR_RENDIMIENTO"]);
                            $("#txt-det-4-" + fila).val(data[i]["TOTAL_GEI_BASE"]);
                            $("#txt-det-5-" + fila).val(data[i]["TOTAL_GEI_INIMIT"]);
                            $("#txt-det-6-" + fila).val(data[i]["TOTAL_GEI_REDUCIDO"]);
                        }
                    }
                }

                var row = $(".tabla-detalle-indicadores").find("tbody").find("th").length;
                $("#cuerpoTablaIndicador").data("row", row);
                fn_calcularTotalCO2(row);
            }
        });
    }
}

function validarCampo(fila) {
    if ($("#cbo-det-2-" + fila).val() == 0) {
        return false;
    } else if ($("#cbo-det-3-" + fila).val() == 0) {
        return false;
    } else if ($("#txt-det-1-" + fila).val() == "") {
        return false;
    } else if ($("#txt-det-2-" + fila).val() == "") {
        return false;
    } else {
        return true;
    }
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
                        $("#resumen-detalle2").append(data[i]["IPSC_MEDMIT"]);
                    }
                }
            }
        }
    });
}

function CargarDatosIniciativa() {
    var Item =
    {
        //ID_INICIATIVA: $("#identificador").val()
        ID_INICIATIVA: $("#Control").data("iniciativa")
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
                        //fn_DatosComentario(data[i]["ID_MEDMIT"]);
                        $("#Control").data("mitigacion", data[i]["ID_MEDMIT"]);
                        $("#txa-nombre-iniciativa").val(data[i]["NOMBRE_INICIATIVA"]);
                        $("#txa-descripcion-medida").val(data[i]["DESC_INICIATIVA"]);
                        $("#txt-nombre-responsable").val(data[i]["NOMBRES"]);
                        $("#txt-correo-electronico").val(data[i]["CORREO"]);
                        $("#txt-nombre-institucion").val(data[i]["INSTITUCION"]);
                        $("#txt-direccion").val(data[i]["DIRECCION"]);
                        $("#txt-sector-institucion").val(data[i]["SECTOR"]);
                        if (data[i]["INVERSION_INICIATIVA"] != 0) {
                            //$("#txt-monto-inversion").val(data[i]["INVERSION_INICIATIVA"]);
                            $("#txt-monto-inversion").val(formatoMiles(data[i]["INVERSION_INICIATIVA"])); //add20
                        } else {
                            $("#txt-monto-inversion").val("------");//add 030620
                        }

                        if (data[i]["MONEDA"] != null) {
                            $("#txt-moneda").val(data[i]["MONEDA"]);
                        } else {
                            $("#txt-moneda").val("------");
                        }

                        //$("#txt-moneda").val(data[i]["MONEDA"]);
                        if (data[i]["FECHA"].toString() != "01/01/0001") {
                            $("#txt-fecha-inicio").val(data[i]["FECHA"].toString());
                        }
                        //if (data[i]["FECHA"].toString() != "01/01/0001") {
                        //    $("#txt-fecha-inicio").val(data[i]["FECHA_EDITAR"]);
                        //    //$("#txt-fecha-inicio").val("2019-12-12"); FORMATO EJEMPLO PARA CARGA
                        //}

                        if (data[i]["FECHA_FIN"].toString() != "01/01/0001") {
                            $("#txt-fecha-fin").val(data[i]["FECHA_FIN"].toString());
                        }

                        if ($("#Control").data("revision") == 0) {
                            //$("#cbo-moneda").val(data[i]["ID_MONEDA"]);

                            //if (data[i]["FECHA_FIN"].toString() != "01/01/0001") {
                            //    $("#txt-fecha-fin").val(data[i]["FECHA_EDITAR_FIN"]);
                            //}
                        } else {
                            $("#emisorObservacion").append($("#Control").data("nombres"));


                        }
                        if (data[i]["PRIVACIDAD_INICIATIVA"] == 1) {
                            $("#chk-publicar").prop("checked", true);
                        }
                        if (data[i]["PRIVACIDAD_INVERSION"] == 1) {
                            $("#chk-publicar-monto-inversion").prop("checked", true);
                        }

                        //if (data[i]["ListaSustentos"] != null) {
                        //    for (var sus = 0; sus < data[i]["ListaSustentos"].length; sus++) {

                        //        var output = [];
                        //        var extension = "fa-file-word";

                        //        if ((data[i]["ListaSustentos"])[sus]["ADJUNTO"].includes("pdf")) {
                        //            extension = "fa-file-pdf";
                        //        } else {
                        //            if ((data[i]["ListaSustentos"])[sus]["ADJUNTO"].includes("jpeg") || (data[i]["ListaSustentos"])[sus]["ADJUNTO"].includes("png") || (data[i]["ListaSustentos"])[sus]["ADJUNTO"].includes("jpg")) {
                        //                extension = "fa-file-image";
                        //            } else {
                        //                if ((data[i]["ListaSustentos"])[sus]["ADJUNTO"].includes("xlsx") || (data[i]["ListaSustentos"])[sus]["ADJUNTO"].includes("xls")) {
                        //                    extension = "fa-file-excel";
                        //                } else {
                        //                    if ((data[i]["ListaSustentos"])[sus]["ADJUNTO"].includes("pptx") || (data[i]["ListaSustentos"])[sus]["ADJUNTO"].includes("ppt")) {
                        //                        extension = "fa-file-powerpoint";
                        //                    } else {
                        //                        if ((data[i]["ListaSustentos"])[sus]["ADJUNTO"].includes("docx") || (data[i]["ListaSustentos"])[sus]["ADJUNTO"].includes("doc")) {
                        //                            extension = "fa-file-word";
                        //                        } else {
                        //                            extension = "fa-file";
                        //                        }
                        //                    }
                        //                }
                        //            }
                        //        }
                        //        //output.push('<div class="input-group mb-3">', '<div class="input-group-prepend">', '<span class="input-group-text">', '<i class="fas ', extension, '">', '</i>', '</span>', '</div>', '<span class="form-control-plaintext">', escape((data[i]["ListaSustentos"])[sus]["ADJUNTO"]), '</span>', '<div class="form-group m-0">', '<label class="btn btn-secondary btn-sm m-0" onclick="fn_verfilesutento(', (data[i]["ListaSustentos"])[sus]["ID_INICIATIVA_SUSTENTATORIO"], ')"><i class="fas fa-download mr-1"></i>Ver</label>', '</div>', '</div>');
                        //        output.push('<div class="input-group mb-3">', '<div class="input-group-prepend">', '<span class="input-group-text">', '<i class="fas ', extension, '">', '</i>', '</span>', '</div>', '<span class="form-control-plaintext">', decodeURI((data[i]["ListaSustentos"])[sus]["ADJUNTO_BASE"]), '</span>', '<div class="form-group m-0">', '<label class="btn btn-secondary btn-sm m-0" onclick="fn_verfilesutento(', (data[i]["ListaSustentos"])[sus]["ID_INICIATIVA_SUSTENTATORIO"], ')"><i class="fas fa-download mr-1"></i>Ver</label>', '</div>', '</div>');

                        //        $("#archivos-documentos").append(output.join(''));

                        //    }
                        //    $("#total-documentos").html(data[i]["ListaSustentos"].length);
                        //}
                    }
                }
            }
        }
    });
}

function fn_cargarUbicacion() {
    var Item =
    {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    };

    $.ajax({
        url: baseUrl + "Gestion/CargarSeleccionUbicacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var msj = '<textarea class="form-control-plaintext" id="txa-ubicacion" aria-describedby="inputGroup9" cols="30" rows="8" readonly placeholder="Ingrese una descripción para su iniciativa">';
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
        ID_INICIATIVA: $("#Control").data("iniciativa")
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
        ID_INICIATIVA: $("#Control").data("iniciativa")
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

////////////////////////////////////////////////////////////////////////////

function CargarDetalleIndicador() {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    }
    $.ajax({
        url: baseUrl + 'Gestion/ListarDetalleIndicador',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        CargarTablaIndicador(data, i);
                    }
                    $("#cuerpoTablaIndicador").data("row", data.length);
                }
            } else {
                CargarSoloTablaIndicador();
                $("#total-detalle").append('<strong id="total">0.00 tCO<sub>2</sub>eq</strong>');
                $("#total-detalle2").append('<strong id="total2">0.00 tCO<sub>2</sub>eq</strong>');
            }
        }
    });
}

function cargarAnio() {

    var tr = '<option value="2019">2019</option>';
    tr = tr + '<option value="2020">2020</option>';
    tr = tr + '<option value="2021">2021</option>';
    tr = tr + '<option value="2022">2022</option>';
    tr = tr + '<option value="2023">2023</option>';
    tr = tr + '<option value="2024">2024</option>';
    return tr;
}

function fn_CargarListaTipoVehiculo(datat, j, enfoque) {
    var Item = {};
    $.ajax({
        url: baseUrl + "Gestion/ListarTipoVehiculo",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
        if (data != null && data != "") {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $("#cbo-det-2-" + (j + 1)).append('<option value="' + data[i]["ID_TIPO_VEHICULO"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                }
            }
        }
        fn_CargarListaTipoCombustible(datat, j, enfoque);
    });
}

function fn_CargarListaTipoCombustible(datat, j, enfoque) {
    var Item = {};
    $.ajax({
        url: baseUrl + "Gestion/ListarTipoCombustible",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
        if (data != null && data != "") {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $("#cbo-det-3-" + (j + 1)).append('<option value="' + data[i]["ID_TIPO_COMBUSTIBLE"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                }
            }
        }
        llenarTabla(datat, j, enfoque);
    });
}

//function llenarTabla(data, j) {
//    $("#cbo-det-1-" + (j + 1)).val(data[j]["ANNO_BASE"]);
//    $("#cbo-det-2-" + (j + 1)).val(data[j]["ID_TIPO_VEHICULO_BASE"]);
//    $("#cbo-det-3-" + (j + 1)).val(data[j]["ID_TIPO_COMBUSTIBLE_BASE"]);
//    $("#txt-det-1-" + (j + 1)).val(data[j]["KRV_BASE"]);
//    $("#txt-det-2-" + (j + 1)).val(data[j]["CANT_BASE"]);
//    $("#txt-det-3-" + (j + 1)).val(data[j]["F_RENDIMIENTO"]);
//    //$("#tipoFuenteI" + fila).val(data[i]["ID_TIPO_FUENTE_INIMIT"]);
//    $("#txt-det-4-" + (j + 1)).val(data[j]["TOTAL_GEI_BASE"]);
//    $("#txt-det-5-" + (j + 1)).val(data[j]["TOTAL_GEI_INIMIT"]);
//    $("#txt-det-6-" + (j + 1)).val(data[j]["TOTAL_GEI_REDUCIDO"]);
//    $("#txt-det-7-" + (j + 1)).val(data[j]["ID_INDICADOR"]);
//    $("#detalles-tr-" + (j + 1)).data("value", data[j]["ID_INDICADOR"]);
//    $("#cuerpoTablaIndicador").data("total", $("#cuerpoTablaIndicador").data("total") + data[j]["TOTAL_GEI_REDUCIDO"]);
//    $("#total-detalle #total").remove();
//    $("#total-detalle").append('<strong id="total">' + (Math.round($("#cuerpoTablaIndicador").data("total") * 100) / 100) + ' tCO<sub>2</sub>eq</strong>');
//    $("#total-detalle2 #total2").remove();
//    $("#total-detalle2").append('<strong id="total2">' + (Math.round($("#cuerpoTablaIndicador").data("total") * 100) / 100) + ' tCO<sub>2</sub>eq</strong>');
//}

function CargarDetalleIndicadorRevision() {
    var Item = {
        ID_INICIATIVA: $("#identificador").val()
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
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 01">' + data[i]["ANNOB"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 02">' + data[i]["TIPO_VEHICULO"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 03">' + data[i]["TIPO_COMBUSTIBLE"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 04">' + data[i]["KRVB"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 05">' + data[i]["CANTIDADB"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 06">' + data[i]["RENDIMIENTO"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 07">' + data[i]["TOTAL_GEI_BASE"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 08">' + data[i]["TOTAL_GEI_INIMIT"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 09">' + data[i]["TOTAL_GEI_REDUCIDO"] + '</td>';
                    //if (data[i]["ADJUNTO"] != null && data[i]["ADJUNTO"] != "") {
                    //    tr = tr + '                    <td data-encabezado="Columna 10">';
                    //    tr = tr + '                <div class="form-group m-0">';
                    //    tr = tr + '                       <label class="btn btn-secondary btn-sm m-0" onclick="fn_verfileindicaor(' + data[i]["ID_INDICADOR"] + ')"><i class="fas fa-download mr-1"></i>Ver</label>';
                    //    tr = tr + '                </div>';
                    //    tr = tr + '         </td>';
                    //} else {
                    //    tr = tr + '                        <td data-encabezado="Columna 10"></td>';
                    //}
                    tr = tr + '</tr>';
                    $("#cuerpoTablaIndicador").append(tr);
                    $("#cuerpoTablaIndicador").data("total", $("#cuerpoTablaIndicador").data("total") + data[i]["TOTAL_GEI_REDUCIDO"]);
                    $("#total-detalle #total").remove();
                    $("#total-detalle").append('<strong id="total">' + (Math.round($("#cuerpoTablaIndicador").data("total") * 100) / 100) + ' tCO<sub>2</sub>eq</strong>');
                }
            }
        } else {
            $("#total-detalle").append('<strong id="total">0.00 tCO<sub>2</sub>eq</strong>');
        }
    });
}

function CargarSoloTablaIndicador() {
    var n = $(".tabla-detalle-indicadores").find("tbody").find("th").length + 1;
    var t = fn_crearLinea(n);
    $("#cuerpoTablaIndicador").append(t);
    //if (n == 1) {
    MRV.CargarSelect(baseUrl + "Gestion/ListarTipoVehiculo", "#cbo-det-2-" + n + "", "ID_TIPO_VEHICULO", "DESCRIPCION");
    MRV.CargarSelect(baseUrl + "Gestion/ListarTipoCombustible", "#cbo-det-3-" + n + "", "ID_TIPO_COMBUSTIBLE", "DESCRIPCION");
    //}
}

function CargarTablaIndicador(datat, j) {
    var fila = $("#tablaIndicador").data("fila") + 1;
    var tr = '<tr id="detalles-tr-' + (j + 1) + '" data-value="0" >';
    tr = tr + '         <th class="text-center" data-encabezado="Número" scope="row">' + (j + 1) + '</th>';
    tr = tr + '         <td data-encabezado="Columna 01">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-det-1-' + (j + 1) + '">';
    tr = tr + '                          <option value="2018">2018</option>';
    tr = tr + cargarAnio();
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 02">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-det-2-' + (j + 1) + '">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 03">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-det-3-' + (j + 1) + '">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-1-' + (j + 1) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 05">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-2-' + (j + 1) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 06">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-3-' + (j + 1) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 07">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-4-' + (j + 1) + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 07">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-5-' + (j + 1) + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Subtotal">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-6-' + (j + 1) + '" disabled>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';
    //tr = tr + '         <td class="text-center" data-encabezado="Sustento">';
    //tr = tr + '                <div class="form-group m-0">';
    //tr = tr + '                       <button class="btn btn-secondary btn-sm m-0" onclick="fn_calcularIndicadores();"><i class="fas fa-upload mr-1"></i>+</button>';
    //tr = tr + '                </div>';
    //tr = tr + '         </td>';
    //tr = tr + '         <td class="text-center" data-encabezado="Sustento">';
    //tr = tr + '                <div class="form-group m-0">';
    //tr = tr + '                       <label class="btn btn-secondary btn-sm m-0" for="fledoc-' + (j + 1) + '"><i class="fas fa-upload mr-1"></i>Cargar</label>';
    //tr = tr + '                       <input class="d-none fil-file-control" type="file" id="fledoc-' + (j + 1) + '" name="fledoc">';
    //tr = tr + '                       <input class="d-none" type="file" id="fledoc-' + (j + 1) + '" name="fledoc">';
    //tr = tr + '                </div>';
    //tr = tr + '         </td>';
    tr = tr + '         <td class="text-center text-xs-right" data-encabezado="Acciones">';
    tr = tr + '                <div class="btn-group">';
    tr = tr + '                     <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
    tr = tr + '                          <div class="dropdown-menu dropdown-menu-right">';
    tr = tr + '                                  <a class="dropdown-item agregarCampos" href="#">';
    tr = tr + '                                         <i class="fas fa-plus-circle"></i>&nbsp;Agregar';
    tr = tr + '                                  </a><a class="dropdown-item quitarCampos" href="#" onclick="fn_restarTotalCO2();">';
    tr = tr + '                                         <i class="fas fa-minus-circle"></i>&nbsp;Eliminar';
    tr = tr + '                                  </a>';
    tr = tr + '                          </div>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';

    tr = tr + '         <td class="text-hide" data-encabezado="ID_INDICADOR" style="display:none;">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-7-' + (j + 1) + '" disabled>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';

    tr = tr + '</tr>';
    $("#cuerpoTablaIndicador").append(tr);
    fn_CargarListaTipoVehiculo(datat, j);
}

function fn_calcularIndicador(fila) {
    var item = {
        ID_INDICADOR: $("#fila" + fila).data("value"),
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ANNOB: $("#annoB" + fila).val(),
        ID_TIPO_VEHICULOB: $("#tipoVehiculoB" + fila).val(),
        ID_TIPO_COMBUSTIBLEB: $("#tipoCombustibleB" + fila).val(),
        KRVB: $("#krvB" + fila).val(),
        CANTIDADB: $("#cantidadB" + fila).val(),
        FACTOR_RENDIMIENTO: $("#factorRendimientoB" + fila).val(),
        ID_TIPO_FUENTEI: $("#cbo-enfoque").val(),
    }
    $.ajax({
        url: baseUrl + 'Gestion/CalcularIndicador',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#totalB" + fila).val(data[i]["TOTAL_GEI_BASE"]);
                        $("#totalI" + fila).val(data[i]["TOTAL_GEI_INIMIT"]);
                        $("#totalR" + fila).val(data[i]["TOTAL_GEI_REDUCIDO"]);
                        $("#fila" + fila).data("value", data[i]["ID_INDICADOR"]);
                    }
                }
            }
        }
    });
}

//////////////////////////////////////////////////////////////////////////////
//function fn_procesoDetalleIndicador(url, estado) {
//    indicadores = [];
//    documentos = [];
//    var n = $(".tabla-detalle-indicadores").find("tbody").find("th").length + 1;
//    for (var fila = 1 ; fila < n; fila++) {
//        if ($("#txt-det-6-" + fila).val() != '') {
//            var itx = {
//                ID_INDICADOR: $("#txt-det-7-" + fila).val(),
//                ID_INICIATIVA: $("#Control").data("iniciativa"),
//                ANNOB: $("#cbo-det-1-" + fila).val(),
//                ID_TIPO_VEHICULOB: $("#cbo-det-2-" + fila).val(),
//                ID_TIPO_COMBUSTIBLEB: $("#cbo-det-3-" + fila).val(),
//                KRVB: $("#txt-det-1-" + fila).val(),
//                CANTIDADB: $("#txt-det-2-" + fila).val(),
//                FACTOR_RENDIMIENTO: $("#txt-det-3-" + fila).val(),
//                TOTAL_GEI_BASE: $("#txt-det-4-" + fila).val(),
//                TOTAL_GEI_INIMIT: $("#txt-det-5-" + fila).val(),
//                TOTAL_GEI_REDUCIDO: $("#txt-det-6-" + fila).val(),
//                ID_TIPO_FUENTEI: $("#cbo-enfoque").val(),
//                ADJUNTO_BASE: $("#fledoc-" + fila).val()
//            }
//            indicadores.push(itx);
//        }
//    }

//    var sustentos = document.getElementById("fledocumentos");
//    for (var sus = 0; sus < sustentos.files.length; sus++) {
//        var sux = {
//            ID_INICIATIVA: $("#Control").data("iniciativa"),
//            ADJUNTO_BASE: sustentos.files[sus].name,
//            FLAG_ESTADO: "1"
//        }
//        documentos.push(sux);
//    }

//    var id_delete = "";
//    if ($("#cuerpoTablaIndicador").data("delete") != "") {
//        id_delete = $("#cuerpoTablaIndicador").data("delete");
//        id_delete = id_delete.substring(0, id_delete.length - 1);
//    }

//    var item = {
//        ID_INICIATIVA: $("#Control").data("iniciativa"),
//        ID_USUARIO: $("#Control").data("usuario"),
//        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
//        ID_INDICADOR_DELETE: id_delete,
//        ID_ESTADO: estado,
//        ListaIndicadores: indicadores,
//        ListaSustentos: documentos
//    };

//    var options = {
//        type: "POST",
//        dataType: "json",
//        contentType: false,
//        url: url,
//        processData: false,
//        data: ({
//            ID_INICIATIVA: $("#Control").data("iniciativa"),
//            ID_USUARIO: $("#Control").data("usuario"),
//            NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
//            ID_INDICADOR_DELETE: id_delete,
//            ID_ESTADO: estado,
//            ListaIndicadores: indicadores,
//            ListaSustentos: documentos
//        }),
//        xhr: function () {  // Custom XMLHttpRequest
//            var myXhr = $.ajaxSettings.xhr();
//            if (myXhr.upload) { // Check if upload property exists
//                //myXhr.upload.addEventListener('progress', progressHandlingFunction, false); // For handling the progress of the upload
//            }
//            return myXhr;
//        },
//        resetForm: false,
//        beforeSubmit: function (formData, jqForm, options) {
//            return true;
//        },
//        success: function (response, textStatus, myXhr) {
//            if (response.success) {
//                if (estado == 0 || estado == 6) {
//                    $("#mensajeModalAvance #mensajeDangerAvance").remove();
//                    var msj = '                   <div class="col-sm-12 col-md-12 col-lg-12" id="mensajeWarningAvance">';
//                    msj = msj + '                       <div class="alert alert-warning d-flex align-items-stretch" role="alert">';
//                    msj = msj + '                            <div class="alert-wrap mr-3">';
//                    msj = msj + '                                <div class="sa">';
//                    msj = msj + '                                    <div class="sa-warning">';
//                    msj = msj + '                                        <div class="sa-warning-body"></div>';
//                    msj = msj + '                                        <div class="sa-warning-dot"></div>';
//                    msj = msj + '                                    </div>';
//                    msj = msj + '                                </div>';
//                    msj = msj + '                            </div>';
//                    msj = msj + '                            <div class="alert-wrap">';
//                    msj = msj + '                                <h6>Sus avances fueron guardados</h6>';
//                    msj = msj + '                                <hr>Recuerde, podrá solicitar una revisión una vez complete todos los campos obligatorios.';
//                    msj = msj + '                            </div>';
//                    msj = msj + '                        </div>';
//                    msj = msj + '                    </div>';
//                    $("#guardar-avance #modalAvanceBoton").hide();
//                    $("#pieCorrectoAvance").show();
//                    $('#mensajeModalAvance').append(msj);
//                } else if (estado == 1 || estado == 5) {
//                    $('#mensajeModalRegistrar #mensajeGoodRegistro').remove();
//                    $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
//                    var msj = '                       <div class="alert alert-success d-flex align-items-stretch" role="alert" id="mensajeGoodRegistro">';
//                    msj = msj + '                            <div class="alert-wrap mr-3">';
//                    msj = msj + '                                <div class="sa">';
//                    msj = msj + '                                    <div class="sa-success">';
//                    msj = msj + '                                        <div class="sa-success-tip"></div>';
//                    msj = msj + '                                        <div class="sa-success-long"></div>';
//                    msj = msj + '                                        <div class="sa-success-placeholder"></div>';
//                    msj = msj + '                                        <div class="sa-success-fix"></div>';
//                    msj = msj + '                                    </div>';
//                    msj = msj + '                                </div>';
//                    msj = msj + '                            </div>';
//                    msj = msj + '                            <div class="alert-wrap">';
//                    msj = msj + '                                <h6>Bien hecho</h6>';
//                    msj = msj + '                                <hr><small class="mb-0">Los datos de su detalle de indicadores fueron guardados exitosamente, espere la aprobación del especialista para continuar. En breve le notificaremos el estado de su solicitud de revisión.</small>';
//                    msj = msj + '                            </div>';
//                    msj = msj + '                        </div>';
//                    $("#solicitar-revision #modalRegistrarBoton").hide();
//                    $("#pieCorrecto").show();
//                    $('#mensajeModalRegistrar').append(msj);
//                    $("#Control").data("modal", 1);
//                    if (response.extra == "1") {
//                        if (ws != null) ws.send(response.extra);
//                    }
//                }
//            } else {
//                if (estado == 0) {
//                    $("#mensajeModalAvance #mensajeDangerAvance").remove();
//                    var msj = '                   <div class="col-sm-12 col-md-12 col-lg-12" id="mensajeDangerAvance">';
//                    msj = msj + '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert">';
//                    msj = msj + '                            <div class="alert-wrap mr-3">';
//                    msj = msj + '                                <div class="sa">';
//                    msj = msj + '                                    <div class="sa-error">';
//                    msj = msj + '                                       <div class="sa-error-x">';
//                    msj = msj + '                                           <div class="sa-error-left"></div>';
//                    msj = msj + '                                           <div class="sa-error-right"></div>';
//                    msj = msj + '                                       </div>';
//                    msj = msj + '                                       <div class="sa-error-placeholder"></div>';
//                    msj = msj + '                                       <div class="sa-error-fix"></div>';
//                    msj = msj + '                                   </div>';
//                    msj = msj + '                               </div>';
//                    msj = msj + '                           </div>';
//                    msj = msj + '                            <div class="alert-wrap">';
//                    msj = msj + '                                <h6>Error</h6>';
//                    msj = msj + '                                <hr>Ocurrio un error durante el proceso de guardado del avance.';
//                    msj = msj + '                            </div>';
//                    msj = msj + '                        </div>';
//                    msj = msj + '                    </div>';
//                    $('#mensajeModalAvance').append(msj);
//                } else {
//                    $('#mensajeModalRegistrar #mensajeGoodRegistro').remove();
//                    $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
//                    var msj = '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="mensajeDangerRegistro">';
//                    msj = msj + '                            <div class="alert-wrap mr-3">';
//                    msj = msj + '                                <div class="sa">';
//                    msj = msj + '                                    <div class="sa-error">';
//                    msj = msj + '                                       <div class="sa-error-x">';
//                    msj = msj + '                                           <div class="sa-error-left"></div>';
//                    msj = msj + '                                           <div class="sa-error-right"></div>';
//                    msj = msj + '                                       </div>';
//                    msj = msj + '                                       <div class="sa-error-placeholder"></div>';
//                    msj = msj + '                                       <div class="sa-error-fix"></div>';
//                    msj = msj + '                                   </div>';
//                    msj = msj + '                               </div>';
//                    msj = msj + '                           </div>';
//                    msj = msj + '                           <div class="alert-wrap">';
//                    msj = msj + '                                <h6>Error de registro</h6>';
//                    msj = msj + '                                <hr><small class="mb-0">Verifique que los datos sean correctamente ingresados, complete todos los campos obligatorios e intente otra vez.</small>';
//                    msj = msj + '                           </div>';
//                    msj = msj + '                     </div>';
//                    $('#mensajeModalRegistrar').append(msj);
//                }
//            }
//        },
//        error: function (myXhr, textStatus, errorThrown) {
//            console.log(myXhr);
//            console.log(textStatus);
//            console.log(errorThrown);
//        }
//    };

//    $("#formRegistrar").ajaxForm(options);
//    $("#formRegistrar").submit();



//    $("#solicitar-revision").on("hidden.bs.modal", function () {
//        if ($("#Control").data("modal") == 1) {
//            location.href = baseUrl + "Gestion/AccionMitigacion";
//        } else {
//            $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
//            $("#solicitar-revision #modalRegistrarBoton").show();
//            $("#pieCorrecto").hide();
//        }
//    });

//    $("#guardar-avance").on("hidden.bs.modal", function () {
//        $("#mensajeModalAvance #mensajeDangerAvance").remove();
//        $("#mensajeModalAvance #mensajeWarningAvance").remove();
//        $("#guardar-avance #modalAvanceBoton").show();
//        $("#pieCorrectoAvance").hide();
//    });
//}
//////////////////////////////////////////////////////////////

//function fn_guardarDetalleIndicador() {
//    var url = baseUrl + "Gestion/RegistrarDetalleIndicador";
//    //fn_procesoDetalleIndicador(url, 1);

//    var options = {
//        type: "POST",
//        dataType: "json",
//        contentType: false,
//        url: url,
//        processData: false,
//        data: ({
//            ID_INICIATIVA: $("#Control").data("iniciativa"),
//            ID_USUARIO: $("#Control").data("usuario"),
//            NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
//            ID_ESTADO: 1
//        }),
//        xhr: function () {  // Custom XMLHttpRequest
//            var myXhr = $.ajaxSettings.xhr();
//            if (myXhr.upload) { // Check if upload property exists
//                //myXhr.upload.addEventListener('progress', progressHandlingFunction, false); // For handling the progress of the upload
//            }
//            return myXhr;
//        },
//        resetForm: false,
//        beforeSubmit: function (formData, jqForm, options) {
//            return true;
//        },
//        success: function (response, textStatus, myXhr) {
//            if (response.success) {
//                var msj = '                       <div class="alert alert-success d-flex align-items-stretch" role="alert">';
//                msj = msj + '                            <div class="alert-wrap mr-3">';
//                msj = msj + '                                <div class="sa">';
//                msj = msj + '                                    <div class="sa-success">';
//                msj = msj + '                                        <div class="sa-success-tip"></div>';
//                msj = msj + '                                        <div class="sa-success-long"></div>';
//                msj = msj + '                                        <div class="sa-success-placeholder"></div>';
//                msj = msj + '                                        <div class="sa-success-fix"></div>';
//                msj = msj + '                                    </div>';
//                msj = msj + '                                </div>';
//                msj = msj + '                            </div>';
//                msj = msj + '                            <div class="alert-wrap">';
//                msj = msj + '                                <h6>Bien hecho</h6>';
//                msj = msj + '                                <hr><small class="mb-0">Su registro fue exitoso, en breve le notificaremos el estado a través de un email.</small>';
//                msj = msj + '                            </div>';
//                msj = msj + '                        </div>';
//                $("#seccionMensaje").append(msj);
//                //setTimeout(dirigir, 5000);
//            } else {
//                var msj = '                      <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="errorRegistro">';
//                msj = msj + '                           <div class="alert-wrap mr-3">';
//                msj = msj + '                                <div class="sa">';
//                msj = msj + '                                    <div class="sa-error">';
//                msj = msj + '                                        <div class="sa-error-x">';
//                msj = msj + '                                            <div class="sa-error-left"></div>';
//                msj = msj + '                                            <div class="sa-error-right"></div>';
//                msj = msj + '                                        </div>';
//                msj = msj + '                                        <div class="sa-error-placeholder"></div>';
//                msj = msj + '                                        <div class="sa-error-fix"></div>';
//                msj = msj + '                                    </div>';
//                msj = msj + '                                </div>';
//                msj = msj + '                            </div>';
//                msj = msj + '                            <div class="alert-wrap">';
//                msj = msj + '                                <h6>Error de registro</h6>';
//                msj = msj + '                                <hr><small class="mb-0">Ocurrio un problema durante el registro.</small>';
//                msj = msj + '                            </div>';
//                msj = msj + '                        </div>';
//                $("#seccionMensaje").append(msj);
//            }
//        },
//        error: function (myXhr, textStatus, errorThrown) {
//            console.log(myXhr);
//            console.log(textStatus);
//            console.log(errorThrown);
//        }
//    };

//    $("#formRegistrar").ajaxForm(options);
//    $("#formRegistrar").submit();
//}

//===============================================
//function fn_guardarDetalleIndicador() {
//    var url = baseUrl + "Gestion/RegistrarDetalleIndicador2";
//    fn_procesoDetalleIndicador(url, 1);
//}

//function fn_guardarAvances() {
//    //var url = baseUrl + "Gestion/AvanceDetalleIndicador";
//    var url = baseUrl + "Gestion/RegistrarDetalleIndicador2";
//    fn_procesoDetalleIndicador(url, 0);
//}

//function fn_corregirDetalleIndicador() {
//    var url = baseUrl + "Gestion/RegistrarDetalleIndicador2";
//    fn_procesoDetalleIndicador(url, 5);
//}

//function fn_corregirAvances() {
//    var url = baseUrl + "Gestion/RegistrarDetalleIndicador2";
//    fn_procesoDetalleIndicador(url, 6);
//}

function validarCheck(id, sid) {
    for (var i = 0; i < $(id).data("cantidad") ; i++) {
        if ($(sid + (i + 1)).prop('checked')) {
            return true;
        }
    }
    return false;
}

function validarCampoRevision() {
    if (!validarCheck("#listaEnerg", "#E")) {
        return false;
    }
    if (!validarCheck("#listaGei", "#G")) {
        return false;
    }
    return true;
}

//===============================================
function fn_observacionDetalleIndicador() {

    var mns = ValidarRevision('0', $("#Control").data("iniciativa"), $("#estado_flujo").val(), "modalErrorRevision", "Esta iniciativa ya fue revisada y/o observada");
    if (mns != "") {
        $("#observar-revision #modalObservacionBoton").hide();
        $("#pieCorrectoObservacion").show();
        $("#modalRevision").append(mns);
        $("#Control").data("modal", 1);
        return false;
    }

    url = baseUrl + "Gestion/ObservacionDetalleIndicador";
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario"),
        DESCRIPCION: $("#txa-observacion-detalle").val(),
        EMAIL_USUARIO: $("#txt-correo-electronico").val(),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
        ID_ESTADO: $("#cbo-tipo-observacion").val()
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalRevision #modalErrorRevision").remove();
        $("#modalRevision #modalCorrectoRevision").remove();
        var msj = '                           <div class="alert alert-success d-flex align-items-stretch" role="alert" id="modalCorrectoRevision">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-success">';
        msj = msj + '                                            <div class="sa-success-tip"></div>';
        msj = msj + '                                            <div class="sa-success-long"></div>';
        msj = msj + '                                            <div class="sa-success-placeholder"></div>';
        msj = msj + '                                            <div class="sa-success-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Bien hecho</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones se enviaron correctamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#observar-revision #modalObservacionBoton").hide();
        $("#pieCorrectoObservacion").show();
        $("#modalRevision").append(msj);
        $("#Control").data("modal", 1);
        //if (ws != null) ws.send(respuesta.extra);

    } else {
        $("#modalRevision #modalErrorRevision").remove();
        var msj = '                           <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="modalErrorRevision">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-error">';
        msj = msj + '                                            <div class="sa-error-x">';
        msj = msj + '                                                <div class="sa-error-left"></div>';
        msj = msj + '                                                <div class="sa-error-right"></div>';
        msj = msj + '                                            </div>';
        msj = msj + '                                            <div class="sa-error-placeholder"></div>';
        msj = msj + '                                            <div class="sa-error-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Error de registro</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones no fueron enviadas, intentelo nuevamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalRevision").append(msj);
    }

}

$("#observar-revision").on("hidden.bs.modal", function () {
    if ($("#Control").data("modal") == 1) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    } else {
        $("#modalRevision #modalErrorRevision").remove();
        $("#observar-revision #modalObservacionBoton").show();
        $("#pieCorrectoObservacion").hide();
    }
});

function fn_revisarDetalleIndicador() {

    var mns = ValidarRevision('0', $("#Control").data("iniciativa"), $("#estado_flujo").val(), "mensajeDangerRegistro", "Esta iniciativa ya fue revisada y/o observada");
    if (mns != "") {
        $("#aprobar-revision #modalAprobarBoton").hide();
        $("#pieCorrectoAprobacion").show();
        $("#modalAprobacion").append(mns);
        $("#Control").data("modal", 1);
        return false;
    }

    if (!validarCampoRevision()) {
        $('#modalAprobacion #modalErrorAprobacion').remove();
        $('#modalAprobacion #mensajeDangerRegistro').remove();
        var msj = '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="mensajeDangerRegistro">';
        msj = msj + '                            <div class="alert-wrap mr-3">';
        msj = msj + '                                <div class="sa">';
        msj = msj + '                                    <div class="sa-error">';
        msj = msj + '                                       <div class="sa-error-x">';
        msj = msj + '                                           <div class="sa-error-left"></div>';
        msj = msj + '                                           <div class="sa-error-right"></div>';
        msj = msj + '                                       </div>';
        msj = msj + '                                       <div class="sa-error-placeholder"></div>';
        msj = msj + '                                       <div class="sa-error-fix"></div>';
        msj = msj + '                                   </div>';
        msj = msj + '                               </div>';
        msj = msj + '                           </div>';
        msj = msj + '                           <div class="alert-wrap">';
        msj = msj + '                                <h6>Error de registro</h6>';
        msj = msj + '                                <hr><small class="mb-0">Por favor, completar los campos obligatorios.</small>';
        msj = msj + '                           </div>';
        msj = msj + '                     </div>';
        $("#modalAprobacion").append(msj);
        return false;
    }

    ///================================= add
    var energetico = "";
    var descripcion_energ = "";
    for (var i = 0; i < $("#listaEnerg").data("cantidad") ; i++) {
        if ($('#E' + (i + 1)).prop('checked')) {
            energetico = energetico + $('#E' + (i + 1)).data("value") + "," + "1/";
            descripcion_energ += $(".energ-" + (i + 1)).html() + " - ";
        }
    }
    energetico = energetico.substring(0, energetico.length - 1);
    descripcion_energ = descripcion_energ.substring(0, descripcion_energ.length - 3);

    var gei = "";
    var descripcion_gei = "";
    for (var i = 0; i < $("#listaGei").data("cantidad") ; i++) {
        if ($('#G' + (i + 1)).prop('checked')) {
            gei = gei + $('#G' + (i + 1)).data("value") + "," + "1/";
            descripcion_gei += $(".gei-" + (i + 1)).html() + " - ";
        }
    }
    gei = gei.substring(0, gei.length - 1);
    descripcion_gei = descripcion_gei.substring(0, descripcion_gei.length - 3);
    ///=====================================

    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario"),
        EMAIL_USUARIO: $("#txt-correo-electronico").val(),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
        ID_TIPO_INICIATIVA: $("#tipo-iniciativa").data("tipo"),
        ENERGETICO: energetico, //add
        GEI: gei, //add
        DESCRIPCION_GEI: descripcion_gei,
        DESCRIPCION_ENERG: descripcion_energ
    }
    url = baseUrl + "Gestion/AprobarDetalleIndicador";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalAprobacion #modalCorrectoAprobacion").remove();
        $("#modalAprobacion #modalErrorAprobacion").remove();
        var msj = '                           <div class="alert alert-success d-flex align-items-stretch" role="alert" id="modalCorrectoAprobacion">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-success">';
        msj = msj + '                                            <div class="sa-success-tip"></div>';
        msj = msj + '                                            <div class="sa-success-long"></div>';
        msj = msj + '                                            <div class="sa-success-placeholder"></div>';
        msj = msj + '                                            <div class="sa-success-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Bien hecho</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Se aprobó correctamente esta revisión, se procederá a notificar al Usuario Administrado.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#aprobar-revision #modalAprobarBoton").hide();
        $("#pieCorrectoAprobacion").show();
        $("#modalAprobacion").append(msj);
        $("#Control").data("modal", 1);
        if (ws != null) ws.send(respuesta.extra);

    } else {
        $("#modalAprobacion #modalErrorAprobacion").remove();
        var msj = '                           <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="modalErrorAprobacion">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-error">';
        msj = msj + '                                            <div class="sa-error-x">';
        msj = msj + '                                                <div class="sa-error-left"></div>';
        msj = msj + '                                                <div class="sa-error-right"></div>';
        msj = msj + '                                            </div>';
        msj = msj + '                                            <div class="sa-error-placeholder"></div>';
        msj = msj + '                                            <div class="sa-error-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Error de aprobación</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Ocurrió un error de comunicación con el servidor, intente otra vez.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalAprobacion").append(msj);
    }
}

$("#aprobar-revision").on("hidden.bs.modal", function () {
    if ($("#Control").data("modal") == 1) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    } else {
        $("#modalAprobacion #modalErrorAprobacion").remove();
        $("#aprobar-revision #modalAprobarBoton").show();
        $("#pieCorrectoAprobacion").hide();
    }
});

function fn_observacionAdminDetalleIndicador() {

    var mns = ValidarRevision('0', $("#Control").data("iniciativa"), $("#estado_flujo").val(), "modalErrorRevision", "Esta iniciativa ya fue revisada y/o observada");
    if (mns != "") {
        $("#observar-revision #modalObservacionBoton").hide();
        $("#pieCorrectoObservacion").show();
        $("#modalRevision").append(mns);
        $("#Control").data("modal", 1);
        return false;
    }

    url = baseUrl + "Gestion/ObservacionAdminDetalleIndicador";
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario"),
        DESCRIPCION: $("#txa-observacion-detalle").val(),
        //EMAIL_USUARIO: $("#txt-correo-electronico").val(),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
        ID_ESTADO: $("#cbo-tipo-observacion").val(),
        ID_MEDMIT: $("#Control").data("mitigacion")
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalRevision #modalErrorRevision").remove();
        $("#modalRevision #modalCorrectoRevision").remove();
        var msj = '                           <div class="alert alert-success d-flex align-items-stretch" role="alert" id="modalCorrectoRevision">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-success">';
        msj = msj + '                                            <div class="sa-success-tip"></div>';
        msj = msj + '                                            <div class="sa-success-long"></div>';
        msj = msj + '                                            <div class="sa-success-placeholder"></div>';
        msj = msj + '                                            <div class="sa-success-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Bien hecho</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones se enviaron correctamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#observar-revision #modalObservacionBoton").hide();
        $("#pieCorrectoObservacion").show();
        $("#modalRevision").append(msj);
        $("#Control").data("modal", 1);
        //if (ws != null) ws.send(respuesta.extra);

    } else {
        $("#modalRevision #modalErrorRevision").remove();
        var msj = '                           <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="modalErrorRevision">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-error">';
        msj = msj + '                                            <div class="sa-error-x">';
        msj = msj + '                                                <div class="sa-error-left"></div>';
        msj = msj + '                                                <div class="sa-error-right"></div>';
        msj = msj + '                                            </div>';
        msj = msj + '                                            <div class="sa-error-placeholder"></div>';
        msj = msj + '                                            <div class="sa-error-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Error de registro</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones no fueron enviadas, intentelo nuevamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalRevision").append(msj);
    }

}

$("#observar-revision").on("hidden.bs.modal", function () {
    if ($("#Control").data("modal") == 1) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    } else {
        $("#modalRevision #modalErrorRevision").remove();
        $("#observar-revision #modalObservacionBoton").show();
        $("#pieCorrectoObservacion").hide();
    }
});

function fn_revisarAdminDetalleIndicador() {

    var mns = ValidarRevision('0', $("#Control").data("iniciativa"), $("#estado_flujo").val(), "mensajeDangerRegistro", "Esta iniciativa ya fue revisada y/o observada");
    if (mns != "") {
        $("#aprobar-revision #modalAprobarBoton").hide();
        $("#pieCorrectoAprobacion").show();
        $("#modalAprobacion").append(mns);
        $("#Control").data("modal", 1);
        return false;
    }

    if (!validarCampoRevision()) {
        $('#modalAprobacion #modalErrorAprobacion').remove();
        $('#modalAprobacion #mensajeDangerRegistro').remove();
        var msj = '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="mensajeDangerRegistro">';
        msj = msj + '                            <div class="alert-wrap mr-3">';
        msj = msj + '                                <div class="sa">';
        msj = msj + '                                    <div class="sa-error">';
        msj = msj + '                                       <div class="sa-error-x">';
        msj = msj + '                                           <div class="sa-error-left"></div>';
        msj = msj + '                                           <div class="sa-error-right"></div>';
        msj = msj + '                                       </div>';
        msj = msj + '                                       <div class="sa-error-placeholder"></div>';
        msj = msj + '                                       <div class="sa-error-fix"></div>';
        msj = msj + '                                   </div>';
        msj = msj + '                               </div>';
        msj = msj + '                           </div>';
        msj = msj + '                           <div class="alert-wrap">';
        msj = msj + '                                <h6>Error de registro</h6>';
        msj = msj + '                                <hr><small class="mb-0">Por favor, completar los campos obligatorios.</small>';
        msj = msj + '                           </div>';
        msj = msj + '                     </div>';
        $("#modalAprobacion").append(msj);
        return false;
    }

    ///================================= add
    var energetico = "";
    var descripcion_energ = "";
    for (var i = 0; i < $("#listaEnerg").data("cantidad") ; i++) {
        if ($('#E' + (i + 1)).prop('checked')) {
            energetico = energetico + $('#E' + (i + 1)).data("value") + "," + "1/";
            descripcion_energ += $(".energ-" + (i + 1)).html() + " - ";
        }
    }
    energetico = energetico.substring(0, energetico.length - 1);
    descripcion_energ = descripcion_energ.substring(0, descripcion_energ.length - 3);

    var gei = "";
    var descripcion_gei = "";
    for (var i = 0; i < $("#listaGei").data("cantidad") ; i++) {
        if ($('#G' + (i + 1)).prop('checked')) {
            gei = gei + $('#G' + (i + 1)).data("value") + "," + "1/";
            descripcion_gei += $(".gei-" + (i + 1)).html() + " - ";
        }
    }
    gei = gei.substring(0, gei.length - 1);
    descripcion_gei = descripcion_gei.substring(0, descripcion_gei.length - 3);
    ///=====================================

    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        //ID_USUARIO: $("#Control").data("usuario"),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
        //ESTADO_ACTOR: $("#estado-actor").data("estado"),
        ESTADO_ACTOR: 5,
        ID_TIPO_INICIATIVA: $("#tipo-iniciativa").data("tipo"),
        ENERGETICO: energetico, //add
        GEI: gei, //add
        DESCRIPCION_GEI: descripcion_gei,
        DESCRIPCION_ENERG: descripcion_energ
    }
    url = baseUrl + "Gestion/AprobarAdminIniciativaDetalleIndicador";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalAprobacion #modalCorrectoAprobacion").remove();
        $("#modalAprobacion #modalErrorAprobacion").remove();
        $('#modalAprobacion #mensajeDangerRegistro').remove();
        $("#aprobar-revision #modalAprobarBoton").remove();
        var msj = '                           <div class="alert alert-success d-flex align-items-stretch" role="alert" id="modalCorrectoAprobacion">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-success">';
        msj = msj + '                                            <div class="sa-success-tip"></div>';
        msj = msj + '                                            <div class="sa-success-long"></div>';
        msj = msj + '                                            <div class="sa-success-placeholder"></div>';
        msj = msj + '                                            <div class="sa-success-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Bien hecho</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Se aprobó correctamente esta revisión.</small>';
        //msj = msj + '                                    <hr><small class="mb-0">Se aprobó correctamente esta revisión, se procederá a notificar al especialista.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalAprobacion").append(msj);
        $("#pieCorrectoAprobacion").show();
        $("#Control").data("modal", 1);
    } else {
        $('#modalAprobacion #mensajeDangerRegistro').remove();
        $("#modalAprobacion #modalErrorAprobacion").remove();
        var msj = '                           <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="modalErrorAprobacion">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-error">';
        msj = msj + '                                            <div class="sa-error-x">';
        msj = msj + '                                                <div class="sa-error-left"></div>';
        msj = msj + '                                                <div class="sa-error-right"></div>';
        msj = msj + '                                            </div>';
        msj = msj + '                                            <div class="sa-error-placeholder"></div>';
        msj = msj + '                                            <div class="sa-error-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Error de aprobación</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Ocurrió un error de comunicación con el servidor, intente otra vez.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalAprobacion").append(msj);
    }

}

$("#aprobar-revision").on("hidden.bs.modal", function () {
    if ($("#Control").data("modal") == 1) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    } else {
        $("#modalAprobacion #modalErrorAprobacion").remove();
        $('#modalAprobacion #mensajeDangerRegistro').remove();
        $("#pieCorrectoAprobacion").hide();
    }
});

function fn_observacionEvaluadorDetalleIndicador() {

    var mns = ValidarRevision('0', $("#Control").data("iniciativa"), $("#estado_flujo").val(), "modalErrorRevision", "Esta iniciativa ya fue evaluada y/o observada");
    if (mns != "") {
        $("#observar-evaluacion #modalObservacionBoton").hide();
        $("#pieCorrectoObservacion").show();
        $("#modalRevision").append(mns);
        $("#Control").data("modal", 1);
        return false;
    }

    url = baseUrl + "Gestion/ObservacionEvaluarDetalleIndicador";
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        //ID_USUARIO: $("#Control").data("usuario"),
        DESCRIPCION: $("#txa-observacion-detalle").val(),
        //EMAIL_USUARIO: $("#txt-correo-electronico").val(),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
        ID_ESTADO: $("#cbo-tipo-observacion").val(),
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalRevision #modalErrorRevision").remove();
        $("#modalRevision #modalCorrectoRevision").remove();
        var msj = '                           <div class="alert alert-success d-flex align-items-stretch" role="alert" id="modalCorrectoRevision">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-success">';
        msj = msj + '                                            <div class="sa-success-tip"></div>';
        msj = msj + '                                            <div class="sa-success-long"></div>';
        msj = msj + '                                            <div class="sa-success-placeholder"></div>';
        msj = msj + '                                            <div class="sa-success-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Bien hecho</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones se enviaron correctamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#observar-evaluacion #modalObservacionBoton").hide();
        $("#pieCorrectoObservacion").show();
        $("#modalRevision").append(msj);
        $("#Control").data("modal", 1);
        if (ws != null) ws.send(respuesta.extra);

    } else {
        $("#modalRevision #modalErrorRevision").remove();
        var msj = '                           <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="modalErrorRevision">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-error">';
        msj = msj + '                                            <div class="sa-error-x">';
        msj = msj + '                                                <div class="sa-error-left"></div>';
        msj = msj + '                                                <div class="sa-error-right"></div>';
        msj = msj + '                                            </div>';
        msj = msj + '                                            <div class="sa-error-placeholder"></div>';
        msj = msj + '                                            <div class="sa-error-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Error de registro</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones no fueron enviadas, intentelo nuevamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalRevision").append(msj);
    }
}

$("#observar-evaluacion").on("hidden.bs.modal", function () {
    if ($("#Control").data("modal") == 1) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    } else {
        $("#modalRevision #modalErrorRevision").remove();
        $("#observar-evaluacion #modalObservacionBoton").show();
        $("#pieCorrectoObservacion").hide();
    }
});

function fn_observacionVerificarDetalleIndicador() {

    var mns = ValidarRevision('0', $("#Control").data("iniciativa"), $("#estado_flujo").val(), "modalErrorRevision", "Esta iniciativa ya fue verificada y/o observada");
    if (mns != "") {
        $("#observar-verificacion #modalObservacionBoton").hide();
        $("#pieCorrectoObservacion").show();
        $("#modalRevision").append(mns);
        $("#Control").data("modal", 1);
        return false;
    }

    url = baseUrl + "Gestion/ObservacionVerificarDetalleIndicador";
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        //ID_USUARIO: $("#Control").data("usuario"),
        DESCRIPCION: $("#txa-observacion-detalle").val(),
        //EMAIL_USUARIO: $("#txt-correo-electronico").val(),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
        ID_ESTADO: $("#cbo-tipo-observacion").val(),
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalRevision #modalErrorRevision").remove();
        $("#modalRevision #modalCorrectoRevision").remove();
        var msj = '                           <div class="alert alert-success d-flex align-items-stretch" role="alert" id="modalCorrectoRevision">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-success">';
        msj = msj + '                                            <div class="sa-success-tip"></div>';
        msj = msj + '                                            <div class="sa-success-long"></div>';
        msj = msj + '                                            <div class="sa-success-placeholder"></div>';
        msj = msj + '                                            <div class="sa-success-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Bien hecho</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones se enviaron correctamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#observar-verificacion #modalObservacionBoton").hide();
        $("#pieCorrectoObservacion").show();
        $("#modalRevision").append(msj);
        $("#Control").data("modal", 1);
        //if (ws != null) ws.send(respuesta.extra);

    } else {
        $("#modalRevision #modalErrorRevision").remove();
        var msj = '                           <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="modalErrorRevision">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-error">';
        msj = msj + '                                            <div class="sa-error-x">';
        msj = msj + '                                                <div class="sa-error-left"></div>';
        msj = msj + '                                                <div class="sa-error-right"></div>';
        msj = msj + '                                            </div>';
        msj = msj + '                                            <div class="sa-error-placeholder"></div>';
        msj = msj + '                                            <div class="sa-error-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Error de registro</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones no fueron enviadas, intentelo nuevamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalRevision").append(msj);
    }

}

$("#observar-verificacion").on("hidden.bs.modal", function () {
    if ($("#Control").data("modal") == 1) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    } else {
        $("#modalRevision #modalErrorRevision").remove();
        $("#observar-verificacion #modalObservacionBoton").show();
        $("#pieCorrectoObservacion").hide();
    }
});

function fn_evaluarIniciativaDetalle() {

    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario"),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val()
    }
    url = baseUrl + "Gestion/EvaluarIniciativaDetalleIndicador";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalAprobacion #modalCorrectoAprobacion").remove();
        $("#modalAprobacion #modalBCAprobacion").remove();
        $("#modalAprobacion #modalErrorAprobacion").remove();
        var msj = '                           <div class="alert alert-success d-flex align-items-stretch" role="alert" id="modalCorrectoAprobacion">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-success">';
        msj = msj + '                                            <div class="sa-success-tip"></div>';
        msj = msj + '                                            <div class="sa-success-long"></div>';
        msj = msj + '                                            <div class="sa-success-placeholder"></div>';
        msj = msj + '                                            <div class="sa-success-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Bien hecho</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Se aprobó correctamente esta evaluación, se procederá a notificar al Especialista.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';

        var msj1 = '    <div class="alert alert-warning d-flex align-items-stretch" role="alert" id="modalBCAprobacion">';
        msj1 = msj1 + '     <div class="alert-wrap mr-3">';
        msj1 = msj1 + '     <div class="sa">';
        msj1 = msj1 + '         <div class="sa-warning">';
        msj1 = msj1 + '             <div class="sa-warning-body"></div>';
        msj1 = msj1 + '             <div class="sa-warning-dot"></div>';
        msj1 = msj1 + '         </div>';
        msj1 = msj1 + '     </div>';
        msj1 = msj1 + '     </div>';
        msj1 = msj1 + '     <div class="alert-wrap">';
        msj1 = msj1 + '     <h6>Mercado de carbono</h6>';
        msj1 = msj1 + '     <hr><small class="mb-0">';
        msj1 = msj1 + '         Se ha generado la cadena de bloques para la medida de mitigación&nbsp;<strong>aprobada&nbsp; <br></strong><a class="btn btn-warning px-5 text-center my-3" href="#" onclick="fn_descargarCertificado(' + respuesta.extra + ');" data-toggle="modal"><i class="fas fa-download px-1"></i>Descargar certificado</a>';
        msj1 = msj1 + '         <hr>';
        msj1 = msj1 + '         <div><span><strong>Código de blockchain:</strong></span></div>';
        msj1 = msj1 + '         <div class="text-monospace" style="word-break: break-all;">' + respuesta.extra2 + '</div>';
        msj1 = msj1 + '     </small>';
        msj1 = msj1 + '     </div>';
        msj1 = msj1 + '</div>';

        $("#aprobar-evaluacion #modalAprobarBoton").hide();
        $("#pieCorrectoAprobacion").show();
        $("#modalAprobacion").append(msj);
        $("#modalAprobacion").append(msj1);
        $("#Control").data("modal", 1);
    } else {
        $("#modalAprobacion #modalErrorAprobacion").remove();
        var msj = '                           <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="modalErrorAprobacion">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-error">';
        msj = msj + '                                            <div class="sa-error-x">';
        msj = msj + '                                                <div class="sa-error-left"></div>';
        msj = msj + '                                                <div class="sa-error-right"></div>';
        msj = msj + '                                            </div>';
        msj = msj + '                                            <div class="sa-error-placeholder"></div>';
        msj = msj + '                                            <div class="sa-error-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Error de aprobación</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Ocurrió un error de comunicación con el servidor, intente otra vez.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalAprobacion").append(msj);
    }

    $("#aprobar-evaluacion").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
        } else {
            $("#modalAprobacion #modalErrorAprobacion").remove();
            $("#modalAprobacion #modalBCAprobacion").remove();
            $("#aprobar-evaluacion #modalAprobarBoton").show();
            $("#pieCorrectoAprobacion").hide();
        }
    });
}

function fn_verificarIniciativaDetalle() {

    var mns = ValidarRevision('0', $("#Control").data("iniciativa"), $("#estado_flujo").val(), "modalErrorAprobacion", "Esta iniciativa ya fue verificada y/o observada");
    if (mns != "") {
        $("#aprobar-verificacion #modalAprobarBoton").hide();
        $("#pieCorrectoAprobacion").show();
        $("#modalAprobacion").append(mns);
        $("#Control").data("modal", 1);
        return false;
    }

    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario"),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val()
    }
    url = baseUrl + "Gestion/VerificarIniciativaDetalleIndicador";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalAprobacion #modalCorrectoAprobacion").remove();
        $("#modalAprobacion #modalBCAprobacion").remove();
        $("#modalAprobacion #modalErrorAprobacion").remove();
        var msj = '                           <div class="alert alert-success d-flex align-items-stretch" role="alert" id="modalCorrectoAprobacion">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-success">';
        msj = msj + '                                            <div class="sa-success-tip"></div>';
        msj = msj + '                                            <div class="sa-success-long"></div>';
        msj = msj + '                                            <div class="sa-success-placeholder"></div>';
        msj = msj + '                                            <div class="sa-success-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Bien hecho</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Se aprobó correctamente esta verificación, se procederá a notificar al Especialista.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';

        var msj1 = '    <div class="alert alert-warning d-flex align-items-stretch" role="alert" id="modalBCAprobacion">';
        msj1 = msj1 + '     <div class="alert-wrap mr-3">';
        msj1 = msj1 + '     <div class="sa">';
        msj1 = msj1 + '         <div class="sa-warning">';
        msj1 = msj1 + '             <div class="sa-warning-body"></div>';
        msj1 = msj1 + '             <div class="sa-warning-dot"></div>';
        msj1 = msj1 + '         </div>';
        msj1 = msj1 + '     </div>';
        msj1 = msj1 + '     </div>';
        msj1 = msj1 + '     <div class="alert-wrap">';
        msj1 = msj1 + '     <h6>Mercado de carbono</h6>';
        msj1 = msj1 + '     <hr><small class="mb-0">';
        msj1 = msj1 + '         Se ha generado la cadena de bloques para la medida de mitigación&nbsp;<strong>aprobada&nbsp; <br></strong><a class="btn btn-warning px-5 text-center my-3" href="#" onclick="fn_descargarCertificado(' + respuesta.extra + ');" data-toggle="modal" data-target=""><i class="fas fa-download px-1"></i>Descargar certificado</a>';
        msj1 = msj1 + '         <hr>';
        msj1 = msj1 + '         <div><span><strong>Código de blockchain:</strong></span></div>';
        msj1 = msj1 + '         <div class="text-monospace" style="word-break: break-all;">' + respuesta.extra2 + '</div>';
        msj1 = msj1 + '     </small>';
        msj1 = msj1 + '     </div>';
        msj1 = msj1 + '</div>';

        $("#aprobar-verificacion #modalAprobarBoton").hide();
        $("#pieCorrectoAprobacion").show();
        $("#modalAprobacion").append(msj);
        $("#modalAprobacion").append(msj1);
        $("#Control").data("modal", 1);
    } else {
        $("#modalAprobacion #modalErrorAprobacion").remove();
        var msj = '                           <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="modalErrorAprobacion">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-error">';
        msj = msj + '                                            <div class="sa-error-x">';
        msj = msj + '                                                <div class="sa-error-left"></div>';
        msj = msj + '                                                <div class="sa-error-right"></div>';
        msj = msj + '                                            </div>';
        msj = msj + '                                            <div class="sa-error-placeholder"></div>';
        msj = msj + '                                            <div class="sa-error-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Error de aprobación</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Ocurrió un error de comunicación con el servidor, intente otra vez.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalAprobacion").append(msj);
    }

}

$("#aprobar-verificacion").on("hidden.bs.modal", function () {
    if ($("#Control").data("modal") == 1) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    } else {
        $("#modalAprobacion #modalErrorAprobacion").remove();
        $("#modalAprobacion #modalBCAprobacion").remove();
        $("#aprobar-verificacion #modalAprobarBoton").show();
        $("#pieCorrectoAprobacion").hide();
    }
});

function fn_descargarCertificado(idBlock) {
    var item = {
        ID_BLOCKCHAIN: idBlock
    };
    var url = baseUrl + "Gestion/DescargarBlockChain_2?IdBlockchain=" + idBlock;
    //var respuesta = MRV.Ajax(url, item, false);

    //if (respuesta.success) {
    //    var urlMostrar = baseUrl + "Temp/" + respuesta.extra;
    //    window.open(urlMostrar, "_blank");
    //}

    $.ajax({
        type: "POST",
        url: url,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        data: JSON.stringify(item),
        success: function (response) {
            var urlMostrar = baseUrl + "Temp/" + response.extra;
            window.open(urlMostrar, "_blank");
        },
        failure: function (msg) {
            alert(msg);
            rsp = msg;
        },
        error: function (xhr, status, error) {
            alert(error);
            rsp = error;
        }
    });

}

function fn_verfileindicaor(idIndicador) {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_INDICADOR: idIndicador
    };
    var url = baseUrl + 'Gestion/GetDetalleIndicador';
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        var urlMostrar = baseUrl + "Temp/" + respuesta.extra;
        window.open(urlMostrar, "_blank");
    }
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

////////////////Exportar

function exportarDetalle() {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_MEDMIT: $("#Control").data("mitigacion")
    };

    var url = baseUrl + 'Gestion/ExportarDetalleIndicador';

    var parametros = {
        Url: url,
        Item: JSON.stringify(item)
    };

    var frm = '<form id = "frmDescarga" name = "frmDescarga" method = "POST" target = "_blank" action = "' + url + '"></form>';
    var hdn = '<input type = "hidden" id = "url" name = "url" />';
    var hdnFormato = '<input type = "hidden" id = "formato" name = "formato" />';
    var hdnItem = '<input type = "hidden" id = "item" name = "item" />';
    jQuery('#divExportar').append(frm)
    jQuery(hdn).appendTo(jQuery('#frmDescarga'));
    jQuery(hdnFormato).appendTo(jQuery('#frmDescarga'));
    jQuery(hdnItem).appendTo(jQuery('#frmDescarga'));
    jQuery('#frmDescarga #url').val(parametros.Url);
    jQuery('#frmDescarga #item').val(parametros.Item);
    jQuery('#frmDescarga').submit();
    jQuery('#frmDescarga').remove();
}

function fn_DatosComentario(id) {
    var Item = {
        ID_MEDMIT: id,
        ID_ROL: $("#Control").data("rol")
    };
    vurl = baseUrl + "Gestion/ObtenerUsuario";
    $.ajax({
        url: vurl,
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
                        $("#resumen-detalle2").append(data[i]["IPSC_MEDMIT"]);
                    }
                }
            }
        }
    });
}


function fn_EstadoActor(id) {
    $("#estado-actor").data("estado", id);
    //alert($("#estado-actor").data("estado"));
}

function inicio() {
    $("#pieCorrectoObservacion").hide();
    $("#pieCorrectoAprobacion").hide();
    $("#pieCorrectoAvance").hide();
    $("#pieCorrecto").hide();
    $("#mensajeGoodRegistro").hide();
}

//==============================================================================================================

//      CUERPO TABLA

//==============================================================================================================

function cargarCuerpoElectrico(data, fila, enfoque, bandera) {
    var tr = '<tr id="detalles-tr-' + fila + '" data-value="' + fila + '0" >';
    tr = tr + '         <th class="text-center" data-encabezado="Número" scope="row" id="row-' + fila + '">' + fila + '</th>';
    tr = tr + '         <td data-encabezado="Columna 01">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm text-right" id="cbo-det-1-' + fila + '" onchange="fn_calcular(' + fila + ')">';
    tr = tr + '                          <option value="2018">2018</option>';
    tr = tr + cargarAnio();
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="date" placeholder="" id="dat-det-1-' + fila + '" onBlur="fn_calcular(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 02">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm text-right" id="cbo-det-2-' + fila + '" onchange="fn_calcular(' + fila + ')">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 03">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm text-right" id="cbo-det-3-' + fila + '" onchange="fn_calcular(' + fila + ')">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-1-' + fila + '" onBlur="fn_calcular(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 05">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-2-' + fila + '" onBlur="fn_calcular(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 06">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-3-' + fila + '" onBlur="fn_calcular(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-4-' + fila + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 07">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-5-' + fila + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 07">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-6-' + fila + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Subtotal">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-7-' + fila + '" disabled>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td class="text-center text-xs-right" data-encabezado="Acciones">';
    tr = tr + '                <div class="btn-group">';
    tr = tr + '                     <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
    tr = tr + '                          <div class="dropdown-menu dropdown-menu-right">';
    tr = tr + '                                  <a class="dropdown-item agregarFila" href="#">';
    tr = tr + '                                         <i class="fas fa-plus-circle"></i>&nbsp;Agregar';
    tr = tr + '                                  </a><a class="dropdown-item quitarCampos" href="#" onclick="fn_restarTotal(7, 8);">';
    tr = tr + '                                         <i class="fas fa-minus-circle"></i>&nbsp;Eliminar';
    tr = tr + '                                  </a>';
    tr = tr + '                          </div>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';

    tr = tr + '         <td class="text-hide" data-encabezado="ID_INDICADOR" style="display:none;">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-8-' + fila + '" disabled>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';

    tr = tr + '</tr>';
    $("#cuerpoTablaIndicador").append(tr);
    if (bandera == 1) {
        fn_CargarListaTipoVehiculo(data, (fila - 1), enfoque);
    }
    //return tr;
}

//==============================================================================================================

function cargarCuerpoHibrido(data, fila, enfoque, bandera) {
    var tr = '<tr id="detalles-tr-' + fila + '" data-value="' + fila + '0" >';
    tr = tr + '         <th class="text-center" data-encabezado="Número" scope="row" id="row-' + fila + '">' + fila + '</th>';
    tr = tr + '         <td data-encabezado="Columna 01">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm text-right" id="cbo-det-1-' + fila + '" onchange="fn_calcular(' + fila + ')">';
    tr = tr + '                          <option value="2018">2018</option>';
    tr = tr + cargarAnio();
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="date" placeholder="" id="dat-det-1-' + fila + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 02">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm text-right" id="cbo-det-2-' + fila + '" onchange="fn_calcular(' + fila + ')">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 03">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm text-right" id="cbo-det-3-' + fila + '" onchange="fn_calcular(' + fila + ')">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-1-' + fila + '" onBlur="fn_calcular(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 05">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-2-' + fila + '" onBlur="fn_calcular(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 06">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-3-' + fila + '" onBlur="fn_calcular(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 07">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-4-' + fila + '" onBlur="fn_calcular(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-5-' + fila + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 08">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-6-' + fila + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 09">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-7-' + fila + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Subtotal">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-8-' + fila + '" disabled>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td class="text-center text-xs-right" data-encabezado="Acciones">';
    tr = tr + '                <div class="btn-group">';
    tr = tr + '                     <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
    tr = tr + '                          <div class="dropdown-menu dropdown-menu-right">';
    tr = tr + '                                  <a class="dropdown-item agregarFila" href="#">';
    tr = tr + '                                         <i class="fas fa-plus-circle"></i>&nbsp;Agregar';
    tr = tr + '                                  </a><a class="dropdown-item quitarCampos" href="#" onclick="fn_restarTotal(8, 9);">';
    tr = tr + '                                         <i class="fas fa-minus-circle"></i>&nbsp;Eliminar';
    tr = tr + '                                  </a>';
    tr = tr + '                          </div>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';

    tr = tr + '         <td class="text-hide" data-encabezado="ID_INDICADOR" style="display:none;">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-9-' + fila + '" disabled>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';

    tr = tr + '</tr>';
    $("#cuerpoTablaIndicador").append(tr);
    if (bandera == 1) {
        fn_CargarListaTipoVehiculo(data, (fila - 1), enfoque);
    }
    //return tr;
}

//==============================================================================================================================================================0

function cargarCuerpoElectricoConsumo(data, fila, enfoque, bandera) {
    var tr = '<tr id="detalles-tr-' + fila + '" data-value="' + fila + '0" >';
    tr = tr + '         <th class="text-center" data-encabezado="Número" scope="row" id="row-' + fila + '">' + fila + '</th>';
    tr = tr + '         <td data-encabezado="Columna 01">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm text-right" id="cbo-det-1-' + fila + '" onchange="fn_calcular(' + fila + ')">';
    tr = tr + '                          <option value="2018">2018</option>';
    tr = tr + cargarAnio();
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="date" placeholder="" id="dat-det-1-' + fila + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 02">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm text-right" id="cbo-det-2-' + fila + '" onchange="fn_calcular(' + fila + ')">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 03">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm text-right" id="cbo-det-3-' + fila + '" onchange="fn_calcular(' + fila + ')">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-1-' + fila + '" onBlur="fn_calcular(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-2-' + fila + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 07">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-3-' + fila + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 07">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-4-' + fila + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Subtotal">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-5-' + fila + '" disabled>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td class="text-center text-xs-right" data-encabezado="Acciones">';
    tr = tr + '                <div class="btn-group">';
    tr = tr + '                     <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
    tr = tr + '                          <div class="dropdown-menu dropdown-menu-right">';
    tr = tr + '                                  <a class="dropdown-item agregarFila" href="#">';
    tr = tr + '                                         <i class="fas fa-plus-circle"></i>&nbsp;Agregar';
    tr = tr + '                                  </a><a class="dropdown-item quitarCampos" href="#" onclick="fn_restarTotal(5, 6);">';
    tr = tr + '                                         <i class="fas fa-minus-circle"></i>&nbsp;Eliminar';
    tr = tr + '                                  </a>';
    tr = tr + '                          </div>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';

    tr = tr + '         <td class="text-hide" data-encabezado="ID_INDICADOR" style="display:none;">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-6-' + fila + '" disabled>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';

    tr = tr + '</tr>';
    $("#cuerpoTablaIndicador").append(tr);
    if (bandera == 1) {
        fn_CargarListaTipoVehiculo(data, (fila - 1), enfoque);
    }
    //return tr;
}

//==============================================================================================================

function cargarCuerpoHibridoConsumo(data, fila, enfoque, bandera) {
    var tr = '<tr id="detalles-tr-' + fila + '" data-value="' + fila + '0" >';
    tr = tr + '         <th class="text-center" data-encabezado="Número" scope="row" id="row-' + fila + '">' + fila + '</th>';
    tr = tr + '         <td data-encabezado="Columna 01">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm text-right" id="cbo-det-1-' + fila + '" onchange="fn_calcular(' + fila + ')">';
    tr = tr + '                          <option value="2018">2018</option>';
    tr = tr + cargarAnio();
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="date" placeholder="" id="dat-det-1-' + fila + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 02">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm text-right" id="cbo-det-2-' + fila + '" onchange="fn_calcular(' + fila + ')">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 03">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm text-right" id="cbo-det-3-' + fila + '" onchange="fn_calcular(' + fila + ')">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-1-' + fila + '" onBlur="fn_calcular(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 05">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-2-' + fila + '" onBlur="fn_calcular(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-3-' + fila + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 06">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-4-' + fila + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 08">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm text-right" type="text" placeholder="" id="txt-det-5-' + fila + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Subtotal">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-6-' + fila + '" disabled>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td class="text-center text-xs-right" data-encabezado="Acciones">';
    tr = tr + '                <div class="btn-group">';
    tr = tr + '                     <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
    tr = tr + '                          <div class="dropdown-menu dropdown-menu-right">';
    tr = tr + '                                  <a class="dropdown-item agregarFila" href="#">';
    tr = tr + '                                         <i class="fas fa-plus-circle"></i>&nbsp;Agregar';
    tr = tr + '                                  </a><a class="dropdown-item quitarCampos" href="#" onclick="fn_restarTotal(6, 7);">';
    tr = tr + '                                         <i class="fas fa-minus-circle"></i>&nbsp;Eliminar';
    tr = tr + '                                  </a>';
    tr = tr + '                          </div>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';

    tr = tr + '         <td class="text-hide" data-encabezado="ID_INDICADOR" style="display:none;">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-7-' + fila + '" disabled>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';

    tr = tr + '</tr>';
    $("#cuerpoTablaIndicador").append(tr);
    if (bandera == 1) {
        fn_CargarListaTipoVehiculo(data, (fila - 1), enfoque);
    }
    //return tr;

}
//==============================================================================================================

//      FIN CUERPO TABLA

//==============================================================================================================


function cargarCuerpoTabla(id) {
    var n = $(".tabla-detalle-indicadores").find("tbody").find("th").length + 1;
    if (id == 1) {
        cargarCuerpoElectrico("", n, 0, 0);
    } else if (id == 2) {
        cargarCuerpoHibrido("", n, 0, 0)
    } else if (id == 3) {
        cargarCuerpoElectricoConsumo("", n, 0, 0);
    } else if (id == 4) {
        cargarCuerpoHibridoConsumo("", n, 0, 0);
    }
    //$("#cuerpoTablaIndicador").append(t);
    MRV.CargarSelect(baseUrl + "Gestion/ListarTipoVehiculo", "#cbo-det-2-" + n + "", "ID_TIPO_VEHICULO", "DESCRIPCION");
    MRV.CargarSelect(baseUrl + "Gestion/ListarTipoCombustible", "#cbo-det-3-" + n + "", "ID_TIPO_COMBUSTIBLE", "DESCRIPCION");
}

//==============================================================================================================

//      CABECERA TABLA

//==============================================================================================================

function cargarCabeceraElectrico() {
    var msj = '';
    msj += '<tr class="bg-primary text-white">';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>N°&nbsp;</span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Año&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Año"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Inicio de Operaciones&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador fecha inicio de operación"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Tipo Vehiculo&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Tipo Vehículo"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: orange;" scope="col"><span>Tipo Combustible&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Tipo Combustible"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>KRV&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador KRV"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Cantidad&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Cantidad"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Factor de Rendimiento&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Rendimiento"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Placa&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Placa del vehículo"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: orange;" scope="col"><span>Línea Base Emisiones GEI (tCO<sub>2</sub>eq)</span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Iniciativa Mitigación Emisiones GEI (tCO<sub>2</sub>eq)</span></th>';
    msj += '    <th class="text-center" style="background-color: #2271b3;" scope="col"><span>Emisiones GEI Reducidas (tCO<sub>2</sub>eq)</span></th>';
    msj += '    <th class="text-center" scope="col">Más</th>';
    msj += '    <th class="text-hide" scope="col" style="display:none;">Id. Iniciativa</th>';
    msj += '</tr>';
    $("#cabeceraTablaIndicador").append(msj);
}

//==============================================================================================================

function cargarCabeceraHibrido() {
    var msj = '';
    msj += '<tr class="bg-primary text-white">';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>N°&nbsp;</span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Año&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Año"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Inicio de Operaciones&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador fecha inicio de operación"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Tipo Vehiculo&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Tipo Vehículo"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: orange;" scope="col"><span>Tipo Combustible&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Tipo Combustible"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>KRV Eléctrico&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador KRV Eléctrico"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: orange;" scope="col"><span>KRV Combustible&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador KRV Combustible"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Cantidad&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Cantidad"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Factor de Rendimiento&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Rendimiento"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Placa&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Placa del vehículo"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: orange;" scope="col"><span>Línea Base Emisiones GEI (tCO<sub>2</sub>eq)</span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Iniciativa Mitigación Emisiones GEI (tCO<sub>2</sub>eq)</span></th>';
    msj += '    <th class="text-center" style="background-color: #2271b3;" scope="col"><span>Emisiones GEI Reducidas (tCO<sub>2</sub>eq)</span></th>';
    msj += '    <th class="text-center" scope="col">Más</th>';
    msj += '    <th class="text-hide" scope="col" style="display:none;">Id. Iniciativa</th>';
    msj += '</tr>';
    $("#cabeceraTablaIndicador").append(msj);
}

//==============================================================================================================

function cargarCabecerElectricoConsumo() {
    var msj = '';
    msj += '<tr class="bg-primary text-white">';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>N°&nbsp;</span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Año&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Año"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Inicio de Operaciones&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador fecha inicio de operación"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Tipo Vehiculo&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Tipo Vehículo"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: orange;" scope="col"><span>Tipo Combustible&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Tipo Combustible"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Consumo de Electricidad&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Consumo de Electricidad"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Placa&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Placa del vehículo"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: orange;" scope="col"><span>Línea Base Emisiones GEI (tCO<sub>2</sub>eq)</span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Iniciativa Mitigación Emisiones GEI (tCO<sub>2</sub>eq)</span></th>';
    msj += '    <th class="text-center" style="background-color: #2271b3;" scope="col"><span>Emisiones GEI Reducidas (tCO<sub>2</sub>eq)</span></th>';
    msj += '    <th class="text-center" scope="col">Más</th>';
    msj += '    <th class="text-hide" scope="col" style="display:none;">Id. Iniciativa</th>';
    msj += '</tr>';
    $("#cabeceraTablaIndicador").append(msj);
}

//==============================================================================================================

function cargarCabeceraHibridoConsumo() {
    var msj = '';
    msj += '<tr class="bg-primary text-white">';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>N°&nbsp;</span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Año&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Año"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Inicio de Operaciones&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador fecha inicio de operación"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Tipo Vehiculo&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Tipo Vehículo"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: orange;" scope="col"><span>Tipo Combustible&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Tipo Combustible"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Consumo de Electricidad&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Consumo de Electricidad"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: orange;" scope="col"><span>Consumo de Combustible&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador Consumo de Combustible"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Placa&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Placa del vehículo"></i></span></th>';
    msj += '    <th class="text-center" style="background-color: orange;" scope="col"><span>Línea Base Emisiones GEI (tCO<sub>2</sub>eq)</span></th>';
    msj += '    <th class="text-center" style="background-color: green;" scope="col"><span>Iniciativa Mitigación Emisiones GEI (tCO<sub>2</sub>eq)</span></th>';
    msj += '    <th class="text-center" style="background-color: #2271b3;" scope="col"><span>Emisiones GEI Reducidas (tCO<sub>2</sub>eq)</span></th>';
    msj += '    <th class="text-center" scope="col">Más</th>';
    msj += '    <th class="text-hide" scope="col" style="display:none;">Id. Iniciativa</th>';
    msj += '</tr>';
    $("#cabeceraTablaIndicador").append(msj);
}

//==============================================================================================================

//     FIN CABECERA TABLA

//==============================================================================================================


//==============================================================================================================

//     VALIDAR CAMPO

//==============================================================================================================

//ELECTRICO

function validarCampoE(fila) {
    if ($("#cbo-det-2-" + fila).val() == 0) {
        return false;
    } else if ($("#cbo-det-3-" + fila).val() == 0) {
        return false;
    } else if ($("#txt-det-1-" + fila).val() == "") {
        return false;
    } else if ($("#txt-det-2-" + fila).val() == "") {
        return false;
    } else {
        return true;
    }
}

//HIBRIDO
function validarCampoH(fila) {
    if ($("#cbo-det-2-" + fila).val() == 0) {
        return false;
    } else if ($("#cbo-det-3-" + fila).val() == 0) {
        return false;
    } else if ($("#txt-det-1-" + fila).val() == "") {
        return false;
    } else if ($("#txt-det-2-" + fila).val() == "") {
        return false;
    } else if ($("#txt-det-3-" + fila).val() == "") {
        return false;
    } else {
        return true;
    }
}

function validarCampoEC(fila) {
    if ($("#cbo-det-2-" + fila).val() == 0) {
        return false;
    } else if ($("#cbo-det-3-" + fila).val() == 0) {
        return false;
    } else if ($("#txt-det-1-" + fila).val() == "") {
        return false;
    } else {
        return true;
    }
}

function validarCampoHC(fila) {
    if ($("#cbo-det-2-" + fila).val() == 0) {
        return false;
    } else if ($("#cbo-det-3-" + fila).val() == 0) {
        return false;
    } else if ($("#txt-det-1-" + fila).val() == "") {
        return false;
    } else if ($("#txt-det-2-" + fila).val() == "") {
        return false;
    } else {
        return true;
    }
}

//==============================================================================================================

//    FIN VALIDAR CAMPO

//==============================================================================================================

//==============================================================================================================

//     CALCULAR INDICADOR

//==============================================================================================================

function fn_calcular(fila) {


    var enfoque = $("#cbo-enfoque").val();
    if (enfoque == 1) {
        if (validarCampoE(fila)) {
            var item = {
                ANNOB: $("#cbo-det-1-" + fila).val(),
                ID_TIPO_VEHICULOB: $("#cbo-det-2-" + fila).val(),
                ID_TIPO_COMBUSTIBLEB: $("#cbo-det-3-" + fila).val(),
                KRVB: $("#txt-det-1-" + fila).val(),
                CANTIDADB: $("#txt-det-2-" + fila).val(),
                FACTOR_RENDIMIENTO: $("#txt-det-3-" + fila).val(),
                ID_TIPO_FUENTEI: 1,
                ID_ENFOQUE: enfoque
            }
            fn_enviarDatos(item, fila, enfoque)
        }
    } else if (enfoque == 2) {
        if (validarCampoH(fila)) {
            var item = {
                ANNOB: $("#cbo-det-1-" + fila).val(),
                ID_TIPO_VEHICULOB: $("#cbo-det-2-" + fila).val(),
                ID_TIPO_COMBUSTIBLEB: $("#cbo-det-3-" + fila).val(),
                KRVB: $("#txt-det-1-" + fila).val(),
                KRV_COMBUSTIBLE: $("#txt-det-2-" + fila).val(),
                CANTIDADB: $("#txt-det-3-" + fila).val(),
                FACTOR_RENDIMIENTO: $("#txt-det-4-" + fila).val(),
                ID_TIPO_FUENTEI: 2,
                ID_ENFOQUE: enfoque
            }
            fn_enviarDatos(item, fila, enfoque)
        }
    } else if (enfoque == 3) {
        if (validarCampoEC(fila)) {
            var item = {
                ANNOB: $("#cbo-det-1-" + fila).val(),
                ID_TIPO_VEHICULOB: $("#cbo-det-2-" + fila).val(),
                ID_TIPO_COMBUSTIBLEB: $("#cbo-det-3-" + fila).val(),
                CONSUMO_ELECTRICIDAD: $("#txt-det-1-" + fila).val(),
                ID_ENFOQUE: enfoque
                //ID_TIPO_FUENTEI: $("#cbo-enfoque").val(),
            }
            fn_enviarDatos(item, fila, enfoque)
        }
    } else if (enfoque == 4) {
        if (validarCampoHC(fila)) {
            var item = {
                ANNOB: $("#cbo-det-1-" + fila).val(),
                ID_TIPO_VEHICULOB: $("#cbo-det-2-" + fila).val(),
                ID_TIPO_COMBUSTIBLEB: $("#cbo-det-3-" + fila).val(),
                CONSUMO_ELECTRICIDAD: $("#txt-det-1-" + fila).val(),
                CONSUMO_COMBUSTIBLE: $("#txt-det-2-" + fila).val(),
                ID_ENFOQUE: enfoque
                //ID_TIPO_FUENTEI: $("#cbo-enfoque").val(),
            }
            fn_enviarDatos(item, fila, enfoque)
        }
    }
}

function fn_enviarDatos(item, fila, enfoque) {
    $.ajax({
        url: baseUrl + 'Gestion/CalcularIndicador',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var subtotal = 0.0;
                    for (var i = 0; i < data.length; i++) {
                        asignar_Datos(data, i, fila, enfoque);
                    }
                }
            }
            var row = $(".tabla-detalle-indicadores").find("tbody").find("th").length;
            $("#cuerpoTablaIndicador").data("row", row);
            fn_total(row);
        }
    });
}

function asignar_Datos(data, i, fila, enfoque) {
    if (enfoque == 1) {
        $("#txt-det-3-" + fila).val(data[i]["FACTOR_RENDIMIENTO"]);
        $("#txt-det-5-" + fila).val(data[i]["TOTAL_GEI_BASE"]);
        $("#txt-det-6-" + fila).val(data[i]["TOTAL_GEI_INIMIT"]);
        $("#txt-det-7-" + fila).val(data[i]["TOTAL_GEI_REDUCIDO"]);
    } else if (enfoque == 2) {
        $("#txt-det-4-" + fila).val(data[i]["FACTOR_RENDIMIENTO"]);
        $("#txt-det-6-" + fila).val(data[i]["TOTAL_GEI_BASE"]);
        $("#txt-det-7-" + fila).val(data[i]["TOTAL_GEI_INIMIT"]);
        $("#txt-det-8-" + fila).val(data[i]["TOTAL_GEI_REDUCIDO"]);
    } else if (enfoque == 3) {
        //$("#txt-det-5-" + fila).val(data[i]["FACTOR_RENDIMIENTO"]);
        $("#txt-det-3-" + fila).val(data[i]["TOTAL_GEI_BASE"]);
        $("#txt-det-4-" + fila).val(data[i]["TOTAL_GEI_INIMIT"]);
        $("#txt-det-5-" + fila).val(data[i]["TOTAL_GEI_REDUCIDO"]);
    } else if (enfoque == 4) {
        //$("#txt-det-5-" + fila).val(data[i]["FACTOR_RENDIMIENTO"]);
        $("#txt-det-4-" + fila).val(data[i]["TOTAL_GEI_BASE"]);
        $("#txt-det-5-" + fila).val(data[i]["TOTAL_GEI_INIMIT"]);
        $("#txt-det-6-" + fila).val(data[i]["TOTAL_GEI_REDUCIDO"]);
    }
}

//==============================================================================================================

//     FIN CALCULAR INDICADOR

//==============================================================================================================

//==============================================================================================================

//     ARCHIVOS GUARDADOS

//==============================================================================================================

function CargarArchivosGuardados() {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    }
    $.ajax({
        url: baseUrl + 'Gestion/ListarArchivosGuardados',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {

                if (data.length > 0) {
                    $("#total-documentos").data("cantidad", data.length);
                    $("#archivos-documentos").html("");
                    $("#archivos-guardados").html("");
                    for (var i = 0; i < data.length; i++) {
                        debugger;
                        var extension = "fa-file-word";

                        if (data[i]["ADJUNTO"].includes("pdf")) {
                            extension = "fa-file-pdf";
                        } else {
                            if (data[i]["ADJUNTO"].includes("jpeg") || data[i]["ADJUNTO"].includes("png") || data[i]["ADJUNTO"].includes("jpg")) {
                                extension = "fa-file-image";
                            } else {
                                if (data[i]["ADJUNTO"].includes("xlsx") || data[i]["ADJUNTO"].includes("xls")) {
                                    extension = "fa-file-excel";
                                } else {
                                    if (data[i]["ADJUNTO"].includes("pptx") || data[i]["ADJUNTO"].includes("ppt")) {
                                        extension = "fa-file-powerpoint";
                                    } else {
                                        if (data[i]["ADJUNTO"].includes("docx") || data[i]["ADJUNTO"].includes("doc")) {
                                            extension = "fa-file-word";
                                        } else {
                                            extension = "fa-file";
                                        }
                                    }
                                }
                            }
                        }

                        var tr = "";
                        tr += '     <div class="input-group mb-3" id="eliminar-' + data[i]["ID_INICIATIVA_SUSTENTATORIO"] + '">';
                        tr += '             <div class="input-group-prepend"><span class="input-group-text"><i class="fas ' + extension + '"></i></span></div><span class="form-control-plaintext ww">' + data[i]["ADJUNTO_BASE"] + '</span>';
                        tr += '             <div class="input-group-append"><span class="input-group-text cursor-pointer"><i class="far fa-trash-alt" onclick="fn_eliminarArchivo(' + data[i]["ID_INICIATIVA_SUSTENTATORIO"] + ')"></i></span></div>';
                        tr += '    </div>';
                        $("#archivos-guardados").append(tr);
                    }
                    //$("#total-documentos").data("cantidad", data.length);
                }
            }
        }
    });
}

//==============================================================================================================

//     FIN ARCHIVOS GUARDADOS

//==============================================================================================================

//==============================================================================================================

//     PROCESO GRABAR DETALLE

//==============================================================================================================

function fn_procesoDetalleIndicador(url, estado) {

    var num_validar = 0;
    if (estado == 1 || estado == 0) { num_validar = 8 }
    else if (estado == 5 || estado == 6) { num_validar = 11 }

    var mns = ValidarRevision('1', $("#Control").data("iniciativa"), num_validar, "mensajeDangerRegistro", "El detalle de esta iniciativa ya fue enviada para su revisión");

    if (mns != "") {
        if (estado == 1 || estado == 5) {
            $("#solicitar-revision #modalRegistrarBoton").hide();
            $("#pieCorrecto").show();
            $('#mensajeModalRegistrar').append(mns);
            $("#Control").data("modal", 1);
        } else if (estado == 6 || estado == 0) {
            $("#guardar-avance #modalAvanceBoton").hide();
            $("#pieCorrectoAvance").show();
            $('#mensajeModalAvance').append(mns);
            $("#Control").data("modal", 1);
        }
        return false;
    }

    indicadores = [];
    documentos = [];
    var medida = $("#Control").data("mitigacion");
    var enfoque = $("#cbo-enfoque").val();
    var parametros = "";
    var n = $("#tablaIndicador").find("tbody").find("th").length + 1;
    var nom = ""
    //var nom2 = $("#fle-nom-1").val();
    for (var fila = 1 ; fila < n; fila++) {
        debugger;
        var enfoque = $("#cbo-enfoque").val();
        var ind = $("#cuerpoTablaIndicador #detalles-tr-" + fila).data("ind");
        var filas = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + fila).find("[data-param]");
        var Xfilas = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + fila).find("input[name=fledoc]");
        var nomarchivo = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + fila).find("[data-nomarchivo]");//add 18-04-2020
        if (fn_validarCampoReg(fila)) {
            filas.each(function (index, value) {
                parametros += enfoque + ",";
                parametros += medida + ",";
                parametros += $(value).attr("data-param") + ",";

                //===============
                debugger;
                var m = $(value).attr("id");
                m = m.substring(0, 3);
                if (m == "txt") {
                    var eva = $("#" + $(value).attr("id")).val().replace(/,/gi, '');
                    parametros += eva + "|";
                } else {
                    parametros += $("#" + $(value).attr("id")).val() + "|";
                }
                //==================

                //parametros += $("#" + $(value).attr("id")).val() + "|";
            });
            parametros = parametros.substring(0, parametros.length - 1);

            nomarchivo.each(function (index, value) {
                debugger;
                nom = $("#" + $(value).attr("id")).val();
            });

            if (Xfilas != null && Xfilas != undefined) {
                if (Xfilas[0].files.length > 0)
                    parametros += ";" + ind + ";" + Xfilas[0].files[0].name;
                else if (nom != "")
                    parametros += ";" + ind + ";" + nom;
                else
                    parametros += ";" + ind + ";";
            }
            else
                parametros += ";" + ind + ";";
            parametros += "/";
        }


    }
    parametros = parametros.substring(0, parametros.length - 1);

    for (var i = 0, len = storedFiles.length; i < len; i++) {
        var sux = {
            ID_INICIATIVA: $("#Control").data("iniciativa"),
            ADJUNTO_BASE: storedFiles[i].name,
            FLAG_ESTADO: "1"
        }
        documentos.push(sux);
    }

    //===========================================
    var terminos = $("#chk-publicar").prop("checked");
    var inversion = $("#chk-publicar-monto-inversion").prop("checked");
    var privacidad = '0';
    var privacidad_monto = '0';
    if (terminos) {
        privacidad = '1'; //0 - PRIVADO : 1 - PUBLICO
    }
    if (inversion) {
        privacidad_monto = '1'; //0 - PRIVADO : 1 - PUBLICO
    }
    //===========================================

    var archivos = "";
    for (var i = 0, len = storedFiles.length; i < len; i++) {
        archivos += storedFiles[i].name + "|";
    }
    if (archivos == "") archivos = "|";

    debugger;
    var id_delete = "";
    if ($("#cuerpoTablaIndicador").data("delete") != "") {
        id_delete = $("#cuerpoTablaIndicador").data("delete");
        id_delete = id_delete.substring(0, id_delete.length - 1);
    }

    var id_eliminar = "";
    if ($("#total-documentos").data("eliminarfile") != "") {
        id_eliminar = $("#total-documentos").data("eliminarfile");
        id_eliminar = id_eliminar.substring(0, id_eliminar.length - 1);
    }

    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario"),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
        ID_INDICADOR_DELETE: id_delete,
        ID_INDICADOR_ELIMINAR: id_eliminar,
        ID_ESTADO: estado,
        ID_ENFOQUE: enfoque,
        ID_MEDMIT: medida,
        TOTAL_GEI: parseFloat($("#total-detalle").html()),
        DATA: parametros,
        ID_TIPO_INGRESO: 1,
        PRIVACIDAD_INICIATIVA: privacidad,
        PRIVACIDAD_INVERSION: privacidad_monto,
        //ListaIndicadores: indicadores,
        //ListaIndicadoresData: indicadores,
        ListaSustentos: documentos,
        extra: archivos
    };

    var options = {
        type: "POST",
        dataType: "json",
        contentType: false,
        url: url,
        processData: false,
        data: item,
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
                //CargarDetalleDatos();    
                CargarDatosGuardados();
                CargarArchivosGuardados();
                $("#cuerpoTablaIndicador").data("delete", "");
                $("#total-documentos").data("eliminarfile", "");
                $("#fledocumentos").val("");
                if (estado == 0 || estado == 6) {
                    $("#mensajeModalAvance #mensajeDangerAvance").remove();
                    //var msj = '                   <div class="col-sm-12 col-md-12 col-lg-12" id="mensajeWarningAvance">';
                    //msj = msj + '                       <div class="alert alert-warning d-flex align-items-stretch" role="alert">';
                    //msj = msj + '                            <div class="alert-wrap mr-3">';
                    //msj = msj + '                                <div class="sa">';
                    //msj = msj + '                                    <div class="sa-warning">';
                    //msj = msj + '                                        <div class="sa-warning-body"></div>';
                    //msj = msj + '                                        <div class="sa-warning-dot"></div>';
                    //msj = msj + '                                    </div>';
                    //msj = msj + '                                </div>';
                    //msj = msj + '                            </div>';
                    //msj = msj + '                            <div class="alert-wrap">';
                    //msj = msj + '                                <h6>Sus avances fueron guardados</h6>';
                    //msj = msj + '                                <hr>Recuerde, podrá solicitar una revisión una vez complete todos los campos obligatorios.';
                    //msj = msj + '                            </div>';
                    //msj = msj + '                        </div>';
                    //msj = msj + '                    </div>';
                    var msj = mensajeCorrecto("mensajeWarningAvance", "Bien", "Usted a guardado correctamente su avance.");

                    $("#guardar-avance #modalAvanceBoton").hide();
                    $("#pieCorrectoAvance").show();
                    $('#mensajeModalAvance').append(msj);
                } else if (estado == 1 || estado == 5) {
                    $('#mensajeModalRegistrar #mensajeGoodRegistro').remove();
                    $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
                    //var msj = '                       <div class="alert alert-success d-flex align-items-stretch" role="alert" id="mensajeGoodRegistro">';
                    //msj = msj + '                            <div class="alert-wrap mr-3">';
                    //msj = msj + '                                <div class="sa">';
                    //msj = msj + '                                    <div class="sa-success">';
                    //msj = msj + '                                        <div class="sa-success-tip"></div>';
                    //msj = msj + '                                        <div class="sa-success-long"></div>';
                    //msj = msj + '                                        <div class="sa-success-placeholder"></div>';
                    //msj = msj + '                                        <div class="sa-success-fix"></div>';
                    //msj = msj + '                                    </div>';
                    //msj = msj + '                                </div>';
                    //msj = msj + '                            </div>';
                    //msj = msj + '                            <div class="alert-wrap">';
                    //msj = msj + '                                <h6>Felicitaciones</h6>';
                    //msj = msj + '                                <hr><a class="float-right" href="#" target="_blank"><img src="./images/sello_new.svg" width="120" data-toggle="tooltip" data-placement="top" title="Ir a la web del sello"></a>';
                    //msj = msj + '                                <small class="mb-0">Usted a completado el envío de detalle de su iniciativa de mitigación que será verificada por uno de nuestros especialistas. También, le recordamos que puede ingresar a nuestra plataforma del <b>Sello de Energía Sostenible</b></small>';
                    //msj = msj + '                            </div>';
                    //msj = msj + '                        </div>';
                    $("#solicitar-revision #modalRegistrarBoton").hide();
                    $("#pieCorrecto").show();
                    $("#mensajeSuccess").removeAttr("hidden");
                    //$('#mensajeModalRegistrar').append(msj);
                    $("#Control").data("modal", 1);
                    if (response.extra == "1") {
                        //if (ws != null) ws.send(response.extra);
                    }
                }
            } else {
                if (estado == 0) {
                    $("#mensajeModalAvance #mensajeDangerAvance").remove();
                    var msj = '                   <div class="col-sm-12 col-md-12 col-lg-12" id="mensajeDangerAvance">';
                    msj = msj + '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert">';
                    msj = msj + '                            <div class="alert-wrap mr-3">';
                    msj = msj + '                                <div class="sa">';
                    msj = msj + '                                    <div class="sa-error">';
                    msj = msj + '                                       <div class="sa-error-x">';
                    msj = msj + '                                           <div class="sa-error-left"></div>';
                    msj = msj + '                                           <div class="sa-error-right"></div>';
                    msj = msj + '                                       </div>';
                    msj = msj + '                                       <div class="sa-error-placeholder"></div>';
                    msj = msj + '                                       <div class="sa-error-fix"></div>';
                    msj = msj + '                                   </div>';
                    msj = msj + '                               </div>';
                    msj = msj + '                           </div>';
                    msj = msj + '                            <div class="alert-wrap">';
                    msj = msj + '                                <h6>Error al guardar</h6>';
                    msj = msj + '                                <hr><small class="mb-0">Verifique que los datos e intente otra vez.</small>';
                    msj = msj + '                            </div>';
                    msj = msj + '                        </div>';
                    msj = msj + '                    </div>';
                    $('#mensajeModalAvance').append(msj);
                } else {
                    $('#mensajeModalRegistrar #mensajeGoodRegistro').remove();
                    $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
                    var msj = '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="mensajeDangerRegistro">';
                    msj = msj + '                            <div class="alert-wrap mr-3">';
                    msj = msj + '                                <div class="sa">';
                    msj = msj + '                                    <div class="sa-error">';
                    msj = msj + '                                       <div class="sa-error-x">';
                    msj = msj + '                                           <div class="sa-error-left"></div>';
                    msj = msj + '                                           <div class="sa-error-right"></div>';
                    msj = msj + '                                       </div>';
                    msj = msj + '                                       <div class="sa-error-placeholder"></div>';
                    msj = msj + '                                       <div class="sa-error-fix"></div>';
                    msj = msj + '                                   </div>';
                    msj = msj + '                               </div>';
                    msj = msj + '                           </div>';
                    msj = msj + '                           <div class="alert-wrap">';
                    msj = msj + '                                <h6>Error de registro</h6>';
                    msj = msj + '                                <hr><small class="mb-0">Verifique que los datos sean correctamente ingresados, complete todos los campos obligatorios e intente otra vez.</small>';
                    msj = msj + '                           </div>';
                    msj = msj + '                     </div>';
                    $('#mensajeModalRegistrar').append(msj);
                }
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

}

$("#solicitar-revision").on("hidden.bs.modal", function () {
    $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
    if ($("#Control").data("modal") == 1) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    } else {
        $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
        $("#solicitar-revision #modalRegistrarBoton").show();
        $("#pieCorrecto").hide();
    }
});

$("#guardar-avance").on("hidden.bs.modal", function () {
    if ($("#Control").data("modal") == 1) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    }
    $("#mensajeModalAvance #mensajeDangerAvance").remove();
    $("#mensajeModalAvance #mensajeWarningAvance").remove();
    $("#guardar-avance #modalAvanceBoton").show();
    $("#pieCorrectoAvance").hide();
});

function fn_guardarDetalleIndicador() {
    debugger;
    //var url = baseUrl + "Gestion/RegistrarDetalleIndicador2";
    var url = baseUrl + "Gestion/RegistrarDetalleIndicador";
    fn_validarArchivo(url, 1);
    //fn_procesoDetalleIndicador(url, 1);
}

function fn_guardarAvances() {
    //var url = baseUrl + "Gestion/RegistrarDetalleIndicador2";
    var url = baseUrl + "Gestion/RegistrarDetalleIndicador";
    fn_procesoDetalleIndicador(url, 0);
}

function fn_corregirDetalleIndicador() {
    debugger;
    //var url = baseUrl + "Gestion/RegistrarDetalleIndicador2";
    var url = baseUrl + "Gestion/RegistrarDetalleIndicador";
    fn_validarArchivo(url, 5);
    //fn_procesoDetalleIndicador(url, 5);
}

function fn_corregirAvances() {
    //var url = baseUrl + "Gestion/RegistrarDetalleIndicador2";
    var url = baseUrl + "Gestion/RegistrarDetalleIndicador";
    fn_procesoDetalleIndicador(url, 6);
}

//==============================================================================================================

//     FIN PROCESO GRABAR DETALLE

//==============================================================================================================


//==============================================================================================================

//      CARGAR TABLA CUERPO DATOS

//==============================================================================================================

function llenarTabla(data, j, enfoque) {
    if (enfoque == 1) {
        $("#cbo-det-1-" + (j + 1)).val(data[j]["ANNO_BASE"]);
        $("#cbo-det-2-" + (j + 1)).val(data[j]["ID_TIPO_VEHICULO_BASE"]);
        $("#cbo-det-3-" + (j + 1)).val(data[j]["ID_TIPO_COMBUSTIBLE_BASE"]);
        $("#dat-det-1-" + (j + 1)).val(data[j]["FECHA"]);
        $("#txt-det-1-" + (j + 1)).val(data[j]["KRV_BASE"]);
        $("#txt-det-2-" + (j + 1)).val(data[j]["CANT_BASE"]);
        $("#txt-det-3-" + (j + 1)).val(data[j]["F_RENDIMIENTO"]);
        $("#txt-det-4-" + (j + 1)).val(data[j]["PLACA"]);
        $("#txt-det-5-" + (j + 1)).val(data[j]["TOTAL_GEI_BASE"]);
        $("#txt-det-6-" + (j + 1)).val(data[j]["TOTAL_GEI_INIMIT"]);
        $("#txt-det-7-" + (j + 1)).val(data[j]["TOTAL_GEI_REDUCIDO"]);
        $("#txt-det-8-" + (j + 1)).val(data[j]["ID_INDICADOR"]);
        //$("#detalles-tr-" + (j + 1)).data("value", data[j]["ID_INDICADOR"]);
    } else if (enfoque == 2) {
        $("#cbo-det-1-" + (j + 1)).val(data[j]["ANNO_BASE"]);
        $("#cbo-det-2-" + (j + 1)).val(data[j]["ID_TIPO_VEHICULO_BASE"]);
        $("#cbo-det-3-" + (j + 1)).val(data[j]["ID_TIPO_COMBUSTIBLE_BASE"]);
        $("#dat-det-1-" + (j + 1)).val(data[j]["FECHA"]);
        $("#txt-det-1-" + (j + 1)).val(data[j]["KRV_BASE"]);
        $("#txt-det-2-" + (j + 1)).val(data[j]["KRV_COMBUSTIBLE"]);
        $("#txt-det-3-" + (j + 1)).val(data[j]["CANT_BASE"]);
        $("#txt-det-4-" + (j + 1)).val(data[j]["F_RENDIMIENTO"]);
        $("#txt-det-5-" + (j + 1)).val(data[j]["PLACA"]);
        $("#txt-det-6-" + (j + 1)).val(data[j]["TOTAL_GEI_BASE"]);
        $("#txt-det-7-" + (j + 1)).val(data[j]["TOTAL_GEI_INIMIT"]);
        $("#txt-det-8-" + (j + 1)).val(data[j]["TOTAL_GEI_REDUCIDO"]);
        $("#txt-det-9-" + (j + 1)).val(data[j]["ID_INDICADOR"]);
    } else if (enfoque == 3) {
        $("#cbo-det-1-" + (j + 1)).val(data[j]["ANNO_BASE"]);
        $("#cbo-det-2-" + (j + 1)).val(data[j]["ID_TIPO_VEHICULO_BASE"]);
        $("#cbo-det-3-" + (j + 1)).val(data[j]["ID_TIPO_COMBUSTIBLE_BASE"]);
        $("#dat-det-1-" + (j + 1)).val(data[j]["FECHA"]);
        $("#txt-det-1-" + (j + 1)).val(data[j]["CONSUMO_ELECTRICIDAD"]);
        $("#txt-det-2-" + (j + 1)).val(data[j]["PLACA"]);
        $("#txt-det-3-" + (j + 1)).val(data[j]["TOTAL_GEI_BASE"]);
        $("#txt-det-4-" + (j + 1)).val(data[j]["TOTAL_GEI_INIMIT"]);
        $("#txt-det-5-" + (j + 1)).val(data[j]["TOTAL_GEI_REDUCIDO"]);
        $("#txt-det-6-" + (j + 1)).val(data[j]["ID_INDICADOR"]);
    } else if (enfoque == 4) {
        $("#cbo-det-1-" + (j + 1)).val(data[j]["ANNO_BASE"]);
        $("#cbo-det-2-" + (j + 1)).val(data[j]["ID_TIPO_VEHICULO_BASE"]);
        $("#cbo-det-3-" + (j + 1)).val(data[j]["ID_TIPO_COMBUSTIBLE_BASE"]);
        $("#dat-det-1-" + (j + 1)).val(data[j]["FECHA"]);
        $("#txt-det-1-" + (j + 1)).val(data[j]["CONSUMO_ELECTRICIDAD"]);
        $("#txt-det-2-" + (j + 1)).val(data[j]["CONSUMO_COMBUSTIBLE"]);
        $("#txt-det-3-" + (j + 1)).val(data[j]["PLACA"]);
        $("#txt-det-4-" + (j + 1)).val(data[j]["TOTAL_GEI_BASE"]);
        $("#txt-det-5-" + (j + 1)).val(data[j]["TOTAL_GEI_INIMIT"]);
        $("#txt-det-6-" + (j + 1)).val(data[j]["TOTAL_GEI_REDUCIDO"]);
        $("#txt-det-7-" + (j + 1)).val(data[j]["ID_INDICADOR"]);
    }

    //$("#cuerpoTablaIndicador").data("total", $("#cuerpoTablaIndicador").data("total") + data[j]["TOTAL_GEI_REDUCIDO"]);
    //$("#total-detalle #total").remove();
    //$("#total-detalle").append('<strong id="total">' + (Math.round($("#cuerpoTablaIndicador").data("total") * 100) / 100) + ' tCO<sub>2</sub>eq</strong>');
    //$("#total-detalle2 #total2").remove();
    //$("#total-detalle2").append('<strong id="total2">' + (Math.round($("#cuerpoTablaIndicador").data("total") * 100) / 100) + ' tCO<sub>2</sub>eq</strong>');
}

//==============================================================================================================

//      FIN CARGAR TABLA CUERPO DATOS

//==============================================================================================================

//==============================================================================================================

//      CARGAR DATOS CUERPO

//==============================================================================================================

function CargarDetalleDatos() {
    $("#cuerpoTablaIndicador").html("");
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_ENFOQUE: $("#cbo-enfoque").val()
    }
    $.ajax({
        url: baseUrl + 'Gestion/ListarDetalleIndicador',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var total = 0.0;
                    for (var i = 0; i < data.length; i++) {

                        var enfoque = $("#cbo-enfoque").val();
                        if (enfoque == 1) {
                            cargarCuerpoElectrico(data, (i + 1), enfoque, 1);
                        } else if (enfoque == 2) {
                            cargarCuerpoHibrido(data, (i + 1), enfoque, 1)
                        } else if (enfoque == 3) {
                            cargarCuerpoElectricoConsumo(data, (i + 1), enfoque, 1);
                        } else if (enfoque == 4) {
                            cargarCuerpoHibridoConsumo(data, (i + 1), enfoque, 1);
                        }
                        total += data[i]["TOTAL_GEI_REDUCIDO"]
                    }
                    $("#total-detalle").html("");
                    $("#total-detalle").append((Math.round(total * 100) / 100));
                    $("#cuerpoTablaIndicador").data("total", total);
                    $("#cuerpoTablaIndicador").data("row", data.length);
                }
            } else {
                cargarCuerpoTabla($("#cbo-enfoque").val());
                //$("#total-detalle").append('<strong id="total">0.00 tCO<sub>2</sub>eq</strong>');
                //$("#total-detalle2").append('<strong id="total2">0.00 tCO<sub>2</sub>eq</strong>');
            }
        }
    });
}

var asignarAfecto = function (ids) {
    if (ids.length > 0) {
        var a = ids[0].split('+');
        //console.log(a);
        $("#" + a[0]).attr({ "data-afectar": a[1] });
    }
}

function CargarCuerpoGuardado(filas, xIndicador) {
    var medida = $("#Control").data("mitigacion");
    var enfoque = $("#cbo-enfoque").val();
    var iniciativa = $("#Control").data("iniciativa");
    var item = {
        ID_INICIATIVA: iniciativa,
        ID_MEDMIT: medida,
        ID_ENFOQUE: enfoque
    }
    var arregloIDs = [];
    $.ajax({
        async: false,
        url: baseUrl + 'Gestion/ListarCuerpoIndicador',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#cuerpoTablaIndicador").html("");
                    for (var i = 0; i < filas; i++) {
                        var lista = 0;
                        var texto = 0;
                        var fecha = 0;
                        var indicador = 0;
                        var id_anno = "";
                        var tr = "";
                        tr += '<tr id="detalles-tr-' + (i + 1) + '" data-ind="0">';
                        tr += '     <th class="text-center" data-encabezado="Número" scope="row">' + (i + 1) + '</th>';
                        for (var j = 0; j < data.length; j++) {
                            indicador = data[j]["ID_INDICADOR"];
                            if (data[j]["ID_TIPO_CONTROL"] == 1) {
                                tr += '<td data-encabezado="Columna 07">';
                                tr += '     <div class="form-group m-0">';
                                if (data[j]["VERIFICABLE"] == 1) {
                                    lista++;
                                    if (data[j]["ID_PARAMETRO"] == 6) {
                                        id_anno = 'cbo-det-tbl-1-' + lista + '-' + (i + 1);
                                        tr += '<select class="form-control form-control-sm require-data" id="cbo-det-tbl-1-' + lista + '-' + (i + 1) + '" onchange="fn_calcularValor(this)" data-afectar="" data-validar="0" data-param="' + data[j]["ID_PARAMETRO"] + '">';
                                        tr += '        <option value="0">Seleccionar</option>';
                                        var listaD = data[j]["listaDetalle"];
                                        for (var m = 0; m < listaD.length; m++) {
                                            tr += '<option value="' + listaD[m]["NOMBRE_DETALLE"] + '">' + listaD[m]["NOMBRE_DETALLE"] + '</option>';
                                        }
                                        tr += '</select>';
                                    } else {
                                        tr += '<select class="form-control form-control-sm require-data" id="cbo-det-tbl-1-' + lista + '-' + (i + 1) + '" onchange="fn_calcularValor(this)" data-validar="0" data-param="' + data[j]["ID_PARAMETRO"] + '">';
                                        if (data[j]["ID_PARAMETRO"] != 72 && data[j]["ID_PARAMETRO"] != 73 && data[j]["ID_PARAMETRO"] != 74 && data[j]["ID_PARAMETRO"] != 77 && data[j]["ID_PARAMETRO"] != 30 && data[j]["ID_PARAMETRO"] != 93 && data[j]["ID_PARAMETRO"] != 94 && data[j]["ID_PARAMETRO"] != 95) tr += '        <option value="0">Seleccionar</option>'; //add
                                        //tr += '        <option value="0">Seleccionar</option>';
                                        var listaD = data[j]["listaDetalle"];
                                        for (var m = 0; m < listaD.length; m++) {
                                            tr += '<option value="' + listaD[m]["ID_DETALLE"] + '">' + listaD[m]["NOMBRE_DETALLE"] + '</option>';
                                        }
                                        tr += '</select>';
                                    }
                                } else {
                                    lista++;
                                    tr += '<select class="form-control form-control-sm require-data" id="cbo-det-tbl-1-' + lista + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '">';
                                    if (data[j]["ID_PARAMETRO"] != 72 && data[j]["ID_PARAMETRO"] != 73 && data[j]["ID_PARAMETRO"] != 74 && data[j]["ID_PARAMETRO"] != 77 && data[j]["ID_PARAMETRO"] != 30 && data[j]["ID_PARAMETRO"] != 93 && data[j]["ID_PARAMETRO"] != 94 && data[j]["ID_PARAMETRO"] != 95) tr += '        <option value="0">Seleccionar</option>'; //add
                                    //tr += '        <option value="0">Seleccionar</option>';
                                    var listaD = data[j]["listaDetalle"];
                                    for (var m = 0; m < listaD.length; m++) {
                                        tr += '<option value="' + listaD[m]["ID_DETALLE"] + '">' + listaD[m]["NOMBRE_DETALLE"] + '</option>';
                                    }
                                    tr += '</select>';
                                }
                            } else if (data[j]["ID_TIPO_CONTROL"] == 2) {
                                tr += '<td data-encabezado="Columna 02">';
                                tr += '    <div class="form-group m-0">';
                                if (data[j]["EDITABLE"] == 1) {
                                    if (data[j]["ID_TIPO_DATO"] == 1) {
                                        fecha++;
                                        //debugger;
                                        if (data[j]["ID_PARAMETRO"] == 32) {
                                            console.log(id_anno + ' fch-det-tbl-1-' + fecha + '-' + (i + 1));
                                            var id_fecha = "fch-det-tbl-1-" + fecha + "-" + (i + 1);
                                            arregloIDs[i] = id_anno + '+' + id_fecha;
                                            tr += '<input class="form-control form-control-sm text-center require-data" type="date" placeholder="" id="fch-det-tbl-1-' + fecha + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" min="" max="">';
                                        } else {
                                            tr += '<input class="form-control form-control-sm text-center require-data" type="date" placeholder="" id="fch-det-tbl-1-' + fecha + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '">';
                                        }

                                    } else {
                                        texto++;
                                        if (data[j]["VERIFICABLE"] == 0) {
                                            if (data[j]["ID_TIPO_DATO"] == 2) {
                                                tr += '<input class="form-control form-control-sm text-center validar require-data formato-num" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" maxlength="15">';
                                            } else if (data[j]["ID_TIPO_DATO"] == 3) {
                                                tr += '<input class="form-control form-control-sm text-center require-data" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" maxlength="40">';
                                            }
                                        } else {
                                            if (data[j]["ID_TIPO_DATO"] == 2) {
                                                tr += '<input class="form-control form-control-sm text-center validar require-data formato-num" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (i + 1) + '" onBlur="fn_calcularValor(this)" data-validar="0" data-param="' + data[j]["ID_PARAMETRO"] + '" maxlength="15">';
                                            } else if (data[j]["ID_TIPO_DATO"] == 3) {
                                                tr += '<input class="form-control form-control-sm text-center require-data" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (i + 1) + '" onBlur="fn_calcularValor(this)" data-validar="0" data-param="' + data[j]["ID_PARAMETRO"] + '" maxlength="40">';
                                            }

                                        }
                                    }
                                } else {
                                    texto++;
                                    if (data[j]["ID_PARAMETRO"] == 11) {
                                        tr += '<input class="form-control form-control-sm text-center campo-total" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" readonly>';
                                    } else {
                                        tr += '<input class="form-control form-control-sm text-center" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" readonly>';
                                    }

                                }
                                tr += '    </div>';
                                tr += '</td>'
                            }
                        }

                        var urlDw = baseUrl + 'Gestion/FileDownload?IdIniciativa=' + $("#iniciativa_mit_ID_INICIATIVA").val() + '&IdIndicador=' + (i + 1) + "&accion=I";

                        if (xIndicador > 0) {
                            urlDw = baseUrl + 'Gestion/FileDownloadDetalle?IdIniciativa=' + $("#iniciativa_mit_ID_INICIATIVA").val() + '&IdIndicador=' + xIndicador + "&accion=M";
                        }

                        tr += '<td class="text-center" data-encabezado="Sustento" id="sustento' + (i + 1) + '">';
                        tr += '        <label class="btn btn-secondary btn-sm m-0" for="fle-doc-' + (i + 1) + '" title="Cargar archivo"><i class="fas fa-upload"></i>';
                        tr += '          <input class="d-none" type="file" id="fle-doc-' + (i + 1) + '" name="fledoc" onchange="handleFileSustento(this.files,' + (i + 1) + ',1)">';
                        tr += '           <input id="fle-nom-' + (i + 1) + '" type="text" data-nomarchivo="" hidden>';//
                        //tr += '        </label><a class="btn btn-success btn-sm m-0" name="fledownload" href="' + urlDw + '" title="Descargar archivo" id="fle-dow-' + (i + 1) + '" target="_blank" style="display: none;"><i class="fas fa-download"></i></a>';
                        tr += '        </label><a class="btn btn-success btn-sm m-0" name="fledownload" href="' + urlDw + '" title="Descargar archivo" id="fle-dow-' + (i + 1) + '" target="_blank" style="display: none;"><i class="fas fa-download"></i></a>'; //add 18-04-2020
                        tr += '</td>';

                        //tr += '<td class="text-center estrecho" data-encabezado="Verificar acumulado"><span data-toggle="modal" data-target="#modal-acumulado"><a class="btn btn-purple btn-sm m-0 quitarCampos" href="#" title="Verificar acumulado" onclick="mostrarAcumulado();"><i class="fas fa-hand-holding"></i></a></span></td>';
                        tr += '<td class="text-center estrecho" data-encabezado="Verificar acumulado"><span data-toggle="modal" data-target="#"><a class="btn btn-purple btn-sm m-0 quitarCampos" href="#" title="Verificar acumulado" onclick="mostrarAcumulado();"><i class="fas fa-eye"></i></a></span></td>';

                        tr += '<td class="text-center" data-encabezado="Acciones" width="5%"><a class="btn btn-info btn-sm m-0 quitarCampos" href="#" onclick="fn_eliminarRestarTotal()" title="Quitar fila"><i class="fas fa-minus-circle"></i></a></td>';


                        //add prueba
                        //tr += '<td class="text-center estrecho" data-encabezado="Verificar acumulado"><span data-toggle="modal" data-target="#modal-acumulado-total"><a class="btn btn-purple btn-sm m-0 quitarCampos" href="#" title="Verificar acumulado" onclick=""><i class="fas fa-eye"></i></a></span></td>';

                        tr += '</tr>';
                        $("#cuerpoTablaIndicador").append(tr);
                    }
                    //console.log(arregloIDs);
                    asignarAfecto(arregloIDs);

                }
            } else {
                //cargarCuerpoTabla($("#cbo-enfoque").val());
                //$("#total-detalle").append('<strong id="total">0.00 tCO<sub>2</sub>eq</strong>');
                //$("#total-detalle2").append('<strong id="total2">0.00 tCO<sub>2</sub>eq</strong>');
            }
        }
    });
}


function handleFileSustento(evt, idIndicador, accion) {
    console.log(evt);

    detalleFiles = []; // add 12-02-2020
    ////////////////////////77
    var files = evt; //evt.target.files; // FileList object
    debugger;
    // files is a FileList of File objects. List some properties.
    var output = [];
    var extension = "fa-file-word";
    var name = "";
    var nom_archivo = ""; //add 18-04-2020
    var file_extension = "";
    for (var i = 0, f; f = files[i]; i++) {
        name = f.name;
        nom_archivo = f.name; //add 18-04-2020
        file_extension = name.split(".").pop().toLowerCase();

        if (f.size > 4194304) {
            $(this).val("");
            MRV.Alert("Alerta", "Archivo que esta subiendo pesa más de 4 MB", "", "es")
            detalleFiles = [];
            return false;
        }

        switch (f.name.substring(f.name.lastIndexOf('.') + 1).toLowerCase()) {
            case 'pdf': case 'jpg': case 'jpeg': case 'gif': case 'png': case 'tif': case 'doc': case 'docx': case 'xls': case 'xlsx': case 'xlsm': case 'ppt': case 'pptx': case 'txt':
                break;
            default:
                $(this).val('');
                MRV.Alert('Alerta', "formato de archivo no válido", '', 'es');
                detalleFiles = [];
                return false;
                break;
        }

        var form_data = new FormData();
        form_data.append("fledoc", f)
        var xaccion = accion == "1" ? "I" : "M"
        var url = baseUrl + 'Gestion/FileUpload?IdIniciativa=' + $("#iniciativa_mit_ID_INICIATIVA").val() + '&IdIndicador=' + idIndicador + "&accion=" + xaccion;
        $.ajax({
            url: url, //'/Home/FileUpload',
            type: "POST",
            contentType: false, // Not to set any content header  
            processData: false, // Not to process data  
            data: form_data,
            success: function (result) {
                if (result != null && result != "") {
                    $.each(result, function (i, v) {
                        if (v.accion == "1") {
                            var xref = $("#fle-dow-" + idIndicador);
                            if (xref[0].href.lastIndexOf("FileDownloadDetalle") != -1) {
                                xref[0].href = baseUrl + 'Gestion/FileDownload?IdIniciativa=' + $("#iniciativa_mit_ID_INICIATIVA").val() + '&IdIndicador=' + idIndicador + "&accion=I";
                            }
                            debugger;
                            $("#fle-dow-" + idIndicador).removeAttr('style');
                            $("#fle-nom-" + idIndicador).val(nom_archivo); //add 18-04-2020
                        } else {
                            MRV.Alert('Alerta', v.message, '', 'es');
                        }
                    });
                }
            },
            xhr: function () {  // Custom XMLHttpRequest
                var myXhr = $.ajaxSettings.xhr();
                if (myXhr.upload) { // Check if upload property exists
                    myXhr.upload.addEventListener('progress', progressHandlingFunction, false); // For handling the progress of the upload
                }
                return myXhr;
            },
            error: function (err) {
                MRV.Alert('Alerta', err.message, '', 'es');
            }
        });

        detalleFiles.push(f);

    }
}

function progressHandlingFunction(e) {
    var spanProgress = document.getElementById("spanProgress");
    if (e.lengthComputable) {
        $('progress').css("display", "block");
        $('#lbProgress').css("display", "block");
        $('progress').attr({ value: e.loaded, max: e.total });
        $("#lbProgress").text(Math.floor((e.loaded / e.total) * 100) + " %");
    }
}

function CargarNuevaFila(filas) {
    var medida = $("#Control").data("mitigacion");
    var enfoque = $("#cbo-enfoque").val();
    var iniciativa = $("#Control").data("iniciativa");
    var item = {
        ID_INICIATIVA: iniciativa,
        ID_MEDMIT: medida,
        ID_ENFOQUE: enfoque
    }
    var arregloIDs = [];
    var rows = $("#cuerpoTablaIndicador tr").length;
    debugger;
    $.ajax({
        async: false,
        url: baseUrl + 'Gestion/ListarCuerpoIndicador',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    //$("#cuerpoTablaIndicador").html("");
                    for (var i = 0; i < filas; i++) {
                        var lista = 0;
                        var texto = 0;
                        var fecha = 0;
                        var indicador = 0;
                        var id_anno = "";
                        var tr = "";
                        tr += '<tr id="detalles-tr-' + (rows + 1) + '" data-ind="0">';
                        tr += '     <th class="text-center" data-encabezado="Número" scope="row">' + (rows + 1) + '</th>';
                        for (var j = 0; j < data.length; j++) {
                            indicador = data[j]["ID_INDICADOR"];
                            if (data[j]["ID_TIPO_CONTROL"] == 1) {
                                tr += '<td data-encabezado="Columna 07">';
                                tr += '     <div class="form-group m-0">';
                                if (data[j]["VERIFICABLE"] == 1) {
                                    lista++;
                                    if (data[j]["ID_PARAMETRO"] == 6) {
                                        id_anno = 'cbo-det-tbl-1-' + lista + '-' + (rows + 1);
                                        tr += '<select class="form-control form-control-sm require-data" id="cbo-det-tbl-1-' + lista + '-' + (rows + 1) + '" onchange="fn_calcularValor(this)" data-afectar="" data-validar="0" data-param="' + data[j]["ID_PARAMETRO"] + '">';
                                        tr += '        <option value="0">Seleccionar</option>';
                                        var listaD = data[j]["listaDetalle"];
                                        for (var m = 0; m < listaD.length; m++) {
                                            tr += '<option value="' + listaD[m]["NOMBRE_DETALLE"] + '">' + listaD[m]["NOMBRE_DETALLE"] + '</option>';
                                        }
                                        tr += '</select>';
                                    } else {
                                        debugger;
                                        tr += '<select class="form-control form-control-sm require-data" id="cbo-det-tbl-1-' + lista + '-' + (rows + 1) + '" onchange="fn_calcularValor(this)" data-validar="0" data-param="' + data[j]["ID_PARAMETRO"] + '">';
                                        if (data[j]["ID_PARAMETRO"] != 72 && data[j]["ID_PARAMETRO"] != 73 && data[j]["ID_PARAMETRO"] != 74 && data[j]["ID_PARAMETRO"] != 77 && data[j]["ID_PARAMETRO"] != 30 && data[j]["ID_PARAMETRO"] != 93 && data[j]["ID_PARAMETRO"] != 94 && data[j]["ID_PARAMETRO"] != 95) tr += '        <option value="0">Seleccionar</option>'; //add
                                        //tr += '        <option value="0">Seleccionar</option>';
                                        var listaD = data[j]["listaDetalle"];
                                        for (var m = 0; m < listaD.length; m++) {
                                            tr += '<option value="' + listaD[m]["ID_DETALLE"] + '">' + listaD[m]["NOMBRE_DETALLE"] + '</option>';
                                        }
                                        tr += '</select>';
                                    }
                                } else {
                                    lista++;
                                    tr += '<select class="form-control form-control-sm require-data" id="cbo-det-tbl-1-' + lista + '-' + (rows + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '">';
                                    if (data[j]["ID_PARAMETRO"] != 72 && data[j]["ID_PARAMETRO"] != 73 && data[j]["ID_PARAMETRO"] != 74 && data[j]["ID_PARAMETRO"] != 77 && data[j]["ID_PARAMETRO"] != 30 && data[j]["ID_PARAMETRO"] != 93 && data[j]["ID_PARAMETRO"] != 94 && data[j]["ID_PARAMETRO"] != 95) tr += '        <option value="0">Seleccionar</option>'; //add
                                    //tr += '        <option value="0">Seleccionar</option>';
                                    var listaD = data[j]["listaDetalle"];
                                    for (var m = 0; m < listaD.length; m++) {
                                        tr += '<option value="' + listaD[m]["ID_DETALLE"] + '">' + listaD[m]["NOMBRE_DETALLE"] + '</option>';
                                    }
                                    tr += '</select>';
                                }
                            } else if (data[j]["ID_TIPO_CONTROL"] == 2) {
                                tr += '<td data-encabezado="Columna 02">';
                                tr += '    <div class="form-group m-0">';
                                if (data[j]["EDITABLE"] == 1) {
                                    if (data[j]["ID_TIPO_DATO"] == 1) {
                                        fecha++;
                                        //debugger;
                                        if (data[j]["ID_PARAMETRO"] == 32) {
                                            console.log(id_anno + ' fch-det-tbl-1-' + fecha + '-' + (i + 1));
                                            var id_fecha = "fch-det-tbl-1-" + fecha + "-" + (i + 1);
                                            arregloIDs[i] = id_anno + '+' + id_fecha;
                                            tr += '<input class="form-control form-control-sm text-center require-data" type="date" placeholder="" id="fch-det-tbl-1-' + fecha + '-' + (rows + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" min="" max="">';
                                        } else {
                                            tr += '<input class="form-control form-control-sm text-center require-data" type="date" placeholder="" id="fch-det-tbl-1-' + fecha + '-' + (rows + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '">';
                                        }

                                    } else {
                                        texto++;
                                        if (data[j]["VERIFICABLE"] == 0) {
                                            if (data[j]["ID_TIPO_DATO"] == 2) {
                                                tr += '<input class="form-control form-control-sm text-center validar require-data formato-num" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (rows + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" maxlength="15">';
                                            } else if (data[j]["ID_TIPO_DATO"] == 3) {
                                                tr += '<input class="form-control form-control-sm text-center require-data" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (rows + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" maxlength="40">';
                                            }
                                        } else {
                                            if (data[j]["ID_TIPO_DATO"] == 2) {
                                                tr += '<input class="form-control form-control-sm text-center validar require-data formato-num" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (rows + 1) + '" onBlur="fn_calcularValor(this)" data-validar="0" data-param="' + data[j]["ID_PARAMETRO"] + '" maxlength="15">';
                                            } else if (data[j]["ID_TIPO_DATO"] == 3) {
                                                tr += '<input class="form-control form-control-sm text-center require-data" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (rows + 1) + '" onBlur="fn_calcularValor(this)" data-validar="0" data-param="' + data[j]["ID_PARAMETRO"] + '" maxlength="40">';
                                            }

                                        }
                                    }
                                } else {
                                    texto++;
                                    if (data[j]["ID_PARAMETRO"] == 11) {
                                        tr += '<input class="form-control form-control-sm text-center campo-total" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (rows + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" readonly>';
                                    } else {
                                        tr += '<input class="form-control form-control-sm text-center" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (rows + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" readonly>';
                                    }

                                }
                                tr += '    </div>';
                                tr += '</td>'
                            }
                        }

                        var urlDw = baseUrl + 'Gestion/FileDownload?IdIniciativa=' + $("#iniciativa_mit_ID_INICIATIVA").val() + '&IdIndicador=' + (rows + 1) + "&accion=I ";

                        tr += '<td class="text-center" data-encabezado="Sustento" id="sustento' + (rows + 1) + '">';
                        tr += '        <label class="btn btn-secondary btn-sm m-0" for="fle-doc-' + (rows + 1) + '" title="Cargar archivo"><i class="fas fa-upload"></i>';
                        tr += '          <input class="d-none" type="file" id="fle-doc-' + (rows + 1) + '" name="fledoc" onchange="handleFileSustento(this.files,' + (rows + 1) + ',1)">';
                        tr += '        </label><a class="btn btn-success btn-sm m-0" href="' + urlDw + '" title="Descargar archivo" id="fle-dow-' + (rows + 1) + '" target="_blank" style="display: none;"><i class="fas fa-download"></i></a>';
                        tr += '</td>';

                        tr += '<td class="text-center estrecho" data-encabezado="Verificar acumulado"><span data-toggle="modal" data-target="#"><a class="btn btn-purple btn-sm m-0 quitarCampos" href="#" title="Verificar acumulado" onclick="mostrarAcumulado();"><i class="fas fa-eye"></i></a></span></td>';

                        tr += '<td class="text-center" data-encabezado="Acciones" width="5%"><a class="btn btn-info btn-sm m-0 quitarCampos" href="#" onclick="fn_eliminarRestarTotal()" title="Quitar fila"><i class="fas fa-minus-circle"></i></a></td>';

                        tr += '</tr>';
                        $("#cuerpoTablaIndicador").append(tr);
                    }
                    //console.log(arregloIDs);
                    asignarAfecto(arregloIDs);
                }
            } else {
                //cargarCuerpoTabla($("#cbo-enfoque").val());
                //$("#total-detalle").append('<strong id="total">0.00 tCO<sub>2</sub>eq</strong>');
                //$("#total-detalle2").append('<strong id="total2">0.00 tCO<sub>2</sub>eq</strong>');
            }
        }
    });
}

function CargarDatosGuardados() {
    var medida = $("#Control").data("mitigacion");
    var enfoque = $("#cbo-enfoque").val();
    var iniciativa = $("#Control").data("iniciativa");
    var item = {
        ID_INICIATIVA: iniciativa,
        ID_MEDMIT: medida,
        ID_ENFOQUE: enfoque
    }
    $.ajax({
        url: baseUrl + 'Gestion/ListarDatosIndicadorData',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {
                    var order = $("#tablaIndicador").data("order");
                    CargarCuerpoGuardado(data.length, 1);
                    var total = 0.0;
                    for (var i = 0; i < data.length; i++) {
                        var lista = 0;
                        var texto = 0;
                        var fecha = 0;
                        var entidad = data[i]["listaInd"]
                        $("#cuerpoTablaIndicador #detalles-tr-" + (i + 1)).attr({ "data-ind": data[i]["ID_INDICADOR"] });
                        var tieneArchivo = data[i].ArchivoSustento;

                        if (tieneArchivo != undefined && tieneArchivo != null) {
                            var Xdown = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + (i + 1)).find("a[name=fledownload]");
                            if (Xdown != undefined && Xdown != null) {
                                console.log(Xdown);
                                Xdown[0].style.cssText = "";
                                Xdown[0].href = baseUrl + 'Gestion/FileDownloadDetalle?IdIniciativa=' + $("#iniciativa_mit_ID_INICIATIVA").val() + '&IdIndicador=' + data[i]["ID_INDICADOR"] + "&accion=M";
                            }
                        }
                        else {
                            var Xdown = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + (i + 1)).find("a[name=fledownload]");
                            if (Xdown != undefined && Xdown != null) {
                                console.log(Xdown);
                                Xdown[0].href = baseUrl + 'Gestion/FileDownload?IdIniciativa=' + $("#iniciativa_mit_ID_INICIATIVA").val() + '&IdIndicador=' + data[i]["ID_INDICADOR"] + "&accion=I";
                            }
                        }

                        for (var m = 0; m < entidad.length; m++) {
                            //debugger;
                            if (entidad[m]["ID_TIPO_CONTROL"] == 1) {
                                lista++;
                                $("#cbo-det-tbl-1-" + lista + "-" + (i + 1)).val(entidad[m]["VALOR"]);
                                if (entidad[m]["VERIFICABLE"] == 1) {
                                    $("#cbo-det-tbl-1-" + lista + "-" + (i + 1)).attr({ "data-validar": 1 });
                                }
                            } else if (entidad[m]["ID_TIPO_CONTROL"] == 2) {
                                if (entidad[m]["ID_TIPO_DATO"] == 1) {
                                    fecha++;
                                    $("#fch-det-tbl-1-" + fecha + "-" + (i + 1)).val(entidad[m]["VALOR"]);
                                    if (entidad[m]["VERIFICABLE"] == 1) {
                                        $("#fch-det-tbl-1-" + fecha + "-" + (i + 1)).attr({ "data-validar": 1 });
                                    }
                                } else {
                                    texto++;
                                    //$("#txt-det-tbl-1-" + texto + "-" + (i + 1)).val(entidad[m]["VALOR"]);

                                    if (entidad[m]["ID_TIPO_DATO"] == 2) {
                                        $("#txt-det-tbl-1-" + texto + "-" + (i + 1)).val(formatoMiles(entidad[m]["VALOR"])); //add
                                    } else if (entidad[m]["ID_TIPO_DATO"] == 3) {
                                        $("#txt-det-tbl-1-" + texto + "-" + (i + 1)).val(entidad[m]["VALOR"]);
                                    }


                                    if (entidad[m]["VERIFICABLE"] == 1) {
                                        $("#txt-det-tbl-1-" + texto + "-" + (i + 1)).attr({ "data-validar": 1 });
                                    }
                                }
                            }
                            if (entidad[m]["ID_PARAMETRO"] == 11) {
                                total += parseFloat(entidad[m]["VALOR"]);
                            }
                        }
                        //}
                        debugger;
                        //add 17-05-2020
                        cargarAcumulado(entidad, i + 1);

                    }
                    $("#total-detalle").html("").append(formatoMiles(Math.round(total * 100) / 100));
                    $("#total-detalle2").html("").append(formatoMiles(Math.round(total * 100) / 100));
                    $("#cuerpoTablaIndicador").data("total", total);
                    //$("#cuerpoTablaIndicador").data("row", data.length);
                }
            } else {
                CargarCuerpoGuardado(1, 0);
                $("#total-detalle").html("").append(0.00);
                $("#total-detalle2").html("").append(0.00);
                //cargarCuerpoTabla($("#cbo-enfoque").val());
                //$("#total-detalle").append('<strong id="total">0.00 tCO<sub>2</sub>eq</strong>');
                //$("#total-detalle2").append('<strong id="total2">0.00 tCO<sub>2</sub>eq</strong>');
            }
            $("#tbl-main-preload").html("");
            $("#tbl-main").removeClass("d-none");
        }
    });
}

//==============================================================================================================

//      FIN CARGAR DATOS CUERPO

//==============================================================================================================


//==============================================================================================================

//      TOTALES

//==============================================================================================================


function fn_total(row) {
    var total = 0.0;
    for (var i = 0; i < row; i++) {
        if ($("#cbo-enfoque").val() == 1) {
            if ($("#txt-det-7-" + (i + 1)).val() != '') {
                total += parseFloat($("#txt-det-7-" + (i + 1)).val());
            }
        } else if ($("#cbo-enfoque").val() == 2) {
            if ($("#txt-det-8-" + (i + 1)).val() != '') {
                total += parseFloat($("#txt-det-8-" + (i + 1)).val());
            }
        } else if ($("#cbo-enfoque").val() == 3) {
            if ($("#txt-det-5-" + (i + 1)).val() != '') {
                total += parseFloat($("#txt-det-5-" + (i + 1)).val());
            }
        } else if ($("#cbo-enfoque").val() == 4) {
            if ($("#txt-det-6-" + (i + 1)).val() != '') {
                total += parseFloat($("#txt-det-6-" + (i + 1)).val());
            }
        }
    }
    $("#cuerpoTablaIndicador").data("total", total);
    $("#total-detalle").html("");
    $("#total-detalle").append((Math.round(total * 100) / 100));
    //$("#total-detalle2").html("");
    //$("#total-detalle2").append((Math.round(total * 100) / 100));
}


function fn_restarTotal(num1, num2) {
    var row = $(".tabla-detalle-indicadores").find("tbody").find("th").length - 1;
    $("#cuerpoTablaIndicador").data("row", row);
    if ($("#txt-det-" + num1 + "-" + $("#tablaIndicador").data("fila")).val() != '') {
        var t = parseFloat($("#txt-det-" + num1 + "-" + $("#tablaIndicador").data("fila")).val());
        var tt = parseFloat($("#cuerpoTablaIndicador").data("total")) - t;
        $("#cuerpoTablaIndicador").data("total", tt);
        $("#total-detalle").html("");
        $("#total-detalle").append((Math.round(tt * 100) / 100));
        //$("#total-detalle2").html("");
        //$("#total-detalle2").append((Math.round(tt * 100) / 100));
        if ($("#txt-det-" + num2 + "-" + $("#tablaIndicador").data("fila")).val() != '') { // ID_INDICADOR
            var id_borrar = $("#cuerpoTablaIndicador").data("delete") + $("#txt-det-" + num2 + "-" + $("#tablaIndicador").data("fila")).val() + ",";
            $("#cuerpoTablaIndicador").data("delete", id_borrar);
        }
    }
}

//==============================================================================================================

//      FIN TOTALES

//==============================================================================================================

//==============================================================================================================

//      ELIMINAR FILE

//==============================================================================================================

function fn_eliminarArchivo(id) {
    var eliminar = $("#total-documentos").data("eliminarfile") + id + ",";
    $("#total-documentos").data("eliminarfile", eliminar);
    var cantidad = $("#total-documentos").data("cantidad") - 1;
    $("#total-documentos").data("cantidad", cantidad);
    $("#total-documentos").html($("#total-documentos").data("cantidad") + storedFiles.length);
    $("#eliminar-" + id).remove();
}

function removeFile(e) {
    var file = e.dataset.file;
    //alert(file);
    for (var i = 0; i < storedFiles.length; i++) {
        if (storedFiles[i].name === file) {
            storedFiles.splice(i, 1);
            $("#total-documentos").html($("#total-documentos").data("cantidad") + storedFiles.length);
            break;
        }
    }
    $(e).parent().parent().parent().remove();
}

//$("body").on("click", ".selFile", removeFile());

//==============================================================================================================

//      FIN ELIMINAR FILE

//==============================================================================================================

//==============================================================================================================





function cargarCabeceraTabla(id) {
    $("#cabeceraTablaIndicador").html("");
    if (id == 1) {
        cargarCabeceraElectrico();
    } else if (id == 2) {
        cargarCabeceraHibrido();
    } else if (id == 3) {
        cargarCabecerElectricoConsumo();
    } else if (id == 4) {
        cargarCabeceraHibridoConsumo();
    }
}

//===============================================================================================================

$(document).on("change", "#cbo-enfoque", function () {
    $("#total-detalle").html("").append(0.00);
    $("#cuerpoTablaIndicador").data("total", 0);
    $("#cuerpoTablaIndicador").data("delete", "");
    //$("#cuerpoTablaIndicador").html("");
    //cargarCabeceraTabla($("#cbo-enfoque").val());
    //CargarDetalleDatos();    
    //cargarCuerpoTabla($("#cbo-enfoque").val());
    CargarDatosCabecera();
    CargarDatosGuardados();



});

$(document).on("click", ".agregarFila", function (e) {
    e.preventDefault();
    //cargarCuerpoTabla($("#cbo-enfoque").val());    
})

function CargarDatosCabecera() {

    var medida = $("#Control").data("mitigacion");
    var enfoque = $("#cbo-enfoque").val();
    $("#cabeceraTablaIndicador").html("");
    //var iniciativa = $("#Control").data("iniciativa");
    var item = {
        //ID_INICIATIVA: iniciativa,
        ID_MEDMIT: medida,
        ID_ENFOQUE: enfoque
    }
    $("#tbl-main-preload").html("<i Class='fas fa-spinner fa-spin px-1'></i> Cargando...");
    $("#tbl-main").addClass("d-none");
    $.ajax({
        url: baseUrl + 'Gestion/ListarCabeceraIndicador',
        type: 'POST',
        datatype: 'json',
        data: item,
        async: false,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var tr = "";
                    tr += '<tr class="bg-primary text-white">';
                    tr += '     <th class="text-center grupo-columna-03" scope="col"><span>N°</span></th>';
                    for (var i = 0; i < data.length; i++) {
                        var columna = "0" + data[i]["ID_GRUPO_INDICADOR"];
                        var descripcion = "";
                        if (data[i]["COMBINACION_UNIDAD"] == "" || data[i]["COMBINACION_UNIDAD"] == null) {
                            if (data[i]["PREFIJO"] != null) {
                                descripcion += data[i]["PREFIJO"];
                            }
                            if (data[i]["UNIDAD"] != null) {
                                descripcion += data[i]["UNIDAD"];
                            }
                            if (data[i]["DESCRIPCION_UNIDAD"] != null) {
                                descripcion += data[i]["DESCRIPCION_UNIDAD"];
                            }
                            if (descripcion == 0) {
                                descripcion = "";
                            } else {
                                descripcion = "(" + descripcion + ")";
                            }
                        } else {
                            descripcion = "(" + data[i]["COMBINACION_UNIDAD"] + ")";
                        }

                        //if (data[i]["ID_PARAMETRO"] == 9 || data[i]["ID_PARAMETRO"] == 10 || data[i]["ID_PARAMETRO"] == 11) {
                        //    tr += '     <th class="text-center grupo-columna-'+ columna +'" scope="col"><span>' + data[i]["NOMBRE_PARAMETRO"] + ' tCOeq</span><small>Seleccione este campo para su registro</small></th>';
                        //}else{
                        //if (data[i]["LEYENDA_PARAMETRO"] == null || data[i]["LEYENDA_PARAMETRO"] == "") {
                        //    tr += '     <th class="text-center grupo-columna-' + columna + '" scope="col" data-placement="bottom"><span>' + data[i]["NOMBRE_PARAMETRO"] + '&nbsp;</span><span>' + descripcion + '</span><small>' + data[i]["DESCRIPCION_PARAMETRO"] + '</small></th>';
                        //} else {
                        //    tr += '     <th class="text-center grupo-columna-' + columna + '" scope="col" data-toggle="tooltip" data-placement="bottom" title="' + data[i]["LEYENDA_PARAMETRO"] + '"><span>' + data[i]["NOMBRE_PARAMETRO"] + '&nbsp;</span><span>' + descripcion + '</span><small>' + data[i]["DESCRIPCION_PARAMETRO"] + '</small></th>';
                        //}

                        var tool = "";
                        if (data[i]["LEYENDA_PARAMETRO"] == null || data[i]["LEYENDA_PARAMETRO"] == "")
                            tool = "";
                        else
                            tool = data[i]["LEYENDA_PARAMETRO"];

                        tr += '     <th class="text-center grupo-columna-' + columna + '" scope="col"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="' + tool + '"></i>' + data[i]["NOMBRE_PARAMETRO"] + '&nbsp;</span><span>' + descripcion + '</span><small>' + data[i]["DESCRIPCION_PARAMETRO"] + '</small></th>';

                        //}                        
                    }
                    //tr += '     <th class="text-center grupo-columna-02" scope="col" data-toggle="tooltip" data-placement="bottom" title="Texto descriptivo de ayuda"><span>Sustento</span><small>Seleccione este campo para su registro</small></th>';
                    tr += '<th class="text-center grupo-columna-03" scope="col"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="Si desea subir un archivo de más de 4MB, contactar con el administrador"></i>Documentos de sustento</span><br/></th>';
                    //tr += '<th class="text-center" scope="col"><span>Más<br></span><a class="btn btn-warning btn-sm m-0" href="javascript:void(0)" title="Agregar fila" onclick="CargarNuevaFila(1);"><i class="fas fa-plus-circle"></i></a></th>';

                    tr += '<th class="text-center grupo-columna-03"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="Verificar acumulado"></i></span><br><small>Ver</small></th>';
                    tr += '<th class="text-center" scope="col"><small>Quitar<br>fila</small></th>';

                    //tr += '     <th class="text-center" scope="col"><span>Más<br></span><a class="btn btn-warning btn-sm m-0 agregarCampos" href="#" title="Agregar fila" download><i class="fas fa-plus-circle"></i></a></th>';
                    tr += '</tr>';
                    $("#cabeceraTablaIndicador").append(tr);
                    $("[data-toggle='tooltip']").tooltip();
                }
            }
        }
    });

}

//======================================================================================== 

// ARMAR VERIFICAR

function armarVerificar(enfoque) {

    var verificar = "";
    verificar += '<div class="ocultar-verificar" id="contenido-' + enfoque + '" hidden>';
    verificar += '<div class="row">';
    verificar += '  <div class="col-12 px-0">';
    verificar += '     <div class="table-responsive tabla-principal tabla-recorrer tabla-detalle-indicadores-1" data-order="tbl-1">';
    verificar += '          <table class="table table-hover" data-fila="0">';
    verificar += '                 <thead id="cabeceraTablaVerificar-' + enfoque + '"></thead>';
    verificar += '                 <tbody id="cuerpoTablaVerificar-' + enfoque + '"></tbody>';
    verificar += '          </table>';
    verificar += '      </div>';
    verificar += '   </div>';
    verificar += '</div>';
    verificar += '<div class="row" id="paramVerificar-' + enfoque + '">';
    verificar += '</div>';
    verificar += '<div class="row" id="tablasFactor-' + enfoque + '">';
    verificar += '</div>';

    $("#contenido-verificar").append(verificar);
    CargarDatosCabeceraVerificar(enfoque);
}
//===================================================================================
function fn_cargarGei() {
    var Item =
    {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    };
    $.ajax({
        url: baseUrl + "Gestion/CargarSeleccionGei",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    if ($("#Control").data("revision") == 1) {
                        for (var j = 0; j < data.length; j++) {
                            for (var i = 0; i < $("#listaGei").data("cantidad") ; i++) {
                                if ($('#G' + (i + 1)).data("value") == data[j]["ID_GEI"]) {
                                    $('#G' + (i + 1)).prop('checked', true);
                                }
                            }
                        }
                    } else {
                        var msj = '<textarea class="form-control-plaintext" id="mlt-energetico" aria-describedby="inputGroup9" cols="30" rows="5" readonly placeholder="Ingrese una descripción para su iniciativa">';
                        for (var j = 0; j < data.length; j++) {
                            msj = msj + data[j]["DESCRIPCION"] + '&nbsp\n';
                        }
                        msj = msj + ' </textarea>';
                        $("#campoGei").append(msj);
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
        url: baseUrl + "Gestion/CargarSeleccionEnergetico",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    if ($("#Control").data("revision") == 1) {
                        for (var j = 0; j < data.length; j++) {
                            for (var i = 0; i < $("#listaEnerg").data("cantidad") ; i++) {
                                if ($('#E' + (i + 1)).data("value") == data[j]["ID_ENERG"]) {
                                    $('#E' + (i + 1)).prop('checked', true);
                                }
                            }
                        }
                    } else {
                        var msj = '<textarea class="form-control-plaintext" id="mlt-energetico" aria-describedby="inputGroup9" cols="30" rows="5" readonly placeholder="Ingrese una descripción para su iniciativa">';
                        for (var j = 0; j < data.length; j++) {
                            msj = msj + data[j]["DESCRIPCION"] + '&nbsp\n';
                        }
                        msj = msj + ' </textarea>';
                        $("#campoEnerg").append(msj);
                    }
                }
            }
        }
    });
}

function fn_cargarIndicadores() {
    fn_cargarGei();
    fn_cargarEnergetico();
}

function fn_ListarENERG() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Gestion/ListarENERG",
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
                    check = check + '    <label class="custom-control-label energ-' + (i + 1) + '" for="E' + (i + 1) + '">' + data[i]["DESCRIPCION"] + '</label>';
                    check = check + '</div>';
                    check = check + '</div>';
                    $("#listaEnerg").append(check);
                }
                $("#listaEnerg").data("cantidad", data.length);
            }
        }
        fn_cargarIndicadores();
    });
}

function fn_ListarGEI() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Gestion/ListarGEI",
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
                    check = check + '    <label class="custom-control-label gei-' + (i + 1) + '" for="G' + (i + 1) + '">' + data[i]["DESCRIPCION"] + '</label>';
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


//===============================================================================================================

function formatoMiles(n) { //add20
    var m = n * 1;
    return m.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
}


//=============================================================

function fn_listarFactores() {
    var item = {
        ID_FACTORES: $("#id_factores").val()
    }
    $.ajax({
        url: baseUrl + 'Gestion/ListarFactoresVerificar',
        type: 'POST',
        datatype: 'json',
        data: item,
        //async: false,
        success: function (data) {
            if (data != null && data != "") {
                //$("#tablaCabeceraFactor-"+index).html("");
                if (data.length > 0) {

                    for (var i = 0; i < data.length; i++) {

                        debugger;
                        var cabecera = data[i]["ListaFactorParametro"];
                        var tr = "";
                        tr += '<tr class="bg-primary text-white">';
                        tr += '     <th class="text-center" scope="col"><span>N°&nbsp;</span></th>';
                        for (var j = 0; j < cabecera.length; j++) {
                            if (cabecera[j]["ID_PARAMETRO"] == 0)
                                tr += '     <th class="text-center grupo-columna-03" scope="col"><span><span>' + cabecera[j]["NOMBRE_DETALLE"] + '</span><span></th>';
                            else
                                tr += '     <th class="text-center grupo-columna-03" scope="col"><div>[P' + cabecera[j]["ID_PARAMETRO"] + ']</div><div><small>' + cabecera[j]["NOMBRE_DETALLE"] + '</small></div></th>';
                        }
                        tr += '</tr>';
                        $(".factor-cab-" + data[i]["ID_FACTOR"]).append(tr);

                        //===============================================================

                        var cuerpo = data[i]["listaFactorData"];
                        var tr1 = "";
                        for (var h = 0; h < cuerpo.length; h++) {
                            var detalle = cuerpo[h]["listaParametro"];
                            tr1 += '<tr>';
                            tr1 += '        <th class="text-center" data-encabezado="Número" scope="row">' + (h + 1) + '</th>';
                            for (var m = 0; m < detalle.length; m++) {
                                tr1 += '<td data-encabezado="Columna 04">';
                                tr1 += '  <div class="input-group">';
                                tr1 += '        <input class="form-control-plaintext form-control-sm text-center" type="text" placeholder="" value="' + detalle[m]["NOMBRE_DETALLE"] + '" readonly>';
                                tr1 += '  </div>';
                                tr1 += '</td>';
                            }
                            tr1 += '<td data-encabezado="Columna 04">';
                            tr1 += '  <div class="input-group">';
                            tr1 += '        <input class="form-control-plaintext form-control-sm text-center" type="text" placeholder="" value="' + cuerpo[h]["FACTOR"] + '" readonly>';
                            tr1 += '  </div>';
                            tr1 += '</td>';
                            tr1 += '</tr>';
                        }
                        $(".factor-det-" + data[i]["ID_FACTOR"]).append(tr1);
                    }

                }
            } else {
            }
        }
    });
}

//========================================================================

$(document).ready(function () {

    inicio();

    if ($("#iniciativa_mit_ID_INICIATIVA").val() > 0) {
        $("#Control").data("iniciativa", $("#iniciativa_mit_ID_INICIATIVA").val());
    } else {
        $("#Control").data("iniciativa", $("#identificador").val());
    }

    $("#Control").data("mitigacion", $("#medida_ID_MEDMIT").val());
    //$("#Control").data("iniciativa", $("#identificador").val());
    $("#Control").data("revision", $("#revision").val());
    //$("#cbo-enfoque").val($("#menor").val());
    //$("#enfoque-" + ($("#cbo-enfoque").val())).removeAttr("hidden");
    //$("#cbo-enfoque").data("select", $("#cbo-enfoque").val()); //data-select para saber quien fue el anterior
    debugger;
    if ($("#revision").val() == 1) {



        fn_ListarGEI();

        armarAcumulado(); //add 17-05-2020
        //CargarDetalleIndicadorRevision();
        //cargarTablasEnfoque();

        //===== VERIFICAR MODAL
        //var id_enfoques = $("#id_enfoques").val();
        //var arr = id_enfoques.split(',');
        //for (var i = 0; i < arr.length; i++){
        //    armarVerificar(arr[i]);
        //}

        //fn_listarFactores(); -agregar luego 13-03-20

    } else {
        CargarDatosCabecera();
        CargarDatosGuardados();

        CargarDatosIniciativa();
        fn_cargarUbicacion();
        fn_cargarEnergetico();
        fn_cargarGei();

        //cargarCabeceraTabla($("#cbo-enfoque").val());
        //CargarDetalleDatos();

        //cargarCuerpoTabla($("#cbo-enfoque").val());
        //CargarDetalleIndicador();
    }

    var monto = $("#txt-monto-inversion").val();
    $("#txt-monto-inversion").val(formatoMiles(monto)); //add20

    //CargarDatosIniciativa();
    //fn_cargarUbicacion();
    //fn_cargarEnergetico();
    //fn_cargarGei();

    $(document).on("mouseover", "#tablaIndicador tbody tr", function () {
        var fila = $(this).find('th:eq(0)').html();

        console.log(fila);
        $("#tablaIndicador").data("fila", fila);
    });

    fn_actualizaCampana();
    enLinea();

});

$(document).on("keydown", ".validar", function (event) {
    if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105) && event.keyCode !== 190 && event.keyCode !== 110 && event.keyCode !== 8 && event.keyCode !== 9) {
        return false;
    }
});

//$(function () {
//    $(".validar").keydown(function (event) {
//        alert(event.keyCode);
//        if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105) && event.keyCode !== 190 && event.keyCode !== 110 && event.keyCode !== 8 && event.keyCode !== 9) {
//            return false;
//        }
//    });
//});

//////////////////////////


$("#cbo-enfoque").change(function () {
    //var enfoque = $("#cbo-enfoque").val();
    //var select = $("#cbo-enfoque").data("select");
    //$("#enfoque-" + select).attr("hidden",true);
    //$("#enfoque-" + ($("#cbo-enfoque").val())).removeAttr("hidden");
    //$("#cbo-enfoque").data("select", $("#cbo-enfoque").val())
    //if (enfoque == 1) {
    //    $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="'+ baseUrl +'Documentos/4.1 Plantilla_Electricos_Masivo.xlsm" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    //} else if (enfoque == 2) {
    //    $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/4.2 Plantilla_Electricos_Masivo.xlsm" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    //} else if (enfoque == 3){
    //}    
    //CargarDatosCabecera();
    CargarDatosGuardados();
});


function fn_calcularValor(e) {
    console.log("Aqui : " + $(e).attr("data-validar"));
    var dv = $(e).attr("data-validar");
    var row = $("#tablaIndicador").data("fila");



    id = e.id;
    var indice_id = id.substring(0, 3);
    if (indice_id == "cbo") {
        if ($("#" + id).val() > 0) {
            $(e).attr({ "data-validar": "1" });
        } else {
            $(e).attr({ "data-validar": "0" });
        }
    } else if (indice_id == "txt") {
        if ($("#" + id).val() != "") {
            $(e).attr({ "data-validar": "1" });
        } else {
            $(e).attr({ "data-validar": "0" });
        }
    } else if (indice_id == "fch") {
        if ($("#" + id).val() != "") {
            $(e).attr({ "data-validar": "1" });
        } else {
            $(e).attr({ "data-validar": "0" });
        }
    }


    var valor = 0;
    var campos = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + row).find("[data-validar]");
    campos.each(function (index, value) {
        console.log(index + " + " + $(value).attr("id") + " + " + $(value).attr("data-validar"));

        if ($(value).attr("data-validar") == 0) {
            valor = 1;
        }

    });
    //|1,12,14,1
    if (valor == 0) {
        //var f = $("#enfoque-" + $("#cbo-enfoque").val()).data("fila");
        var enfoque = $("#cbo-enfoque").val();
        var medida = $("#Control").data("mitigacion");
        //var fila = $("#enfoque-" + $("#cbo-enfoque").val()).find("tbody").find("#detalles-tr-" + $("#enfoque-" + $("#cbo-enfoque").val()).data("fila")).find("[data-param]");
        var fila = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + row).find("[data-param]");
        var parametros = "";
        fila.each(function (index, value) {
            parametros += enfoque + ",";
            parametros += medida + ",";
            parametros += $(value).attr("data-param") + ",";
            //===============
            debugger;
            var m = $(value).attr("id");
            m = m.substring(0, 3);
            if (m == "txt") {
                var eva = $("#" + $(value).attr("id")).val().replace(/,/gi, '');
                parametros += eva + "|";
            } else {
                parametros += $("#" + $(value).attr("id")).val() + "|";
            }
            //==================            
            //parametros += $("#" + $(value).attr("id")).val() + "|";
        });
        parametros = parametros.substring(0, parametros.length - 1);

        var item = {//prueba
            //Valor: '1,12,6,2018|1,12,2,24/01/2015|1,12,1,1|1,12,3,2|1,12,4,57600|1,12,12,20|1,12,13,0|1,12,9,0|1,12,10,0|1,12,11,0|1,12,14,1'
            Valor: parametros
        };
        fn_enviarCalcularValor(item, row);
    }

}

function fn_enviarCalcularValor(item, f) {
    //var url = baseUrl + 'Gestion/CalcularIndicadorDinamico';
    //var respuesta = MRV.Ajax(url, item, false);
    //if (respuesta.success) {
    //    alert("bien");
    //}

    $.ajax({
        url: baseUrl + 'Gestion/CalcularIndicadorDinamico',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var index = 0;
                    var total = 0;

                    debugger;
                    //var fila = $("#enfoque-" + $("#cbo-enfoque").val()).find("tbody").find("#detalles-tr-" + f).find("[data-param]");
                    var fila = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + f).find("[data-param]");
                    fila.each(function (index, value) {
                        var valor = data[index]["VALOR"];
                        if (!isNaN(valor)) if (valor - Math.floor(valor) != 0) valor = Math.round(valor * 100) / 100

                        //===============================================================
                        debugger;
                        var m = $(value).attr("id");
                        m = m.substring(0, 3);
                        if (m == "txt"){
                            if (!isNaN(valor)) {
                                $("#" + $(value).attr("id")).val(formatoMiles(valor));
                            } else {
                                $("#" + $(value).attr("id")).val(valor);
                            }
                        } else {
                            $("#" + $(value).attr("id")).val(valor);
                        }
                        //=================================================================

                        //$("#" + $(value).attr("id")).val(formatoMiles(valor));
                        index++;
                    });


                    var fila_total = $("#tablaIndicador").find("tbody").find("tr");
                    fila_total.each(function (index, value) {
                        debugger;
                        var t = $(value).find(".campo-total").val().replace(/,/gi, '');
                        if (t != "")
                            total += parseFloat($(value).find(".campo-total").val().replace(/,/gi, ''));
                        //console.log(c);
                        //var b = $(value).find("td").find("div").find("input").attr(".campo-total");
                        //var a = $(value).find("td").find("div").find("input[class='campo-total']").html();
                        //total += parseFloat($(".campo-total").val());
                    });

                    $("#total-detalle").html("").append(formatoMiles(Math.round((total) * 100) / 100));
                    $("#total-detalle2").html("").append(formatoMiles(Math.round((total) * 100) / 100));
                    $("#cuerpoTablaIndicador").data("total", total);

                    //add
                    agregarAcumulado(item, f);
                }
            } else {
                //////cargarCuerpoTabla($("#cbo-enfoque").val());
            }
        }
    });
}

function fn_validarCampoReg(f) {
    //var campos = $("#enfoque-" + $("#cbo-enfoque").val()).find("tbody").find("#detalles-tr-" + f).find("[data-validar]");
    var v = true;
    var campos = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + f).find("[data-validar]");
    campos.each(function (index, value) {
        console.log(index + " + " + $(value).attr("id") + " + " + $(value).attr("data-validar"));

        if ($(value).attr("data-validar") == 0) {
            v = false;
        }

    });
    return v;
}

function fn_eliminarRestarTotal() {
    if ($("#tablaIndicador").find("tbody").find("tr").length > 1) {
        var total = parseFloat($("#cuerpoTablaIndicador").data("total"));
        var fila = $("#tablaIndicador").data("fila");
        var campos = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + fila).find("[data-param]");
        campos.each(function (index, value) {
            if ($(value).attr("data-param") == 11) {
                var r = $(value).val();
                if (r != "")
                    total -= parseFloat(r.replace(/,/gi, ''));
            }
        });
        $("#total-detalle").html("").append((Math.round(total * 100) / 100));
        $("#total-detalle2").html("").append((Math.round(total * 100) / 100));
        $("#cuerpoTablaIndicador").data("total", total);
        //debugger;
        if ($("#tablaIndicador #detalles-tr-" + fila).data("ind") > 0) {
            var id_borrar = $("#cuerpoTablaIndicador").data("delete") + $("#tablaIndicador #detalles-tr-" + fila).data("ind") + ",";
            $("#cuerpoTablaIndicador").data("delete", id_borrar);
        }

        var url = baseUrl + "Gestion/FileDelete?IdIniciativa=" + $("#Control").data("iniciativa") + "&IdIndicador=" + (parseInt(fila) - 1);
        var respuesta = MRV.Ajax(url, null, false);
        if (respuesta.success) {
            console.log("Archivos borrados");
        }

        //nuevo
        eliminarAcumulado(fila);
    }
}

function fn_mensajeCompletar() {
    $('#mensajeModalRegistrar #mensajeGoodRegistro').remove();
    $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
    var msj = '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="mensajeDangerRegistro">';
    msj = msj + '                            <div class="alert-wrap mr-3">';
    msj = msj + '                                <div class="sa">';
    msj = msj + '                                    <div class="sa-error">';
    msj = msj + '                                       <div class="sa-error-x">';
    msj = msj + '                                           <div class="sa-error-left"></div>';
    msj = msj + '                                           <div class="sa-error-right"></div>';
    msj = msj + '                                       </div>';
    msj = msj + '                                       <div class="sa-error-placeholder"></div>';
    msj = msj + '                                       <div class="sa-error-fix"></div>';
    msj = msj + '                                   </div>';
    msj = msj + '                               </div>';
    msj = msj + '                           </div>';
    msj = msj + '                           <div class="alert-wrap">';
    msj = msj + '                                <h6>Error de registro</h6>';
    msj = msj + '                                <hr><small class="mb-0">Verifique que los datos sean correctamente ingresados, complete todos los campos obligatorios e intente otra vez.</small>';
    msj = msj + '                           </div>';
    msj = msj + '                     </div>';
    $('#mensajeModalRegistrar').append(msj);
}

function fn_validarArchivo(url, estado) {
    var vurl = baseUrl + "Gestion/ValidarDetalleArchivo";
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    }
    var respuesta = MRV.Ajax(vurl, item, false);
    if (respuesta.success) {
        var cantidad_file = parseInt(respuesta.extra);
        if (cantidad_file > 0) {
            if ($("#total-documentos").data("eliminarfile") == "") {
                fn_validarCampo(url, estado);
            } else {
                var id_eliminar = $("#total-documentos").data("eliminarfile");
                id_eliminar = id_eliminar.substring(0, id_eliminar.length - 1);
                var cant_eliminar = id_eliminar.split(',');
                var cantidad_elim = cant_eliminar.length;
                if (cantidad_file > cantidad_elim) {
                    fn_validarCampo(url, estado);
                } else {
                    if (($("#total-documentos").data("cantidad") + storedFiles.length) > 0) {
                        fn_validarCampo(url, estado);
                    } else {
                        fn_mensajeCompletar();
                    }
                }
            }
        } else {
            if (($("#total-documentos").data("cantidad") + storedFiles.length) > 0) {
                fn_validarCampo(url, estado);
            } else {
                fn_mensajeCompletar();
            }
        }
    }
}

function fn_validarCampo(url, estado) {
    var vurl = baseUrl + "Gestion/ValidarDetalleIndicador";
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    }
    var respuesta = MRV.Ajax(vurl, item, false);
    if (respuesta.success) {
        debugger;
        var cantidad_bd = parseInt(respuesta.extra);
        if (cantidad_bd > 0) {
            if ($("#cuerpoTablaIndicador").data("delete") == "") {
                fn_procesoDetalleIndicador(url, estado);
            } else {
                var id_delete = $("#cuerpoTablaIndicador").data("delete");
                id_delete = id_delete.substring(0, id_delete.length - 1);
                var cant_delete = id_delete.split(',');
                var cantidad_del = cant_delete.length;
                if (cantidad_bd > cantidad_del) {
                    fn_procesoDetalleIndicador(url, estado);
                } else {
                    if ($("#tablaIndicador").find("tbody").find("th").length > 0) {
                        var validar = 0;
                        var campos = $("#tablaIndicador").find("tbody").find("tr");
                        campos.each(function (index, value) {
                            var fila = $(value).find("td");
                            fila.each(function (i, value) {
                                if ($(value).find("div").find("input").attr("data-param") == "11") {
                                    if ($(value).find("div").find("[data-param]").val() != "") {
                                        validar = 1;
                                    }

                                }
                            });

                        });
                        if (validar == 1) {
                            fn_procesoDetalleIndicador(url, estado);
                        } else {
                            fn_mensajeCompletar();
                        }
                    } else {
                        fn_mensajeCompletar();
                    }
                }
            }
        } else {
            if ($("#tablaIndicador").find("tbody").find("th").length > 0) {
                var validar = 0;
                var campos = $("#tablaIndicador").find("tbody").find("tr");
                campos.each(function (index, value) {
                    var fila = $(value).find("td");
                    fila.each(function (i, value) {
                        if ($(value).find("div").find("input").attr("data-param") == "11") {
                            if ($(value).find("div").find("[data-param]").val() != "") {
                                validar = 1;
                            }

                        }
                    });

                });
                if (validar == 1) {
                    fn_procesoDetalleIndicador(url, estado);
                } else {
                    fn_mensajeCompletar();
                }
            } else {
                fn_mensajeCompletar();
            }
        }
    } else {

    }

}


//============================================== REVISAR

function CargarDatosCabeceraVerificar(enfoque) {

    //var medida = $("#Control").data("mitigacion");
    //$("#cabeceraTablaIndicador").html("");
    var item = {
        ID_MEDMIT: $("#medida_ID_MEDMIT").val(),
        ID_ENFOQUE: enfoque
    }
    $.ajax({
        url: baseUrl + 'Gestion/ListarCabeceraIndicador',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var parametros = "<div class='col-sm-4 col-md-4 col-lg-4'><div><h5>PARÁMETROS:</h5></div><div><ul style='list-style:none'>"
                    var tr = "";
                    tr += '<tr class="bg-primary text-white">';
                    tr += '     <th class="text-center" scope="col"><span>N°</span></th>';
                    for (var i = 0; i < data.length; i++) {
                        var columna = "0" + data[i]["ID_GRUPO_INDICADOR"];
                        var descripcion = "";
                        if (data[i]["COMBINACION_UNIDAD"] == "" || data[i]["COMBINACION_UNIDAD"] == null) {
                            if (data[i]["PREFIJO"] != null) {
                                descripcion += data[i]["PREFIJO"];
                            }
                            if (data[i]["UNIDAD"] != null) {
                                descripcion += data[i]["UNIDAD"];
                            }
                            if (data[i]["DESCRIPCION_UNIDAD"] != null) {
                                descripcion += data[i]["DESCRIPCION_UNIDAD"];
                            }
                            if (descripcion == 0) {
                                descripcion = "";
                            } else {
                                descripcion = "(" + descripcion + ")";
                            }
                        } else {
                            descripcion = "(" + data[i]["COMBINACION_UNIDAD"] + ")";
                        }
                        var param = "<div>[P" + data[i]["ID_PARAMETRO"] + "]</div>" + "<div><small> " + data[i]["NOMBRE_PARAMETRO"] + "</small></div>";
                        var param_li = "<span>[P" + data[i]["ID_PARAMETRO"] + "]</span>" + "<span><small> " + data[i]["NOMBRE_PARAMETRO"] + "</small></span>";
                        parametros += "<li>" + param_li + "</li>"
                        tr += '     <th class="text-center grupo-columna-' + columna + '" scope="col">' + param + '<div>' + descripcion + '</div></th>';
                    }
                    tr += '     <th class="text-center" scope="col">Más</th>';
                    tr += '</tr>';
                    parametros += "</ul></div></div>";
                    $("#cabeceraTablaVerificar-" + enfoque).append(tr);
                    $("#paramVerificar-" + enfoque).append(parametros);
                    factoresVerificar(enfoque);
                }
            }
        }
    });

}


function factoresVerificar(enfoque) {
    var item = {
        ID_ENFOQUE: enfoque
    }
    $.ajax({
        url: baseUrl + 'Gestion/ListarEnfoqueFactorVerificar',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var factores = "<div class='col-sm-4 col-md-4 col-lg-4'><div><h5>FACTORES:</h5></div><div><ul style='list-style:none'>";
                    for (var i = 0; i < data.length; i++) {
                        var factor = "<span>[F" + data[i]["ID_FACTOR"] + "]</span>&nbsp;<span><small>" + data[i]["NOMBRE_FACTOR"] + "</small></span>";
                        factores += "<li>" + factor + "</li>"
                        $("#tablasFactor-" + enfoque).append('<div class="col-sm-4 col-md-4 col-lg-4"><h5>' + data[i]["NOMBRE_FACTOR"] + '</h5><table><thead id="tablaCabeceraFactor-' + (i + 1) + '-' + enfoque + '"></thead><tbody id="cuerpoTablaFactor-' + (i + 1) + '-' + enfoque + '"></tbody></table></div>');
                        //CargarCabeceraDatos(data[i]["ID_FACTOR"], (i + 1), enfoque);
                        //CargarDatosGuardadosVerificar(data[i]["ID_FACTOR"], (i + 1), enfoque)
                    }
                    factores += "</ul></div></div>";
                    $("#paramVerificar-" + enfoque).append(factores);
                    //debugger;
                    FormulaVerificar(enfoque);
                }
            }
        }
    });
}


function FormulaVerificar(enfoque) {
    var item = {
        ID_MEDMIT: $("#medida_ID_MEDMIT").val(),
        ID_ENFOQUE: enfoque
    }
    $.ajax({
        url: baseUrl + 'Gestion/ListarFormulasVerificar',
        type: 'POST',
        datatype: 'json',
        data: item,
        //async: false,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var formulas = "<div class='col-sm-4 col-md-4 col-lg-4'><div><h5>FÓRMULAS:</h5></div><div><ul style='list-style:none'>";
                    for (var i = 0; i < data.length; i++) {
                        var formula = "<div><span>[P" + data[i]["ID_PARAMETRO"] + "]</span>&nbsp;<span><small>" + data[i]["NOMBRE_PARAMETRO"] + "</small></span>:</div><div><span><small>" + data[i]["FORMULA"] + "</small></span></div>";
                        formulas += "<li>" + formula + "</li>";
                    }
                    formulas += "</ul></div></div>";
                    $("#paramVerificar-" + enfoque).append(formulas);
                }
            }
        }
    });
}


function CargarCabeceraDatos(factor, index, enfoque) {
    //$("#tablaCabeceraFactor").data("idfactor", factor);
    var item = {
        ID_FACTOR: factor
    }
    $.ajax({
        url: baseUrl + 'Mantenimiento/ListarCabeceraFactor',
        type: 'POST',
        datatype: 'json',
        data: item,
        //async: false,
        success: function (data) {
            if (data != null && data != "") {
                //$("#tablaCabeceraFactor-"+index).html("");
                if (data.length > 0) {
                    var tr = "";
                    tr += '<tr class="bg-primary text-white">';
                    tr += '     <th class="text-center" scope="col"><span>N°&nbsp;</span></th>';
                    for (var i = 0; i < data.length; i++) {
                        if (data[i]["ID_PARAMETRO"] == 0)
                            tr += '     <th class="text-center grupo-columna-03" scope="col"><span><span>' + data[i]["NOMBRE_DETALLE"] + '</span><span></th>';
                        else
                            tr += '     <th class="text-center grupo-columna-03" scope="col"><div>[P' + data[i]["ID_PARAMETRO"] + ']</div><div><small>' + data[i]["NOMBRE_DETALLE"] + '</small></div></th>';
                    }
                    //tr += '     <th class="text-center" style="background-color: #007BFF;" scope="col">Más</th>';
                    tr += '</tr>';
                    $("#tablaCabeceraFactor-" + index + "-" + enfoque).append(tr);
                }
            } else {
            }
        }
    });
}

function CargarCuerpoGuardadoVerificar(filas, factor, index, enfoque) {
    var item = {
        ID_FACTOR: factor
    }
    $.ajax({
        //async: false,
        url: baseUrl + 'Mantenimiento/ListarCuerpoFactor',
        type: 'POST',
        datatype: 'json',
        data: item,
        async: false,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    //$("#cuerpoTablaFactor").html("");
                    for (var i = 0; i < filas; i++) {
                        var lista = 0;
                        var texto = 0;
                        var fecha = 0;
                        //var indicador = 0;
                        var tr = "";
                        tr += '<tr id="detalles-tr-' + (i + 1) + '-' + index + '-' + enfoque + '" data-ind="0">';
                        tr += '     <th class="text-center" data-encabezado="Número" scope="row">' + (i + 1) + '</th>';
                        for (var j = 0; j < data.length; j++) {
                            //indicador = data[j]["ID_INDICADOR"];
                            if (data[j]["ID_TIPO_CONTROL"] == 1) {
                                tr += '<td data-encabezado="Columna 07">';
                                tr += '     <div class="form-group m-0">';
                                lista++;
                                if (data[j]["ID_PARAMETRO"] == 6) {
                                    tr += '<select class="form-control form-control-sm" id="cbo-det-tbl-1-' + lista + '-' + (i + 1) + '-' + index + '-' + factor + '-' + enfoque + '" data-param="' + data[j]["ID_PARAMETRO"] + '" disabled>';
                                    tr += '        <option value="0">Seleccionar</option>';
                                    var listaD = data[j]["listaDetalle"];
                                    for (var m = 0; m < listaD.length; m++) {
                                        tr += '<option value="' + listaD[m]["NOMBRE_DETALLE"] + '"><small>' + listaD[m]["NOMBRE_DETALLE"] + '</small></option>';
                                    }
                                    tr += '</select>';
                                } else {
                                    tr += '<select class="form-control form-control-sm" id="cbo-det-tbl-1-' + lista + '-' + (i + 1) + '-' + index + '-' + factor + '-' + enfoque + '" data-param="' + data[j]["ID_PARAMETRO"] + '" disabled>';
                                    tr += '        <option value="0">Seleccionar</option>';
                                    var listaD = data[j]["listaDetalle"];
                                    for (var m = 0; m < listaD.length; m++) {
                                        tr += '<option value="' + listaD[m]["ID_DETALLE"] + '"><small>' + listaD[m]["NOMBRE_DETALLE"] + '</small></option>';
                                    }
                                    tr += '</select>';
                                }
                            } else if (data[j]["ID_TIPO_CONTROL"] == 2) {
                                tr += '<td data-encabezado="Columna 02">';
                                tr += '    <div class="form-group m-0">';
                                if (data[j]["ID_TIPO_DATO"] == 1) {
                                    fecha++;
                                    tr += '<input class="form-control form-control-sm text-center" type="date" placeholder="" id="fch-det-tbl-1-' + fecha + '-' + (i + 1) + '-' + index + '-' + factor + '-' + enfoque + '" data-param="' + data[j]["ID_PARAMETRO"] + '" disabled>';
                                } else {
                                    texto++;
                                    tr += '<input class="form-control form-control-sm text-center" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (i + 1) + '-' + index + '-' + factor + '-' + enfoque + '" data-param="' + data[j]["ID_PARAMETRO"] + '" disabled>';
                                }
                                tr += '    </div>';
                                tr += '</td>'
                            }
                        }
                        //tr += '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        //tr += '     <div class="btn-group">';
                        //tr += '          <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        //tr += '          <div class="dropdown-menu dropdown-menu-right">';
                        //tr += '               <a class="dropdown-item agregarCampos" href="#"><i class="fas fa-plus-circle"></i>&nbsp;Agregar</a>';
                        //tr += '               <a class="dropdown-item quitarCampos" href="#" onclick="fn_eliminarFactor()"><i class="fas fa-minus-circle"></i>&nbsp;Eliminar</a>';
                        //tr += '          </div>';
                        //tr += '     </div>';
                        //tr += '</td>';
                        tr += '</tr>';
                        $("#cuerpoTablaFactor-" + index + "-" + enfoque).append(tr);
                    }
                }
            } else {
                //cargarCuerpoTabla($("#cbo-enfoque").val());
                //$("#total-detalle").append('<strong id="total">0.00 tCO<sub>2</sub>eq</strong>');
                //$("#total-detalle2").append('<strong id="total2">0.00 tCO<sub>2</sub>eq</strong>');
            }
        }
    });
}

function CargarDatosGuardadosVerificar(factor, index, enfoque) {
    var item = {
        ID_FACTOR: factor
    }
    $.ajax({
        url: baseUrl + 'Mantenimiento/ListarDatosFactorData',
        type: 'POST',
        datatype: 'json',
        data: item,
        //async: false,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    //debugger;
                    CargarCuerpoGuardadoVerificar(data.length, factor, index, enfoque);
                    for (var i = 0; i < data.length; i++) {
                        var lista = 0;
                        var texto = 0;
                        var fecha = 0;
                        var entidad = data[i]["listaParametro"]
                        $("#cuerpoTablaFactor-" + index + "-" + enfoque + " #detalles-tr-" + (i + 1) + "-" + factor + "-" + index).attr({ "data-ind": data[i]["ID_DETALLE"] });
                        for (var m = 0; m < entidad.length; m++) {
                            if (entidad[m]["ID_TIPO_CONTROL"] == 1) {
                                lista++;
                                $("#cbo-det-tbl-1-" + lista + "-" + (i + 1) + "-" + index + "-" + factor + "-" + enfoque).val(entidad[m]["VALOR"]);
                            } else if (entidad[m]["ID_TIPO_CONTROL"] == 2) {
                                if (entidad[m]["ID_TIPO_DATO"] == 1) {
                                    fecha++;
                                    $("#fch-det-tbl-1-" + fecha + "-" + (i + 1) + "-" + index + "-" + factor + "-" + enfoque).val(entidad[m]["VALOR"]);
                                } else {
                                    texto++;
                                    $("#txt-det-tbl-1-" + texto + "-" + (i + 1) + "-" + index + "-" + factor + "-" + enfoque).val(entidad[m]["VALOR"]);
                                }
                            }
                        }
                        //}
                        texto++;
                        $("#txt-det-tbl-1-" + texto + "-" + (i + 1) + "-" + index + "-" + factor + "-" + enfoque).val(data[i]["FACTOR"]);
                    }
                }
            } else {
                CargarCuerpoGuardadoVerificar(1, factor, index, enfoque);
            }
        }
    });

}

function cargarVerificar(enfoque, tabla, fila) {
    //fila_valor = fila_valor.substring(0, fila_valor.length - 1);
    //var arr = fila_valor.splice('|');
    var i = 0;
    var row = '<tr id="detalles-tr-p-1" data-ind="0"><th class="text-center" data-encabezado="Número" scope="row">1</th>';

    var campo = $("#cuerpoTablaIndicador-" + tabla).find("#detalles-tr-" + fila);
    campo.each(function (index, value) {
        debugger;
        var valor = $(value).find(".valor");
        valor.each(function (index, value) {
            //debugger;
            i += 1;
            row += '<td data-encabezado="Columna 04"><div class="form-group m-0"><input class="form-control form-control-sm text-center" type="text" placeholder="" id="txt-det-p-' + i + '" value="' + $(value).val() + '" readonly></div></td>';
            //var a = $(value).val();
        });
    });
    //for (var i = 0; i < fila_valor.length; i++){
    //    row += '<td data-encabezado="Columna 04"><div class="form-group m-0"><input class="form-control form-control-sm text-center" type="text" placeholder="" id="txt-det-p-'+ (i + 1) +'" value="' + fila_valor[i] + '" readonly></div></td>';
    //}
    row += '</tr>';
    $("#cuerpoTablaVerificar-" + enfoque).html("").append(row);
    $(".ocultar-verificar").attr("hidden", true);
    $("#contenido-" + enfoque).removeAttr("hidden");
}

function fn_cambiarTipoIniciativa(id, tipoIniciativa) {
    $("#tipo-iniciativa").html("").append('<i class="fas fa-list pr-1"></i>' + tipoIniciativa);
    $("#tipo-iniciativa").data("tipo", id);
}

function mensajeCorrecto(id, titulo, mensaje) {
    var msj = '                   <div class="col-sm-12 col-md-12 col-lg-12" id="' + id + '">';
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
    msj = msj + '                                <h6>' + titulo + '</h6>';
    msj = msj + '                                <hr><small class="mb-0">' + mensaje + '</b></small>';
    msj = msj + '                            </div>';
    msj = msj + '                        </div>';
    msj = msj + '                 </div>';
    return msj;
}

function mensajeError(id, titulo, mensaje) {
    var msj = '                   <div class="col-sm-12 col-md-12 col-lg-12" id="' + id + '">';
    msj = msj = '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert">';
    msj = msj + '                            <div class="alert-wrap mr-3">';
    msj = msj + '                                <div class="sa">';
    msj = msj + '                                    <div class="sa-error">';
    msj = msj + '                                       <div class="sa-error-x">';
    msj = msj + '                                           <div class="sa-error-left"></div>';
    msj = msj + '                                           <div class="sa-error-right"></div>';
    msj = msj + '                                       </div>';
    msj = msj + '                                       <div class="sa-error-placeholder"></div>';
    msj = msj + '                                       <div class="sa-error-fix"></div>';
    msj = msj + '                                   </div>';
    msj = msj + '                               </div>';
    msj = msj + '                           </div>';
    msj = msj + '                            <div class="alert-wrap">';
    msj = msj + '                                <h6>' + titulo + '</h6>';
    msj = msj + '                                <hr><small class="mb-0">' + mensaje + '</b></small>';
    msj = msj + '                            </div>';
    msj = msj + '                        </div>';
    msj = msj + '                    </div>';
    msj = msj + '                 </div>';
    return msj;
}


function ValidarRevision(num_validar, id_ini, id_plazo, id_msj, mensaje) {
    var msj = "";
    var item = {
        ID_INICIATIVA: id_ini,
        ID_PLAZO_ETAPA_ESTADO: id_plazo
    };
    var respuesta = MRV.Ajax(baseUrl + "Gestion/ValidarRevisionIniciativa", item, false);
    if (respuesta.success) {
        if (respuesta.extra == num_validar) {
            msj = mensajeError(id_msj, "Error", mensaje);
        }
    } else {
        msj = mensajeError(id_msj, "Error", "Ocurrio un error durante el proceso de guardado de la Iniciativa.");
    }
    return msj;
}

////
function mostrarAcumulado() {
    var row = $("#tablaIndicador").data("fila");
    var valor = 0;
    var campos = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + row).find("[data-validar]");
    campos.each(function (index, value) {
        console.log(index + " + " + $(value).attr("id") + " + " + $(value).attr("data-validar"));

        if ($(value).attr("data-validar") == 0) {
            valor = 1;
        }

    });
    //|1,12,14,1
    if (valor == 0) {
        $("#modal-acumulado").modal("show");
        //var f = $("#enfoque-" + $("#cbo-enfoque").val()).data("fila");
        var enfoque = $("#cbo-enfoque").val();
        var medida = $("#Control").data("mitigacion");
        //var fila = $("#enfoque-" + $("#cbo-enfoque").val()).find("tbody").find("#detalles-tr-" + $("#enfoque-" + $("#cbo-enfoque").val()).data("fila")).find("[data-param]");
        var fila = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + row).find("[data-param]");
        var parametros = "";
        fila.each(function (index, value) {
            parametros += enfoque + ",";
            parametros += medida + ",";
            parametros += $(value).attr("data-param") + ",";

            //===============
            debugger;
            var m = $(value).attr("id");
            m = m.substring(0, 3);
            if (m == "txt") {
                var eva = $("#" + $(value).attr("id")).val().replace(/,/gi, '');
                parametros += eva + "|";
            } else {
                parametros += $("#" + $(value).attr("id")).val() + "|";
            }
            //==================  

            //parametros += $("#" + $(value).attr("id")).val() + "|";
        });
        parametros = parametros.substring(0, parametros.length - 1);

        var item = {//prueba
            //Valor: '1,12,6,2018|1,12,2,24/01/2015|1,12,1,1|1,12,3,2|1,12,4,57600|1,12,12,20|1,12,13,0|1,12,9,0|1,12,10,0|1,12,11,0|1,12,14,1'
            Valor: parametros
        };
        fn_enviarCalcularAcumulado(item, row);
    }
}

function fn_enviarCalcularAcumulado(item, f) {

    var cabecera = "";
    var cuerpo = "";
    $("#cabecera-acumulado").html("");
    $("#cuerpo-acumulado").html("");
    $.ajax({
        url: baseUrl + 'Gestion/CalcularAcumulado',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {

                    var total = 0.0;
                    cabecera += '<tr>';
                    for (var i = 0; i < data.length; i++) {
                        //debugger;
                        cabecera += '<th class="text-center grupo-columna-03"><span>' + data[i]["anio"] + '&nbsp;<small>tCO<sub>2</sub>eq</small></span></th>';
                        //var a = data[i]["anio"];
                    }
                    cabecera += '<th class="text-center grupo-columna-03"><span>TOTAL ACUMULADO&nbsp;<small>tCO<sub>2</sub>eq</small></span></th>';
                    cabecera += '</tr>';

                    cuerpo += '<tr>';
                    for (var j = 0; j < data.length; j++) {
                        total += parseFloat(data[j]["reducido"]);
                        cuerpo += '<td class="text-center estrecho" data-encabezado="' + data[j]["anio"] + '">' + Math.round(data[j]["reducido"]*100)/100 + '</td>';
                    }
                    cuerpo += '<td class="text-center estrecho" data-encabezado="total">' + Math.round(total * 100) / 100 + '</td>';
                    cuerpo += '</tr>';

                    $("#cabecera-acumulado").append(cabecera);
                    $("#cuerpo-acumulado").append(cuerpo);
                }
            } else {
            }
        }
    });
}

/////////
function mostrarAcumuladoR(e) {

    var ind1 = $(e).parent().parent().parent().data("ind");
    var iniciativa = $("#Control").data("iniciativa");
    var enfoque = $("#id_enfoques").val();
    var medida = $("#Control").data("mitigacion");

    var cabecera = "";
    var cuerpo = "";

    var item = {
        ID_INICIATIVA: iniciativa,
        ID_MEDMIT: medida,
        ID_ENFOQUE: enfoque,
        ID_INDICADOR: ind1
    };

    $("#modal-acumulado").modal("show");
    $.ajax({
        url: baseUrl + 'Gestion/MostrarAcumulado',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {

                    //$("#cabecera-acumulado").html("");
                    //$("#cuerpo-acumulado").html("");

                    var total = 0.0;
                    cabecera += '<tr>';
                    for (var i = 0; i < data.length; i++) {
                        //debugger;
                        cabecera += '<th class="text-center grupo-columna-03"><span>' + data[i]["anio"] + '&nbsp;<small>tCO<sub>2</sub>eq</small></span></th>';
                        //var a = data[i]["anio"];
                    }
                    cabecera += '<th class="text-center grupo-columna-03"><span>TOTAL ACUMULADO&nbsp;<small>tCO<sub>2</sub>eq</small></span></th>';
                    cabecera += '</tr>';

                    cuerpo += '<tr>';
                    for (var j = 0; j < data.length; j++) {
                        total += parseFloat(data[j]["reducido"]);
                        cuerpo += '<td class="text-center estrecho" data-encabezado="' + data[j]["anio"] + '">' + Math.round(data[j]["reducido"] * 100) / 100 + '</td>';
                    }
                    cuerpo += '<td class="text-center estrecho" data-encabezado="total">' + Math.round(total * 100) / 100 + '</td>';
                    cuerpo += '</tr>';

                    $("#cabecera-acumulado").html("").append(cabecera);
                    $("#cuerpo-acumulado").html("").append(cuerpo);
                }
            } else {
            }
        }
    });

}

function agregarAcumulado(item, f) {

    var cabecera = "";
    var cuerpo = "";

    $.ajax({
        url: baseUrl + 'Gestion/CalcularAcumulado',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {

                    debugger;
                    var verf = 0;
                    var anio = 2010;
                    var acumulado_ini = parseInt(data[0]["anio"]) - anio;

                    var fila = $("#cuerpo-acumulado-total").find("tr");
                    fila.each(function (index, value) {
                        debugger;
                        var id = $(value).attr("id");

                        if (id == "f-" + f) {
                            verf = 1;
                        }
                    });

                    debugger;
                    if (verf == 0) {
                        cuerpo += '<tr id="f-' + f + '">';                        

                        if (acumulado_ini > 0) {
                            for (var m = 0; m < acumulado_ini; m++) {
                                cuerpo += '<td class="text-center estrecho" data-encabezado="' + anio + '" id="a-'+ anio +'-'+ f +'">' + 0.00 + '</td>';
                                anio += 1;
                            }
                        }

                        var valor_acumulado = 0.0;
                        for (var j = 0; j < data.length; j++) {
                            //valor_acumulado += Math.round(data[j]["reducido"] * 100) / 100; //q
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

                                //valor_descuento += valor; //q
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


                            //valor_acumulado += Math.round(data[j]["reducido"] * 100) / 100; //q
                            valor_acumulado = Math.round(data[j]["reducido"] * 100) / 100; //add

                            //valor_descuento += valor; //q
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
    });
}


function eliminarAcumulado(f){
    var valor_descuento = 0.0;

    for (var anio = 2010; anio < 2031; anio++) {
        var valor = parseFloat($("#a-" + anio + '-' + f).html().replace(/,/gi, ''));

        //valor_descuento += valor; //q
        valor_descuento = valor; //add

        var acumulado = parseFloat($("#acum-" + anio).html().replace(/,/gi, ''));

        if (acumulado > 0) {
            acumulado_col = acumulado - valor_descuento;
            $("#a-" + anio + '-' + f).html(0);
            $("#acum-" + anio).html(formatoMiles(Math.round(acumulado_col * 100) / 100));
        }        
    }

    debugger;
    $("#f-" + f).remove();

    ordenarTabla();
}

function ordenarTabla() {
    var filas = $("#cuerpo-acumulado-total").find("tr").length;
    debugger;
    for (var i = 0; i < filas; i++) {
        debugger;
        indice = i + 1;
        var anio = 2010;
        var columna = $("#cuerpo-acumulado-total").find("tr").eq(i).find("td").length;

        for (var j = 0; j < columna; j++) {
            $("#cuerpo-acumulado-total").find("tr").eq(i).find("td").eq(j).removeAttr('id').attr({ 'id': 'a-' + anio + '-' + indice });
            anio += 1;
        }

        $("#cuerpo-acumulado-total").find("tr").eq(i).removeAttr('id').attr({ 'id': 'f-' + indice });
    }
}

//////////////////////////////////////////////

function armarAcumulado(){
    var ids = $("#id_indicadores").val()

    var arr = ids.split('/');
    for (var i = 0; i < arr.length; i++){
        generarAcumulado(arr[i]);
    }

}

function generarAcumulado(f) {

    var ind1 = parseInt(f);
    var iniciativa = $("#Control").data("iniciativa");
    var enfoque = $("#id_enfoques").val();
    var medida = $("#Control").data("mitigacion");

    var cabecera = "";
    var cuerpo = "";

    var item = {
        ID_INICIATIVA: iniciativa,
        ID_MEDMIT: medida,
        ID_ENFOQUE: enfoque,
        ID_INDICADOR: ind1
    };

    $.ajax({
        url: baseUrl + 'Gestion/MostrarAcumulado',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {

                    debugger;
                    var verf = 0;
                    var anio = 2010;
                    var acumulado_ini = parseInt(data[0]["anio"]) - anio;

                    var fila = $("#cuerpo-acumulado-total").find("tr");
                    fila.each(function (index, value) {
                        debugger;
                        var id = $(value).attr("id");

                        if (id == "f-" + f) {
                            verf = 1;
                        }
                    });

                    debugger;
                    if (verf == 0) {
                        cuerpo += '<tr id="f-' + f + '">';

                        if (acumulado_ini > 0) {
                            for (var m = 0; m < acumulado_ini; m++) {
                                cuerpo += '<td class="text-center estrecho" data-encabezado="' + anio + '" id="a-' + anio + '-' + f + '">' + 0.00 + '</td>';
                                anio += 1;
                            }
                        }

                        var valor_acumulado = 0.0;
                        for (var j = 0; j < data.length; j++) {

                            //valor_acumulado += Math.round(data[j]["reducido"] * 100) / 100; //q
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

                                //valor_descuento += valor; //q
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


                            //valor_acumulado += Math.round(data[j]["reducido"] * 100) / 100; //q
                            valor_acumulado = Math.round(data[j]["reducido"] * 100) / 100; //add

                            //valor_descuento += valor; //q
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
    });

}

function cargarAcumulado(entidad, f) {

    //====================== add
    //$("#tbl-main-preload-acu").html("<i Class='fas fa-spinner fa-spin px-1'></i> Cargando...");
    //$("#tbl-main-acu").addClass("d-none");
    //======================

    var cuerpo = "";

    var item = {
        lista: entidad
    };

    $.ajax({
        url: baseUrl + 'Gestion/CalcularAcumuladoC',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {

                    debugger;
                    var verf = 0;
                    var anio = 2010;
                    var acumulado_ini = parseInt(data[0]["anio"]) - anio;

                    var fila = $("#cuerpo-acumulado-total").find("tr");
                    fila.each(function (index, value) {
                        debugger;
                        var id = $(value).attr("id");

                        if (id == "f-" + f) {
                            verf = 1;
                        }
                    });

                    debugger;
                    if (verf == 0) {
                        cuerpo += '<tr id="f-' + f + '">';

                        if (acumulado_ini > 0) {
                            for (var m = 0; m < acumulado_ini; m++) {
                                cuerpo += '<td class="text-center estrecho" data-encabezado="' + anio + '" id="a-' + anio + '-' + f + '">' + 0.00 + '</td>';
                                anio += 1;
                            }
                        }

                        var valor_acumulado = 0.0;
                        for (var j = 0; j < data.length; j++) {

                            //valor_acumulado += Math.round(data[j]["reducido"] * 100) / 100; //q
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

                                //valor_descuento += valor; //q
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

                            //valor_acumulado += Math.round(data[j]["reducido"] * 100) / 100; //q
                            valor_acumulado = Math.round(data[j]["reducido"] * 100) / 100; //add

                            //valor_descuento += valor; //q
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
            //$("#tbl-main-preload-acu").html("");
            //$("#tbl-main-acu").removeClass("d-none");
        }
    });



}


/////////////
$(document).on("keyup", ".formato-num", function (event) {
    debugger;
        $(event.target).val(function (index, value) {
            return value.replace(/\D/g, "")
                        .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
        });
    
});