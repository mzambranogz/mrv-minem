function fn_CargaUsuarios() {
    debugger;
    var Item = {
        buscar: $("#buscar-usuarios").data("campo"),
        cantidad_registros: $("#cantidad-registros").val(),
        pagina: $("#pagina").val(),
        order_by: $("#columna").val(),
        order_orden: $("#orden").val()
    };
    $.ajax({
        url: baseUrl + "Gestion/BuscarMantenimientoUsuario",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {

                    $("#cuerpoMantenimientoUsuario").html("");
                    var resultado = "";
                    var inicio = 0;
                    var fin = 0;
                    var total_registros = 0;
                    var pagina = 0;
                    var total_paginas = 0;

                    for (var i = 0; i < data.length; i++) {

                        var tr = '<tr>';
                        tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + data[i]["ID_USUARIO"] + '</th>';
                        tr = tr + '<td data-encabezado="Nombre y Apellido">' + data[i]["NOMBRES"] + '</td>';
                        tr = tr + '<td data-encabezado="Email">' + data[i]["CORREO"] + '</td>';
                        tr = tr + '<td data-encabezado="Istitución">' + data[i]["INSTITUCION"] + '</td>';
                        if (data[i]["TELEFONO_USUARIO"] == null) {
                            tr = tr + '<td data-encabezado="Dirección">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + ' - ' + data[i]["CELULAR_USUARIO"] + '</td>';
                        } else if (data[i]["CELULAR_USUARIO"] == null) {
                            tr = tr + '<td data-encabezado="Dirección">' + data[i]["TELEFONO_USUARIO"] + ' -  </td>';
                        } else {
                            tr = tr + '<td data-encabezado="Dirección">' + data[i]["TELEFONO_USUARIO"] + ' - ' + data[i]["CELULAR_USUARIO"] + '</td>';
                        }
                        tr = tr + '<td data-encabezado="Perfil">';
                        tr = tr + '     <span class="badge badge-actor-' + data[i]["COLOR"] + '">' + data[i]["ROL"] + '</span>';
                        tr = tr + '</td>';
                        tr = tr + '<td data-encabezado="Estado">';
                        tr = tr + '     <span class="badge badge-actor-' + data[i]["COLOR_ESTADO"] + '"><i class="fas fa-'+data[i]["ICONO_ESTADO"]+'-circle mr-1"></i>' + data[i]["ESTADO"] + '</span>';
                        tr = tr + '</td>';
                        tr = tr + '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr = tr + '     <div class="btn-group">';
                        tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';
                        tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_cargarDatosUserMantenimiento(' + data[i]["ID_USUARIO"] + ');" data-toggle="modal" data-target="#modal-usuario">';
                        tr = tr + '                 <i class="fas fa-check"></i>&nbsp;Verificar';
                        tr = tr + '             </a><a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-confirmacion" onclick="guardarIdUsuario(' + data[i]["ID_USUARIO"] + ');">';
                        tr = tr + '                 <i class="fas fa-times-circle"></i>&nbsp;Deshabilitar';
                        tr = tr + '             </a>';
                        tr = tr + '         </div>';
                        tr = tr + "     </div></td>";
                        tr = tr + '</tr>';
                        $("#cuerpoMantenimientoUsuario").append(tr);

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
    debugger;
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

    fn_CargaUsuarios();
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
    fn_CargaUsuarios();
}



function fn_modalInicio() {
    $("#ventanaEditar").show();
    $("#cabeceraRegistrarMantenimientoUsuario").show();
    $("#cabeceraEditarMantenimientoUsuario").show();
    $("#errorEditarMantenimientoUsuario").hide();
    $("#errorRegistrarMantenimientoUsuario").hide();
    $("#correctoMantenimientoUsuario").hide();
    $("#mensajeRegistroMantenimientoUsuario").show();
    $("#pieMantenimientoUsuario").show();
    $("#pieCorrecto").hide();
}

function CargarTablaMantenimiento() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Gestion/ListaMantenimientoUsuario",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#cuerpoMantenimientoUsuario").html("");
                    for (var i = 0; i < data.length; i++) {
                        var tr = '<tr>';
                        tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + (1 + i) + '</th>';
                        tr = tr + '<td data-encabezado="Nombre y Apellido">' + data[i]["NOMBRES"] + '</td>';
                        tr = tr + '<td data-encabezado="Email">' + data[i]["CORREO"] + '</td>';
                        tr = tr + '<td data-encabezado="Istitución">' + data[i]["INSTITUCION"] + '</td>';
                        if (data[i]["TELEFONO_USUARIO"] == null) {
                            tr = tr + '<td data-encabezado="Dirección">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + ' - ' + data[i]["CELULAR_USUARIO"] + '</td>';
                        } else if (data[i]["CELULAR_USUARIO"] == null) {
                            tr = tr + '<td data-encabezado="Dirección">' + data[i]["TELEFONO_USUARIO"] + ' -  </td>';
                        } else {
                            tr = tr + '<td data-encabezado="Dirección">' + data[i]["TELEFONO_USUARIO"] + ' - ' + data[i]["CELULAR_USUARIO"] + '</td>';
                        }
                        tr = tr + '<td data-encabezado="Perfil">';
                        tr = tr + '     <span class="badge badge-actor-' + data[i]["COLOR"] + '">' + data[i]["ROL"] + '</span>';
                        tr = tr + '</td>';
                        tr = tr + '<td data-encabezado="Estado">';
                        tr = tr + '     <span class="badge badge-actor-' + data[i]["COLOR_ESTADO"] + '"><i class="fas fa-question-circle mr-1"></i>' + data[i]["ESTADO"] + '</span>';
                        tr = tr + '</td>';
                        tr = tr + '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr = tr + '     <div class="btn-group">';
                        tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';
                        tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_cargarDatosUserMantenimiento(' + data[i]["ID_USUARIO"] + ');" data-toggle="modal" data-target="#modal-usuario">';
                        tr = tr + '                 <i class="fas fa-edit"></i>&nbsp;Verificar';
                        tr = tr + '             </a><a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-confirmacion">';
                        tr = tr + '                 <i class="fas fa-trash"></i>&nbsp;Deshabilitar';
                        tr = tr + '             </a>';
                        tr = tr + '         </div>';
                        tr = tr + "     </div></td>";
                        tr = tr + '</tr>';
                        $("#cuerpoMantenimientoUsuario").append(tr);
                    }
                }
            }
        }
    });
}

