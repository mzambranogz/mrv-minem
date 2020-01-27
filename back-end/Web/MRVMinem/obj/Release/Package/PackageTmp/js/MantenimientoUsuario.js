﻿$(document).ready(function () {
    CargarTablaMantenimiento();
    MRV.CargarSelect(baseUrl + "Portal/ListaSectorInstitucion", "#cbo-sector", "ID_SECTOR_INST", "DESCRIPCION");
    fn_cargarRol();
    fn_cargaMedidaMitigacion();
    fn_modalInicio();
    fn_actualizaCampana();
    enLinea();
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
        url: baseUrl + "Gestion/ListaMantenimientoUsuario",
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
                        $("#cuerpoMantenimientoUsuario").append(tr);
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
        url: baseUrl + "Gestion/SeleccionarMantenimientoUsuario",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {

                $("#rad-01").prop("checked", false);
                $("#rad-02").prop("checked", false);

                var medmit = $("[id^=rad-med-0]");
                if (medmit.length > 0) {
                    for (var i = 0; i < medmit.length; i++) {
                        medmit[i].checked = false;
                    }
                }

                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#userMantenimiento").data("value", data[i]["ID_USUARIO"]);
                        $("#txt-user").val(data[i]["EMAIL_USUARIO"]);
                        $("#txt-nombre").val(data[i]["NOMBRES_USUARIO"]);
                        $("#txt-apellido").val(data[i]["APELLIDOS_USUARIO"]);
                        $("#txt-telefono").val(data[i]["TELEFONO_USUARIO"]);
                        $("#txt-celular").val(data[i]["CELULAR_USUARIO"]);
                        $("#txt-anexo").val(data[i]["ANEXO_USUARIO"]);
                        $("#txt-institucion").val(data[i]["INSTITUCION"]);
                        $("#txt-direccion").val(data[i]["DIRECCION"]);
                        $("#txt-ruc").val(data[i]["RUC"]);
                        $("#cbo-sector").val(data[i]["ID_SECTOR_INST"]);
                        $("#cbo-perfil").val(data[i]["ID_ROL"]);
                        $("#estado-usuario").data("estado", data[i]["ID_ESTADO_USUARIO"]); //ADD
                        if (data[i]["ID_ESTADO_USUARIO"] == 1) {
                            $("#rad-01").prop("checked", true);
                        } else if (data[i]["ID_ESTADO_USUARIO"] == 2) {
                            $("#rad-02").prop("checked", true);
                        }
                        Number(data[i]["ID_ROL"]) == 2 ? $(".medidas-especialista").show() : $(".medidas-especialista").hide()
                        if (Number(data[i]["ID_ROL"]) == 2) {
                            $.ajax({
                                url: baseUrl + "Gestion/ListaUsuarioMedidaMitigacion",
                                type: 'POST',
                                datatype: 'json',
                                data: Item,
                                success: function (data2) {
                                    debugger;
                                    if (data2.length > 0) {
                                        for (var x = 0; x < data2.length; x++) {
                                            $("#rad-med-0" + data2[x]["ID_MEDMIT"]).prop('checked', true);
                                        }
                                    }

                                }
                            });

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

function fn_limpiarCampo() {
    $("#txt-user").val("");
    $("#txt-nombre").val("");
    $("#txt-apellido").val("");
    $("#txt-telefono").val("");
    $("#txt-anexo").val("");
    $("#txt-celular").val("");
    $("#txt-institucion").val("");
    $("#txt-ruc").val("");
    $("#txt-direccion").val("");
    $("#cbo-sector").val(0);
    $("#cbo-perfil").val(0);
    $("#txt-pswd").val("");
    $("#rad-01").prop("checked", false);
    $("#rad-02").prop("checked", false);
}

function validarEstado() {
    for (var i = 0; i < 2 ; i++) {
        if ($('#rad-0' + (i + 1)).prop('checked')) {
            return true;
        }
    }
    return false;
}

function fn_validarCampo() {
    var arr = [];
    var clave = $("#txt-pswd").val();
    if (!(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test($("#txt-user").val()))) {
        arr.push("Debe ingresar un correo electrónico válido");
    }
    if ($("#txt-nombre").val().trim() === "") {
        arr.push("Debe ingresar el/los nombre(s) ");
    }
    if ($("#txt-apellido").val().trim() === "") {
        arr.push("Debe ingresar el/los apellido(s)");
    }
    if ($("#txt-institucion").val().trim() === "") {
        arr.push("Debe ingresar el nombre de la Institución");
    }
    if ($("#txt-ruc").val().length < 11) {
        arr.push("El ruc debe contener 11 caracteres");
    }
    //if ($("#txt-direccion").val().trim() === "") {
    //    arr.push("Debe ingresar el domicilio fiscal de la Institución");
    //}
    if ($("#cbo-sector").val() == 0) {
        arr.push("Debe seleccionar un Sector");
    }
    if (!(/[a-zñ]/.test(clave) && /[A-ZÑ]/.test(clave) && /[0-9]/.test(clave))) {
        arr.push("La contraseña debe contener minuscula(s), mayúscula(s), número(s) y caracter(es) especial(es)");
    }
    if (clave.length < 6) {
        arr.push("La contraseña debe contener 8 o más caracteres");
    }
    if ($("#cbo-perfil").val() == 0) {
        arr.push("Debe seleccionar un Perfil");
    }
    if (!validarEstado()){
        arr.push("Debe seleccionar un Estado");
    }
    
    if (arr.length > 0) {
        $("#correctoMantenimientoUsuario").hide();
        $("#errorRegistrarMantenimientoUsuario").hide();
        $("#errorEditarMantenimientoUsuario").hide();
        var error = '';
        $.each(arr, function (ind, elem) {
            error = error + '<small class="mb-0">' + elem + '</small><br/>';
        });
        var msj = '                      <div class="alert alert-danger d-flex align-items-stretch" role="alert" id="errorRegistro">';
        msj = msj + '                           <div class="alert-wrap mr-3">';
        msj = msj + '                                <div class="sa">';
        msj = msj + '                                    <div class="sa-error">';
        msj = msj + '                                        <div class="sa-error-x">';
        msj = msj + '                                            <div class="sa-error-left"></div>';
        msj = msj + '                                            <div class="sa-error-right"></div>';
        msj = msj + '                                        </div>';
        msj = msj + '                                        <div class="sa-error-placeholder"></div>';
        msj = msj + '                                        <div class="sa-error-fix"></div>';
        msj = msj + '                                    </div>';
        msj = msj + '                                </div>';
        msj = msj + '                            </div>';
        msj = msj + '                            <div class="alert-wrap">';
        msj = msj + '                                <h6>Error de registro</h6>';
        msj = msj + error;
        msj = msj + '                            </div>';
        msj = msj + '                        </div>';
        $("#seccionMensaje").append(msj);
        return false;
    }
    return true;
}

function fn_editarMantenimiento() {
    debugger;
    $("#seccionMensaje #errorRegistro").remove();
    if ($("#validarUsuario").data("guardar") == 1){
        if (!fn_validarCampo()) {
            return false;
        }
    }
    

    var estado = 0;
    //alert("entre");
    for (var i = 0; i < 2 ; i++) {
        if ($('#rad-0' + (i + 1)).prop('checked')) {
            estado = $('#rad-0' + (i + 1)).data("value");
        }
    }
    debugger;
    var idMedmit = "";
    var medmit = $("[id^=rad-med-0]");
    if (medmit.length > 0) {
        for (var i = 0; i < medmit.length; i++) {
            if (medmit[i].checked) {
                idMedmit += medmit[i].value + "|";
            }
        }
    }


    var url = baseUrl + "Gestion/EditarUsuario";
    //debugger;
    var item = {
        ID_USUARIO: $("#userMantenimiento").data("value"),
        EMAIL_USUARIO: $("#txt-user").val(),
        NOMBRES_USUARIO: $("#txt-nombre").val(),
        APELLIDOS_USUARIO: $("#txt-apellido").val(),
        TELEFONO_USUARIO: $("#txt-telefono").val(),
        CELULAR_USUARIO: $("#txt-celular").val(),
        ANEXO_USUARIO: $("#txt-anexo").val(),        
        INSTITUCION: $("#txt-institucion").val(),
        RUC: $("#txt-ruc").val(),
        DIRECCION: $("#txt-direccion").val(),
        ID_ROL: $("#cbo-perfil").val(),
        ID_SECTOR_INST: $("#cbo-sector").val(),
        PASSWORD_USUARIO: $("#txt-pswd").val(),
        ID_ESTADO_USUARIO: estado,
        ID_ESTADO_ANTERIOR: $("#estado-usuario").data("estado"),
        MEDIDAS: idMedmit,
        TERMINOS: '1',
        ESTADO: $("#validarUsuario").data("guardar")
    };
    var mensaje = "";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
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
        url: baseUrl + "Gestion/ListarRol",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        $("#cbo-perfil").append('<option class="badge-actor-0' + (i + 2) + ' font-weight-bold" value="' + data[i]["ID_ROL"] + '">' + data[i]["DESCRIPCION_ROL"] + '</option>');
                    }
                }
            }
        }
    });

}

