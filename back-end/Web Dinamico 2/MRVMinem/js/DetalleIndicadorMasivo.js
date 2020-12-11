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
                        } else {
                            $("#txt-monto-inversion").val("------");//add 030620
                        }



                        if ($("#Control").data("revision") == 0) {
                            //$("#cbo-moneda").val(data[i]["ID_MONEDA"]);

                            if (data[i]["MONEDA"] != null) {
                                $("#txt-moneda").val(data[i]["MONEDA"]);
                            } else {
                                $("#txt-moneda").val("------");
                            }

                            if (data[i]["FECHA"].toString() != "01/01/0001") {
                                $("#txt-fecha-inicio").val(data[i]["FECHA_EDITAR"]);
                                //$("#txt-fecha-inicio").val("2019-12-12"); FORMATO EJEMPLO PARA CARGA
                            }
                            if (data[i]["FECHA_FIN"].toString() != "01/01/0001") {
                                $("#txt-fecha-fin").val(data[i]["FECHA_EDITAR_FIN"]);
                            }
                        } else {
                            $("#emisorObservacion").append($("#Control").data("nombres"));
                            //$("#txt-moneda").val(data[i]["MONEDA"]);

                            if (data[i]["MONEDA"] != null) {
                                $("#txt-moneda").val(data[i]["MONEDA"]);
                            } else {
                                $("#txt-moneda").val("------");
                            }

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
                    var msj = '<textarea class="form-control-plaintext" id="txa-ubicacion" aria-describedby="inputGroup9" cols="30" rows="8" readonly placeholder="Ingrese una descripción para su acción de mitigación">';
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
                    var msj = '<textarea class="form-control-plaintext" id="mlt-energetico" aria-describedby="inputGroup9" cols="30" rows="5" readonly placeholder="Ingrese una descripción para su acción de mitigación">';
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
        llenarTabla(datat, j);
    });
}