function fn_seleccionarMantenimientoUsuario(id) {
    var Item = {
        ID_USUARIO: id
    };
    $.ajax({
        url: baseUrl + "Gestion/SeleccionarMantenimientoUsuario",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {

                $("#rad-01").prop("checked", false);
                $("#rad-02").prop("checked", false);

                var medmit = $("[id^=rad-med-0]");
                if (medmit.length > 0) {
                    for (var i = 0; i < medmit.length; i++) {
                        medmit[i].checked = false;
                    }
                }

                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#userMantenimiento").data("value", data[i]["ID_USUARIO"]);
                        $("#txt-user").val(data[i]["EMAIL_USUARIO"]);
                        $("#txt-nombre").val(data[i]["NOMBRES_USUARIO"]);
                        $("#txt-apellido").val(data[i]["APELLIDOS_USUARIO"]);
                        $("#txt-telefono").val(data[i]["TELEFONO_USUARIO"]);
                        $("#txt-celular").val(data[i]["CELULAR_USUARIO"]);
                        $("#txt-anexo").val(data[i]["ANEXO_USUARIO"]);
                        $("#txt-institucion").val(data[i]["INSTITUCION"]);
                        $("#txt-direccion").val(data[i]["DIRECCION"]);
                        $("#txt-ruc").val(data[i]["RUC"]);
                        $("#cbo-sector").val(data[i]["ID_SECTOR_INST"]);
                        $("#cbo-perfil").val(data[i]["ID_ROL"]);
                        $("#estado-usuario").data("estado", data[i]["ID_ESTADO_USUARIO"]); //ADD
                        if (data[i]["ID_ESTADO_USUARIO"] == 1) {
                            $("#rad-01").prop("checked", true);
                        } else if (data[i]["ID_ESTADO_USUARIO"] == 2) {
                            $("#rad-02").prop("checked", true);
                        }
                        $("#archivo-declaracion #seccion-file").remove();
                        if (data[i]["ADJUNTO_BASE"] != null) {
                            //for (var sus = 0; sus < data[i]["ListaSustentos"].length; sus++) {

                                var output = [];
                                var extension = "fa-file-word";

                                if (data[i]["ADJUNTO_BASE"].includes("pdf")) {
                                    extension = "fa-file-pdf";
                                } else {
                                    if (data[i]["ADJUNTO_BASE"].includes("jpeg") || data[i]["ADJUNTO_BASE"].includes("png") || data[i]["ADJUNTO_BASE"].includes("jpg")) {
                                        extension = "fa-file-image";
                                    } else {
                                        if (data[i]["ADJUNTO_BASE"].includes("xlsx") || data[i]["ADJUNTO_BASE"].includes("xls")) {
                                            extension = "fa-file-excel";
                                        } else {
                                            if (data[i]["ADJUNTO_BASE"].includes("pptx") || data[i]["ADJUNTO_BASE"].includes("ppt")) {
                                                extension = "fa-file-powerpoint";
                                            } else {
                                                if (data[i]["ADJUNTO_BASE"].includes("docx") || data[i]["ADJUNTO_BASE"].includes("doc")) {
                                                    extension = "fa-file-word";
                                                } else {
                                                    extension = "fa-file";
                                                }
                                            }
                                        }
                                    }
                                }
                                //$("#archivo-declaracion #seccion-file").remove();                                
                                //output.push('<div id="seccion-file">', '<label for="txt-declaracion">Declaración jurada</label>', '<div class="input-group mb-3">', '<div class="input-group-prepend">', '<span class="input-group-text">', '<i class="fas ', extension, '">', '</i>', '</span>', '</div>', '<span class="form-control-plaintext">', decodeURI(data[i]["ADJUNTO_BASE"]), '</span>', '<div class="form-group m-0">', '<label class="btn btn-secondary btn-sm m-0" onclick="fn_verfileDeclaracion(', data[i]["ID_USUARIO"], ')"><i class="fas fa-download"></i>Ver</label>', '</div>', '</div>', '</div>');
                                output.push('<div id="seccion-file">', '<label for="txt-declaracion">Declaración jurada</label>', '<div class="input-group">', '<div class="input-group-prepend">', '<span class="input-group-text" id="inputGroup13">', '<i class="fas ', extension, '">', '</i>', '</span>', '</div>','<input class="form-control cursor-pointer txt-file-control" type="text" id="txt-declaracion" placeholder="Suba su declaración jurada" aria-describedby="inputGroup13" value="', decodeURI(data[i]["ADJUNTO_BASE"]), '" readonly>', '<div class="input-group-append">', '<label class="input-group-text cursor-pointer" onclick="fn_verfileDeclaracion(', data[i]["ID_USUARIO"], ')"><i class="fas fa-download"></i></label>', '</div>','</div>', '</div>');
                                
                                $("#archivo-declaracion").append(output.join(''));

                            //}
                            //$("#total-documentos").html(data[i]["ListaSustentos"].length);
                        }

                        Number(data[i]["ID_ROL"]) == 2 ? $(".medidas-especialista").show() : $(".medidas-especialista").hide()
                        if (Number(data[i]["ID_ROL"]) == 2) {
                            //$.ajax({
                            //    url: baseUrl + "Gestion/ListaUsuarioMedidaMitigacion",
                            //    type: 'POST',
                            //    datatype: 'json',
                            //    data: Item,
                            //    success: function (data2) {
                            //         
                            //        if (data2.length > 0) {
                            //            for (var x = 0; x < data2.length; x++) {
                            //                $("#rad-med-0" + data2[x]["ID_MEDMIT"]).prop('checked', true);
                            //            }
                            //        }

                            //    }
                            //});
                            fn_cargaMedidaMitigacion(id);

                        }
                    }
                }
            }
        }
    });
}

