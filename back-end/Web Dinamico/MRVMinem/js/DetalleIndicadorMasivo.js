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
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm"  type="date" placeholder="" id="txt-det-1-' + fila + '" min="2000-01-01" max="2030-12-31">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';

    tr = tr + '         <td data-encabezado="Columna 03">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-det-2-' + fila + '" onchange="fn_calcularIndicadores2(' + fila + ')">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-det-3-' + fila + '" onchange="fn_calcularIndicadores2(' + fila + ')">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
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
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-4-' + fila + '" onBlur="fn_calcularIndicadores2(' + fila + ')">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 08">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-5-' + fila + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 09">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-6-' + fila + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 10">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-7-' + fila + '" disabled>';
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
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-8-' + fila + '" disabled>';
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
                            $("#txt-monto-inversion").val(data[i]["INVERSION_INICIATIVA"]);
                        }
                        if ($("#Control").data("revision") == 0) {
                            $("#cbo-moneda").val(data[i]["ID_MONEDA"]);
                            if (data[i]["FECHA"].toString() != "01/01/0001") {
                                $("#txt-fecha-inicio").val(data[i]["FECHA_EDITAR"]);
                                //$("#txt-fecha-inicio").val("2019-12-12"); FORMATO EJEMPLO PARA CARGA
                            }
                            if (data[i]["FECHA_FIN"].toString() != "01/01/0001") {
                                $("#txt-fecha-fin").val(data[i]["FECHA_EDITAR_FIN"]);
                            }
                        } else {
                            $("#emisorObservacion").append($("#Control").data("nombres"));
                            $("#txt-moneda").val(data[i]["MONEDA"]);
                            if (data[i]["FECHA"].toString() != "01/01/0001") {
                                $("#txt-fecha-inicio").val(data[i]["FECHA"].toString());
                            }
                            if (data[i]["FECHA_FIN"].toString() != "01/01/0001") {
                                $("#txt-fecha-fin").val(data[i]["FECHA_FIN"].toString());
                            }
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
                //CargarSoloTablaIndicador();
                $("#total-detalle").append('<strong id="total">0.00 tCO<sub>2</sub>eq</strong>');
                $("#total-detalle2").append('<strong id="total2">0.00 tCO<sub>2</sub>eq</strong>');
            }
        }
    });
}

function cargarAnioMasivo(Anio) {
    var tr = '<option value="2018" seleted="' + "2018" == Anio + '">2018</option>';
    tr = tr + '<option value="2019" seleted="' + "2019" == Anio + '">2019</option>';
    tr = tr + '<option value="2020" seleted="' + "2020" == Anio + '">2020</option>';
    tr = tr + '<option value="2021" seleted="' + "2021" == Anio + '">2021</option>';
    tr = tr + '<option value="2022" seleted="' + "2022" == Anio + '">2022</option>';
    tr = tr + '<option value="2023" seleted="' + "2023" == Anio + '">2023</option>';
    tr = tr + '<option value="2024" seleted="' + "2024" == Anio + '">2024</option>';
    return tr;
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

function fn_CargarListaTipoVehiculo(datat, j) {
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
        //debugger;
        fn_CargarListaTipoCombustible(datat, j);
    });
}

function fn_CargarListaTipoCombustible(datat, j) {
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
        //debugger;
        llenarTabla(datat, j);
    });
}

