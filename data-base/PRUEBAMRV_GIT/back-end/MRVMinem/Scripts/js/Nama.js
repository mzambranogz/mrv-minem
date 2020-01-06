
$(document).ready(function () {
    CargarListaNama();
});

function CargarListaNama() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Publico/Portal/ListarNama",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#tablaNama").html("");
                    for (var i = 0; i < data.length; i++) {
                        var tr = '<tr>';
                        //tr = tr + '<th class="text-center" scope="row">' + (1 + i) + '</th>';
                        tr = tr + '<td>' + data[i]["ID_NAMA"] + '</td>';
                        tr = tr + '<td>' + data[i]["DESCRIPCION_NAMA"] + '</td>';
                        tr = tr + '<td><button class="btn btn-primary" onclick="fn_seleccionarNama(' + data[i]["ID_NAMA"] + ');" data-toggle="modal" data-target="#exampleModalLong" >Editar</button></td>';
                        tr = tr + '<td><button class="btn btn-danger" onclick="fn_eliminarNama(' + data[i]["ID_NAMA"] + ');">Eliminar</button></td>';
                        tr = tr + '</tr>';
                        $("#tablaNama").append(tr)
                    }
                }
            }
        }
    });
}

function fn_seleccionarNama(idNama) {
    var Item = {
        ID_NAMA: idNama
    };
    $.ajax({
        url: baseUrl + "Publico/Portal/ObtenerNama",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            $("#editarDescripcionNama").val(data[i]["DESCRIPCION_NAMA"]);
                            $("#editarIdNama").data('value',data[i]["ID_NAMA"]);
                        }                    
                    }
                }
            }
    });
}

function fn_editarNama() {
    var url = baseUrl + "Publico/Portal/EditarNama";
    //alert($("#editarIdNama").data("value") + " " + $("#editarDescripcionNama").val());
    var item = {
        ID_NAMA: $("#editarIdNama").data("value"),
        DESCRIPCION_NAMA: $("#editarDescripcionNama").val(),
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


        CargarListaNama();

    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la actualizacion'
        })
    }

}



function fn_eliminarNama(idNama) {
    var url = baseUrl + "Publico/Portal/EliminarNama";
    //alert($("#editarIdNama").data("value") + " " + $("#editarDescripcionNama").val());
    var item = {
        ID_NAMA: idNama

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
        CargarListaNama();

    } else {
        Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la acción de eliminar'
        })
    }
}