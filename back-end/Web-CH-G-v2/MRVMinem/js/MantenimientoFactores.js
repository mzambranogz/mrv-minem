function fn_nuevoFactor() {
    debugger;
    $("#txt-nombre-factor").val("");
    $("#IdFactor").val("");
    $("#filas-parametro").html("");
    $("#divError").hide();
    $("#divOk").hide();
}

function fn_EditarFactorParametro(Idfactor) {
    $("#divError").hide();
    $("#divOk").hide();

    var item = {
        ID_FACTOR: Idfactor
    };

    $.ajax({
        url: baseUrl + "Dinamico/GetFactorParametro",
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        debugger;
                        $("#txt-nombre-factor").val(data[i]["NOMBRE_FACTOR"]);
                        $("#IdFactor").val(data[i]["ID_FACTOR"]);

                        var html = "";
                        if (data[i].ListaFactorParametro != null && data[i].ListaFactorParametro != "") {
                            for (var j = 0; j < data[i].ListaFactorParametro.length; j++) {
                                html += '<div class="btn btn-secondary btn-sm w-100 d-flex flex-row align-items-center justify-content-between my-2" data-value="' + data[i].ListaFactorParametro[j]["ID_PARAMETRO"] + '" ><small><i class="fas fa-list"></i> ' + data[i].ListaFactorParametro[j]["NOMBRE_DETALLE"] + '</small><input type="hidden" class="hidden-control field-ctrol" value="cbo"><i class="fas fa-minus-circle cursor-pointer m-2 delete-columna-detalle" data-toggle="tooltip" data-placement="top" title="" data-original-title="Eliminar parámetro"></i></div>';
                            }
                        }

                        $("#filas-parametro").append(html);

                    }
                }
            }
        }
    });
}

$(document).on("click", "#add-lista-parametro-1", function () {
    debugger;
    var html = "";

    html += '<div class="btn btn-secondary btn-sm w-100 d-flex flex-row align-items-center justify-content-between my-2" data-value="' + $("#cbo-parametros").val() + '" ><small><i class="fas fa-list"></i> ' + $("#cbo-parametros option:selected").html() + '</small><input type="hidden" class="hidden-control field-ctrol" value="cbo"><i class="fas fa-minus-circle cursor-pointer m-2 delete-columna-detalle" data-toggle="tooltip" data-placement="top" title="" data-original-title="Eliminar parámetro"></i></div>';
    $("#filas-parametro").append(html);
    localStorage.setItem($("#cbo-parametros").val(), $("#cbo-parametros option:selected").html());

});

function fn_listarCombo(e) {
    var id = e.id;
    var valor = $("#" + id).val();
    var anterior = $("#radio-control").data("tipocontrol");
    $("#radio-control").data("tipocontrol", valor);
    $("#control-cbo-" + anterior).attr("hidden", true);
    $("#control-cbo-" + valor).removeAttr("hidden");
}