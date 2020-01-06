
$(document).ready(function () {
    CargarListarIniciativaMitigacion();
    MRV.CargarSelect(baseUrl + "Publico/Portal/ListaSectorInstitucion", "#mSector", "ID_SECTOR_INST", "DESCRIPCION");
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarMedidaMitigacion", "#medMitigacion", "ID_MAE_MEDMIT", "NOMBRE_MEDMIT");
    MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarMoneda", "#mMoneda", "ID_MONEDA", "DESCRIPCION");
});

function CargarListarIniciativaMitigacion() {
    var Item = {};
    $.ajax({
        url: baseUrl + "Publico/Portal/ListaIniciativas",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    $("#cuerpoMitigacion").html("");
                    for (var i = 0; i < data.length; i++){
                            var tr = '<tr>';
                            tr = tr + '<th class="text-center" data-encabezado="Número" scope="row">' + (1 + i) + '</th>';
                            tr = tr + '<td data-encabezado="Nombre de Iniciativa">' + data[i]["NOMBRE_INICIATIVA"] + '</td>';
                            tr = tr + '<td data-encabezado="Progreso"><div class="progress-bar progress-bar-striped" role="progressbar" style="width: 50%;" aria-valuenow="' + data[i]["PROGRESO"] + '" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="Texto de ayuda que describe el funcionamiento general del módulo [...]">' + data[i]["PROGRESO"] + '</div> </td>';
                            tr = tr + '<td>' + data[i]["FECHA"].toString()+ '</td>';
                            tr = tr + '<td>' + data[i]["NOMBRE_MEDMIT"] + '</td>';
                            tr = tr + '<td>' + data[i]["NOMBRE_INSTITUCION"] + '</td>';
                            tr = tr + "<td class='text-center'><div class='btn-group'>";
                            tr = tr + "     <div class='acciones dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'><i class='fas fa-ellipsis-h'></i></div>";
                            tr = tr + "     <div class='dropdown-menu dropdown-menu-right'>";
                            tr = tr + "         <a class='dropdown-item' href='#'>";
                            tr = tr + "             <i class='fas fa-plus-circle'></i>&nbsp;Ver más";
                            tr = tr + "         </a><a class='dropdown-item' href='#'>";
                            tr = tr + "             <i class='fas fa-history'></i>&nbsp; Seguimiento";
                            tr = tr + "         </a>";
                            tr = tr + "     </div>";
                            tr = tr + "     </div></td>";
                            tr = tr + '</tr>';
                            $("#cuerpoMitigacion").append(tr)
                    }
                }
            }
        }
    });
}
