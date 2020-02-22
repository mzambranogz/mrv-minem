function CargarDashboardMedida(id) {
    debugger;
    var item = {
        ID_MEDMIT: id
    }

    $.ajax({
        url: baseUrl + 'Gestion/DashboardResultado',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                debugger;
                if (data.length > 0) {
                    var datat = new google.visualization.DataTable();
                    datat.addColumn('string', 'Topping');
                    datat.addColumn('number', 'Slices');
                    debugger;
                    for (var i = 0; i < data.length; i++) {                        
                        var entidad = data[i]["listaGei"];
                        for (var j = 0; j < entidad.length; j++) {
                            datat.addRows([
                                [entidad[j]["DESCRIPCION"], entidad[j]["TOTAL_GEI"]]
                            ]);
                            
                        }
                        google.charts.setOnLoadCallback(drawPieChart(datat));                        
                    }
                }
            }
        }
    });
}

function drawPieChart(data) {
    //var data = new google.visualization.DataTable();
    //data.addColumn('string', 'Topping');
    //data.addColumn('number', 'Slices');
    //data.addRows([
    //  ['Mushrooms', 3],
    //  ['Onions', 1],
    //  ['Olives', 1],
    //  ['Zucchini', 1],
    //  ['Pepperoni', 2]
    //]);
    debugger;
    var options = {
        'title': 'How Much Pizza I Ate Last Night',
        'width': 400,
        'height': 300
    };
    var chart = new google.visualization.PieChart(document.getElementById('pie-chart'));
    chart.draw(data, options);
}