function fn_modalInicio() {
    $("#ventanaEditar").show();
    $("#title-nuevo").hide();
    $("#title-edit").hide();
    $("#errorEditarMantenimientoUsuario").hide();
    $("#errorRegistrarMantenimientoUsuario").hide();
    $("#correctoMantenimientoUsuario").hide();
    $("#mensajeRegistroMantenimientoUsuario").show();
    $("#pieMantenimientoUsuario").show();
    $("#pieCorrecto").hide();
}

function fn_CargaDatos() {
    debugger;
    var Item = {
        buscar: $("#buscar-usuarios").data("campo"),
        cantidad_registros: $("#cantidad-registros").val(),
        pagina: $("#pagina").val(),
        order_by: $("#columna").val(),
        order_orden: $("#orden").val()
    };
    $.ajax({
        url: baseUrl + "Mantenimiento/ListaEnfoques",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {

                    $("#cuerpoMantenimiento").html("");
                    var resultado = "";
                    var inicio = 0;
                    var fin = 0;
                    var total_registros = 0;
                    var pagina = 0;
                    var total_paginas = 0;

                    for (var i = 0; i < data.length; i++) {

                        var tr = '<tr>';
                        tr = tr + '<th class="text-center" data-encabezado="Número" scope="col">' + data[i]["ID_ENFOQUE"] + '</th>';
                        tr = tr + '<td data-encabezado="Descripcion">' + data[i]["DESCRIPCION"] + '</td>';
                        tr = tr + '<td data-encabezado="Descripcion">' + data[i]["DESCRIPCION_MEDMIT"] + '</td>';
                        tr = tr + '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr = tr + '     <div class="btn-group">';
                        tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';
                        tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_cargarDatosMantenimiento(' + data[i]["ID_ENFOQUE"] + ');" data-toggle="modal" data-target="#modal-edicion">';
                        tr = tr + '                 <i class="fas fa-edit"></i>&nbsp;Editar';
                        tr = tr + '             </a><a class="dropdown-item" href="#" onclick="fn_Seleccionaregistro(' + data[i]["ID_ENFOQUE"] + ');" data-toggle="modal" data-target="#modal-confirmacion">';
                        tr = tr + '                 <i class="fas fa-trash"></i>&nbsp;Eliminar';
                        tr = tr + '             </a>';
                        tr = tr + '         </div>';
                        tr = tr + "     </div></td>";
                        tr = tr + '</tr>';
                        $("#cuerpoMantenimiento").append(tr);

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

function regMantenimiento() {
    fn_limpiarCampo();
    $("#validarUsuario").data("guardar", 1);
    $("#userMantenimiento").data("value", 0);
    fn_modalInicio();
    $(".documento-enfoque").addClass("d-none");
    $("#title-nuevo").show()
}

function fn_limpiarCampo() {
    $("#txt-descripcion").val("");
    $("#cbo-medida").val(0);
    $("#txt-documentos").val("");
    $("#fle-documentos").val("");
    $("#title-nuevo").hide();
    $("#title-edit").hide();
}

function fn_cargarDatosMantenimiento(id) {
    fn_modalInicio();
    $("#validarUsuario").data("guardar", 0)
    $("#title-nuevo").hide()
    $("#title-edit").show();
    $(".documento-enfoque").removeClass("d-none");
    fn_seleccionarMantenimiento(id);
}

function fn_seleccionarMantenimiento(id) {
    var Item = {
        ID_ENFOQUE: id
    };
    $.ajax({
        url: baseUrl + "Mantenimiento/BuscarEnfoque",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                $("#userMantenimiento").data("value", data["ID_ENFOQUE"]);
                $("#txt-descripcion").val(data["DESCRIPCION"]);
                $("#cbo-medida").val(data["ID_MEDMIT"]);
                $("#txt-documentos").val(data["ADJUNTO_BASE"]);
                $(".documento-enfoque").html("").html('<a class="input-group-append" data-toggle="tooltip" data-placement="top" title="Descargar documento" href="/Documentos/Exportar/' + data["ADJUNTO"] + '" download><span class="input-group-text cursor-pointer"><i class="fas fa-download"></i></span></a>');
            }
        }
    });
}

function fn_editarMantenimiento() {
    $("#seccionMensaje #errorRegistro").remove();

    if ($("#validarUsuario").data("guardar") == 1) {
        if (!fn_validarCampo()) {
            return false;
        }
    }

    var url = baseUrl + "Mantenimiento/RegistrarEnfoque";
    var item = {
        ID_ENFOQUE: $("#userMantenimiento").data("value"),
        DESCRIPCION: $("#txt-descripcion").val(),
        ID_MEDMIT: $("#cbo-medida").val(),
        FLAG_ESTADO: $("#validarUsuario").data("guardar")
    };


    var options = {
        type: "POST",
        dataType: "json",
        contentType: false,
        url: url,
        processData: false,
        data: ({
            ID_ENFOQUE: $("#userMantenimiento").data("value"),
            DESCRIPCION: $("#txt-descripcion").val(),
            ID_MEDMIT: $("#cbo-medida").val(),
            FLAG_ESTADO: $("#validarUsuario").data("guardar")
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
                fn_CargaDatos();
                $("#ventanaEditar").hide();
                $("#title-nuevo").hide();
                $("#title-edit").hide();
                $("#errorEditarMantenimientoUsuario").hide();
                $("#errorRegistrarMantenimientoUsuario").hide();
                $("#pieMantenimientoUsuario").hide();
                $("#mensajeRegistroMantenimientoUsuario").hide();
                $("#correctoMantenimientoUsuario").show();
                $("#pieCorrecto").show();
            } else {
                $("#ventanaEditar").show();
                $("#correctoMantenimientoUsuario").hide();
                $("#errorRegistrarMantenimientoUsuario").hide();
                $("#errorEditarMantenimientoUsuario").show();
            }
        },
        error: function (myXhr, textStatus, errorThrown) {
            console.log(myXhr);
            console.log(textStatus);
            console.log(errorThrown);
        }
    };

    $("#frm-enfoque").ajaxForm(options);
    $("#frm-enfoque").submit();

    //var mensaje = "";
    //var respuesta = MRV.Ajax(url, item, false);
    //if (respuesta.success) {
    //    fn_CargaDatos();
    //    $("#ventanaEditar").hide();
    //    $("#title-nuevo").hide();
    //    $("#title-edit").hide();
    //    $("#errorEditarMantenimientoUsuario").hide();
    //    $("#errorRegistrarMantenimientoUsuario").hide();
    //    $("#pieMantenimientoUsuario").hide();
    //    $("#mensajeRegistroMantenimientoUsuario").hide();
    //    $("#correctoMantenimientoUsuario").show();
    //    $("#pieCorrecto").show();
    //} else {
    //    $("#ventanaEditar").show();
    //    $("#correctoMantenimientoUsuario").hide();
    //    $("#errorRegistrarMantenimientoUsuario").hide();
    //    $("#errorEditarMantenimientoUsuario").show();
    //}
}

$("#modal-edicion").on("hidden.bs.modal", function () {
    $("#correctoMantenimientoUsuario").hide();
    $("#errorRegistrarMantenimientoUsuario").hide();
    $("#errorEditarMantenimientoUsuario").hide();
    $("#seccionMensaje #errorRegistro").remove();
});

function fn_validarCampo() {
    var arr = [];

    if ($("#txt-descripcion").val().trim() === "") {
        arr.push("Debe ingresar el nombre del enfoque");
    }

    if ($("#cbo-medida").val() == 0) {
        arr.push("Debe seleccionar una medida");
    }
    debugger;
    if ($("#validarUsuario").data("guardar") == 1) {
        if ($("#fle-documentos").val() == "") {
            arr.push("Debe seleccionar un archivo");
        }
    }

    if (arr.length > 0) {
        $("#correctoMantenimientoUsuario").hide();
        $("#errorRegistrarMantenimientoUsuario").hide();
        $("#errorEditarMantenimientoUsuario").hide();
        var error = '';
        $.each(arr, function (ind, elem) {
            error = error + '<small class="mb-0">' + elem + '</small><br/>';
        });
        var msj = '                      <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="errorRegistro">';
        msj = msj + '                           <div class="alert-wrap mr-3">';
        msj = msj + '                                <div class="sa">';
        msj = msj + '                                    <div class="sa-error">';
        msj = msj + '                                        <div class="sa-error-x">';
        msj = msj + '                                            <div class="sa-error-left"></div>';
        msj = msj + '                                            <div class="sa-error-right"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                        <div class="sa-error-placeholder"></div>';
        msj = msj + '                                        <div class="sa-error-fix"></div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        msj = msj + '                            <div class="alert-wrap">';
        msj = msj + '                                <h6>Error de registro</h6>';
        msj = msj + '                                <hr><small class="mb-0">Verifique que los datos sean correctamente ingresados, complete todos los campos obligatorios e intente otra vez.</small>';
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#seccionMensaje").append(msj);
        return false;
    }
    return true;
}

function fn_Seleccionaregistro(id) {
    $("#userMantenimiento").data("value", id);
}

function fn_eliminarMantenimiento() {
    var url = baseUrl + "Mantenimiento/EliminarEnfoque";
    var item = {
        ID_ENFOQUE: $("#userMantenimiento").data("value")
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        fn_CargaDatos();
    } else {
    }
    $("#modal-confirmacion").modal('hide');
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

    var url = baseUrl + 'Mantenimiento/ExportarMantenimientoEnfoques';

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
    fn_modalInicio();
    MRV.CargarSelect(baseUrl + "Portal/ListarMedidaMitigacion", "#cbo-medida", "ID_MEDMIT", "NOMBRE_MEDMIT");
    fn_actualizaCampana();
    enLinea();
});