function llenarTabla(data, j) {
    debugger;
    var xdate = new Date(parseInt(data[j]["INICIO_OPERACIONES"].substr(6)));
    var mes = xdate.getMonth() + 1; //obteniendo mes
    var dia = xdate.getDate(); //obteniendo dia
    var ano = xdate.getFullYear(); //obteniendo año
    if (dia < 10)
        dia = '0' + dia; //agrega cero si el menor de 10
    if (mes < 10)
        mes = '0' + mes //agrega cero si el menor de 10

    $("#cbo-det-1-" + (j + 1)).val(data[j]["ANNO_BASE"]);
    //$("#txt-det-1-" + (j + 1)).val(xdate);
    document.getElementById("txt-det-1-" + (j + 1)).value = ano + "-" + mes + "-" + dia;
    $("#cbo-det-2-" + (j + 1)).val(data[j]["ID_TIPO_VEHICULO_BASE"]);
    $("#cbo-det-3-" + (j + 1)).val(data[j]["ID_TIPO_COMBUSTIBLE_BASE"]);
    $("#txt-det-2-" + (j + 1)).val(data[j]["KRV_BASE"]);
    $("#txt-det-3-" + (j + 1)).val(data[j]["CANT_BASE"]);
    $("#txt-det-4-" + (j + 1)).val(data[j]["F_RENDIMIENTO"]);
    //$("#tipoFuenteI" + fila).val(data[i]["ID_TIPO_FUENTE_INIMIT"]);
    $("#txt-det-5-" + (j + 1)).val(data[j]["TOTAL_GEI_BASE"]);
    $("#txt-det-6-" + (j + 1)).val(data[j]["TOTAL_GEI_INIMIT"]);
    $("#txt-det-7-" + (j + 1)).val(data[j]["TOTAL_GEI_REDUCIDO"]);
    $("#txt-det-8-" + (j + 1)).val(data[j]["ID_INDICADOR"]);
    $("#detalles-tr-" + (j + 1)).data("value", data[j]["ID_INDICADOR"]);
    $("#cuerpoTablaIndicador").data("total", $("#cuerpoTablaIndicador").data("total") + data[j]["TOTAL_GEI_REDUCIDO"]);
    $("#total-detalle #total").remove();
    $("#total-detalle").append('<strong id="total">' + (Math.round($("#cuerpoTablaIndicador").data("total") * 100) / 100) + ' tCO<sub>2</sub>eq</strong>');
    $("#total-detalle2 #total2").remove();
    $("#total-detalle2").append('<strong id="total2">' + (Math.round($("#cuerpoTablaIndicador").data("total") * 100) / 100) + ' tCO<sub>2</sub>eq</strong>');
}

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
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 02">' + data[i]["INICIO_OPERACIONES"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 03">' + data[i]["TIPO_VEHICULO"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 04">' + data[i]["TIPO_COMBUSTIBLE"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 05">' + data[i]["KRVB"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 06">' + data[i]["CANTIDADB"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 07">' + data[i]["RENDIMIENTO"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 08">' + data[i]["TOTAL_GEI_BASE"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 09">' + data[i]["TOTAL_GEI_INIMIT"] + '</td>';
                    tr = tr + '                        <td class="text-center" data-encabezado="Columna 10">' + data[i]["TOTAL_GEI_REDUCIDO"] + '</td>';
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
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="date" placeholder="" id="txt-det-1-' + (j + 1) + '" min="2000-01-01" max="2030-12-31">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';

    tr = tr + '         <td data-encabezado="Columna 03">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-det-2-' + (j + 1) + '">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-det-3-' + (j + 1) + '">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
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
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-4-' + (j + 1) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 08">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-5-' + (j + 1) + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 09">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="" id="txt-det-6-' + (j + 1) + '" disabled>';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Subtotal">';
    tr = tr + '               <div class="form-group m-0">';
    tr = tr + '                       <input class="form-control form-control-sm text-right" type="text" id="txt-det-7-' + (j + 1) + '" disabled>';
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
//                KRVB: $("#txt-det-2-" + fila).val(),
//                CANTIDADB: $("#txt-det-3-" + fila).val(),
//                FACTOR_RENDIMIENTO: $("#txt-det-4-" + fila).val(),
//                TOTAL_GEI_BASE: $("#txt-det-5-" + fila).val(),
//                TOTAL_GEI_INIMIT: $("#txt-det-6-" + fila).val(),
//                TOTAL_GEI_REDUCIDO: $("#txt-det-7-" + fila).val(),
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

function fn_validarCampo() {
    var url = baseUrl + "Gestion/ValidarDetalleIndicador";
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    }
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {

    } else {

    }

}

function fn_guardarDetalleIndicador() {
    var url = baseUrl + "Gestion/RegistrarDetalleIndicador";
    if ($("#tablaIndicador").find("tbody").find("th") == 0) {
        
    } else {
        fn_procesoDetalleIndicador(url, 1);
    }    
}

function fn_guardarAvances() {
    var url = baseUrl + "Gestion/RegistrarDetalleIndicador";
    fn_procesoDetalleIndicador(url, 0);
}

function fn_corregirDetalleIndicador() {
    var url = baseUrl + "Gestion/RegistrarDetalleIndicador";
    fn_procesoDetalleIndicador(url, 5);
}

function fn_corregirAvances() {
    var url = baseUrl + "Gestion/RegistrarDetalleIndicador";
    fn_procesoDetalleIndicador(url, 6);
}

function fn_observacionDetalleIndicador() {
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
        msj = msj + '                                    <h6>Bien hecho</h6';
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones se enviaron correctamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#observar-revision #modalObservacionBoton").hide();
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

    $("#observar-revision").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
        } else {
            $("#modalRevision #modalErrorRevision").remove();
            $("#observar-revision #modalObservacionBoton").show();
            $("#pieCorrectoObservacion").hide();
        }
    });
}

