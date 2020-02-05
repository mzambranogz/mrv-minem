function fn_irMantenimiento() {
    if ($("#cbo-tabla-mantenimiento").val() == 1) {
        location.href = baseUrl + "Gestion/MantenimientoUsuario";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 3) {
        location.href = baseUrl + "Mantenimiento/Instituciones";
    }
}