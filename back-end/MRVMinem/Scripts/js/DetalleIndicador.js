$(document).ready(function () {
    $('html, body').animate({ scrollTop: scroll }, 1000);
    CargarDetalleIndicador();

    //CargarTablaIndicador();
    //CargarEnfoque();
});

function CargarDetalleIndicador() {
    var item = {
        ID_INICIATIVA: $("#Control").data("iniciativa")
    }
    $.ajax({
        url: baseUrl + 'Administrado/Gestion/ListarDetalleIndicador',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        CargarTablaIndicador(data, i);
                        //var fila = $("#tablaIndicador").data("fila");
                        //setTimeout(llenarTabla(fila, data, i), 20000);
                        /*var fila = $("#tablaIndicador").data("fila");
                        $("#annoB" + fila).val(data[i]["ANNO_BASE"]);
                        $("#tipoVehiculoB" + fila).val(data[i]["ID_TIPO_VEHICULO_BASE"]);
                        $("#tipoCombustibleB" + fila).val(data[i]["ID_TIPO_COMBUSTIBLE_BASE"]);
                        $("#krvB" + fila).val(data[i]["KRV_BASE"]);
                        $("#cantidadB" + fila).val(data[i]["CANT_BASE"]);
                        $("#totalB" + fila).val(data[i]["TOTAL_GEI_BASE"]);
                        $("#annoI" + fila).val(data[i]["ANNO_INIMIT"]);
                        $("#tipoVehiculoI" + fila).val(data[i]["ID_TIPO_VEHICULO_INIMIT"]);
                        $("#tipoFuenteI" + fila).val(data[i]["ID_TIPO_FUENTE_INIMIT"]);
                        $("#krvI" + fila).val(data[i]["KRV_INIMIT"]);
                        $("#cantidadI" + fila).val(data[i]["CANT_INIMIT"]);
                        $("#totalI" + fila).val(data[i]["TOTAL_GEI_INIMIT"]);
                        $("#totalR" + fila).val(data[i]["TOTAL_GEI_REDUCIDO"]);
                        $("#fila" + fila).data("value", data[i]["ID_INDICADOR"]);*/
                    }
                    /*var fila = $("#tablaIndicador").data("fila");
                    for (var i = 0; i < fila; i++) {
                        $("#annoB" + (i + 1)).val(data[i]["ANNO_BASE"]);
                        $("#tipoVehiculoB" + (i + 1)).val(data[i]["ID_TIPO_VEHICULO_BASE"]);
                        $("#tipoCombustibleB" + (i + 1)).val(data[i]["ID_TIPO_COMBUSTIBLE_BASE"]);
                        $("#krvB" + (i + 1)).val(data[i]["KRV_BASE"]);
                        $("#cantidadB" + (i + 1)).val(data[i]["CANT_BASE"]);
                        $("#totalB" + (i + 1)).val(data[i]["TOTAL_GEI_BASE"]);
                        $("#annoI" + (i + 1)).val(data[i]["ANNO_INIMIT"]);
                        $("#tipoVehiculoI" + (i + 1)).val(data[i]["ID_TIPO_VEHICULO_INIMIT"]);
                        $("#tipoFuenteI" + (i + 1)).val(data[i]["ID_TIPO_FUENTE_INIMIT"]);
                        $("#krvI" + (i + 1)).val(data[i]["KRV_INIMIT"]);
                        $("#cantidadI" + (i + 1)).val(data[i]["CANT_INIMIT"]);
                        $("#totalI" + (i + 1)).val(data[i]["TOTAL_GEI_INIMIT"]);
                        $("#totalR" + (i + 1)).val(data[i]["TOTAL_GEI_REDUCIDO"]);
                        $("#fila" + (i + 1)).data("value", data[i]["ID_INDICADOR"]);
                    }*/
                }
            }
            CargarSoloTablaIndicador();
        }
    });

}