function llenarTabla(data, j) {
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

//function fn_validarCampo(url, estado) {
//    var url = baseUrl + "Gestion/ValidarDetalleIndicador";
//    var item = {
//        ID_INICIATIVA: $("#Control").data("iniciativa")
//    }
//    var respuesta = MRV.Ajax(url, item, false);
//    if (respuesta.success) {
//        
//        var cantidad_bd = parseInt(respuesta.extra);
//        if (cantidad_bd > 0) {
//            if ($("#cuerpoTablaIndicador").data("delete") == "") {
//                fn_procesoDetalleIndicador(url, estado);
//            } else {
//                var id_delete = $("#cuerpoTablaIndicador").data("delete");
//                var cant_delete = id_delete.split(',');
//                var cantidad_del = cant_delete.length;
//                if (cantidad_bd > cantidad_del) {
//                    fn_procesoDetalleIndicador(url, estado);
//                } else {
//                    if ($("#tablaIndicador").find("tbody").find("th") > 0) {
//                        var validar = 0;
//                        var campos = $("#tablaIndicador").find("tbody").find("tr");
//                        campos.each(function (index, value) {
//                            
//                            console.log(index + " + " + $(value).attr("id") + " + " + $(value).attr("data-validar"));
//                            if ($(value).find("td").find("[data-param]").val() != ""){
//                                validar = 1;
//                            }
//                            if ($(value).attr("data-validar") == 0) {
//                                v = false;
//                            }

//                        });

//                        if (validar == 1) {
//                            fn_procesoDetalleIndicador(url, estado);
//                        } else {
//                            fn_mensajeCompletar();
//                        }                        
//                    } else {
//                        fn_mensajeCompletar();
//                    }
//                }
//            }            
//        } else {
//            if ($("#tablaIndicador").find("tbody").find("th") > 0) {
//                fn_procesoDetalleIndicador(url, estado);
//            } else {
//                fn_mensajeCompletar();
//            }
//        }
//    } else {

//    }

//}

function fn_guardarDetalleIndicador() {
    var url = baseUrl + "Gestion/RegistrarDetalleIndicador";
    fn_validarArchivo(url, 1);
    //fn_procesoDetalleIndicador(url, 1);
    //fn_validarCampo(url, 1);      
}

function fn_guardarAvances() {
    var url = baseUrl + "Gestion/RegistrarDetalleIndicador";
    fn_procesoDetalleIndicador(url, 0);
}

function fn_corregirDetalleIndicador() {
    var url = baseUrl + "Gestion/RegistrarDetalleIndicador";
    fn_validarArchivo(url, 5);
    //fn_procesoDetalleIndicador(url, 5);
    //fn_validarCampo(url, 5);
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
        msj1 = msj1 + '         Se ha generado la cadena de bloques para la medida de mitigación&nbsp;<strong>aprobada&nbsp; <br></strong><a class="btn btn-warning px-5 text-center my-3" href="#" onclick="fn_descargarCertificado(' + respuesta.extra + ');" data-toggle="modal"><i class="fas fa-download px-1"></i>Descargar certificado</a>';
        msj1 = msj1 + '         <hr>';
        msj1 = msj1 + '         <div class="text-monospace" style="word-break: break-all;">' + respuesta.extra2 + '</div>';
        msj1 = msj1 + '     </small>';
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
        msj1 = msj1 + '         Se ha generado la cadena de bloques para la medida de mitigación&nbsp;<strong>aprobada&nbsp; <br></strong><a class="btn btn-warning px-5 text-center my-3" href="#" onclick="fn_descargarCertificado(' + respuesta.extra + ');" data-toggle="modal" data-target=""><i class="fas fa-download px-1"></i>Descargar certificado</a>';
        msj1 = msj1 + '         <hr>';
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
    $("#tbl-main-preload").html("<i Class='fas fa-spinner fa-spin px-1'></i> Cargando...");
    $("#tbl-main").addClass("d-none");
    $.ajax({
        url: baseUrl + 'Gestion/ListarCabeceraIndicador',
        //type: 'POST',
        //datatype: 'json',
        //data: item,

        type: "POST",
        //url: nurl,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        //async: false,
        data: JSON.stringify(item),

        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var tr = "";
                    tr += '<tr class="bg-primary text-white">';
                    //tr += `     <th class="text-center ${medida == 4 ? 'grupo-columna-02' : 'grupo-columna-03'}" scope="col"><span>N°</span></th>`;
                    tr += `<th class="text-center ${medida == 4 ? 'grupo-columna-02' : 'grupo-columna-03'}" scope="col"><div class="d-flex flex-column justify-content-between align-items-center"><div class="d-flex justify-content-center align-items-center">N°&nbsp;</div><div class="d-flex justify-content-center align-items-center"><i class="fas fa-info-circle mr-1" data-toggle="tooltip" data-placement="right" title="Número"></i></div></div></th>`;
                    for (var i = 0; i < data.length; i++) {
                        var columna = "0" + data[i]["ID_GRUPO_INDICADOR"];
                        var descripcion = "";
                        //if (data[i]["COMBINACION_UNIDAD"] == "" || data[i]["COMBINACION_UNIDAD"] == null) {
                        //    if (data[i]["PREFIJO"] != null) {
                        //        descripcion += data[i]["PREFIJO"];
                        //    }
                        //    if (data[i]["UNIDAD"] != null) {
                        //        descripcion += data[i]["UNIDAD"];
                        //    }
                        //    if (data[i]["DESCRIPCION_UNIDAD"] != null) {
                        //        descripcion += data[i]["DESCRIPCION_UNIDAD"];
                        //    }
                        //    if (descripcion == 0) {
                        //        descripcion = "";
                        //    } else {
                        //        descripcion = "(" + descripcion + ")";
                        //    }
                        //} else {
                        //    descripcion = "(" + data[i]["COMBINACION_UNIDAD"] + ")";
                        //}

                        descripcion = data[i]["COMBINACION_UNIDAD"] == "" || data[i]["COMBINACION_UNIDAD"] == null ? '' : data[i]["COMBINACION_UNIDAD"];

                        //if (data[i]["ID_PARAMETRO"] == 9 || data[i]["ID_PARAMETRO"] == 10 || data[i]["ID_PARAMETRO"] == 11) {
                        //    tr += '     <th class="text-center grupo-columna-'+ columna +'" scope="col"><span>' + data[i]["NOMBRE_PARAMETRO"] + ' tCOeq</span><small>Seleccione este campo para su registro</small></th>';
                        //}else{

                        //if (data[i]["LEYENDA_PARAMETRO"] == null || data[i]["LEYENDA_PARAMETRO"] == "") {
                        //    tr += '     <th class="text-center grupo-columna-' + columna + '" scope="col" data-placement="top"><span>' + data[i]["NOMBRE_PARAMETRO"] + '&nbsp;</span><span>' + descripcion + '</span><small>' + data[i]["DESCRIPCION_PARAMETRO"] + '</small></th>';
                        //} else {
                        //    tr += '     <th class="text-center grupo-columna-' + columna + '" scope="col" data-toggle="tooltip" data-placement="top" title="' + data[i]["LEYENDA_PARAMETRO"] + '"><span>' + data[i]["NOMBRE_PARAMETRO"] + '&nbsp;</span><span>' + descripcion + '</span><small>' + data[i]["DESCRIPCION_PARAMETRO"] + '</small></th>';
                        //}
                        //tr += '     <th class="text-center grupo-columna-' + columna + '" scope="col" data-toggle="tooltip" data-placement="top" title="Texto descriptivo de ayuda"><span>' + data[i]["NOMBRE_PARAMETRO"] + '&nbsp;</span><span>' + descripcion + '</span><small>' + data[i]["DESCRIPCION_PARAMETRO"] + '</small></th>';
                        //} 

                        var tool = "";
                        if (data[i]["LEYENDA_PARAMETRO"] == null || data[i]["LEYENDA_PARAMETRO"] == "")
                            tool = "";
                        else
                            tool = data[i]["LEYENDA_PARAMETRO"];

                        let filtro = "";
                        if (medida == 4)
                            filtro = data[i]["ENERGIA_TOTAL"] == '1' || data[i]["ID_PARAMETRO"] == '11' ? `<span class="miColumna"><i class="fas fa-sort" style="color: lightgray" id="VALOR-${data[i]["ID_PARAMETRO"]}" data-valor="IDA.VALOR" data-order="ASC" data-parametro="${data[i]["ID_PARAMETRO"]}"></i></span>` : '';

                        //tr += `     <th class="text-center grupo-columna-${columna} ${data[i]["VISIBLE"] == '0' ? 'd-none' : ''}" scope="col"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="${tool}"></i>${data[i]["NOMBRE_PARAMETRO"]}&nbsp;</span><span>${descripcion}</span></th>`;
                        tr += `<th class="text-center grupo-columna-${columna} ${data[i]["VISIBLE"] == '0' ? 'd-none' : ''}"><div class="d-flex flex-column justify-content-between align-items-center"><div class="d-flex justify-content-center align-items-center">${data[i]["NOMBRE_PARAMETRO"]} &nbsp;${descripcion}${filtro}</div><div class="d-flex justify-content-center align-items-center"><i class="fas fa-info-circle mr-1" data-toggle="tooltip" data-placement="right" title="${tool}"></i></div></div></th>`;
                        //tr += '     <th class="text-center grupo-columna-' + columna + '" scope="col"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="' + tool + '"></i>' + data[i]["NOMBRE_PARAMETRO"] + '&nbsp;</span><span>' + descripcion + '</span><small>' + data[i]["DESCRIPCION_PARAMETRO"] + '</small></th>';

                    }
                    //tr += '     <th class="text-center" scope="col">Más</th>';
                    //tr += '<th class="text-center grupo-columna-03" scope="col"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="Si desea subir un archivo de más de 4MB, contactar con el administrador"></i>Documentos de sustento</span></th>';
                    tr += `<th class="text-center grupo-columna-03"><div class="d-flex flex-column justify-content-between align-items-center"><div class="d-flex justify-content-center align-items-center">Sustento &nbsp;</div><div class="d-flex justify-content-center align-items-center"><i class="fas fa-info-circle mr-1" data-toggle="tooltip" data-placement="right" title="Si desea subir un archivo de más de 4MB, contactar con el administrador"></i></div></div></th>`;
                    if (medida != 12 && medida != 4 && enfoque != 9 && enfoque != 6)
                        //tr += '<th class="text-center grupo-columna-03"><span><i class="fas fa-question-circle mr-1" data-toggle="tooltip" data-placement="right" title="Verificar acumulado"></i></span><br>Ver</th>';
                        tr += `<th class="text-center grupo-columna-03"><div class="d-flex flex-column justify-content-between align-items-center"><div class="d-flex justify-content-center align-items-center">Ver &nbsp;</div><div class="d-flex justify-content-center align-items-center"><i class="fas fa-info-circle mr-1" data-toggle="tooltip" data-placement="right" title="Verificar acumulado"></i></div></div></th>`;

                    tr += '</tr>';
                    $("#cabeceraTablaIndicador").append(tr);
                    $("[data-toggle='tooltip']").tooltip();
                }
            }
            //$('[data-toggle="tooltip"]').tooltip();
        },
        failure: function (msg) {
            console.log(msg);
        },
        error: function (xhr, status, error) {
            console.log(error);
            location.href = baseUrl + "Home/login";
        }
    });

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
                                        //tr += '<select class="form-control form-control-sm" id="cbo-det-tbl-1-' + lista + '-' + (i + 1) + '" onchange="fn_calcularValor(this)" data-validar="0" data-param="' + data[j]["ID_PARAMETRO"] + '" disabled>';
                                        tr += `<select class="form-control form-control-sm ${data[j]["VALIDAR_IMPLEMENTADO"] == '1' ? 'validar-implementado' : ''}" id="cbo-det-tbl-1-${lista}-${(i + 1)}" onchange="fn_calcularValor(this)" data-validar="0" data-param="${data[j]["ID_PARAMETRO"]}" disabled>`;
                                        tr += data[j]["listaDetalle"].length > 1 ? '<option value="0">Seleccionar</option>' : '';
                                        //tr += '        <option value="0">Seleccionar</option>';
                                        var listaD = data[j]["listaDetalle"];
                                        for (var m = 0; m < listaD.length; m++) {
                                            tr += '<option value="' + listaD[m]["ID_DETALLE"] + '">' + listaD[m]["NOMBRE_DETALLE"] + '</option>';
                                        }
                                        tr += '</select>';
                                    }
                                } else {
                                    lista++;
                                    //tr += '<select class="form-control form-control-sm" id="cbo-det-tbl-1-' + lista + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" disabled>';
                                    tr += `<select class="form-control form-control-sm ${data[j]["VALIDAR_IMPLEMENTADO"] == '1' ? 'validar-implementado' : ''}" id="cbo-det-tbl-1-${lista}-${(i + 1)}" data-param="${data[j]["ID_PARAMETRO"]}" disabled>`;
                                    //if (data[j]["ID_PARAMETRO"] != 72 && data[j]["ID_PARAMETRO"] != 73 && data[j]["ID_PARAMETRO"] != 74 && data[j]["ID_PARAMETRO"] != 77 && data[j]["ID_PARAMETRO"] != 30 && data[j]["ID_PARAMETRO"] != 93 && data[j]["ID_PARAMETRO"] != 94 && data[j]["ID_PARAMETRO"] != 95) tr += '        <option value="0">Seleccionar</option>'; //add
                                    tr += data[j]["listaDetalle"].length > 1 ? '<option value="0">Seleccionar</option>' : '';
                                    //tr += '        <option value="0">Seleccionar</option>';
                                    var listaD = data[j]["listaDetalle"];
                                    for (var m = 0; m < listaD.length; m++) {
                                        tr += '<option value="' + listaD[m]["ID_DETALLE"] + '">' + listaD[m]["NOMBRE_DETALLE"] + '</option>';
                                    }
                                    tr += '</select>';
                                }
                            } else if (data[j]["ID_TIPO_CONTROL"] == 2) {
                                //tr += '<td data-encabezado="Columna 02">';
                                tr += `<td data-encabezado="Columna 02" class="${data[j]["EDITABLE"] == '0' ? data[j]["ID_PARAMETRO"] != 11 ? data[j]["VISIBLE"] == '0' ? 'd-none' : '' : '' : ''}">`;
                                tr += '    <div class="form-group m-0">';
                                if (data[j]["EDITABLE"] == 1) {
                                    if (data[j]["ID_TIPO_DATO"] == 1) {
                                        fecha++;
                                        tr += '<input class="form-control form-control-sm text-center" type="date" placeholder="" id="fch-det-tbl-1-' + fecha + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" readonly>';
                                    } else {
                                        texto++;
                                        if (data[j]["VERIFICABLE"] == 0) {
                                            tr += `<input class="form-control form-control-sm text-center ${data[j]["ID_TIPO_DATO"] == 2 ? data[j]["V_DECIMAL"] == '1' ? 'formato-num' : 'solo-numero' : ''}" type="text" placeholder="" id="txt-det-tbl-1-${texto}-${(i + 1)}" data-param="${data[j]["ID_PARAMETRO"]}" readonly>`;
                                        } else {
                                            tr += `<input class="form-control form-control-sm text-center ${data[j]["ID_TIPO_DATO"] == 2 ? data[j]["V_DECIMAL"] == '1' ? 'formato-num' : 'solo-numero' : ''}" type="text" placeholder="" id="txt-det-tbl-1-${texto}-${(i + 1)}" onBlur="fn_calcularValor(this)" data-validar="0" data-param="${data[j]["ID_PARAMETRO"]}" readonly>`;
                                        }
                                    }
                                } else {
                                    texto++;
                                    //tr += '<input class="form-control form-control-sm text-center" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '" readonly>';
                                    tr += `<input class="form-control form-control-sm text-center ${data[j]["ENERGIA_TOTAL"] == '1' ? 'energia-total' : ''}" type="text" placeholder="" id="txt-det-tbl-1-${texto}-${(i + 1)}" data-param="${data[j]["ID_PARAMETRO"]}" readonly>`;
                                }
                                tr += '    </div>';
                                tr += '</td>'
                            }
                        }

                        var urlDw = baseUrl + 'Gestion/FileDownload?IdIniciativa=' + $("#iniciativa_mit_ID_INICIATIVA").val() + '&IdIndicador=' + (i + 1) + "&accion=I";

                        if (xIndicador > 0) {
                            urlDw = baseUrl + 'Gestion/FileDownloadDetalle?IdIniciativa=' + $("#iniciativa_mit_ID_INICIATIVA").val() + '&IdIndicador=' + xIndicador + "&accion=M";
                        }

                        tr += '<td class="text-center" data-encabezado="Sustento">';
                        tr += '        <label class="btn btn-secondary btn-sm m-0" for="fle-doc-' + (i + 1) + '" title="Cargar archivo"><i class="fas fa-upload"></i>';
                        tr += '         <input class="d-none" type="file" id="fle-doc-' + (i + 1) + '" name="fledoc" onchange="handleFileSustento(this.files,' + (i + 1) + ',1)">';
                        tr += '        </label><a class="btn btn-success btn-sm m-0" name="fledownload" href="' + urlDw + '" title="Descargar archivo" id="fle-dow-' + (i + 1) + '" target="_blank" style="display: none;"><i class="fas fa-download"></i></a>';
                        tr += '</td>';
                        if (medida != 12 && medida != 4 && enfoque != 9 && enfoque != 6)
                        tr += '<td class="text-center estrecho" data-encabezado="Verificar acumulado"><span data-toggle="modal" data-target="#modal-acumulado"><a class="btn btn-purple btn-sm m-0 quitarCampos" href="#" title="Verificar acumulado" onclick="mostrarAcumulado();"><i class="fas fa-eye"></i></a></span></td>';

                        tr += '</tr>';
                        $("#cuerpoTablaIndicador").append(tr);
                    }
                }
            } else {

            }
        }
    });
}


