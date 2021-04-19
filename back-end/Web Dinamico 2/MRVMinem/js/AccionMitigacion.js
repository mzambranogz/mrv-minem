

function fn_CargaIniciativas() {
    if ($("#Control").data("usuario") > 0) {
        if ($("#estadoIniciativa").data("estado") == 1) {
            if ($("#Control").data("rol") == 2) {
                CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasEspecialista");
            } else if ($("#Control").data("rol") == 3) {
                CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasGeneral");
            } else if ($("#Control").data("rol") == 1) {
                CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasUsuario");
            } else if ($("#Control").data("rol") == 4) {
                CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasEvaluar");
            } else if ($("#Control").data("rol") == 5) {
                CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasVerificar");
            } else if ($("#Control").data("rol") == 7) {
                CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasAuditar");
            }
        } else if ($("#estadoIniciativa").data("estado") == 2) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaObservado");
        } else if ($("#estadoIniciativa").data("estado") == 3) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaAprobado");
        } else if ($("#estadoIniciativa").data("estado") == 4) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaRevisado");
        } else if ($("#estadoIniciativa").data("estado") == 5) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaEvaluado");
        } else if ($("#estadoIniciativa").data("estado") == 6) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaVerificado");
        } else if ($("#estadoIniciativa").data("estado") == 7 || $("#estadoIniciativa").data("estado") == 8 || $("#estadoIniciativa").data("estado") == 9) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaTodo");
        }

    } else {
        if ($("#estadoIniciativa").data("estado") > 0) { //add
            CargarListarIniciativaMitigacionPublico(baseUrl + "Portal/ListaIniciativasPublico");
        }
    }
}

function CargarOpcionesCuerpo() {
    //if ($("#Control").data("opcion9") == 1) {
    //    $('#nuevaIniciativa').append('<span data-toggle="modal" data-target="#medidas-mitigacion-listado"><a class="agregar-iniciativa" href="#" data-toggle="tooltip" data-placement="top" title="Texto de ayuda que describe el funcionamiento general del módulo [...]"><i class="fas fa-plus px-1"></i>Agregar iniciativa</a></span>');
    //    //$("#seccionFiltro").hide();
    //}

    //if ($("#Control").data("rol") != 1) {
    //    var filtro = '<div class="btn-group">';
    //    filtro +=    '                <a class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" tabindex="1"><i class="fas fa-filter">&nbsp;</i>Filtrar por estados</a>';
    //    filtro +=    '                    <div class="dropdown-menu">';
    //    filtro += '                             <a class="dropdown-item" style="cursor: pointer;" onclick="fn_filtrarEstado(1);"><i class="fas fa-hourglass">&nbsp;</i>Pendientes</a>';
    //    filtro +=    '                          <a class="dropdown-item" style="cursor: pointer;" onclick="fn_filtrarEstado(2);"><i class="fas fa-eye">&nbsp;</i>Observadas</a>';
    //    filtro += '                             <a class="dropdown-item" style="cursor: pointer;" onclick="fn_filtrarEstado(3);"><i class="fas fa-check">&nbsp;</i>Aprobados</a>';
    //    filtro += '                             <a class="dropdown-item" style="cursor: pointer;" onclick="fn_filtrarEstado(4);"><i class="fas fa-check-double">&nbsp;</i>Revisadas</a>';
    //    filtro += '                             <a class="dropdown-item" style="cursor: pointer;" onclick="fn_filtrarEstado(5);"><i class="fas fa-clipboard-check">&nbsp;</i>Evaluadas</a>';
    //    filtro += '                             <a class="dropdown-item" style="cursor: pointer;" onclick="fn_filtrarEstado(6);"><i class="fas fa-tasks">&nbsp;</i>Verificadas</a>';
    //    filtro +=    '                        <div class="dropdown-divider"></div><a class="dropdown-item" style="cursor: pointer;" onclick="fn_filtrarEstado(7);"><i class="fas fa-tachometer-alt">&nbsp;</i>Todas</a>';
    //    filtro +=    '                    </div>';
    //    filtro += ' </div>';
    //    $("#seccionFiltro").append(filtro);
    //}
}

function fn_revisarIniciativa(ini) {
    //location.href = baseUrl + "Gestion/RevisarIniciativa?id=" + 0 + "&ini=" + ini;
    location.href = baseUrl + "Gestion/RevisarIniciativa/" + Math.round(Math.random() * 100) + "/" + ini;
}

function fn_mostrarCorregirIniciativa(ini) {
    location.href = baseUrl + "Gestion/CorregirIniciativa/" + Math.round(Math.random() * 100) + "/" + ini;
}

function fn_revisarDetalle(id) {
    //location.href = baseUrl + "Gestion/RevisarDetalleIndicador?id=" + id;
    location.href = baseUrl + "Gestion/RevisarDetalleIndicador/" + id + "/" + Math.round(Math.random() * 100);
}

function fn_revisarDetalleAdmin(id) {
    location.href = baseUrl + "Gestion/RevisarAdminDetalleIndicador/" + id + "/" + Math.round(Math.random() * 100);
}

function fn_evaluarIniciativaDetalle(id) {
    location.href = baseUrl + "Gestion/EvaluarIniciativaDetalle/" + id + "/" + Math.round(Math.random() * 100);
}

function fn_verificarIniciativaDetalle(id) {
    location.href = baseUrl + "Gestion/VerificarIniciativaDetalle/" + id + "/" + Math.round(Math.random() * 100);
}

function fn_cargarIdIniciativa(id) {
    $("#Control").data("iniciativa", id);
}

function fn_mostrarEditarIndicador(id, id_tipo) {
    if (id_tipo == 1) {
        location.href = baseUrl + "Gestion/DetalleIndicador/" + id + "/" + Math.round(Math.random() * 100);
    } else {
        location.href = baseUrl + "Detalle/DetalleIndicadorMasivo/" + id + "/" + Math.round(Math.random() * 100);
    }
}

function fn_mostrarEditarIniciativa(ini) {
    location.href = baseUrl + "Gestion/IniciativaMitigacion/" + Math.round(Math.random() * 100) + "/" + ini;
}

function fn_mostrarCorregirIndicador(id, id_tipo) {
    if (id_tipo == 1) {
        location.href = baseUrl + "Gestion/CorregirDetalleIndicador/" + id + "/" + Math.round(Math.random() * 100);
    } else {
        location.href = baseUrl + "Detalle/CorregirDetalleIndicadorMasivo/" + id + "/" + Math.round(Math.random() * 100);
    }
}

function fn_mostrarSeguimiento(id) {
    location.href = baseUrl + "Gestion/SeguimientoIniciativa/" + id + "/" + Math.round(Math.random() * 100);
}

function fn_mostrarDetalleIndicador() {
    location.href = baseUrl + "Gestion/DetalleIndicador/" + $("#Control").data("iniciativa") + "/" + Math.round(Math.random() * 100);
}

function fn_mostrarDetalleIndicadorMasivo() {
    location.href = baseUrl + "Detalle/DetalleIndicadorMasivo/" + $("#Control").data("iniciativa") + "/" + Math.round(Math.random() * 100);
}

function fn_verMasPrivadoIniciativaG(ini) {
    location.href = baseUrl + "Gestion/VerMasIniciativa/" + Math.round(Math.random() * 100) + "/" + ini;
}

function fn_verMasPrivadoIniciativaDetalleG(ini) {
    location.href = baseUrl + "Gestion/VerMasIniciativaDetalle/" + Math.round(Math.random() * 100) + "/" + ini;
}

function fn_verMasPrivadoIniciativaP(ini) {
    location.href = baseUrl + "Portal/VerMasIniciativa?ini=" + ini;
}

function fn_verMasPrivadoIniciativaDetalleP(ini) {
    location.href = baseUrl + "Portal/VerMasIniciativaDetalle?ini=" + ini;
}

// ADD 14-10-20
function fn_mostrarDetalleIndicadorNuevo(ini) {
    //location.href = baseUrl + "Gestion/DetalleIndicador/" + ini + "/" + Math.round(Math.random() * 100);
    location.href = baseUrl + "Gestion/DetalleIndicador/" + ini + "/" + Math.round(Math.random() * 100);
}

