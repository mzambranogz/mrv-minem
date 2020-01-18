$(document).ready(function () {
    //debugger;
    $("#Control").data("iniciativa", $("#identificador").val());
    CargarDetalleIndicador();

    //$("#tipoVehiculoB").change(function () {
    //  alert("hola");
    //validarCampo();
    //});

});

$("#cbo-enfoque").change(function () {
    //alert("hola");
    //validarCampo();
});

$(document).on("change", "#tipoVehiculoB" + 1, function () {
    validarCampo();
});

$(document).on("change", "#tipoCombustibleB" + 1, function () {
    validarCampo();
});

$(document).on("focusout", "#krvB" + 1, function () {
    validarCampo();
});

$(document).on("focusout", "#cantidadB" + 1, function () {
    validarCampo();
});

$(document).on("focusout", "#factorRendimientoB" + 1, function () {
    validarCampo();
});

function validarCampo() {
    var validar = 1;
    if ($("#tipoVehiculoB" + $("#tablaIndicador").data("fila")).val() == 0) {
        validar = 0;
    } else if ($("#tipoCombustibleB" + $("#tablaIndicador").data("fila")).val() == 0) {
        validar = 0;
    } else if ($("#krvB" + $("#tablaIndicador").data("fila")).val() == "") {
        validar = 0;
    } else if ($("#cantidadB" + $("#tablaIndicador").data("fila")).val() == "") {
        validar = 0;
    }
    if (validar == 1) {
        console.log("hola");
        fn_calcularIndicador($("#tablaIndicador").data("fila"));
        return false;
    }
    //alert($("#tipoVehiculoB" + $("#tablaIndicador").data("fila")).val() + " - " + $("#tipoCombustibleB" + $("#tablaIndicador").data("fila")).val() + " - " + $("#krvB" + $("#tablaIndicador").data("fila")).val() + " - " + $("#cantidadB" + $("#tablaIndicador").data("fila")).val() + " - " + $("#factorRendimientoB" + $("#tablaIndicador").data("fila")).val());
}

function CargarDetalleIndicador() {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    }
    $.ajax({
        url: baseUrl + 'Gestion/ListarDetalleIndicador',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        CargarTablaIndicador(data, i);
                    }
                }
            }
            CargarSoloTablaIndicador();
        }
    });
}

function cargarAnio() {

    var tr = '                                  <option value="2019">2019</option>';
    tr = tr + '                                  <option value="2020">2020</option>';
    tr = tr + '                                  <option value="2021">2021</option>';
    tr = tr + '                                  <option value="2022">2022</option>';
    tr = tr + '                                  <option value="2023">2023</option>';
    tr = tr + '                                  <option value="2024">2024</option>';
    return tr;
}