function handleFileSustento(evt, idIndicador, accion) {
    console.log(evt);

    detalleFiles = []; // add 12-02-2020
    ////////////////////////77
    var files = evt; //evt.target.files; // FileList object
    // files is a FileList of File objects. List some properties.
    var output = [];
    var extension = "fa-file-word";
    var name = "";
    var file_extension = "";
    for (var i = 0, f; f = files[i]; i++) {
        name = f.name;
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
                            $("#fle-dow-" + idIndicador).removeAttr('style');
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

function CargarDatosExcel(data) {
    CargarCuerpoGuardado(data.length, 0);
    var total = 0.0;
    let validar_error = 0; //ad 08-09-20
    //for (var i = 0; i < data.length; i++) {
    for (var i = 0; i < data.length; i++) {
        var validar = 0;
        var lista = 0;
        var texto = 0;
        var fecha = 0;
        var entidad = data[i]["listaInd"];
        var entidad_a = data[i]["listaAcumulado"];
        $("#cuerpoTablaIndicador #detalles-tr-" + (i + 1)).attr({ "data-ind": data[i]["ID_INDICADOR"] });

        var fila = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + (i + 1)).find("[data-param]");
        fila.each(function (index, value) {
            if (entidad[index]["extra"] == '1') {
                validar = 1;
            }
            var valor = entidad[index]["VALOR"];
            if (!isNaN(valor)) if (valor - Math.floor(valor) != 0) valor = Math.round(valor * 100) / 100
            if (entidad[index]["ID_PARAMETRO"] == 11) total += parseFloat(valor);

            //===============================================================
            var m = $(value).attr("id");
            m = m.substring(0, 3);
            if (m == "txt") {
                if (!isNaN(valor)) {
                    //$("#" + $(value).attr("id")).val(formatoMiles(valor));
                    if ($("#" + $(value).attr("id"))[0].className.indexOf("solo-numero") != -1)
                        $("#" + $(value).attr("id")).val(formatoMilesSoloNumero(valor));
                    else if ($("#" + $(value).attr("id"))[0].className.indexOf("formato-num") != -1)
                        $("#" + $(value).attr("id")).val(formatoMiles(valor));
                    else
                        $("#" + $(value).attr("id")).val(formatoMiles(valor));
                } else {
                    $("#" + $(value).attr("id")).val(valor);
                }
            } else {
                $("#" + $(value).attr("id")).val(valor);
            }
            //=================================================================

            //$("#" + $(value).attr("id")).val(valor);
            index++;
        });

        if (validar == 1) {
            $("#detalles-tr-" + (i + 1)).addClass("error-data");
            validar_error = 1;
        }

        // $("#total-detalle").html("").append(formatoMiles(Math.round(total * 100) / 100));
        //$("#total-detalle2").html("").append(formatoMiles(Math.round(total * 100) / 100));
        //$("#cuerpoTablaIndicador").data("total", total);

        // add 17-05-2018
        if (validar_error != 1) //add 08-09-20
            armarAcumulado(entidad_a, i + 1);

    }

    let resumen_total = 0.0, resumen_energia = 0.0, resumen_emisiones_potencial = 0.0, resumen_energia_total = 0.0;
    if ($("#Control").data("mitigacion") == 4) {
        $('#cuerpoTablaIndicador').find('.validar-implementado').each((x, y) => {
            //let emision = parseFloat($(y).parent().parent().parent().find('[data-param = 11]').val().replace(/,/gi, ''));
            //let energia = parseFloat($(y).parent().parent().parent().find('.energia-total').val().replace(/,/gi, ''));
            let emision = $(y).parent().parent().parent().find('[data-param = 11]').val();
            let energia = $(y).parent().parent().parent().find('.energia-total').val();
            emision = emision == "" ? 0 : parseFloat($(y).parent().parent().parent().find('[data-param = 11]').val().replace(/,/gi, ''));
            energia = energia == "" ? 0 : parseFloat($(y).parent().parent().parent().find('.energia-total').val().replace(/,/gi, ''));
            //resumen_emisiones_potencial += $(y).val() == null ? 0 : emision;
            //resumen_energia_total += $(y).val() == null ? 0 : energia;
            resumen_emisiones_potencial += emision;
            resumen_energia_total += energia;
            resumen_total += $(y).val() == null ? 0 : $(y).val() > 1 ? emision : 0;
            resumen_energia += $(y).val() == null ? 0 : $(y).val() > 1 ? energia : 0;
        });
        $("#total-detalle").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
        $("#total-detalle2").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
        $("#total-detalle-energia").html("").append(formatoMiles(Math.round(resumen_energia * 100) / 100));
        $("#cuerpoTablaIndicador").data("total", resumen_total);

        //potencial
        $("#total-detalle-emisiones-2").html("").append(formatoMiles(resumen_emisiones_potencial));
        $("#total-detalle-energia-2").html("").append(formatoMiles(resumen_energia_total));
    } else {
        $('[id^=acum-]').each((x, y) => {
            resumen_total += parseFloat($(y).html().replace(/,/gi, ''));
        });
        $("#total-detalle").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
        $("#total-detalle2").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
        $("#total-detalle-energia").html("").append(formatoMiles(0.00));
        $("#cuerpoTablaIndicador").data("total", resumen_total);
    }

    //let resumen_total = 0.0;
    //$('[id^=acum-]').each((x, y) => {
    //    resumen_total += parseFloat($(y).html().replace(/,/gi, ''));
    //});
    //$("#total-detalle").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
    //$("#total-detalle2").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
    //$("#cuerpoTablaIndicador").data("total", resumen_total);

    $("#fledeclaracion").next().find("label").empty().html('<i class="fas fa-upload mr-1"></i> Subir plantilla');
}

//===============================================================

//==============================================================================================================

function GuardarIdDetalle() {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_MEDMIT: $("#Control").data("mitigacion"),
        ID_ENFOQUE: $("#cbo-enfoque").val()
    }
    $.ajax({
        url: baseUrl + 'Detalle/ListarCodIndicadores',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var id_eliminar = "";
                    for (var i = 0; i < data.length; i++) {
                        id_eliminar += data[i]["ID_INDICADOR"] + ",";
                    }
                    $("#cuerpoTablaIndicador").data("delete", id_eliminar);
                }
            }
        }
    });
}

