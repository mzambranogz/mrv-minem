function CargarDashboardMedida(id) {
    if (id != 10 && id != 9 && id != 5 && id != 1) {
        //$("#total-institucion").html(data[i]["TOTAL_INSTITUCION"]);
        $("#institucion-mostrar").removeAttr("hidden");
        $("#dash-1").removeAttr("hidden");
        $("#dash-2").removeAttr("hidden");
    } else {
        $("#institucion-mostrar").attr("hidden", true);
        $("#dash-1").attr("hidden", true);
        $("#dash-2").attr("hidden", true);
    }
    var item = {
        ID_MEDMIT: id
    }

    $.ajax({
        url: baseUrl + 'Portal/DashboardResultado',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                if (data.length > 0) {
                    //dash torta
                    var datat = new google.visualization.DataTable();
                    var datat2 = new google.visualization.DataTable();                    
                    datat.addColumn('string', 'Topping');
                    datat.addColumn('number', 'Slices');
                    for (var i = 0; i < data.length; i++) {
                        if (id != 10 && id != 9 && id != 5 && id != 1) {
                            $("#total-institucion").html(data[i]["TOTAL_INSTITUCION"]);
                            //$("#institucion-mostrar").removeAttr("hidden");
                        }
                        var total_gei = Math.round(data[i]["TOTAL_GEI_REDUCIDO"]);
                        var desc_gei = "Toneladas";
                        if (total_gei > 999) {
                            total_gei = Math.round((total_gei / 1000) * 100) / 100;
                            desc_gei = "KToneladas";
                            if (total_gei > 999) {
                                total_gei = Math.round((total_gei / 1000) * 100) / 100;
                                desc_gei = "MToneladas";
                                if (total_gei > 999) {
                                    total_gei = Math.round((total_gei / 1000) * 100) / 100;
                                    desc_gei = "GToneladas";
                                }
                            }
                        }

                        $("#total-region").html(data[i]["TOTAL_REGION"]);
                        //$("#total-gei").html(data[i]["TOTAL_GEI_REDUCIDO"]);
                        $("#unidad-gei").html("").html(desc_gei);
                        $("#total-gei").html(total_gei);
                        $("#nombre-medida").html(data[i]["NOMBRE_MEDMIT"]);
                        $('#descripcion-medida').html(data[i]["DESCRIPCION"]);

                        var entidad = data[i]["listaGei"];
                        //for (var j = 0; j < entidad.length; j++) {
                        //    datat.addRows([
                        //        [entidad[j]["DESCRIPCION"], entidad[j]["TOTAL_GEI"]]
                        //    ]);
                            
                        //}
                        //google.charts.setOnLoadCallback(drawPieChart(datat));
                        
                        var arr2n = [];//add
                        arr2n.push(['Sector', 'Total', ]);//add
                        for (var j = 0; j < entidad.length; j++) {
                            arr2n.push([entidad[j]["DESCRIPCION"], entidad[j]["TOTAL_GEI"] ]);
                        }

                        if (arr2n[1][1] == 0 && arr2n[2][1] == 0) $('#chart-03').parent().addClass('d-none');
                        else $('#chart-03').parent().removeClass('d-none');

                        var datat2n = google.visualization.arrayToDataTable(arr2n);
                        google.charts.setOnLoadCallback(drawPieChart(datat2n));

                        //datat2.addColumn('number', 'Energy Level');
                        var entidad = data[i]["listaAnnoSec"];

                        var arr4n = [];//add
                        arr4n.push(['Year', 'Sector Público', 'Sector Privado', ]);//add

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

                            //==============================================================================
                            //var validar = 0; //add
                            //debugger;
                            ////arr.push({ v: [(j + 8), 0, 0], f: arrAnno[0].toString() });
                            //for (var n = 0; n < arrTotal.length; n++) {
                            //    if (arrTotal[0] > 0) {
                            //        if (n == 0)
                            //            arr.push({ v: [(j + 8), 0, 0], f: arrAnno[0].toString() });
                            //        arr.push(arrTotal[n]);

                            //        validar = 1; //add
                            //    } //add                                    
                            //}

                            //if (j == 0) {
                            //    datat2.addColumn('timeofday', 'Time of Day');
                            //    for (var n = 0; n < arrSector.length; n++) {
                            //        datat2.addColumn('number', arrSector[n]);
                            //    }
                            //}

                            //if (validar == 1) {
                            //    datat2.addRows([
                            //        arr
                            //    ]);
                            //}
                            //===============================================================================

                            //debugger;
                            //for (var j = 0; j < entidad.length; j++) {
                            if (arrTotal[0] > 0 || arrTotal[1] > 0) {
                                // arr4n.push([arrAnno[0].toString(), arrTotal[0], arrTotal[1], ]);
                                arr4n.push([arrAnno[0].toString(), Math.round(arrTotal[0] * 100) / 100, Math.round(arrTotal[1] * 100) / 100, ]);
                            }                                
                            //}

                        }
                        //google.charts.setOnLoadCallback(drawBarChart(datat2));
                        if (arr4n.length == 1) {
                            arr4n.push(['2010', 0, 0]);
                            $('#chart-01').parent().addClass('d-none');
                        } else $('#chart-01').parent().removeClass('d-none');

                        var datat4n = google.visualization.arrayToDataTable(arr4n);
                        google.charts.setOnLoadCallback(drawMultSeries01(datat4n));

                        var arr4 = [];
                        arr4.push(['Sector', 'Total', ]);
                        var entidad = data[i]["listaCant"];
                        for (var j = 0; j < entidad.length; j++) {
                            arr4.push([entidad[j]["DESCRIPCION"], entidad[j]["CANTIDAD"]]);
                        }

                        if (arr4[1][1] == 0 && arr4[2][1] == 0) $('#chart-02').parent().addClass('d-none');
                        else $('#chart-02').parent().removeClass('d-none');

                        var datat4 = google.visualization.arrayToDataTable(arr4);
                        //google.charts.setOnLoadCallback(drawColumnChart(datat4));
                        google.charts.setOnLoadCallback(drawMultSeries02(datat4));
                        //$("#bar-chart svg text").first().attr("x", (($("#time-series-graph svg").width() - parseInt($("#bar-chart svg text").first().attr('x'), 10)) / 2).toFixed(0));
                    }
                }
            }
        }
    });
}


