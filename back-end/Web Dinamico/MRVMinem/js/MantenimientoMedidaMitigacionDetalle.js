
$(document).ready(function () {
    $("#rad-controles-" + $("#radio-control").data("tipocontrol")).prop("checked", true);
    $("#control-cbo-" + $("#radio-control").data("tipocontrol")).removeAttr("hidden");
});

function fn_listarCombo(e) {
    debugger;
    var id = e.id;
    var valor = $("#" + id).val();
    var anterior = $("#radio-control").data("tipocontrol");
    $("#radio-control").data("tipocontrol", valor);
    $("#control-cbo-" + anterior).attr("hidden", true);
    $("#control-cbo-" + valor).removeAttr("hidden");

}

$(document).on("click","#add-columna-detalle-1", function () {
    debugger;
    var aLetras = new Array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j');
    var cLetra = aLetras[Math.floor(Math.random() * aLetras.length)];
    var control = $("#radio-control").data("tipocontrol");
    var componente = $("#cbo-" + control).val();
    var grupo = $("#cbo-grupo").val();
    var nombre_campo = $("#cbo-"+ control +" option:selected").text();
    var color = $("#cbo-grupo option:selected").data("color");
    var num = Math.round(Math.random() * 100);

    var tr = "";
    tr += '<div id="mrv-' + control + componente + grupo + num + cLetra + '" class="list-group-item sortable-item recorrer" style="background-color: ' + color + '; color: white;" data-enfoque="" data-resultado="" draggable="false">';
    tr += '    <i class="fas fa-2x fa-arrows-alt"></i>';
    tr += '     <small>' + nombre_campo + '</small>';
    //tr += '     <input class="hidden-control" id="column-control" type="hidden" name="" data-c="' + control + '">';
    //tr += '     <input class="hidden-control" id="column-componente" type="hidden" name="" data-cm="' + componente + '">';
    //tr += '     <input class="hidden-control" id="column-grupo" type="hidden" name="" data-g="' + grupo + '">';
    tr += '     <input class="hidden-control column-control" type="hidden" name="" data-c="' + control + '">'; //PROBAR CON CLASE
    tr += '     <input class="hidden-control column-componente" type="hidden" name="" data-cm="' + componente + '">';
    tr += '     <input class="hidden-control column-grupo" type="hidden" name="" data-g="' + grupo + '">';
    tr += '     <i class="fas fa-minus-circle cursor-pointer mr-2 mt-2 delete-columna-detalle" data-toggle="tooltip"  data-placement="top" title="" data-original-title="Eliminar"></i>';
    tr += '     <i class="fas fa-square-root-alt cursor-pointer ml-2 mt-2 enfoque-columna-detalle" data-toggle="tooltip"  data-placement="top" title="" data-original-title="Añadir fórmula"></i>';
    tr += '</div>';
    $("#columnas-detalle").append(tr);

});

function fn_validarCampo() {
    if ($("#cbo-medida-mitigacion").val() == 0) {
        return false;
    }
    if ($("#cbo-enfoque-mitigacion").val() == 0) {
        return false;
    }
    if ($("#columnas-detalle").html() == "") {
        return false;
    }
    return true;
}

function fn_validarMedidaEnfoque() {
    var item = {
        ID_ENFOQUE: $("#cbo-enfoque-mitigacion").val(),
        ID_MEDMIT: $("#cbo-medida-mitigacion").val(),
    };
    var url = baseUrl + 'Mantenimiento/ValidarMedidaEnfoque';
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        fn_enviarMedidaDetalle();
    } else {
        $("#mensajeValidar").removeAttr("hidden");
    }
}

function fn_guardarMedidaDetalle() {
    $("#mensajeValidar").attr("hidden", true);
    $("#mensajeCompletar").attr("hidden", true);
    $("#mensajeError").attr("hidden", true);
    $("#mensajeCorrecto").attr("hidden", true);
    debugger;
    if (!fn_validarCampo()) {
        $("#mensajeCompletar").removeAttr("hidden");
        return false;
    } else if ($("#medida-enfoque").data("accion") == 1) {
        fn_validarMedidaEnfoque();
    } else {
        fn_enviarMedidaDetalle();
    }
}

