<%-- 
    Document   : index
    Created on : Jan 19, 2013, 3:19:15 PM
    Author     : Andres
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
        for(Cookie c: cookies){
            if(c.getName().compareTo("Usuario") == 0
                    && c.getValue().compareTo("null") != 0
                    && !c.getValue().isEmpty()){
                this.getServletContext().setAttribute("Usuario", c.getValue());
                break;
            }
        }
    }
%>
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
                <tr>
                    <td width="100%">
                        <h1>Bienvenido a MiTianguis.com</h1>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="TablaVentasInicio">
                            <tr>
                            <c:forEach items="${ventasInicio}" var="venta" varStatus="i">
                                <c:when test="${i.count % 3 == 0}">
                            </tr>
                            <tr>
                                </c:when>
                                <td>
                                    <div class ="imgdiv">
                                        
                                    </div>
                                </td>
                            </c:forEach>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </c:when>
        </c:choose><br /><br />
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
