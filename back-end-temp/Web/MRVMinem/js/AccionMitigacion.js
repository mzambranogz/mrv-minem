$(document).ready(function () {
    CargarOpcionesCuerpo();
    CargarMedidaMitigacion();
    CargarSector();
    CargarEnergeticoLineaBase();
    CargarEnergeticoProyecto();
    if ($("#Control").data("usuario") > 0) {
        if ($("#Control").data("rol") == 2) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasEspecialista");
        } else if ($("#Control").data("rol") == 3) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasGeneral");
        } else if ($("#Control").data("rol") == 1) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasUsuario");
        } else if ($("#Control").data("rol") == 4 || $("#Control").data("rol") == 5) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasEvaluar");
        }
        fn_actualizaCampana();
        enLinea();
    } else {
        CargarListarIniciativaMitigacionPublico(baseUrl + "Portal/ListaIniciativasPublico");
    }
    /*MRV.CargarSelect(baseUrl + "Publico/Portal/ListaSectorInstitucion", "#mSector", "ID_SECTOR_INST", "DESCRIPCION");
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarMedidaMitigacion", "#medMitigacion", "ID_MAE_MEDMIT", "NOMBRE_MEDMIT");
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarMoneda", "#mMoneda", "ID_MONEDA", "DESCRIPCION");
    */

    $(".miColumna").click(function (event) {
        var id = "";
        if (event.target.nodeName == "SPAN") {
            id = event.target.firstElementChild.id;
        } else {
            id = event.target.id;
        }

        debugger;
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

        fn_CargaIniciativas();
    });
    
});

function fn_CargaIniciativas() {
    if ($("#Control").data("usuario") > 0) {
        if ($("#Control").data("rol") == 2) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasEspecialista");
        } else if ($("#Control").data("rol") == 3) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasGeneral");
        } else if ($("#Control").data("rol") == 1) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasUsuario");
        } else if ($("#Control").data("rol") == 4 || $("#Control").data("rol") == 5) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasEvaluar");
        }
    } else {
        CargarListarIniciativaMitigacionPublico(baseUrl + "Portal/ListaIniciativasPublico");
    }
}

function CargarOpcionesCuerpo() {
    if ($("#Control").data("opcion9") == 1) {
        $('#nuevaIniciativa').append('<span data-toggle="modal" data-target="#medidas-mitigacion-listado"><a class="agregar-iniciativa" href="#" data-toggle="tooltip" data-placement="top" title="Texto de ayuda que describe el funcionamiento general del módulo [...]"><i class="fas fa-plus px-1"></i>Agregar iniciativa</a></span>');
    }
}

function fn_revisarIniciativa(ini) {
    location.href = baseUrl + "Gestion/RevisarIniciativa?id=" + 0 + "&ini=" + ini;
}

function fn_mostrarCorregirIniciativa(ini) {
    location.href = baseUrl + "Gestion/CorregirIniciativa?ini=" + ini;
}

function fn_revisarDetalle(id) {
    location.href = baseUrl + "Gestion/RevisarDetalleIndicador?id=" + id;
}

function fn_revisarDetalleAdmin(id) {
    location.href = baseUrl + "Gestion/RevisarAdminDetalleIndicador?id=" + id;
}

function fn_evaluarIniciativaDetalle(id) {
    location.href = baseUrl + "Gestion/EvaluarIniciativaDetalle?id=" + id;
}

function fn_verificarIniciativaDetalle(id) {
    location.href = baseUrl + "Gestion/VerificarIniciativaDetalle?id=" + id;
}

function fn_cargarIdIniciativa(id) {
    $("#Control").data("iniciativa", id);
}

function fn_mostrarEditarIndicador(id) {
    location.href = baseUrl + "Gestion/DetalleIndicador?id=" + id;
}

function fn_mostrarEditarIniciativa(ini) {
    location.href = baseUrl + "Gestion/IniciativaMitigacion?id=" + 0 + "&ini=" + ini;
}

function fn_mostrarCorregirIndicador(id) {
    location.href = baseUrl + "Gestion/CorregirDetalleIndicador?id=" + id;
}

function fn_mostrarSeguimiento(id) {
    location.href = baseUrl + "Gestion/SeguimientoIniciativa?id=" + id;
}

function fn_mostrarDetalleIndicador() {
    location.href = baseUrl + "Gestion/DetalleIndicador?id=" + $("#Control").data("iniciativa");
}

function fn_verMasPrivadoIniciativaG(ini) {
    location.href = baseUrl + "Gestion/VerMasIniciativa?ini=" + ini;
}

function fn_verMasPrivadoIniciativaDetalleG(ini) {
    location.href = baseUrl + "Gestion/VerMasIniciativaDetalle?ini=" + ini;
}

