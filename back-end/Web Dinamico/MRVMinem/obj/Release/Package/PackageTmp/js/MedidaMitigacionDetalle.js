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
    columnas.each(function (index, value) {
        //debugger;
        i++;
        var formula = "";
        if ($(value).attr("data-enfoque") == 1) {
            formula = $(value).attr("data-resultado");
        }
        
        var itx = {
            //ID_TIPO_CONTROL: $(value).find("#column-control").attr("data-c"), //REACTIVAR
            //ID_PARAMETRO: $(value).find("#column-componente").attr("data-cm"),
            //ID_GRUPO_INDICADOR: $(value).find("#column-grupo").attr("data-g"),
            ID_TIPO_CONTROL: $(value).find(".column-control").attr("data-c"), //PROBAR
            ID_PARAMETRO: $(value).find(".column-componente").attr("data-cm"),
            ID_GRUPO_INDICADOR: $(value).find(".column-grupo").attr("data-g"),
            ID_ORDEN: i,
            FORMULA: formula
        }
        indicadores.push(itx);

    });
    
    var item = {
        ListaParametro: indicadores,
        ID_ENFOQUE: $("#cbo-enfoque-mitigacion").val(),
        ID_MEDMIT: $("#cbo-medida-mitigacion").val()
    };

    var url = baseUrl + 'Mantenimiento/RegistrarMedidaMitigacionDetalle';
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        alert("bien");
    }

}

$(document).on("change", "#cbo-medida-mitigacion", function () {
    debugger;
    var medida = $("#cbo-medida-mitigacion").val();
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
                    }
                }
            }
        });
    }    
});

function fn_seleccionarMedidaEnfoque(enfoque, medida) {

    $("#cbo-medida-mitigacion").val(medida);
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
                        debugger;
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
                        debugger;
                        var tr = "";
                        if (data[i]["FORMULA"] == null) {
                            tr += '<div id="' + id_mrv + '" class="list-group-item sortable-item recorrer" style="background-color: ' + color + '; color: white;" data-enfoque="" data-resultado="" draggable="false">';
                        } else {
                            tr += '<div id="' + id_mrv + '" class="list-group-item sortable-item recorrer enfoque-add sortable-chosen" style="background-color: ' + color + '; color: white;" data-enfoque="1" data-resultado="' + formula + '" draggable="true">';
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
    while ($("#cbo-enfoque-mitigacion").val() == 0) {
        $("#cbo-enfoque-mitigacion").val(enfoque);
    }

}

