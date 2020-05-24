function fn_reestablecerCampo() {
    $("#txt-nombre-control").val("");
    $("#cbo-tipo-control").val("cbo");
    $("#cbo-tipo-dato").val(0);
    $("#txt-etiqueta").val("");
    $("#txt-descripcion-parametro").val("");
    $("#txt-combinacion-unidades").val("");
    $("#txt-leyenda-unidades").val("");
    $("#txt-descripcion-metodologia").val("");
    $("#txt-procedimiento").val("");
    $("#txt-control-calidad").val("");
    $("#txt-aseguramiento-calidad").val("");
    $("#txt-proposito-parametro").val("");
    $("#txt-frecuencia").val("");
    $("#rad-editable").prop("checked", false);
    $("#rad-verificable").prop("checked", false);

    $("#filas-valor").html("");
    $("#parametros-id").data("eliminar", "");
    //$("#control-cbo-" + $("#radio-control").data("tipocontrol")).removeAttr("hidden");
}

function fn_seleccionarParametro(id) {
    debugger;
    $("#parametro-detalle").data("accion", 0);// 0: EDITAR | 1: REGISTRAR
    $("#titulo-reg").addClass("d-none");
    $("#titulo-act").removeClass("d-none");
    fn_reestablecerCampo();
    $("#idMantenimiento").data("value", id);
    //$("#columnas-detalle").html("");
    var item = {
        ID_PARAMETRO: id
    };

    $.ajax({
        url: baseUrl + "Mantenimiento/BuscarParametro",
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                //if (data.length > 0) {
                //for (var i = 0; i < data.length; i++) {
                var control = "";
                if (data["ID_TIPO_CONTROL"] == 1) {
                    control = "cbo";
                    $(".tipo-lista").removeClass("d-none");
                    $(".tipo-caja").addClass("d-none");
                } else {
                    control = "txt";
                    $(".tipo-lista").addClass("d-none");
                    $(".tipo-caja").removeClass("d-none");
                    $("#cbo-tipo-dato").val(data["ID_TIPO_DATO"]);
                }
                        $("#cbo-tipo-control").val(control);
                        $("#txt-nombre-control").val(data["NOMBRE_PARAMETRO"]);
                        $("#txt-descripcion-parametro").val(data["DESCRIPCION_PARAMETRO"]);
                        $("#txt-combinacion-unidades").val(data["COMBINACION_UNIDAD"]);
                        $("#txt-leyenda-unidades").val(data["LEYENDA_PARAMETRO"]);
                        $("#txt-descripcion-metodologia").val(data["DESCRIPCION_METODOLOGIA"]);
                        $("#txt-procedimiento").val(data["PROCEDIMIENTO"]);
                        $("#txt-control-calidad").val(data["CONTROL_CALIDAD"]);
                        $("#txt-aseguramiento-calidad").val(data["ASEGURAMIENTO_CALIDAD"]);
                        $("#txt-proposito-parametro").val(data["PROPOSITO"]);
                        $("#txt-frecuencia").val(data["FRECUENCIA"]);
                        
                        if (data["EDITABLE"] == 1) {
                            $("#rad-editable").prop("checked", true);
                        }
                        if (data["VERIFICABLE"] == 1) {
                            $("#rad-verificable").prop("checked", true);
                        }

                        if (data["ID_TIPO_CONTROL"] == 1) {
                            var entidad = data["listaDetalle"];
                            for (var j = 0; j < entidad.length; j++) {
                                var tr = "";
                                tr += '<div class="btn btn-secondary btn-sw w-100 d-flex flex-row align-items-center justify-content-between my-2 factor-div">';
                                tr += '     <i class="fas fa-list"></i>';
                                tr += '     <small class="badge badge-info mostrar-valor">';
                                tr += '          ' + entidad[j]["NOMBRE_DETALLE"];
                                tr += '     </small>';
                                tr += '         <input class="hidden-control field-ctrol nombre" type="hidden" value="' + entidad[j]["NOMBRE_DETALLE"] + '">';
                                tr += '         <input class="hidden-control field-ctrol valor" type="hidden" data-delete="1" value="' + entidad[j]["ID_DETALLE"] + '">';
                                tr += '     <div class="opciones">';
                                tr += '         <i class="fas fa-minus-circle cursor-pointer m-2 delete-columna-detalle esconder" data-parent="2" data-toggle="tooltip"  onclick="eliminarParametro(' + entidad[j]["ID_DETALLE"] + ');"  data-placement="top" title="" data-original-title="Eliminar"></i>';
                                tr += '         <i class="fas fa-edit cursor-pointer m-2 esconder" data-toggle="tooltip" data-placement="top" title="" onclick="editarParametro(' + entidad[j]["ID_DETALLE"] + ',this);" data-original-title="Editar"></i>';
                                tr += '     </div>';
                                tr += '</div>';
                                $("#filas-valor").append(tr);
                            }                            
                        }
                    //}
                //}
            }
        }
    });
}

