﻿
function fn_seleccionarMedidaFactor(medida) {
    $("#cbo-medida-mitigacion").val(medida);
    $("#cbo-medida-mitigacion").attr("disabled", true);
    $("#TablaMedidaFactor").data("guardar", 0);
    var item = {
        ID_MEDMIT: medida
    };

    $.ajax({
        url: baseUrl + "Mantenimiento/GetMedidaFactor",
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#filas-factor").html("");
                    for (var i = 0; i < data.length; i++) {
                        var tr = "";
                        tr += '<div class="btn btn-secondary btn-sw w-100 d-flex flex-row align-items-center justify-content-between my-2 factor-div">';
                        tr += '     <small class="badge badge-info">';
                        tr += '         <i class="fas fa-list"></i>'+ data[i]["NOMBRE_FACTOR"];
                        tr += '     </small>';
                        tr += '         <input class="hidden-control field-ctrol" type="hidden" value="' + data[i]["NOMBRE_FACTOR"] + '">';
                        tr += '         <input class="hidden-control field-ctrol valor" type="hidden" data-delete="1" value="' + data[i]["ID_FACTOR"] + '">';
                        //tr += '     <div class="opciones">';
                        tr += '         <i class="fas fa-minus-circle cursor-pointer m-2 delete-columna-detalle" data-toggle="tooltip"  onclick="eliminarFactor(' + data[i]["ID_FACTOR"] + ');"  data-placement="top" title="" data-original-title="Eliminar"></i>';
                        //tr += '     </div>';
                        tr += '</div>';
                        $("#filas-factor").append(tr);
                    }
                }
            }
        }
    });
}

function CargarCabeceraDatos(factor) {
    $("#tablaCabeceraFactor").data("idfactor", factor);
        var item = {
            ID_FACTOR: factor
        }
        $.ajax({
            url: baseUrl + 'Mantenimiento/ListarCabeceraFactor',
            type: 'POST',
            datatype: 'json',
            data: item,
            success: function (data) {
                if (data != null && data != "") {
                    $("#tablaCabeceraFactor").html("");
                    if (data.length > 0) {
                        var tr = "";
                        tr += '<tr class="bg-primary text-white">';
                        tr += '     <th class="text-center" scope="col"><span>N°&nbsp;</span></th>';
                        for (var i = 0; i < data.length; i++) {
                            //tr += '     <th scope="col"><span>' + data[i]["NOMBRE_DETALLE"] + '&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador ' + data[i]["NOMBRE_DETALLE"] + '"></i></span></th>';
                            tr += '     <th scope="col"><span>' + data[i]["NOMBRE_DETALLE"] + '&nbsp;</span></th>';
                            //tr += '     <th class="text-center" style="background-color: ' + data[i]["COLOR_GRUPO"] + ';" scope="col"><span>' + data[i]["NOMBRE_PARAMETRO"] + '&nbsp;<i class="fas fa-question-circle text-white ayuda-tooltip" data-toggle="tooltip" data-placement="bottom" title="Indicador ' + data[i]["NOMBRE_PARAMETRO"] + '"></i></span></th>';
                        }
                        tr += '     <th class="text-center" style="background-color: #007BFF;" scope="col">Más</th>';
                        tr += '</tr>';
                        $("#tablaCabeceraFactor").append(tr);
                    }
                } else {
                }
            }
        });
}

