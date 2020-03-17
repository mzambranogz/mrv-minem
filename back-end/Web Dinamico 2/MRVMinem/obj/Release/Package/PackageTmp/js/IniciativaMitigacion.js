function fn_cargarUbicacion() {
    var Item =
    {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    };

    $.ajax({
        url: baseUrl + "Gestion/CargarSeleccionUbicacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {                    
                    if ($("#Control").data("revision") == 0) {
                        for (var j = 0; j < data.length; j++) {
                            for (var i = 0; i < $("#listaUbicacion").data("cantidad") ; i++) {
                                if ($('#U' + (i + 1)).data("value") == data[j]["ID_UBICACION"]) {
                                    $('#U' + (i + 1)).prop('checked', true);
                                }
                            }
                        }
                    } else {
                        var msj = '<textarea class="form-control-plaintext" id="txa-ubicacion" aria-describedby="inputGroup9" cols="30" rows="8" readonly placeholder="Ingrese una descripción para su iniciativa">';
                        for (var j = 0; j < data.length; j++) {
                            msj = msj + data[j]["DESCRIPCION"] + '&nbsp\n';
                        }
                        msj = msj + ' </textarea>';
                        $("#campoUbicacion").append(msj);
                    }                    
                }
            }
        }
    });

}

function fn_cargarGei() {
    var Item =
    {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    };
    $.ajax({
        url: baseUrl + "Gestion/CargarSeleccionGei",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    //if ($("#Control").data("revision") == 0) {
                        for (var j = 0; j < data.length; j++) {
                            for (var i = 0; i < $("#listaGei").data("cantidad") ; i++) {
                                if ($('#G' + (i + 1)).data("value") == data[j]["ID_GEI"]) {
                                    $('#G' + (i + 1)).prop('checked', true);
                                }
                            }
                        }
                    //} else {
                    //    var msj = '<textarea class="form-control-plaintext" id="mlt-energetico" aria-describedby="inputGroup9" cols="30" rows="5" readonly placeholder="Ingrese una descripción para su iniciativa">';
                    //    for (var j = 0; j < data.length; j++) {
                    //        msj = msj + data[j]["DESCRIPCION"] + '&nbsp\n';
                    //    }
                    //    msj = msj + ' </textarea>';
                    //    $("#campoGei").append(msj);
                    //}                    
                }
            }
        }
    });
}

function fn_cargarEnergetico() {
    var Item =
    {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    };
    $.ajax({
        url: baseUrl + "Gestion/CargarSeleccionEnergetico",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    //if ($("#Control").data("revision") == 0) {
                        for (var j = 0; j < data.length; j++) {
                            for (var i = 0; i < $("#listaEnerg").data("cantidad") ; i++) {
                                if ($('#E' + (i + 1)).data("value") == data[j]["ID_ENERG"]) {
                                    $('#E' + (i + 1)).prop('checked', true);
                                }
                            }
                        }
                    //} else {
                    //    var msj = '<textarea class="form-control-plaintext" id="mlt-energetico" aria-describedby="inputGroup9" cols="30" rows="5" readonly placeholder="Ingrese una descripción para su iniciativa">';
                    //    for (var j = 0; j < data.length; j++) {
                    //        msj = msj + data[j]["DESCRIPCION"] + '&nbsp\n';
                    //    }
                    //    msj = msj + ' </textarea>';
                    //    $("#campoEnerg").append(msj);
                    //}                    
                }
            }
        }
    });
}

function fn_cargarIniciativa() {
     
    var Item =
    {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    };
    $.ajax({
        url: baseUrl + "Gestion/CargarSeleccionIniciativa",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        fn_ObtenerMedidaMitigacion(data[i]["ID_MEDMIT"]);
                        $("#Control").data("mitigacion", data[i]["ID_MEDMIT"]);    
                        $("#txa-nombre-iniciativa").val(data[i]["NOMBRE_INICIATIVA"]);
                        $("#txa-descripcion-medida").val(data[i]["DESC_INICIATIVA"]);
                        $("#txt-nombre-responsable").val(data[i]["NOMBRES"]);
                        $("#txt-correo-electronico").val(data[i]["CORREO"]);
                        $("#txt-nombre-institucion").val(data[i]["INSTITUCION"]);
                        $("#txt-direccion").val(data[i]["DIRECCION"]);
                        $("#txt-sector-institucion").val(data[i]["SECTOR"]);
                        if (data[i]["INVERSION_INICIATIVA"] != 0) {
                            $("#txt-monto-inversion").val(formatoMiles(data[i]["INVERSION_INICIATIVA"])); //add20
                            //$("#txt-monto-inversion").val(data[i]["INVERSION_INICIATIVA"]);
                        }
                         
                        if ($("#Control").data("revision") == 0) {
                            $("#cbo-moneda").val(data[i]["ID_MONEDA"]);
                            $("#cbo-tipo-iniciativa-mitigacion").val(data[i]["ID_TIPO_INICIATIVA"]); // add 16-03-20
                            if (data[i]["FECHA"].toString() != "01/01/0001") {
                                $("#txt-fecha-inicio").val(data[i]["FECHA_EDITAR"]);
                                //$("#txt-fecha-inicio").val("2019-12-12"); FORMATO EJEMPLO PARA CARGA
                            }
                            if (data[i]["FECHA_FIN"].toString() != "01/01/0001") {
                                $("#txt-fecha-fin").val(data[i]["FECHA_EDITAR_FIN"]);
                            }
                        } else {
                            $("#receptorObservacion").append(data[i]["NOMBRES"]);
                            $("#emisorObservacion").append($("#Control").data("nombres"));
                            $("#txt-moneda").val(data[i]["MONEDA"]);
                            $("#txt-tipo-iniciativa-mitigacion").val(data[i]["TIPO_INICIATIVA"]); //add 16-03-20
                            if (data[i]["FECHA"].toString() != "01/01/0001") {
                                $("#txt-fecha-inicio").val(data[i]["FECHA"].toString());
                            }
                            if (data[i]["FECHA_FIN"].toString() != "01/01/0001") {
                                $("#txt-fecha-fin").val(data[i]["FECHA_FIN"].toString());
                            }
                        }                        
                        if (data[i]["PRIVACIDAD_INICIATIVA"] == 1) {
                            $("#chk-publicar").prop("checked", true);
                        }
                        if (data[i]["PRIVACIDAD_INVERSION"] == 1) {
                            $("#chk-publicar-monto-inversion").prop("checked", true);
                        }
                    }
                }
            }
        }
    });
}

