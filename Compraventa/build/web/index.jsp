<%-- 
    Document   : index
    Created on : Jan 19, 2013, 3:19:15 PM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes.jsp" %>
        <script src="js/index.js"></script>
        <link rel="stylesheet" type="text/css" href="css/index.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="bodyTables"><br /><br />
        <c:choose>
            <c:when test="${empty Usuario}">
            <table class="bodyTable" cellspacing="0" width="80%" align="center">
                <tr height="100%">
                    <td width="50%" id="Propaganda" class="SignUpForm">
                        <h1>Welcome to your 3D designs and printers marketplace</h1>
                        <p>Sign up for an account and start buying and selling your designs 
                            and/or 3Dprinter time</p>
                    </td>
                    <td width="50%" id="SignUp">
                            <span id="tips" class="SignUpForm">All form fields are required.</span>
                                <input name="CR" type="hidden" id="CR">
                                <table width="100%">
                                    <tr><td class="mainTheme">
                                            <label for="Username" class="SignUpForm">Username: </label> <label id="lblErrUsr" class="err"></label>
                                            <input type="text" name="Username" onchange="val()" id="Username" class="text ui-widget-content ui-corner-all" />
                                        </td></tr><tr><td class="mainTheme">
                                            <label for="Email" class="SignUpForm">Email: </label> <label id="lblErrEmail" class="err"></label>
                                            <input type="text" name="Email" onchange="val()" id="Email" class="text ui-widget-content ui-corner-all" />
                                        </td></tr><tr><td class="mainTheme">
                                            <label for="Password" class="SignUpForm">Password: </label> <label id="lblErrPass" class="err"></label>
                                            <input type="password" name="Password" onchange="val()" id="Password" class="text ui-widget-content ui-corner-all" />
                                        </td></tr><tr><td class="mainTheme">
                                            <label for="CPassword" class="SignUpForm">Confirm Password: </label> <label id="lblErrPass" class="err"></label>
                                            <input type="password" id="CPassword" onchange="val()" class="text ui-widget-content ui-corner-all" />
                                        </td></tr><tr><td class="greenParts" style="text-align: right">
                                            <button id="SignUpButton" onclick="cr()">Sign Up</button>
                                        </td></tr>
                                </table>
                    </td>
                </tr>
            </table>
            </c:when>
            <c:otherwise>
            <table class="bodyTable" cellspacing="0" width="80%" align="center">
                <tr height="100%">
                    <td width="100%" id="Propaganda" class="SignUpForm">
                        <h1>Welcome <c:out value="${Usuario}" /></h1>
                        <p>Start searching for the articles you have been looking for!</p>
                        <input id="goSearch" />
                        <span><a class="boton" onclick="search()">Search</a></span>
                    </td>
                </tr>
            </table>    
            </c:otherwise>
        </c:choose><br /><br />
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
