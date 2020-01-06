$(document).ready(function () {
    CargarListaRol();
});

function CargarListaRol() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Publico/Portal/ListarRol",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#tablaRol").html("");
                    for (var i = 0; i < data.length; i++) {
                        var tr = '<tr>';
                        //tr = tr + '<th class="text-center" scope="row">' + (1 + i) + '</th>';
                        tr = tr + '<td>' + data[i]["ID_ROL"] + '</td>';
                        tr = tr + '<td>' + data[i]["DESCRIPCION_ROL"] + '</td>';
                        tr = tr + '<td><button class="btn btn-primary" onclick="fn_seleccionarRol(' + data[i]["ID_ROL"] + ');" data-toggle="modal" data-target="#exampleModalLong">Editar</button></td>';
                        tr = tr + '<td><button class="btn btn-danger" onclick="fn_eliminarRol(' + data[i]["ID_ROL"] + ');">Eliminar</button></td>';
                        tr = tr + '</tr>';
                        $("#tablaRol").append(tr)
                    }
                }
            }
        }
    });
}

function fn_seleccionarRol(idRol) {
    var Item = {
        ID_ROL: idRol
    };
    $.ajax({
        url: baseUrl + "Publico/Portal/ObtenerRol",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#editarDescripcionRol").val(data[i]["DESCRIPCION_ROL"]);
                        $("#editarIdRol").data('value', data[i]["ID_ROL"]);
                    }
                }
            }
        }
    });
}

function fn_editarRol() {
    var url = baseUrl + "Publico/Portal/EditarRol";
    //alert($("#editarIdNama").data("value") + " " + $("#editarDescripcionNama").val());
    var item = {
        ID_ROL: $("#editarIdRol").data("value"),
        DESCRIPCION_ROL: $("#editarDescripcionRol").val(),
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


        CargarListaRol();   /*actualizar registro luego de eliminar o cambio*/

    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la actualizacion'
        })
    }

}


function fn_eliminarRol(idRol) {
    var url = baseUrl + "Publico/Portal/EliminarRol";
    //alert($("#editarIdNama").data("value") + " " + $("#editarDescripcionNama").val());
    var item = {
        ID_ROL: idRol

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
        CargarListaRol();

    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la acción de eliminar'
        })
    }
}