/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function setCookie(c_name,value,exdays)
{
    var exdate=new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
    document.cookie=c_name + "=" + c_value;
}
function getCookie(c_name)
{
    var i,x,y,ARRcookies=document.cookie.split(";");
    for (i=0;i<ARRcookies.length;i++)
    {
        x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
        y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
        x=x.replace(/^\s+|\s+$/g,"");
        if (x==c_name){
            return unescape(y);
        }
    }
    return null;
}
function isLoggedIn(){
    var name = getCookie("Usuario");
    return name && name != "null" && name != "";
}
function busca(){
    $( "#dialog-form1" ).dialog( "open" );
}
var redirect = 'home';
function nVenta(){
    if(!isLoggedIn()){
        redirect = 'nuevaventa';
        $( "#dialog-form" ).dialog( "open" );
    } else {
        window.location="nuevaventa";
    }
}
function callDialog(){
    if(!isLoggedIn()){
        redirect = 'home';
        $( "#dialog-form" ).dialog( "open" );
    } else {
        $.post("/Compraventa-war/nusu",{logout:""}, function(data) {
            if(data.indexOf("Sesión cerrada") != -1){
                window.location = "/Compraventa-war/home";
            }
        });
    }
}

$(function() {

    var name = $( "#Username" ),
    password = $( "#Password" ),
    allFields = $( [] ).add( name ).add( password ),
    tips = $( ".validateTips" ),
    buscar = $("#Busca");

    function updateTips( t ) {
        tips
        .text( t )
        .addClass( "ui-state-highlight" );
        setTimeout(function() {
            tips.removeClass( "ui-state-highlight", 1500 );
        }, 500 );
    }

    function checkLength( o, n, min, max ) {
        if ( o.val().length > max || o.val().length < min ) {
            o.addClass( "ui-state-error" );
            updateTips( "El número de caracteres " + n + " debe de estar entre " +
                min + " y " + max + "." );
            return false;
        } else {
            return true;
        }
    }

    function checkRegexp( o, regexp, n ) {
        if ( !( regexp.test( o.val() ) ) ) {
            o.addClass( "ui-state-error" );
            updateTips( n );
            return false;
        } else {
            return true;
        }
    }
    
    $( "#dialog-form1" ).dialog({
        autoOpen: false,
        height: 200,
        width: 300,
        modal:true,
        buttons: {
            "Buscar": function() {
                window.location='buscar?q='+buscar[0].value;
            },
            Cancelar: function() {
                $( this ).dialog( "close" );
            }
        },
        close: function() {
            $( [] ).add(buscar).val( "" ).removeClass( "ui-state-error" );
        }
    });
    $("#dialog-form1").dialog().parents(".ui-dialog:eq(0)").addClass("mainTheme");

    $( "#dialog-form" ).dialog({
        autoOpen: false,
        height: 300,
        width: 300,
        modal: true,
        buttons: {
            "Sign in": function() {
                var bValid = true;
                allFields.removeClass( "ui-state-error" );

                bValid = bValid && checkLength( name, "del usuario", 4, 20 );
                bValid = bValid && checkLength( password, "de la contraseña",6, 20 );

                bValid = bValid && checkRegexp( name, /^[a-zA-Zñ0-9\(\)\-\.\?\[\]\+\*\/\,"'_]{4,20}$/, 'Nombre de usuario tiene que tener entre 4 y 20 caracteres incluyendo: ()_-.?[]+*/,\"\' ' );
                // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
                bValid = bValid && checkRegexp( password, /^[a-zA-Zñ0-9\(\)\-\.\?\[\]\+\*\/\,"'_]{6,20}$/, 'La contraseña debe de tener entre 6 y 20 caracteres incluyendo: ()_-.?[]+*/,\"\' ' );

                if ( bValid ) {
                    $.post("/Compraventa-war/nusu",{usuario:name[0].value,password:password[0].value}, function(data) {
                        if(data.indexOf("Sesión iniciada") != -1){
                            window.location = redirect;
                        } else {
                            updateTips("Usuario o contraseña inválido");
                        }
                    });
                }
            },
            Cancel: function() {
                $( this ).dialog( "close" );
            }
        },
        close: function() {
            allFields.val( "" ).removeClass( "ui-state-error" );
        }
    });
    $("#dialog-form").dialog().parents(".ui-dialog:eq(0)").addClass("mainTheme");
});

