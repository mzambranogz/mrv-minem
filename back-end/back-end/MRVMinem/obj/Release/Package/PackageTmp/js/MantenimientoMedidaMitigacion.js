
$(document).ready(function () {
    MRV.CargarSelect(baseUrl + "Mantenimiento/ListaNamaControl", "#cbo-nama", "ID_NAMA", "DESCRIPCION_NAMA");    
    MRV.CargarSelect(baseUrl + "Mantenimiento/ListaIPCCControl", "#cbo-ipcc", "ID_IPCC", "IPCC");
    MRV.CargarSelect(baseUrl + "Gestion/ListaSectorInstitucion", "#cbo-usuario-medida", "ID_SECTOR_INST", "DESCRIPCION");
});

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
        url: baseUrl + "Mantenimiento/ListarPaginadoMedidaMitigacion",
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
                        tr = tr + '<th class="text-center" data-encabezado="Número" scope="col">' + data[i]["ID_MEDMIT"] + '</th>';
                        tr = tr + '<td data-encabezado="Medida de mitigación">' + data[i]["NOMBRE_MEDMIT"] + '</td>';
                        tr = tr + '<td class="text-center" data-encabezado="Descripción corta">' + data[i]["NUMERO_MEDMIT"] + '</td>';
                        tr = tr + '<td data-encabezado="Descripción larga">' + data[i]["DESCRIPCION_MEDMIT"] + '</td>';
                        tr = tr + '<td data-encabezado="Objetivo">' + data[i]["OBJETIVO_MEDMIT"] + '</td>';
                        tr = tr + '<td data-encabezado="IPCC">' + data[i]["IPSC_MEDMIT"] + '</td>';
                        tr = tr + '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr = tr + '     <div class="btn-group">';
                        tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';
                        tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_cargarDatosMantenimiento(' + data[i]["ID_MEDMIT"] + ');" data-toggle="modal" data-target="#modal-medida-de-mitigacion">';
                        tr = tr + '                 <i class="fas fa-edit"></i>&nbsp;Editar';
                        tr = tr + '             </a><a class="dropdown-item" href="#" onclick="fn_Seleccionaregistro(' + data[i]["ID_MEDMIT"] + ');" data-toggle="modal" data-target="#modal-confirmacion">';
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

function fn_buscar() {
    $("#buscar-usuarios").data("campo", $("#txt-buscar").val());
    fn_CargaDatos();
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

    $("#mensajeCorrecto").attr("hidden", true); //add
    $("#mensajeError").attr("hidden", true); //add
}

function fn_limpiarCampo() {
    $("#txa-nombre-medida").val("");
    $("#txt-abreviatura").val("");
    $("#cbo-nama").val(0);
    $("#txa-descripcion-medida").val("");
    $("#txa-objetivo-medida").val("");
    $("#fle-documentos").val("");
    $("#cbo-ipcc").val(0);
    $("#txt-documentos").val("");
    $("#title-nuevo").hide();
    $("#title-edit").hide();
    $("#txa-metodologia").val(""); //add
    $("#cbo-usuario-medida").val(0); //add 26-04-2020
}

function regMantenimiento() {
    fn_limpiarCampo();
    $("#validarUsuario").data("guardar", 1);
    $("#userMantenimiento").data("value", 0);
    fn_modalInicio();
    $("#title-nuevo").show();
    $(".imagen-medida").addClass("d-none");
}

function fn_cargarDatosMantenimiento(id) {
    fn_modalInicio();
    fn_limpiarCampo();
    $("#validarUsuario").data("guardar", 0)
    $("#title-nuevo").hide()
    $("#title-edit").show();
    $(".imagen-medida").removeClass("d-none");
    fn_seleccionarMantenimiento(id);
}

function fn_seleccionarMantenimiento(id) {
    var Item = {
        ID_MEDMIT: id
    };
    $.ajax({
        url: baseUrl + "Mantenimiento/BuscarMedidaMitigacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                for (var i = 0; i < data.length; i++) {
                    $("#userMantenimiento").data("value", data[i]["ID_MEDMIT"]);
                    $("#txa-nombre-medida").val(data[i]["NOMBRE_MEDMIT"]);
                    $("#txt-abreviatura").val(data[i]["NUMERO_MEDMIT"]);
                    $("#cbo-nama").val(data[i]["ID_NAMA"]);
                    $("#txa-descripcion-medida").val(data[i]["DESCRIPCION_MEDMIT"]);
                    $("#txa-objetivo-medida").val(data[i]["OBJETIVO_MEDMIT"]);
                    $("#cbo-ipcc").val(data[i]["ID_IPCC"]);
                    $("#txt-documentos").val(data[i]["ADJUNTO_BASE"]);
                    $("#txa-metodologia").val(data[i]["METODOLOGIA_MEDMIT"]); //add
                    $("#cbo-usuario-medida").val(data[i]["USUARIO_ASOCIADO_MEDMIT"]); //add
                }                
            }
        }
    });
}