//google.charts.setOnLoadCallback(drawMultSeries01);
function drawMultSeries01(data) {
    /*var data = google.visualization.arrayToDataTable([
        ['Year', 'Sector Público', 'Sector Privado'],
        ['2010', 0, 0],
        ['2018', 1000, 400],
        ['2019', 1170, 460],
        ['2020', 660, 1120],
        ['2021', 1030, 540],
    ]);*/
    var options = {
        width: 900,
        height: 540,
        legend: { position: 'none' },
        //title: 'Cantidad de tCO2eq disminuido por Año y Sector',
        //subtitle: 'Período 2010 - 2030',
        //hAxis: {
        //    title: 'Año del Período'
        //},
        vAxis: {
            title: 'Toneladas de CO2eq'
        }
    };
    var chart = new google.visualization.ColumnChart(
      document.getElementById('chart-01'));
    chart.draw(data, options);
}


//google.charts.setOnLoadCallback(drawMultSeries02);
function drawMultSeries02(data) {
    /*var data = google.visualization.arrayToDataTable([
        ['Year', 'Sector Público', 'Sector Privado'],
        ['2010', 0, 0],
        ['2018', 1000, 400],
        ['2019', 1170, 460],
        ['2020', 660, 1120],
        ['2021', 1030, 540],
    ]);*/
    var options = {
        width: 900,
        height: 540,
        legend: { position: 'none' },
        //title: 'Cantidad de Acciones de Mitigación registrados por Sector',
        //subtitle: 'Período 2010 - 2030',
        //hAxis: {
        //    title: 'Año del Período'
        //},
        //vAxis: {
        //    title: 'Cantidad de Acciones de Mitigación registrados'
        //}
    };
    var chart = new google.visualization.ColumnChart(
      document.getElementById('chart-02'));
    chart.draw(data, options);
}