function validarCheck(id, sid) {
    for (var i = 0; i < $(id).data("cantidad") ; i++) {
        if ($(sid + (i + 1)).prop('checked')) {
            return true;
        }
    }
    return false;
}

function validarCampo() {
    var utc = new Date().toJSON().slice(0, 10).replace(/-/g, '-');

    if ($("#cbo-medida-mitigacion-seleccionada").val() == 0) {
        return false;
    }
    if ($("#cbo-tipo-iniciativa-mitigacion").val() == 0) {
        return false;
    }
    if ($("#txa-nombre-iniciativa").val().trim() === ""){
        return false;
    }
    if ($("#txa-descripcion-medida").val().trim() === ""){
        return false;
    }
    if ($("#cbo-moneda").val() == 0){
        return false;
    }
    if ($("#txt-monto-inversion").val().trim() === ""){
        return false;
    }
    if ($("#txt-fecha-inicio").val() == ""){
        return false;
    }
    debugger;
    if ($("#txt-fecha-inicio").val() > utc) {
        return false
    } else {
        if ($("#txt-fecha-fin").val() != "") {
            if ($("#txt-fecha-inicio").val() > $("#txt-fecha-fin").val()) {
                return false;
            }
        }
    }
    
    if (!validarCheck("#listaUbicacion", "#U")) {
        return false;
    }

    
    //if (!validarCheck("#listaEnerg", "#E")) {
    //    return false;
    //}
    //if (!validarCheck("#listaGei", "#G")){
    //    return false;
    //}

    return true;
}

