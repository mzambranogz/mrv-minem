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
                    for (var j = 0; j < data.length; j++) {
                        for (var i = 0; i < $("#listaUbicacion").data("cantidad") ; i++) {
                            if ($('#U' + (i + 1)).data("value") == data[j]["ID_UBICACION"]) {
                                $('#U' + (i + 1)).prop('checked', true);
                            }
                        }
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
                    for (var j = 0; j < data.length; j++) {
                        for (var i = 0; i < $("#listaGei").data("cantidad") ; i++) {
                            if ($('#G' + (i + 1)).data("value") == data[j]["ID_GEI"]) {
                                $('#G' + (i + 1)).prop('checked', true);
                            }
                        }
                    }
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
                    for (var j = 0; j < data.length; j++) {
                        for (var i = 0; i < $("#listaEnerg").data("cantidad") ; i++) {
                            if ($('#E' + (i + 1)).data("value") == data[j]["ID_ENERG"]) {
                                $('#E' + (i + 1)).prop('checked', true);
                            }
                        }
                    }
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
                            $("#txt-monto-inversion").val(data[i]["INVERSION_INICIATIVA"]);
                        }
                        $("#cbo-moneda").val(data[i]["ID_MONEDA"]);
                        if (data[i]["FECHA"] != "0001-01-01") {
                            $("#txt-fecha-inicio").val(data[i]["FECHA"]);
                        }
                        if (data[i]["PRIVACIDAD_INICIATIVA"] == 1) {
                            $("regPrivacidad").prop("checked", true); //txa-nombre-iniciativa, txa-descripcion-medida, txt-monto-inversion, txt-fecha-inicio
                        }
                    }
                }
            }
        }
    });
}


function fn_procesoIniciativa(url, estado) {
    var terminos = $("input:checkbox[id=regPrivacidad]:checked").val();
    var privacidad = '0';
    if (terminos) {
        privacidad = '1'; //0 - PRIVADO : 1 - PUBLICO
    }

    var energetico = "";
    for (var i = 0; i < $("#listaEnerg").data("cantidad") ; i++) {
        if ($('#E' + (i + 1)).prop('checked')) {
            energetico = energetico + $('#E' + (i + 1)).data("value") + "," + "1/";
        }
    }
    energetico = energetico.substring(0, energetico.length - 1);

    var gei = "";
    for (var i = 0; i < $("#listaGei").data("cantidad") ; i++) {
        if ($('#G' + (i + 1)).prop('checked')) {
            gei = gei + $('#G' + (i + 1)).data("value") + "," + "1/";
        }
    }
    gei = gei.substring(0, gei.length - 1);

    var ubicacion = "";
    for (var i = 0; i < $("#listaUbicacion").data("cantidad") ; i++) {
        if ($('#U' + (i + 1)).prop('checked')) {
            ubicacion = ubicacion + $('#U' + (i + 1)).data("value") + "," + "1/";
        }
    }
    ubicacion = ubicacion.substring(0, ubicacion.length - 1);

    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"), //
        ID_MEDMIT: $("#Control").data("mitigacion"),
        ID_USUARIO: $("#Control").data("usuario"),
        NOMBRE_INICIATIVA: $("#txa-nombre-iniciativa").val(),
        DESC_INICIATIVA: $("#txa-descripcion-medida").val(),
        PRIVACIDAD_INICIATIVA: privacidad,
        INVERSION_INICIATIVA: $("#txt-monto-inversion").val(),
        ID_MONEDA: $("#cbo-moneda").val(),
        FECHA_IMPLE_INICIATIVA: $("#txt-fecha-inicio").val(),
        ID_ESTADO: estado,
        ENERGETICO: energetico,
        GEI: gei,
        UBICACION: ubicacion
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        if (estado == 0) {
            $("#mensajeModalAvance #mensajeWarningAvance").remove();
            $("#mensajeModalAvance #mensajeDangerAvance").remove();
            var msj =   '                   <div class="col-sm-12 col-md-12 col-lg-12" id="mensajeWarningAvance">';
            msj = msj + '                       <div class="alert alert-warning d-flex align-items-stretch" role="alert">';
            msj = msj + '                            <div class="alert-wrap mr-3">';
            msj = msj + '                                <div class="sa">';
            msj = msj + '                                    <div class="sa-warning">';
            msj = msj + '                                        <div class="sa-warning-body"></div>';
            msj = msj + '                                        <div class="sa-warning-dot"></div>';
            msj = msj + '                                    </div>';
            msj = msj + '                                </div>';
            msj = msj + '                            </div>';
            msj = msj + '                            <div class="alert-wrap">';
            msj = msj + '                                <h6>Sus avances fueron guardados</h6>';
            msj = msj + '                                <hr>Recuerde, podrá solicitar una revisión una vez complete todos los campos obligatorios.';
            msj = msj + '                            </div>';
            msj = msj + '                        </div>';
            msj = msj + '                    </div>';
            $('#mensajeModalAvance').append(msj);
            //fn_accionesMitigacion();
        } else {
            $('#mensajeModalRegistrar #mensajeGoodRegistro').remove();
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
            msj = msj + '                                <h6>Bien hecho</h6>';
            msj = msj + '                                <hr><small class="mb-0">Los datos de su iniciativa fueron guardados exitosamente, espere la aprobación del especialista para continuar con el registro de detalle de indicadores. En breve le notificaremos el estado de su solicitud de revisión.</small>';
            msj = msj + '                            </div>';
            msj = msj + '                        </div>';
            $('#mensajeModalRegistrar').append(msj);
            $("#Control").data("modal", 1);
            if (respuesta.extra == "1") {
                if (ws != null) ws.send(respuesta.extra);
            }
        }
    } else {
        if (estado == 0) {
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

    $("#solicitar-revision").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
        }
    });
}


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