//function drawPieChart(data) {
//    //var data = new google.visualization.DataTable();
//    //data.addColumn('string', 'Topping');
//    //data.addColumn('number', 'Slices');
//    //data.addRows([
//    //  ['Mushrooms', 3],
//    //  ['Onions', 1],
//    //  ['Olives', 1],
//    //  ['Zucchini', 1],
//    //  ['Pepperoni', 2]
//    //]);
//    var options = {
//        'title': 'Porcentaje de reducción de tCO2eq por Sector',
//        'width': 800,
//        'height': 540
//    };
//    var chart = new google.visualization.PieChart(document.getElementById('pie-chart'));
//    chart.draw(data, options);
//}

//document.querySelector('#bar-chart > div > div:nth-child(1) > div > svg > g:nth-child(3) > text').setAttribute(600, 100);


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
        'width': 1000,
        'height': 540
    };

    var chart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
    chart.draw(data, options);    
}



//google.charts.setOnLoadCallback(drawPieChart);
function drawPieChart(data) {
    //var data = google.visualization.arrayToDataTable([
    //  ['Sector', 'Total'],
    //  ['Sector Público', 34500],
    //  ['Sector Privado', 18000]
    //]);
    var options = {
        //title: 'Reducción de tCO2eq por Sector',
        legend: { position: 'none' },
        width: 900,
        height: 540,
        is3D: true
    };
    var chart = new google.visualization.PieChart(document.getElementById('chart-03'));
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
        title: 'Cantidad de Acciones de Mitigación por Sector',
        chartArea: { width: '55%' },
        hAxis: {
            title: 'Cantidad',
            minValue: 0
        },
        vAxis: {
            title: 'Sector'
        },
        'width': 800,
        'height': 540
    };

    var chart = new google.visualization.BarChart(document.getElementById('column-chart'));

    chart.draw(data, options);
}

$(document).on("change", "#cboAnioPeriodo", function () {
    var anno = $("#cboAnioPeriodo").val();
    calcularTotalGei(anno);
});

function calcularTotalGei(anno) {
    var item = {
        ANNO: anno
    }
    $.ajax({
        url: baseUrl + 'Portal/MostrarGeiporAnio',
        type: 'POST',
        datatype: 'json',
        data: item,
        success: function (data) {
            if (data != null && data != "") {
                var total = 0.0;
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        //var total_med = Math.round(parseFloat(data[i]["TOTAL_GEI"]) * 100) / 100;
                        var total_gei = Math.round(parseFloat(data[i]["TOTAL_GEI"]) * 100) / 100;

                        //var total_gei = Math.round(data[i]["TOTAL_GEI_REDUCIDO"]);
                        var desc_gei = "tCO<sub>2</sub>eq";
                        if (total_gei > 999) {
                            total_gei = Math.round((total_gei / 1000) * 100) / 100;
                            desc_gei = "KtCO<sub>2</sub>eq";
                            if (total_gei > 999) {
                                total_gei = Math.round((total_gei / 1000) * 100) / 100;
                                desc_gei = "MtCO<sub>2</sub>eq";
                                if (total_gei > 999) {
                                    total_gei = Math.round((total_gei / 1000) * 100) / 100;
                                    desc_gei = "GtCO<sub>2</sub>eq";
                                }
                            }
                        }


                        $("#medida-" + data[i]["ID_MEDMIT"]).html(data[i]["NOMBRE_MEDMIT"]);
                        //$("#medida-valor-" + data[i]["ID_MEDMIT"]).html(total_med);
                        //total += total_med;
                        $("#medida-unidad-" + data[i]["ID_MEDMIT"]).html("").html(desc_gei);
                        $("#medida-valor-" + data[i]["ID_MEDMIT"]).html(total_gei);
                        //total += total_gei;
                        total += Math.round(parseFloat(data[i]["TOTAL_GEI"]) * 100) / 100
                    }
                    $("#cantidadReducido").html(formatoMiles( Math.round(total * 100) / 100 ));
                }
            } else {
            }
        }
    });
}

$(document).ready(function () {
    var anno = (new Date).getFullYear();
    calcularTotalGei(anno);
});

function formatoMiles(n) { //add20
    return n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,');
}