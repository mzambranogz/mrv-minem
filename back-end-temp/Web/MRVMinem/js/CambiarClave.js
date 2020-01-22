function Clave() {

    var arr = [];
    var clave = $("#txt-pswd").val();
    var reclave = $("#txt-re-pswd").val();
    $("#seccionMensaje #errorRegistro").remove();
    debugger;
    if (clave == reclave) {
        if (!(/[a-zñ]/.test(clave) && /[A-ZÑ]/.test(clave) && /[0-9]/.test(clave))) {
            arr.push("La nueva contraseña debe contener minuscula(s), mayúscula(s) y número(s)");
        }
        if (clave.length < 6) {
            arr.push("La nueva contraseña debe contener 6 o más caracteres");
        }
    } else {
        arr.push("Las contraseñas no coinciden");
    }

    if (arr.length == 0) {
        fn_verificarClave();
        return false;
    } else {
    }
}

function fn_verificarClave() {

}

function CambiarClave() {
    var item = {

    };
}