function fn_revisarDetalleIndicador() {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario"),
        EMAIL_USUARIO: $("#txt-correo-electronico").val(),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val()
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
        msj = msj + '                                    <h6>Bien hecho</h6';
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

    $("#aprobar-revision").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
        } else {
            $("#modalAprobacion #modalErrorAprobacion").remove();
            $("#aprobar-revision #modalAprobarBoton").show();
            $("#pieCorrectoAprobacion").hide();
        }
    });
}

function fn_observacionAdminDetalleIndicador() {
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
        msj = msj + '                                    <h6>Bien hecho</h6';
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones se enviaron correctamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#observar-revision #modalObservacionBoton").hide();
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

    $("#observar-revision").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
        } else {
            $("#modalRevision #modalErrorRevision").remove();
            $("#observar-revision #modalObservacionBoton").show();
            $("#pieCorrectoObservacion").hide();
        }
    });
}

function fn_revisarAdminDetalleIndicador() {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        //ID_USUARIO: $("#Control").data("usuario"),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
        ESTADO_ACTOR: $("#estado-actor").data("estado")
    }
    url = baseUrl + "Gestion/AprobarAdminIniciativaDetalleIndicador";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalAprobacion #modalCorrectoAprobacion").remove();
        $("#modalAprobacion #modalErrorAprobacion").remove();
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
        msj = msj + '                                    <h6>Bien hecho</h6';
        msj = msj + '                                    <hr><small class="mb-0">Se aprobó correctamente esta revisión, se procederá a notificar al especialista.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalAprobacion").append(msj);
        $("#pieCorrectoAprobacion").show();
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

    $("#aprobar-revision").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
        } else {
            $("#modalAprobacion #modalErrorAprobacion").remove();
            $("#pieCorrectoAprobacion").hide();
        }
    });
}

function fn_observacionEvaluadorDetalleIndicador() {
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
        msj = msj + '                                    <h6>Bien hecho</h6';
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

    $("#observar-evaluacion").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
        } else {
            $("#modalRevision #modalErrorRevision").remove();
            $("#observar-evaluacion #modalObservacionBoton").show();
            $("#pieCorrectoObservacion").hide();
        }
    });
}