function CargarListarIniciativaMitigacionPublico(vUrl) {
    //var Item = {
    //    cantidad_registros: $("#cantidad-registros").val(),
    //    pagina: $("#pagina").val(),
    //    order_by: $("#columna").val(),
    //    order_orden: $("#orden").val()
    //};
    var nurl = baseUrl;
    if ($("#buscar").data("numero") == 0) {

        var Item = {
            buscar: $("#buscar-iniciativa").data("campo"),
            cantidad_registros: $("#cantidad-registros").val(),
            pagina: $("#pagina").val(),
            order_by: $("#columna").val(),
            order_orden: $("#orden").val(),
            ID_ESTADO: $("#estadoIniciativa").data("estado")
        }
        nurl = nurl + "Portal/ListaBusquedaSimplePublico";
    } else {

        var Item = {
            medida_b: $("#cbo-medida-mitigacion").val(),
            anio_b: $("#txt-fecha-inicio").val(),
            sector_b: $("#cbo-sector").val(),
            gei_b: $("#cbo-energetico-base").val(),
            energ_b: $("#cbo-energetico-proyecto").val(),
            FECHA_IMPLE_INICIATIVA: $("#txt-fecha-inicio").val(),
            FECHA_FIN_INICIATIVA: $("#txt-fecha-fin").val(),
            NOMBRE_INICIATIVA: $("#txa-descripcion-iniciativa").val(),
            cantidad_registros: $("#cantidad-registros").val(),
            pagina: $("#pagina").val(),
            order_by: $("#columna").val(),
            order_orden: $("#orden").val(),
            ID_ESTADO: $("#estadoIniciativa").data("estado")
        }
        nurl = nurl + "Portal/ListaBusquedaAvanzadaPublico";
    }

    //=================================
    $("#tbl-main-preload").html("<i Class='fas fa-spinner fa-spin px-1'></i> Cargando...");
    $("#tbl-main").addClass("d-none");
    //======================================================================

    $.ajax({
        url: nurl,
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            $("#cuerpoMitigacion").html("");
            if (data != null && data != "") {
                if (data.length > 0) {
                    //$("#cuerpoMitigacion").html("");
                    var resultado = "";
                    var inicio = 0;
                    var fin = 0;
                    var total_registros = 0;
                    var pagina = 0;
                    var total_paginas = 0;

                    for (var i = 0; i < data.length; i++) {
                        var p = data[i]["ID_PLAZO_ETAPA_ESTADO"];
                        var progreso = '0%';
                        if (data[i]["ID_ESTADO"] != 0 || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3)) {
                            if (data[i]["PROGRESO"] == 1 && (data[i]["ID_ESTADO"] == 1 || data[i]["ID_ESTADO"] == 5 || data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 6)) {
                                progreso = '25%';
                            } else if (data[i]["PROGRESO"] == 2 || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3)) {
                                progreso = '50%';
                            } else if (data[i]["PROGRESO"] == 3 && (data[i]["ID_ESTADO"] == 1 || data[i]["ID_ESTADO"] == 5 || data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 6)) {
                                progreso = '75%';
                            } else if (data[i]["PROGRESO"] == 4 || data[i]["PROGRESO"] == 5 || data[i]["PROGRESO"] == 6 || data[i]["PROGRESO"] == 7 || data[i]["PROGRESO"] == 8 || data[i]["PROGRESO"] == 9 || data[i]["PROGRESO"] == 10) {
                                progreso = '100%';
                            }
                        }

                        var tooltip = "";
                        if (data[i]["PROGRESO"] == 1 && (data[i]["ID_ESTADO"] == 1)) {
                            tooltip = "Iniciativa de mitigación registrada";
                        } else if (data[i]["PROGRESO"] == 1 && data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 5) {
                            tooltip = "Iniciativa de mitigación observado";
                        } else if ((data[i]["PROGRESO"] == 2 && data[i]["ID_ESTADO"] == 3) || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3)) {
                            tooltip = "Iniciativa de mitigación aprobada";
                        } else if (data[i]["PROGRESO"] == 3 && (data[i]["ID_ESTADO"] == 1)) {
                            tooltip = "Detalle de indicadores registrado";
                        } else if (data[i]["PROGRESO"] == 3 && (data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 5 || data[i]["ID_ESTADO"] == 6)) {
                            tooltip = "Detalle de indicadores observado";
                        } else if (data[i]["PROGRESO"] == 4 || data[i]["PROGRESO"] == 5 || data[i]["PROGRESO"] == 6 || data[i]["PROGRESO"] == 7 || data[i]["PROGRESO"] == 8 || data[i]["PROGRESO"] == 9 || data[i]["PROGRESO"] == 10) {
                            tooltip = "Detalle de indicadores aprobado";
                        }

                        var tr = '<tr>';
                        //tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + (1 + i) + '</th>';
                        //tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + data[i]["RowNumber"] + '</th>';
                        tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + data[i]["ID_INICIATIVA"] + '</th>';
                        tr = tr + '<td data-encabezado="Nombre de Iniciativa">' + data[i]["NOMBRE_INICIATIVA"] + '</td>';
                        tr = tr + '<td data-encabezado="Progreso">';
                        tr = tr + '         <div class="progress" style="height: 20px;">';
                        tr = tr + '                 <div class="progress-bar progress-bar-striped" role="progressbar" style="width: ' + progreso + ';" aria-valuenow="' + progreso.substring(0, progreso.length - 1) + '" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="' + tooltip + '">' + progreso + '</div>';
                        tr = tr + '</div></td>';
                        tr = tr + '<td class="text-center">' + data[i]["FECHA"].toString() + '</td>';
                        tr = tr + '<td class="text-center">' + data[i]["FECHA_FIN"] + '</td>';
                        tr = tr + '<td class="text-center"><span data-toggle="tooltip" data-placement="top" title="' + data[i]["NOMBRE_MEDMIT"] + '"><strong>' + data[i]["NUMERO_MEDMIT"] + '</strong></span></td>';
                        tr = tr + '<td>' + data[i]["NOMBRE_INSTITUCION"] + '</td>';
                        if ($("#cuerpoMitigacion").data("convertir") == 1) {
                            tr = tr + '<td data-encabezado="Total reducido" class="text-center convertir"><span>' + formatoMiles((Math.round(data[i]["TOTAL_GEI"] * 100) / 100) / 1000) + '</span>&nbsp;<small>ktCO2eq<small></td>';
                        } else if ($("#cuerpoMitigacion").data("convertir") == 0) {
                            tr = tr + '<td data-encabezado="Total reducido" class="text-center convertir"><span>' + formatoMiles(Math.round(data[i]["TOTAL_GEI"] * 100) / 100) + '</span>&nbsp;<small>tCO2eq<small></td>';
                        }
                        tr = tr + '<td class="text-center" data-encabezado="Estado">' + data[i]["ESTADO_BANDEJA"] + '</td>';
                        tr = tr + '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr = tr + '     <div class="btn-group">';
                        tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';
                        if (data[i]["PROGRESO"] == 1 || data[i]["PROGRESO"] == 2) {
                            tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_verMasPrivadoIniciativaP(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-plus-circle"></i>&nbsp;Ver detalles</a>';
                        } else if (data[i]["PROGRESO"] >= 3) {
                            tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_verMasPrivadoIniciativaDetalleP(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-plus-circle"></i>&nbsp;Ver detalles</a>';
                        }
                        if (p >= 6) {
                            tr = tr + '        <a class="dropdown-item" href="#" onclick="fn_visualizarFichaPublica(' + data[i]["ID_INICIATIVA"] + ',' + p + ');" id="ficha-' + data[i]["ID_INICIATIVA"] + '" data-ficha="' + data[i]["ESTADO_FICHA"] + '"><i class="fas fa-download"></i>&nbsp;Descargar ficha</a>';
                        }
                        //tr = tr + '        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-recordatorio"><i class="fas fa-envelope"></i>&nbsp;Recordatorio</a>';
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
            } else {
                $("#resultado").html("0 - 0");
                $("#total-registros").html(0);
                $("#pagina-actual").html(1);
                $("#total-paginas").html(1);
                $("#pagina").val(1);
            }
            $('[data-toggle="tooltip"]').tooltip();
            $("#tbl-main-preload").html("");
            $("#tbl-main").removeClass("d-none");
        }
    });
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
    fn_CargaIniciativas();
}