function fn_cambiarAccion() {
    $("#parametro-detalle").data("accion", 1);
    $("#titulo-reg").removeClass("d-none");
    $("#titulo-act").addClass("d-none");
    fn_reestablecerCampo();
    $("#idMantenimiento").data("value", 0);
}

function fn_Seleccionaregistro(id) {
    $("#idMantenimiento").data("value", id);
}

function fn_eliminarMantenimiento() {
    debugger;
    var url = baseUrl + "Mantenimiento/EliminarParametro";
    var item = {
        ID_PARAMETRO: $("#idMantenimiento").data("value")
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        fn_CargaDatos();
    } else {
    }
    $("#modal-confirmacion").modal('hide');
}

function eliminarParametro(id) {
    if (id > 0) {
        var del = $("#parametros-id").data("eliminar") + id + ",";
        $("#parametros-id").data("eliminar", del);        
    }
}

function editarParametro(id, etiqueta, param) {
    $("#add-lista-valor-1").addClass("d-none");
    $("#edit-lista-valor-1").removeClass("d-none");

    debugger;
    var e = $(etiqueta).parent().parent().find(".nombre").val();
    $("#txt-etiqueta").val(e);
    $("#edit-lista-valor-1").data("evaluar", id);
    if (id > 0){
        $("#edit-lista-valor-1").data("detalle", e);
    } else {
        $("#edit-lista-valor-1").data("detalle", e);
    }

    $(".esconder").prop("hidden", true);

}

function actualizarParametro() {
    $(".esconder").prop("hidden", false);
    debugger;
    if ($("#edit-lista-valor-1").data("evaluar") == 0){
        var componentes = $("#filas-valor").find(".factor-div");
        componentes.each(function (index, value) {
            debugger;
            if ($(value).find(".nombre").val() == $("#edit-lista-valor-1").data("detalle")) {
                $(value).find(".nombre").val($("#txt-etiqueta").val());
                $(value).find(".mostrar-valor").html("").html($("#txt-etiqueta").val());
            }
        });
    } else {
        var componentes = $("#filas-valor").find(".factor-div");
        componentes.each(function (index, value) {
            debugger;
            if ($(value).find(".nombre").val() == $("#edit-lista-valor-1").data("detalle")) {
                $(value).find(".nombre").val($("#txt-etiqueta").val());
                $(value).find(".mostrar-valor").html("").html($("#txt-etiqueta").val());
            }
        });
    }
    $("#add-lista-valor-1").removeClass("d-none");
    $("#edit-lista-valor-1").addClass("d-none");
    $("#txt-etiqueta").val("");
}
    
function validarParametro() {
    var v = true;
    var param = $("#txt-etiqueta").val();
    if (param.trim() != "") {
        var componentes = $("#filas-valor").find(".factor-div");
        componentes.each(function (index, value) {
            //conteo++;
            if ($(value).find(".nombre").val() == param) {
                v = false;
            }
        });

        if (v) {
            agregarParametro();
        } else {
            $("#txt-etiqueta").val("");
        }
    }
}