function fn_observacionVerificarDetalleIndicador() {
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
        msj = msj + '                                    <h6>Bien hecho</h6';
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones se enviaron correctamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#observar-verificacion #modalObservacionBoton").hide();
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

    $("#observar-verificacion").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
        } else {
            $("#modalRevision #modalErrorRevision").remove();
            $("#observar-verificacion #modalObservacionBoton").show();
            $("#pieCorrectoObservacion").hide();
        }
    });
}

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
        msj = msj + '                                    <h6>Bien hecho</h6';
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
        msj1 = msj1 + '         Se ha generado la cadena de bloques para la medida de mitigación&nbsp;<strong>aprobada&nbsp;</strong>';
        msj1 = msj1 + '         <hr>';
        msj1 = msj1 + '         <div class="text-monospace" style="word-break: break-all;">341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb72</div>';
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
        msj = msj + '                                    <h6>Bien hecho</h6';
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
        msj1 = msj1 + '         Se ha generado la cadena de bloques para la medida de mitigación&nbsp;<strong>aprobada&nbsp;</strong>';
        msj1 = msj1 + '         <hr>';
        msj1 = msj1 + '         <div class="text-monospace" style="word-break: break-all;">341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb723341c682443beca780143b04cacbdb72</div>';
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
        ID_INICIATIVA: $("#Control").data("iniciativa")
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
}

function fn_eliminarFile(lastModified) {

}




//////////////////////////////////////////////////////////////7
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
    //$("#tbl-main-preload").html("<i Class='fas fa-spinner fa-spin px-1'></i> Cargando...");
    //$("#tbl-main").addClass("d-none");
    $.ajax({
        url: baseUrl + 'Gestion/ListarCabeceraIndicador',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var tr = "";
                    tr += '<tr class="bg-primary text-white">';
                    tr += '     <th class="text-center" style="background-color: #28A745;" scope="col"><span>N°&nbsp;</span></th>';
                    for (var i = 0; i < data.length; i++) {
                        if (data[i]["ID_PARAMETRO"] == 9 || data[i]["ID_PARAMETRO"] == 10 || data[i]["ID_PARAMETRO"] == 11) {
                            tr += '     <th class="text-center" style="background-color: ' + data[i]["COLOR_GRUPO"] + ';" scope="col"><span>' + data[i]["NOMBRE_PARAMETRO"] + ' tCO<sub>2</sub>eq&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador ' + data[i]["NOMBRE_PARAMETRO"] + '"></i></span></th>';
                        } else {
                            tr += '     <th class="text-center" style="background-color: ' + data[i]["COLOR_GRUPO"] + ';" scope="col"><span>' + data[i]["NOMBRE_PARAMETRO"] + '&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador ' + data[i]["NOMBRE_PARAMETRO"] + '"></i></span></th>';
                        }
                    }
                    tr += '     <th class="text-center" style="background-color: #007BFF;" scope="col">Más</th>';
                    tr += '</tr>';
                    $("#cabeceraTablaIndicador").append(tr);
                    //$("#total-detalle").html("");
                    //$("#total-detalle").append((Math.round(total * 100) / 100));
                    //$("#cuerpoTablaIndicador").data("total", total);
                    //$("#cuerpoTablaIndicador").data("row", data.length);
                }
            } else {
                //cargarCuerpoTabla($("#cbo-enfoque").val());
                //$("#total-detalle").append('<strong id="total">0.00 tCO<sub>2</sub>eq</strong>');
                //$("#total-detalle2").append('<strong id="total2">0.00 tCO<sub>2</sub>eq</strong>');
            }
            $('[data-toggle="tooltip"]').tooltip();
        }
    });

}