function CargarCuerpoGuardado(filas, factor) {
    var item = {
        ID_FACTOR: factor
    }
    $.ajax({
        async: false,
        url: baseUrl + 'Mantenimiento/ListarCuerpoFactor',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#cuerpoTablaFactor").html("");
                    for (var i = 0; i < filas; i++) {
                        var lista = 0;
                        var texto = 0;
                        var fecha = 0;
                        //var indicador = 0;
                        var tr = "";
                        tr += '<tr id="detalles-tr-' + (i + 1) + '" data-ind="0">';
                        tr += '     <th class="text-center" data-encabezado="Número" scope="row">' + (i + 1) + '</th>';
                        for (var j = 0; j < data.length; j++) {
                            //indicador = data[j]["ID_INDICADOR"];
                            if (data[j]["ID_TIPO_CONTROL"] == 1) {
                                tr += '<td data-encabezado="Columna 07">';
                                tr += '     <div class="form-group m-0">';
                                    lista++;
                                    if (data[j]["ID_PARAMETRO"] == 6) {
                                        tr += '<select class="form-control form-control-sm" id="cbo-det-tbl-1-' + lista + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '">';
                                        tr += '        <option value="0">Seleccionar</option>';
                                        var listaD = data[j]["listaDetalle"];
                                        for (var m = 0; m < listaD.length; m++) {
                                            tr += '<option value="' + listaD[m]["NOMBRE_DETALLE"] + '">' + listaD[m]["NOMBRE_DETALLE"] + '</option>';
                                        }
                                        tr += '</select>';
                                    } else {
                                        tr += '<select class="form-control form-control-sm" id="cbo-det-tbl-1-' + lista + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '">';
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
                                    if (data[j]["ID_TIPO_DATO"] == 1) {
                                        fecha++;
                                        tr += '<input class="form-control form-control-sm text-center" type="date" placeholder="" id="fch-det-tbl-1-' + fecha + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '">';
                                    } else {
                                        texto++;
                                        tr += '<input class="form-control form-control-sm text-center" type="text" placeholder="" id="txt-det-tbl-1-' + texto + '-' + (i + 1) + '" data-param="' + data[j]["ID_PARAMETRO"] + '">';
                                    }
                                tr += '    </div>';
                                tr += '</td>'
                            }
                        }
                        tr += '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr += '     <div class="btn-group">';
                        tr += '          <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr += '          <div class="dropdown-menu dropdown-menu-right">';
                        tr += '               <a class="dropdown-item agregarCampos" href="#"><i class="fas fa-plus-circle"></i>&nbsp;Agregar</a>';
                        tr += '               <a class="dropdown-item quitarCampos" href="#" onclick="fn_eliminarFactor()"><i class="fas fa-minus-circle"></i>&nbsp;Eliminar</a>';
                        tr += '          </div>';
                        tr += '     </div>';
                        tr += '</td>';
                        tr += '</tr>';
                        $("#cuerpoTablaFactor").append(tr);
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

function CargarDatosGuardados(factor) {
    var item = {
        ID_FACTOR: factor
    }
    $.ajax({
        url: baseUrl + 'Mantenimiento/ListarDatosFactorData',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    debugger;
                    CargarCuerpoGuardado(data.length, factor);
                    for (var i = 0; i < data.length; i++) {
                        var lista = 0;
                        var texto = 0;
                        var fecha = 0;
                        var entidad = data[i]["listaParametro"]
                        $("#cuerpoTablaFactor #detalles-tr-" + (i + 1)).attr({ "data-ind": data[i]["ID_DETALLE"] });
                        //for (var j = 0; j < entidad.length; j++) {
                            debugger;
                            for (var m = 0; m < entidad.length; m++) {
                                if (entidad[m]["ID_TIPO_CONTROL"] == 1) {
                                    lista++;
                                    $("#cbo-det-tbl-1-" + lista + "-" + (i + 1)).val(entidad[m]["VALOR"]);
                                } else if (entidad[m]["ID_TIPO_CONTROL"] == 2) {
                                    if (entidad[m]["ID_TIPO_DATO"] == 1) {
                                        fecha++;
                                        $("#fch-det-tbl-1-" + fecha + "-" + (i + 1)).val(entidad[m]["VALOR"]);
                                    } else {
                                        texto++;
                                        $("#txt-det-tbl-1-" + texto + "-" + (i + 1)).val(entidad[m]["VALOR"]);
                                    }
                                }
                            }                            
                        //}
                        texto++;
                        $("#txt-det-tbl-1-" + texto + "-" + (i + 1)).val(data[i]["FACTOR"]);
                    }
                }
            } else {
                CargarCuerpoGuardado(1, factor);
            }
        }
    });

}

function CargarTabla(factor, nombre_factor) {
    $("#tablaCuerpoFactor").data("delete", "");
    $("#tablaCabeceraFactor").data("idfactor", factor);
    $("#titulo-factor").html("").html(nombre_factor); //add
    CargarCabeceraDatos(factor);
    CargarDatosGuardados(factor);
}

function fn_validarCampoReg(f) {
    //var campos = $("#enfoque-" + $("#cbo-enfoque").val()).find("tbody").find("#detalles-tr-" + f).find("[data-validar]");
    var v = true;
    var campos = $("#tablaFactor").find("tbody").find("#detalles-tr-" + f).find("[data-param]");
    campos.each(function (index, value) {
        //console.log(index + " + " + $(value).attr("id") + " + " + $(value).attr("data-validar"));

        if ($(value).val() == 0) {
            v = false;
        }

    });
    return v;
}

function fn_guardarFactor() {
    factores = [];
    var factor = $("#tablaCabeceraFactor").data("idfactor");
    var n = $("#tablaFactor").find("tbody").find("th").length + 1;
    for (var fila = 1 ; fila < n; fila++) {
        //debugger;
        var valor_factor = 0;
        var parametros = "";
        var valores = "";
        var ind = $("#cuerpoTablaFactor #detalles-tr-" + fila).data("ind");
        var column = $("#tablaFactor").find("tbody").find("#detalles-tr-" + fila).find("[data-param]");
        if (fn_validarCampoReg(fila)) {
            column.each(function (index, value) {
                //debugger;
                if ($(value).attr("data-param") == 0) {
                    valor_factor = $("#" + $(value).attr("id")).val();
                } else {
                    parametros += $(value).attr("data-param") + "|";
                    valores += $("#" + $(value).attr("id")).val() + "|";
                }                
            });            
        }
        if (parametros.length > 0){
            parametros = parametros.substring(0, parametros.length - 1);
            valores = valores.substring(0, valores.length - 1);
            var itemF = {
                ID_FACTOR: factor,
                ID_DETALLE: ind,
                ID_PARAMETRO: parametros,
                VALOR: valores,
                FACTOR: valor_factor
            }
            factores.push(itemF);
        }        

    }

    var id_delete = "";
    if ($("#cuerpoTablaFactor").data("delete") != "") {
        id_delete = $("#cuerpoTablaFactor").data("delete");
        id_delete = id_delete.substring(0, id_delete.length - 1);
    }

    var item = {
        ID_FACTOR: factor,
        ListaFactorData: factores,
        ID_ELIMINAR_FACTOR: id_delete
    }
    
    var url = baseUrl + "Mantenimiento/GuardarFactores";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        alert("Guardado exitoso");
    }
}

$(document).on("mouseover", "#tablaFactor tbody tr", function () {
    var fila = $(this).find('th:eq(0)').html();
    console.log(fila);
    $("#tablaFactor").data("fila", fila);
});

function fn_eliminarFactor() {
    //debugger;
    var fila = $("#tablaFactor").data("fila");
    var id_borrar = $("#cuerpoTablaFactor").data("delete") + $("#tablaFactor #detalles-tr-" + fila).data("ind") + ",";
    $("#cuerpoTablaFactor").data("delete", id_borrar);
}

function limpiar() {
    $("#cbo-medida-mitigacion").attr("disabled", false);
    $("#filas-factor").html("");
    $("#cbo-medida-mitigacion").val(0);
    $("#cbo-factores").val(0);
    $("#TablaMedidaFactor").data("guardar", 1);
}

function validarFactor() {
    var v = true;
    var factor = $("#cbo-factores").val();
    var componentes = $("#filas-factor").find(".factor-div");
    componentes.each(function (index, value) {
        if ($(value).find(".valor").val() == factor) {
            v = false;
        }
    })

    if(v){
        agregarFactor();
    } else {
        $("#cbo-factores").val(0);
    }
}

function agregarFactor() {
    var reponer = 0;
    var valor = $("#cbo-factores").val();
    var factor = $("#cbo-factores option:selected").text();
    var id = $("#factores-id").data("eliminar");
    if (id != "") {
        id = id.substring(0, id.length - 1);
        var arr = id.split(',');

        var factor_id = "";
        debugger;
        for (var i = 0; i < arr.length; i++) {
            if (arr[i] != valor) {
                //debugger;
                factor_id += arr[i] + ",";
            } else {
                reponer = 1
            }
        }
        $("#factores-id").data("eliminar", factor_id);
    }
    debugger;
    var tr = "";
    tr += '<div class="btn btn-secondary btn-sw w-100 d-flex flex-row align-items-center justify-content-between my-2 factor-div">';
    tr += '     <small class="badge badge-info">';
    tr += '         <i class="fas fa-list"></i>' + factor;
    tr += '     </small>';
    tr += '         <input class="hidden-control field-ctrol" type="hidden" value="' + factor + '">';
    if (reponer == 1) {
        tr += '         <input class="hidden-control field-ctrol valor" data-delete="1" type="hidden" value="' + valor + '">';
    } else {
        tr += '         <input class="hidden-control field-ctrol valor" data-delete="0" type="hidden" value="' + valor + '">';
    }    
    //tr += '     <div class="opciones">';
    tr += '         <i class="fas fa-minus-circle cursor-pointer m-2 delete-columna-detalle" data-toggle="tooltip"  onclick="eliminarFactor(' + valor + ');"  data-placement="top" title="" data-original-title="Eliminar"></i>';
    //tr += '     </div>';
    tr += '</div>';
    $("#filas-factor").append(tr);  
}

function eliminarFactor(id) {
    var v = true;
    var componentes = $("#filas-factor").find(".factor-div");
    componentes.each(function (index, value) {
        if ($(value).find(".valor").val() == id) {
            if ($(value).find(".valor").attr("data-delete") == 0) {
                v = false;
            }    
        }
    });

    if (v) {
        var del = $("#factores-id").data("eliminar") + id + ",";
        $("#factores-id").data("eliminar", del);  
    }    
}

function validarCamposObligatorios() {
    debugger;
    if ($("#cbo-medida-mitigacion").val() == 0) {
        return false
    } else if ($("#filas-factor").html() == "") {
        return false
    }
    return true
}

function guardarDatosMedidaFactor() {
    var medida_factor = [];
    var i = 0;
    var medida = $("#cbo-medida-mitigacion").val();
    var componentes = $("#filas-factor").find(".factor-div");
    componentes.each(function (index, value) {
        i++;
        var indx = {
            ID_MEDMIT: medida,
            ID_FACTOR: $(value).find(".valor").val(),
            ORDEN: i
        };
        medida_factor.push(indx);
    });

    var id_delete = "";
    if ($("#factores-id").data("eliminar") != "") {
        id_delete = $("#factores-id").data("eliminar");
        id_delete = id_delete.substring(0, id_delete.length - 1);
    }

    var item = {
        ID_MEDMIT: medida,
        listaFactor: medida_factor,
        ID_ELIMINAR_FACTOR: id_delete
    }

    var url = baseUrl + 'Mantenimiento/GuardarMedidaFactor';
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#botones-guardar").attr("hidden", true);
        $("#mensajeCorrecto").attr("hidden", true);
        $("#mensajeError").attr("hidden", true);
        $("#mensajeValidar").attr("hidden", true);
        cargarTablaMedidaFactor();        
        $("#mensajeCorrecto").removeAttr("hidden");
        $("#botones-cerrar").removeAttr("hidden");
    } else {
        $("#mensajeCorrecto").attr("hidden", true);
        $("#mensajeError").attr("hidden", true);
        $("#mensajeValidar").attr("hidden", true);
        $("#mensajeError").removeAttr("hidden");
    }
}