function llenarTabla(fila, data, i) {
    $("#annoB" + fila).val(data[i]["ANNO_BASE"]);
    $("#tipoVehiculoB" + fila).val(data[i]["ID_TIPO_VEHICULO_BASE"]);
    //alert(data[i]["ID_TIPO_COMBUSTIBLE_BASE"]);
    $("#tipoCombustibleB" + fila).val(data[i]["ID_TIPO_COMBUSTIBLE_BASE"]);
    $("#krvB" + fila).val(data[i]["KRV_BASE"]);
    $("#cantidadB" + fila).val(data[i]["CANT_BASE"]);
    $("#totalB" + fila).val(data[i]["TOTAL_GEI_BASE"]);
    $("#annoI" + fila).val(data[i]["ANNO_INIMIT"]);
    $("#tipoVehiculoI" + fila).val(data[i]["ID_TIPO_VEHICULO_INIMIT"]);
    $("#tipoFuenteI" + fila).val(data[i]["ID_TIPO_FUENTE_INIMIT"]);
    $("#krvI" + fila).val(data[i]["KRV_INIMIT"]);
    $("#cantidadI" + fila).val(data[i]["CANT_INIMIT"]);
    $("#totalI" + fila).val(data[i]["TOTAL_GEI_INIMIT"]);
    $("#totalR" + fila).val(data[i]["TOTAL_GEI_REDUCIDO"]);
    $("#fila" + fila).data("value", data[i]["ID_INDICADOR"]);
}

function CargarSoloTablaIndicador() {
    var fila = $("#tablaIndicador").data("fila") + 1;
    var tr = '<tr id="fila' + fila + '" data-value="0">';
    tr = tr + '<td id="c1" style="background-color: orange;"><select class="form-control small" id="annoB' + fila + '"><option value="2018">2018</option>';
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
    tr = tr + '<td><button class="btn btn_primary" onclick="fn_eliminarFila(' + fila + ');">Eliminar</button>';
    tr = tr + '</tr>';
    $("#cuerpoTablaIndicador").append(tr);
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoVehiculo", "#tipoVehiculoB" + fila, "ID_TIPO_VEHICULO", "DESCRIPCION");
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoCombustible", "#tipoCombustibleB" + fila, "ID_TIPO_COMBUSTIBLE", "DESCRIPCION");
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoVehiculo", "#tipoVehiculoI" + fila, "ID_TIPO_VEHICULO", "DESCRIPCION");
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoFuente", "#tipoFuenteI" + fila, "ID_TIPO_FUENTE", "DESCRIPCION");
    $("#tablaIndicador").data("fila", fila);
}

function CargarTablaIndicador(datat, j) {
    //$("#cuerpoTablaIndicador").html("");
    var fila = $("#tablaIndicador").data("fila") + 1;
    var tr = '<tr id="fila' + fila + '" data-value="0" >';
    tr = tr + '<td id="c1" style="background-color: orange;"><select class="form-control small" id="annoB' + fila + '"><option value="2018">2018</option>';
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
    tr = tr + '<td><button class="btn btn_primary" onclick="fn_eliminarFila(' + fila + ');">Eliminar</button>';
    tr = tr + '</tr>';
    $("#cuerpoTablaIndicador").append(tr);
    //alert("J:" + j + "Valor: " + datat[j]["ID_TIPO_COMBUSTIBLE_BASE"]);
    fn_CargarListaTipoVehiculo(datat, j, fila);
    //MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoVehiculo", "#tipoVehiculoB" + fila, "ID_TIPO_VEHICULO", "DESCRIPCION");
    //MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoCombustible", "#tipoCombustibleB" + fila, "ID_TIPO_COMBUSTIBLE", "DESCRIPCION");
    //MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoVehiculo", "#tipoVehiculoI" + fila, "ID_TIPO_VEHICULO", "DESCRIPCION");
    //MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoFuente", "#tipoFuenteI" + fila, "ID_TIPO_FUENTE", "DESCRIPCION");
    $("#tablaIndicador").data("fila", fila);

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
        //alert("J:" + j + "Valor: " + datat[j]["ID_TIPO_COMBUSTIBLE_BASE"]);
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
        //alert("J:" + j + "Valor: " + datat[j]["ID_TIPO_COMBUSTIBLE_BASE"]);
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
        llenarTabla(fila, datat, j);
    });
}

