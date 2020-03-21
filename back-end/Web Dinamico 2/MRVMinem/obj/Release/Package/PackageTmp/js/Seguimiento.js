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
                        if (data[i]["ID_ETAPA"] == 1 && data[i]["ID_ESTADO"] == 0) {
                            var cad = data[i]["OBSERVACIONES"];
                            if (cad != null) {
                                var arr = cad.split('|');
                                tr = tr + '<div class="timeline">';
                                tr = tr + '<div class="timeline-icon"><i class="fas fa-save"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                                tr = tr + '<div class="timeline-content">';
                                tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN SIN ENVIAR <br><small class="text-muted">INICIATIVA DE MITIGACIÓN</small></h5>';
                                tr = tr + '<div>';
                                tr = tr + '<span><strong>MEDIDA MITIGACIÓN</strong><br>' + arr[1] + '<br></span>';
                                tr = tr + '<span><strong>NOMBRE DE PROYECTO</strong><br>' + arr[0] + '<br></span>';
                                tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                                tr = tr + '</div>';
                                tr = tr + '<p class="description"></span><span class="badge badge-actor-02">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                                //tr = tr + '<p class="description"><span>'+data[i]["EMAIL_USUARIO"]+'<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                                tr = tr + '</div>';
                                tr = tr + '</div>';
                                //$("#seguimiento").append(tr);
                            }                            
                        }

                    if (data[i]["ID_ETAPA"] == 1 && data[i]["ID_ESTADO"] == 1) {
                        var cad = data[i]["OBSERVACIONES"];
                        if (cad != null) {
                            var arr = cad.split('|');
                            tr = tr + '<div class="timeline">';
                            tr = tr + '<div class="timeline-icon"><i class="fas fa-paper-plane"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                            tr = tr + '<div class="timeline-content">';
                            tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN ENVIADA <br><small class="text-muted">INICIATIVA DE MITIGACIÓN</small></h5>';
                            tr = tr + '<div>';
                            tr = tr + '<span><strong>MEDIDA MITIGACIÓN</strong><br>' + arr[1] + '<br></span>';
                            tr = tr + '<span><strong>NOMBRE DE PROYECTO</strong><br>' + arr[0] + '<br></span>';
                            tr = tr + '<span><strong>INICIO DE OPERACIONES</strong><br>' + arr[2] + '<br></span>';
                            tr = tr + '<span><strong>MONEDA</strong><br>' + arr[3] + '<br></span>';
                            tr = tr + '<span><strong>MONTO INVERSIÓN</strong><br>' + formatoMiles(arr[4]) + '<br></span>';
                            tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                            tr = tr + '</div>';
                            tr = tr + '<p class="description"></span><span class="badge badge-actor-02">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            tr = tr + '</div>';
                            tr = tr + '</div';
                            //$("#seguimiento").append(tr);
                        } 
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
                        tr = tr + '<div>';
                        tr = tr + '<span><strong>OBSERVACIÓN</strong><br>' + data[i]["OBSERVACIONES"] + '<br></span>';
                        tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                        tr = tr + '</div>';
                        tr = tr + '<p class="description"></span><span class="badge badge-actor-03">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                        //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-03">Especialista</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 1 && data[i]["ID_ESTADO"] == 6) {
                        var cad = data[i]["OBSERVACIONES"];
                        if (cad != null) {
                            var arr = cad.split('|');
                            tr = tr + '<div class="timeline">';
                            tr = tr + '<div class="timeline-icon"><i class="fas fa-save"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                            tr = tr + '<div class="timeline-content">';
                            tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN OBSERVADA SUBSANADA SIN ENVIAR <br><small class="text-muted">INICIATIVA DE MITIGACIÓN</small></h5>';
                            tr = tr + '<div>';
                            tr = tr + '<span><strong>MEDIDA MITIGACIÓN</strong><br>' + arr[1] + '<br></span>';
                            tr = tr + '<span><strong>NOMBRE DE PROYECTO</strong><br>' + arr[0] + '<br></span>';
                            tr = tr + '<span><strong>INICIO DE OPERACIONES</strong><br>' + arr[2] + '<br></span>';
                            tr = tr + '<span><strong>MONEDA</strong><br>' + arr[3] + '<br></span>';
                            tr = tr + '<span><strong>MONTO INVERSIÓN</strong><br>' + formatoMiles(arr[4]) + '<br></span>';
                            tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                            tr = tr + '</div>';
                            tr = tr + '<p class="description"></span><span class="badge badge-actor-02">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            //tr = tr + '<p class="description"><span>' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                            tr = tr + '</div>';
                            tr = tr + '</div>';
                            //$("#seguimiento").append(tr);
                        }                        
                    }
            
                    if (data[i]["ID_ETAPA"] == 1 && data[i]["ID_ESTADO"] == 5) {
                        var cad = data[i]["OBSERVACIONES"];
                        var arr = cad.split('|');
                        if (cad != null) {
                            tr = tr + '<div class="timeline">';
                            tr = tr + '<div class="timeline-icon"><i class="fas fa-clock"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                            tr = tr + '<div class="timeline-content">';
                            tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN OBSERVADA SUBSANADA ENVIADA<br><small class="text-muted">INICIATIVA DE MITIGACIÓN</small></h5>';
                            tr = tr + '<div>';
                            tr = tr + '<span><strong>MEDIDA MITIGACIÓN</strong><br>' + arr[1] + '<br></span>';
                            tr = tr + '<span><strong>NOMBRE DE PROYECTO</strong><br>' + arr[0] + '<br></span>';
                            tr = tr + '<span><strong>INICIO DE OPERACIONES</strong><br>' + arr[2] + '<br></span>';
                            tr = tr + '<span><strong>MONEDA</strong><br>' + arr[3] + '<br></span>';
                            tr = tr + '<span><strong>MONTO INVERSIÓN</strong><br>' + formatoMiles(arr[4]) + '<br></span>';
                            tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                            tr = tr + '</div>';
                            tr = tr + '<p class="description"></span><span class="badge badge-actor-02">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                            tr = tr + '</div>';
                            tr = tr + '</div>';
                            //$("#seguimiento").append(tr);
                        }                        
                    }

                    if (data[i]["ID_ETAPA"] == 2 && data[i]["ID_ESTADO"] == 3) {
                        var cad = data[i]["OBSERVACIONES"];
                        if (cad != null) {
                            var arr = cad.split('|');
                            tr = tr + '<div class="timeline">';
                            tr = tr + '<div class="timeline-icon"><i class="fas fa-check"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                            tr = tr + '<div class="timeline-content">';
                            tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN APROBADA <br><small class="text-muted">INICIATIVA DE MITIGACIÓN</small></h5>';
                            tr = tr + '<div>';
                            if (arr[0].trim() != "") {
                                tr = tr + '<span><strong>ENERGÉTICO</strong><br>' + arr[0] + '<br></span>';
                            }
                            if (arr[1].trim() != "") {
                                tr = tr + '<span><strong>GEI</strong><br>' + arr[1] + '<br></span>';
                            }
                            tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                            tr = tr + '</div>';
                            tr = tr + '<p class="description"></span><span class="badge badge-actor-03">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-03">Especialista</span></p>';
                            tr = tr + '</div>';
                            tr = tr + '</div>';
                            //$("#seguimiento").append(tr);
                        }                        
                    }
                    

                    if (data[i]["ID_ETAPA"] == 3 && data[i]["ID_ESTADO"] == 0) {
                        var cad = data[i]["OBSERVACIONES"];
                        if (cad != null){
                            var arr = cad.split('|');
                            tr = tr + '<div class="timeline">';
                            tr = tr + '<div class="timeline-icon"><i class="fas fa-save"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                            tr = tr + '<div class="timeline-content">';
                            tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN SIN ENVIAR <br><small class="text-muted">DETALLE DE INDICADORES</small></h5>';
                            tr = tr + '<div>';
                            tr = tr + '<span><strong>MEDIDA MITIGACIÓN</strong><br>' + arr[0] + '<br></span>';
                            tr = tr + '<span><strong>ENFOQUE</strong><br>' + arr[1] + '<br></span>';
                            tr = tr + '<span><strong>ARCHIVOS</strong><br>' + arr[2] + ' Documento(s) asociado(s)<br></span>';
                            tr = tr + '<span><strong>TOTAL GEI</strong><br>' + arr[3] + ' tCO<sub>2</sub>eq<br></span>';
                            tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                            tr = tr + '</div>';
                            tr = tr + '<p class="description"></span><span class="badge badge-actor-02">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            //tr = tr + '<p class="description"><span>' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                            tr = tr + '</div>';
                            tr = tr + '</div>';
                            //$("#seguimiento").append(tr);
                        }                        
                    }

                    if (data[i]["ID_ETAPA"] == 3 && data[i]["ID_ESTADO"] == 1) {
                        var cad = data[i]["OBSERVACIONES"];
                        if (cad != null){
                            var arr = cad.split('|');
                            tr = tr + '<div class="timeline">';
                            tr = tr + '<div class="timeline-icon"><i class="fas fa-paper-plane"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                            tr = tr + '<div class="timeline-content">';
                            tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN ENVIADA <br><small class="text-muted">DETALLE DE INDICADORES</small></h5>';
                            tr = tr + '<div>';
                            tr = tr + '<span><strong>MEDIDA MITIGACIÓN</strong><br>' + arr[0] + '<br></span>';
                            tr = tr + '<span><strong>ENFOQUE</strong><br>' + arr[1] + '<br></span>';
                            tr = tr + '<span><strong>ARCHIVOS</strong><br>' + arr[2] + ' Documento(s) asociado(s)<br></span>';
                            tr = tr + '<span><strong>TOTAL GEI</strong><br>' + arr[3] + ' tCO<sub>2</sub>eq<br></span>';
                            tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                            tr = tr + '</div>';
                            tr = tr + '<p class="description"></span><span class="badge badge-actor-02">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                            tr = tr + '</div>';
                            tr = tr + '</div>';
                            //$("#seguimiento").append(tr);
                        }                        
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
                        tr = tr + '<div>';
                        tr = tr + '<span><strong>OBSERVACIÓN</strong><br>' + data[i]["OBSERVACIONES"] + '<br></span>';
                        tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                        tr = tr + '</div>';
                        tr = tr + '<p class="description"></span><span class="badge badge-actor-03">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                        //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-03">Especialista</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
                    }

                    if (data[i]["ID_ETAPA"] == 3 && data[i]["ID_ESTADO"] == 6) {
                        var cad = data[i]["OBSERVACIONES"];
                        if (cad != null){
                            var arr = cad.split('|');
                            tr = tr + '<div class="timeline">';
                            tr = tr + '<div class="timeline-icon"><i class="fas fa-save"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                            tr = tr + '<div class="timeline-content">';
                            tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN OBSERVADA SUBSANADA SIN ENVIAR <br><small class="text-muted">DETALLE DE INDICADORES</small></h5>';
                            tr = tr + '<div>';
                            tr = tr + '<span><strong>MEDIDA MITIGACIÓN</strong><br>' + arr[0] + '<br></span>';
                            tr = tr + '<span><strong>ENFOQUE</strong><br>' + arr[1] + '<br></span>';
                            tr = tr + '<span><strong>ARCHIVOS</strong><br>' + arr[2] + ' Documento(s) asociado(s)<br></span>';
                            tr = tr + '<span><strong>TOTAL GEI</strong><br>' + arr[3] + ' tCO<sub>2</sub>eq<br></span>';
                            tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                            tr = tr + '</div>';
                            tr = tr + '<p class="description"></span><span class="badge badge-actor-02">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            //tr = tr + '<p class="description"><span>' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                            tr = tr + '</div>';
                            tr = tr + '</div>';
                            //$("#seguimiento").append(tr);
                        }                        
                    }
                    
                    if (data[i]["ID_ETAPA"] == 3 && data[i]["ID_ESTADO"] == 5) {
                        var cad = data[i]["OBSERVACIONES"];
                        if (cad != null){
                            var arr = cad.split('|');
                            tr = tr + '<div class="timeline">';
                            tr = tr + '<div class="timeline-icon"><i class="fas fa-clock"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                            tr = tr + '<div class="timeline-content">';
                            tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN OBSERVADA SUBSANADA ENVIADA<br><small class="text-muted">DETALLE DE INDICADORES</small></h5>';
                            tr = tr + '<div>';
                            tr = tr + '<span><strong>MEDIDA MITIGACIÓN</strong><br>' + arr[0] + '<br></span>';
                            tr = tr + '<span><strong>ENFOQUE</strong><br>' + arr[1] + '<br></span>';
                            tr = tr + '<span><strong>ARCHIVOS</strong><br>' + arr[2] + ' Documento(s) asociado(s)<br></span>';
                            tr = tr + '<span><strong>TOTAL GEI</strong><br>' + arr[3] + ' tCO<sub>2</sub>eq<br></span>';
                            tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                            tr = tr + '</div>';
                            tr = tr + '<p class="description"></span><span class="badge badge-actor-02">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-02">Administrado</span></p>';
                            tr = tr + '</div>';
                            tr = tr + '</div>';
                            //$("#seguimiento").append(tr);
                        }                        
                    }

                    if (data[i]["ID_ETAPA"] == 4 && data[i]["ID_ESTADO"] == 3) {
                        var cad = data[i]["OBSERVACIONES"];
                        if (cad != null) {
                            var arr = cad.split('|');
                            tr = tr + '<div class="timeline">';
                            tr = tr + '<div class="timeline-icon"><i class="fas fa-check-double"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                            tr = tr + '<div class="timeline-content">';
                            tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN APROBADA <br><small class="text-muted">DETALLE DE INDICADORES</small></h5>';
                            tr = tr + '<div>';
                            if (arr[0].trim() != "") {
                                tr = tr + '<span><strong>ENERGÉTICO</strong><br>' + arr[0] + '<br></span>';
                            }
                            if (arr[1].trim() != "") {
                                tr = tr + '<span><strong>GEI</strong><br>' + arr[1] + '<br></span>';
                            }
                            tr = tr + '<span><strong>TOTAL GEI</strong><br>' + arr[2] + ' tCO<sub>2</sub>eq<br></span>';
                            tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                            tr = tr + '</div>';
                            tr = tr + '<p class="description"></span><span class="badge badge-actor-03">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-03">Especialista</span></p>';
                            tr = tr + '</div>';
                            tr = tr + '</div>';
                            //$("#seguimiento").append(tr);
                        }                        
                    }

                    if (data[i]["ID_ETAPA"] == 4 && data[i]["ID_ESTADO"] == 2) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-eye"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN OBSERVADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                        tr = tr + '<div>';
                        tr = tr + '<span><strong>OBSERVACIÓN</strong><br>' + data[i]["OBSERVACIONES"] + '<br></span>';
                        tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                        tr = tr + '</div>';
                        tr = tr + '<p class="description"></span><span class="badge badge-actor-06">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                        //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span></span><span class="badge badge-actor-06">Administrador MINEM</span></p>';
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

                    //if ((data[i]["ID_ETAPA"] == 5 || data[i]["ID_ETAPA"] == 8) && data[i]["ID_ESTADO"] == 3) {
                    if (data[i]["ID_ETAPA"] == 5 && data[i]["ID_ESTADO"] == 3) {
                        var cad = data[i]["OBSERVACIONES"];
                        if (cad != null){
                            var arr = cad.split('|');
                            tr = tr + '<div class="timeline">';
                            tr = tr + '<div class="timeline-icon"><i class="fas fa-check-double"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                            tr = tr + '<div class="timeline-content">';
                            tr = tr + '<h5 class="title">SOLICITUD DE REVISIÓN APROBADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                            tr = tr + '<div>';
                            if (arr[0].trim() != "") {
                                tr = tr + '<span><strong>ENERGÉTICO</strong><br>' + arr[0] + '<br></span>';
                            }
                            if (arr[1].trim() != "") {
                                tr = tr + '<span><strong>GEI</strong><br>' + arr[1] + '<br></span>';
                            }
                            tr = tr + '<span><strong>TOTAL GEI</strong><br>' + arr[2] + ' tCO<sub>2</sub>eq<br></span>';
                            tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                            tr = tr + '</div>';
                            tr = tr + '<p class="description"></span><span class="badge badge-actor-06">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-06">Administrador MINEM</span></p>';
                            tr = tr + '</div>';
                            tr = tr + '</div>';
                            //$("#seguimiento").append(tr);
                        }                        
                    }

                    if (data[i]["ID_ETAPA"] == 5 && data[i]["ID_ESTADO"] == 2) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-eye"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">EVALUACIÓN OBSERVADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                        tr = tr + '<div>';
                        tr = tr + '<span><strong>OBSERVACIÓN</strong><br>' + data[i]["OBSERVACIONES"] + '<br></span>';
                        tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                        tr = tr + '</div>';
                        tr = tr + '<p class="description"></span><span class="badge badge-actor-04">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                        //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-04">Evaluador MINAM</span></p>';
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
                        var cad = data[i]["OBSERVACIONES"];
                        if (cad != null) {
                            var arr = cad.split('|');
                            var blk1 = arr[4].substring(0, 50);
                            var blk2 = arr[4].substring(50, arr[4].length);                            
                            tr = tr + '<div class="timeline">';
                            tr = tr + '<div class="timeline-icon"><i class="fas fa-flag-checkered"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                            tr = tr + '<div class="timeline-content">';
                            tr = tr + '<h5 class="title">EVALUACIÓN APROBADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                            tr = tr + '<div>';
                            tr = tr + '<span><strong>MEDIDA MITIGACIÓN</strong><br>' + arr[0] + '<br></span>';
                            tr = tr + '<span><strong>NOMBRE PROYECTO</strong><br>' + arr[1] + '<br></span>';
                            tr = tr + '<span><strong>TOTAL GEI</strong><br>' + arr[2] + ' tCO<sub>2</sub>eq<br></span>';                            
                            tr = tr + '<span><strong>BLOCKCHAIN</strong><br>' + blk1 + '<br>' + blk2 + '<br></span>';
                            tr = tr + '<span><strong>GENERADO POR</strong><br>' + arr[3] + ' <br></span>';
                            tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                            tr = tr + '</div>';
                            tr = tr + '<p class="description"></span><span class="badge badge-actor-04">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-04">Evaluador MINAM</span></p>';
                            tr = tr + '</div>';
                            tr = tr + '</div>';
                            //$("#seguimiento").append(tr);
                        }                        
                    }

                    //if ((data[i]["ID_ETAPA"] == 6 || data[i]["ID_ETAPA"] == 8) && data[i]["ID_ESTADO"] == 2) {
                    if (data[i]["ID_ETAPA"] == 8 && data[i]["ID_ESTADO"] == 2) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-eye"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">VERIFICACIÓN OBSERVADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                        tr = tr + '<div>';
                        tr = tr + '<span><strong>OBSERVACIÓN</strong><br>' + data[i]["OBSERVACIONES"] + '<br></span>';
                        tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                        tr = tr + '</div>';
                        tr = tr + '<p class="description"></span><span class="badge badge-actor-05">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                        //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-05">Verificador externo</span></p>';
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
                        var cad = data[i]["OBSERVACIONES"];
                        if (cad != null) {
                            var arr = cad.split('|');
                            var blk1 = arr[4].substring(0, 50);
                            var blk2 = arr[4].substring(50, arr[4].length);
                            tr = tr + '<div class="timeline">';
                            tr = tr + '<div class="timeline-icon"><i class="fas fa-flag-checkered"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                            tr = tr + '<div class="timeline-content">';
                            tr = tr + '<h5 class="title">VERIFICACIÓN APROBADA <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                            tr = tr + '<div>';
                            tr = tr + '<span><strong>MEDIDA MITIGACIÓN</strong><br>' + arr[0] + '<br></span>';
                            tr = tr + '<span><strong>NOMBRE PROYECTO</strong><br>' + arr[1] + '<br></span>';
                            tr = tr + '<span><strong>TOTAL GEI</strong><br>' + arr[2] + ' tCO<sub>2</sub>eq<br></span>';
                            tr = tr + '<span><strong>BLOCKCHAIN</strong><br>' + blk1 + '<br>' + blk2 + '<br></span>';
                            tr = tr + '<span><strong>GENERADO POR</strong><br>' + arr[3] + ' <br></span>';
                            tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                            tr = tr + '</div>';
                            tr = tr + '<p class="description"></span><span class="badge badge-actor-05">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            ///tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-05">Verificador externo</span></p>';
                            tr = tr + '</div>';
                            tr = tr + '</div>';
                        }
                    }

                    if (data[i]["ID_ETAPA"] == 9 && data[i]["ID_ESTADO"] == 3) {
                        var cad = data[i]["OBSERVACIONES"];
                        if (cad != null) {
                            var arr = cad.split('|');
                            tr = tr + '<div class="timeline">';
                            tr = tr + '<div class="timeline-icon"><i class="fas fa-paper-plane"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                            tr = tr + '<div class="timeline-content">';
                            tr = tr + '<h5 class="title">ENVIADO PARA EVALUACIÓN <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                            tr = tr + '<div>';
                            tr = tr + '<span><strong>MEDIDA MITIGACIÓN</strong><br>' + arr[0] + '<br></span>';
                            tr = tr + '<span><strong>MEDIDA PERÍODO</strong><br>' + arr[1] + '<br></span>';
                            tr = tr + '<span><strong>TOTAL ENVIADAS</strong><br>' + arr[2] + ' INICIATIVAS DE MITIGACIÓN<br></span>';
                            tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                            tr = tr + '</div>';
                            tr = tr + '<p class="description"></span><span class="badge badge-actor-04">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                            //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-04">Evaluador MINAM</span></p>';
                            tr = tr + '</div>';
                            tr = tr + '</div>';
                            //$("#seguimiento").append(tr);
                        }
                    }

                    if (data[i]["ID_ETAPA"] == 10 && data[i]["ID_ESTADO"] == 3) {
                        tr = tr + '<div class="timeline">';
                        tr = tr + '<div class="timeline-icon"><i class="fas fa-paper-plane"></i></div><span class="year">' + data[i]["FECHA"].toString() + '</span>';
                        tr = tr + '<div class="timeline-content">';
                        tr = tr + '<h5 class="title">ENVIADO PARA VERIFICACIÓN <br><small class="text-muted">INICIATIVA / DETALLES</small></h5>';
                        tr = tr + '<div>';
                        if (parseInt(data[i]["OBSERVACIONES"]) == 1) {
                            tr = tr + '<span><strong>TOTAL ENVIADO</strong><br>' + data[i]["OBSERVACIONES"] + ' INICIATIVA DE  MITIGACIÓN<br></span>';
                        } else {
                            tr = tr + '<span><strong>TOTAL ENVIADOS</strong><br>' + data[i]["OBSERVACIONES"] + ' INICIATIVAS DE MITIGACIÓN<br></span>';
                        }
                        tr = tr + '<span><strong>CORREO ELECTRÓNICO</strong><br>' + data[i]["EMAIL_USUARIO"] + '<br></span>';
                        tr = tr + '</div>';
                        tr = tr + '<p class="description"></span><span class="badge badge-actor-05">' + data[i]["DESCRIPCION_ROL"] + '</span></p>';
                        //tr = tr + '<p class="description"><span class="text-link">' + data[i]["EMAIL_USUARIO"] + '<br></span><span class="badge badge-actor-04">Evaluador MINAM</span></p>';
                        tr = tr + '</div>';
                        tr = tr + '</div>';
                        //$("#seguimiento").append(tr);
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

function formatoMiles(n) { //add20
    var m = n * 1;
    return m.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
}