function fn_CargarListaTipoVehiculo(datat, j, fila) {
    var Item = {};
    $.ajax({
        url: baseUrl + "Administrado/Gestion/ListarTipoVehiculo",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
        if (data != null && data != "") {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $("#tipoVehiculoB" + fila).append('<option value="' + data[i]["ID_TIPO_VEHICULO"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                    $("#tipoVehiculoI" + fila).append('<option value="' + data[i]["ID_TIPO_VEHICULO"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                }
            }
        }
        fn_CargarListaTipoCombustible(datat, j, fila);
    });
}

function fn_CargarListaTipoCombustible(datat, j, fila) {
    var Item = {};
    $.ajax({
        url: baseUrl + "Administrado/Gestion/ListarTipoCombustible",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
        if (data != null && data != "") {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $("#tipoCombustibleB" + fila).append('<option value="' + data[i]["ID_TIPO_COMBUSTIBLE"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                }
            }
        }
        fn_CargarListaTipoFuente(datat, j, fila);
    });
}

function fn_CargarListaTipoFuente(datat, j, fila) {
    var Item = {};
    $.ajax({
        url: baseUrl + "Administrado/Gestion/ListarTipoFuente",
        type: 'POST',
        datatype: 'json',
        data: Item
    }).done(function (data) {
        if (data != null && data != "") {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $("#tipoFuenteI" + fila).append('<option value="' + data[i]["ID_TIPO_FUENTE"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                }
            }
        }
        //llenarTabla(fila, datat, j);
    });
}

function CargarSoloTablaIndicador() {
    var j = 0;
    var fila = $("#tablaIndicador").data("fila") + 1;
    var tr = '<tr id="detalles-tr-' + (j + 1) + '" data-value="0" >';
    tr = tr + '         <td data-encabezado="Columna 01">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-columna' + fila + '-' + (j + 1) + '">';
    tr = tr + '                          <option value="2018">2018</option>';
    tr = tr + cargarAnio();
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 02">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-columna' + fila + '-' + (j + 2) + '">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 03">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-columna' + fila + '-' + (j + 3) + '">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="Texto aquí" id="cbo-columna' + fila + '-' + (j + 4) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 05">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="Texto aquí" id="cbo-columna' + fila + '-' + (j + 5) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 06">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="Texto aquí" id="cbo-columna' + fila + '-' + (j + 6) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 07">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="Texto aquí" id="cbo-columna' + fila + '-' + (j + 7) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 07">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="Texto aquí" id="cbo-columna' + fila + '-' + (j + 8) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td class="text-center" data-encabezado="Sustento">';
    tr = tr + '                <div class="form-group m-0">';
    tr = tr + '                       <label class="btn btn-secondary btn-sm m-0" for="fle-doc"><i class="fas fa-upload mr-1"></i>Cargar</label>';
    tr = tr + '                       <input class="d-none fil-file-control" type="file" id="fle-doc">';
    tr = tr + '                </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td class="text-center text-xs-right" data-encabezado="Acciones">';
    tr = tr + '                <div class="btn-group">';
    tr = tr + '                     <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
    tr = tr + '                          <div class="dropdown-menu dropdown-menu-right">';
    tr = tr + '                                  <a class="dropdown-item agregarCampos" href="#">';
    tr = tr + '                                         <i class="fas fa-plus-circle"></i>&nbsp;Agregar';
    tr = tr + '                                  </a><a class="dropdown-item quitarCampos" href="#">';
    tr = tr + '                                         <i class="fas fa-minus-circle"></i>&nbsp;Eliminar';
    tr = tr + '                                  </a>';
    tr = tr + '                          </div>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';
    tr = tr + '</tr>';
    $("#cuerpoTablaIndicador").append(tr);
    MRV.CargarSelect(baseUrl + "Gestion/ListarTipoVehiculo", "#cbo-columna" + fila + "-" + (j + 2), "ID_TIPO_VEHICULO", "DESCRIPCION");
    MRV.CargarSelect(baseUrl + "Gestion/ListarTipoCombustible", "#tipoCombustibleB" + fila, "ID_TIPO_COMBUSTIBLE", "DESCRIPCION");
    MRV.CargarSelect(baseUrl + "Gestion/ListarTipoVehiculo", "#tipoVehiculoI" + fila, "ID_TIPO_VEHICULO", "DESCRIPCION");
    //MRV.CargarSelect(baseUrl + "Gestion/ListarTipoFuente", "#tipoFuenteI" + fila, "ID_TIPO_FUENTE", "DESCRIPCION");
    $("#tablaIndicador").data("fila", fila);

}

function CargarTablaIndicador(datat, j) {
    var fila = $("#tablaIndicador").data("fila") + 1;
    var tr = '<tr id="detalles-tr-'+(j+1)+'" data-value="0" >';
    tr = tr + '         <td data-encabezado="Columna 01">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-columna'+fila+'-' + (j + 1) + '">';
    tr = tr + '                          <option value="2018">2018</option>';
    tr = tr + cargarAnio();
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 02">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-columna' + fila + '-' + (j + 3) + '">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 03">';
    tr = tr + '             <div class="form-group m-0">';
    tr = tr + '                     <select class="form-control form-control-sm" id="cbo-columna' + fila + '-' + (j + 4) + '">';
    tr = tr + '                          <option value="0">Seleccione</option>';
    tr = tr + '                     </select>';
    tr = tr + '            </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 04">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="Texto aquí" id="cbo-columna' + fila + '-' + (j + 5) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 05">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="Texto aquí" id="cbo-columna' + fila + '-' + (j + 6) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 06">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="Texto aquí" id="cbo-columna' + fila + '-' + (j + 7) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 07">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="Texto aquí" id="cbo-columna' + fila + '-' + (j + 8) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td data-encabezado="Columna 07">';
    tr = tr + '              <div class="form-group m-0">';
    tr = tr + '                      <input class="form-control form-control-sm" type="text" placeholder="Texto aquí" id="cbo-columna' + fila + '-' + (j + 9) + '">';
    tr = tr + '              </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td class="text-center" data-encabezado="Sustento">';
    tr = tr + '                <div class="form-group m-0">';
    tr = tr + '                       <label class="btn btn-secondary btn-sm m-0" for="fle-doc"><i class="fas fa-upload mr-1"></i>Cargar</label>';
    tr = tr + '                       <input class="d-none fil-file-control" type="file" id="fle-doc">';
    tr = tr + '                </div>';
    tr = tr + '         </td>';
    tr = tr + '         <td class="text-center text-xs-right" data-encabezado="Acciones">';
    tr = tr + '                <div class="btn-group">';
    tr = tr + '                     <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
    tr = tr + '                          <div class="dropdown-menu dropdown-menu-right">';
    tr = tr + '                                  <a class="dropdown-item agregarCampos" href="#">';
    tr = tr + '                                         <i class="fas fa-plus-circle"></i>&nbsp;Agregar';
    tr = tr + '                                  </a><a class="dropdown-item quitarCampos" href="#">';
    tr = tr + '                                         <i class="fas fa-minus-circle"></i>&nbsp;Eliminar';
    tr = tr + '                                  </a>';
    tr = tr + '                          </div>';
    tr = tr + '               </div>';
    tr = tr + '         </td>';



    /*tr = tr + '<td id="c1" style="background-color: orange;"><select class="form-control small" id="annoB' + fila + '"><option value="2018">2018</option>';
    tr = tr + '            <option value="2019" class="small">2019</option>';
    tr = tr + '            <option value="2020">2020</option>';
    tr = tr + '            <option value="2021">2021</option>';
    tr = tr + '            <option value="2022">2022</option></select></td>';
    tr = tr + '<td id="c2" style="background-color: orange;"><select id="tipoVehiculoB' + fila + '" class="form-control small"></select></td>';
    tr = tr + '<td id="c3" style="background-color: orange;"><select id="tipoCombustibleB' + fila + '" class="form-control small"></select></td>';
    tr = tr + '<td id="c4" style="background-color: orange;"><input type"text" class="form-control small" id="krvB' + fila + '"/></td>';
    tr = tr + '<td id="c5" style="background-color: orange;"><input type"text" class="form-control small" id="cantidadB' + fila + '"/></td>';
    tr = tr + '<td id="c6" style="background-color: orange;"><input type"text" class="form-control small" id="totalB' + fila + '" readonly/></td>';
    tr = tr + '<td id="c7" style="background-color: green;"><select class="form-control small" id="annoI' + fila + '"><option value="2018">2018</option>';
    tr = tr + '            <option value="2019" class="small">2019</option>';
    tr = tr + '            <option value="2020">2020</option>';
    tr = tr + '            <option value="2021">2021</option>';
    tr = tr + '            <option value="2022">2022</option></select></td>';
    tr = tr + '<td id="c8" style="background-color: green;"><select id="tipoVehiculoI' + fila + '" class="form-control small"></select></td>';
    tr = tr + '<td id="c9" style="background-color: green;"><select id="tipoFuenteI' + fila + '" class="form-control small"></select></td>';
    tr = tr + '<td id="c10" style="background-color: green;"><input type"text" class="form-control small" id="krvI' + fila + '"/></td>';
    tr = tr + '<td id="c11" style="background-color: green;"><input type"text" class="form-control small" id="cantidadI' + fila + '"/></td>';
    tr = tr + '<td id="c12" style="background-color: green;"><input type"text" class="form-control small" id="totalI' + fila + '" readonly/></td>';
    tr = tr + '<td id="c13"><input type"text" class="form-control small" id="totalR' + fila + '" readonly/></td>';
    tr = tr + '<td id="c14"><input type="file" class="form-control small" id="adjunto' + fila + '"/></td>';
    tr = tr + '<td><button class="btn btn_primary" onclick="fn_calcularIndicador(' + fila + ');">Calcular</button>';
    tr = tr + '<td><button class="btn btn_primary" onclick="fn_eliminarFila(' + fila + ');">Eliminar</button>';*/
    tr = tr + '</tr>';
    $("#cuerpoTablaIndicador").append(tr);
    //fn_CargarListaTipoVehiculo(datat, j, fila);
    $("#tablaIndicador").data("fila", fila);

}

function fn_calcularIndicador(fila) {
    var item = {
        ID_INDICADOR: $("#fila" + fila).data("value"),
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ANNOB: $("#annoB" + fila).val(),
        ID_TIPO_VEHICULOB: $("#tipoVehiculoB" + fila).val(),
        ID_TIPO_COMBUSTIBLEB: $("#tipoCombustibleB" + fila).val(),
        KRVB: $("#krvB" + fila).val(),
        CANTIDADB: $("#cantidadB" + fila).val(),
        FACTOR_RENDIMIENTO: $("#factorRendimientoB" + fila).val(),
        ID_TIPO_FUENTEI: $("#cbo-enfoque").val(),
    }
    $.ajax({
        url: baseUrl + 'Gestion/CalcularIndicador',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#totalB" + fila).val(data[i]["TOTAL_GEI_BASE"]);
                        $("#totalI" + fila).val(data[i]["TOTAL_GEI_INIMIT"]);
                        $("#totalR" + fila).val(data[i]["TOTAL_GEI_REDUCIDO"]);
                        $("#fila" + fila).data("value", data[i]["ID_INDICADOR"]);
                    }
                }
            }
        }
    });
}

