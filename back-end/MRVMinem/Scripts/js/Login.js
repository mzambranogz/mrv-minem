function fn_IniciarSesion() {
    var url = baseUrl + "Publico/Portal/IniciarSesion";
    var item = {
        USUARIO: $("#loginUsuario").val(),
        USUPASS: $("#loginPassword").val()
    };

    var respuesta = MRV.Ajax(url, item, false);
    if (respuesta.success) {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            onOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer)
                toast.addEventListener('mouseleave', Swal.resumeTimer)
            }
        })

        Toast.fire({
            icon: 'success',
            title: 'Inicio Sesión Correctamente'
        })
    } else {
        Swal.fire({
            icon: 'error',
            html: '<small>Usuario y/o Password incorrecto</small>'
        })
    }
}