function fn_irMantenimiento() {
    if ($("#cbo-tabla-mantenimiento").val() == 1) {
        location.href = baseUrl + "Gestion/MantenimientoUsuario";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 2) {
        location.href = baseUrl + "Mantenimiento/Energeticos";
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
    if ($("#cbo-tabla-mantenimiento").val() == 7) {
        location.href = baseUrl + "Mantenimiento/Gei";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 8) {
        location.href = baseUrl + "Mantenimiento/Enfoques";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 9) {
        location.href = baseUrl + "Mantenimiento/Escenarios";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 10) {
        location.href = baseUrl + "Mantenimiento/MedidaMitigacionDetalle";
    }
}