function fn_nuevoMantenimientoUsuario() {
    $("#cabeceraEditarMantenimientoUsuario").hide();
}

function fn_limpiarCampo() {
    $("#txt-user").val("");
    $("#txt-nombre").val("");
    $("#txt-apellido").val("");
    $("#txt-telefono").val("");
    $("#txt-anexo").val("");
    $("#txt-celular").val("");
    $("#txt-institucion").val("");
    $("#txt-ruc").val("");
    $("#txt-direccion").val("");
    $("#cbo-sector").val(0);
    $("#cbo-perfil").val(0);
    $("#txt-pswd").val("");
    $("#rad-01").prop("checked", false);
    $("#rad-02").prop("checked", false);
}

function validarEstado() {
    for (var i = 0; i < 2 ; i++) {
        if ($('#rad-0' + (i + 1)).prop('checked')) {
            return true;
        }
    }
    return false;
}

function fn_validarCampo() {
    var arr = [];
    var clave = $("#txt-pswd").val();
    if (!(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test($("#txt-user").val()))) {
        arr.push("Debe ingresar un correo electrónico válido");
    }
    if ($("#txt-nombre").val().trim() === "") {
        arr.push("Debe ingresar el/los nombre(s) ");
    }
    if ($("#txt-apellido").val().trim() === "") {
        arr.push("Debe ingresar el/los apellido(s)");
    }
    if ($("#txt-institucion").val().trim() === "") {
        arr.push("Debe ingresar el nombre de la Institución");
    }
    if ($("#txt-ruc").val().length < 11) {
        arr.push("El ruc debe contener 11 caracteres");
    }
    //if ($("#txt-direccion").val().trim() === "") {
    //    arr.push("Debe ingresar el domicilio fiscal de la Institución");
    //}
    if ($("#cbo-sector").val() == 0) {
        arr.push("Debe seleccionar un Sector");
    }
    if (!(/[a-zñ]/.test(clave) && /[A-ZÑ]/.test(clave) && /[0-9]/.test(clave))) {
        arr.push("La contraseña debe contener minuscula(s), mayúscula(s), número(s) y caracter(es) especial(es)");
    }
    if (clave.length < 6) {
        arr.push("La contraseña debe contener 6 o más caracteres");
    }
    if ($("#cbo-perfil").val() == 0) {
        arr.push("Debe seleccionar un Perfil");
    }
    if (!validarEstado()){
        arr.push("Debe seleccionar un Estado");
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
        //msj = msj + error;
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
    if ($("#validarUsuario").data("guardar") == 1) {
        $("#seccionMensaje #errorRegistro").remove();
        item = {
            EMAIL_USUARIO: $("#txt-user").val()
        };
        var url = baseUrl + "Portal/VerificarEmail";
        var respuesta = MRV.Ajax(url, item, false);
        if (respuesta.success) {
            fn_guardarUsuarioMantenimiento();
        } else {
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
            msj = msj + '                                <hr><small class="mb-0">El correo ingresado ya existe, utilice un correo válido para su registro.</small>';
            msj = msj + '                            </div>';
            msj = msj + '                        </div>';
            $("#seccionMensaje").append(msj);
        }
    } else {
        fn_guardarUsuarioMantenimiento();
    }
}

function fn_guardarUsuarioMantenimiento() {   

    $("#seccionMensaje #errorRegistro").remove();
    var estado = 0;
    //alert("entre");
    for (var i = 0; i < 2 ; i++) {
        if ($('#rad-0' + (i + 1)).prop('checked')) {
            estado = $('#rad-0' + (i + 1)).data("value");
        }
    }
     
    var idMedmit = "";
    var medmit = $("[id^=rad-med-0]");
    if (medmit.length > 0) {
        for (var i = 0; i < medmit.length; i++) {
            if (medmit[i].checked) {
                idMedmit += medmit[i].value + "|";
            }
        }
    }


    var url = baseUrl + "Gestion/EditarUsuario";
    // 
    var item = {
        ID_USUARIO: $("#userMantenimiento").data("value"),
        EMAIL_USUARIO: $("#txt-user").val(),
        NOMBRES_USUARIO: $("#txt-nombre").val(),
        APELLIDOS_USUARIO: $("#txt-apellido").val(),
        TELEFONO_USUARIO: $("#txt-telefono").val(),
        CELULAR_USUARIO: $("#txt-celular").val(),
        ANEXO_USUARIO: $("#txt-anexo").val(),        
        INSTITUCION: $("#txt-institucion").val(),
        RUC: $("#txt-ruc").val(),
        DIRECCION: $("#txt-direccion").val(),
        ID_ROL: $("#cbo-perfil").val(),
        ID_SECTOR_INST: $("#cbo-sector").val(),
        PASSWORD_USUARIO: $("#txt-pswd").val(),
        ID_ESTADO_USUARIO: estado,
        ID_ESTADO_ANTERIOR: $("#estado-usuario").data("estado"),
        MEDIDAS: idMedmit,
        TERMINOS: '1',
        ESTADO: $("#validarUsuario").data("guardar")
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        fn_CargaUsuarios();
        //CargarTablaMantenimiento();
        $("#ventanaEditar").hide();
        $("#cabeceraRegistrarMantenimientoUsuario").hide();
        $("#cabeceraEditarMantenimientoUsuario").hide();
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
}

function fn_cargarRol(id) {
    var Item = {
    };
    $.ajax({
        url: baseUrl + "Gestion/ListarRol",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#cbo-perfil").append('<option class="badge-actor-0' + (i + 2) + ' font-weight-bold" value="' + data[i]["ID_ROL"] + '">' + data[i]["DESCRIPCION_ROL"] + '</option>');
                    }
                }
            }
        }
    });

}

