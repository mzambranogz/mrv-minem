function fn_irMantenimiento() {
    if ($("#cbo-tabla-mantenimiento").val() == 1) {
        location.href = baseUrl + "Gestion/MantenimientoUsuario";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 3) {
        location.href = baseUrl + "Mantenimiento/Instituciones";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 4) {
        location.href = baseUrl + "Mantenimiento/Ubicaciones";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 5) {
        location.href = baseUrl + "Mantenimiento/Sectores";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 6) {
        location.href = baseUrl + "Mantenimiento/Monedas";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 9) {
        location.href = baseUrl + "Mantenimiento/Escenarios";
    }
}