function fn_procesoIniciativa(url, estado) {
    var utc = new Date().toJSON().slice(0, 10).replace(/-/g, '-');

    if (estado == 1 || estado == 5) {
        if (!validarCampo()) {
            $('#mensajeModalRegistrar #mensajeGoodRegistro').remove();
            $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
            var msj = '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="mensajeDangerRegistro">';
            msj = msj + '                            <div class="alert-wrap mr-3">';
            msj = msj + '                                <div class="sa">';
            msj = msj + '                                    <div class="sa-error">';
            msj = msj + '                                       <div class="sa-error-x">';
            msj = msj + '                                           <div class="sa-error-left"></div>';
            msj = msj + '                                           <div class="sa-error-right"></div>';
            msj = msj + '                                       </div>';
            msj = msj + '                                       <div class="sa-error-placeholder"></div>';
            msj = msj + '                                       <div class="sa-error-fix"></div>';
            msj = msj + '                                   </div>';
            msj = msj + '                               </div>';
            msj = msj + '                           </div>';
            msj = msj + '                           <div class="alert-wrap">';
            msj = msj + '                                <h6>Error de registro</h6>';
            if ($("#txt-fecha-inicio").val() > utc) {
                msj = msj + '                                <hr><small class="mb-0">Por favor, la fecha de inicio de operaciones no puede superar la fecha actual.</small>';
            } else {
                if ($("#txt-fecha-fin").val() != "") {
                    if ($("#txt-fecha-inicio").val() > $("#txt-fecha-fin").val())
                        msj = msj + '                                <hr><small class="mb-0">Por favor, verificar que la fecha de finalización del proyecto no sea mayor a la fecha de ejecución del proyecto.</small>';
                    else
                        msj = msj + '                                <hr><small class="mb-0">Verifique que los datos sean correctamente ingresados, complete todos los campos obligatorios e intente otra vez.</small>';
                } else
                    msj = msj + '                                <hr><small class="mb-0">Verifique que los datos sean correctamente ingresados, complete todos los campos obligatorios e intente otra vez.</small>';
            }
            
            msj = msj + '                           </div>';
            msj = msj + '                     </div>';
            $('#mensajeModalRegistrar').append(msj);
            return false;            
        }
    }

        var terminos = $("#chk-publicar").prop("checked");
        var inversion = $("#chk-publicar-monto-inversion").prop("checked");
        var privacidad = '0';
        var privacidad_monto = '0';
        if (terminos) {
            privacidad = '1'; //0 - PRIVADO : 1 - PUBLICO
        }
        if (inversion) {
            privacidad_monto = '1'; //0 - PRIVADO : 1 - PUBLICO
        }

        var energetico = "";
        //for (var i = 0; i < $("#listaEnerg").data("cantidad") ; i++) {
        //    if ($('#E' + (i + 1)).prop('checked')) {
        //        energetico = energetico + $('#E' + (i + 1)).data("value") + "," + "1/";
        //    }
        //}
        //energetico = energetico.substring(0, energetico.length - 1);

        var gei = "";
        //for (var i = 0; i < $("#listaGei").data("cantidad") ; i++) {
        //    if ($('#G' + (i + 1)).prop('checked')) {
        //        gei = gei + $('#G' + (i + 1)).data("value") + "," + "1/";
        //    }
        //}
        //gei = gei.substring(0, gei.length - 1);

        var ubicacion = "";
        var ubi_verificar = "";
        for (var i = 0; i < $("#listaUbicacion").data("cantidad") ; i++) {
            if ($('#U' + (i + 1)).prop('checked')) {
                ubicacion = ubicacion + $('#U' + (i + 1)).data("value") + "," + "1/";
                ubi_verificar += $('#U' + (i + 1)).data("value") + ",";
            }
        }
        ubicacion = ubicacion.substring(0, ubicacion.length - 1);
        ubi_verificar = ubi_verificar.substring(0, ubi_verificar.length - 1);
        
        var monto_inversion = $("#txt-monto-inversion").val();
        monto_inversion = String(monto_inversion);
        monto_inversion = monto_inversion.replace(/,/gi, '');

    //=============================================================================== VALIDAR
        var validar_ini = 0;
        if (estado == 1 || estado == 5) {
            var item = {
                ID_INICIATIVA: $("#Control").data("iniciativa"),
                ID_MEDMIT: $("#Control").data("mitigacion"),
                ID_USUARIO: $("#Control").data("usuario"),
                NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
                UBICACION: ubi_verificar,
                INVERSION_INICIATIVA: monto_inversion,
                ID_MONEDA: $("#cbo-moneda").val(),
                FECHA_IMPLE_INICIATIVA: $("#txt-fecha-inicio").val()
            };
            var respuesta = MRV.Ajax(baseUrl + "Gestion/VerificarIniciativaMitigacion", item, false);
            if (respuesta.success) {
                debugger;
                if (parseInt(respuesta.extra) > 0) {
                    validar_ini = 1;
                }
            } else {
                validar_ini = 1;
            }
        }   

        if (validar_ini == 1) {
            var msj = '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="mensajeDangerRegistro">';
            msj = msj + '                            <div class="alert-wrap mr-3">';
            msj = msj + '                                <div class="sa">';
            msj = msj + '                                    <div class="sa-error">';
            msj = msj + '                                       <div class="sa-error-x">';
            msj = msj + '                                           <div class="sa-error-left"></div>';
            msj = msj + '                                           <div class="sa-error-right"></div>';
            msj = msj + '                                       </div>';
            msj = msj + '                                       <div class="sa-error-placeholder"></div>';
            msj = msj + '                                       <div class="sa-error-fix"></div>';
            msj = msj + '                                   </div>';
            msj = msj + '                               </div>';
            msj = msj + '                           </div>';
            msj = msj + '                           <div class="alert-wrap">';
            msj = msj + '                                <h6>Error de registro</h6>';
            msj = msj + '                                <hr><small class="mb-0">Ya existe una iniciativa con estos datos, por favor verificar</small>';
            msj = msj + '                           </div>';
            msj = msj + '                     </div>';
            //if ($("#Control").data("iniciativa") == 0) {
                $("#solicitar-revision #modalRegistrarBoton").hide();
                $("#pieCorrecto").show();
                //$("#Control").data("modal", 1);
            //}
            $('#mensajeModalRegistrar').append(msj);
            return false;
        }
    //===============================================================================================

    //========================================================================== VALIDAR REVISION
        var est = 0;
        if (estado == 1 || estado == 5 || estado == 0 || estado == 6) {
            var item = {
                ID_INICIATIVA: $("#Control").data("iniciativa")
            };
            var respuesta = MRV.Ajax(baseUrl + "Gestion/VerificarRevisionIniciativaMitigacion", item, false);
            if (respuesta.success) {
                if (respuesta.extra == '1') {
                    est = 1;
                }
            } else {
                est = 2;
                var msj = mensajeError("mensajeDangerRegistro", "Error", "Ocurrio un error durante el proceso de guardado de la Iniciativa.");
                $("#solicitar-revision #modalRegistrarBoton").hide();
                $("#pieCorrecto").show();
                $('#mensajeModalRegistrar').append(msj);
            }
        }

        if (est == 1) {
            var msj = '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="mensajeDangerRegistro">';
            msj = msj + '                            <div class="alert-wrap mr-3">';
            msj = msj + '                                <div class="sa">';
            msj = msj + '                                    <div class="sa-error">';
            msj = msj + '                                       <div class="sa-error-x">';
            msj = msj + '                                           <div class="sa-error-left"></div>';
            msj = msj + '                                           <div class="sa-error-right"></div>';
            msj = msj + '                                       </div>';
            msj = msj + '                                       <div class="sa-error-placeholder"></div>';
            msj = msj + '                                       <div class="sa-error-fix"></div>';
            msj = msj + '                                   </div>';
            msj = msj + '                               </div>';
            msj = msj + '                           </div>';
            msj = msj + '                           <div class="alert-wrap">';
            msj = msj + '                                <h6>Error de registro</h6>';
            msj = msj + '                                <hr><small class="mb-0">La iniciativa de mitigación ya fue enviada para su revisión</small>';
            msj = msj + '                           </div>';
            msj = msj + '                     </div>';

            if (estado == 1 || estado == 5) {
                $('#mensajeModalRegistrar').append(msj);
                $("#solicitar-revision #modalRegistrarBoton").hide();
                $("#pieCorrecto").show();
                $("#Control").data("modal", 1);
            } else if (estado == 0 || estado == 6) {
                $('#mensajeModalAvance').append(msj);
                $("#guardar-avance #modalAvanceBoton").hide();
                $("#pieCorrectoAvance").show();
                $("#Control").data("modal", 1);
            }

            
            return false;
        } else if (est == 2) {
            return false;
        }

    //==============================================================================================

        var item = {
            ID_INICIATIVA: $("#Control").data("iniciativa"), //
            ID_MEDMIT: $("#Control").data("mitigacion"),
            ID_USUARIO: $("#Control").data("usuario"),
            NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
            DESC_INICIATIVA: $("#txa-descripcion-medida").val(),
            PRIVACIDAD_INICIATIVA: privacidad,
            PRIVACIDAD_INVERSION: privacidad_monto,
            INVERSION_INICIATIVA: monto_inversion,
            ID_MONEDA: $("#cbo-moneda").val(),
            FECHA_IMPLE_INICIATIVA: $("#txt-fecha-inicio").val(),
            FECHA_FIN_INICIATIVA: $("#txt-fecha-fin").val(),
            ID_ESTADO: estado,
            ENERGETICO: energetico,
            GEI: gei,
            UBICACION: ubicacion,
            ID_TIPO_INICIATIVA: $("#cbo-tipo-iniciativa-mitigacion").val()
        };
        var mensaje = "";
        var respuesta = MRV.Ajax(url, item, false);
        if (respuesta.success) {
            if (estado == 0 || estado == 6) {
                $("#mensajeModalAvance #mensajeDangerAvance").remove();
                //var msj = '                   <div class="col-sm-12 col-md-12 col-lg-12" id="mensajeWarningAvance">';
                //msj = msj + '                       <div class="alert alert-warning d-flex align-items-stretch" role="alert">';
                //msj = msj + '                            <div class="alert-wrap mr-3">';
                //msj = msj + '                                <div class="sa">';
                //msj = msj + '                                    <div class="sa-warning">';
                //msj = msj + '                                        <div class="sa-warning-body"></div>';
                //msj = msj + '                                        <div class="sa-warning-dot"></div>';
                //msj = msj + '                                    </div>';
                //msj = msj + '                                </div>';
                //msj = msj + '                            </div>';
                //msj = msj + '                            <div class="alert-wrap">';
                //msj = msj + '                                <h6>Sus avances fueron guardados</h6>';
                //msj = msj + '                                <hr>Recuerde, podrá solicitar una revisión una vez complete todos los campos obligatorios.';
                //msj = msj + '                            </div>';
                //msj = msj + '                        </div>';
                //msj = msj + '                    </div>';

                //var msj = '                       <div class="alert alert-success d-flex align-items-stretch" role="alert" id="mensajeWarningAvance">';
                //msj = msj + '                            <div class="alert-wrap mr-3">';
                //msj = msj + '                                <div class="sa">';
                //msj = msj + '                                    <div class="sa-success">';
                //msj = msj + '                                        <div class="sa-success-tip"></div>';
                //msj = msj + '                                        <div class="sa-success-long"></div>';
                //msj = msj + '                                        <div class="sa-success-placeholder"></div>';
                //msj = msj + '                                        <div class="sa-success-fix"></div>';
                //msj = msj + '                                    </div>';
                //msj = msj + '                                </div>';
                //msj = msj + '                            </div>';
                //msj = msj + '                            <div class="alert-wrap">';
                //msj = msj + '                                <h6>Bien</h6>';
                //msj = msj + '                                <hr><small class="mb-0">Usted a guardado correctamente su avance.</b></small>';
                //msj = msj + '                            </div>';
                //msj = msj + '                        </div>';
                var msj = mensajeCorrecto("mensajeWarningAvance", "Bien", "Usted a guardado correctamente su avance.");
                $("#guardar-avance #modalAvanceBoton").hide();
                $("#pieCorrectoAvance").show();
                $('#mensajeModalAvance').append(msj);
                debugger;
                if ($("#Control").data("iniciativa") == 0) { $("#Control").data("iniciativa", parseInt(respuesta.extra2)) };
            } else {
                $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
                var msj = '                       <div class="alert alert-success d-flex align-items-stretch" role="alert" id="mensajeGoodRegistro">';
                msj = msj + '                            <div class="alert-wrap mr-3">';
                msj = msj + '                                <div class="sa">';
                msj = msj + '                                    <div class="sa-success">';
                msj = msj + '                                        <div class="sa-success-tip"></div>';
                msj = msj + '                                        <div class="sa-success-long"></div>';
                msj = msj + '                                        <div class="sa-success-placeholder"></div>';
                msj = msj + '                                        <div class="sa-success-fix"></div>';
                msj = msj + '                                    </div>';
                msj = msj + '                                </div>';
                msj = msj + '                            </div>';
                msj = msj + '                            <div class="alert-wrap">';
                msj = msj + '                                <h6>Felicitaciones</h6>';
                msj = msj + '                                <hr><small class="mb-0">Usted a completado el envío de iniciativa de mitigación que será verificada por uno de nuestros especialistas.</b></small>';
                msj = msj + '                            </div>';
                msj = msj + '                        </div>';
                $("#solicitar-revision #modalRegistrarBoton").hide();
                $("#pieCorrecto").show();
                $('#mensajeModalRegistrar').append(msj);
                $("#Control").data("modal", 1);
                //if (ws != null) ws.send(respuesta.extra);
            }
        } else {
            if (estado == 0 || estado == 6) {
                $("#mensajeModalAvance #mensajeWarningAvance").remove();
                $("#mensajeModalAvance #mensajeDangerAvance").remove();
                var msj = '                   <div class="col-sm-12 col-md-12 col-lg-12" id="mensajeDangerAvance">';
                msj = msj + '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert">';
                msj = msj + '                            <div class="alert-wrap mr-3">';
                msj = msj + '                                <div class="sa">';
                msj = msj + '                                    <div class="sa-error">';
                msj = msj + '                                       <div class="sa-error-x">';
                msj = msj + '                                           <div class="sa-error-left"></div>';
                msj = msj + '                                           <div class="sa-error-right"></div>';
                msj = msj + '                                       </div>';
                msj = msj + '                                       <div class="sa-error-placeholder"></div>';
                msj = msj + '                                       <div class="sa-error-fix"></div>';
                msj = msj + '                                   </div>';
                msj = msj + '                               </div>';
                msj = msj + '                           </div>';
                msj = msj + '                            <div class="alert-wrap">';
                msj = msj + '                                <h6>Error</h6>';
                msj = msj + '                                <hr>Ocurrio un error durante el proceso de guardado del avance de la Iniciativa.';
                msj = msj + '                            </div>';
                msj = msj + '                        </div>';
                msj = msj + '                    </div>';
                $('#mensajeModalAvance').append(msj);
            } else {
                $('#mensajeModalRegistrar #mensajeGoodRegistro').remove();
                $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
                var msj = '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="mensajeDangerRegistro">';
                msj = msj + '                            <div class="alert-wrap mr-3">';
                msj = msj + '                                <div class="sa">';
                msj = msj + '                                    <div class="sa-error">';
                msj = msj + '                                       <div class="sa-error-x">';
                msj = msj + '                                           <div class="sa-error-left"></div>';
                msj = msj + '                                           <div class="sa-error-right"></div>';
                msj = msj + '                                       </div>';
                msj = msj + '                                       <div class="sa-error-placeholder"></div>';
                msj = msj + '                                       <div class="sa-error-fix"></div>';
                msj = msj + '                                   </div>';
                msj = msj + '                               </div>';
                msj = msj + '                           </div>';
                msj = msj + '                           <div class="alert-wrap">';
                msj = msj + '                                <h6>Error de registro</h6>';
                msj = msj + '                                <hr><small class="mb-0">Verifique que los datos sean correctamente ingresados, complete todos los campos obligatorios e intente otra vez.</small>';
                msj = msj + '                           </div>';
                msj = msj + '                     </div>';
                $('#mensajeModalRegistrar').append(msj);
            }
        }

        
    
}