function CargarListarIniciativaMitigacionGeneral(vUrl) {
    var nurl = baseUrl;

    if ($("#buscar").data("numero") == 0) {

        var Item = {
            buscar: $("#buscar-iniciativa").data("campo"),
            cantidad_registros: $("#cantidad-registros").val(),
            pagina: $("#pagina").val(),
            order_by: $("#columna").val(),
            order_orden: $("#orden").val(),
            ID_USUARIO: $("#Control").data("usuario"),
            ID_ESTADO: $("#estadoIniciativa").data("estado")
        }
        nurl = nurl + "Gestion/ListaBusquedaSimplePrivado";
    } else {

        //if ($("#blk").data("blk") == 0) {
        if ($("#txa-bloackchain").val() == "") {

            var Item = {
                medida_b: $("#cbo-medida-mitigacion").val(),
                anio_b: $("#txt-fecha-inicio").val(),
                sector_b: $("#cbo-sector").val(),
                gei_b: $("#cbo-energetico-base").val(),
                FECHA_IMPLE_INICIATIVA: $("#txt-fecha-inicio").val(),
                FECHA_FIN_INICIATIVA: $("#txt-fecha-fin").val(),
                NOMBRE_INICIATIVA: $("#txa-descripcion-iniciativa").val(),
                energ_b: $("#cbo-energetico-proyecto").val(),
                hash: $("#txa-bloackchain").val(), //add
                cantidad_registros: $("#cantidad-registros").val(),
                pagina: $("#pagina").val(),
                order_by: $("#columna").val(),
                order_orden: $("#orden").val(),
                ID_USUARIO: $("#Control").data("usuario"),
                ID_ESTADO: $("#estadoIniciativa").data("estado")
            }
            nurl = nurl + "Gestion/ListaBusquedaAvanzadaPrivado";

        } else {

            var Item = {
                hash: $("#txa-bloackchain").val(), //add
                cantidad_registros: $("#cantidad-registros").val(),
                pagina: $("#pagina").val(),
                order_by: $("#columna").val(),
                order_orden: $("#orden").val(),
                ID_USUARIO: $("#Control").data("usuario"),
                ID_ESTADO: $("#estadoIniciativa").data("estado")
            }
            nurl = nurl + "Gestion/ListaBusquedaAvanzadaPrivadoBlock";

        }


    }
    //=================================
    $("#tbl-main-preload").html("<i Class='fas fa-spinner fa-spin px-1'></i> Cargando...");
    $("#tbl-main").addClass("d-none");
    //======================================================================
    $.ajax({

        type: "POST",
        url: nurl,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        //async: false,
        data: JSON.stringify(Item),

        //url: nurl,
        //type: 'POST',
        //datatype: 'json',
        //data: Item,
        success: function (data) {
            $("#cuerpoMitigacion").html("");
            if (data != null && data != "") {
                if (data.length > 0) {
                    //$("#cuerpoMitigacion").html("");
                    for (var i = 0; i < data.length; i++) {
                        var p = data[i]["ID_PLAZO_ETAPA_ESTADO"];
                        var progreso = '0%';
                        if (data[i]["ID_ESTADO"] != 0 || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3)) {
                            if (data[i]["PROGRESO"] == 1 && (data[i]["ID_ESTADO"] == 1 || data[i]["ID_ESTADO"] == 5 || data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 6)) {
                                progreso = '25%';
                            } else if (data[i]["PROGRESO"] == 2 || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3)) {
                                progreso = '50%';
                            } else if (data[i]["PROGRESO"] == 3 && (data[i]["ID_ESTADO"] == 1 || data[i]["ID_ESTADO"] == 5 || data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 6)) {
                                progreso = '75%';
                            } else if (data[i]["PROGRESO"] == 4 || data[i]["PROGRESO"] == 5 || data[i]["PROGRESO"] == 6 || data[i]["PROGRESO"] == 7 || data[i]["PROGRESO"] == 8 || data[i]["PROGRESO"] == 9 || data[i]["PROGRESO"] == 10) {
                                progreso = '100%';
                            }
                        }

                        var estado_iniciativa = $("#estadoIniciativa").data("estado");
                        var tooltip = "";
                        if (data[i]["PROGRESO"] == 1 && (data[i]["ID_ESTADO"] == 1)) {
                            tooltip = "Iniciativa de mitigación registrada";
                        } else if (data[i]["PROGRESO"] == 1 && data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 5) {
                            tooltip = "Iniciativa de mitigación observado";
                        } else if ((data[i]["PROGRESO"] == 2 && data[i]["ID_ESTADO"] == 3) || (data[i]["ID_ESTADO"] == 0 && data[i]["PROGRESO"] == 3)) {
                            tooltip = "Iniciativa de mitigación aprobada";
                        } else if (data[i]["PROGRESO"] == 3 && (data[i]["ID_ESTADO"] == 1)) {
                            tooltip = "Detalle de indicadores registrado";
                        } else if (data[i]["PROGRESO"] == 3 && (data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 5 || data[i]["ID_ESTADO"] == 6)) {
                            tooltip = "Detalle de indicadores observado";
                        } else if (data[i]["PROGRESO"] == 4 || data[i]["PROGRESO"] == 5 || data[i]["PROGRESO"] == 6 || data[i]["PROGRESO"] == 7 || data[i]["PROGRESO"] == 8) {
                            tooltip = "Detalle de indicadores aprobado";
                        }

                        var tr = '<tr>';
                        tr = tr + '<th class="text-center fila-inicio" data-encabezado="Número" scope="row">' + data[i]["ID_INICIATIVA"] + '</th>';
                        if ($('#Control').data('rol') == 3 && ((data[i]["PROGRESO"] == 5 || data[i]["PROGRESO"] == 8) && data[i]["ID_ESTADO"] == 3) && $("#estadoIniciativa").data("estado") == 4) {
                            $("#ocultar-enviado").show();
                            tr = tr + '<td class="text-center" data-encabezado="" scope="row">';
                            tr = tr + ' <div class="custom-control custom-checkbox d-inline-block">';
                            tr = tr + '     <input class="custom-control-input" type="checkbox" id="chk-send-im-' + data[i]["ID_INICIATIVA"] + '">';
                            tr = tr + '     <label class="custom-control-label" for="chk-send-im-' + data[i]["ID_INICIATIVA"] + '">&nbsp;</label>';
                            tr = tr + ' </div>';
                            tr = tr + '</td>';
                        } else if (($('#Control').data('rol') == 4 && data[i]["PROGRESO"] == 9 && data[i]["ID_ESTADO"] == 3) && $("#estadoIniciativa").data("estado") == 1) {
                            $("#ocultar-enviado").show();
                            tr = tr + '<td class="text-center" data-encabezado="" scope="row">';
                            tr = tr + ' <div class="custom-control custom-checkbox d-inline-block">';
                            tr = tr + '     <input class="custom-control-input" type="checkbox" id="chk-send-im-' + data[i]["ID_INICIATIVA"] + '">';
                            tr = tr + '     <label class="custom-control-label" for="chk-send-im-' + data[i]["ID_INICIATIVA"] + '">&nbsp;</label>';
                            tr = tr + ' </div>';
                            tr = tr + '</td>';
                        } else {
                            $("#ocultar-enviado").hide();
                        }
                        tr = tr + '<td data-encabezado="Nombre de Iniciativa">' + data[i]["NOMBRE_INICIATIVA"] + '</td>';
                        tr = tr + '<td data-encabezado="Progreso">';
                        tr = tr + '         <div class="progress" style="height: 20px;">';
                        tr = tr + '                 <div class="progress-bar progress-bar-striped" role="progressbar" style="width: ' + progreso + ';" aria-valuenow="' + progreso.substring(0, progreso.length - 1) + '" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="' + tooltip + '">' + progreso + '</div>';
                        tr = tr + '</div></td>';
                        tr = tr + '<td class="text-center">' + data[i]["FECHA"].toString() + '</td>';
                        tr = tr + '<td class="text-center">' + data[i]["FECHA_FIN"] + '</td>';
                        tr = tr + '<td class="text-center"><span data-toggle="tooltip" data-placement="top" title="' + data[i]["NOMBRE_MEDMIT"] + '"><strong>' + data[i]["NUMERO_MEDMIT"] + '</strong></span></td>';
                        tr = tr + '<td>' + data[i]["NOMBRE_INSTITUCION"] + '</td>';
                        if ($("#cuerpoMitigacion").data("convertir") == 1) {
                            tr = tr + '<td data-encabezado="Total reducido" class="text-center convertir"><span>' + formatoMiles((Math.round(data[i]["TOTAL_GEI"] * 100) / 100) / 1000) + '</span>&nbsp;<small>ktCO2eq<small></td>';
                        } else if ($("#cuerpoMitigacion").data("convertir") == 0) {
                            tr = tr + '<td data-encabezado="Total reducido" class="text-center convertir"><span>' + formatoMiles(Math.round(data[i]["TOTAL_GEI"] * 100) / 100) + '</span>&nbsp;<small>tCO2eq<small></td>';
                        }
                        //tr = tr + '<td data-encabezado="Total reducido" class="text-center convertir"><span>' + Math.round(data[i]["TOTAL_GEI"] * 100) / 100 + '</span>&nbsp;<small>tCO2eq<small></td>';


                        //if ($('#Control').data('rol') == 2) {
                        //    if (p == 1 || p == 3 || p == 4 || p == 6 || p == 7 || p == 9 || p == 10 || p == 12 || p == 2 || p == 5 || p == 8 || p == 11) {
                        //        tr = tr + '<td class="text-center" data-encabezado="Estado">';
                        //        if (data[i]["DIAS_RESTANTES"] > 5) {
                        //            tr = tr + '<i class="fas fa-flag text-success" data-toggle="tooltip" data-placement="top" title="Está dentro de los plazos de atención"></i>';
                        //        } else if (data[i]["DIAS_RESTANTES"] > 2) {
                        //            tr = tr + '<i class="fas fa-flag text-success" data-toggle="tooltip" data-placement="top" title="Está dentro de los plazos de atención"></i>';
                        //        } else if (data[i]["DIAS_RESTANTES"] > 1) {
                        //            tr = tr + '<i class="fas fa-flag text-warning" data-toggle="tooltip" data-placement="top" title="Su plazo de atención vence en 2 días"></i>';
                        //        } else {
                        //            tr = tr + '<i class="fas fa-flag text-danger" data-toggle="tooltip" data-placement="top" title="Su plazo está por vencer hoy o ya venció"></i>';
                        //        }
                        //        tr = tr + '&nbsp;' + data[i]["ESTADO_BANDEJA"] + '</td>';
                        //    } else {
                        //        tr = tr + '<td class="text-center" data-encabezado="Estado">' + data[i]["ESTADO_BANDEJA"] + '</td>';
                        //    }
                        //} else if ($('#Control').data('rol') == 3) {
                        //    tr = tr + '<td class="text-center" data-encabezado="Estado">';
                        //    if (data[i]["DIAS_RESTANTES"] > 5) {
                        //        tr = tr + '<i class="fas fa-flag text-success" data-toggle="tooltip" data-placement="top" title="Está dentro de los plazos de atención"></i>';
                        //    } else if (data[i]["DIAS_RESTANTES"] > 2) {
                        //        tr = tr + '<i class="fas fa-flag text-success" data-toggle="tooltip" data-placement="top" title="Está dentro de los plazos de atención"></i>';
                        //    } else if (data[i]["DIAS_RESTANTES"] > 1) {
                        //        tr = tr + '<i class="fas fa-flag text-warning" data-toggle="tooltip" data-placement="top" title="Su plazo de atención vence en 2 días"></i>';
                        //    } else {
                        //        tr = tr + '<i class="fas fa-flag text-danger" data-toggle="tooltip" data-placement="top" title="Su plazo está por vencer hoy o ya venció"></i>';
                        //    }
                        //    tr = tr + '&nbsp;' + data[i]["ESTADO_BANDEJA"] + '</td>';
                        //} else {
                        //    tr = tr + '<td class="text-center" data-encabezado="Estado">' + data[i]["ESTADO_BANDEJA"] + '</td>';
                        //}

                        tr = tr + '<td class="text-center" data-encabezado="Estado">' + data[i]["ESTADO_BANDEJA"] + '</td>';

                        tr = tr + '<td class="text-center text-xs-right" data-encabezado="Acciones">';

                        tr = tr + '     <div class="btn-group">';
                        //if (data[i]["ID_ESTADO"] == 2 && data[i]["PROGRESO"] == 1) {
                        //  tr = tr + '         <div class="acciones fase-01 dropdown-toggle text-warning" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';

                        if (p == 16 || p == 18) {
                            tr = tr + '<div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        } else {
                            if ($('#Control').data('rol') == 2 || $('#Control').data('rol') == 3) {
                                if (data[i]["DIAS_RESTANTES"] > 2) {
                                    tr = tr + '<div class="acciones bg-success text-white dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                                } else if (data[i]["DIAS_RESTANTES"] > 1) {
                                    tr = tr + '<div class="acciones bg-warning text-white dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                                } else {
                                    tr = tr + '<div class="acciones bg-danger text-white dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                                }
                            } else if ($('#Control').data('rol') == 1) {
                                if ($("#estadoIniciativa").data("estado") == 1) {
                                    if (data[i]["DIAS_RESTANTES"] > 2) {
                                        tr = tr + '<div class="acciones bg-success text-white dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                                    } else if (data[i]["DIAS_RESTANTES"] > 1) {
                                        tr = tr + '<div class="acciones bg-warning text-white dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                                    } else {
                                        tr = tr + '<div class="acciones bg-danger text-white dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                                    }
                                } else {
                                    tr = tr + '<div class="acciones bg-white text-dark dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                                }
                            } else {
                                tr = tr + '<div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                            }
                        }

                        tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';
                        if (data[i]["PROGRESO"] == 1 || data[i]["PROGRESO"] == 2) {
                            tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_verMasPrivadoIniciativaG(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-plus-circle"></i>&nbsp;Ver detalles</a>';
                        } else if (data[i]["PROGRESO"] >= 3) {
                            tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_verMasPrivadoIniciativaDetalleG(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-plus-circle"></i>&nbsp;Ver detalles</a>';
                        }
                        tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarSeguimiento(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-history"></i>&nbsp;Seguimiento</a>';
                        //add 01-05-2020
                        //////////==================OBSERVACIONES ========================================
                        //tr = tr + '             <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-observaciones"><i class="fas fa-envelope"></i>&nbsp;Observaciones</a>';
                        if ($('#Control').data('rol') != 7) //add 26-10-20
                        tr = tr + '             <a class="dropdown-item" href="javascript:void(0);" onclick="mostrarObservacion(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fas fa-comments"></i>&nbsp;Observaciones</a>';

                        if ($('#Control').data('rol') == 7)
                            tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarDetalleIndicadorNuevo(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-clipboard-list"></i>&nbsp;Auditar</a>';
                        
                        if ($('#Control').data('rol') == 2 || $('#Control').data('rol') == 1) {
                            if (data[i]["PROGRESO"] == 1 && data[i]["ID_ESTADO"] == 0 && $('#Control').data('rol') == 1) {
                                tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarEditarIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                            } else if (data[i]["PROGRESO"] == 1 && (data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 6) && $('#Control').data('rol') == 1) {
                                tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarCorregirIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                            } else if (data[i]["PROGRESO"] == 2 && $('#Control').data('rol') == 1 && data[i]["ID_ESTADO"] == 3) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_cargarIdIniciativa(' + data[i]["ID_INICIATIVA"] + ');" data-toggle="modal" data-target="#tipo-ingreso-detalle"><i class="fas fa-clipboard-list"></i>&nbsp;Agregar detalle</a>';
                            } else if (data[i]["PROGRESO"] == 3 && data[i]["ID_ESTADO"] == 0 && $('#Control').data('rol') == 1) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarEditarIndicador(' + data[i]["ID_INICIATIVA"] + ', ' + data[i]["ID_TIPO_INGRESO"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                            } else if (data[i]["PROGRESO"] == 3 && (data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 6) && $('#Control').data('rol') == 1) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarCorregirIndicador(' + data[i]["ID_INICIATIVA"] + ', ' + data[i]["ID_TIPO_INGRESO"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                            } else if (data[i]["PROGRESO"] == 4 && data[i]["ID_ESTADO"] == 3 && $('#Control').data('rol') == 1 && data[i]["ID_MEDMIT"] != 4) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarDetalleIndicadorNuevo(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-clipboard-list"></i>&nbsp;Agregar detalle</a>';
                            } else if (data[i]["PROGRESO"] == 5 && data[i]["ID_ESTADO"] == 3 && $('#Control').data('rol') == 1 && data[i]["ID_MEDMIT"] == 4) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarDetalleIndicadorNuevo(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-clipboard-list"></i>&nbsp;Agregar detalle</a>';
                            }
                            /*else if (data[i]["PROGRESO"] == 7 && data[i]["ID_ESTADO"] == 3 && $('#Control').data('rol') == 1) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarDetalleIndicadorNuevo(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-clipboard-list"></i>&nbsp;Agregar detalle</a>';
                            }*/
                        }

                        //==============================
                        if ($('#Control').data('rol') == 2 && $("#estadoIniciativa").data("estado") == 9) {
                            if (data[i]["PROGRESO"] == 1 && data[i]["ID_ESTADO"] == 0 && $('#Control').data('rol') == 2) {
                                tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarEditarIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                            } else if (data[i]["PROGRESO"] == 1 && (data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 6) && $('#Control').data('rol') == 2) {
                                tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarCorregirIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                            } else if (data[i]["PROGRESO"] == 2 && $('#Control').data('rol') == 2 && data[i]["ID_ESTADO"] == 3) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_cargarIdIniciativa(' + data[i]["ID_INICIATIVA"] + ');" data-toggle="modal" data-target="#tipo-ingreso-detalle"><i class="fas fa-clipboard-list"></i>&nbsp;Agregar detalle</a>';
                            } else if (data[i]["PROGRESO"] == 3 && data[i]["ID_ESTADO"] == 0 && $('#Control').data('rol') == 2) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarEditarIndicador(' + data[i]["ID_INICIATIVA"] + ', ' + data[i]["ID_TIPO_INGRESO"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                            } else if (data[i]["PROGRESO"] == 3 && (data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 6) && $('#Control').data('rol') == 2) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarCorregirIndicador(' + data[i]["ID_INICIATIVA"] + ', ' + data[i]["ID_TIPO_INGRESO"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                            } else if (data[i]["PROGRESO"] == 4 && data[i]["ID_ESTADO"] == 3 && data[i]["ID_MEDMIT"] != 4) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarDetalleIndicadorNuevo(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-clipboard-list"></i>&nbsp;Agregar detalle</a>';
                            } else if (data[i]["PROGRESO"] == 5 && data[i]["ID_ESTADO"] == 3 && data[i]["ID_MEDMIT"] == 4) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarDetalleIndicadorNuevo(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-clipboard-list"></i>&nbsp;Agregar detalle</a>';
                            }
                            /*else if (data[i]["PROGRESO"] == 7 && data[i]["ID_ESTADO"] == 3) {
                                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarDetalleIndicadorNuevo(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-clipboard-list"></i>&nbsp;Agregar detalle</a>';
                            }*/
                        }
                        //================================================

                        if (estado_iniciativa == 1) {
                            if ($('#Control').data('rol') == 2 && data[i]["PROGRESO"] == 1 && (data[i]["ID_ESTADO"] == 1 || data[i]["ID_ESTADO"] == 5)) {
                                tr = tr + '             <a class="dropdown-item text-primary" href="#" onclick="fn_revisarIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-check"></i>&nbsp;Revisar</a>';
                                //tr = tr + '             <a class="dropdown-item text-primary" href="@Url.Action("MantenimientoTablas","Gestion")"><i class="fas fa-check"></i>&nbsp;Revisar</a>';
                            } else if ($('#Control').data('rol') == 2 && ((data[i]["PROGRESO"] == 3 && (data[i]["ID_ESTADO"] == 1 || data[i]["ID_ESTADO"] == 5)) || (data[i]["PROGRESO"] == 4 && data[i]["ID_ESTADO"] == 2))) {
                                tr = tr + '<a class="dropdown-item text-primary" href="#" onclick="fn_revisarDetalle(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-check-double"></i>&nbsp;Revisar</a>';
                            }
                            if ($('#Control').data('rol') == 3 && ((data[i]["PROGRESO"] == 4 && data[i]["ID_ESTADO"] == 3) || ((data[i]["PROGRESO"] == 8 || data[i]["PROGRESO"] == 5) && data[i]["ID_ESTADO"] == 2))) {
                                tr = tr + '<a class="dropdown-item text-primary" href="#" onclick="fn_revisarDetalleAdmin(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-check-double"></i>&nbsp;Revisar</a>';
                                tr = tr + `        <a class="dropdown-item text-danger" href="#" data-toggle="modal" data-target="#modal-confirmacion" onclick="guardarIdIniciativa(${data[i]["ID_INICIATIVA"]})"><i class="fas fa-minus-circle"></i>&nbsp;Eliminar acción</a>`;
                            }
                            //if ($('#Control').data('rol') == 4 && ((data[i]["PROGRESO"] == 5 && (data[i]["ID_ESTADO"] == 3 || data[i]["ID_ESTADO"] == 5)) || (data[i]["PROGRESO"] == 6 && data[i]["ID_ESTADO"] == 2))) {
                            if ($('#Control').data('rol') == 4 && (data[i]["PROGRESO"] == 9 && (data[i]["ID_ESTADO"] == 3 || data[i]["ID_ESTADO"] == 5))) {
                                tr = tr + '             <a class="dropdown-item text-info" href="#" onclick="fn_evaluarIniciativaDetalle(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-clipboard-check"></i>&nbsp;Evaluar</a>';
                            }
                            //if ($('#Control').data('rol') == 5 && (data[i]["PROGRESO"] == 6 || data[i]["PROGRESO"] == 8) && (data[i]["ID_ESTADO"] == 3 || data[i]["ID_ESTADO"] == 5)) {
                            if ($('#Control').data('rol') == 5 && (data[i]["PROGRESO"] == 10 || data[i]["PROGRESO"] == 8) && (data[i]["ID_ESTADO"] == 3 || data[i]["ID_ESTADO"] == 5)) {
                                tr = tr + '             <a class="dropdown-item text-warning" href="#" onclick="fn_verificarIniciativaDetalle(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-tasks"></i>&nbsp;Verificar</a>';
                            }
                        }

                        //if (p >= 6) {
                        //    tr = tr + '        <a class="dropdown-item" href="#" onclick="fn_visualizarFicha(' + data[i]["ID_INICIATIVA"] + ',' + p + ');" id="ficha-' + data[i]["ID_INICIATIVA"] + '" data-ficha="' + data[i]["ESTADO_FICHA"] + '"><i class="fas fa-download"></i>&nbsp;Descargar ficha</a>';
                        //}
                        if ($('#Control').data('rol') == 2) {
                            if (p == 1 || p == 3 || p == 4 || p == 6 || p == 7 || p == 9 || p == 10 || p == 12) {
                                tr = tr + '        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-recordatorio" onclick="fn_mostrarUsuarioRecordatorio(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-envelope"></i>&nbsp;Recordatorio</a>';
                            }
                        } else if ($('#Control').data('rol') == 3) {
                            if (p != 12 && p != 15 && p != 17 && p != 13 && p != 19) {
                                tr = tr + '        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-recordatorio" onclick="fn_mostrarUsuarioRecordatorio(' + data[i]["ID_INICIATIVA"] + ')"><i class="fas fa-envelope"></i>&nbsp;Recordatorio</a>';
                                tr = tr + `        <a class="dropdown-item text-danger" href="#" data-toggle="modal" data-target="#modal-confirmacion" onclick="guardarIdIniciativa(${data[i]["ID_INICIATIVA"]})"><i class="fas fa-minus-circle"></i>&nbsp;Eliminar acción</a>`;
                            }                            
                        }
                        //if (p == 16 || p == 18) {
                        //    tr = tr + '<a class="dropdown-item" href="javascript:void(0);" onclick="fn_visualizarBlockchain(' + data[i]["ID_BLOCKCHAIN"] + ');" id="block-' + data[i]["ID_BLOCKCHAIN"] + '" data-block="' + data[i]["GENERADO_PDF"] + '"><i class="fas fa-file-code"></i>&nbsp;Blockchain</a></div>';
                        //}

                        tr = tr + '         </div>';
                        tr = tr + '     </div>';
                        tr = tr + '</td>';

                        //add 01-05-2020

                        if (p >= 6) {
                            tr = tr + '<td class="text-center text-xs-right" data-encabezado="Descargas">';
                            tr = tr + '     <div class="btn-group">'
                            tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-download"></i></div>';
                            tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';

                            if (p >= 6) {
                                tr = tr + '        <a class="dropdown-item" href="#" onclick="fn_visualizarFicha(' + data[i]["ID_INICIATIVA"] + ',' + p + ');" id="ficha-' + data[i]["ID_INICIATIVA"] + '" data-ficha="' + data[i]["ESTADO_FICHA"] + '"><i class="fas fa-download"></i>&nbsp;Descargar ficha</a>';
                            }

                            if (p == 16 || p == 18) {
                                tr = tr + '<a class="dropdown-item" href="javascript:void(0);" onclick="fn_visualizarBlockchain(' + data[i]["ID_BLOCKCHAIN"] + ');" id="block-' + data[i]["ID_BLOCKCHAIN"] + '" data-block="' + data[i]["GENERADO_PDF"] + '"><i class="fas fa-file-code"></i>&nbsp;Blockchain</a></div>';
                            }

                            tr = tr + '         </div>'
                            tr = tr + '         </div>'
                            tr = tr + '     </div>'
                            tr = tr + '</td>'
                        } else {
                            tr = tr + '<td class="text-center text-xs-right" data-encabezado="Descargas">';
                            tr = tr + '     <div class="btn-group">'
                            tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-download"></i></div>';
                            tr = tr + '         </div>'
                            tr = tr + '     </div>'
                            tr = tr + '</td>'
                        }



                        tr = tr + '</tr>';
                        $("#cuerpoMitigacion").append(tr);
                        $('[data-toggle="tooltip"]').tooltip();

                        pagina = Number(data[i]["pagina"]);
                        total_paginas = Number(data[i]["total_paginas"]);
                        total_registros = Number(data[i]["total_registros"]);
                        inicio = (Number(data[i]["cantidad_registros"]) * pagina) - Number(data[i]["cantidad_registros"]) + 1;
                        fin = Number(data[i]["cantidad_registros"]) * pagina;
                        if (pagina == total_paginas) {
                            if (fin > total_registros)
                                fin = total_registros
                        }
                        resultado = inicio + " de " + fin
                    }
                    $("#resultado").html(resultado);
                    $("#total-registros").html(total_registros);
                    $("#pagina-actual").html(pagina);
                    $("#total-paginas").html(total_paginas);
                    if (Number($("#pagina").val()) > total_paginas) {
                        $("#pagina").val(total_paginas);
                    }

                }

            } else {
                $("#resultado").html("0 - 0");
                $("#total-registros").html(0);
                $("#pagina-actual").html(1);
                $("#total-paginas").html(1);
                $("#pagina").val(1);
                $("#ocultar-enviado").hide(); //add 01-05-2020
            }
            $('[data-toggle="tooltip"]').tooltip();
            $("#tbl-main-preload").html("");
            $("#tbl-main").removeClass("d-none");
        },
        failure: function (msg) {
            console.log(msg);
        },
        error: function (xhr, status, error) {
            console.log(error);
            location.href = baseUrl + "Home/login";
        }
    });
}


function fn_busqueda_Privado() {
    if ($("#buscar").data("numero") == 0) {
        $("#buscar-iniciativa").data("campo", $("#txt-buscar").val());
    }
    fn_CargaIniciativas();
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

function CargarMedidaMitigacion(vurl) {
    var item = {
    };
    //vurl = baseUrl + "Portal/ListarMedidaMitigacion";
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

//===========================================================================================
function valor() {
    debugger;
    if ($("#buscar").data("numero") == 0) {
        $("#buscar").data("numero", 1);
        //alert("soy 0");
    } else {
        $("#buscar").data("numero", 0);
        //alert("soy 1");
    }
}
//================================================================================================0


function CargarSector(vurl) {
    var item = {
    };
    //vurl = baseUrl + "Portal/ListaSectorInstitucion";
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

function CargarEnergeticoLineaBase(vurl) {
    var item = {
    };
    //vurl = baseUrl + "Portal/ListaEnergetico";
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


function CargarEnergeticoProyecto(vurl) {
    var item = {
    };
    //vurl = baseUrl + "Portal/ListaEnergeticoProyecto";
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
    //if ($("#buscar").data("numero") == 0) {
    //    fn_buscarPublicoSimple();
    //} else {
    //    fn_buscarPublicoAvanzado();
    //}
    if ($("#buscar").data("numero") == 0) {
        $("#buscar-iniciativa").data("campo", $("#txt-buscar").val());
    }
    fn_CargaIniciativas();
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
function fn_busqueda_Priva() {
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
            if (data[i]["PROGRESO"] == 1 && data[i]["ID_ESTADO"] == 0 && $('#Control').data('rol') == 1) {
                tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarEditarIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
            } else if (data[i]["PROGRESO"] == 1 && data[i]["ID_ESTADO"] == 2 && $('#Control').data('rol') == 1) {
                tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarCorregirIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
            } else if (data[i]["PROGRESO"] == 2 && $('#Control').data('rol') == 1 && data[i]["ID_ESTADO"] == 3) {
                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_cargarIdIniciativa(' + data[i]["ID_INICIATIVA"] + ');" data-toggle="modal" data-target="#tipo-ingreso-detalle"><i class="fas fa-clipboard-list"></i>&nbsp;Detalles</a>';
            } else if (data[i]["PROGRESO"] == 3 && data[i]["ID_ESTADO"] == 0 && $('#Control').data('rol') == 1) {
                tr = tr + '             <a class="dropdown-item text-success" href="#" onclick="fn_mostrarEditarIndicador(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
            } else if (data[i]["PROGRESO"] == 3 && (data[i]["ID_ESTADO"] == 2 || data[i]["ID_ESTADO"] == 6) && $('#Control').data('rol') == 1) {
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

function fn_filtrarEstado(opc, t) {
    var $t = t;
    var $e = $t.html();
    var $a = $t.parent().prev();
    $a.html($e);
    $("#estadoIniciativa").data("estado", opc);

    // add 01-05-2020
    if ($('#Control').data('rol') == 3) {
        if ($("#estadoIniciativa").data("estado") == 4) {
            $(".btn-enviar").removeClass("d-none");
        } else {
            $(".btn-enviar").addClass("d-none");
        }
    }

    // add 01-05-2020
    if ($('#Control').data('rol') == 4) {
        if ($("#estadoIniciativa").data("estado") == 1) {
            $(".btn-evaluar").removeClass("d-none");
        } else {
            $(".btn-evaluar").addClass("d-none");
        }
    }

    fn_CargaIniciativas();
}

//$("#filtro-estado .dropdown-item").on("click", function(e){
//    e.preventDefault();
//    var $t = $(this);
//    var $e = $t.html();
//    var $a = $t.parent().prev();
//    //console.log($e);
//    $a.html($e);
// });

function fn_filtrarObservado() {
    item = {
    };

    fn_buscar(item, baseUrl + "Gestion/ListaObservado");
}

function fn_buscar(item, vurl) {
    //vurl = baseUrl + "Portal/BusquedaAvanzadaPrivado";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    tablaMitigacionEstado(data);
                }
            }
        }
    });
}

function tablaMitigacionEstado(data) {

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

//////EXPORTAR

function exportarIniciativa() {
    //var item = {
    //    ID_USUARIO: $("#Control").data("usuario"),
    //    ID_ROL: $("#Control").data("rol"),
    //    ID_ESTADO: $("#estadoIniciativa").data("estado")
    //};
    if ($("#cuerpoMitigacion").html() != "") {

        //var anno = 0;
        //if ($("#txt-fecha-inicio").val() != "") {
        //    anno = $("#txt-fecha-inicio").val();
        //}

        if ($("#buscar").data("numero") == 0) {

            var item = {
                buscar: $("#buscar-iniciativa").data("campo"),
                order_by: $("#columna").val(),
                order_orden: $("#orden").val(),
                ID_USUARIO: $("#Control").data("usuario"),
                ID_ESTADO: $("#estadoIniciativa").data("estado"),
                METODO: $("#buscar").data("numero")
            }
        }
        else {

            var item = {
                medida_b: $("#cbo-medida-mitigacion").val(),
                //anio_b: anno,
                sector_b: $("#cbo-sector").val(),
                //gei_b: $("#cbo-energetico-base").val(),
                //energ_b: $("#cbo-energetico-proyecto").val(),
                FECHA_IMPLE_INICIATIVA: $("#txt-fecha-inicio").val(),
                FECHA_FIN_INICIATIVA: $("#txt-fecha-fin").val(),
                NOMBRE_INICIATIVA: $("#txa-descripcion-iniciativa").val(),
                order_by: $("#columna").val(),
                order_orden: $("#orden").val(),
                ID_USUARIO: $("#Control").data("usuario"),
                ID_ESTADO: $("#estadoIniciativa").data("estado"),
                METODO: $("#buscar").data("numero")
            }
        }
        var url = baseUrl + 'Portal/ExportarIniciativa';

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
}

function CorreoAdmin() {
    var url = baseUrl + "Gestion/CorreoAdministrador";
    var item = {};
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#correo-admin").html(respuesta.extra);
    }
}

//===================================================================

$(document).on("change", "#cbo-actor-paquete", function () {
    $("#lista-actor-enviar").data("paquete", 0);
    CargarListaActor();
});

function CargarListaActor() {
    var item = {
        ID_ROL: $("#cbo-actor-paquete").val()
    };
    $.ajax({
        url: baseUrl + "Gestion/ListarActorEnviar",
        //type: 'POST',
        //datatype: 'json',
        //data: item,

        type: "POST",
        //url: nurl,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        //async: false,
        data: JSON.stringify(item),

        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#lista-actor-enviar").html("");
                    var tr = "";
                    for (var i = 0; i < data.length; i++) {
                        tr += '<div class="col-auto my-1" onclick="fn_seleccionarIdActor(' + data[i]["ID_USUARIO"] + ')">';
                        tr += '     <div class="custom-control custom-radio mr-sm-2">';
                        tr += '          <input class="custom-control-input" type="radio" name="rad-evaluadores" id="rad-evaluador-' + data[i]["ID_USUARIO"] + '">';
                        tr += '          <label class="custom-control-label" for="rad-evaluador-' + data[i]["ID_USUARIO"] + '">';
                        tr += '                 ' + data[i]["NOMBRES"] + '&nbsp;';
                        tr += '          </label>';
                        tr += '     </div>';
                        tr += '</div>';
                    }
                    $("#lista-actor-enviar").append(tr);
                }
            }
        },
        failure: function (msg) {
            console.log(msg);
        },
        error: function (xhr, status, error) {
            console.log(error);
            location.href = baseUrl + "Home/login";
        }
    });
}


//=============================================================================

$(document).ready(function () {
    var idiniciativatemp = 0;
    $("#pieCorrecto").hide();
    CargarOpcionesCuerpo();
    var url = "";
    var SectorUrl = "";
    var EnergUrl = "";
    var GeiUrl = "";
    if ($("#Control").data("usuario") > 0) {
        url = baseUrl + "Gestion/ListarMedidaMitigacion";
        SectorUrl = baseUrl + "Gestion/ListaSectorInstitucion";
        EnergUrl = baseUrl + "Gestion/ListaEnergetico";
        GeiUrl = baseUrl + "Gestion/ListaEnergeticoProyecto";
    } else {
        url = baseUrl + "Portal/ListarMedidaMitigacion";
        SectorUrl = baseUrl + "Portal/ListaSectorInstitucion";
        EnergUrl = baseUrl + "Portal/ListaEnergetico";
        GeiUrl = baseUrl + "Portal/ListaEnergeticoProyecto";
    }
    CargarMedidaMitigacion(url);
    CargarSector(SectorUrl);
    CargarEnergeticoLineaBase(EnergUrl);
    CargarEnergeticoProyecto(GeiUrl);
    if ($("#Control").data("usuario") > 0) {
        CorreoAdmin();
        if ($("#Control").data("rol") == 2) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasEspecialista");
        } else if ($("#Control").data("rol") == 3) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasGeneral");
        } else if ($("#Control").data("rol") == 1) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasUsuario");
        } else if ($("#Control").data("rol") == 4) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasEvaluar");
        } else if ($("#Control").data("rol") == 5) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasVerificar");
        } else if ($("#Control").data("rol") == 7) {
            CargarListarIniciativaMitigacionGeneral(baseUrl + "Gestion/ListaIniciativasAuditar");
        }

        if ($("#Control").data("rol") == 3) {
            CargarListaActor();
        }
        //fn_actualizaCampana();
        //enLinea();
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


$("#modal-bienvenida").on("hidden.bs.modal", function () {
    url = baseUrl + "Gestion/ActualizarPrimeraVisita"
    var item = {
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
    } else {
    }
});

function convertirATonelada() {
    if ($("#cuerpoMitigacion").data("convertir") == 1) { // 1: kilot, 0:t
        campos = $("#cuerpoMitigacion").find("tr");
        campos.each(function (index, value) {
            var valor = $(value).find(".convertir").find("span").html();

            valor = valor.replace(/,/gi, ''); //add

            valor = valor * 1000;
            valor = Math.round(valor * 100) / 100;
            $(value).find(".convertir").find("span").html(formatoMiles(valor));
            $(value).find(".convertir").find("small").html("tCO2eq");
        });
        $("#cuerpoMitigacion").data("convertir", 0);
    }
}

function convertirAKiloTonelada() {
    if ($("#cuerpoMitigacion").data("convertir") == 0) {
        campos = $("#cuerpoMitigacion").find("tr");
        campos.each(function (index, value) {
            var valor = $(value).find(".convertir").find("span").html();

            valor = valor.replace(/,/gi, ''); //add

            valor = valor / 1000;
            valor = Math.round(valor * 100000) / 100000;//add
            $(value).find(".convertir").find("span").html(formatoMiles(valor));
            $(value).find(".convertir").find("small").html("ktCO2eq");
        });
        $("#cuerpoMitigacion").data("convertir", 1);
    }
}

function fn_habilitarTodo() {
    var validar = 0;
    if ($("#chk-send-im").prop("checked")) {
        validar = 0;
    } else {
        validar = 1;
    }

    if (validar == 1) {
        $('#chk-send-im').prop("checked", true);
    } else {
        $('#chk-send-im').prop("checked", false);
    }


    var row = $("#tabla-iniciativa").find("tbody").find("tr");
    row.each(function (index, value) {
        var fila = $(value).find(".fila-inicio").html();
        if (validar == 1) {
            $('#chk-send-im-' + fila).prop("checked", true);
        } else {
            $('#chk-send-im-' + fila).prop("checked", false);
        }
    });
}

function fn_seleccionarIdActor(id) {
    $("#lista-actor-enviar").data("paquete", id);
}


function fn_enviarPaquete() {
    $("#seccionMensaje #errorRegistro").remove();
    var id_iniciativa = "";
    var rol = 0;
    var cont = 0;
    var row = $("#tabla-iniciativa").find("tbody").find("tr");
    row.each(function (index, value) {
        var fila = $(value).find(".fila-inicio").html();
        if ($("#chk-send-im-" + fila).prop("checked")) {
            id_iniciativa += fila + ",";
            cont++;
        }
    });
    id_iniciativa = id_iniciativa.substring(0, id_iniciativa.length - 1);

    if ($("#lista-actor-enviar").data("paquete") != 0) {
        //if (cont > 0) {
        if ($("#cbo-actor-paquete").val() == 4) {
            if ($("#cbo-medida-mitigacion").val() == 0 || $("#txt-fecha-inicio").val() == "" || $("#txt-fecha-fin").val() == "") {
                fn_msjError('<hr><small class="mb-0">Por favor, seleccione la medida de mitigación y el período de las fechas en que se enviarán las acciones de mitigación.</small>');
            } else {
                if (cont > 0) {
                    fn_asignarIniciativa(id_iniciativa, $("#lista-actor-enviar").data("paquete"), $("#cbo-actor-paquete").val());
                } else {
                    fn_msjError('<hr><small class="mb-0">Por favor, seleccione una o más acciones de mitigación para enviar al Evaluador.</small>');
                }
            }
            //} else if ($("#cbo-actor-paquete").val() == 5 && cont == 1) {                
            //  fn_asignarIniciativa(id_iniciativa, $("#lista-actor-enviar").data("paquete"));   
        } else if ($("#cbo-actor-paquete").val() == 5) {
            if (cont > 0) {
                fn_asignarIniciativa(id_iniciativa, $("#lista-actor-enviar").data("paquete"), $("#cbo-actor-paquete").val());
            } else {
                fn_msjError('<hr><small class="mb-0">Por favor, seleccione una o más acciones de mitigación para enviar al Verificador.</small>');
            }
            //} else if ($("#cbo-actor-paquete").val() == 5 && cont > 0) {
            //fn_msjError('<hr><small class="mb-0">Por favor, seleccione solo una iniciativa para el envío de la iniciativa al Verificador.</small>');
            //} else if (cont == 0) {
            //fn_msjError('<hr><small class="mb-0">Por favor, seleccione la iniciativa que se enviará al Verificador.</small>');
        }
    } else {
        fn_msjError('<hr><small class="mb-0">Por favor, seleccione a un evaluador o verificador para el envío de la(s) acción(es) de mitigación.</small>');
    }
}

function fn_msjError(error) {
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
    //msj = msj + '                                <hr><small class="mb-0">Verifique que los datos sean correctamente ingresados, complete todos los campos obligatorios e intente otra vez.</small>';
    msj = msj + error;
    msj = msj + '                            </div>';
    msj = msj + '                        </div>';
    $("#seccionMensaje").append(msj);
}

function fn_msjErrorR(error) {
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
    //msj = msj + '                                <hr><small class="mb-0">Verifique que los datos sean correctamente ingresados, complete todos los campos obligatorios e intente otra vez.</small>';
    msj = msj + error;
    msj = msj + '                            </div>';
    msj = msj + '                        </div>';
    $("#seccionMensaje2").append(msj);
}

$("#modal-evaluador").on("hidden.bs.modal", function () {
    //$("#lista-actor-enviar").data("paquete", 0);
    $("#seccionMensaje #errorRegistro").remove();
    $("#msjCorrectoPaquete").attr("hidden", true);
    $("#msjErrorPaquete").attr("hidden", true);
    $("#pieCorrecto").hide();
    $("#pieInicial").show();
});

function fn_asignarIniciativa(id_iniciativa, id_actor, rol) {
    $("#msjCorrectoPaquete").attr("hidden", true);
    $("#msjErrorPaquete").attr("hidden", true);
    $("#pieInicial").hide();
    var item = {
        ID_USUARIO: id_actor,
        ID_INICIATIVA_MASIVO: id_iniciativa,
        ID_ROL: rol,
        FECHA_IMPLE_INICIATIVA: $("#txt-fecha-inicio").val(),
        FECHA_FIN_INICIATIVA: $("#txt-fecha-fin").val(),
        ID_MEDMIT: $("#cbo-medida-mitigacion").val()
    };
    var respuesta = MRV.Ajax(baseUrl + "Gestion/AsignarIniciativaMasivo", item, false);
    if (respuesta.success) {
        $("#pieCorrecto").show();
        $("#msjCorrectoPaquete").removeAttr("hidden");
        resetearValores(); //add
        fn_CargaIniciativas();
    } else {
        $("#pieCorrecto").show();
        $("#msjErrorPaquete").removeAttr("hidden");
    }

}

function fn_mostrarUsuarioRecordatorio(id) {

    var item = {
        ID_INICIATIVA: id
    };
    $.ajax({
        url: baseUrl + "Gestion/MostrarUsuarioRecordatorio",
        //type: 'POST',
        //datatype: 'json',
        //data: item,

        type: "POST",
        //url: nurl,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        //async: false,
        data: JSON.stringify(item),

        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var rol = data[i]["ID_ROL"];
                        var color = "";
                        $("#btn-recordatorio").data("id", data[i]["ID_ASIGNADO"]);
                        $("#btn-recordatorio").data("rolusu", data[i]["ID_ROL"]);
                        $("#btn-recordatorio").data("inic", id);
                        if (rol == 1) {
                            color = "02";
                        } else if (rol == 2) {
                            color = "03";
                        } else if (rol == 3) {
                            color = "06";
                        } else if (rol == 4) {
                            color = "04";
                        } else if (rol == 5) {
                            color = "05";
                        }
                        $("#usuario-recordatorio").html("").html(data[i]["NOMBRES"]);
                        $("#rol-recordatorio").html("").html(data[i]["DESCRIPCION_ROL"]);
                        $("#rol-recordatorio").removeClass("badge-actor-02 badge-actor-06 badge-actor-03 badge-actor-04 badge-actor-05").addClass("badge-actor-" + color);
                    }
                }
            }
        },
        failure: function (msg) {
            console.log(msg);
        },
        error: function (xhr, status, error) {
            console.log(error);
            location.href = baseUrl + "Home/login";
        }
    });

}