function fn_eliminarFila(fila) {
    //alert(fila + ' ' + $("#fila" + fila).data("value"));
    if ($("#fila" + fila).data("value") == 0) {
        $("#fila" + fila).remove();
    } else {
        Swal.fire({
            title: '¿Desea eliminar el Indicador?',
            text: "¡Este indicador esta registrado!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.value) {
                fn_eliminarIndicador(fila);
            }
        })
    }

}

function fn_eliminarIndicador(fila) {
    var item = {
        ID_INDICADOR: $("#fila" + fila).data("value")
    }
    url = baseUrl + 'Administrado/Gestion/EliminarIndicador';
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '¡Se eliminó correctamente!',
            showConfirmButton: false,
            timer: 1700
        })
        $("#cuerpoTablaIndicador").html("");
        CargarDetalleIndicador();
    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la eliminación del Indicador'
        })
    }
}

function fn_calcularIndicador(fila) {
    //alert($("#cantidadI").val());
    var item = {
        ID_INDICADOR: $("#fila" + fila).data("value"),
        ID_INICIATIVA: $("#Control").data("iniciativa"),
        ANNOB: $("#annoB" + fila).val(),
        ID_TIPO_VEHICULOB: $("#tipoVehiculoB" + fila).val(),
        ID_TIPO_COMBUSTIBLEB: $("#tipoCombustibleB" + fila).val(),
        KRVB: $("#krvB" + fila).val(),
        CANTIDADB: $("#cantidadB" + fila).val(),
        //TOTALB: $("#TotalB").val(),
        ANNOI: $("#annoB" + fila).val(),
        ID_TIPO_VEHICULOI: $("#tipoVehiculoI" + fila).val(),
        ID_TIPO_FUENTEI: $("#tipoFuenteI" + fila).val(),
        KRVI: $("#krvI" + fila).val(),
        CANTIDADI: $("#cantidadI" + fila).val()
        //TOTALB: $("#TotalI").val(),
    }
    $.ajax({
        url: baseUrl + 'Administrado/Gestion/CalcularIndicador',
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
                        //alert(data[i]["ID_INDICADOR"]);
                        $("#fila" + fila).data("value", data[i]["ID_INDICADOR"]);
                    }
                }
            }
        }
    });
}

function CargarEnfoque() {
    //MRV.CargarSelect(baseUrl + 'Administrado/Gestion/ListarEnfoque', "#enfoqueIndicador", "ID_ENFOQUE", "DESCRIPCION");
    var Item = {
        ID_MEDMIT: 12
    };
    $.ajax({
        url: baseUrl + 'Administrado/Gestion/ListarEnfoque',
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#enfoqueIndicador").append('<option value="' + data[i]["ID_ENFOQUE"] + '">' + data[i]["DESCRIPCION"] + '</option>');
                    }
                }
            }
        }
    });
}

function fn_agregarFilaIndicador() {
    //alert($("#tablaIndicador").data("fila"));
    CargarTablaIndicador();
}