function fn_cargarDatosUserMantenimiento(id) {
    $("#validarUsuario").data("guardar", 0);/*add*/
    $("#cabeceraRegistrarMantenimientoUsuario").hide();
    $("#btn-modal-consultar").show();
    $("#txt-user").attr("disabled", true);
    fn_seleccionarMantenimientoUsuario(id);
}

$("#modal-usuario").on("hidden.bs.modal", function () {
    fn_modalInicio();
    $("#seccionMensaje #errorRegistro").remove();
    $("#pieCorrecto").hide();
});

function fn_cargaMedidaMitigacion(id) {
    var Item = {
        ID_USUARIO: id
    };
    $.ajax({
        url: baseUrl + "Mantenimiento/ListarMedidaMitigacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#medidaGroup").html("");
                    for (var i = 0; i < data.length; i++) {
                        //$("#medidaGroup").append('<option class="badge-actor-0' + (i + 2) + ' font-weight-bold" value="' + data[i]["ID_ROL"] + '">' + data[i]["DESCRIPCION_ROL"] + '</option>');
                        $("#medidaGroup").append("<div class='col-auto my-1'><div class='custom-control custom-checkbox mr-sm-2'><input class='custom-control-input' type='checkbox' id='rad-med-0" + data[i]["ID_MEDMIT"] + "' value=" + data[i]["ID_MEDMIT"] + "><label class='custom-control-label' for='rad-med-0" + data[i]["ID_MEDMIT"] + "'>" + data[i]["NOMBRE_MEDMIT"] + "</label></div></div>");
                    }

                    if (id > 0) {
                        $.ajax({
                            url: baseUrl + "Gestion/ListaUsuarioMedidaMitigacion",
                            type: 'POST',
                            datatype: 'json',
                            data: Item,
                            success: function (data2) {
                                 
                                if (data2.length > 0) {
                                    for (var x = 0; x < data2.length; x++) {
                                        $("#rad-med-0" + data2[x]["ID_MEDMIT"]).prop('checked', true);
                                    }
                                }

                            }
                        });
                    }
                    
                }
            }
        }
    });
}

