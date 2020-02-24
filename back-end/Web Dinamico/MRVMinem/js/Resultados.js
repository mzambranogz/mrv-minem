function CargarDashboardMedida(id) {
    debugger;
    var item = {
        ID_MEDMIT: id
    }

    $.ajax({
        url: baseUrl + 'Portal/DashboardResultado',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            debugger;
            if (data != null && data != "") {
                debugger;
                if (data.length > 0) {

                    //dash torta
                    var datat = new google.visualization.DataTable();
                    var datat2 = new google.visualization.DataTable();                    
                    datat.addColumn('string', 'Topping');
                    datat.addColumn('number', 'Slices');
                    debugger;
                    for (var i = 0; i < data.length; i++) {

                        $("#total-institucion").html(data[i]["TOTAL_INSTITUCION"]);
                        $("#total-region").html(data[i]["TOTAL_REGION"]);
                        $("#total-gei").html(data[i]["TOTAL_GEI_REDUCIDO"]);
                        $("#nombre-medida").html(data[i]["NOMBRE_MEDMIT"]);

                        var entidad = data[i]["listaGei"];
                        for (var j = 0; j < entidad.length; j++) {
                            datat.addRows([
                                [entidad[j]["DESCRIPCION"], entidad[j]["TOTAL_GEI"]]
                            ]);
                            
                        }
                        google.charts.setOnLoadCallback(drawPieChart(datat));

                        debugger;

                        //datat2.addColumn('number', 'Energy Level');
                        var entidad = data[i]["listaAnnoSec"];
                        for (var j = 0; j < entidad.length; j++) {
                            var arr = [];
                            var arrSector = [];
                            var arrTotal = [];
                            var arrAnno = [];
                            var obj = entidad[j]["listaGeiAnno"];
                            for (var m = 0; m < obj.length; m++) {
                                arrSector.push(obj[m]["SECTOR"]);
                                arrTotal.push(obj[m]["TOTAL_GEI"]);
                                arrAnno.push(obj[m]["ANNO"]);
                            }

                            arr.push({ v: [(j + 8), 0, 0], f: arrAnno[0].toString() });
                            for (var n = 0; n < arrTotal.length; n++) {
                                arr.push(arrTotal[n]);
                            }

                            if (j == 0) {
                                datat2.addColumn('timeofday', 'Time of Day');
                                for (var n = 0; n < arrSector.length; n++) {
                                    datat2.addColumn('number', arrSector[n]);
                                }
                            }

                            datat2.addRows([
                                arr
                            ]);

                        }
                        google.charts.setOnLoadCallback(drawBarChart(datat2));

                        var arr4 = [];
                        arr4.push(['Sectores', 'Iniciativas', ]);
                        var entidad = data[i]["listaCant"];
                        for (var j = 0; j < entidad.length; j++) {
                            arr4.push([entidad[j]["DESCRIPCION"], entidad[j]["CANTIDAD"]]);
                        }
                        var datat4 = google.visualization.arrayToDataTable(arr4);
                        google.charts.setOnLoadCallback(drawColumnChart(datat4));

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
    var options = {
        'title': 'Porcentaje de reducción de tCO2eq por Sector',
        'width': 400,
        'height': 300
    };
    var chart = new google.visualization.PieChart(document.getElementById('pie-chart'));
    chart.draw(data, options);
}


function drawBarChart(data) {
    //var data = new google.visualization.DataTable();
    //data.addColumn('timeofday', 'Time of Day');
    //data.addColumn('number', 'Motivation Level');
    //data.addColumn('number', 'Energy Level');

    //data.addRows([
    //  [{ v: [8, 0, 0], f: '8 am' }, 1, .25],
    //  [{ v: [9, 0, 0], f: '9 am' }, 2, .5],
    //  [{ v: [10, 0, 0], f: '10 am' }, 3, 1],
    //  [{ v: [11, 0, 0], f: '11 am' }, 4, 2.25],
    //  [{ v: [12, 0, 0], f: '12 pm' }, 5, 2.25],
    //  [{ v: [13, 0, 0], f: '1 pm' }, 6, 3],
    //  [{ v: [14, 0, 0], f: '2 pm' }, 7, 4],
    //  [{ v: [15, 0, 0], f: '3 pm' }, 8, 5.25],
    //  [{ v: [16, 0, 0], f: '4 pm' }, 9, 7.5],
    //  [{ v: [17, 0, 0], f: '5 pm' }, 10, 10],
    //]);

    var options = {
        title: 'Cantidad de tCO2eq disminuido por Año y Sector',
        //trendlines: {
        //    0: { type: 'linear', lineWidth: 5, opacity: .3 },
        //    1: { type: 'exponential', lineWidth: 10, opacity: .3 }
        //},
        hAxis: {
            title: ' ',
            format: ' ',
            viewWindow: {
                min: [1, 60, 0],
                max: [20, 60, 0]
            }
        },
        vAxis: {
            title: 'Cantidad de tCO2eq reducido'
        },
        'width': 500,
        'height': 300
    };

    var chart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
    chart.draw(data, options);
}

//google.charts.setOnLoadCallback(drawColumnChart);
function drawColumnChart(data) {
    //var data = google.visualization.arrayToDataTable([
    //  ['City', '2010 Population', ],
    //  ['New York City, NY', 8175000],
    //  ['Los Angeles, CA', 3792000],
    //  ['Chicago, IL', 2695000],
    //  ['Houston, TX', 2099000],
    //  ['Philadelphia, PA', 1526000]
    //]);

    var options = {
        title: 'Cantidad de Iniciativas de Mitigación por Sector',
        chartArea: { width: '55%' },
        hAxis: {
            title: 'Cantidad',
            minValue: 0
        },
        vAxis: {
            title: 'Sector'
        },
        'width': 500,
        'height': 300
    };

    var chart = new google.visualization.BarChart(document.getElementById('column-chart'));

    chart.draw(data, options);
}