function fn_enviarMedidaDetalle() {
    //debugger;    
    $("#btn-guardar").attr("disabled", true);
    $("#btn-guardar").empty().html('<i class="fas fa-spinner fa-spin px-1"></i> Procesando...');
    $("#botones-guardar").attr("hidden", true);
    indicadores = [];
    var columnas = $("#columnas-detalle").find(".recorrer");
    var i = 0;
    var ins = 0;
    var id_activo = "";
    columnas.each(function (index, value) {
        //debugger;
        i++;
        var formula = "";
        var formula_armado = "";
        if ($(value).attr("data-enfoque") == 1) {
            formula = $(value).attr("data-resultado");
            formula_armado = $(value).attr("data-resultadobd");
            formula_armado = formula_armado.substring(0, formula_armado.length - 1);
            ins = 1;
        }
        
        var itx = {
            //ID_TIPO_CONTROL: $(value).find("#column-control").attr("data-c"), //REACTIVAR
            //ID_PARAMETRO: $(value).find("#column-componente").attr("data-cm"),
            //ID_GRUPO_INDICADOR: $(value).find("#column-grupo").attr("data-g"),
            ID_TIPO_CONTROL: $(value).find(".column-control").attr("data-c"), //PROBAR
            ID_PARAMETRO: $(value).find(".column-componente").attr("data-cm"),
            ID_GRUPO_INDICADOR: $(value).find(".column-grupo").attr("data-g"),
            ID_ORDEN: i,
            FORMULA: formula,
            FORMULA_ARMADO: formula_armado,
            COMPORTAMIENTO: '=',
            VALOR_FORMULA: 0,
            INS: ins
        }
        indicadores.push(itx);
        id_activo += $(value).find(".column-componente").attr("data-cm") + ",";
    });
    id_activo = id_activo.substring(0, id_activo.length-1);

    var item = {
        ListaParametro: indicadores,
        ID_ENFOQUE: $("#cbo-enfoque-mitigacion").val(),
        ID_MEDMIT: $("#cbo-medida-mitigacion").val(),
        ID_ACTIVO: id_activo
    };

    var url = "";
    //if ($("#medida-enfoque").data("accion") == 0){
        url = baseUrl + 'Mantenimiento/RegistrarMedidaMitigacionDetalle';
    //} else if (("#medida-enfoque").data("accion") == 1) {
      //  url = baseUrl + 'Mantenimiento/ActualizarMedidaMitigacionDetalle';
    //}

    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        CargarDatosMedidaDetalle();        
        $("#mensajeCorrecto").removeAttr("hidden");        
    } else {
        $("#mensajeError").removeAttr("hidden");
    }
    $("#botones-cerrar").removeAttr("hidden");
    $("#btn-guardar").attr("disabled", false);
    $("#btn-guardar").empty().html('Guardar');
}

$("#modal-medida-de-mitigacion").on("hidden.bs.modal", function () {
    $("#mensajeValidar").attr("hidden", true);
    $("#mensajeCorrecto").attr("hidden", true);
    $("#mensajeError").attr("hidden", true);
    $("#mensajeCompletar").attr("hidden", true);
    $("#botones-cerrar").attr("hidden", true);
    $("#botones-guardar").removeAttr("hidden");
});

function fn_getMedidaEnfoque(medida, enfoque) {
    if (medida > 0) {
        $("#cbo-enfoque-mitigacion").html("");
        $("#cbo-enfoque-mitigacion").append('<option value="0">-Seleccione un enfoque-</option>');
        var Item = {
            ID_MEDMIT: medida
        };
        $.ajax({
            url: baseUrl + "Gestion/ListarEnfoqueMedida",
            type: 'POST',
            datatype: 'json',
            data: Item,
            success: function (data) {
                if (data != null && data != "") {
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            $("#cbo-enfoque-mitigacion").append('<option value="' + data[i]["ID_ENFOQUE"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                        }
                        $("#cbo-enfoque-mitigacion").val(enfoque);
                    }
                }
            }
        });
    }
}