function fn_verMasPrivadoIniciativaP(ini) {
    location.href = baseUrl + "Portal/VerMasIniciativa?ini=" + ini;
}

function fn_verMasPrivadoIniciativaDetalleP(ini) {
    location.href = baseUrl + "Portal/VerMasIniciativaDetalle?ini=" + ini;
}

function CargarListarIniciativaMitigacionPublico(vUrl) {
    var Item = {
        cantidad_registros: $("#cantidad-registros").val(),
        pagina: $("#pagina").val(),
        order_by: $("#columna").val(),
        order_orden: $("#orden").val()
    };
    $.ajax({
        url: vUrl,
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {

                    $("#cuerpoMitigacion").html("");
                    var resultado = "";
                    var inicio = 0;
                    var fin = 0;
                    var total_registros = 0;
                    var pagina = 0;
                    var total_paginas = 0;

                    for (var i = 0; i < data.length; i++) {

                        var progreso = '0%;';
                        if (data[i]["ID_ESTADO"] != 0 || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3) || (data[i]["ID_ESTADO"] == 2 && data[i]["PROGRESO"] == 1)) {
                            if (data[i]["PROGRESO"] == 1) {
                                progreso = '25%';
                            } else if (data[i]["PROGRESO"] == 2 || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3)) {
                                progreso = '50%';
                            } else if (data[i]["PROGRESO"] == 3 && data[i]["ID_ESTADO"] != 0) {
                                progreso = '75%';
                            } else if (data[i]["PROGRESO"] == 4 || data[i]["PROGRESO"] == 5 || data[i]["PROGRESO"] == 6 || data[i]["PROGRESO"] == 7) {
                                progreso = '100%';
                            }
                        }

                        var tr = '<tr>';
                        //tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + (1 + i) + '</th>';
                        //tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + data[i]["RowNumber"] + '</th>';
                        tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + data[i]["ID_INICIATIVA"] + '</th>';
                        tr = tr + '<td data-encabezado="Nombre de Iniciativa">' + data[i]["NOMBRE_INICIATIVA"] + '</td>';
                        tr = tr + '<td data-encabezado="Progreso">';
                        tr = tr + '         <div class="progress" style="height: 20px;">';
                        tr = tr + '                 <div class="progress-bar progress-bar-striped" role="progressbar" style="width: ' + progreso + ';" aria-valuenow="' + progreso.substring(0, progreso.length - 1) + '" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="Texto de ayuda que describe el funcionamiento general del módulo [...]">' + progreso + '</div>';
                        tr = tr + '</div></td>';
                        tr = tr + '<td class="text-center">' + data[i]["FECHA"].toString() + '</td>';
                        tr = tr + '<td>' + data[i]["NOMBRE_MEDMIT"] + '</td>';
                        tr = tr + '<td>' + data[i]["NOMBRE_INSTITUCION"] + '</td>';
                        tr = tr + '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr = tr + '     <div class="btn-group">';
                        tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';
                        if (data[i]["PROGRESO"] == 1 || data[i]["PROGRESO"] == 2) {
                            tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_verMasPrivadoIniciativaP(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-plus-circle"></i>&nbsp;Ver más</a>';
                        } else if (data[i]["PROGRESO"] >= 3) {
                            tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_verMasPrivadoIniciativaDetalleP(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-plus-circle"></i>&nbsp;Ver más</a>';
                        }
                        tr = tr + '         </div>';
                        tr = tr + '     </div>';
                        tr = tr + '</td>';
                        tr = tr + '</tr>';
                        $("#cuerpoMitigacion").append(tr);

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


function fn_avance_grilla(boton) {
    //debugger;
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
    fn_CargaIniciativas();
}



function CargarListarIniciativaMitigacionGeneral(vUrl) {
    var Item = {
        ID_USUARIO: $("#Control").data("usuario"),
        cantidad_registros: $("#cantidad-registros").val(),
        pagina: $("#pagina").val(),
        order_by: $("#columna").val(),
        order_orden: $("#orden").val()
    };
    $.ajax({
        url: vUrl,
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {

                    $("#cuerpoMitigacion").html("");
                    for (var i = 0; i < data.length; i++) {

                        var progreso = '0%;';
                        if (data[i]["ID_ESTADO"] != 0 || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3)) {
                            if (data[i]["PROGRESO"] == 1 && (data[i]["ID_ESTADO"] == 1 || data[i]["ID_ESTADO"] == 5)) {
                                progreso = '25%';
                            } else if (data[i]["PROGRESO"] == 2 || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3)) {
                                progreso = '50%';
                            } else if (data[i]["PROGRESO"] == 3 && data[i]["ID_ESTADO"] != 0) {
                                progreso = '75%';
                            } else if (data[i]["PROGRESO"] == 4 || data[i]["PROGRESO"] == 5 || data[i]["PROGRESO"] == 6 || data[i]["PROGRESO"] == 7) {
                                progreso = '100%';
                            }
                        }

                        var tr = '<tr>';
                        //tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + (1 + i) + '</th>'; 
                        //tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + data[i]["RowNumber"] + '</th>';
                        tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + data[i]["ID_INICIATIVA"] + '</th>';
                        tr = tr + '<td data-encabezado="Nombre de Iniciativa">' + data[i]["NOMBRE_INICIATIVA"] + '</td>';
                        tr = tr + '<td data-encabezado="Progreso">';
                        tr = tr + '         <div class="progress" style="height: 20px;">';
                        tr = tr + '                 <div class="progress-bar progress-bar-striped" role="progressbar" style="width: ' + progreso + ';" aria-valuenow="' + progreso.substring(0, progreso.length - 1) + '" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="Texto de ayuda que describe el funcionamiento general del módulo [...]">' + progreso + '</div>';
                        tr = tr + '</div></td>';
                        tr = tr + '<td class="text-center">' + data[i]["FECHA"].toString() + '</td>';
                        tr = tr + '<td>' + data[i]["NOMBRE_MEDMIT"] + '</td>';
                        tr = tr + '<td>' + data[i]["NOMBRE_INSTITUCION"] + '</td>';
                        tr = tr + '<td class="text-center text-xs-right" data-encabezado="Acciones">';

                        tr = tr + '     <div class="btn-group">';
                        //if (data[i]["ID_ESTADO"] == 2 && data[i]["PROGRESO"] == 1) {
                        //  tr = tr + '         <div class="acciones fase-01 dropdown-toggle text-warning" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        if (data[i]["PROGRESO"] == 2 || data[i]["PROGRESO"] == 3 || data[i]["PROGRESO"] == 4 || data[i]["PROGRESO"] == 5 || data[i]["PROGRESO"] == 6 || data[i]["PROGRESO"] == 7) {
                            tr = tr + '         <div class="acciones fase-02 dropdown-toggle text-success" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        } else {
                            tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        }
                        tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';
                        if (data[i]["PROGRESO"] == 1 || data[i]["PROGRESO"] == 2) {
                            tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_verMasPrivadoIniciativaG(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-plus-circle"></i>&nbsp;Ver más</a>';
                        } else if (data[i]["PROGRESO"] >= 3) {
                            tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_verMasPrivadoIniciativaDetalleG(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-plus-circle"></i>&nbsp;Ver más</a>';
                        }
                        tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarSeguimiento(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-history"></i>&nbsp;Seguimiento</a>';
                        if ($('#Control').data('rol') == 2 || $('#Control').data('rol') == 1) {
                            if (data[i]["PROGRESO"] == 1 && data[i]["ID_ESTADO"] == 0) {
                                tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarEditarIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                            } else if (data[i]["PROGRESO"] == 1 && data[i]["ID_ESTADO"] == 2) {
                                tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarCorregirIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                            } else if (data[i]["PROGRESO"] == 2) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_cargarIdIniciativa(' + data[i]["ID_INICIATIVA"] + ');" data-toggle="modal" data-target="#tipo-ingreso-detalle"><i class="fas fa-clipboard-list"></i>&nbsp;Detalles</a>';
                            } else if (data[i]["PROGRESO"] == 3 && data[i]["ID_ESTADO"] == 0) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarEditarIndicador(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                            } else if (data[i]["PROGRESO"] == 3 && (data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 6)) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarCorregirIndicador(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                            }
                        }
                        if ($('#Control').data('rol') == 2 && data[i]["PROGRESO"] == 1) {
                            tr = tr + '             <a class="dropdown-item text-primary" href="#" onclick="fn_revisarIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-check"></i>&nbsp;Revisar</a>';
                        } else if ($('#Control').data('rol') == 2 && data[i]["PROGRESO"] == 3) {
                            tr = tr + '<a class="dropdown-item text-primary" href="#" onclick="fn_revisarDetalle(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-check-double"></i>&nbsp;Revisar</a>';
                        }
                        if ($('#Control').data('rol') == 3 && data[i]["PROGRESO"] == 4) {
                            tr = tr + '<a class="dropdown-item text-primary" href="#" onclick="fn_revisarDetalleAdmin(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-check-double"></i>&nbsp;Revisar</a>';
                        }
                        if ($('#Control').data('rol') == 4 && data[i]["PROGRESO"] == 5) {
                            tr = tr + '             <a class="dropdown-item text-info" href="#" onclick="fn_evaluarIniciativaDetalle(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-clipboard-check"></i>&nbsp;Evaluar</a>';
                        }
                        if ($('#Control').data('rol') == 5 && data[i]["PROGRESO"] == 6) {
                            tr = tr + '             <a class="dropdown-item text-warning" href="#" onclick="fn_verificarIniciativaDetalle(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-tasks"></i>&nbsp;Verificar</a>';
                        }
                        tr = tr + '         </div>';
                        tr = tr + '     </div>';
                        tr = tr + '</td>';
                        tr = tr + '</tr>';
                        $("#cuerpoMitigacion").append(tr);

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






////// CAMBIOS EDUARDO CH

//function enLinea() {
//    ws = new WebSocket("ws://192.168.1.46:9002");
//    ws.onopen = function () {
//        console.log("Conectado");
//    }
//    ws.onclose = function (event) {
//        console.log("Desconectado por: " + event.reason);
//    }
//    ws.onmessage = function (event) {
//        var data = event.data;
//        if (data != "") {
//            console.log("Campana Actualizada");
//            fn_actualizaCampana();
//        }
//    }
//}

//function fn_actualizaCampana() {
//    var item = {
//        ID_ROL: $("#Control").data("rol"),
//        ID_USUARIO: $("#Control").data("usuario")
//    }
//    url = baseUrl + "Gestion/ConsultaNotificaciones";
//    var respuesta = MRV.Ajax(url, item, false);
//    if (respuesta.success) {
//        $("#numNotificacion").html(respuesta.extra);
//    }
//}

function fn_nuevaIniciativaMitigacion(id) {

    $("#Control").data("mitigacion", id);
    MRV.ObtenerVista(baseUrl + 'Administrado/Gestion/NuevaIniciativaMitigacion');
    $('.fade').remove();
    $('body').removeClass('modal-open');
}


////////////////// BUSQUEDA

function CargarMedidaMitigacion() {
    var item = {
    };
    vurl = baseUrl + "Portal/ListarMedidaMitigacion";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#cbo-medida-mitigacion").append('<option value="' + data[i]["ID_MEDMIT"] + '">' + data[i]["NOMBRE_MEDMIT"] + '</option>');
                    }
                }
            }
        }
    });
}


function valor() {
    if ($("#buscar").data("numero") == 0) {
        $("#buscar").data("numero", 1);
        //alert("soy 0");
    } else {
        $("#buscar").data("numero", 0);
        //alert("soy 1");
    }
}



function CargarSector() {
    var item = {
    };
    vurl = baseUrl + "Portal/ListaSectorInstitucion";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#cbo-sector").append('<option value="' + data[i]["ID_SECTOR_INST"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                    }
                }
            }
        }
    });
}

