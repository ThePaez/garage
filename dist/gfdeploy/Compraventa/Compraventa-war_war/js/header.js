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
    return name && name != "null";
}
$(function() {
    $( ".UpperButtons" ).button({
        height:1
        });
    $( "#LoginButton" )
			.button()
			.click(function() {  
                            if(!isLoggedIn()){
                                $( "#dialog-form" ).dialog( "open" );
                            } else {
                                $.post("/Compraventa-war/nusu",{logout:""}, function(data) {
                                    if(data.indexOf("Sesión cerrada") != -1){
                                        window.location = "/Compraventa-war/home";
                                    }
                                });
                            }
                            
			});

        
    var name = $( "#Username" ),
    password = $( "#Password" ),
    allFields = $( [] ).add( name ).add( password ),
    tips = $( ".validateTips" );

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
            updateTips( "Length of " + n + " must be between " +
                min + " and " + max + "." );
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

    $( "#dialog-form" ).dialog({
        autoOpen: false,
        height: 300,
        width: 300,
        modal: true,
        buttons: {
            "Sign in": function() {
                var bValid = true;
                allFields.removeClass( "ui-state-error" );

                bValid = bValid && checkLength( name, "username", 3, 16 );
                bValid = bValid && checkLength( password, "password", 5, 16 );

                bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
                // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
                bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );

                if ( bValid ) {
                    $.post("/Compraventa-war/nusu",{usuario:name[0].value,password:password[0].value}, function(data) {
                        if(data.indexOf("Sesión iniciada") != -1){
                            window.location = "/Compraventa-war/home";
                        } else {
                            updateTips("Username or Password incorrect");
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