$(document).on("change", "#cbo-medida-mitigacion", function () {
    var medida = $("#cbo-medida-mitigacion").val();
    fn_getMedidaEnfoque(medida, 0);
});

//function fn_cambiarAccion() {
//    $("#medida-mitigacion").data("accion", 0); // 0: EDITAR | 1: REGISTRAR
//}

function fn_seleccionarMedidaEnfoque(enfoque, medida) {
    debugger;
    fn_reestablecerCampo();
    $("#medida-enfoque").data("accion", 0); // 0: EDITAR | 1: REGISTRAR
    $("#cbo-medida-mitigacion").prop("disabled", true);
    $("#cbo-enfoque-mitigacion").prop("disabled", true);
    $("#cbo-medida-mitigacion").val(medida);
    fn_getMedidaEnfoque(medida, enfoque);
    $("#columnas-detalle").html("");
    var item = {
        ID_ENFOQUE: enfoque,
        ID_MEDMIT: medida
    };

    $.ajax({
        url: baseUrl + "Mantenimiento/GetMedidaMitigacionDetalle",
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        //debugger;
                        var aLetras = new Array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j');
                        var cLetra = aLetras[Math.floor(Math.random() * aLetras.length)];
                        var control = data[i]["ID_TIPO_CONTROL"];
                        var componente = data[i]["ID_PARAMETRO"];
                        var grupo = data[i]["ID_GRUPO_INDICADOR"];
                        var nombre_campo = data[i]["NOMBRE_PARAMETRO"];
                        var color = data[i]["COLOR_GRUPO"];
                        var num = Math.round(Math.random() * 100);
                        var id_mrv = 'mrv-' + control + componente + grupo + num + cLetra;
                        var formula = "";
                        var html = "";

                        if (data[i]["FORMULA"] != null && data[i]["FORMULA"] != "") {
                            var f = data[i]["FORMULA"].split('|');
                            for (var j = 0; j < f.length; j++) {
                                var color_f = "";
                                if (f[j].indexOf('F') != -1) {
                                    color_f = "info";
                                } else if (f[j].indexOf('P') != -1) {
                                    color_f = "primary";
                                } else if (f[j].indexOf('V') != -1) {
                                    color_f = "success";
                                } else if (f[j].indexOf('C') != -1) {
                                    color_f = "warning";
                                } else {
                                    color_f = "secondary";
                                }

                                html += '<div class="list-group-item sortable-item" data-value="'+ f[j] +'">';
                                html += '   <i class="fas fa-2x fa-arrows-alt"></i>';
                                html += '   <small class="badge badge-'+ color_f +'">' + f[j] + '</small>';
                                html += '   <i class="fas fa-minus-circle cursor-pointer delete-columna-detalle" data-toggle="tooltip"  data-placement="top" title="" data-enfoque="1" data-original-title="Eliminar"></i>';
                                html += '</div>';
                                formula += f[j];
                            }
                        }
                        //debugger;
                        var tr = "";
                        if (data[i]["FORMULA"] == null) {
                            tr += '<div id="' + id_mrv + '" class="list-group-item sortable-item recorrer" style="background-color: ' + color + '; color: white;" data-enfoque="" data-resultado="" draggable="false">';
                        } else {
                            tr += '<div id="' + id_mrv + '" class="list-group-item sortable-item recorrer enfoque-add sortable-chosen" style="background-color: ' + color + '; color: white;" data-enfoque="1" data-resultado="' + formula + '" data-resultadobd="' + data[i]["FORMULA"] + '|" draggable="true">';
                        }
                        tr += '    <i class="fas fa-2x fa-arrows-alt"></i>';
                        tr += '     <small>' + nombre_campo + '</small>';
                        tr += '     <input class="hidden-control column-control" type="hidden" name="" data-c="' + control + '">';
                        tr += '     <input class="hidden-control column-componente" type="hidden" name="" data-cm="' + componente + '">';
                        tr += '     <input class="hidden-control column-grupo" type="hidden" name="" data-g="' + grupo + '">';
                        tr += '     <i class="fas fa-minus-circle cursor-pointer mr-2 mt-2 delete-columna-detalle" data-toggle="tooltip"  data-placement="top" title="" data-original-title="Eliminar"></i>';
                        if (data[i]["FORMULA"] == null) {
                            tr += '     <i class="fas fa-square-root-alt cursor-pointer ml-2 mt-2 enfoque-columna-detalle" data-toggle="tooltip"  data-placement="top" title="" data-original-title="Añadir fórmula"></i>';
                        } else {
                            tr += '     <i class="fas fa-square-root-alt cursor-pointer ml-2 mt-2 enfoque-columna-detalle text-indigo" data-toggle="tooltip"  data-placement="top" title="" data-original-title="Añadir fórmula"></i>';
                        }
                        tr += '</div>';
                        $("#columnas-detalle").append(tr);

                        if (data[i]["FORMULA"] != null) {
                            var t = id_mrv,
					            n = html,
					            m = formula;
                            var o = [n, m];
                            sessionStorage.setItem(t, o);
                        }
                    }
                }
            }
        }
    });
    //debugger;
    //while ($("#cbo-enfoque-mitigacion").val() == 0) {
    //    $("#cbo-enfoque-mitigacion").val(enfoque);
    //}

}