function CargarEnergeticoLineaBase() {
    var item = {
    };
    vurl = baseUrl + "Portal/ListaEnergetico";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#cbo-energetico-base").append('<option value="' + data[i]["ID_GEI"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                    }
                }
            }
        }
    });
}


function CargarEnergeticoProyecto() {
    var item = {
    };
    vurl = baseUrl + "Portal/ListaEnergeticoProyecto";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#cbo-energetico-proyecto").append('<option value="' + data[i]["ID_ENERG"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                    }
                }
            }
        }
    });
}



//Funciones Busqueda Publico
//Validación Del boton desplegable
function fn_busqueda_Publico() {
    if ($("#buscar").data("numero") == 0) {
        fn_buscarPublicoSimple();
    } else {
        fn_buscarPublicoAvanzado();
    }
}

function fn_buscarPublicoSimple() {
    item = {

        BUSCAR: $("#txt-buscar").val()
    };
    vurl = baseUrl + "Portal/BusquedaSimple";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#cuerpoMitigacion").html("");
                    for (var i = 0; i < data.length; i++) {
                        tablaMitigacionPublico(data);
                    }
                }
            }
        }
    });
}

function fn_buscarPublicoAvanzado() {
    item = {

        MENDIMITIG: $("#cbo-medida-mitigacion").val(),
        ANIOINICIO: $("#txt-fecha-inicio").val(),
        SECTOR: $("#cbo-sector").val(),
        ENERGBASE: $("#cbo-energetico-base").val(),
        ENERGPROYEC: $("#cbo-energetico-proyecto").val()
    };

    vurl = baseUrl + "Portal/BusquedaAvanzada";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#cuerpoMitigacion").html("");
                    for (var i = 0; i < data.length; i++) {
                        tablaMitigacionPublico(data);
                    }
                }
            }
        }
    });
}
//Fin Busqueda Publico