function CargarCuerpoGuardado(filas) {
    var medida = $("#Control").data("mitigacion");
    var enfoque = $("#cbo-enfoque").val();
    var iniciativa = $("#Control").data("iniciativa");
    var item = {
        ID_INICIATIVA: iniciativa,
        ID_MEDMIT: medida,
        ID_ENFOQUE: enfoque
    }
    $.ajax({
        async: false,
        url: baseUrl + 'Gestion/ListarCuerpoIndicador',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#cuerpoTablaIndicador").html("");
                    for (var i = 0; i < filas; i++) {
                        var lista = 0;
                        var texto = 0;
                        var fecha = 0;
                        var indicador = 0;
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
                                        tr += '<select class="form-control form-control-sm" id="cbo-det-tbl-1-' + lista + '-' + (i + 1) + '" onchange="fn_calcularValor(this)" data-validar="0" data-param="' + data[j]["ID_PARAMETRO"] + '" disabled>';
                                        tr += '        <option value="0">Seleccionar</option>';
                                        var listaD = data[j]["listaDetalle"];
                                        for (var m = 0; m < listaD.length; m++) {
                                            tr += '<option value="' + listaD[m]["NOMBRE_DETALLE"] + '">' + listaD[m]["NOMBRE_DETALLE"] + '</option>';
                                        }
                                        tr += '</select>';
                                    } else {
                                        tr += '<select class="form-control form-control-sm" id="cbo-det-tbl-1-' + lista + '-' + (i + 1) + '" onchange="fn_calcularValor(this)" data-validar="0" data-param="' + data[j]["ID_PARAMETRO"] + '" disabled>';
                                        tr += '        <option value="0">Seleccionar</option>';
                                        var listaD = data[j]["listaDetalle"];
                                        for (var m = 0; m < listaD.length; m++) {
                                            tr += '<option value="' + listaD[m]["ID_DETALLE"] + '">' + listaD[m]["NOMBRE_DETALLE"] + '</option>';
                                        }
                                        tr += '</select>';
                                    }
                                } else {
                                    lista++;
                                    tr += '<select class="form-control form-control-sm" id="cbo-det-tbl-1-' + lista + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" disabled>';
                                    tr += '        <option value="0">Seleccionar</option>';
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
                                        tr += '<input class="form-control form-control-sm text-center" type="date" placeholder="" id="fch-det-tbl-1-' + fecha + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" readonly>';
                                    } else {
                                        texto++;
                                        if (data[j]["VERIFICABLE"] == 0) {
                                            tr += '<input class="form-control form-control-sm text-center" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" readonly>';
                                        } else {
                                            tr += '<input class="form-control form-control-sm text-center" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (i + 1) + '" onBlur="fn_calcularValor(this)" data-validar="0" data-param="' + data[j]["ID_PARAMETRO"] + '" readonly>';
                                        }
                                    }
                                } else {
                                    texto++;
                                    tr += '<input class="form-control form-control-sm text-center" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" readonly>';
                                }
                                tr += '    </div>';
                                tr += '</td>'
                            }
                        }
                        tr += '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr += '     <div class="btn-group">';
                        tr += '          <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr += '          <div class="dropdown-menu dropdown-menu-right">';
                        //tr += '               <a class="dropdown-item agregarCampos" href="#"><i class="fas fa-plus-circle"></i>&nbsp;Agregar</a>';
                        tr += '               <a class="dropdown-item quitarCampos" href="#" onclick="fn_eliminarRestarTotal()"><i class="fas fa-minus-circle"></i>&nbsp;Eliminar</a>';
                        tr += '          </div>';
                        tr += '     </div>';
                        tr += '</td>';
                        tr += '</tr>';
                        $("#cuerpoTablaIndicador").append(tr);
                    }
                }
            } else {

            }
        }
    });
}