function guardarMedidaFactor() {

    if (!validarCamposObligatorios()) {
        $("#mensajeCorrecto").attr("hidden", true);
        $("#mensajeError").attr("hidden", true);
        $("#mensajeValidar").attr("hidden", true);
        $("#mensajeError").removeAttr("hidden");
        return false;
    }
    if ($("#TablaMedidaFactor").data("guardar") == 1) {
        var item = {
            ID_MEDMIT: $("#cbo-medida-mitigacion").val()
        };
        var url = baseUrl + 'Mantenimiento/ValidarMedidaFactor';
        var respuesta = MRV.Ajax(url, item, false);
        if (respuesta.success) {
            guardarDatosMedidaFactor();
        } else {
            $("#mensajeCorrecto").attr("hidden", true);
            $("#mensajeError").attr("hidden", true);
            $("#mensajeValidar").attr("hidden", true);
            $("#mensajeValidar").removeAttr("hidden");
        }
    } else {
        guardarDatosMedidaFactor();
    }
}

$("#modal-medida-de-mitigacion").on("hidden.bs.modal", function () {
    $("#mensajeValidar").attr("hidden", true);
    $("#mensajeCorrecto").attr("hidden", true);
    $("#mensajeError").attr("hidden", true);
    $("#botones-cerrar").attr("hidden", true);
    $("#botones-guardar").removeAttr("hidden");
});