//Funciones Busqueda Privado 
function fn_busqueda_Privado() {
    if ($("#buscar").data("numero") == 0) {

        if ($("#Control").data("rol") == 1) {
            //Usuario Administrador 
            fn_buscarPrivadoSimple();

        } else if ($("#Control").data("rol") == 2) {
            //Especialista
            fn_buscarPrivadoSimpleEsp();

        } else if ($("#Control").data("rol") == 3) {
            //Adiminstrador Minen
            fn_buscarPrivadoSimpleMi();

        } else if ($("#Control").data("rol") == 4) {
            //Evaluador MRV
            fn_buscarPrivadoSimpleEvaMRV();

        } else if ($("#Control").data("rol") == 5) {
            //Verificador 
            fn_buscarPrivadoSimpleVerVis();
        }
    } else {


        if ($("#Control").data("rol") == 1) {
            //Usuario Administrador 
            fn_buscarPrivadoAvanzado();

        } else if ($("#Control").data("rol") == 2) {
            //Especialista
            fn_buscarPrivadoAvanzadoEsp();

        } else if ($("#Control").data("rol") == 3) {
            //Adiminstrador Minen
            fn_buscarPrivadoAvanzadoAdmMi();

        } else if ($("#Control").data("rol") == 4) {
            //Evaluador MRV
            fn_buscarPrivadoAvanzadoEvaMRV();

        } else if ($("#Control").data("rol") == 5) {
            //Verificador 
            fn_buscarPrivadoAvanzadoVerVis();
        }
    }
}

