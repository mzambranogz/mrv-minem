$(document).ready(function () {
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarMedidaMitigacion", "#regMitigacion", "ID_MAE_MEDMIT", "NOMBRE_MEDMIT");
    alert($("#User").data("value"));
});

function fn_ObtenerMedidaMitigacion() {

    var select = $("#regMitigacion").val();
    if (select > 0) {
        var Item = {
            ID_MAE_MEDMIT: select
        };

        $.ajax({
            url: baseUrl + "Administrado/Gestion/ObtenerMedidaMitigacion",
            type: 'POST',
            datatype: 'json',
            data: Item,
            success: function (data) {
                if (data != null && data != "") {
                    if (data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            $("#regCategoria").val(data[i]["IPSC_MEDMIT"]);                            
                            $("#regObjetivo").val(data[i]["OBJETIVO_MEDMIT"]);
                            $("#regDescripcion").val(data[i]["DESCRIPCION_MEDMIT"]);
                            $("#regCategoria").prop("disabled", true);
                            $("#regObjetivo").prop("disabled", true);
                            $("#regDescripcion").prop("disabled", true);
                        }
                    }
                }
            }
        });
    }

}