function fn_validarCampo() {
    var arr = [];
    debugger;
    if ($("#txa-nombre-medida").val().trim() === "") {
        arr.push("Debe ingresar el nombre de la medida");
    }
    if ($("#txt-abreviatura").val().trim() === "") {
        arr.push("Debe ingresar la abreviatura");
    }
    if ($("#cbo-nama").val() == 0) {
        arr.push("Debe seleccionar un Nama");
    }
    if ($("#txa-descripcion-medida").val().trim() === "") {
        arr.push("Debe ingresar la descripcion de la medida");
    }
    if ($("#txa-objetivo-medida").val().trim() === "") {
        arr.push("Debe ingresar el ojetivo de la medida");
    }
    if ($("#validarUsuario").data("guardar") == 1) {
        if ($("#fle-documentos").val() == "") {
            arr.push("Debe seleccionar una imagen");
        }
    }    
    if ($("#cbo-ipcc").val() == 0) {
        arr.push("Debe seleccionar una IPCC");
    }
    if ($("#txa-metodologia").val().trim() == "") { //add
        arr.push("Debe ingresar una metodología");
    }
    if ($("#cbo-usuario-medida").val() == 0) { //add
        arr.push("Debe seleccionar el usuario al que estará asociado la medida de mitigación");
    }

    if (arr.length > 0) {
        $("#correctoMantenimientoUsuario").hide();
        $("#errorRegistrarMantenimientoUsuario").hide();
        $("#errorEditarMantenimientoUsuario").hide();
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

function fn_editarMantenimiento() {
    $("#seccionMensaje #errorRegistro").remove();


    if (!fn_validarCampo()) {
        return false;
    }

    var url = baseUrl + "Mantenimiento/RegistrarMantenimientoMedida";
    var item = {
        ID_MEDMIT: $("#userMantenimiento").data("value"),
        NOMBRE_MEDMIT: $("#txa-nombre-medida").val(),
        NUMERO_MEDMIT: $("#txt-abreviatura").val(),
        ID_NAMA: $("#cbo-nama").val(),
        DESCRIPCION_MEDMIT: $("#txa-descripcion-medida").val(),
        OBJETIVO_MEDMIT: $("#txa-objetivo-medida").val(),
        ID_IPCC: $("#cbo-ipcc").val(),
        METODOLOGIA_MEDMIT: $("#txa-metodologia").val(), //add,
        USUARIO_ASOCIADO_MEDMIT: $("#cbo-usuario-medida").val() //ADD
    };

    var options = {
        type: "POST",
        dataType: "json",
        contentType: false,
        url: url,
        processData: false,
        data: ({
            ID_MEDMIT: $("#userMantenimiento").data("value"),
            NOMBRE_MEDMIT: $("#txa-nombre-medida").val(),
            NUMERO_MEDMIT: $("#txt-abreviatura").val(),
            ID_NAMA: $("#cbo-nama").val(),
            DESCRIPCION_MEDMIT: $("#txa-descripcion-medida").val(),
            OBJETIVO_MEDMIT: $("#txa-objetivo-medida").val(),
            ID_IPCC: $("#cbo-ipcc").val(),
            METODOLOGIA_MEDMIT: $("#txa-metodologia").val(), //add
            USUARIO_ASOCIADO_MEDMIT: $("#cbo-usuario-medida").val() //ADD
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
                //$("#title-nuevo").hide();
                //$("#title-edit").hide();
                $("#errorEditarMantenimientoUsuario").hide();
                $("#errorRegistrarMantenimientoUsuario").hide();
                $("#pieMantenimientoUsuario").hide();
                $("#mensajeRegistroMantenimientoUsuario").hide();
                $("#correctoMantenimientoUsuario").show();
                $("#pieCorrecto").show();

                $("#mensajeCorrecto").removeAttr("hidden"); //add
            } else {
                $("#ventanaEditar").show();
                $("#correctoMantenimientoUsuario").hide();
                $("#errorRegistrarMantenimientoUsuario").hide();
                $("#errorEditarMantenimientoUsuario").show();

                $("#mensajeError").removeAttr("hidden"); //add
            }
        },
        error: function (myXhr, textStatus, errorThrown) {
            console.log(myXhr);
            console.log(textStatus);
            console.log(errorThrown);
        }
    };

    $("#frm-medida").ajaxForm(options);
    $("#frm-medida").submit();
}

function exportarMantenimiento() {
    var item = {
        buscar: $("#buscar-usuarios").data("campo"),
        order_by: $("#columna").val(),
        order_orden: $("#orden").val()
    };

    var url = baseUrl + 'Mantenimiento/ExportarMantenimientoMedidaMitigacion';

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

function fn_Seleccionaregistro(id) {
    $("#userMantenimiento").data("value", id);
}

function fn_eliminarMantenimiento() {
    var url = baseUrl + "Mantenimiento/EliminarMedidaMitigacion";
    var item = {
        ID_MEDMIT: $("#userMantenimiento").data("value")
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        fn_CargaDatos();
    } else {
    }
    $("#modal-confirmacion").modal('hide');

}

function mostrarImagen() {
    var item = {
        ID_MEDMIT: $("#userMantenimiento").data("value")
    };
    var url = baseUrl + "Mantenimiento/MostrarImagenMedida";
    var respuesta = MRV.Ajax(url, item, false);

    if (respuesta.success) {
        var urlMostrar = baseUrl + "images/medida_mitigacion/" + respuesta.extra;
        window.open(urlMostrar, "_blank");
    }
}

