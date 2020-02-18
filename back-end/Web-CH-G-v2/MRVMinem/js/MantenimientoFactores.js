var parametros = new Array();

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
                                html += '<div class="btn btn-secondary btn-sm w-100 d-flex flex-row align-items-center justify-content-between my-2" ';
                                html += 'data-value="' + data[i].ListaFactorParametro[j]["ID_TIPO_CONTROL"] + "|" + data[i].ListaFactorParametro[j]["ID_PARAMETRO"] + '" '
                                html += 'data-name="' + data[i].ListaFactorParametro[j]["NOMBRE_DETALLE"] + '" '
                                html += 'id="parametro-' + (j + 1).toString() + '">';
                                html += '<small><i class="fas fa-list"></i> ' + data[i].ListaFactorParametro[j]["NOMBRE_DETALLE"] + '</small>';
                                html += '<input type="hidden" class="hidden-control field-ctrol" value="cbo"><i class="fas fa-minus-circle cursor-pointer m-2 delete-columna-detalle" data-toggle="tooltip" data-placement="top" title="" data-original-title="Eliminar parámetro"></i></div>';
                            }
                        }
                        $("#filas-parametro").append(html);
                    }
                    $("#filas-parametro").data("parametro", (data.length - 1));
                }
            }
        }
    });
}

$(document).on("click", "#add-lista-parametro-1", function () {
    debugger;
    var html = "";

    if (fn_validarAddParametros()) {
        html += '<div class="btn btn-secondary btn-sm w-100 d-flex flex-row align-items-center justify-content-between my-2" ';
        html += 'data-value="' + $('input:radio[name=rad-controles]:checked').val() + "|" + $("#cbo-parametros-" + $("#radio-control").data("tipocontrol")).val() + '" ';
        html += 'data-name="' + $("#cbo-parametros-" + $("#radio-control").data("tipocontrol") + " option:selected").html() + '" ';
        html += 'id="parametro-' + $("#cbo-parametros-" + $("#radio-control").data("tipocontrol")).val() + '">';
        html += '<small><i class="fas fa-list"></i> ' + $("#cbo-parametros-" + $("#radio-control").data("tipocontrol") + " option:selected").html() + '</small>';
        html += '<input type="hidden" class="hidden-control field-ctrol" value="cbo"><i class="fas fa-minus-circle cursor-pointer m-2 delete-columna-detalle" data-toggle="tooltip" data-placement="top" title="" data-original-title="Eliminar parámetro"></i></div>';
        $("#filas-parametro").append(html);
    }

});

function fn_listarCombo(e) {
    var id = e.id;
    var valor = $("#" + id).val();
    var anterior = $("#radio-control").data("tipocontrol");
    $("#radio-control").data("tipocontrol", valor);
    $("#cbo-parametros-" + anterior).attr("hidden", true);
    $("#cbo-parametros-" + valor).removeAttr("hidden");
    $("#divError").hide();
}

function fn_validarAddParametros() {
    var objetos = $("[id^=parametro-]");

    if (objetos.length == 0) {
        return true;
    }
    else {
        for (var i = 0; i < objetos.length; i++) {
            if (objetos[i].dataset.value == $("#cbo-parametros-" + $("#radio-control").data("tipocontrol")).val()) {
                $("#divError").show();
                $("#msgError").html("Parámetro ya fue ingresado previamente, verifique antes de continuar");
                return false;
            }
            else {
                $("#divError").hide();
            }
        }
        return true;
    }
}

function fn_validarSaveParametros() {
    var objetos = $("[id^=parametro-]");

    if (objetos.length == 0) {
        $("#divError").show();
        $("#msgError").html("Ingrese los Parámetros asociados al factor, verifique antes de continuar");
        return false;
    }
    if ($("#txt-nombre-factor").val() == "") {
        $("#divError").show();
        $("#msgError").html("Ingrese el nombre del factor, verifique antes de continuar");
        return false;
    }
    $("#divError").hide();
    return true;
}

function fn_guardarFactor() {
    if (fn_validarSaveParametros()) {
        var objetos = $("[id^=parametro-]");

        for (var i = 0; i < objetos.length; i++) {
            var valores = objetos[i].dataset.value.toString().split("|");
            var itx = {
                ID_TIPO_CONTROL: valores[0],
                ID_PARAMETRO: valores[1],
                ORDEN: (i + 1),
                ID_FACTOR: $("#IdFactor").val(),
                NOMBRE_DETALLE: objetos[i].dataset.name
            };
            parametros.push(itx);
        }

        var item = {
            ID_FACTOR: $("#IdFactor").val(),
            NOMBRE_FACTOR: $("#txt-nombre-factor").val(),
            ListaFactorParametro: parametros
        }

        var url = baseUrl + 'Dinamico/RegistraParametrosFactor';
        var respuesta = MRV.Ajax(url, item, false);
        if (respuesta.success) {
            alert("bien");
        }


    }
}