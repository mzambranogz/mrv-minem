﻿
$(document).ready(function () {

    CargarOpcionesCuerpo();
    if ($("#Control").data("usuario") > 0) {
        if ($("#Control").data("rol") != 1) {
            CargarListarIniciativaMitigacionUsuario(baseUrl + "Administrado/Gestion/ListaIniciativasGeneral");
        } else {
            CargarListarIniciativaMitigacionUsuario(baseUrl + "Administrado/Gestion/ListaIniciativasUsuario");
        }
    } else {
        CargarListarIniciativaMitigacionGeneral(baseUrl + "Publico/Portal/ListaIniciativasPublico");
    }
    MRV.CargarSelect(baseUrl + "Publico/Portal/ListaSectorInstitucion", "#mSector", "ID_SECTOR_INST", "DESCRIPCION");
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarMedidaMitigacion", "#medMitigacion", "ID_MAE_MEDMIT", "NOMBRE_MEDMIT");
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarMoneda", "#mMoneda", "ID_MONEDA", "DESCRIPCION");

});

function CargarOpcionesCuerpo() {
    if ($("#Control").data("opcion9") == 1) {
        $('#nuevaIniciativa').append('<span data-toggle="modal" data-target="#medidas-mitigacion-listado"><a class="agregar-iniciativa" href="#" data-toggle="tooltip" data-placement="top" title="Texto de ayuda que describe el funcionamiento general del módulo [...]"><i class="fas fa-plus px-1"></i>Agregar iniciativa</a></span>');
    }
}

function fn_nuevaIniciativaMitigacion(id) {

    $("#Control").data("mitigacion", id);
    MRV.ObtenerVista(baseUrl + 'Administrado/Gestion/NuevaIniciativaMitigacion');
    $('.fade').remove();
    $('body').removeClass('modal-open');
}

function CargarListarIniciativaMitigacionGeneral(vUrl) {
    var Item = {};
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
                        if (data[i]["PROGRESO"] == 1) {
                            progreso = '25%';
                        } else if (data[i]["PROGRESO"] == 2) {
                            progreso = '50%';
                        } else if (data[i]["PROGRESO"] == 3) {
                            progreso = '75%';
                        } else if (data[i]["PROGRESO"] == 4) {
                            progreso = '100%';
                        }

                        var tr = '<tr>';
                        tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + (1 + i) + '</th>';
                        tr = tr + '<td data-encabezado="Nombre de Iniciativa">' + data[i]["NOMBRE_INICIATIVA"] + '</td>';
                        tr = tr + '<td data-encabezado="Progreso">';
                        tr = tr + '         <div class="progress" style="height: 20px;">';
                        tr = tr + '                 <div class="progress-bar progress-bar-striped" role="progressbar" style="width: ' + progreso + ';" aria-valuenow="' + progreso.substring(0, progreso.length - 1) + '" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="Texto de ayuda que describe el funcionamiento general del módulo [...]">' + progreso + '</div>';
                        tr = tr + '</div></td>';
                        tr = tr + '<td>' + data[i]["FECHA"].toString() + '</td>';
                        tr = tr + '<td>' + data[i]["NOMBRE_MEDMIT"] + '</td>';
                        tr = tr + '<td>' + data[i]["NOMBRE_INSTITUCION"] + '</td>';
                        tr = tr + '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr = tr + '     <div class="btn-group">';
                        tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';
                        tr = tr + '             <a class="dropdown-item" href="./ver-mas-accion-de-mitigacion.html"><i class="fas fa-plus-circle"></i>&nbsp;Ver más</a>';
                        tr = tr + '             <a class="dropdown-item" href="./seguimiento-de-accion-de-mitigacion.html"><i class="fas fa-history"></i>&nbsp;Seguimiento</a>';
                        //tr = tr + '             <a class="dropdown-item" href="./edicion-de-iniciativa-de-mitigacion.html"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                        //tr = tr + '             <a class="dropdown-item text-primary" href="./revision-de-iniciativa-de-mitigacion.html"><i class="fas fa-check"></i>&nbsp;Revisar</a>';
                        //tr = tr + '             <a class="dropdown-item text-info" href="./evaluacion-de-accion-de-mitigacion.html"><i class="fas fa-clipboard-check"></i>&nbsp;Evaluar</a>';
                        //tr = tr + '             <a class="dropdown-item text-warning" href="./revision-de-accion-de-mitigacion.html"><i class="fas fa-tasks"></i>&nbsp;Evaluar</a>';
                        //tr = tr + '             <a class="dropdown-item text-warning" href="./revision-de-accion-de-mitigacion.html"><i class="fas fa-tasks"></i>&nbsp;Verificar</a>';                                              
                        tr = tr + '         </div>';
                        tr = tr + '     </div>';
                        tr = tr + '</td>';
                        tr = tr + '</tr>';
                        $("#cuerpoMitigacion").append(tr)
                    }
                }
            }
        }
    });
}