function fn_cargarDatosUserMantenimiento(id) {
    $("#validarUsuario").data("guardar", 0);/*add*/
    $("#cabeceraRegistrarMantenimientoUsuario").hide();
    fn_seleccionarMantenimientoUsuario(id);
}

$("#modal-usuario").on("hidden.bs.modal", function () {
    fn_modalInicio();
    $("#seccionMensaje #errorRegistro").remove();
});

function fn_cargaMedidaMitigacion() {
    var Item = {
    };
    $.ajax({
        url: baseUrl + "Mantenimiento/ListarMedidaMitigacion",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#medidaGroup").html("");
                    for (var i = 0; i < data.length; i++) {
                        //$("#medidaGroup").append('<option class="badge-actor-0' + (i + 2) + ' font-weight-bold" value="' + data[i]["ID_ROL"] + '">' + data[i]["DESCRIPCION_ROL"] + '</option>');
                        $("#medidaGroup").append("<div class='col-auto my-1'><div class='custom-control custom-checkbox mr-sm-2'><input class='custom-control-input' type='checkbox' id='rad-med-0" + (i + 1) + "' value=" + data[i]["ID_MEDMIT"] + "><label class='custom-control-label' for='rad-med-0" + (i + 1) + "'>" + data[i]["NOMBRE_MEDMIT"] + "</label></div></div>");
                    }
                }
            }
        }
    });
}

/*========================================================*/

function regUsuario() {
    fn_limpiarCampo();
    $("#validarUsuario").data("guardar", 1);
    $("#cabeceraEditarMantenimientoUsuario").hide();
}