function CargarDatosExcel(data) {

    CargarCuerpoGuardado(data.length);
    var total = 0.0;
    for (var i = 0; i < data.length; i++) {
        var lista = 0;
        var texto = 0;
        var fecha = 0;
        var entidad = data[i]["listaInd"]
        $("#cuerpoTablaIndicador #detalles-tr-" + (i + 1)).attr({ "data-ind": data[i]["ID_INDICADOR"] });

        var fila = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + (i + 1)).find("[data-param]");
        fila.each(function (index, value) {
            var valor = entidad[index]["VALOR"];
            if (!isNaN(valor)) if (valor - Math.floor(valor) != 0) valor = Math.round(valor * 100) / 100
            if (entidad[index]["ID_PARAMETRO"] == 11) total += valor;
            $("#" + $(value).attr("id")).val(valor);
            index++;
        });
        $("#total-detalle").html("").append((Math.round(total * 100) / 100));
        $("#total-detalle2").html("").append((Math.round(total * 100) / 100));
        $("#cuerpoTablaIndicador").data("total", total);

    }

}




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

    if ($("#revision").val() == 1) {
        //debugger;
        CargarDetalleIndicadorRevision();
    } else {
        //CargarDetalleIndicador();
        CargarDatosCabecera();
        //CargarCuerpoGuardado(1);
    }

    asignarRuta($("#cbo-enfoque").val());
    $('[data-toggle="tooltip"]').tooltip();
    CargarDatosIniciativa();
    fn_cargarUbicacion();
    fn_cargarEnergetico();
    fn_cargarGei();

    $(document).on("mouseover", "#cuerpoTablaIndicador tr", function () {

        var fila = $(this).find('th:eq(0)').html();

        console.log(fila);
        $("#tablaIndicador").data("fila", fila);
    });

    $(document).on("click", ".agregarCampos", function (e) {
        e.preventDefault();
        CargarSoloTablaIndicador();
    })

    fn_actualizaCampana();
    enLinea();

});

$(document).on("change", "#cbo-enfoque", function () {
    $("#total-detalle").html("").append(0.00);
    $("#cuerpoTablaIndicador").data("total", 0);
    $("#cuerpoTablaIndicador").data("delete", "");
    var enfoque = $("#cbo-enfoque").val();
    if (enfoque == 1) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/4.1 Plantilla_Vehiculos_electricos_Recorrido.xlsm" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 2) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/4.1 Plantilla_Vehiculos_hibridos_Recorrido.xlsm" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 3) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/4.1 Plantilla_Vehiculos_electricos_Consumo.xlsm" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 4) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/4.1 Plantilla_Vehiculos_hibridos_consumo.xlsm" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 5) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/3.2 Plantilla_Generacion_Distribuida.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 6) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/3.1 Plantilla_RER_Conectado.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 7) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/2.2 Plantilla_Electrificacion_Rural.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 10) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.7 Plantilla_Lamparas_de_alumbrado_publico.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 11) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.6 Plantilla_Reemplazo_de_lamparas_de_sector_publico.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 12) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.5 Plantilla_Iluminacion_residencial.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 13) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.3 Plantilla_Eficiencia_energetica_comercial.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 14) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.2 Plantilla_Eficiencia_energetica_en_el_sector_industrial_Motor.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    }
    $('[data-toggle="tooltip"]').tooltip();
    CargarDatosCabecera();
    CargarDatosGuardados();
});


function fn_eliminarArchivo(id) {
    var eliminar = $("#total-documentos").data("eliminarfile") + id + ",";
    $("#total-documentos").data("eliminarfile", eliminar);
    var cantidad = $("#total-documentos").data("cantidad") - 1;
    $("#total-documentos").data("cantidad", cantidad);
    $("#total-documentos").html($("#total-documentos").data("cantidad") + storedFiles.length);
    $("#eliminar-" + id).remove();
}

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
                    $("#archivos-documentos").html("");
                    $("#archivos-guardados").html("");
                    for (var i = 0; i < data.length; i++) {

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
                        tr += '             <div class="input-group-prepend"><span class="input-group-text"><i class="fas ' + extension + '"></i></span></div><span class="form-control-plaintext">' + data[i]["ADJUNTO_BASE"] + '</span>';
                        tr += '             <div class="input-group-append"><span class="input-group-text cursor-pointer"><i class="far fa-trash-alt" onclick="fn_eliminarArchivo(' + data[i]["ID_INICIATIVA_SUSTENTATORIO"] + ')"></i></span></div>';
                        tr += '    </div>';
                        $("#archivos-guardados").append(tr);
                    }
                    $("#total-documentos").data("cantidad", data.length);
                }
            }
        }
    });
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