function CargarDatosMedidaDetalle() {
    var item = {
        buscar: $("#buscar-usuarios").data("campo"),
        cantidad_registros: $("#cantidad-registros").val(),
        pagina: $("#pagina").val(),
        order_by: $("#columna").val(),
        order_orden: $("#orden").val()
    };
    $.ajax({
        url: baseUrl + "Mantenimiento/ListarMedidaMitigacionDetalle",
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {

                    $("#medida-enfoque").html("");
                    var resultado = "";
                    var inicio = 0;
                    var fin = 0;
                    var total_registros = 0;
                    var pagina = 0;
                    var total_paginas = 0;

                    for (var i = 0; i < data.length; i++) {                        
                        var tr = "";
                        tr += '<tr id="detalles-tr-1">';
                        tr += '    <th class="text-center" data-encabezado="Número" scope="row">' + data[i]["ID_ENFOQUE"] + '</th>';
                        tr += '    <td data-encabezado="Medida de mitigación">'+ data[i]["MEDIDA_MIT"] +'</td>';
                        tr += '    <td class="text-center" data-encabezado="Enfoque">'+ data[i]["ENFOQUE"] +'</td>';
                        tr += '    <td data-encabezado="Estructura de columnas">';
                        tr += '          <div class="form-control">';
                        tr += '          <div class="list-group sortable-list m-0">';
                        var entidad = data[i]["ListaParametroInd"]
                        for (var j = 0; j < entidad.length; j++) {
                            var color = "0"+entidad[j]["ID_GRUPO_INDICADOR"];
                            if (entidad[j]["FORMULA"] == null){
                                tr += '     <div class="grupo-columna-' + color + ' p-1 text-center"><small style="font-weight: bold;">' + entidad[j]["NOMBRE_PARAMETRO"] + '</small></div>';
                            }else{
                                tr += '     <div class="grupo-columna-' + color + ' p-1 text-center"><small style="font-weight: bold;">' + entidad[j]["NOMBRE_PARAMETRO"] + '<i class="fas fa-square-root-alt cursor-pointer m-2 enfoque-columna-detalle" data-toggle="tooltip" data-placement="top" title="Fórmula: ' + entidad[j]["FORMULA"] + '"></i></small></div>';
                            }
                        }
                        tr += '             </div>';
                        tr += '         </div>';
                        tr += '</td>';                        
                        tr += '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr += '         <div class="btn-group">';
                        tr += '                <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr += '                <div class="dropdown-menu dropdown-menu-right">';
                        tr += '                     <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-medida-de-mitigacion" onclick="fn_seleccionarMedidaEnfoque('+data[i]["ID_ENFOQUE"]+','+ data[i]["ID_MEDMIT"]+')"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                        //tr += '                     <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-confirmacion" onclick="fn_eliminarMedidaEnfoque('+data[i]["ID_ENFOQUE"]+','+ data[i]["ID_MEDMIT"]+')"><i class="fas fa-trash"></i>&nbsp;Eliminar</a>';
                        tr += '                </div>';
                        tr += '         </div>';
                        tr += '</td>';
                        tr += '</tr>';
                        $("#medida-enfoque").append(tr);

                        pagina = Number(data[i]["pagina"]);
                        total_paginas = Number(data[i]["total_paginas"]);
                        total_registros = Number(data[i]["total_registros"]);
                        inicio = (Number(data[i]["cantidad_registros"]) * pagina) - Number(data[i]["cantidad_registros"]) + 1;
                        fin = Number(data[i]["cantidad_registros"]) * pagina;
                        if (pagina == total_paginas) {
                            if (fin > total_registros)
                                fin = total_registros
                        }
                        resultado = inicio + " de " + fin;
                    }
                    $("#resultado").html(resultado);
                    $("#total-registros").html(total_registros);
                    $("#pagina-actual").html(pagina);
                    $("#total-paginas").html(total_paginas);
                    if (Number($("#pagina").val()) > total_paginas) {
                        $("#pagina").val(total_paginas);
                    }
                }
            }
        }
    });
                                                
}