function CargarListarIniciativaMitigacionUsuario(vUrl) {
    var Item = {
        ID_USUARIO: $("#Control").data("usuario")
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
                        if (data[i]["PROGRESO"] == 1) {
                            progreso = '25%';
                        } else if (data[i]["PROGRESO"] == 2) {
                            progreso = '50%';
                        } else if (data[i]["PROGRESO"] == 3) {
                            progreso = '75%';
                        } else if (data[i]["PROGRESO"] == 4) {
                            progreso = '100%';
                        }

                        var tr = '<tr>';
                        tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + (1 + i) + '</th>';
                        tr = tr + '<td data-encabezado="Nombre de Iniciativa">' + data[i]["NOMBRE_INICIATIVA"] + '</td>';
                        tr = tr + '<td data-encabezado="Progreso">';
                        tr = tr + '         <div class="progress" style="height: 20px;">';
                        tr = tr + '                 <div class="progress-bar progress-bar-striped" role="progressbar" style="width: ' + progreso + ';" aria-valuenow="' + progreso.substring(0, progreso.length - 1) + '" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="Texto de ayuda que describe el funcionamiento general del módulo [...]">' + progreso + '</div>';
                        tr = tr + '</div></td>';
                        tr = tr + '<td>' + data[i]["FECHA"].toString() + '</td>';
                        tr = tr + '<td>' + data[i]["NOMBRE_MEDMIT"] + '</td>';
                        tr = tr + '<td>' + data[i]["NOMBRE_INSTITUCION"] + '</td>';
                        tr = tr + '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr = tr + '     <div class="btn-group">';
                        tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';
                        tr = tr + '             <a class="dropdown-item" href="./ver-mas-accion-de-mitigacion.html"><i class="fas fa-plus-circle"></i>&nbsp;Ver más</a>';
                        tr = tr + '             <a class="dropdown-item" href="./seguimiento-de-accion-de-mitigacion.html"><i class="fas fa-history"></i>&nbsp;Seguimiento</a>';
                        tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_mostrarEditarIniciativa(' + data[i]["ID_INICIATIVA"] + ');"><i class="fas fa-edit"></i>&nbsp;Editar</a>';
                        if ($('#Control').data('rol') == 2) {
                            tr = tr + '             <a class="dropdown-item text-primary" href="./revision-de-iniciativa-de-mitigacion.html"><i class="fas fa-check"></i>&nbsp;Revisar</a>';
                        }
                        if ($('#Control').data('rol') == 4) {
                            tr = tr + '             <a class="dropdown-item text-info" href="./evaluacion-de-accion-de-mitigacion.html"><i class="fas fa-clipboard-check"></i>&nbsp;Evaluar</a>';
                            tr = tr + '             <a class="dropdown-item text-warning" href="./revision-de-accion-de-mitigacion.html"><i class="fas fa-tasks"></i>&nbsp;Evaluar</a>';
                        }
                        if ($('#Control').data('rol') == 5) {
                            tr = tr + '             <a class="dropdown-item text-warning" href="./revision-de-accion-de-mitigacion.html"><i class="fas fa-tasks"></i>&nbsp;Verificar</a>';
                        }
                        tr = tr + '         </div>';
                        tr = tr + '     </div>';
                        tr = tr + '</td>';
                        tr = tr + '</tr>';
                        $("#cuerpoMitigacion").append(tr)
                    }
                }
            }
        }
    });
}