function fn_procesoDetalleIndicador(url, estado) {
    indicadores = [];
    documentos = [];
    var medida = $("#Control").data("mitigacion");
    var enfoque = $("#cbo-enfoque").val();
    var parametros = "";
    var n = $("#tablaIndicador").find("tbody").find("th").length + 1;
    debugger;
    for (var fila = 1 ; fila < n; fila++) {
        var enfoque = $("#cbo-enfoque").val();
        var ind = $("#cuerpoTablaIndicador #detalles-tr-" + fila).data("ind");
        var filas = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + fila).find("[data-param]");
        if (fn_validarCampoReg(fila)) {
            filas.each(function (index, value) {
                debugger;
                parametros += enfoque + ",";
                parametros += medida + ",";
                parametros += $(value).attr("data-param") + ",";
                parametros += $("#" + $(value).attr("id")).val() + "|";
            });
            parametros = parametros.substring(0, parametros.length - 1);
            parametros += ";" + ind;
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


    var archivos = "";
    for (var i = 0, len = storedFiles.length; i < len; i++) {
        archivos += storedFiles[i].name + "|";
    }
    if (archivos == "") archivos = "|";

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
        DATA: parametros,
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
        data: ({
            ID_INICIATIVA: $("#Control").data("iniciativa"),
            ID_USUARIO: $("#Control").data("usuario"),
            NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
            ID_INDICADOR_DELETE: id_delete,
            ID_INDICADOR_ELIMINAR: id_eliminar,
            ID_ESTADO: estado,
            ID_ENFOQUE: enfoque,
            ID_MEDMIT: medida,
            DATA: parametros,
            ID_TIPO_INGRESO: 2,
            //ListaIndicadores: indicadores,
            //ListaIndicadoresData: indicadores,
            ListaSustentos: documentos,
            extra: archivos
        }),
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
                    var msj = '                   <div class="col-sm-12 col-md-12 col-lg-12" id="mensajeWarningAvance">';
                    msj = msj + '                       <div class="alert alert-warning d-flex align-items-stretch" role="alert">';
                    msj = msj + '                            <div class="alert-wrap mr-3">';
                    msj = msj + '                                <div class="sa">';
                    msj = msj + '                                    <div class="sa-warning">';
                    msj = msj + '                                        <div class="sa-warning-body"></div>';
                    msj = msj + '                                        <div class="sa-warning-dot"></div>';
                    msj = msj + '                                    </div>';
                    msj = msj + '                                </div>';
                    msj = msj + '                            </div>';
                    msj = msj + '                            <div class="alert-wrap">';
                    msj = msj + '                                <h6>Sus avances fueron guardados</h6>';
                    msj = msj + '                                <hr>Recuerde, podrá solicitar una revisión una vez complete todos los campos obligatorios.';
                    msj = msj + '                            </div>';
                    msj = msj + '                        </div>';
                    msj = msj + '                    </div>';
                    $("#guardar-avance #modalAvanceBoton").hide();
                    $("#pieCorrectoAvance").show();
                    $('#mensajeModalAvance').append(msj);
                } else if (estado == 1 || estado == 5) {
                    $('#mensajeModalRegistrar #mensajeGoodRegistro').remove();
                    $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
                    var msj = '                       <div class="alert alert-success d-flex align-items-stretch" role="alert" id="mensajeGoodRegistro">';
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
                    msj = msj + '                                <hr><small class="mb-0">Los datos de su detalle de indicadores fueron guardados exitosamente, espere la aprobación del especialista para continuar. En breve le notificaremos el estado de su solicitud de revisión.</small>';
                    msj = msj + '                            </div>';
                    msj = msj + '                        </div>';
                    $("#solicitar-revision #modalRegistrarBoton").hide();
                    $("#pieCorrecto").show();
                    $('#mensajeModalRegistrar').append(msj);
                    $("#Control").data("modal", 1);
                    if (response.extra == "1") {
                        if (ws != null) ws.send(response.extra);
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
                    msj = msj + '                                <h6>Error</h6>';
                    msj = msj + '                                <hr>Ocurrio un error durante el proceso de guardado del avance.';
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



    $("#solicitar-revision").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
        } else {
            $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
            $("#solicitar-revision #modalRegistrarBoton").show();
            $("#pieCorrecto").hide();
        }
    });

    $("#guardar-avance").on("hidden.bs.modal", function () {
        $("#mensajeModalAvance #mensajeDangerAvance").remove();
        $("#mensajeModalAvance #mensajeWarningAvance").remove();
        $("#guardar-avance #modalAvanceBoton").show();
        $("#pieCorrectoAvance").hide();
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
            if (data != null && data != "") {
                if (data.length > 0) {
                    var order = $("#tablaIndicador").data("order");
                    CargarCuerpoGuardado(data.length);
                    var total = 0.0;
                    for (var i = 0; i < data.length; i++) {
                        var lista = 0;
                        var texto = 0;
                        var fecha = 0;
                        var entidad = data[i]["listaInd"]
                        $("#cuerpoTablaIndicador #detalles-tr-" + (i + 1)).attr({ "data-ind": data[i]["ID_INDICADOR"] });
                        //for (var j = 0; j < entidad.length; j++) {     
                        for (var m = 0; m < entidad.length; m++) {
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
                                    $("#txt-det-tbl-1-" + texto + "-" + (i + 1)).val(entidad[m]["VALOR"]);
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
                    }
                    $("#total-detalle").html("").append((Math.round(total * 100) / 100));
                    $("#total-detalle2").html("").append((Math.round(total * 100) / 100));
                    $("#cuerpoTablaIndicador").data("total", total);
                    //$("#cuerpoTablaIndicador").data("row", data.length);
                }
            } else {
                CargarCuerpoGuardado(1);
                $("#total-detalle").html("").append(0.00);
                $("#total-detalle2").html("").append(0.00);
                //cargarCuerpoTabla($("#cbo-enfoque").val());
                //$("#total-detalle").append('<strong id="total">0.00 tCO<sub>2</sub>eq</strong>');
                //$("#total-detalle2").append('<strong id="total2">0.00 tCO<sub>2</sub>eq</strong>');
            }
        }
    });

}