function fn_reestablecerCampo() {
    $("#cbo-medida-mitigacion").val(0);
    $("#cbo-enfoque-mitigacion").val(0);
    $("#cbo-grupo").val(1);
    $("#cbo-grupo").removeClass("grupo-columna-02").removeClass("grupo-columna-03").addClass("grupo-columna-01");
    var anterior = $("#radio-control").data("tipocontrol");
    $("#rad-controles-1").prop("checked", true);
    $("#radio-control").data("tipocontrol", 1);
    $("#control-cbo-" + anterior).attr("hidden", true);
    $("#control-cbo-1").removeAttr("hidden");
    $("#cbo-1").val(1);
    $("#columnas-detalle").html("");
    //$("#control-cbo-" + $("#radio-control").data("tipocontrol")).removeAttr("hidden");
}

function fn_cambiarAccion() {
    $("#medida-enfoque").data("accion", 1);
    $("#cbo-medida-mitigacion").prop("disabled", false);
    $("#cbo-enfoque-mitigacion").prop("disabled", false);
    fn_reestablecerCampo();
}

function fn_CargaDatos() {
    CargarDatosMedidaDetalle();
}

$(".miColumna").click(function (event) {
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


    if ($("#columna").val() == id) {
        if ($("#orden").val() == "ASC") {
            $("#orden").val("DESC")
            $("#" + id).removeClass("fa-sort-up");
            $("#" + id).addClass("fa-sort-down");
        }
        else {
            $("#orden").val("ASC")
            $("#" + id).removeClass("fa-sort-down");
            $("#" + id).addClass("fa-sort-up");
        }
        $("#" + id).css("color", "white");
    }
    else {
        $("#columna").val(id);
        $("#orden").val("ASC")
        $("#" + id).removeClass("fa-sort");
        $("#" + id).addClass("fa-sort-up");
        $("#" + id).css("color", "white");
    }

    fn_CargaDatos();
});

function fn_avance_grilla(boton) {
    var total = 0;
    var miPag = 0;
    miPag = Number($("#pagina").val());
    total = Number($("#total-paginas").html());

    if (boton == 1) {
        miPag = 1;
    }
    if (boton == 2) {
        if (miPag > 1) {
            miPag--;
        }
    }
    if (boton == 3) {
        if (miPag < total) {
            miPag++;
        }
    }
    if (boton == 4) {
        miPag = total;
    }
    $("#pagina").val(miPag);
    fn_CargaDatos();
}

function fn_buscar() {
    $("#buscar-usuarios").data("campo", $("#txt-buscar").val());
    fn_CargaDatos();
}

function exportarMantenimiento() {
    var item = {
        buscar: $("#buscar-usuarios").data("campo"),
        order_by: $("#columna").val(),
        order_orden: $("#orden").val()
    };

    var url = baseUrl + 'Mantenimiento/ExportarMantenimientoMedidaEnfoque';

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