//=================================================================

$(document).ready(function () {
    estiloblockpage();
    $('#modal-acumulado div div div div div h3').html('Verificación de acumulados por detalle');
    inicio();

    $("i[data-placement='top']").attr({ 'data-original-title': 'Puede seleccionar múltiples archivos, con un tamaño no superior a 4MB por archivo' });

    if ($("#iniciativa_mit_ID_INICIATIVA").val() > 0) {
        $("#Control").data("iniciativa", $("#iniciativa_mit_ID_INICIATIVA").val());
    } else {
        $("#Control").data("iniciativa", $("#identificador").val());
    }
    $("#Control").data("mitigacion", $("#medida_ID_MEDMIT").val());
    //$("#Control").data("iniciativa", $("#identificador").val());
    $("#Control").data("revision", $("#revision").val());

    if ($("#Control").data("mitigacion") == 4) {
        armarTablaAuditor();
        resumenPotencial();
    }
    //CargarSector();
    if ($("#revision").val() == 1) {
        CargarDetalleIndicadorRevision();
    } else {
        loadMoneda();

        CargarDatosCabecera();
        CargarDatosGuardados();

        GuardarIdDetalle();
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

    //fn_actualizaCampana();
    //enLinea();

});

$(document).on("change", "#cbo-enfoque", function () {
    $("#total-detalle").html("").append(0.00);
    $("#cuerpoTablaIndicador").data("total", 0);
    $("#cuerpoTablaIndicador").data("delete", "");
    var enfoque = $("#cbo-enfoque").val();
    if (enfoque == 1) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/4.1 Plantilla_Vehiculos_electricos_Recorrido.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
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
    } else if (enfoque == 8) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/2.1 Plantilla_Coccion_Lena.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 9) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/2.1 Plantilla Coccion limpia_vales_fise.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 10) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.7 Plantilla_Lamparas_de_alumbrado_publico.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 11) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.6 Plantilla_Reemplazo_de_lamparas_de_sector_publico.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 12) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.5 Plantilla_Iluminacion_residencial.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 13) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.3 Plantilla_Eficiencia_energetica_comercial.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 14) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.2 Plantilla_Eficiencia_energetica_sector_industrial_Motor.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 15) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.2 Plantilla_Eficiencia_energetica_ industrial_caldera.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 16) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_etiquetado_refrigeradoras.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 17) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_etiquetado_congeladoras.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 18) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_Lavadoras.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 19) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_Secadora.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 20) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_Motores Electricos.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 21) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_ Aire acondicionado.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 22) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_ Calentadores_ agua_GLP.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 23) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_ Calentadores_ agua_gas.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 24) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_ Calentadores_ agua_instantaneo.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 25) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.4 Plantilla_Auditoria_energetica.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    }
    $('[data-toggle="tooltip"]').tooltip();
    $("#cuerpoTablaIndicador").html("");
    $('#cuerpo-acumulado-total').html('');
    $('[id^=acum-]').each((x, y) => {
        $(y).html('0.00');
    });
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
                        tr += '             <div class="input-group-prepend"><span class="input-group-text"><i class="fas ' + extension + '"></i></span></div><span class="form-control-plaintext ww">' + data[i]["ADJUNTO_BASE"] + '</span>';
                        tr += '             <div class="input-group-append">';
                        tr += '                 <span class="input-group-text cursor-pointer mr-2" onclick="fn_verfilesutento(' + data[i]["ID_INICIATIVA_SUSTENTATORIO"] + ')"><i class="fas fa-download"></i></span>';
                        tr += '                 <span class="input-group-text cursor-pointer"><i class="far fa-trash-alt" onclick="fn_eliminarArchivo(' + data[i]["ID_INICIATIVA_SUSTENTATORIO"] + ')"></i></span>';
                        tr += '             </div>';
                        //tr += '             <div class="input-group-append"><span class="input-group-text cursor-pointer"><i class="far fa-trash-alt" onclick="fn_eliminarArchivo(' + data[i]["ID_INICIATIVA_SUSTENTATORIO"] + ')"></i></span></div>';
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

function visualizarArchivo(e) {
    var file = e.dataset.file;
    for (var i = 0; i < storedFiles.length; i++) {
        if (storedFiles[i].name === file) {
            descargarArchivo(storedFiles[i], storedFiles[i].name);
            break;
        }
    }
}

function descargarArchivo(contenidoEnBlob, nombreArchivo) {
    //creamos un FileReader para leer el Blob
    var reader = new FileReader();
    //Definimos la función que manejará el archivo
    //una vez haya terminado de leerlo
    reader.onload = function (event) {
        //Usaremos un link para iniciar la descarga 
        var save = document.createElement('a');
        save.href = event.target.result;
        save.target = '_blank';
        //Truco: así le damos el nombre al archivo 
        save.download = nombreArchivo || 'archivo.dat';
        var clicEvent = new MouseEvent('click', {
            'view': window,
            'bubbles': true,
            'cancelable': true
        });
        //Simulamos un clic del usuario
        //no es necesario agregar el link al DOM.
        save.dispatchEvent(clicEvent);
        //Y liberamos recursos...
        (window.URL || window.webkitURL).revokeObjectURL(save.href);
    };
    //Leemos el blob y esperamos a que dispare el evento "load"
    reader.readAsDataURL(contenidoEnBlob);
};