function seleccionarEnfoque() {
    var Item = {
        ID_ENFOQUE: $("#enfoqueIndicador").val()
    };
    $.ajax({
        url: baseUrl + 'Administrado/Gestion/ListarTablaIndicador',
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#cabeceraTablaIndicador").html("");
                    var tr = '<tr>';
                    for (var i = 0; i < data.length; i++) {
                        tr = tr + '<th>' + data[i]["DESCRIPCION"] + '</th>';
                    }
                    tr = tr + '</tr>';
                    $("#cabeceraTablaIndicador").append(tr);
                }
                if (data.length > 0) {
                    $("#cuerpoTablaIndicador").html("");
                    var tr = '<tr>';
                    for (var i = 0; i < data.length; i++) {
                        if (data[i]["TIPO"] == 'V') {
                            tr = tr + '<td><input type"text" class="form-control" id="' + data[i]["SIGLA"] + '"/></td>';
                        } else if (data[i]["TIPO"] == 'VR') {
                            tr = tr + '<td><select class="form-control" id="' + data[i]["SIGLA"] + '"></select></td>';
                        }
                    }
                    tr = tr + '</tr>';
                    $("#cuerpoTablaIndicador").append(tr);
                }
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        if (data[i]["TIPO"] == 'V') {
                            tr = tr + '<td><input type"text" class="form-control" id="' + data[i]["SIGLA"] + '"/></td>';
                        } else if (data[i]["TIPO"] == 'VR') {
                            var item = {
                                ID: data[i]["ID"]
                            }
                            //alert('"#' + data[i]["SIGLA"]+'"');
                            //var cad = "#" + data[i]['SIGLA'];
                            MRV.CargarSelectItem(baseUrl + "Administrado/Gestion/ListarVarianteTabla", "#" + data[i]['SIGLA'], "ID_VARIANTE_ATRIBUTO", "ATRIBUTO", item);
                        }
                    }
                }


                //MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoVehiculo", "#tipoVehiculo", "ID_TIPO_VEHICULO", "DESCRIPCION");
                //MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoCombustible", "#tipoCombustible", "ID_TIPO_COMBUSTIBLE", "DESCRIPCION");
                //MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoFuente", "#tipoFuente", "ID_TIPO_FUENTE", "DESCRIPCION");

            }
        }
    });
}


function fn_evaluarIndicador() {
    var item = {
        ID_INDICADOR: $("#Control").data("iniciativa")
    }
    url = baseUrl + 'Administrado/Gestion/EvaluarIndicador';
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        /*Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Se envió ex',
            showConfirmButton: false,
            timer: 1700
        })*/

    } else {
        /*Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la eliminación del Indicador'
        })*/
    }
}



//antes
/*$(document).ready(function () {
    CargarTablaIndicador();
});

function CargarTablaIndicador() {
                    $("#cuerpoTablaIndicador").html("");
                        var tr = '<tr>';
                        tr = tr + '<td id="c1"><select id="tipoVehiculo" class="form-control"></select></td>';
                        tr = tr + '<td id="c2"><input type"text" class="form-control" id="tCantidad"/></td>';
                        tr = tr + '<td id="c3"><select id="tipoCombustible" class="form-control"></select></td>';
                        tr = tr + '<td id="c4"><input type"text" class="form-control" id="krvN"/></td>';
                        tr = tr + '<td id="c5"><select id="tipoFuente" class="form-control"></select></td>';
                        tr = tr + '<td id="c6"><input type"text" class="form-control" id ="krvH"/></td>';
                        tr = tr + '<td id="c7"><select class="form-control" id="anno"><option value="2018">2018</option>';
                        tr = tr + '            <option value="2019">2019</option>';
                        tr = tr + '            <option value="2020">2020</option>';
                        tr = tr + '            <option value="2021">2021</option>';
                        tr = tr + '            <option value="2022">2022</option></select></td>';
                        tr = tr + '</tr>';
                        $("#cuerpoTablaIndicador").append(tr);
                        //alert("hola");
                        MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoVehiculo", "#tipoVehiculo", "ID_TIPO_VEHICULO", "DESCRIPCION");
                        MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoCombustible", "#tipoCombustible", "ID_TIPO_COMBUSTIBLE", "DESCRIPCION");
                        MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoFuente", "#tipoFuente", "ID_TIPO_FUENTE", "DESCRIPCION");

}*/

