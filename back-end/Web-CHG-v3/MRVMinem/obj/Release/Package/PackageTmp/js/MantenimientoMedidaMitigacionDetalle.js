
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

function fn_guardarMedidaDetalle() {
    //debugger;

    
    indicadores = [];
    var columnas = $("#columnas-detalle").find(".recorrer");
    var i = 0;
    var ins = 0;
    columnas.each(function (index, value) {
        debugger;
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

    });
    
    var item = {
        ListaParametro: indicadores,
        ID_ENFOQUE: $("#cbo-enfoque-mitigacion").val(),
        ID_MEDMIT: $("#cbo-medida-mitigacion").val()
    };

    var url = "";
    if ($("#medida-enfoque").data("accion") == 0){
        url = baseUrl + 'Mantenimiento/RegistrarMedidaMitigacionDetalle';
    } else if (("#medida-enfoque").data("accion") == 1) {
        url = baseUrl + 'Mantenimiento/ActualizarMedidaMitigacionDetalle';
    }

    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        CargarDatosMedidaDetalle();
        alert("bien");
    }

}

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
//    $("#medida-mitigacion").data("accion", 0); // 1: EDITAR | 0: REGISTRAR
//}

function fn_seleccionarMedidaEnfoque(enfoque, medida) {
    debugger;
    //$("#medida-mitigacion").data("accion", 1); // 1: EDITAR | 0: REGISTRAR
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

                        if (data[i]["FORMULA"] != null) {
                            var f = data[i]["FORMULA"].split('|');
                            for (var j = 0; j < f.length; j++) {

                                html += '<div class="list-group-item sortable-item" data-value="'+ f[j] +'">';
                                html += '   <i class="fas fa-2x fa-arrows-alt"></i>';
                                html += '   <small class="badge badge-secondary">' + f[j] + '</small>';
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
                            tr += '<div id="' + id_mrv + '" class="list-group-item sortable-item recorrer enfoque-add sortable-chosen" style="background-color: ' + color + '; color: white;" data-enfoque="1" data-resultado="' + formula + '" data-resultadobd="' + data[i]["FORMULA"] + '" draggable="true">';
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
                    for (var i = 0; i < data.length; i++) {                        
                        var tr = "";
                        tr += '<tr id="detalles-tr-1">';
                        tr += '    <th class="text-center" data-encabezado="Número" scope="row">'+(i+1)+'</th>';
                        tr += '    <td data-encabezado="Medida de mitigación">'+ data[i]["MEDIDA_MIT"] +'</td>';
                        tr += '    <td class="text-center" data-encabezado="Enfoque">'+ data[i]["ENFOQUE"] +'</td>';
                        tr += '    <td data-encabezado="Estructura de columnas">';
                        tr += '          <div class="form-control">';
                        tr += '          <div class="list-group sortable-list m-0">';
                        var entidad = data[i]["ListaParametroInd"]
                        for (var j = 0; j < entidad.length; j++){
                            if (entidad[j]["FORMULA"] == null){
                                tr += '     <div class="p-1 text-center" style="background-color: '+entidad[j]["COLOR_GRUPO"]+'; color: white;"><small style="font-weight: bold;">'+entidad[j]["NOMBRE_PARAMETRO"]+'</small></div>';
                            }else{
                                tr += '     <div class="p-1 text-center" style="background-color: '+entidad[j]["COLOR_GRUPO"]+'; color: white;"><small style="font-weight: bold;">'+entidad[j]["NOMBRE_PARAMETRO"]+'<i class="fas fa-square-root-alt cursor-pointer m-2 enfoque-columna-detalle" data-toggle="tooltip" data-placement="top" title="Fórmula: '+entidad[j]["FORMULA"]+'"></i></small></div>';
                            }
                        }
                        tr += '             </div>';
                        tr += '         </div>';
                        tr += '</td>';                        
                        tr += '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr += '         <div class="btn-group">';
                        tr += '                <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr += '                <div class="dropdown-menu dropdown-menu-right">';
                        tr += '                     <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-medida-de-mitigacion" onclick="fn_seleccionarMedidaEnfoque(@item.ID_ENFOQUE,@item.ID_MEDMIT)"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                        tr += '                     <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-confirmacion" onclick="fn_eliminarMedidaEnfoque(@item.ID_ENFOQUE,@item.ID_MEDMIT)"><i class="fas fa-trash"></i>&nbsp;Eliminar</a>';
                        tr += '                </div>';
                        tr += '         </div>';
                        tr += '</td>';
                        tr += '</tr>';
                        $("#medida-enfoque").append(tr);
                    }
                }
            }
        }
    });


                                                        

                                                
}

