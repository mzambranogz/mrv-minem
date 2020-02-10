$(document).ready(function () {
    //MRV.CargarSelect(baseUrl + "Portal/ListaSectorInstitucion", "#cbo-sector", "ID_SECTOR_INST", "DESCRIPCION");
    fn_modalInicio();
    fn_actualizaCampana();
    enLinea();
});

function fn_modalInicio() {
    $("#ventanaEditar").show();
    $("#title-nuevo").hide();
    $("#title-edit").hide();
    $("#errorEditarMantenimientoUsuario").hide();
    $("#errorRegistrarMantenimientoUsuario").hide();
    $("#correctoMantenimientoUsuario").hide();
    $("#mensajeRegistroMantenimientoUsuario").show();
    $("#pieMantenimientoUsuario").show();
    $("#pieCorrecto").hide();
}