function fn_enviarMensajeRecordatorio() {
    $("#msjCorrectoRecordatorio").attr("hidden", true);
    $("#msjErrorRecordatorio").attr("hidden", true);
    $("#seccionMensaje2 #errorRegistro").remove();
    $("#pieRecordatorio").show();
    $("#pieCorrectoRecordatorio").attr("hidden", true);

    if ($("#txa-descripcion").val().trim() == "") {
        fn_msjErrorR('<hr><small class="mb-0">Por favor, ingresar una descripción.</small>');
        return false;
    }

    url = baseUrl + "Gestion/EnviarRecordatorio"
    var item = {
        ID_ASIGNADO: $("#btn-recordatorio").data("id"),
        ID_ROL: $("#btn-recordatorio").data("rolusu"),
        ID_INICIATIVA: $("#btn-recordatorio").data("inic"),
        DESCRIPCION: $("#txa-descripcion").val()
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#msjCorrectoRecordatorio").removeAttr("hidden");
        $("#pieRecordatorio").hide();
        $("#pieCorrectoRecordatorio").removeAttr("hidden");
    } else {
        $("#msjErrorRecordatorio").removeAttr("hidden");
    }
}

$("#modal-recordatorio").on("hidden.bs.modal", function () {
    $("#msjCorrectoRecordatorio").attr("hidden", true);
    $("#msjErrorRecordatorio").attr("hidden", true);
    $("#seccionMensaje2 #errorRegistro").remove();
    $("#pieRecordatorio").show();
    $("#pieCorrectoRecordatorio").attr("hidden", true);
});

