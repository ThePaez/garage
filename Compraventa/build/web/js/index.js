/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function checkRegexp( o, regexp) {
        if ( !( regexp.test( o ) ) ) {
            return false;
        } else {
            return true;
        }
    }
function val(){
    var n = document.getElementById("Username").value;
    var e = document.getElementById("Email").value;
    var p = document.getElementById("Password").value;
    var cp = document.getElementById("CPassword").value;
    if(!checkRegexp(n,/^[a-zA-Zñ0-9\(\)\-\.\?\[\]\+\*\/\,"'_]{4,20}$/)){
        $("#lblErrUsr")[0].innerHTML = 'Nombre de usuario tiene que tener entre 4 y 20 caracteres incluyendo: ()_-.?[]+*/,\"\' ';
        $("#lblErrUsr")[0].className = "err";
        $( "#SignUpButton" )[0].onclick=function() {alert("Datos inválidos")};
    } else {
        $.post("/Compraventa-war/nusu", {usuario:n}, function(data, textStatus, jqXHR){
        if(data.indexOf("no") != -1){
            $("#lblErrUsr")[0].innerHTML = "Usuario válido";
            $("#lblErrUsr")[0].className = "nor";
            $( "#SignUpButton" )[0].onclick=cr;
        } else {
            $("#lblErrUsr")[0].innerHTML = 'El nombre de usuario ya existe';
            $("#lblErrUsr")[0].className = "err";
            $( "#SignUpButton" )[0].onclick=function() {alert("Datos inválidos")};
        }
    });
    }
    if(!checkRegexp(e,/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i)){
        $("#lblErrEmail")[0].innerHTML = 'Dirección de correo inválida';
        $("#lblErrEmail")[0].className = "err";
        $( "#SignUpButton" )[0].onclick=function() {alert("Datos inválidos")};
    } else {
        $("#lblErrEmail")[0].innerHTML = 'Dirección de correo válida';
        $("#lblErrEmail")[0].className = "nor";
        $( "#SignUpButton" )[0].onclick=cr;
    } 
    if(p != cp){
        $("#lblErrPass")[0].innerHTML = 'Las contraseñas deben de ser idénticas';
        $("#lblErrPass")[0].className = "err";
        $( "#SignUpButton" ).click=function() {alert("Datos inválidos")};
    } else if(!checkRegexp(p,/^[a-zA-Zñ0-9\(\)\-\.\?\[\]\+\*\/\,"'_]{6,20}$/)){
        $("#lblErrPass")[0].innerHTML = 'La contraseña debe de tener entre 6 y 20 caracteres incluyendo: ()_-.?[]+*/,\"\' ';
        $("#lblErrPass")[0].className = "err";
        $( "#SignUpButton" )[0].onclick=function() {alert("Datos inválidos")};
    } else {
        $("#lblErrPass")[0].innerHTML = 'Contraseña válida';
        $("#lblErrPass")[0].className = "nor";
        $( "#SignUpButton" )[0].onclick=cr;
    }
}
 
function cr(){
    var n = document.getElementById("Username").value;
    var e = document.getElementById("Email").value;
    var p = document.getElementById("Password").value;
    var t = "";
    for (i = 0; i < n.length+e.length+p.length && i/3 < p.length; i++) {
        switch(i%3){
            case 0:
                t+=n[i/3];
                break;
            case 1:
                t+=e[parseInt(i/3)];
                break;
            case 2:
                t+=p[parseInt(i/3)];
                break;
        }
    }
    $.post("/Compraventa-war/nusu", {usuario:n,
        password:t,email:e}, function(data, textStatus, jqXHR){
        if(data.indexOf("Usuario ya existe") == -1)
            window.location = "/Compraventa-war/home";
        else
            alert(data);
    });
}
$(function() {
$( "#SignUpButton" ).button({
        height:1
        });
});
var button = $( "#SignUpButton" );
button.addClass("greenParts");