function fn_procesoDetalleIndicador(url, estado) {

    var num_validar = 0;
    if (estado == 1 || estado == 0) { num_validar = 8 }
    else if (estado == 5 || estado == 6) { num_validar = 11 }

    var mns = ValidarRevision('1', $("#Control").data("iniciativa"), num_validar, "mensajeDangerRegistro", "El detalle de esta acción de mitigación ya fue enviada para su revisión");
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
    var nom = "";
    let arrValores = []; //add 27-09-2020
    for (var fila = 1 ; fila < n; fila++) {
        var enfoque = $("#cbo-enfoque").val();
        var ind = $("#cuerpoTablaIndicador #detalles-tr-" + fila).data("ind");
        var filas = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + fila).find("[data-param]");
        var Xfilas = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + fila).find("input[name=fledoc]");
        var nomarchivo = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + fila).find("[data-nomarchivo]");//add 18-04-2020   

        if (fn_validarCampoReg(fila)) {
            let ListaValores = [], nom_t;
            filas.each(function (index, value) {
                let enfoque_t = enfoque;
                let medida_t = medida;
                let parametro_t = $(value).attr("data-param");
                let m = $(value).attr("id").substring(0, 3);
                let valor = m == "txt" ? $("#" + $(value).attr("id")).val().replace(/,/gi, '') : $("#" + $(value).attr("id")).val();
                valor = valor == "0" ? "" : valor;
                let objValores = {
                    ID_ENFOQUE: enfoque_t,
                    ID_MEDMIT: medida_t,
                    ID_PARAMETRO: parametro_t,
                    VALOR: valor
                }
                ListaValores.push(objValores);
            });

            nomarchivo.each(function (index, value) {
                nom = $("#" + $(value).attr("id")).val();
            });

            if (Xfilas != null && Xfilas != undefined)
                nom_t = Xfilas[0].files.length > 0 ? Xfilas[0].files[0].name : nom != "" ? nom : "";
            else
                nom_t = "";

            arrValores.push({
                ID_INDICADOR: ind,
                ADJUNTO: nom_t,
                listaInd: ListaValores
            });
        }
        //if (fn_validarCampoReg(fila)) {
        //    filas.each(function (index, value) {
        //        parametros += enfoque + ",";
        //        parametros += medida + ",";
        //        parametros += $(value).attr("data-param") + ",";

        //        //===============
        //        var m = $(value).attr("id");
        //        m = m.substring(0, 3);
        //        if (m == "txt") {
        //            var eva = $("#" + $(value).attr("id")).val().replace(/,/gi, '');
        //            parametros += eva + "|";
        //        } else {
        //            parametros += $("#" + $(value).attr("id")).val() + "|";
        //        }
        //        //==================

        //        //parametros += $("#" + $(value).attr("id")).val() + "|";
        //    });
        //    parametros = parametros.substring(0, parametros.length - 1);
        //    if (Xfilas != null && Xfilas != undefined) {
        //        if (Xfilas[0].files.length > 0)
        //            parametros += ";" + ind + ";" + Xfilas[0].files[0].name;
        //        else
        //            parametros += ";" + ind + ";";
        //    }
        //    else
        //        parametros += ";" + ind + ";";
        //    parametros += "/";
        //}


    }
    //parametros = parametros.substring(0, parametros.length - 1);

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
    var id_delete = "";
    if ($("#cuerpoTablaIndicador").data("flag") == 1) {
        id_delete = $("#cuerpoTablaIndicador").data("delete");
        id_delete = id_delete.substring(0, id_delete.length - 1);
    }

    //var id_delete = "";
    //if ($("#cuerpoTablaIndicador").data("delete") != "") {
    //    id_delete = $("#cuerpoTablaIndicador").data("delete");
    //    id_delete = id_delete.substring(0, id_delete.length - 1);
    //}

    var id_eliminar = "";
    if ($("#total-documentos").data("eliminarfile") != "") {
        id_eliminar = $("#total-documentos").data("eliminarfile");
        id_eliminar = id_eliminar.substring(0, id_eliminar.length - 1);
    }

    let arrInversion = [];
    $('.anio').each((x, y) => {
        let anio = $(y).data('valor');
        let moneda = $(`#ms-${anio}`).val();
        let inversion = $(`#m-${anio}`).val() == '' ? 0 : $(`#m-${anio}`).val().replace(/,/gi, '');
        arrInversion.push({
            ID_INICIATIVA: $("#Control").data("iniciativa"),
            ANIO: anio,
            MONEDA: moneda,
            INVERSION: inversion,
            USUARIO_REGISTRO: $("#Control").data("usuario"),
        });
    });

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
        //DATA: parametros,
        ID_TIPO_INGRESO: 2,
        PRIVACIDAD_INICIATIVA: privacidad,
        PRIVACIDAD_INVERSION: privacidad_monto,
        //ListaIndicadores: indicadores,
        //ListaIndicadoresData: indicadores,
        ListaSustentos: documentos,
        extra: archivos,
        ListaIndicadoresData: arrValores, //add 27-09-2020
        SECTOR_INST: medida == 4 ? $('#cbo-sector').val() : '',
        INSTITUCION_AUDITADA: medida == 4 ? $('#txt-institucion').val() : '',
        TIPO_AUDITORIA: medida == 4 ? $('#cbo-tipo_auditoria').val() : '',
        AUDITOR_AUDITORIA: medida == 4 ? $('#txt-auditor').val() : '',
        NOMBRE_INSTITUCION: medida == 4 ? $('#txt-institucion-auditor').val() : '',
        FECHA_AUDITORIA: medida == 4 ? $('#fch-fecha-auditoria').val() : '',
        listaMonto: arrInversion,
    };

    var options = {
        type: "POST",
        dataType: "json",
        contentType: false,
        //async: false, // add 040620
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
                if (estado == 0 || estado == 6) CargarArchivosGuardados();
                if (estado == 0 || estado == 6) GuardarIdDetalle();//
                if (estado == 0 || estado == 6) CargarDatosGuardados();
                $("#cuerpoTablaIndicador").data("flag", 0);//
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
                    //msj = msj + '                                <hr><small class="mb-0">Usted a completado el envío de detalle de su iniciativa de mitigación que será verificada por uno de nuestros especialistas. También, le recordamos que puede ingresar a nuestra plataforma del <b>Sello de Energía Sostenible</b></small>';
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
            if (estado == 0 || estado == 6) {
                $("#carga-preload-avance").html("");
                $("#titulo-carga-avance").addClass("d-none");
            } else {
                $("#carga-preload").html("");
                $("#titulo-carga").addClass("d-none");
            }
        },
        beforeSend: function () { //add 28-09-2020
            console.log('before send');
            if (estado == 0 || estado == 6) {
                $("#carga-preload-avance").html("<i Class='fas fa-spinner fa-spin px-1 fa-2x'></i>");
                $("#titulo-carga-avance").removeClass("d-none");
            } else {
                $("#carga-preload").html("<i Class='fas fa-spinner fa-spin px-1 fa-2x'></i>");
                $("#titulo-carga").removeClass("d-none");
            }
            //$("#carga-preload").html("<i Class='fas fa-spinner fa-spin px-1 fa-2x'></i>");
            //$("#titulo-carga").removeClass("d-none");
            $('#modal-carga').show();
        },
        complete: function () {
            console.log('complete send');
            if (estado == 0 || estado == 6) {
                $("#carga-preload-avance").html("");
                $("#titulo-carga-avance").addClass("d-none");
            } else {
                $("#carga-preload").html("");
                $("#titulo-carga").addClass("d-none");
            }
            //$("#carga-preload").html("");
            //$("#titulo-carga").addClass("d-none");
            $('#modal-carga').hide();
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
    $("#mensajeModalAvance #mensajeDangerAvance").remove();
    $("#mensajeModalAvance #mensajeWarningAvance").remove();
    $("#guardar-avance #modalAvanceBoton").show();
    $("#pieCorrectoAvance").hide();
});