function fn_aprobarPaquete() {
    var id_iniciativa = "";
    var rol = 0;
    var cont = 0;
    var row = $("#tabla-iniciativa").find("tbody").find("tr");
    row.each(function (index, value) {
        var fila = $(value).find(".fila-inicio").html();
        if ($("#chk-send-im-" + fila).prop("checked")) {
            id_iniciativa += fila + ",";
            cont++;
        }
    });
    id_iniciativa = id_iniciativa.substring(0, id_iniciativa.length - 1);

    //debugger;
    $("#seccionMensaje3 #errorRegistro").remove(); //add
    if ($("#cbo-medida-mitigacion").val() == 0 || $("#txt-fecha-inicio").val() == "" || $("#txt-fecha-fin").val() == "") {
        fn_msjErrorA('<hr><small class="mb-0">Por favor, seleccione la medida de mitigación y el período de las fechas en que se aprobarán las acciones de mitigación.</small>');
    } else {
        if (cont > 0) {
            fn_aprobarPaqueteIniciativa(id_iniciativa);
        } else {
            fn_msjErrorA('<hr><small class="mb-0">Por favor, seleccione una o más iniciativas para aprobarlas.</small>');
        }
    }
}


function fn_aprobarPaqueteIniciativa(id_iniciativa) {
    $("#seccionMensaje3 #errorRegistro").remove(); //add
    $("#msjCorrectoAprobar").attr("hidden", true);
    $("#msjErrorAprobar").attr("hidden", true);
    $("#pieCorrectoAprobar").attr("hidden", true);
    $("#pieAprobar").removeAttr("hidden");
    var item = {
        //ID_USUARIO: id_actor,        
        //ID_ROL: rol,
        ID_INICIATIVA_MASIVO: id_iniciativa
    };
    var respuesta = MRV.Ajax(baseUrl + "Gestion/AprobarIniciativaMasivo", item, false);
    if (respuesta.success) {
        $("#pieAprobar").attr("hidden", true);
        $("#pieCorrectoAprobar").removeAttr("hidden");
        $("#msjCorrectoAprobar").removeAttr("hidden");
        //alert("Registro exitoso");        
        fn_CargaIniciativas();
    } else {
        //alert("Error");
        $("#pieAprobar").attr("hidden", true);
        $("#pieCorrectoAprobar").removeAttr("hidden");
        $("#msjErrorAprobar").removeAttr("hidden");
    }

}