//Busqueda Administrador Simple
function fn_buscarPrivadoSimple() {
    item = {
        BUSCAR: $("#txt-buscar").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    vurl = baseUrl + "Gestion/BusquedaSimpleUsuario";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {

                    $("#cuerpoMitigacion").html("");
                    for (var i = 0; i < data.length; i++) {
                        tablaMitigacionPrivado(data);
                    }
                }
            }
        }
    });
}

//Busqueda Administrador Avanzado
function fn_buscarPrivadoAvanzado() {

    item = {
        MENDIMITIG: $("#cbo-medida-mitigacion").val(),
        ANIOINICIO: $("#txt-fecha-inicio").val(),
        SECTOR: $("#cbo-sector").val(),
        ENERGBASE: $("#cbo-energetico-base").val(),
        ENERGPROYEC: $("#cbo-energetico-proyecto").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    fn_buscarPrivadoAvanzadoUsuario(item, baseUrl + "Gestion/BusquedaAvanzadaUsuario")
}

function fn_buscarPrivadoAvanzadoUsuario(item, vurl) {
    //vurl = baseUrl + "Portal/BusquedaAvanzadaPrivado";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {
                    tablaMitigacionPrivado(data);
                }
            }
        }
    });
}

//Especialista Simple
function fn_buscarPrivadoSimpleEsp() {
    item = {
        BUSCAR: $("#txt-buscar").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    vurl = baseUrl + "Gestion/BusquedaSimpleUsuario";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {

                    $("#cuerpoMitigacion").html("");
                    for (var i = 0; i < data.length; i++) {
                        tablaMitigacionPrivado(data);
                    }
                }
            }
        }
    });
}

//Especialista Avanzado
function fn_buscarPrivadoAvanzadoEsp() {

    item = {
        MENDIMITIG: $("#cbo-medida-mitigacion").val(),
        ANIOINICIO: $("#txt-fecha-inicio").val(),
        SECTOR: $("#cbo-sector").val(),
        ENERGBASE: $("#cbo-energetico-base").val(),
        ENERGPROYEC: $("#cbo-energetico-proyecto").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    fn_buscarPrivadoAvanzadoUsuario(item, baseUrl + "Gestion/BusquedaAvanzadaUsuario")
}


//Administrador Simple
function fn_buscarPrivadoSimpleEsp() {
    item = {
        BUSCAR: $("#txt-buscar").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    vurl = baseUrl + "Gestion/BusquedaSimpleUsuario";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {

                    $("#cuerpoMitigacion").html("");
                    for (var i = 0; i < data.length; i++) {
                        tablaMitigacionPrivado(data);
                    }
                }
            }
        }
    });
}

//Administrador Avanzado
function fn_buscarPrivadoAvanzadoEsp() {

    item = {
        MENDIMITIG: $("#cbo-medida-mitigacion").val(),
        ANIOINICIO: $("#txt-fecha-inicio").val(),
        SECTOR: $("#cbo-sector").val(),
        ENERGBASE: $("#cbo-energetico-base").val(),
        ENERGPROYEC: $("#cbo-energetico-proyecto").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    fn_buscarPrivadoAvanzadoUsuario(item, baseUrl + "Gestion/BusquedaAvanzadaUsuario")
}

//Evaluador Simple
function fn_buscarPrivadoSimpleEsp() {
    item = {
        BUSCAR: $("#txt-buscar").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    vurl = baseUrl + "Gestion/BusquedaSimpleUsuario";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {

                    $("#cuerpoMitigacion").html("");
                    for (var i = 0; i < data.length; i++) {
                        tablaMitigacionPrivado(data);
                    }
                }
            }
        }
    });
}