function fn_GuardarIniciativaMitigacion() {
    if ($("#Control").data("iniciativa") == 0) {
        fn_RegistrarIniciativaMitigacion();
    } else {
        fn_ActualizarIniciativaMitigacion();
    }
}

function fn_guardarAvances() {
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
                        $("#txt-categoria").val(data[i]["IPSC_MEDMIT"]);
                        $("#txa-objetivo").val(data[i]["OBJETIVO_MEDMIT"]);
                        $("#txa-descripcion").val(data[i]["DESCRIPCION_MEDMIT"]);
                    }
                }
            }
        }
    });
}
// txa-nombre-iniciativa, txa-descripcion-medida, txt-monto-inversion, txt-fecha-inicio
function CargarDatosIniciativa() {
    $("#txt-nombre-responsable").val($("#Control").data("nombres"));
    $("#txt-nombre-institucion").val($("#Control").data("institucion"));
    $("#txt-correo-electronico").val($("#Control").data("correo"));
    $("#txt-direccion").val($("#Control").data("direccion"));
    $("#txt-sector-institucion").val($("#Control").data("sector"));
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
                    check = check + '    <label class="custom-control-label" for="E' + (i + 1) + '">' + data[i]["DESCRIPCION"] + '</label>';
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
                    check = check + '    <label class="custom-control-label" for="G' + (i + 1) + '">' + data[i]["DESCRIPCION"] + '</label>';
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

$(document).ready(function () {
    $("#Control").data("mitigacion", $("#identificador").val());
    $("#Control").data("iniciativa", $("#iniciativa").val());
    fn_ListarGEI();
});

function fn_cambiarIniciativaMitigacion(id) {
    $("#Control").data("mitigacion", id);
    fn_ObtenerMedidaMitigacion(id);
    $('#medidas-mitigacion-listado').modal('hide')
}

function fn_observacionIniciativaMitigacion() {
    url = baseUrl + "Gestion/ObservacionIniciativaMitigacion"
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario"),

    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalRevision #modalCorrectoRevision").remove();
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
        msj = msj + '                                    <h6>Bien hecho</h6';
        msj = msj + '                                    <hr><small class="mb-0">Sus observaciones se enviaron correctamente.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalRevision").append(msj);
        $("#Control").data("modal", 1);
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

    $("#observar-revision").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
            //fn_accionesMitigacion(); //Invocado desde SesionLayout
        }
    });

    $("#Control").data("iniciativa", 0);
}