$("#solicitar-revision").on("hidden.bs.modal", function () {
    if ($("#Control").data("modal") == 1) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    } else {
        $('#mensajeModalRegistrar #mensajeGoodRegistro').remove();
        $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
        $("#solicitar-revision #modalRegistrarBoton").show();
        $("#pieCorrecto").hide();
    }
});

$("#guardar-avance").on("hidden.bs.modal", function () {
    if ($("#Control").data("modal") == 1) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    } else {
        $("#mensajeModalAvance #mensajeWarningAvance").remove();
        $("#mensajeModalAvance #mensajeDangerAvance").remove();
        $("#guardar-avance #modalAvanceBoton").show();
        $("#pieCorrectoAvance").hide();
    }    
});


function fn_RegistrarIniciativaMitigacion() {
     
    var url = baseUrl + "Gestion/RegistrarIniciativaMitigacion";
    fn_procesoIniciativa(url, 1);
}

function fn_ActualizarIniciativaMitigacion() {
    var url = baseUrl + "Gestion/ActualizarIniciativaMitigacion";
    fn_procesoIniciativa(url, 1);
}

function fn_CorregirIniciativaMitigacion() {
    var url = baseUrl + "Gestion/ActualizarIniciativaMitigacion";
    fn_procesoIniciativa(url, 5);
}