function fn_validarCampoReg(f) {
    //var campos = $("#enfoque-" + $("#cbo-enfoque").val()).find("tbody").find("#detalles-tr-" + f).find("[data-validar]");
    var v = true;
    //var campos = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + f).find("[data-validar]");
    //campos.each(function (index, value) {
    //    console.log(index + " + " + $(value).attr("id") + " + " + $(value).attr("data-validar"));

    //    if ($(value).attr("data-validar") == 0) {
    //        v = false;
    //    }

    //});
    return v;
}

function asignarRuta(enfoque) {
    
    if (enfoque == 1) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/4.1 Plantilla_Vehiculos_electricos_Recorrido.xlsm" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 2) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/4.1 Plantilla_Vehiculos_hibridos_Recorrido.xlsm" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 3) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/4.1 Plantilla_Vehiculos_electricos_Consumo.xlsm" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 4) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/4.1 Plantilla_Vehiculos_hibridos_consumo.xlsm" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 5) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/3.2 Plantilla_Generacion_Distribuida.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 6) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/3.1 Plantilla_RER_Conectado.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 7) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/2.2 Plantilla_Electrificacion_Rural.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 10) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.7 Plantilla_Lamparas_de_alumbrado_publico.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 11) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.6 Plantilla_Reemplazo_de_lamparas_de_sector_publico.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 12) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.5 Plantilla_Iluminacion_residencial.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 13) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.3 Plantilla_Eficiencia_energetica_comercial.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 14) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.2 Plantilla_Eficiencia_energetica_en_el_sector_industrial_Motor.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    }
    $('[data-toggle="tooltip"]').tooltip();
}