function fn_procesoDetalleIndicador(url, estado) {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario"),
        ID_ESTADO: estado
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        if (estado == 0) {
            $("#mensajeModalAvance #mensajeWarningAvance").remove();
            $("#mensajeModalAvance #mensajeDangerAvance").remove();
            var msj = '                   <div class="col-sm-12 col-md-12 col-lg-12" id="mensajeWarningAvance">';
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
            msj = msj + '                                <hr><small class="mb-0">Los datos de su detalle de indicadores fueron guardados exitosamente, espere la aprobación del especialista para continuar. En breve le notificaremos el estado de su solicitud de revisión.</small>';
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
            msj = msj + '                                <hr>Ocurrio un error durante el proceso de guardado del avance.';
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
        } else {
            $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
            $("#mensajeModalAvance #mensajeDangerAvance").remove();
            $("#mensajeModalAvance #mensajeWarningAvance").remove();
        }
    });

    $("#guardar-avance").on("hidden.bs.modal", function () {
            $('#mensajeModalRegistrar #mensajeDangerRegistro').remove();
            $("#mensajeModalAvance #mensajeDangerAvance").remove();
            $("#mensajeModalAvance #mensajeWarningAvance").remove();
    });
}

function fn_guardarDetalleIndicador() {
    var url = baseUrl + "Gestion/RegistrarDetalleIndicador";
    fn_procesoDetalleIndicador(url, 1);
}