function resetearValores() {
    $("#cbo-medida-mitigacion").val(0);
    $("#txa-descripcion-iniciativa").val("");
    $("#txt-fecha-inicio").val("");
    $("#txt-fecha-fin").val("");
    $("#cbo-sector").val(0);
}

function fn_msjErrorA(error) {
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
    //msj = msj + '                                <hr><small class="mb-0">Verifique que los datos sean correctamente ingresados, complete todos los campos obligatorios e intente otra vez.</small>';
    msj = msj + error;
    msj = msj + '                            </div>';
    msj = msj + '                        </div>';
    $("#seccionMensaje3").append(msj);
}

$("#modal-aprobacion-evaluador").on("hidden.bs.modal", function () {
    $("#msjCorrectoAprobar").attr("hidden", true);
    $("#msjErrorAprobar").attr("hidden", true);
    $("#seccionMensaje3 #errorRegistro").remove();
    $("#pieAprobar").removeAttr("hidden");
    $("#pieCorrectoAprobar").attr("hidden", true);
});


function fn_visualizarBlockchain(idBlock) {
    if ($("#block-" + idBlock).data("block") == 1) {
        fn_mostrarBlockchain(idBlock);
    } else {
        fn_descargarCertificado(idBlock);
    }
}

function fn_mostrarBlockchain(idBlock) {
    var item = {
        ID_BLOCKCHAIN: idBlock
    };
    //var url = baseUrl + "Gestion/MostrarBlockChain";
    var url = baseUrl + "Gestion/DescargarBlockChain_2?IdBlockchain=" + idBlock;
    //var respuesta = MRV.Ajax(url, item, false);

    //if (respuesta.success) {
    //    var urlMostrar = baseUrl + "Temp/" + respuesta.extra;
    //    window.open(urlMostrar, "_blank");
    //}

    $.ajax({
        type: "POST",
        url: url,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        data: JSON.stringify(item),
        success: function (response) {
            var urlMostrar = baseUrl + "Temp/" + response.extra;
            window.open(urlMostrar, "_blank");
            $("#block-" + idBlock).data("block", 1);
        },
        failure: function (msg) {
            console.log(msg);
        },
        error: function (xhr, status, error) {
            console.log(error);
            location.href = baseUrl + "Home/login";
        }
    });
}

