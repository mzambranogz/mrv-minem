$(document).ready(function () {
    CargarListaMedidaMitigacion();
});

function CargarListaMedidaMitigacion() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Publico/Portal/ListarMedidaMitigacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#tablaMedidaMitigacion").html("");
                    for (var i = 0; i < data.length; i++) {
                        var tr = '<tr>';
                        //tr = tr + '<th class="text-center" scope="row">' + (1 + i) + '</th>';
                        tr = tr + '<td>' + data[i]["ID_MEDMIT"] + '</td>';
                        tr = tr + '<td>' + data[i]["NUMERO_MEDMIT"] + '</td>';
                        tr = tr + '<td>' + data[i]["NOMBRE_MEDMIT"] + '</td>';
                        tr = tr + '<td>' + data[i]["DESCRIPCION_MEDMIT"] + '</td>';
                        tr = tr + '<td>' + data[i]["NAMA"] + '</td>';
                        tr = tr + '<td>' + data[i]["NUMERO_MEDMIT"] + '</td>';
                        tr = tr + '<td>' + data[i]["OBJETIVO_MEDMIT"] + '</td>';
                        tr = tr + '<td>' + data[i]["IPSC_MEDMIT"] + '</td>';
                        tr = tr + '<td><button class="btn btn-primary" onclick="fn_seleccionarMedidaMitigacion(' + data[i]["ID_MEDMIT"] + ');" data-toggle="modal" data-target="#exampleModalLong">Editar</button></td>';
                        tr = tr + '<td><button class="btn btn-danger" onclick="fn_eliminarMedidaMitigacion(' + data[i]["ID_MEDMIT"] + ');">Eliminar</button></td>';
                        tr = tr + '</tr>';
                        $("#tablaMedidaMitigacion").append(tr)
                    }
                }
            }
        }
    });
}

function fn_seleccionarMedidaMitigacion(idMedMit) {
    var Item = {
        ID_MEDMIT: idMedMit
    };
    $.ajax({
        url: baseUrl + "Publico/Portal/ObtenerMedidaMitigacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#editarIpscMedmit").val(data[i]["IPSC_MEDMIT"]);
                        $("#editarObjetivoMedmit").val(data[i]["OBJETIVO_MEDMIT"]);
                        $("#editarNama").val(data[i]["NAMA"]);
                        $("#editarDescripcionMedmit").val(data[i]["DESCRIPCION_MEDMIT"]);
                        $("#editarNombreMedmit").val(data[i]["NOMBRE_MEDMIT"]);
                        $("#editarNumeroMedmit").val(data[i]["NUMERO_MEDMIT"]);
                        $("#editarIdMedmit").data('value', data[i]["ID_MEDMIT"]);
                    }
                }
            }
        }
    });
}

function fn_editarMedidaMitigacion() {
    var url = baseUrl + "Publico/Portal/EditarMedidaMitigacion";
    //alert($("#editarIdNama").data("value") + " " + $("#editarDescripcionNama").val());
    var item = {
        ID_MEDMIT: $("#editarIdMedmit").data("value"),
        NUMERO_MEDMIT: $("#editarNumeroMedmit").data("value"),
        NOMBRE_MEDMIT: $("#editarNombreMedmit").data("value"),
        DESCRIPCION_MEDMIT: $("#editarDescripcionMedmit").data("value"),
        NAMA: $("#editarNama").data("value"),
        OBJETIVO_MEDMIT: $("#editarObjetivoMedmit").data("value"),
        IPSC_MEDMIT: $("#editarIpscMedmit").data("value"),
       
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {

        Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Actualizado con exito',
            showConfirmButton: false,
            timer: 1700
        })


        CargarListaMedidaMitigacion();   /*actualizar registro luego de eliminar o cambio*/

    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la actualizacion'
        })
    }

}


function fn_eliminarMedidaMitigacion(idMedidaMitigacion) {
    var url = baseUrl + "Publico/Portal/EliminarMedidaMitigacion";
    //alert($("#editarIdNama").data("value") + " " + $("#editarDescripcionNama").val());
    var item = {
        ID_MEDMIT: idMedMit

    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {

        Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Eliminado con exito',
            showConfirmButton: false,
            timer: 1700
        })
        CargarListaMedidaMitigacion();

    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la acción de eliminar'
        })
    }
}