//Evaluador Avanzado
function fn_buscarPrivadoAvanzadoEsp() {

    item = {
        MENDIMITIG: $("#cbo-medida-mitigacion").val(),
        ANIOINICIO: $("#txt-fecha-inicio").val(),
        SECTOR: $("#cbo-sector").val(),
        ENERGBASE: $("#cbo-energetico-base").val(),
        ENERGPROYEC: $("#cbo-energetico-proyecto").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    fn_buscarPrivadoAvanzadoUsuario(item, baseUrl + "Gestion/BusquedaAvanzadaUsuario")
}

//Busqueda Especialista Simple
function fn_buscarPrivadoSimpleEsp() {
    item = {
        BUSCAR: $("#txt-buscar").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    vurl = baseUrl + "Gestion/BusquedaSimpleEsp";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {

                    $("#cuerpoMitigacion").html("");
                    for (var i = 0; i < data.length; i++) {
                        tablaMitigacionPrivado(data);
                    }
                }
            }
        }
    });
}

//Busqueda Administrador Minen
function fn_buscarPrivadoSimpleMi() {
    item = {
        BUSCAR: $("#txt-buscar").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    vurl = baseUrl + "Gestion/BusquedaSimpleMi";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {

                    $("#cuerpoMitigacion").html("");
                    for (var i = 0; i < data.length; i++) {
                        tablaMitigacionPrivado(data);
                    }
                }
            }
        }
    });
}

//Busqueda Evaluador MRV Simple
function fn_buscarPrivadoSimpleEvaMRV() {
    item = {
        BUSCAR: $("#txt-buscar").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    vurl = baseUrl + "Gestion/BusquedaSimpleEvaMRV";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {

                    $("#cuerpoMitigacion").html("");
                    for (var i = 0; i < data.length; i++) {
                        tablaMitigacionPrivado(data);
                    }
                }
            }
        }
    });
}



//Busqueda Verificador Simple
function fn_buscarPrivadoSimpleVerVis() {
    item = {
        BUSCAR: $("#txt-buscar").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    vurl = baseUrl + "Gestion/BusquedaSimpleVerVis";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {

                    $("#cuerpoMitigacion").html("");
                    for (var i = 0; i < data.length; i++) {
                        tablaMitigacionPrivado(data);
                    }
                }
            }
        }
    });
}


//Busqueda Especialista Privado Avanzado
function fn_buscarPrivadoAvanzadoEsp() {

    item = {
        MENDIMITIG: $("#cbo-medida-mitigacion").val(),
        ANIOINICIO: $("#txt-fecha-inicio").val(),
        SECTOR: $("#cbo-sector").val(),
        ENERGBASE: $("#cbo-energetico-base").val(),
        ENERGPROYEC: $("#cbo-energetico-proyecto").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    fn_buscarPrivadoAvanzadoUsuario(item, baseUrl + "Gestion/BusquedaAvanzadaEspecialista")
}


//Busqueda Administrador Minen Avanzado
function fn_buscarPrivadoAvanzadoAdmMi() {

    item = {
        MENDIMITIG: $("#cbo-medida-mitigacion").val(),
        ANIOINICIO: $("#txt-fecha-inicio").val(),
        SECTOR: $("#cbo-sector").val(),
        ENERGBASE: $("#cbo-energetico-base").val(),
        ENERGPROYEC: $("#cbo-energetico-proyecto").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    fn_buscarPrivadoAvanzadoUsuario(item, baseUrl + "Gestion/BusquedaAvanzadaAdmMi")
}

//Busqueda Evaluador MRV  Avanzado
function fn_buscarPrivadoAvanzadoEvaMRV() {

    item = {
        MENDIMITIG: $("#cbo-medida-mitigacion").val(),
        ANIOINICIO: $("#txt-fecha-inicio").val(),
        SECTOR: $("#cbo-sector").val(),
        ENERGBASE: $("#cbo-energetico-base").val(),
        ENERGPROYEC: $("#cbo-energetico-proyecto").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    fn_buscarPrivadoAvanzadoUsuario(item, baseUrl + "Gestion/BusquedaAvanzadaEvaMRV")
}

//Busqueda Verificador Avanzado
function fn_buscarPrivadoAvanzadoVerVis() {

    item = {
        MENDIMITIG: $("#cbo-medida-mitigacion").val(),
        ANIOINICIO: $("#txt-fecha-inicio").val(),
        SECTOR: $("#cbo-sector").val(),
        ENERGBASE: $("#cbo-energetico-base").val(),
        ENERGPROYEC: $("#cbo-energetico-proyecto").val(),
        IDUSUARIO: $("#Control").data("usuario")
    };

    fn_buscarPrivadoAvanzadoUsuario(item, baseUrl + "Gestion/BusquedaAvanzadaVerVis")
}

//fn_buscarPrivadoAvanzadoVerificador

function fn_buscarPrivadoAvanzadoUsuario(item, vurl) {
    //vurl = baseUrl + "Portal/BusquedaAvanzadaPrivado";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                if (data.length > 0) {
                    tablaMitigacionPrivado(data);
                }
            }
        }
    });
}