/*========================================================*/

function regUsuario() {
    fn_cargaMedidaMitigacion(0);
    fn_limpiarCampo();
    $("#txt-user").attr("disabled", false);
    $("#validarUsuario").data("guardar", 1);
    $("#cabeceraEditarMantenimientoUsuario").hide();
    $("#btn-modal-consultar").hide();
    $("#archivo-declaracion #seccion-file").remove();
}

//////////////////////////////////////EXPORTAR
$(document).ready(function () {
    //CargarTablaMantenimiento();
    MRV.CargarSelect(baseUrl + "Portal/ListaSectorInstitucion", "#cbo-sector", "ID_SECTOR_INST", "DESCRIPCION");
    fn_cargarRol();
    //fn_cargaMedidaMitigacion();
    fn_modalInicio();
    fn_actualizaCampana();
    enLinea();
});

function exportarMantenimientoUsuario(){
    var item = {
        buscar: $("#buscar-usuarios").data("campo"),
        order_by: $("#columna").val(),
        order_orden: $("#orden").val()
    };

    var url = baseUrl + 'Gestion/ExportarMantenimientoUsuario';

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

function fn_buscar() {
    $("#buscar-usuarios").data("campo", $("#txt-buscar").val());
    fn_CargaUsuarios();
}

function fn_verfileDeclaracion(id_usuario) {
    var item = {
        ID_USUARIO: id_usuario
    };
    var url = baseUrl + 'Gestion/GetDeclaracionUsuario';
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        var urlMostrar = baseUrl + "Temp/" + respuesta.extra;
        window.open(urlMostrar, "_blank");
    }
}

