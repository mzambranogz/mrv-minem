$(document).ready(function () {
    $("#Control").data("iniciativa", $("#identificador").val())
    fn_mostrarSeguimiento();
    fn_actualizaCampana();
    enLinea();
});

function fn_mostrarSeguimiento() {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    };
    $.ajax({
        url: baseUrl + "Gestion/MostrarSeguimiento",
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {

                    
                    $("#seguimiento").html("");
                    for (var i = 0; i < data.length; i++) {

                        var tr = '';
                    if (data[i]["ID_ETAPA"] == 1 && data[i]["ID_ESTADO"] == 0){
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-save"></i></div><span class="year">' + data[i]["FECHA"].toString()+'</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN SIN ENVIAR <br><small class="text-muted">INICIATIVA DE MITIGACIÓN</small></h5>';
                        tr = tr + '<p class="description"><span>'+data[i]["EMAIL_USUARIO"]+'<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 1 && data[i]["ID_ESTADO"] == 1) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-paper-plane"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN ENVIADA <br><small class="text-muted">INICIATIVA DE MITIGACIÓN</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div';
                        //$("#seguimiento").append(tr);
                    }
                    
                    if (data[i]["ID_ETAPA"] == 1 && data[i]["ID_ESTADO"] == 7) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-search"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN VISTA <br><small class="text-muted">INICIATIVA DE MITIGACIÓN</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-03">Especialista</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 1 && data[i]["ID_ESTADO"] == 2) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-eye"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN OBSERVADA <br><small class="text-muted">INICIATIVA DE MITIGACIÓN</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-03">Especialista</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 1 && data[i]["ID_ESTADO"] == 6) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-save"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN OBSERVADA SUBSANADA SIN ENVIAR <br><small class="text-muted">INICIATIVA DE MITIGACIÓN</small></h5>';
                        tr = tr + '<p class="description"><span>' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }
            
                    if (data[i]["ID_ETAPA"] == 1 && data[i]["ID_ESTADO"] == 5) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-clock"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN OBSERVADA SUBSANADA ENVIADA<br><small class="text-muted">INICIATIVA DE MITIGACIÓN</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 2 && data[i]["ID_ESTADO"] == 3) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-check"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN APROBADA <br><small class="text-muted">INICIATIVA DE MITIGACIÓN</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-03">Especialista</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }
                    

                    if (data[i]["ID_ETAPA"] == 3 && data[i]["ID_ESTADO"] == 0) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-save"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN SIN ENVIAR <br><small class="text-muted">DETALLE DE INDICADORES</small></h5>';
                        tr = tr + '<p class="description"><span>' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 3 && data[i]["ID_ESTADO"] == 1) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-paper-plane"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN ENVIADA <br><small class="text-muted">DETALLE DE INDICADORES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 3 && data[i]["ID_ESTADO"] == 7) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-search"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN VISTA <br><small class="text-muted">DETALLE DE INDICADORES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-03">Especialista</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    } 
                    

                    if (data[i]["ID_ETAPA"] == 3 && data[i]["ID_ESTADO"] == 2) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-eye"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN OBSERVADA <br><small class="text-muted">DETALLE DE INDICADORES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-03">Especialista</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 3 && data[i]["ID_ESTADO"] == 6) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-save"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN OBSERVADA SUBSANADA SIN ENVIAR <br><small class="text-muted">DETALLE DE INDICADORES</small></h5>';
                        tr = tr + '<p class="description"><span>' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }
                    
                    if (data[i]["ID_ETAPA"] == 3 && data[i]["ID_ESTADO"] == 5) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-clock"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN OBSERVADA SUBSANADA ENVIADA<br><small class="text-muted">DETALLE DE INDICADORES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 4 && data[i]["ID_ESTADO"] == 3) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-check-double"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN APROBADA <br><small class="text-muted">DETALLE DE INDICADORES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-03">Especialista</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 4 && data[i]["ID_ESTADO"] == 2) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-eye"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN OBSERVADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span></span><span class="badge badge-actor-06">Administrador MINEM</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 4 && data[i]["ID_ESTADO"] == 5) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-clock"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN OBSERVADA SUBSANADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if ((data[i]["ID_ETAPA"] == 5 || data[i]["ID_ETAPA"] == 8) && data[i]["ID_ESTADO"] == 3) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-check-double"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN APROBADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-06">Administrador MINEM</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 5 && data[i]["ID_ESTADO"] == 2) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-eye"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">EVALUACIÓN OBSERVADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-04">Evaluador MINAM</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }
                    
                    if (data[i]["ID_ETAPA"] == 5 && data[i]["ID_ESTADO"] == 5) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-clock"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">EVALUACIÓN OBSERVADA SUBSANADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-03">Especialista</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 6 && data[i]["ID_ESTADO"] == 3) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-check-circle"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">EVALUACIÓN APROBADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-04">Evaluador MINAM</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if ((data[i]["ID_ETAPA"] == 6 || data[i]["ID_ETAPA"] == 8) && data[i]["ID_ESTADO"] == 2) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-eye"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">VERIFICACIÓN OBSERVADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-05">Verificador externo</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }
                    
                    if (data[i]["ID_ETAPA"] == 6 && data[i]["ID_ESTADO"] == 5) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-clock"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">VERIFICACIÓN OBSERVADA SUBSANADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-04">Evaluador MINAM</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 7 && data[i]["ID_ESTADO"] == 3) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-flag-checkered"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">VERIFICACIÓN APROBADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                        tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-05">Verificador externo</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';                        
                    }
                    $("#seguimiento").append(tr);
                    }
                    //$("#seguimiento").append(tr);
                    var t = $(".timeline").length; //console.log(t);
                    if (t % 2 == 0 && t > 2) { //console.log("entro 2");
                        $(".timeline:last-child").attr('style', 'margin-top: 0px !important');
                    } else if (t == 2) { //console.log("entro 3");
                        $(".timeline:last-child").attr('style', 'margin-top: 140px !important');
                    } else if (t == 1) {
                        $(".timeline:last-child").attr('style', 'margin-top: 0px !important');
                    }
                }
            }
        }
    });
}