function fn_registrarAvance() {
    var url = baseUrl + "Gestion/RegistrarIniciativaMitigacion";
    fn_procesoIniciativa(url, 0);
}

function fn_actualizarAvance() {
    var url = baseUrl + "Gestion/ActualizarIniciativaMitigacion";
    fn_procesoIniciativa(url, 0);
}

function fn_guardarCorregirAvances() {
    var url = baseUrl + "Gestion/ActualizarIniciativaMitigacion";
    fn_procesoIniciativa(url, 6);
}

function fn_GuardarIniciativaMitigacion() {
    if ($("#Control").data("iniciativa") == 0) {
        fn_RegistrarIniciativaMitigacion();
    } else {
        fn_ActualizarIniciativaMitigacion();
    }
}

function fn_guardarAvances() {
    debugger;
    if ($("#Control").data("iniciativa") == 0) {
        fn_registrarAvance();
    } else {
        fn_actualizarAvance();
    }
}

function fn_cargarAvance() {
    fn_cargarUbicacion();
    fn_cargarGei();
    fn_cargarEnergetico();
    fn_cargarIniciativa();
}
/////////////////////////////////////////////////////////

function fn_ObtenerMedidaMitigacion(id) {
    var Item = {
        ID_MEDMIT: id
    };
    $.ajax({
        url: baseUrl + "Gestion/ObtenerMedidaMitigacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#nombreMedida span").remove();
                        $("#txt-categoria").val(data[i]["IPSC_MEDMIT"]);
                        $("#txa-objetivo").val(data[i]["OBJETIVO_MEDMIT"]);
                        $("#txa-descripcion").val(data[i]["DESCRIPCION_MEDMIT"]);
                        $("#cbo-medida-mitigacion-seleccionada").val(data[i]["ID_MEDMIT"]);
                        $("#nombreMedida").append('<span>' + data[i]["NOMBRE_MEDMIT"] + '</span>');
                    }
                }
            }
        }
    });
}

$("#cbo-medida-mitigacion-seleccionada").change(function () {
    $("#txt-categoria").val("");
    $("#txa-objetivo").val("");
    $("#txa-descripcion").val("");
    $("#nombreMedida span").remove();
    $("#Control").data("mitigacion", 0);
    var Item = {
        ID_MEDMIT: $("#cbo-medida-mitigacion-seleccionada").val()
    };
    $.ajax({
        url: baseUrl + "Gestion/ObtenerMedidaMitigacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        //$("#nombreMedida span").remove();
                        $("#txt-categoria").val(data[i]["IPSC_MEDMIT"]);
                        $("#txa-objetivo").val(data[i]["OBJETIVO_MEDMIT"]);
                        $("#txa-descripcion").val(data[i]["DESCRIPCION_MEDMIT"]);
                        //$("#cbo-medida-mitigacion-seleccionada").val(data[i]["ID_MEDMIT"]);
                        $("#nombreMedida").append('<span id="medida">' + data[i]["NOMBRE_MEDMIT"] + '</span>');
                        $("#Control").data("mitigacion", $("#cbo-medida-mitigacion-seleccionada").val())
                    }
                }
            }
        }
    });
});


