﻿$(document).ready(function () {
    fn_actualizaCampana();
    enLinea();
});


function fn_irMantenimiento() {
    if ($("#cbo-tabla-mantenimiento").val() == 1) {
        location.href = baseUrl + "Gestion/MantenimientoUsuario";
    }
}