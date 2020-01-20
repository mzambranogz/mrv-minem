$(document).ready(function () {
    $('html, body').animate({ scrollTop: scroll }, 1000);
    fn_CargarNotificacion();

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

        fn_CargarNotificacion();
    });

    fn_actualizaCampana();
    enLinea();

});

function fn_CargarNotificacion() {
    var Item = {
        ID_ROL: $("#Control").data("rol"),
        cantidad_registros: $("#cantidad-registros").val(),
        pagina: $("#pagina").val(),
        order_by: $("#columna").val(),
        order_orden: $("#orden").val()
    };

    $.ajax({
        url: baseUrl + "Gestion/ListarNotificacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            //debugger;
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#cuerpoNotificacion").html("");
                    var resultado = "";
                    var inicio = 0;
                    var fin = 0;
                    var total_registros = 0;
                    var pagina = 0;
                    var total_paginas = 0;

                    for (var i = 0; i < data.length; i++) {

                        var progreso = '0%;';
                        var colorRol = 0;
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
                        //debugger;
                        var tr = '<tr>';
                        //tr = tr + '     <th class="text-center" data-encabezado="Número" scope="row">' + data[i]["ID_NOTIFICACION"] + '</th>';
                        tr = tr + '     <th class="text-center" data-encabezado="Número" scope="row">' + data[i]["RowNumber"] + '</th>';
                        tr = tr + '     <td data-encabezado="Nombre de Iniciativa">' + data[i]["NOMBRE_INICIATIVA"] + '</td>';
                        tr = tr + '     <td data-encabezado="Progreso">';
                        tr = tr + '         <div class="progress" style="height: 20px;">';
                        tr = tr + '              <div class="progress-bar progress-bar-striped" role="progressbar" style="width: ' + progreso + ';" aria-valuenow="' + progreso.substring(0, progreso.length - 1) + '" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="Texto de ayuda que describe el funcionamiento general del módulo [...]">' + progreso + '</div>';
                        tr = tr + '         </div>';
                        tr = tr + '     </td>';
                        tr = tr + '     <td data-encabezado="Fecha de Inicio">' + data[i]["FECHA"].toString() + '</td>';
                        tr = tr + '     <td data-encabezado="Medida de Mitigación">' + data[i]["RESPONSABLE"] + '</td>';
                        tr = tr + '     <span class="badge badge-actor-0">' + data[i]["ROL"] + '</span>';
                        tr = tr + '     <td data-encabezado="Entidad"><span class="badge badge-actor-0' + colorRol + '">' + data[i]["ROL"] + '</span></td>';
                        tr = tr + '     <td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr = tr + '         <div class="btn-group">';
                        tr = tr + '             <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr = tr + '             <div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item mas-notifacion" href="javascript:void(0)" onclick="fn_modalNotificacion(' + data[i]["ID_NOTIFICACION"] + ',' + data[i]["ID_ESTADO_NOTIFICACION"] + ')"><i class="fas fa-plus-circle"></i>&nbsp;Ver más</a></div>';
                        tr = tr + '         </div>';
                        tr = tr + '     </td>';
                        tr = tr + '</tr>';
                        $("#cuerpoNotificacion").append(tr);

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
    fn_CargarNotificacion();
}

function fn_registros_grilla() {
    fn_CargarNotificacion();
}

//function fn_orden_grilla(columna) {
//    if (columna == 1) {
//        if ($("#columna").val() == "NOMBRE_INICIATIVA") {
//            if ($("#orden").val() == "ASC")
//                $("#orden").val("DESC")
//            else
//                $("#orden").val("ASC")
//        }
//        else {
//            $("#columna").val("NOMBRE_INICIATIVA");
//            $("#orden").val("ASC")
//        }
//    }
//    if (columna == 2) {
//        if ($("#columna").val() == "PROGRESO") {
//            if ($("#orden").val() == "ASC")
//                $("#orden").val("DESC")
//            else
//                $("#orden").val("ASC")
//        }
//        else {
//            $("#columna").val("PROGRESO");
//            $("#orden").val("ASC")
//        }
//    }
//    if (columna == 3) {
//        if ($("#columna").val() == "FECHA_REGISTRO") {
//            if ($("#orden").val() == "ASC")
//                $("#orden").val("DESC")
//            else
//                $("#orden").val("ASC")
//        }
//        else {
//            $("#columna").val("FECHA_REGISTRO");
//            $("#orden").val("ASC")
//        }
//    }
//    if (columna == 4) {
//        if ($("#columna").val() == "RESPONSABLE") {
//            if ($("#orden").val() == "ASC")
//                $("#orden").val("DESC")
//            else
//                $("#orden").val("ASC")
//        }
//        else {
//            $("#columna").val("RESPONSABLE");
//            $("#orden").val("ASC")
//        }
//    }
//    if (columna == 5) {
//        if ($("#columna").val() == "ROL") {
//            if ($("#orden").val() == "ASC")
//                $("#orden").val("DESC")
//            else
//                $("#orden").val("ASC")
//        }
//        else {
//            $("#columna").val("ROL");
//            $("#orden").val("ASC")
//        }
//    }  onclick="fn_orden_grilla(3)"

//    fn_CargarNotificacion();
//}

function fn_modalNotificacion(idNotificacion, idEstado) {
    debugger;
    //if (estado == 0) {
    //    $("modalCorrecto").hide();
    //    $("modalIncorrecto").hide();
    //    $("modalObservacion").hide();
    //} else if (estado == 1) {
    //    $("modalCorrecto").hide();
    //    $("modalIncorrecto").hide();
    //} else if (estado == 2) {
    //    $("modalCorrecto").hide();
    //    $("modalObservacion").hide();
    //} else if (estado == 3) {
    //    $("modalIncorrecto").hide();
    //    $("modalObservacion").hide();
    //}
    //$("modalDescripcion").val(descripcion);
    var url = baseUrl + "Gestion/DetalleNotificacion?ID_NOTIFICACION=" + idNotificacion;
    $('#modal-ver-mas').load(url, function () {
        $('#modal-ver-mas').modal({ show: true });
    });

}


function fn_ir_iniciativa() {

}