// txa-nombre-iniciativa, txa-descripcion-medida, txt-monto-inversion, txt-fecha-inicio
function CargarDatosIniciativa() {

    //$("#txt-nombre-responsable").val($("#Control").data("nombres"));
    //$("#txt-nombre-institucion").val($("#Control").data("institucion"));
    //$("#txt-correo-electronico").val($("#Control").data("correo"));
    //$("#txt-direccion").val($("#Control").data("direccion"));
    //$("#txt-sector-institucion").val($("#Control").data("sector"));

    var Item =
    {
        ID_USUARIO: $("#Control").data("usuario")
    };
    $.ajax({
        url: baseUrl + "Gestion/CargarDatosUsuario",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#txt-nombre-responsable").val(data[i]["NOMBRES"]);
                        $("#txt-nombre-institucion").val(data[i]["INSTITUCION"]);
                        $("#txt-correo-electronico").val(data[i]["EMAIL_USUARIO"]);
                        $("#txt-direccion").val(data[i]["DIRECCION"]);                        
                        $("#txt-sector-institucion").val(data[i]["SECTOR"]);
                    }
                }
            }
        }
    });

}

function CargarInicio() {
    if ($("#Control").data("iniciativa") > 0) {
        fn_cargarAvance();
        if ($("#Control").data("rol") == 2) {
            //$("#correctoRevisarIniciativa").hide();
            //$("#correctoObservacionIniciativa").hide();
        }
    } else {
        fn_ObtenerMedidaMitigacion($("#Control").data("mitigacion"));
        CargarDatosIniciativa();
    }
}

function CargarMoneda() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Gestion/ListarMoneda",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
        if (data != null && data != "") {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $("#cbo-moneda").append('<option value="' + data[i]["ID_MONEDA"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                }
            }
        }
        CargarInicio();
    });
}

function fn_ListarUbicacion() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Gestion/ListarUbicacion",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
        if (data != null && data != "") {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var check = '<div class="col-auto my-1">';
                    check = check + '<div class="custom-control custom-checkbox mr-sm-2">';
                    check = check + '   <input class="custom-control-input" type="checkbox" id="U' + (i + 1) + '" data-value="' + data[i]["ID_UBICACION"] + '" >';
                    check = check + '   <label class="custom-control-label" for="U' + (i + 1) + '">';
                    check = check + '           ' + data[i]["DESCRIPCION"];
                    check = check + '   </label>';
                    check = check + '</div>';
                    check = check + '</div>';
                    $("#listaUbicacion").append(check);
                }
                $("#listaUbicacion").data("cantidad", data.length);
            }
        }
        CargarMoneda();
    });
}

function fn_ListarENERG() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Gestion/ListarENERG",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
        if (data != null && data != "") {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var check = '<div class="col-auto my-1">';
                    check = check + '<div class="custom-control custom-checkbox mr-sm-2">';
                    check = check + '    <input class="custom-control-input" type="checkbox" id="E' + (i + 1) + '" data-value="' + data[i]["ID_ENERG"] + '" >';
                    check = check + '    <label class="custom-control-label energ-' + (i + 1) + '" for="E' + (i + 1) + '">' + data[i]["DESCRIPCION"] + '</label>';
                    check = check + '</div>';
                    check = check + '</div>';
                    $("#listaEnerg").append(check);
                }
                $("#listaEnerg").data("cantidad", data.length);
            }
        }
        fn_ListarUbicacion();
    });
}

function fn_ListarGEI() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Gestion/ListarGEI",
        type: 'POST',
        datatype: 'json',
        data: Item
    })
    .done(function (data) {
        if (data != null && data != "") {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var check = '<div class="col-auto my-1">';
                    check = check + '<div class="custom-control custom-checkbox mr-sm-2">';
                    check = check + '    <input class="custom-control-input" type="checkbox" id="G' + (i + 1) + '" data-value="' + data[i]["ID_GEI"] + '" >';
                    check = check + '    <label class="custom-control-label gei-'+ (i + 1) +'" for="G' + (i + 1) + '">' + data[i]["DESCRIPCION"] + '</label>';
                    check = check + '</div>';
                    check = check + '</div>';
                    $("#listaGei").append(check);
                }
                $("#listaGei").data("cantidad", data.length);
            }
        }
        fn_ListarENERG();
    });
}


$(function () {
    $(".validar").keydown(function (event) {
        //alert(event.keyCode);
        if ((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105) && event.keyCode !== 190 && event.keyCode !== 110 && event.keyCode !== 8 && event.keyCode !== 9) {
            return false;
        }
    });
});

function fn_cambiarIniciativaMitigacion(id) {
    $("#Control").data("mitigacion", id);
    fn_ObtenerMedidaMitigacion(id);
    $('#medidas-mitigacion-listado').modal('hide')
}

function validarCampoRevision() {
    if (!validarCheck("#listaEnerg", "#E")) {
        return false;
    }
    if (!validarCheck("#listaGei", "#G")){
        return false;
    }
    return true;
}

