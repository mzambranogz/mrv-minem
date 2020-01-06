$(document).ready(function () {
    CargarListaSectorInstitucion();
});

function CargarListaSectorInstitucion() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Publico/Portal/ListarSectorInstitucion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#tablaSectorInstitucion").html("");
                    for (var i = 0; i < data.length; i++) {
                        var tr = '<tr>';
                        //tr = tr + '<th class="text-center" scope="row">' + (1 + i) + '</th>';
                        tr = tr + '<td>' + data[i]["ID_SECTOR_INST"] + '</td>';
                        tr = tr + '<td>' + data[i]["DESCRIPCION"] + '</td>';
                        tr = tr + '<td><button class="btn btn-primary" onclick="fn_seleccionarSectorInstitucion(' + data[i]["ID_SECTOR_INST"] + ');" data-toggle="modal" data-target="#exampleModalLong" >Editar</button></td>';
                        tr = tr + '<td><button class="btn btn-danger" onclick="fn_eliminarSectorInstitucion(' + data[i]["ID_SECTOR_INST"] + ');">Eliminar</button></td>';
                        tr = tr + '</tr>';
                        $("#tablaSectorInstitucion").append(tr)
                    }
                }
            }
        }
    });
}

function fn_seleccionarSectorInstitucion(idSectorInstitucion) {
    var Item = {
        ID_SECTOR_INST: idSectorInstitucion
    };
    $.ajax({
        url: baseUrl + "Publico/Portal/ObtenerSectorInstitucion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#editarDescripcion").val(data[i]["DESCRIPCION"]);
                        $("#editarIdSectorInstitucion").data('value', data[i]["ID_SECTOR_INST"]);
                    }
                }
            }
        }
    });
}

function fn_editarSectorInstitucion() {
    var url = baseUrl + "Publico/Portal/EditarSectorInstitucion";
    //alert($("#editarIdNama").data("value") + " " + $("#editarDescripcionNama").val());
    var item = {
        ID_SECTOR_INST: $("#editarIdSectorInstitucion").data("value"),
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


        CargarListaSectorInstitucion();   /*actualizar registro luego de eliminar o cambio*/

    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la actualizacion'
        })
    }

}


function fn_eliminarSectorInstitucion(idSectorInstitucion) {
    var url = baseUrl + "Publico/Portal/EliminarSectorInstitucion";
    //alert($("#editarIdNama").data("value") + " " + $("#editarDescripcionNama").val());
    var item = {
        ID_SECTOR_INST: idSectorInstitucion

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
        CargarListaSectorInstitucion();

    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la acción de eliminar'
        })
    }
}