function agregarParametro() {
    //var reponer = 0;
    //var valor = $("#cbo-factores").val();
    var valor = 0;
    var param = $("#txt-etiqueta").val();
    //var id = $("#factores-id").data("eliminar");
    //if (id != "") {
    //    id = id.substring(0, id.length - 1);
    //    var arr = id.split(',');

    //    var factor_id = "";
    //    debugger;
    //    for (var i = 0; i < arr.length; i++) {
    //        if (arr[i] != valor) {
    //            //debugger;
    //            factor_id += arr[i] + ",";
    //        } else {
    //            reponer = 1
    //        }
    //    }
    //    $("#factores-id").data("eliminar", factor_id);
    //}

    var tr = "";
    tr += '<div class="btn btn-secondary btn-sw w-100 d-flex flex-row align-items-center justify-content-between my-2 factor-div">';
    tr += '     <i class="fas fa-list"></i>';
    tr += '     <small class="badge badge-info mostrar-valor">';
    tr += '         ' + param;
    tr += '     </small>';
    tr += '         <input class="hidden-control field-ctrol nombre" type="hidden" value="' + param+ '">';
    tr += '         <input class="hidden-control field-ctrol valor" data-delete="0" type="hidden" value="' + valor + '">';
    tr += '     <div class="opciones">';
    tr += '         <i class="fas fa-minus-circle cursor-pointer m-2 delete-columna-detalle esconder" data-parent="2" data-toggle="tooltip"  onclick="eliminarParametro(' + valor + ');"  data-placement="top" title="" data-original-title="Eliminar"></i>';
    tr += '         <i class="fas fa-edit cursor-pointer m-2 esconder" data-toggle="tooltip" data-placement="top" onclick="editarParametro(' + valor + ',this);" title="" data-original-title="Editar"></i>';
    tr += '     </div>';
    tr += '</div>';
    $("#filas-valor").append(tr);
    $("#txt-etiqueta").val("");
}

