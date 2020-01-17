﻿$(document).ready(function () {
    $('html, body').animate({ scrollTop: scroll }, 1000);
    fn_CargarNotificacion();
});

function fn_CargarNotificacion() {
    var Item = {
        ID_ROL: $("#Control").data("rol")
    };

    $.ajax({
        url: baseUrl + "Gestion/ListarNotificacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#cuerpoNotificacion").html("");
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

                        if (data[i]["ID_ROL"] == 1) {
                            colorRol = 2;
                        } else if (data[i]["ID_ROL"] == 2) {
                            colorRol = 3;
                        } else if (data[i]["ID_ROL"] == 3) {
                            colorRol = 6;
                        } else if (data[i]["ID_ROL"] == 4) {
                            colorRol = 4;
                        } else if (data[i]["ID_ROL"] == 5) {
                            colorRol = 5;
                        }

                        var  tr = '<tr>';
                        tr = tr + '     <th class="text-center" data-encabezado="Número" scope="row">'+data[i]["ID_NOTIFICACION"]+'</th>';
                        tr = tr + '     <td data-encabezado="Nombre de Iniciativa">'+data[i]["NOMBRE_INICIATIVA"]+'</td>';
                        tr = tr + '     <td data-encabezado="Progreso">';
                        tr = tr + '         <div class="progress" style="height: 20px;">';
                        tr = tr + '              <div class="progress-bar progress-bar-striped" role="progressbar" style="width: ' + progreso + ';" aria-valuenow="' + progreso.substring(0, progreso.length - 1) + '" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="Texto de ayuda que describe el funcionamiento general del módulo [...]">' + progreso + '</div>';
                        tr = tr + '         </div>';
                        tr = tr + '     </td>';
                        tr = tr + '     <td data-encabezado="Fecha de Inicio">' + data[i]["FECHA"].toString() + '</td>';
                        tr = tr + '     <td data-encabezado="Medida de Mitigación">' + data[i]["RESPONSABLE"] + '</td>';
                        tr = tr + '     <span class="badge badge-actor-0">' + data[i]["ROL"] + '</span>';
                        tr = tr + '     <td data-encabezado="Entidad"><span class="badge badge-actor-0' + colorRol + '">'+data[i]["ROL"]+'</span></td>';
                        tr = tr + '     <td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr = tr + '         <div class="btn-group">';
                        tr = tr + '             <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr = tr + '             <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="#" onclick="fn_modalNotificacion('+data[i]["ID_ESTADO_NOTIFICACION"]+','+data[i]["DESCRIPCION"]+')" data-toggle="modal" data-target="#modal-ver-mas"><i class="fas fa-plus-circle"></i>&nbsp;Ver más</a></div>';
                        tr = tr + '         </div>';
                        tr = tr + '     </td>';
                        tr = tr + '</tr>';
                        $("#cuerpoNotificacion").append(tr);
                    }
                }
            }
        }
    });
}

function fn_modalNotificacion(estado, descripcion) {
    if (estado == 0) {
        $("modalCorrecto").hide();
        $("modalIncorrecto").hide();
        $("modalObservacion").hide();
    }else if(estado == 1){
        $("modalCorrecto").hide();
        $("modalIncorrecto").hide();
    }else if(estado == 2){
        $("modalCorrecto").hide();
        $("modalObservacion").hide();
    }else if(estado == 3){
        $("modalIncorrecto").hide();
        $("modalObservacion").hide();
    }
    $("modalDescripcion").val(descripcion);
}