function fn_revisarIniciativaMitigacion() {
    //debugger;

    var mns = ValidarRevision($("#Control").data("iniciativa"), 2, "mensajeDangerRegistro", "Esta iniciativa ya fue revisada y/o observada");
    if (mns != "") {        
        $("#aprobar-revision #modalAprobarBoton").hide();
        $("#pieCorrectoAprobacion").show();
        $("#modalAprobacion").append(mns);
        $("#Control").data("modal", 1);
        return false;
    }

    if (!validarCampoRevision()) {
        $('#modalAprobacion #modalErrorAprobacion').remove();
        $('#modalAprobacion #mensajeDangerRegistro').remove();
        var msj = '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="mensajeDangerRegistro">';
        msj = msj + '                            <div class="alert-wrap mr-3">';
        msj = msj + '                                <div class="sa">';
        msj = msj + '                                    <div class="sa-error">';
        msj = msj + '                                       <div class="sa-error-x">';
        msj = msj + '                                           <div class="sa-error-left"></div>';
        msj = msj + '                                           <div class="sa-error-right"></div>';
        msj = msj + '                                       </div>';
        msj = msj + '                                       <div class="sa-error-placeholder"></div>';
        msj = msj + '                                       <div class="sa-error-fix"></div>';
        msj = msj + '                                   </div>';
        msj = msj + '                               </div>';
        msj = msj + '                           </div>';
        msj = msj + '                           <div class="alert-wrap">';
        msj = msj + '                                <h6>Error de registro</h6>';
        msj = msj + '                                <hr><small class="mb-0">Por favor, completar los campos obligatorios.</small>';
        msj = msj + '                           </div>';
        msj = msj + '                     </div>';
        $("#modalAprobacion").append(msj);
        return false;
    }

    ///================================= add
    var energetico = "";
    var descripcion_energ = "";
    for (var i = 0; i < $("#listaEnerg").data("cantidad") ; i++) {
        if ($('#E' + (i + 1)).prop('checked')) {
            energetico = energetico + $('#E' + (i + 1)).data("value") + "," + "1/";
            descripcion_energ += $(".energ-" + (i + 1)).html() + " - ";
        }
    }
    energetico = energetico.substring(0, energetico.length - 1);
    descripcion_energ = descripcion_energ.substring(0, descripcion_energ.length - 3);

    var gei = "";
    var descripcion_gei = "";
    for (var i = 0; i < $("#listaGei").data("cantidad") ; i++) {
        if ($('#G' + (i + 1)).prop('checked')) {
            gei = gei + $('#G' + (i + 1)).data("value") + "," + "1/";
            descripcion_gei += $(".gei-" + (i + 1)).html() + " - ";
        }
    }
    gei = gei.substring(0, gei.length - 1);
    descripcion_gei = descripcion_gei.substring(0, descripcion_gei.length - 3);
    ///=====================================

    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario"),
        EMAIL_USUARIO: $("#txt-correo-electronico").val(),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
        ID_TIPO_INICIATIVA: $("#tipo-iniciativa").data("tipo"),
        ENERGETICO: energetico, //add
        GEI: gei, //add
        DESCRIPCION_GEI: descripcion_gei,
        DESCRIPCION_ENERG: descripcion_energ
    }
    url = baseUrl + "Gestion/AprobarIniciativaMitigacion";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalAprobacion #modalErrorAprobacion").remove();
        $('#modalAprobacion #mensajeDangerRegistro').remove();
        var msj = '                           <div class="alert alert-success d-flex align-items-stretch" role="alert" id="modalCorrectoAprobacion">';
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
        msj = msj + '                                    <h6>Bien hecho</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Se aprobó correctamente esta revisión, se procederá a notificar al Usuario Administrado.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#aprobar-revision #modalAprobarBoton").hide();
        $("#pieCorrectoAprobacion").show();
        $("#modalAprobacion").append(msj);
        $("#Control").data("modal", 1);
        //if (ws != null) ws.send(respuesta.extra);
    } else {
        $("#modalAprobacion #modalErrorAprobacion").remove();
        $('#modalAprobacion #mensajeDangerRegistro').remove();
        var msj = '                           <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="modalErrorAprobacion">';
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
        msj = msj + '                                    <h6>Error de aprobación</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Ocurrió un error de comunicación con el servidor, intente otra vez.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalAprobacion").append(msj);
    }

}

$("#aprobar-revision").on("hidden.bs.modal", function () {
    if ($("#Control").data("modal") == 1) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    } else {
        $("#modalAprobacion #modalCorrectoAprobacion").remove();
        $("#modalAprobacion #modalErrorAprobacion").remove();
        $('#modalAprobacion #mensajeDangerRegistro').remove();
        $("#aprobar-revision #modalAprobarBoton").show();
        $("#pieCorrectoAprobacion").hide();
    }
});

function fn_observacionIniciativaMitigacion() {
    debugger;
    var mns = ValidarRevision($("#Control").data("iniciativa"), $("#estado_flujo").val(), "modalErrorRevision", "Esta iniciativa ya fue revisada y/o observada");
    if (mns != "") {
        $("#observar-revision #modalObservacionBoton").hide();
        $("#pieCorrectoObservacion").show();
        $("#modalRevision").append(mns);
        $("#Control").data("modal", 1);
        return false;
    }

    url = baseUrl + "Gestion/ObservacionIniciativaMitigacion"
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario"),
        DESCRIPCION: $("#txa-observacion-iniciativa").val(),
        ID_ESTADO: $("#cbo-tipo-observacion").val(),
        EMAIL_USUARIO: $("#txt-correo-electronico").val(),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val()
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalRevision #modalErrorRevision").remove();
        var msj  =  '                           <div class="alert alert-success d-flex align-items-stretch" role="alert" id="modalCorrectoRevision">';
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
        msj = msj + '                                    <h6>Bien hecho</h6>';
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones se enviaron correctamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#observar-revision #modalObservacionBoton").hide();
        $("#pieCorrectoObservacion").show();
        $("#modalRevision").append(msj);
        $("#Control").data("modal", 1);
        //if (ws != null) ws.send(respuesta.extra);
    } else {
        $("#modalRevision #modalErrorRevision").remove();
        var msj = '                           <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="modalErrorRevision">';
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
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones no fueron enviadas, intentelo nuevamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalRevision").append(msj);
    }    
}