function CargarDatosParametros() {
    var item = {
        buscar: $("#buscar-usuarios").data("campo"),
        cantidad_registros: $("#cantidad-registros").val(),
        pagina: $("#pagina").val(),
        order_by: $("#columna").val(),
        order_orden: $("#orden").val()
    };
    $.ajax({
        url: baseUrl + "Mantenimiento/ListarParametros",
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    debugger;
                    $("#parametro-detalle").html("");
                    var resultado = "";
                    var inicio = 0;
                    var fin = 0;
                    var total_registros = 0;
                    var pagina = 0;
                    var total_paginas = 0;

                    for (var i = 0; i < data.length; i++) {
                        //debugger;
                        var tr = "";
                        tr += '<tr id="detalles-tr-'+ (i+1) +'">';
                        tr += '    <th class="text-center" data-encabezado="Número" scope="row">' + data[i]["ID_PARAMETRO"] + '</th>';
                        tr += '    <td data-encabezado="Medida de mitigación">' + data[i]["NOMBRE_PARAMETRO"] + '</td>';
                        tr += '    <td data-encabezado="Medida de mitigación">' + data[i]["TIPO_CONTROL"] + '</td>';
                        tr += '    <td data-encabezado="Estructura de columnas">';                        
                        if (data[i]["ID_TIPO_CONTROL"] == 1) {
                            tr += '         <div class="form-control">';
                            tr += '             <div class="list-group sortable-list m-0">';
                            var entidad = data[i]["listaDetalle"]
                            for (var j = 0; j < entidad.length; j++) {
                                tr += '             <div class="p-1 text-center border-right">';
                                tr += '                 <div class="h6 span badge badge-info w-100">' + entidad[j]["NOMBRE_DETALLE"] + '</div>';
                                tr += '             </div>';
                            }
                            tr += '             </div>';
                            tr += '         </div>';
                        }    
                        tr += '</td>';
                        tr += '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr += '         <div class="btn-group">';
                        tr += '                <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr += '                <div class="dropdown-menu dropdown-menu-right">';
                        tr += '                     <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-medida-de-mitigacion" onclick="fn_seleccionarParametro(' + data[i]["ID_PARAMETRO"] + ')"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                        tr += '                     <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-confirmacion" onclick="fn_Seleccionaregistro(' + data[i]["ID_PARAMETRO"] + ');"><i class="fas fa-trash"></i>&nbsp;Eliminar</a>';
                        tr += '                </div>';
                        tr += '         </div>';
                        tr += '</td>';
                        tr += '</tr>';
                        $("#parametro-detalle").append(tr);

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

function fn_validarCampo() {
    if ($("#txt-nombre-control").val().trim() == "") {
        return false;
    }
    if ($("#cbo-tipo-control").val() == "cbo") {
        if ($("#filas-valor").html() == "") {
            return false;
        }
    }
    if ($("#cbo-tipo-control").val() == "txt") {
        if ($("#cbo-tipo-dato").val() == 0) {
            return false;
        }
    }    
    //if ($("#txt-descripcion-parametro").val().trim() == "") {
    //    return false;
    //}
    //if ($("#txt-combinacion-unidades").val().trim() == "") {
    //    return false;
    //}
    //if ($("#txt-leyenda-unidades").val().trim() == "") {
    //    return false;
    //}
    //if ($("#txt-descripcion-metodologia").val().trim() == "") {
    //    return false;
    //}
    //if ($("#txt-procedimiento").val().trim() == "") {
    //    return false;
    //}
    //if ($("#txt-control-calidad").val().trim() == "") {
    //    return false;
    //}
    //if ($("#txt-aseguramiento-calidad").val().trim() == "") {
    //    return false;
    //}
    //if ($("#txt-proposito-parametro").val().trim() == "") {
    //    return false;
    //}
    //if ($("#txt-frecuencia").val().trim() == "") {
    //    return false;
    //}
    
    return true;
}

function guardarParametro() {
    $("#msjError").attr("hidden", true);

    debugger;
    if (!fn_validarCampo()) {
        $("#msjError").removeAttr("hidden");
        return false;
    }

    var parametro = [];    
    var control = 0;
    var dato = 0;
    var param = $("#idMantenimiento").data("value");
    if ($("#cbo-tipo-control").val() == "cbo"){
        control = 1;
        var componentes = $("#filas-valor").find(".factor-div");
        componentes.each(function (index, value) {
            var indx = {
                ID_PARAMETRO: param,
                ID_DETALLE: $(value).find(".valor").val(),
                NOMBRE_DETALLE: $(value).find(".nombre").val()
            };
            parametro.push(indx);
        });
    }else{
        control = 2;
        dato = $("#cbo-tipo-dato").val();
    }

    var editable = $("#rad-editable").prop("checked");
    var verificable = $("#rad-verificable").prop("checked");
    var edi = '0';
    var ver = '0';
    if (editable) {
        edi = '1'; //0 - PRIVADO : 1 - PUBLICO
    }
    if (verificable) {
        ver = '1'; //0 - PRIVADO : 1 - PUBLICO
    }

    var id_delete = "";
    if ($("#parametros-id").data("eliminar") != "") {
        id_delete = $("#parametros-id").data("eliminar");
        id_delete = id_delete.substring(0, id_delete.length - 1);
    }

    var url = baseUrl + "Mantenimiento/RegistrarParametro";
    var item = {
        ID_PARAMETRO: $("#idMantenimiento").data("value"),
        ID_TIPO_CONTROL: control,
        ID_TIPO_DATO: dato,
        EDITABLE: edi,
        VERIFICABLE: ver,
        NOMBRE_PARAMETRO: $("#txt-nombre-control").val(),
        DESCRIPCION_PARAMETRO: $("#txt-descripcion-parametro").val(),
        COMBINACION_UNIDAD: $("#txt-combinacion-unidades").val(),
        LEYENDA_PARAMETRO: $("#txt-leyenda-unidades").val(),
        DESCRIPCION_METODOLOGIA: $("#txt-descripcion-metodologia").val(),
        PROCEDIMIENTO: $("#txt-procedimiento").val(),
        CONTROL_CALIDAD: $("#txt-control-calidad").val(),
        ASEGURAMIENTO_CALIDAD: $("#txt-aseguramiento-calidad").val(),
        PROPOSITO: $("#txt-proposito-parametro").val(),
        FRECUENCIA: $("#txt-frecuencia").val(),
        ID_DELETE_DETALLE: id_delete,
        listaDetalle: parametro
    };

    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        CargarDatosParametros();
        $("#parametros-id").data("eliminar","");
        $("#msjCorrecto").removeAttr("hidden");
        $("#pieCorrecto").removeAttr("hidden");
        $("#pieModal").attr("hidden", true);
    } else {
        $("#msjError").removeAttr("hidden");
    }
}

$("#modal-medida-de-mitigacion").on("hidden.bs.modal", function () {
    $("#msjCorrecto").attr("hidden", true);
    $("#msjError").attr("hidden", true);
    $("#pieCorrecto").attr("hidden", true);
    $("#pieModal").removeAttr("hidden");
});

function fn_CargaDatos() {
    CargarDatosParametros();
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

    var url = baseUrl + 'Mantenimiento/ExportarMantenimientoParametros';

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

$(document).ready(function () {

});