function tablaMitigacionPublico(data) {
    $("#cuerpoMitigacion").html("");
    for (var i = 0; i < data.length; i++) {
        var progreso = '0%;';
        if (data[i]["ID_ESTADO"] != 0 || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3) || (data[i]["ID_ESTADO"] == 2 && data[i]["PROGRESO"] == 1)) {
            if (data[i]["PROGRESO"] == 1) {
                progreso = '25%';
            } else if (data[i]["PROGRESO"] == 2 || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3)) {
                progreso = '50%';
            } else if (data[i]["PROGRESO"] == 3 && data[i]["ID_ESTADO"] != 0) {
                progreso = '75%';
            } else if (data[i]["PROGRESO"] == 4 || data[i]["PROGRESO"] == 5 || data[i]["PROGRESO"] == 6 || data[i]["PROGRESO"] == 7) {
                progreso = '100%';
            }
        }

        var tr = '<tr>';
        //tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + (1 + i) + '</th>';
        tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + data[i]["ID_INICIATIVA"] + '</th>';
        tr = tr + '<td data-encabezado="Nombre de Iniciativa">' + data[i]["NOMBRE_INICIATIVA"] + '</td>';
        tr = tr + '<td data-encabezado="Progreso">';
        tr = tr + '         <div class="progress" style="height: 20px;">';
        tr = tr + '                 <div class="progress-bar progress-bar-striped" role="progressbar" style="width: ' + progreso + ';" aria-valuenow="' + progreso.substring(0, progreso.length - 1) + '" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="Texto de ayuda que describe el funcionamiento general del módulo [...]">' + progreso + '</div>';
        tr = tr + '</div></td>';
        tr = tr + '<td class="text-center">' + data[i]["FECHA"] + '</td>';
        tr = tr + '<td>' + data[i]["NOMBRE_MEDMIT"] + '</td>';
        tr = tr + '<td>' + data[i]["NOMBRE_INSTITUCION"] + '</td>';
        tr = tr + '<td class="text-center text-xs-right" data-encabezado="Acciones">';
        tr = tr + '     <div class="btn-group">';
        tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
        tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';
        tr = tr + '             <a class="dropdown-item" href="./ver-mas-accion-de-mitigacion.html"><i class="fas fa-plus-circle"></i>&nbsp;Ver más</a>';
        tr = tr + '             <a class="dropdown-item" href="./seguimiento-de-accion-de-mitigacion.html"><i class="fas fa-history"></i>&nbsp;Seguimiento</a>';
        tr = tr + '         </div>';
        tr = tr + '     </div>';
        tr = tr + '</td>';
        tr = tr + '</tr>';
        $("#cuerpoMitigacion").append(tr);
    }
}