function fn_descargarCertificado(idBlock) {
    debugger;
    var item = {
        ID_BLOCKCHAIN: idBlock
    };
    //var url = baseUrl + "Gestion/DescargarBlockChain";
    var url = baseUrl + "Gestion/DescargarBlockChain_2?IdBlockchain=" + idBlock;
    //var respuesta = MRV.Ajax(url, item, false);

    //if (respuesta.success) {
    //    var urlMostrar = baseUrl + "Temp/" + respuesta.extra;
    //    window.open(urlMostrar, "_blank");
    //    $("#block-" + idBlock).data("block", 1);
    //}


    $.ajax({
        type: "POST",
        url: url,
        //contentType: "application/json; charset=utf-8",
        dataType: "json",
        async: false,
        data: JSON.stringify(item),
        success: function (response) {
            var urlMostrar = baseUrl + "Temp/" + response.extra;
            window.open(urlMostrar, "_blank");
            $("#block-" + idBlock).data("block", 1);
        },
        failure: function (msg) {
            console.log(msg);
        },
        error: function (xhr, status, error) {
            console.log(error);
            location.href = baseUrl + "Home/login";
        }
    });
}

//======================

function fn_visualizarFicha(id, p) {
    if ($("#ficha-" + id).data("ficha") == 1) {
        fn_mostrarFicha(id);
    } else {
        fn_descargarFicha(id, p);
    }
}

