
function fn_irMantenimiento() {
    var mantenimiento = $("#cbo-tabla-mantenimiento").val();
    if (mantenimiento == 1) {
        MRV.ObtenerVista(baseUrl + 'Administrado/Gestion/MantenimientoUsuario');
    }
}