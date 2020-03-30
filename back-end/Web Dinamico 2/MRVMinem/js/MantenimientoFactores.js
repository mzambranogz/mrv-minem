var parametros = new Array();


$(document).ready(function () {
    $("#radio-control").data("tipocontrol", 1) // add
    $('html, body').animate({ scrollTop: scroll }, 1000);
    //fn_CargarNotificacion();

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

        fn_CargarFactores();
    });

    //fn_actualizaCampana();
    //enLinea();

});


function fn_nuevoFactor() {
    debugger;
    $("#txt-nombre-factor").val("");
    $("#txt-unidad-factor").val(""); //add
    $("#IdFactor").val("");
    $("#filas-parametro").html("");
    $("#divError").hide();
    $("#divOk").hide();
    $("#unidad-medida").data("unidad", 0); //add
    $("#radio-control").data("tipocontrol", 1) // add
}

function fn_EditarFactorParametro(Idfactor) {
    $("#divError").hide();
    $("#divOk").hide();
    $("#filas-parametro").html("");
    var item = {
        ID_FACTOR: Idfactor
    };

    $.ajax({
        url: baseUrl + "Mantenimiento/GetFactorParametro",
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        //debugger;
                        $("#txt-nombre-factor").val(data[i]["NOMBRE_FACTOR"]);
                        $("#IdFactor").val(data[i]["ID_FACTOR"]);

                        $("#unidad-medida").data("unidad", data[i]["ID_DETALLE"]); // add
                        $("#txt-unidad-factor").val(data[i]["UNIDAD_MEDIDA"]);

                        var html = "";
                        if (data[i].ListaFactorParametro != null && data[i].ListaFactorParametro != "") {
                            for (var j = 0; j < data[i].ListaFactorParametro.length; j++) {
                                html += '<div class="btn btn-secondary btn-sm w-100 d-flex flex-row align-items-center justify-content-between my-2" ';
                                html += 'data-value="' + data[i].ListaFactorParametro[j]["ID_TIPO_CONTROL"] + "|" + data[i].ListaFactorParametro[j]["ID_PARAMETRO"] + '" '
                                html += 'data-name="' + data[i].ListaFactorParametro[j]["NOMBRE_DETALLE"] + '" '
                                html += 'data-detalle="' + data[i].ListaFactorParametro[j]["ID_DETALLE"] + '" '
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
        html += 'data-detalle="" ';
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
            if (objetos[i].dataset.value == $('input:radio[name=rad-controles]:checked').val() + "|" + $("#cbo-parametros-" + $("#radio-control").data("tipocontrol")).val()) {
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
    if ($("#txt-unidad-factor").val() == "") {
        $("#divError").show();
        $("#msgError").html("Ingrese la unidad(es) de medida del factor, verifique antes de continuar");
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
                NOMBRE_DETALLE: objetos[i].dataset.name,
                ID_DETALLE: objetos[i].dataset.detalle
            };
            parametros.push(itx);
        }

        var item = {
            ID_FACTOR: $("#IdFactor").val(),
            NOMBRE_FACTOR: $("#txt-nombre-factor").val(),
            UNIDAD_MEDIDA: $("#txt-unidad-factor").val(), //add
            ID_DETALLE: $("#unidad-medida").data("unidad"), //add
            ListaFactorParametro: parametros
        }

        var url = baseUrl + 'Mantenimiento/RegistraParametrosFactor';
        var respuesta = MRV.Ajax(url, item, false);
        if (respuesta.success) {
            $("#divError").hide();
            $("#divOk").show();
            setTimeout(fn_dirigir, 5000);
        }
    }
}

function fn_dirigir() {
    location.href = baseUrl + "Mantenimiento/MantenimientoFactores";
}


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
    fn_CargarFactores();
}

function fn_CargarFactores() {
    var Item = {
        ID_ROL: $("#Control").data("rol"),
        ID_USUARIO: $("#Control").data("usuario"),
        cantidad_registros: $("#cantidad-registros").val(),
        pagina: $("#pagina").val(),
        order_by: $("#columna").val(),
        order_orden: $("#orden").val(),
        buscar: $("#buscar-usuarios").data("campo"),
    };

    $.ajax({
        url: baseUrl + "Mantenimiento/ListaFactores",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {

            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#cuerpoFactores").html("");
                    var resultado = "";
                    var inicio = 0;
                    var fin = 0;
                    var total_registros = 0;
                    var pagina = 0;
                    var total_paginas = 0;

                    for (var i = 0; i < data.length; i++) {


                        var tr = '<tr>';
                        tr = tr + '     <th class="text-center" data-encabezado="Número" scope="row">' + data[i]["ID_FACTOR"] + '</th>';
                        tr = tr + '     <td data-encabezado="Nombre del Factor">' + data[i]["NOMBRE_FACTOR"] + '</td>';
                        tr = tr + '     <td data-encabezado="Estructura de columnas">';
                        tr = tr + '         <div class="form-control">';
                        tr = tr + '             <div class="list-group sortable-list m-0">';
                        tr = tr + '                 <div class="list-group sortable-list m-0">';

                        if (data[i].ListaFactorParametro != null && data[i].ListaFactorParametro != "") {
                            for (var j = 0; j < data[i].ListaFactorParametro.length; j++) {
                                tr = tr + '             <div class="mx-1 p-1 text-center border-right"><small>' + data[i].ListaFactorParametro[j]["NOMBRE_DETALLE"] + '</small></div>';
                            }
                        }
                        tr = tr + '                 </div>';
                        tr = tr + '             </div>';
                        tr = tr + '         </div>';
                        tr = tr + '     </td>';
                        tr = tr + '     <td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr = tr + '         <div class="btn-group">';
                        tr = tr + '             <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr = tr + '             <div class="dropdown-menu dropdown-menu-right">'
                        tr = tr + '             <a class="dropdown-item" href="javascript:void(0)" data-toggle="modal" data-target="#modal-medida-de-mitigacion" onclick="fn_EditarFactorParametro(' + data[i]["ID_FACTOR"] + ')"><i class="fas fa-edit"></i>&nbsp;Editar</a></div>';
                        tr = tr + '         </div>';
                        tr = tr + '     </td>';
                        tr = tr + '</tr>';
                        $("#cuerpoFactores").append(tr);

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

function fn_buscar() {
    $("#buscar-usuarios").data("campo", $("#txt-buscar").val());
    fn_CargarFactores();
}