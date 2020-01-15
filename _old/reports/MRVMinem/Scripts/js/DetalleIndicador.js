$(document).ready(function () {
    CargarTablaIndicador();
});

function CargarTablaIndicador() {
                    $("#cuerpoTablaIndicador").html("");
                        var tr = '<tr>';
                        tr = tr + '<td id="c1"><select id="tipoVehiculo" class="form-control"></select></td>';
                        tr = tr + '<td id="c2"><input type"text" class="form-control" id="tCantidad"/></td>';
                        tr = tr + '<td id="c3"><select id="tipoCombustible" class="form-control"></select></td>';
                        tr = tr + '<td id="c4"><input type"text" class="form-control" id="krvN"/></td>';
                        tr = tr + '<td id="c5"><select id="tipoFuente" class="form-control"></select></td>';
                        tr = tr + '<td id="c6"><input type"text" class="form-control" id ="krvH"/></td>';
                        tr = tr + '<td id="c7"><select class="form-control" id="anno"><option value="2018">2018</option>';
                        tr = tr + '            <option value="2019">2019</option>';
                        tr = tr + '            <option value="2020">2020</option>';
                        tr = tr + '            <option value="2021">2021</option>';
                        tr = tr + '            <option value="2022">2022</option></select></td>';
                        tr = tr + '</tr>';
                        $("#cuerpoTablaIndicador").append(tr);
                        //alert("hola");
                        MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoVehiculo", "#tipoVehiculo", "ID_TIPO_VEHICULO", "DESCRIPCION");
                        MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoCombustible", "#tipoCombustible", "ID_TIPO_COMBUSTIBLE", "DESCRIPCION");
                        MRV.CargarSelect(baseUrl + "Administrado/Gestion/ListarTipoFuente", "#tipoFuente", "ID_TIPO_FUENTE", "DESCRIPCION");

}

