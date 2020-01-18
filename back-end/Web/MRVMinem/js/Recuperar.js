function fn_verificarEmailRecuperar() {
    item = {
        EMAIL_USUARIO: $("#txt-user").val()
    };
    var url = baseUrl + "Publico/Portal/VerificarEmail";
    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        fn_GrabarUsuario();
    } else {
        Swal.fire({
            icon: 'error',
            html: '<small>El correo electrónico ingresado esta siendo usado.</small><br/><small>Pulse <a href="#" onclick="fn_registrarUsuario();">Aquí<a> si desea recuperar su contraseña</small>'
        })
    }
}