function fn_guardarAvances() {
    var url = baseUrl + "Gestion/AvanceDetalleIndicador";
    fn_procesoDetalleIndicador(url, 0);
}

function fn_corregirDetalleIndicador() {
    var url = baseUrl + "Gestion/CorregirDetIndicador";
    fn_procesoDetalleIndicador(url, 5);
}

function fn_corregirAvances() {
    var url = baseUrl + "Gestion/CorregirAvanceDetalleIndicador";
    fn_procesoDetalleIndicador(url, 0);
}

function fn_observacionDetalleIndicador() {
    url = baseUrl + "Gestion/ObservacionDetalleIndicador"
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario"),
        DESCRIPCION: $("#txa-observacion-detalle").val(),
        ID_ESTADO: $("#cbo-tipo-observacion").val()
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalRevision #modalErrorRevision").remove();
        $("#modalRevision #modalCorrectoRevision").remove();
        var msj = '                           <div class="alert alert-success d-flex align-items-stretch" role="alert" id="modalCorrectoRevision">';
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
        } else {
            $("#modalRevision #modalErrorRevision").remove();
        }
    });
}

function fn_revisarDetalleIndicador() {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario")
    }
    url = baseUrl + "Gestion/AprobarDetalleIndicador";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalAprobacion #modalCorrectoAprobacion").remove();
        $("#modalAprobacion #modalErrorAprobacion").remove();
        $("#aprobar-revision #modalAprobarBoton").remove();
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
        msj = msj + '                                    <h6>Bien hecho</h6';
        msj = msj + '                                    <hr><small class="mb-0">Se aprobó correctamente esta revisión, se procederá a notificar al Usuario Administrado.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalAprobacion").append(msj);
        $("#Control").data("modal", 1);
    } else {
        $("#modalAprobacion #modalErrorAprobacion").remove();
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

    $("#aprobar-revision").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
        } else {
            $("#modalAprobacion #modalErrorAprobacion").remove();
        }
    });
}