function fn_mostrarFicha(id) {
    var item = {
        ID_INICIATIVA: id
    };
    var url = baseUrl + "Gestion/MostrarFicha";
    var respuesta = MRV.Ajax(url, item, false);

    if (respuesta.success) {
        var urlMostrar = baseUrl + "Temp/" + respuesta.extra;
        window.open(urlMostrar, "_blank");
    }
}

function fn_descargarFicha(id, p) {
    var item = {
        ID_INICIATIVA: id,
        ID_PLAZO_ETAPA_ESTADO: p
    };
    var url = baseUrl + "Gestion/DescargarFicha";
    var respuesta = MRV.Ajax(url, item, false);

    if (respuesta.success) {
        var urlMostrar = baseUrl + "Temp/" + respuesta.extra;
        window.open(urlMostrar, "_blank");
        $("#ficha-" + id).data("ficha", 1);
    }
}

//========================================================

function enviarIniciativa(id) {
    location.href = baseUrl + "Gestion/IniciativaMitigacion/" + id + "/" + 0;
}

//======================

function fn_visualizarFichaPublica(id, p) {
    if ($("#ficha-" + id).data("ficha") == 1) {
        fn_mostrarFichaPublica(id);
    } else {
        fn_descargarFichaPublica(id, p);
    }
}

function fn_mostrarFichaPublica(id) {
    var item = {
        ID_INICIATIVA: id
    };
    var url = baseUrl + "Portal/MostrarFicha";
    var respuesta = MRV.Ajax(url, item, false);

    if (respuesta.success) {
        var urlMostrar = baseUrl + "Temp/" + respuesta.extra;
        window.open(urlMostrar, "_blank");
    }
}

function fn_descargarFichaPublica(id, p) {
    var item = {
        ID_INICIATIVA: id,
        ID_PLAZO_ETAPA_ESTADO: p
    };
    var url = baseUrl + "Portal/DescargarFicha";
    var respuesta = MRV.Ajax(url, item, false);

    if (respuesta.success) {
        var urlMostrar = baseUrl + "Temp/" + respuesta.extra;
        window.open(urlMostrar, "_blank");
        $("#ficha-" + id).data("ficha", 1);
    }
}

function mostrarObservacion(id) {

    var item = {
        ID_INICIATIVA: id
    };
    $.ajax({
        url: baseUrl + "Gestion/MostrarMensajeObservacion",
        //type: 'POST',
        //datatype: 'json',
        //data: item,

        type: "POST",
        //url: nurl,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        //async: false,
        data: JSON.stringify(item),

        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var color_r = "";
                        var color_u = "";
                        $("#usu-remitente").html("").html(data[i]["NOMBRES_REMITENTE"]);
                        $("#rol-remitente").html("").html(data[i]["ROL_REMITENTE"]);
                        $("#usu-destino").html("").html(data[i]["NOMBRES"]);
                        $("#rol-destino").html("").html(data[i]["ROL"]);
                        color_r = obtenerColor(data[i]["ID_ROL_REMITENTE"]);
                        color_u = obtenerColor(data[i]["ID_ROL"]);
                        $("#rol-remitente").removeClass("badge-actor-02 badge-actor-06 badge-actor-03 badge-actor-04 badge-actor-05").addClass("badge-actor-" + color_r);
                        $("#rol-destino").removeClass("badge-actor-02 badge-actor-06 badge-actor-03 badge-actor-04 badge-actor-05").addClass("badge-actor-" + color_u);
                        $("#fecha-observacion").html("").html(data[i]["FECHA"]);
                        $("#txa-observacion").val(data[i]["OBSERVACIONES"]);
                        $("#id-ini").data("value", id);
                    }
                    $('#modal-observaciones').modal('show');
                }
            } else {
                $('#modal-observaciones-none').modal('show');
            }
        },
        failure: function (msg) {
            console.log(msg);
        },
        error: function (xhr, status, error) {
            console.log(error);
            location.href = baseUrl + "Home/login";
        }
    });

}

function obtenerColor(rol) {
    var color = "";
    if (rol == 1) {
        color = "02";
    } else if (rol == 2) {
        color = "03";
    } else if (rol == 3) {
        color = "06";
    } else if (rol == 4) {
        color = "04";
    } else if (rol == 5) {
        color = "05";
    }
    return color;
}

function verObservSeguimiento() {
    var id = $("#id-ini").data("value");
    location.href = baseUrl + "Gestion/SeguimientoIniciativa/" + id + "/" + Math.round(Math.random() * 100);
}

//add 05-06-2020
function validarEstado() {

    if ($("#blk").data("blk") == 0) {
        $("#blk").data("blk", 1);
    } else {
        $("#blk").data("blk", 0);
        $("#txa-bloackchain").val("");
    }

}

function formatoMiles(n) { //add20
    return n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
}

var guardarIdIniciativa = (idiniciativa) => {
    idiniciativatemp = idiniciativa;
}

var eliminarIniciativa = () => {
    var item = { ID_INICIATIVA: idiniciativatemp };
    var url = baseUrl + "Gestion/EliminarIniciativa";
    var respuesta = MRV.Ajax(url, item, false);

    if (respuesta.success) {
        fn_CargaIniciativas();
        $('#modal-confirmacion').modal('hide');
    } else {
        alert("Ocurrió un problema, no se eliminó la acción de mitigación");
    }
}