function fn_validarCampoConsulta() {
    var arr = [];

    if ($("#txa-consulta-usuario").val().trim() === "") {
        arr.push("Ingrese la consulta");
    }
    
    if (arr.length > 0) {               
        var error = '';
        $.each(arr, function (ind, elem) {
            error = error + '<small class="mb-0">' + elem + '</small><br/>';
        });
        var msj = '                      <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="campoConsulta">';
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
        msj = msj + '                                <h6>Campos obligatorios</h6>';
        msj = msj + '                                <hr><small class="mb-0">Complete todos los campos obligatorios e intente otra vez.</small>';
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#consultaUsuario").append(msj);
        return false;
    }
    return true;
}


function enviarConsulta() {
    debugger;
    $("#campoConsulta").remove();
    $("#CorrectoConsulta").remove();
    $("#ErrorConsulta").remove(); 
    if (!fn_validarCampoConsulta()) {
        return false;
    }

    var item = {
        ID_USUARIO: $("#userMantenimiento").data("value"),
        DESCRIPCION: $("#txa-consulta-usuario").val()
    };
    var url = baseUrl + 'Gestion/ConsultaUsuario';
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        var msj  =  '                           <div class="alert alert-success d-flex align-items-stretch" role="alert" id="CorrectoConsulta">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-success">';
        msj = msj + '                                            <div class="sa-success-tip"></div>';
        msj = msj + '                                            <div class="sa-success-long"></div>';
        msj = msj + '                                            <div class="sa-success-placeholder"></div>';
        msj = msj + '                                            <div class="sa-success-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Bien hecho</h6';
        msj = msj + '                                    <hr><small class="mb-0">Se envió la consulta correctamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modal-consulta #btnConsulta").hide();
        $("#consultaUsuario").append(msj);
    } else {
        $("#modalRevision #modalErrorRevision").remove();
        var msj = '                           <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="ErrorConsulta">';
        msj = msj + '                               <div class="alert-wrap mr-3">';
        msj = msj + '                                    <div class="sa">';
        msj = msj + '                                        <div class="sa-error">';
        msj = msj + '                                            <div class="sa-error-x">';
        msj = msj + '                                                <div class="sa-error-left"></div>';
        msj = msj + '                                                <div class="sa-error-right"></div>';
        msj = msj + '                                            </div>';
        msj = msj + '                                            <div class="sa-error-placeholder"></div>';
        msj = msj + '                                            <div class="sa-error-fix"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                                <div class="alert-wrap">';
        msj = msj + '                                    <h6>Error de registro</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Su consulta no fue enviada, intentelo nuevamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#consultaUsuario").append(msj);
    }
}

$("#modal-consulta").on("hidden.bs.modal", function () {
    $("#campoConsulta").remove();
    $("#CorrectoConsulta").remove();
    $("#ErrorConsulta").remove();
    $("#modal-consulta #btnConsulta").show();
    $("#txa-consulta-usuario").val("");
});

function guardarIdUsuario(id) {
    $("#cuerpoMantenimientoUsuario").data("deshabilitar", id);
}

function deshabilitarUsuario() {
    var item = {
        ID_USUARIO: $("#cuerpoMantenimientoUsuario").data("deshabilitar")
    }
    var url = baseUrl + 'Gestion/DeshabilitarUsuario';
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        fn_CargaUsuarios();
        $('#modal-confirmacion').modal('hide');
    } else {
        alert("Ocurrió un problema, no se deshabilitó al usuario");
    }
}


$(function () {
    $(".validar").keydown(function (event) {
        //alert(event.keyCode);
        if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105) && event.keyCode !== 190 && event.keyCode !== 110 && event.keyCode !== 8 && event.keyCode !== 9) {
            return false;
        }
    });
});



