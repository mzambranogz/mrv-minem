$(document).ready(function () {
    CargarGrillaBuscarExpediente();
});

function CargarGrillaBuscarExpediente() {
    var Item = {
        P_GENM_INICIATIVA: 0,
        INICIATIVANOMBRE: '%',
        F_MAE_ESTADO: 0
    };

    $.ajax({
        url: baseUrl + "Publico/Portal/ListaIniciativas",
        type: 'POST',
        datatype: 'json',
        data: Item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    var inf = data;
                    var table = $('#tblAcciones').DataTable({
                        data: inf,
                        "scrollY": "250px",
                        //"scrollX": true,
                        "scrollCollapse": false,
                        "paging": false,
                        "select": true,
                        "searching": false,
                        "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                            $('td:eq(0)', nRow).css("text-align", "justify")    ;
                            $('td:eq(1)', nRow).css("text-align", "justify");
                            $('td:eq(2)', nRow).css("text-align", "justify");
                            $('td:eq(3)', nRow).css("text-align", "center");
                            //$('td:eq(4)', nRow).css("text-align", "justify");
                            return nRow;
                        },
                        "language": { "url": baseUrl + "Scripts/js/Spanish.json" },
                        "lengthMenu": [[20, 50, 100, -1], [20, 50, 100, "Todo"]],
                        "destroy": true,
                        "columns": [
                            { "data": "INICIATIVANOMBRE" },
                            { "data": "INICIATIVADESCRIPCION" },
                            { "data": "INICIATIVAINVERSION" },
                            { "data": "INICIATIVAFECHAIMPLEMENTACION" }
                        ]
                    });
                }
                else {
                    var table = $('#tblAcciones').DataTable({
                        "language": { "url": baseUrl + "Scripts/js/Spanish.json" },
                        destroy: true
                    });
                    table.clear().draw();
                }
            }
        }
    });

}