function tablaMitigacionPrivado(data) {
    $("#cuerpoMitigacion").html("");
    for (var i = 0; i < data.length; i++) {

        var progreso = '0%;';
        if (data[i]["ID_ESTADO"] != 0 || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3)) {
            if (data[i]["PROGRESO"] == 1 && (data[i]["ID_ESTADO"] == 1 || data[i]["ID_ESTADO"] == 5)) {
                progreso = '25%';
            } else if (data[i]["PROGRESO"] == 2 || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3)) {
                progreso = '50%';
            } else if (data[i]["PROGRESO"] == 3 && data[i]["ID_ESTADO"] != 0) {
                progreso = '75%';
            } else if (data[i]["PROGRESO"] == 4 || data[i]["PROGRESO"] == 5 || data[i]["PROGRESO"] == 6 || data[i]["PROGRESO"] == 7) {
                progreso = '100%';
            }
        }

        var tr = '<tr>';
        //tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + (1 + i) + '</th>'; 
        //tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + data[i]["RowNumber"] + '</th>';
        tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + data[i]["ID_INICIATIVA"] + '</th>';
        tr = tr + '<td data-encabezado="Nombre de Iniciativa">' + data[i]["NOMBRE_INICIATIVA"] + '</td>';
        tr = tr + '<td data-encabezado="Progreso">';
        tr = tr + '         <div class="progress" style="height: 20px;">';
        tr = tr + '                 <div class="progress-bar progress-bar-striped" role="progressbar" style="width: ' + progreso + ';" aria-valuenow="' + progreso.substring(0, progreso.length - 1) + '" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="Texto de ayuda que describe el funcionamiento general del módulo [...]">' + progreso + '</div>';
        tr = tr + '</div></td>';
        tr = tr + '<td class="text-center">' + data[i]["FECHA"].toString() + '</td>';
        tr = tr + '<td>' + data[i]["NOMBRE_MEDMIT"] + '</td>';
        tr = tr + '<td>' + data[i]["NOMBRE_INSTITUCION"] + '</td>';
        tr = tr + '<td class="text-center text-xs-right" data-encabezado="Acciones">';

        tr = tr + '     <div class="btn-group">';
        //if (data[i]["ID_ESTADO"] == 2 && data[i]["PROGRESO"] == 1) {
        //  tr = tr + '         <div class="acciones fase-01 dropdown-toggle text-warning" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
        if (data[i]["PROGRESO"] == 2 || data[i]["PROGRESO"] == 3 || data[i]["PROGRESO"] == 4 || data[i]["PROGRESO"] == 5 || data[i]["PROGRESO"] == 6 || data[i]["PROGRESO"] == 7) {
            tr = tr + '         <div class="acciones fase-02 dropdown-toggle text-success" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
        } else {
            tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
        }
        tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';
        if (data[i]["PROGRESO"] == 1 || data[i]["PROGRESO"] == 2) {
            tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_verMasPrivadoIniciativaG(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-plus-circle"></i>&nbsp;Ver más</a>';
        } else if (data[i]["PROGRESO"] >= 3) {
            tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_verMasPrivadoIniciativaDetalleG(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-plus-circle"></i>&nbsp;Ver más</a>';
        }
        tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarSeguimiento(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-history"></i>&nbsp;Seguimiento</a>';
        if ($('#Control').data('rol') == 2 || $('#Control').data('rol') == 1) {
            if (data[i]["PROGRESO"] == 1 && data[i]["ID_ESTADO"] == 0) {
                tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarEditarIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
            } else if (data[i]["PROGRESO"] == 1 && data[i]["ID_ESTADO"] == 2) {
                tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarCorregirIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
            } else if (data[i]["PROGRESO"] == 2) {
                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_cargarIdIniciativa(' + data[i]["ID_INICIATIVA"] + ');" data-toggle="modal" data-target="#tipo-ingreso-detalle"><i class="fas fa-clipboard-list"></i>&nbsp;Detalles</a>';
            } else if (data[i]["PROGRESO"] == 3 && data[i]["ID_ESTADO"] == 0) {
                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarEditarIndicador(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
            } else if (data[i]["PROGRESO"] == 3 && (data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 6)) {
                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarCorregirIndicador(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
            }
        }
        if ($('#Control').data('rol') == 2 && data[i]["PROGRESO"] == 1) {
            tr = tr + '             <a class="dropdown-item text-primary" href="#" onclick="fn_revisarIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-check"></i>&nbsp;Revisar</a>';
        } else if ($('#Control').data('rol') == 2 && data[i]["PROGRESO"] == 3) {
            tr = tr + '<a class="dropdown-item text-primary" href="#" onclick="fn_revisarDetalle(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-check-double"></i>&nbsp;Revisar</a>';
        }
        if ($('#Control').data('rol') == 3 && data[i]["PROGRESO"] == 4) {
            tr = tr + '<a class="dropdown-item text-primary" href="#" onclick="fn_revisarDetalleAdmin(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-check-double"></i>&nbsp;Revisar</a>';
        }
        if ($('#Control').data('rol') == 4 && data[i]["PROGRESO"] == 5) {
            tr = tr + '             <a class="dropdown-item text-info" href="#" onclick="fn_evaluarIniciativaDetalle(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-clipboard-check"></i>&nbsp;Evaluar</a>';
        }
        if ($('#Control').data('rol') == 5 && data[i]["PROGRESO"] == 6) {
            tr = tr + '             <a class="dropdown-item text-warning" href="#" onclick="fn_verificarIniciativaDetalle(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-tasks"></i>&nbsp;Verificar</a>';
        }
        tr = tr + '         </div>';
        tr = tr + '     </div>';
        tr = tr + '</td>';
        tr = tr + '</tr>';
        $("#cuerpoMitigacion").append(tr);
    }
}