function cargarTablaMedidaFactor() {
    var item = {
    };
    $.ajax({
        async: false,
        url: baseUrl + 'Mantenimiento/ListarTablaMedidaFactor',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {                    
                    $("#cuerpoMedidaFactor").html("");
                    for (var i = 0; i < data.length; i++) {
                        var entidad = data[i]["listaFactor"];
                        debugger;
                        if (entidad.length > 0) {
                            var tr = "";
                            tr += '    <tr id="detalles-tr-' + (i + 1) + '">';
                            tr += '        <th class="text-center" data-encabezado="Número" scope="row">' + (i + 1) + '</th>';
                            tr += '        <td data-encabezado="Medida de mitigación">' + data[i]["NOMBRE_MEDMIT"] + '</td>';
                            tr += '        <td class="text-center" data-encabezado="Codificación">' + data[i]["NUMERO_MEDMIT"] + '</td>';
                            tr += '        <td data-encabezado="Factor(es)">';
                            tr += '            <div class="form-control">';
                            tr += '                <div class="list-group sortable-list m-0">';
                            for (var j = 0; j < entidad.length; j++) {                                
                                tr += '                        <div class="p-1 text-center border-right">';
                                tr += '                    <div class="h6 span badge badge-info w-100 p-3">' + entidad[j]["NOMBRE_FACTOR"] + '<br><span data-toggle="tooltip" data-placement="top" title="Editar valores del factor ' + entidad[j]["NOMBRE_FACTOR"] + '"><a class="text-white" href="#" onclick="CargarTabla(' + entidad[j]["ID_FACTOR"] + ',\'' + entidad[j]["NOMBRE_FACTOR"] + '\')" data-toggle="modal" data-target="#modal-valores"><i class="fas fa fa-edit p-1"></i></a></span></div>';
                                tr += '                </div>';
                            }
                            tr += '                </div>';
                            tr += '            </div>';
                            tr += '        </td>';
                            tr += '        <td class="text-center text-xs-right" data-encabezado="Acciones">';
                            tr += '            <div class="btn-group">';
                            tr += '                <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                            tr += '                <div class="dropdown-menu dropdown-menu-right">';
                            tr += '                    <a class="dropdown-item" href="#" onclick="fn_seleccionarMedidaFactor(' + data[i]["ID_MEDMIT"] + ')" data-toggle="modal" data-target="#modal-medida-de-mitigacion"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                            tr += '                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-confirmacion"><i class="fas fa-trash"></i>&nbsp;Eliminar</a>';
                            tr += '                </div>';
                            tr += '            </div>';
                            tr += '        </td>';
                            tr += '    </tr>';
                            $("#cuerpoMedidaFactor").append(tr);
                        }                        
                    }
                }
            }
        }
    });
}