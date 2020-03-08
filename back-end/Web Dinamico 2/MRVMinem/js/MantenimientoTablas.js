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
    if ($("#cbo-tabla-mantenimiento").val() == 11) {
        //location.href = baseUrl + "Mantenimiento/MedidaFactoresData";
        location.href = baseUrl + "Mantenimiento/EnfoqueFactor";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 12) {
        location.href = baseUrl + "Mantenimiento/MantenimientoFactores";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 13) {
        location.href = baseUrl + "Mantenimiento/MedidaMitigacion";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 14) {
        location.href = baseUrl + "Mantenimiento/IPCC";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 15) {
        location.href = baseUrl + "Mantenimiento/Nama";
    }
    if ($("#cbo-tabla-mantenimiento").val() == 16) {
        location.href = baseUrl + "Mantenimiento/Plazo";
    }
}