function CargarDatosGuardados() {
    var medida = $("#Control").data("mitigacion");
    var enfoque = $("#cbo-enfoque").val();
    var iniciativa = $("#Control").data("iniciativa");
    var item = {
        ID_INICIATIVA: iniciativa,
        ID_MEDMIT: medida,
        ID_ENFOQUE: enfoque
    }
    //$('#modal-acumulado').modal('show');//add 28-09-20

    $.ajax({
        url: baseUrl + 'Gestion/ListarDatosIndicadorData',
        //type: 'POST',
        //datatype: 'json',
        //data: item,

        type: "POST",
        //url: nurl,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        //async: false,
        data: JSON.stringify(item),

        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var order = $("#tablaIndicador").data("order");
                    CargarCuerpoGuardado(data.length, 1);
                    var total = 0.0;
                    for (var i = 0; i < data.length; i++) {
                        var lista = 0;
                        var texto = 0;
                        var fecha = 0;
                        var entidad = data[i]["listaInd"];
                        var entidad_a = data[i]["listaAcumulado"];
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

                                    if (entidad[m]["ID_TIPO_DATO"] == 2) {
                                        //$("#txt-det-tbl-1-" + texto + "-" + (i + 1)).val(formatoMiles(entidad[m]["VALOR"])); //add
                                        if ($("#txt-det-tbl-1-" + texto + "-" + (i + 1))[0].className.indexOf("solo-numero") != -1)
                                            $("#txt-det-tbl-1-" + texto + "-" + (i + 1)).val(formatoMilesSoloNumero(entidad[m]["VALOR"]));
                                        else if ($("#txt-det-tbl-1-" + texto + "-" + (i + 1))[0].className.indexOf("formato-num") != -1)
                                            $("#txt-det-tbl-1-" + texto + "-" + (i + 1)).val(formatoMiles(entidad[m]["VALOR"]));
                                        else
                                            $("#txt-det-tbl-1-" + texto + "-" + (i + 1)).val(formatoMiles(entidad[m]["VALOR"]));
                                    } else if (entidad[m]["ID_TIPO_DATO"] == 3) {
                                        $("#txt-det-tbl-1-" + texto + "-" + (i + 1)).val(entidad[m]["VALOR"]);
                                    }

                                    //$("#txt-det-tbl-1-" + texto + "-" + (i + 1)).val(entidad[m]["VALOR"]);
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

                        //add 17-05-2020
                        //armarAcumulado(entidad, i + 1);
                        armarAcumulado(entidad_a, i + 1);
                    }
                    //$("#total-detalle").html("").append((Math.round(total * 100) / 100));
                    //$("#total-detalle2").html("").append((Math.round(total * 100) / 100));
                    //$("#cuerpoTablaIndicador").data("total", total);

                    //let resumen_total = 0.0;
                    //$('[id^=acum-]').each((x, y) => {
                    //    resumen_total += parseFloat($(y).html().replace(/,/gi, ''));
                    //});
                    //$("#total-detalle").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
                    //$("#total-detalle2").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
                    //$("#cuerpoTablaIndicador").data("total", resumen_total);

                    let resumen_total = 0.0, resumen_energia = 0.0, resumen_emisiones_potencial = 0.0, resumen_energia_total = 0.0;
                    if (medida == 4) {
                        $('#cuerpoTablaIndicador').find('.validar-implementado').each((x, y) => {
                            //let emision = parseFloat($(y).parent().parent().parent().find('[data-param = 11]').val().replace(/,/gi, ''));
                            //let energia = parseFloat($(y).parent().parent().parent().find('.energia-total').val().replace(/,/gi, ''));
                            let emision = $(y).parent().parent().parent().find('[data-param = 11]').val();
                            let energia = $(y).parent().parent().parent().find('.energia-total').val();
                            emision = emision == "" ? 0 : parseFloat($(y).parent().parent().parent().find('[data-param = 11]').val().replace(/,/gi, ''));
                            energia = energia == "" ? 0 : parseFloat($(y).parent().parent().parent().find('.energia-total').val().replace(/,/gi, ''));
                            //resumen_emisiones_potencial += $(y).val() == null ? 0 : emision;
                            //resumen_energia_total += $(y).val() == null ? 0 : energia;
                            resumen_emisiones_potencial += emision;
                            resumen_energia_total += energia;
                            resumen_total += $(y).val() == null ? 0 : $(y).val() > 1 ? emision : 0;
                            resumen_energia += $(y).val() == null ? 0 : $(y).val() > 1 ? energia : 0;
                        });
                        $("#total-detalle").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
                        $("#total-detalle2").html("").append(formatoMiles(Math.round(resumen_total * 100) / 100));
                        $("#total-detalle-energia").html("").append(formatoMiles(Math.round(resumen_energia * 100) / 100));
                        $("#cuerpoTablaIndicador").data("total", resumen_total);

                        //potencial
                        $("#total-detalle-emisiones-2").html("").append(formatoMiles(resumen_emisiones_potencial));
                        $("#total-detalle-energia-2").html("").append(formatoMiles(resumen_energia_total));
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
                //CargarCuerpoGuardado(1);
                $("#total-detalle").html("").append(0.00);
                $("#total-detalle2").html("").append(0.00);
                //cargarCuerpoTabla($("#cbo-enfoque").val());
                //$("#total-detalle").append('<strong id="total">0.00 tCO<sub>2</sub>eq</strong>');
                //$("#total-detalle2").append('<strong id="total2">0.00 tCO<sub>2</sub>eq</strong>');
            }
            $("#tbl-main-preload").html("");
            $("#tbl-main").removeClass("d-none");
            $('#modal-acumulado').modal('hide');
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
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/4.1 Plantilla_Vehiculos_electricos_Recorrido.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
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
    } else if (enfoque == 8) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/2.1 Plantilla_Coccion_Lena.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 9) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/2.1 Plantilla Coccion limpia_vales_fise.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 10) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.7 Plantilla_Lamparas_de_alumbrado_publico.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 11) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.6 Plantilla_Reemplazo_de_lamparas_de_sector_publico.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 12) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.5 Plantilla_Iluminacion_residencial.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 13) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.3 Plantilla_Eficiencia_energetica_comercial.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 14) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.2 Plantilla_Eficiencia_energetica_sector_industrial_Motor.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 15) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.2 Plantilla_Eficiencia_energetica_industrial_caldera (V1).xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 16) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.2 Plantilla_Eficiencia_energetica_industrial_caldera (V2).xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 17) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_etiquetado_congeladoras.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 18) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_Lavadoras.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 19) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_Secadora.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 20) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_Aire acondicionado.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 21) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_Calentadores_agua_instantaneo.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 22) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_Calentadores_agua_gas.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 23) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.1 Plantilla_Etiquetado_de_eficiencia_Calentadores_agua_GLP.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 24) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.2 Plantilla_Etiquetado_de_eficiencia_Motores Electricos.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    } else if (enfoque == 25) {
        $("#ruta-masivo").html("").append('<label for="txt-declaracion">Plantilla excel&nbsp;<small><a href="' + baseUrl + 'Documentos/1.4 Plantilla_Auditoria_energetica.xlsx" download>(&nbsp;<i class="fas fa-file-excel"></i>&nbsp;Descargar plantilla para esta medida de mitigación&nbsp;)</a></small><span class="text-danger font-weight-bold">&nbsp;(*)&nbsp;</span><i class="fas fa-question-circle ayuda-tooltip" data-toggle="tooltip" data-placement="left" title="Descargue la plantilla de excel que contiene el formato de columnas que debe completar"></i></label>');
    }
    $('[data-toggle="tooltip"]').tooltip();
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
        msj = mensajeError(id_msj, "Error", "Ocurrio un error durante el proceso de guardado de la acción de mitigación.");
    }
    return msj;
}