function fn_revisarAdminDetalleIndicador() {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario")
    }
    url = baseUrl + "Gestion/AprobarAdminIniciativaDetalleIndicador";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalAprobacion #modalCorrectoAprobacion").remove();
        $("#modalAprobacion #modalErrorAprobacion").remove();
        $("#aprobar-revision #modalAprobarBoton").remove();
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
        msj = msj + '                                    <h6>Bien hecho</h6';
        msj = msj + '                                    <hr><small class="mb-0">Se aprobó correctamente esta revisión, se procederá a notificar al especialista.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalAprobacion").append(msj);
        $("#Control").data("modal", 1);
    } else {
        $("#modalAprobacion #modalErrorAprobacion").remove();
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

    $("#aprobar-revision").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
        } else {
            $("#modalAprobacion #modalErrorAprobacion").remove();
        }
    });
}

function fn_evaluarIniciativaDetalle() {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario")
    }
    url = baseUrl + "Gestion/EvaluarIniciativaDetalleIndicador";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalAprobacion #modalCorrectoAprobacion").remove();
        $("#modalAprobacion #modalErrorAprobacion").remove();
        $("#aprobar-revision #modalAprobarBoton").remove();
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
        msj = msj + '                                    <h6>Bien hecho</h6';
        msj = msj + '                                    <hr><small class="mb-0">Se aprobó correctamente esta evaluación, se procederá a notificar al Especialista.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalAprobacion").append(msj);
        $("#Control").data("modal", 1);
    } else {
        $("#modalAprobacion #modalErrorAprobacion").remove();
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

    $("#aprobar-evaluacion").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
        } else {
            $("#modalAprobacion #modalErrorAprobacion").remove();
        }
    });
}

function fn_verificarIniciativaDetalle() {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ID_USUARIO: $("#Control").data("usuario")
    }
    url = baseUrl + "Gestion/VerificarIniciativaDetalleIndicador";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        $("#modalAprobacion #modalCorrectoAprobacion").remove();
        $("#modalAprobacion #modalErrorAprobacion").remove();
        $("#aprobar-revision #modalAprobarBoton").remove();
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
        msj = msj + '                                    <h6>Bien hecho</h6';
        msj = msj + '                                    <hr><small class="mb-0">Se aprobó correctamente esta verificación, se procederá a notificar al Especialista.</small>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        $("#modalAprobacion").append(msj);
        $("#Control").data("modal", 1);
    } else {
        $("#modalAprobacion #modalErrorAprobacion").remove();
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

    $("#aprobar-evaluacion").on("hidden.bs.modal", function () {
        if ($("#Control").data("modal") == 1) {
            location.href = baseUrl + "Gestion/AccionMitigacion";
        } else {
            $("#modalAprobacion #modalErrorAprobacion").remove();
        }
    });
}



