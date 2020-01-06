$(document).ready(function () {
    CargarListaUbicacion();
});

function CargarListaUbicacion() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Publico/Portal/ListarUbicacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#tablaUbicacion").html("");
                    for (var i = 0; i < data.length; i++) {
                        var tr = '<tr>';
                        //tr = tr + '<th class="text-center" scope="row">' + (1 + i) + '</th>';
                        tr = tr + '<td>' + data[i]["ID_UBICACION"] + '</td>';
                        tr = tr + '<td>' + data[i]["DESCRIPCION"] + '</td>';
                        tr = tr + '<td><button class="btn btn-primary" onclick="fn_seleccionarUbicacion(' + data[i]["ID_UBICACION"] + ');" data-toggle="modal" data-target="#exampleModalLong">Editar</button></td>';
                        tr = tr + '<td><button class="btn btn-danger" onclick="fn_eliminarUbicacion(' + data[i]["ID_UBICACION"] + ');">Eliminar</button></td>';
                        tr = tr + '</tr>';
                        $("#tablaUbicacion").append(tr)
                    }
                }
            }
        }
    });
}

function fn_seleccionarUbicacion(idUbicacion) {
    var Item = {
        ID_UBICACION: idUbicacion
    };
    $.ajax({
        url: baseUrl + "Publico/Portal/ObtenerUbicacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#editarDescripcion").val(data[i]["DESCRIPCION"]);
                        $("#editarIdUbicacion").data('value', data[i]["ID_UBICACION"]);
                    }
                }
            }
        }
    });
}

function fn_editarUbicacion() {
    var url = baseUrl + "Publico/Portal/EditarUbicacion";
    //alert($("#editarIdNama").data("value") + " " + $("#editarDescripcionNama").val());
    var item = {
        ID_UBICACION: $("#editarIdUbicacion").data("value"),
        DESCRIPCION: $("#editarDescripcion").val(),
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


        CargarListaUbicacion();   /*actualizar registro luego de eliminar o cambio*/

    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la actualizacion'
        })
    }

}


function fn_eliminarUbicacion(idUbicacion) {
    var url = baseUrl + "Publico/Portal/EliminarUbicacion";
    //alert($("#editarIdNama").data("value") + " " + $("#editarDescripcionNama").val());
    var item = {
        ID_UBICACION: idUbicacion
        
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
        CargarListaUbicacion();

    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la acción de eliminar'
        })
    }
}