////
function mostrarAcumulado() {
    var row = $("#tablaIndicador").data("fila");
    var valor = 0;
    //var campos = $("#tablaIndicador").find("tbody").find("#detalles-tr-" + row).find("[data-validar]");
    //campos.each(function (index, value) {
    //    console.log(index + " + " + $(value).attr("id") + " + " + $(value).attr("data-validar"));

    //    if ($(value).attr("data-validar") == 0) {
    //        valor = 1;
    //    }

    //});
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
            parametros += $("#" + $(value).attr("id")).val() + "|";
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
                        //
                        cabecera += '<th class="text-center grupo-columna-03"><span>' + data[i]["anio"] + '</span></th>';
                        //var a = data[i]["anio"];
                    }
                    cabecera += '<th class="text-center grupo-columna-03"><span>TOTAL ACUMULADO</span></th>';
                    cabecera += '</tr>';

                    cuerpo += '<tr>';
                    for (var j = 0; j < data.length; j++) {
                        total += parseFloat(data[j]["reducido"]);
                        cuerpo += '<td class="text-center estrecho" data-encabezado="' + data[j]["anio"] + '">' + Math.round(data[j]["reducido"] * 100) / 100 + '</td>';
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

function armarAcumulado(data, f) {
    
    var cuerpo = "";

    //var item = {
    //    lista: entidad
    //};

    if (data != null && data != "") {
        if (data.length > 0) {
            let num = $("#cuerpo-acumulado-total").find("tr").length + 1;
            var verf = 0;
            var anio = 2010;
            var acumulado_ini = parseInt(data[0]["anio"]) - anio;

            var fila = $("#cuerpo-acumulado-total").find("tr");
            fila.each(function (index, value) {
                var id = $(value).attr("id");

                if (id == "f-" + f) {
                    verf = 1;
                }
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

    //$.ajax({
    //    url: baseUrl + 'Detalle/CalcularAcumulado',
    //    type: 'POST',
    //    datatype: 'json',
    //    data: item,
    //    success: function (data) {
    //        if (data != null && data != "") {
    //            if (data.length > 0) {

    //                var verf = 0;
    //                var anio = 2010;
    //                var acumulado_ini = parseInt(data[0]["anio"]) - anio;

    //                var fila = $("#cuerpo-acumulado-total").find("tr");
    //                fila.each(function (index, value) {
    //                    var id = $(value).attr("id");

    //                    if (id == "f-" + f) {
    //                        verf = 1;
    //                    }
    //                });

    //                if (verf == 0) {
    //                    cuerpo += '<tr id="f-' + f + '">';

    //                    if (acumulado_ini > 0) {
    //                        for (var m = 0; m < acumulado_ini; m++) {
    //                            cuerpo += '<td class="text-center estrecho" data-encabezado="' + anio + '" id="a-' + anio + '-' + f + '">' + 0.00 + '</td>';
    //                            anio += 1;
    //                        }
    //                    }

    //                    var valor_acumulado = 0.0;
    //                    for (var j = 0; j < data.length; j++) {

    //                        //valor_acumulado += Math.round(data[j]["reducido"] * 100) / 100; //q
    //                        valor_acumulado = Math.round(data[j]["reducido"] * 100) / 100;// add

    //                        var acumulado_col = parseFloat($("#acum-" + anio).html().replace(/,/gi, '')) + valor_acumulado;

    //                        $("#acum-" + anio).html(formatoMiles(Math.round(acumulado_col * 100) / 100));

    //                        cuerpo += '<td class="text-center estrecho" data-encabezado="' + data[j]["anio"] + '" id="a-' + anio + '-' + f + '">' + formatoMiles(Math.round(data[j]["reducido"] * 100) / 100) + '</td>';
    //                        anio += 1;
    //                    }

    //                    anio -= 1;
    //                    var acumulado_fin = 2030 - anio;

    //                    if (acumulado_fin > 0) {
    //                        for (var n = 0; n < acumulado_fin; n++) {
    //                            anio += 1;
    //                            cuerpo += '<td class="text-center estrecho" data-encabezado="' + anio + '" id="a-' + anio + '-' + f + '">' + 0.00 + '</td>';
    //                        }
    //                    }

    //                    cuerpo += '</tr>';

    //                    $("#cuerpo-acumulado-total").append(cuerpo);
    //                } else {
    //                    var valor_acumulado = 0.0;
    //                    var valor_descuento = 0.0;

    //                    if (acumulado_ini > 0) {
    //                        for (var m = 0; m < acumulado_ini; m++) {
    //                            var valor = parseFloat($("#a-" + anio + '-' + f).html().replace(/,/gi, ''));

    //                            //valor_descuento += valor; //q
    //                            valor_descuento = valor; //add

    //                            acumulado_col = parseFloat($("#acum-" + anio).html().replace(/,/gi, '')) - valor_descuento;
    //                            $("#a-" + anio + '-' + f).html(0);
    //                            $("#acum-" + anio).html(formatoMiles(Math.round(acumulado_col * 100) / 100));
    //                            anio += 1;
    //                        }
    //                    }

    //                    for (var j = 0; j < data.length; j++) {
    //                        var acumulado_col = 0.0;
    //                        var valor = parseFloat($("#a-" + anio + '-' + f).html().replace(/,/gi, ''));

    //                        //valor_acumulado += Math.round(data[j]["reducido"] * 100) / 100; //q
    //                        valor_acumulado = Math.round(data[j]["reducido"] * 100) / 100; //add

    //                        //valor_descuento += valor; //q
    //                        valor_descuento = valor; //add

    //                        acumulado_col = parseFloat($("#acum-" + anio).html().replace(/,/gi, '')) - valor_descuento;

    //                        acumulado_col = acumulado_col + valor_acumulado;
    //                        $("#a-" + anio + '-' + f).html(formatoMiles(Math.round(data[j]["reducido"] * 100) / 100));

    //                        $("#acum-" + anio).html(formatoMiles(Math.round(acumulado_col * 100) / 100));

    //                        anio += 1;
    //                    }
    //                }
    //            }
    //        } else {
    //        }
    //    }
    //});

}

//===============================================================
function formatoMiles(n) { //add20
    var m = n * 1;
    return m.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
}

function formatoMilesSoloNumero(n) { //add20
    var m = n * 1;
    return m.toFixed(0).replace(/(\d+)(\d{3})/, '$1,$2');
}

var estiloblockpage = () => {
    width = $('body').css('width');
    height = $('body').css('height');
    $("#block-page-carga").css("position", "fixed");
    $("#block-page-carga").css("top", "0");
    $("#block-page-carga").css("left", "0");
    $("#block-page-carga").css("width", width);
    $("#block-page-carga").css("height", height);
    $("#block-page-carga").css("opacity", ".1");
    $("#block-page-carga").css("background-color", "#fff");
    $("#block-page-carga").css("z-index", "2000");
    $("#block-page-carga").css("display", "none");
}

function CargarSector() {
    var item = {
    };
    vurl = baseUrl + "Gestion/ListaSectorInstitucion";
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

    let body1 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><select class="form-control form-control-sm" id="cbo-sector" ${$("#revision").val() == 1 ? 'disabled' : ''}><option value="0">Seleccionar</option><option value="1">Administrativo</option><option value="2">Público</option><option value="3">Educación</option><option value="4">Salud</option></select></div></td>`;
    let body2 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><input class="form-control form-control-sm text-left" type="text" placeholder="" id="txt-institucion" maxlength="120" autocomplete="off" ${$("#revision").val() == 1 ? 'readonly' : ''}></div></td>`;
    let body3 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><select class="form-control form-control-sm" id="cbo-tipo_auditoria" ${$("#revision").val() == 1 ? 'disabled' : ''}><option value="0">Seleccionar</option><option value="1">Tipo 1</option><option value="2">Tipo 2</option><option value="3">Tipo 3</option></select></div></td>`;
    let body4 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><input class="form-control form-control-sm text-left" type="text" placeholder="" id="txt-descripcion-tipo-auditoria" maxlength="500" autocomplete="off" ${$("#revision").val() == 1 ? 'readonly' : ''}></div></td>`;
    let body5 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><select class="form-control form-control-sm" id="txt-auditor" ${$("#revision").val() == 1 ? 'disabled' : ''}><option value="0">Seleccionar</option><option value="1">EMSE</option><option value="2">Auditor acreditado</option></select></div></td>`;
    let body6 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><input class="form-control form-control-sm text-left" type="text" placeholder="" id="txt-institucion-auditor" maxlength="120" autocomplete="off" ${$("#revision").val() == 1 ? 'readonly' : ''}></div></td>`;
    let body7 = `<td data-encabezado="Columna 07"><div class="form-group m-0"><input class="form-control form-control-sm text-center" type="date" placeholder="" id="fch-fecha-auditoria" ${$("#revision").val() == 1 ? 'readonly' : ''}></div></td>`;
    $('#tablaAuditor').find('tbody').html(`<tr id="detalles-1" data-ind="1" data-rev="0">${body1}${body2}${body3}${body4}${body5}${body6}${body7}</tr>`);

}

var resumenPotencial = () => {
    let body2 = `<tr><th class="text-center" data-encabezado="Número" scope="row">2</th><td data-encabezado="Resumen">Energía total reducida</td><td data-encabezado="Total"><strong id="total-detalle-energia-2">0.00</strong><strong>&nbsp;MJ</strong></td></tr>`;
    let body1 = `<tr><th class="text-center" data-encabezado="Número" scope="row">1</th><td data-encabezado="Resumen">Emisiones de GEI reducidas</td><td data-encabezado="Total"><strong id="total-detalle-emisiones-2">0.00</strong><strong>&nbsp;tCO<sub>2</sub>eq</strong></td></tr>`;
    let heads = `<th class="text-center" scope="col" width="2%"><span>N°&nbsp;</span></th><th scope="col" width="88%"><span>Resumen potencial de las mejoras</span></th><th scope="col" width="10%"><span>Total</span></th>`;
    let tabla = `<table class="table table-hover"><thead><tr class="bg-primary text-white">${heads}</tr></thead><tbody>${body1}${body2}</tbody></table>`;
    let row = `<div class="row"><div class="col-12"><div class="table-responsive tabla-principal mt-3">${tabla}</div></div></div>`;
    $('#resumenpotencial').html(row);
}

//========================

$(document).on("click", ".miColumna", function (event) {
    var id = "";
    if (event.target.nodeName == "SPAN") {
        id = event.target.firstElementChild.id;
    } else {
        id = event.target.id;
    }

    $(".miColumna > i").removeClass("fa-sort-up");
    $(".miColumna > i").removeClass("fa-sort-down");
    $(".miColumna > i").addClass("fa-sort");
    $(".miColumna > i").css("color", "lightgray");
    //===========
    let order = $(`#${id}`).data('order');
    if (order == "ASC") {
        $(`#${id}`).data('order', "DESC");
        $(`#${id}`).removeClass("fa-sort");
        $(`#${id}`).addClass("fa-sort-down");
    }
    else if (order == "DESC") {
        $(`#${id}`).data('order', "ASC");
        $(`#${id}`).removeClass("fa-sort");
        $(`#${id}`).addClass("fa-sort-up");
    }
    let param = $(`#${id}`).data('parametro');
    ordenarFiltro(order, param);
});

function CierraPopup(id) {
    $(id).modal('hide');//ocultamos el modal
    $(id).removeClass('show');
    $(id).prop('aria-hidden', true);
    $('body').removeClass('modal-open');//eliminamos la clase del body para poder hacer scroll
    $('.modal-backdrop').remove();//eliminamos el backdrop del modal
}

var ordenarFiltro = (order, parametro) => {
    let arrValores = [], arrInd = [];
    $('#cuerpoTablaIndicador').find('tr').each((x, y) => {
        let arr = [];
        $(y).find('td').each((w, z) => {
            //let v = $(z).data('encabezado') != "Sustento" && $(z).data('encabezado') != "Acciones" ? true : false;
            let v = $(z).data('encabezado') != "Acciones" ? true : false;
            if (v) {
                let id = '';
                if ($(z).data('encabezado') == "Sustento") {
                    id = `#${$(z).find('label').find('input')[0].id}`;
                } else {
                    id = `#${$(z).find('div')[0].firstChild.id}`;
                }

                if ($(z).data('encabezado') == "Sustento") {
                    //arr.push([id, $(id)[0].files[0]]);
                    arr.push([id, $(id)[0].files]);
                } else {
                    arr.push([id, $(id).val()]);
                }
                //arr.push([id, $(id).val()]);
            }
        });
        arrInd.push([`#${$(y).attr('id')}`,
                      parametro == 0 ? $(y).find('th').html() : $(y).find(`[data-param=${parametro}]`).val() == "" ? 0 : parseFloat($(y).find(`[data-param=${parametro}]`).val().replace(/,/gi, '')),
                      $(y)[0].outerHTML, arr]);
        // arrValores.push($(y).find('[data-param=11]').val());
        arrValores.push([parametro == 0 ? $(y).find('th').html() : $(y).find(`[data-param=${parametro}]`).val() == "" ? 0 : parseFloat($(y).find(`[data-param=${parametro}]`).val().replace(/,/gi, '')), `#${$(y).attr('id')}`]);
    });
    //if (order == "ASC") arrValores.sort(function (a, b) { return a - b; }); //ASCENDENTE
    //else arrValores.sort(function (a, b) { return b - a; }); //DESCENDENTE

    if (order == "ASC") arrValores = ordenarAscendente(arrValores); //ASCENDENTE
    else arrValores = ordenarDescendente(arrValores); //DESCENDENTE

    $('#cuerpoTablaIndicador').html('');
    $.each(arrValores, (x, y) => {
        //v = arrInd.find(w => { return w[1] == y; });
        v = arrInd.find(w => { return w[1] == y[0] && w[0] == y[1]; });
        $('#cuerpoTablaIndicador').append(v[2]);
        $.each(v[3], (x, y) => {
            if (y[0].indexOf('fle-doc-') !== -1) $(y[0])[0].files = y[1];
            else $(y[0]).val(y[1]);
        });
    });
    ordenarTablaDatos();
}

var ordenarDescendente = (arr) => {
    arr.sort(function (a, b) {
        if (a[0] < b[0]) {
            return 1;
        }
        if (a[0] > b[0]) {
            return -1;
        }
        // a must be equal to b
        return 0;
    });

    return arr;
}

var ordenarAscendente = (arr) => {

    let t, id;
    for (let a = 1; a < arr.length; a++) {
        for (let b = arr.length - 1; b >= a; b--) {
            if (arr[b - 1][0] > arr[b][0]) {
                t = arr[b - 1][0];
                id = arr[b - 1][1];
                arr[b - 1][0] = arr[b][0];
                arr[b - 1][1] = arr[b][1];
                arr[b][0] = t;
                arr[b][1] = id;
            }
        }
    }

    return arr;
}

function ordenarTablaDatos() {
    let iniciativa = $("#Control").data("iniciativa");
    let o = $("#tablaIndicador");
    if ($("#Control").data("mitigacion") == 4) ordenarAcumulado(o.find("tbody").find("th"));
    for (var e = o.find("tbody").find("th"), r = o.parent().attr("data-order"), a = 0; a < e.length; a++) {
        var s = a + 1;
        o.find("tbody").find("th").eq(a).empty().html(s), o.find("tbody").find("tr").eq(a).removeAttr("id").attr({
            id: "detalles-tr-" + s
        }), o.find("tbody").find("tr").eq(a).find("select").each(function (e, t) {
            var n = $(this).attr("id"),
                i = "cbo-det-" + r + "-" + (e + 1) + "-" + s;
            o.find("tbody").find("tr").eq(a).find("#" + n).attr({
                id: i
            })
        }), o.find("tbody").find("tr").eq(a).find("input[type='text']").each(function (e, t) {
            var n = $(this).attr("id"),
                i = "txt-det-" + r + "-" + (e + 1) + "-" + s;
            o.find("tbody").find("tr").eq(a).find("#" + n).attr({
                id: i
            })
        }), o.find("tbody").find("tr").eq(a).find("input[type='date']").each(function (e, t) {
            var n = $(this).attr("id"),
                i = "fch-det-" + r + "-" + (e + 1) + "-" + s;
            o.find("tbody").find("tr").eq(a).find("#" + n).attr({
                id: i
            })
        })

        o.find("tbody").find("tr").eq(a).find("[data-encabezado=Sustento]").find('label').find('input').eq(0).removeAttr("onchange").attr({
            onchange: `handleFileSustento(this.files,${s},1)`
        });
        o.find("tbody").find("tr").eq(a).find("[data-encabezado=Sustento]").find('label').find('input').eq(0).removeAttr("id").attr({
            id: "fle-doc-" + s
        });

        o.find("tbody").find("tr").eq(a).find("[data-encabezado=Sustento]").find('label').find('input').eq(1).removeAttr("id").attr({
            id: "fle-nom-" + s
        });

        let cargado = o.find("tbody").find("tr").eq(a).find("[data-encabezado=Sustento]").find('a').attr('style');
        let rel = o.find("tbody").find("tr").eq(a).find("[data-encabezado=Sustento]").find('a').eq(0).attr('href');
        let ind = rel.split('&')[1].split('=')[1].trim();
        if (rel.split('&')[2].split('=')[1].trim() == 'I') {
            cargado == '' || cargado == undefined ? ActualizarFile(iniciativa, ind, s) : ''; //add
            o.find("tbody").find("tr").eq(a).find("[data-encabezado=Sustento]").find('a').eq(0).removeAttr("href").attr({
                href: `/Gestion/FileDownload?IdIniciativa=${iniciativa}&IdIndicador=${s}&accion=I`
            });
        }

        o.find("tbody").find("tr").eq(a).find("[data-encabezado=Sustento]").find('a').eq(0).removeAttr("id").attr({
            id: `fle-dow-${s}`
        });
        o.find("tbody").find("tr").eq(a).find("[data-encabezado=Sustento]").find('label').eq(0).removeAttr("for").attr({
            for: "fle-doc-" + s
        });
        o.find("tbody").find("tr").eq(a).find("[data-encabezado=Sustento]").eq(0).removeAttr("id").attr({
            id: "sustento" + s
        });
    }
    ordenarIndicadorFile(iniciativa);
}

var ordenarAcumulado = (inp) => {
    let arr = [], html = '';
    inp.each((x, y) => {
        arr.push($(y).html());
    });

    $.each(arr, (x, y) => {
        html += $(`#f-${y}`)[0].outerHTML;
    });

    $('#cuerpo-acumulado-total').html(html);
    ordenarTabla();
}

function ActualizarFile(idIniciativa, idIndicador, nuevoindicador) {

    var url = baseUrl + 'Gestion/ActualizarFile?IdIniciativa=' + idIniciativa + '&IdIndicador=' + idIndicador + '&idnuevo=' + nuevoindicador;
    $.ajax({
        url: url, //'/Home/FileUpload',
        type: "POST",
        async: false,
        contentType: false, // Not to set any content header  
        processData: false, // Not to process data  
        success: function (result) {
            if (result != null && result != "") {
                console.log(result);
            }
        }
    });
}

var ordenarIndicadorFile = (idIniciativa) => {
    var url = baseUrl + 'Gestion/OrdenarFile?IdIniciativa=' + idIniciativa;
    $.ajax({
        url: url, //'/Home/FileUpload',
        type: "POST",
        async: false,
        contentType: false, // Not to set any content header  
        processData: false, // Not to process data  
        success: function (result) {
            if (result != null && result != "") {
                console.log(result);
            }
        }
    });
}

var loadMoneda = () => {
    let opciones = '';
    var Item = {};
    $.ajax({
        url: baseUrl + "Gestion/ListarMoneda",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
        if (data != null && data != "") {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    opciones += '<option value="' + data[i]["ID_MONEDA"] + '">' + data[i]["DESCRIPCION"] + '</option>';
                }
                //debugger;
                $('[id*=ms-]').each((x, y) => {
                    $(y).append(opciones);
                });
                asignarMontos();
            }
        }
    });
}

var asignarMontos = () => {
    let opciones = '';
    var Item = {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    };
    $.ajax({
        url: baseUrl + "Gestion/ListarMontos",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
        if (data != null && data != "") {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    let anio = data[i]["ANIO"];
                    $(`#ms-${anio}`).val(data[i]["MONEDA"]);
                    $(`#m-${anio}`).val(formatoMiles(data[i]["INVERSION"]));
                }
            }
        }
    });
}

$(document).on("keyup", ".formato-num", function (event) {

    $(event.target).val(function (index, value) {
        if (value.length <= 2) {
            return value.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{1})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
        } else {
            return value.replace(/\D/g, "")
            .replace(/([0-9])([0-9]{2})$/, '$1.$2')
            .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
        }
    });
});