$("#observar-revision").on("hidden.bs.modal", function () {
    if ($("#Control").data("modal") == 1) {
        location.href = baseUrl + "Gestion/AccionMitigacion";
    } else {
        $("#modalRevision #modalErrorRevision").remove();
        $("#modalRevision #modalCorrectoRevision").remove();
        $("#observar-revision #modalObservacionBoton").show();
        $("#pieCorrectoObservacion").hide();
    }
});

function fn_ListarMedidaMitigacion() {
    var item = {
    };
    vurl = baseUrl + "Gestion/ListarMedidaMitigacion";
    $.ajax({
        url: vurl,
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#cbo-medida-mitigacion-seleccionada").append('<option value="' + data[i]["ID_MEDMIT"] + '">' + data[i]["NOMBRE_MEDMIT"] + '</option>');
                    }
                }
            }
            fn_ListarGEI();
        }
    });
}

function inicio() {
    $("#pieCorrectoObservacion").hide();
    $("#pieCorrectoAprobacion").hide();
    $("#pieCorrectoAvance").hide();
    $("#pieCorrecto").hide();
}

function CorreoAdmin() {
    var url = baseUrl + "Gestion/CorreoAdministrador";
    var item = {};
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#correo-admin").html(respuesta.extra);
    }
}

$(document).ready(function () {
    inicio();    
    if ($("#iniciativa_mit_ID_INICIATIVA").val() > 0) {
        $("#Control").data("iniciativa", $("#iniciativa_mit_ID_INICIATIVA").val());
    } else {
        $("#Control").data("iniciativa", $("#iniciativa").val());
    }
    if ($("#iniciativa_mit_ID_MEDMIT").val() > 0) {
        $("#Control").data("mitigacion", $("#iniciativa_mit_ID_MEDMIT").val());
    } else {
        $("#Control").data("mitigacion", $("#identificador").val());
    }    
    $("#Control").data("revision", $("#revision").val());
    fn_ListarMedidaMitigacion();
    CorreoAdmin();
});

//$(document).on("change", "#cbo-medida-mitigacion-seleccionada", function () {

//    if ($("#cbo-medida-mitigacion-seleccionada").val() == 0) {
//        $("#txt-categoria").val("");
//        $("#txa-objetivo").val("");
//        $("#txa-descripcion").val("");
//    }

//});

$("#txt-monto-inversion").on({
    "focus": function (event) {
        $(event.target).select();
    },
    "keyup": function (event) {
        $(event.target).val(function (index, value) {
            return value.replace(/\D/g, "")
                        .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");
        });
    }
});

function formatoMiles(n) { //add20
    return n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
}

function fn_cambiarTipoIniciativa(id, tipoIniciativa) {
    $("#tipo-iniciativa").html("").append('<i class="fas fa-list pr-1"></i>' + tipoIniciativa);
    $("#tipo-iniciativa").data("tipo", id);
}

function mensajeCorrecto(id, titulo, mensaje) {
    var msj = '                       <div class="alert alert-success d-flex align-items-stretch" role="alert" id="'+ id +'">';
    msj = msj + '                            <div class="alert-wrap mr-3">';
    msj = msj + '                                <div class="sa">';
    msj = msj + '                                    <div class="sa-success">';
    msj = msj + '                                        <div class="sa-success-tip"></div>';
    msj = msj + '                                        <div class="sa-success-long"></div>';
    msj = msj + '                                        <div class="sa-success-placeholder"></div>';
    msj = msj + '                                        <div class="sa-success-fix"></div>';
    msj = msj + '                                    </div>';
    msj = msj + '                                </div>';
    msj = msj + '                            </div>';
    msj = msj + '                            <div class="alert-wrap">';
    msj = msj + '                                <h6>'+ titulo +'</h6>';
    msj = msj + '                                <hr><small class="mb-0">'+ mensaje +'</b></small>';
    msj = msj + '                            </div>';
    msj = msj + '                        </div>';
    return msj;
}

function mensajeError(id, titulo, mensaje) {
    var msj = '                       <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="' + id + '">';
    msj = msj + '                            <div class="alert-wrap mr-3">';
    msj = msj + '                                <div class="sa">';
    msj = msj + '                                    <div class="sa-error">';
    msj = msj + '                                       <div class="sa-error-x">';
    msj = msj + '                                           <div class="sa-error-left"></div>';
    msj = msj + '                                           <div class="sa-error-right"></div>';
    msj = msj + '                                       </div>';
    msj = msj + '                                       <div class="sa-error-placeholder"></div>';
    msj = msj + '                                       <div class="sa-error-fix"></div>';
    msj = msj + '                                   </div>';
    msj = msj + '                               </div>';
    msj = msj + '                           </div>';
    msj = msj + '                            <div class="alert-wrap">';
    msj = msj + '                                <h6>'+ titulo +'</h6>';
    msj = msj + '                                <hr><small class="mb-0">'+ mensaje +'</b></small>';
    msj = msj + '                            </div>';
    msj = msj + '                        </div>';
    msj = msj + '                    </div>';
    return msj;
}


function ValidarRevision(id_ini, id_plazo, id_msj, mensaje) {
    var msj = "";
    var item = {
        ID_INICIATIVA: id_ini,
        ID_PLAZO_ETAPA_ESTADO: id_plazo
    };
    var respuesta = MRV.Ajax(baseUrl + "Gestion/ValidarRevisionIniciativa", item, false);
    if (respuesta.success) {
        if (respuesta.extra == '0') {
            msj = mensajeError(id_msj, "Error", mensaje);
        }
    } else {
        msj = mensajeError(id_msj, "Error", "Ocurrio un error durante el proceso de guardado de la Iniciativa.");
    }
    return msj;
}


