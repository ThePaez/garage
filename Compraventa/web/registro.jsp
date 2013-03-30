<%-- 
    Document   : registro
    Created on : 29/03/2013, 03:34:22 PM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <%@include file="includes.jsp" %>
        <script src="js/registro.js"></script>
        <link rel="stylesheet" type="text/css" href="css/registro.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <table class="bodyTable" cellspacing="0" width="80%" align="center">
            <tr>
                <td>
                    <span id="tips" class="SignUpForm">Es necesario llenar todos los campos.</span>
                    <input name="CR" type="hidden" id="CR">
                    <table width="100%">
                        <tr><td class="mainTheme">
                                <label for="Username" class="SignUpForm">Usuario: </label> <label id="lblErrUsr" class="err"></label>
                                <input type="text" name="Username" onchange="val()" id="Username" class="text ui-widget-content ui-corner-all" />
                            </td></tr><tr><td class="mainTheme">
                                <label for="Email" class="SignUpForm">Email: </label> <label id="lblErrEmail" class="err"></label>
                                <input type="text" name="Email" onchange="val()" id="Email" class="text ui-widget-content ui-corner-all" />
                            </td></tr><tr><td class="mainTheme">
                                <label for="Password" class="SignUpForm">Contraseña: </label> <label id="lblErrPass" class="err"></label>
                                <input type="password" name="Password" onchange="val()" id="Password" class="text ui-widget-content ui-corner-all" />
                            </td></tr><tr><td class="mainTheme">
                                <label for="CPassword" class="SignUpForm">Confirma contraseña: </label> <label id="lblErrPass" class="err"></label>
                                <input type="password" id="CPassword" onchange="val()" class="text ui-widget-content ui-corner-all" />
                            </td></tr><tr><td class="greenParts" style="text-align: right">
                                <button id="SignUpButton">Crear usuario</button>
                            </td></tr>
                    </table>
                </td>
            </tr>
        </table>
        <%@include file="footer.jsp" %>
    </body>
</html>
