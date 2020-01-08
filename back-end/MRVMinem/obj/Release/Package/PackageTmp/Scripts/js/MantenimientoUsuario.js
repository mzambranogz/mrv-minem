$(document).ready(function () {
    CargarTablaMantenimiento();
    MRV.CargarSelect(baseUrl + "Publico/Portal/ListaSectorInstitucion", "#sectorMantenimiento", "ID_SECTOR_INST", "DESCRIPCION");
    fn_cargarRol();
    fn_modalInicio();
});

function fn_modalInicio() {
    $("#ventanaEditar").show();
    $("#cabeceraRegistrarMantenimientoUsuario").show();
    $("#cabeceraEditarMantenimientoUsuario").show();
    $("#errorEditarMantenimientoUsuario").hide();
    $("#errorRegistrarMantenimientoUsuario").hide();
    $("#correctoMantenimientoUsuario").hide();
    $("#mensajeRegistroMantenimientoUsuario").show();
    $("#pieMantenimientoUsuario").show();
}

function CargarTablaMantenimiento() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Administrado/Gestion/ListaMantenimientoUsuario",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#cuerpoMantenimientoUsuario").html("");
                    for (var i = 0; i < data.length; i++) {
                        var colorEstado = "";
                        var colorRol = 0;
                        if (data[i]["ID_ESTADO_USUARIO"] == 0) {
                            colorEstado = 'por-aprobar';
                        } else if (data[i]["ID_ESTADO_USUARIO"] == 1) {
                            colorEstado = 'aprobado';
                        } else if (data[i]["ID_ESTADO_USUARIO"] == 2) {
                            colorEstado = 'desaprobado';
                        }
                        if (data[i]["ID_ROL"] == 1) {
                            colorRol = 2;
                        } else if (data[i]["ID_ROL"] == 2) {
                            colorRol = 3;
                        } else if (data[i]["ID_ROL"] == 3) {
                            colorRol = 6;
                        } else if (data[i]["ID_ROL"] == 4) {
                            colorRol = 4;
                        } else if (data[i]["ID_ROL"] == 5) {
                            colorRol = 5;
                        }
                        var tr = '<tr>';
                        tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + (1 + i) + '</th>';
                        tr = tr + '<td data-encabezado="Nombre y Apellido">' + data[i]["NOMBRES"] + '</td>';
                        tr = tr + '<td data-encabezado="Email">' + data[i]["CORREO"] + '</td>';
                        tr = tr + '<td data-encabezado="Istitución">' + data[i]["INSTITUCION"] + '</td>';
                        tr = tr + '<td data-encabezado="Dirección">' + data[i]["DIRECCION"] + '</td>';
                        tr = tr + '<td data-encabezado="Perfil">';
                        tr = tr + '     <span class="badge badge-actor-0' + colorRol + '">' + data[i]["ROL"] + '</span>';
                        tr = tr + '</td>';
                        tr = tr + '<td data-encabezado="Estado">';
                        tr = tr + '     <span class="badge badge-actor-' + colorEstado + '"><i class="fas fa-question-circle mr-1"></i>' + data[i]["ESTADO"] + '</span>';
                        tr = tr + '</td>';
                        tr = tr + '<td class="text-center text-xs-right" data-encabezado="Acciones">';
                        tr = tr + '     <div class="btn-group">';
                        tr = tr + '         <div class="acciones fase-01 dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></div>';
                        tr = tr + '         <div class="dropdown-menu dropdown-menu-right">';
                        tr = tr + '             <a class="dropdown-item" href="#" onclick="fn_cargarDatosUserMantenimiento(' + data[i]["ID_USUARIO"] + ');" data-toggle="modal" data-target="#modal-usuario">';
                        tr = tr + '                 <i class="fas fa-edit"></i>&nbsp;Editar';
                        tr = tr + '             </a><a class="dropdown-item" href="#" data-toggle="modal" data-target="#modal-confirmacion">';
                        tr = tr + '                 <i class="fas fa-trash"></i>&nbsp;Eliminar';
                        tr = tr + '             </a>';
                        tr = tr + '         </div>';
                        tr = tr + "     </div></td>";
                        tr = tr + '</tr>';
                        $("#cuerpoMantenimientoUsuario").append(tr)
                    }
                }
            }
        }
    });
}


function fn_seleccionarMantenimientoUsuario(id) {
    var Item = {
        ID_USUARIO: id
    };
    $.ajax({
        url: baseUrl + "Administrado/Gestion/SeleccionarMantenimientoUsuario",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#userMantenimiento").data("value", data[i]["ID_USUARIO"]);
                        $("#emailMantenimiento").val(data[i]["EMAIL_USUARIO"]);
                        $("#nombreMantenimiento").val(data[i]["NOMBRES_USUARIO"]);
                        $("#apellidoMantenimiento").val(data[i]["APELLIDOS_USUARIO"]);
                        $("#telefonoMantenimiento").val(data[i]["TELEFONO_USUARIO"]);
                        $("#celularMantenimiento").val(data[i]["CELULAR_USUARIO"]);
                        $("#anexoMantenimiento").val(data[i]["ANEXO_USUARIO"]);
                        $("#institucionMantenimiento").val(data[i]["INSTITUCION"]);
                        $("#direccionMantenimiento").val(data[i]["DIRECCION"]);
                        $("#rucMantenimiento").val(data[i]["RUC"]);
                        $("#sectorMantenimiento").val(data[i]["ID_SECTOR_INST"]);
                        $("#perfilMantenimiento").val(data[i]["ID_ROL"]);
                        if (data[i]["ID_ESTADO_USUARIO"] == 1) {
                            $("#estado1").prop("checked", true);
                        } else if (data[i]["ID_ESTADO_USUARIO"] == 2) {
                            $("#estado2").prop("checked", true);
                        }
                    }
                }
            }
        }
    });
}

function fn_nuevoMantenimientoUsuario() {
    $("#cabeceraEditarMantenimientoUsuario").hide();
}

function fn_editarMantenimiento() {
    var estado = 0;
    //alert("entre");
    for (var i = 0; i < 2 ; i++) {
        if ($('#estado' + (i + 1)).prop('checked')) {
            estado = $('#estado' + (i + 1)).data("value");
        }
    }

    var url = baseUrl + "Administrado/Gestion/EditarUsuario";
    var item = {
        ID_USUARIO: $("#userMantenimiento").data("value"),
        EMAIL_USUARIO: $("#emailMantenimiento").val(),
        NOMBRES_USUARIO: $("#nombreMantenimiento").val(),
        APELLIDOS_USUARIO: $("#apellidoMantenimiento").val(),
        TELEFONO_USUARIO: $("#telefonoMantenimiento").val(),
        CELULAR_USUARIO: $("#celularMantenimiento").val(),
        ANEXO_USUARIO: $("#anexoMantenimiento").val(),
        ID_SECTOR_INST: $("#sectorMantenimiento").val(),
        INSTITUCION: $("#institucionMantenimiento").val(),
        RUC: $("#rucMantenimiento").val(),
        ID_ROL: $("#perfilMantenimiento").val(),
        DIRECCION: $("#direccionMantenimiento").val(),
        ID_ESTADO_USUARIO: estado
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        /*Swal.fire({
            position: 'center',
            icon: 'success',
            title: 'Actualizacion de Usuario correcto',
            showConfirmButton: false,
            timer: 1700
        })

        fn_Home();*/
        CargarTablaMantenimiento();
        $("#ventanaEditar").hide();
        $("#cabeceraRegistrarMantenimientoUsuario").hide();
        $("#cabeceraEditarMantenimientoUsuario").hide();
        $("#errorEditarMantenimientoUsuario").hide();
        $("#errorRegistrarMantenimientoUsuario").hide();
        $("#pieMantenimientoUsuario").hide();
        $("#mensajeRegistroMantenimientoUsuario").hide();
        $("#correctoMantenimientoUsuario").show();
    } else {
        /*Swal.fire({
            icon: 'error',
            html: 'Ocurrio error durante la actualizacion del Usuario'
        })*/
        $("#ventanaEditar").show();
        $("#correctoMantenimientoUsuario").hide();
        $("#errorRegistrarMantenimientoUsuario").hide();
        $("#errorEditarMantenimientoUsuario").show();
    }
}

function fn_cargarRol(id) {
    var Item = {
    };
    $.ajax({
        url: baseUrl + "Administrado/Gestion/ListarRol",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    //$("#perfilMantenimiento option").remove();
                    //$("#perfilMantenimiento").append('<option value="0">-Seleccione un perfil-</option>');
                    for (var i = 0; i < data.length; i++) {
                        $("#perfilMantenimiento").append('<option class="badge-actor-0' + (i + 2) + ' font-weight-bold" value="' + data[i]["ID_ROL"] + '">' + data[i]["DESCRIPCION_ROL"] + '</option>');
                    }
                }
            }
        }
    });

}

function fn_cargarDatosUserMantenimiento(id) {
    //$("#sectorMantenimiento option").remove();
    //$("#sectorMantenimiento").append('<option value="0">-Seleccione un sector-</option>');
    $("#cabeceraRegistrarMantenimientoUsuario").hide();
    fn_seleccionarMantenimientoUsuario(id);
}

$("#modal-usuario").on("hidden.bs.modal", function () {
    fn_modalInicio();
});