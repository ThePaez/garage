<%-- 
    Document   : nuevaVenta
    Created on : 28/03/2013, 07:02:17 PM
    Author     : Andres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <%@include file="includes.jsp" %>
        <script src="js/nuevaVenta.js"></script>
        <link rel="stylesheet" type="text/css" href="css/nuevaVenta.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <c:choose>
        <c:when test="${empty Usuario}">
            <table class="bodyTable" cellspacing="0" width="80%" align="center">
                <tr>
                    <td>
                        <p> Inicia sesión con tu usuario o crea un <a href="reg">nuevo 
                        usuario</a> para empezar a vender!</p>
                    </td>
                </tr>
            </table>
        </c:when>  
        <c:otherwise>
            <table class="bodyTable" cellspacing="0" width="80%" align="center">
                <tr>
                    <td>
                        <form id="upload" action="upload.php" method="POST" enctype="multipart/form-data">
                        <fieldset>
                            <legend>HTML File Upload</legend>
                            <input type="hidden" id="MAX_FILE_SIZE" name="MAX_FILE_SIZE" value="300000" />
                            <div>
                                    <label for="fileselect">Files to upload:</label>
                                    <input type="file" id="fileselect" name="fileselect[]" multiple="multiple" />
                                    <div id="filedrag">or drop files here</div>
                            </div>
                            <div id="submitbutton">
                                    <button type="submit">Upload Files</button>
                            </div>
                        </fieldset>
                        </form>
                    </td>
                </tr>
            </table>
        </c:otherwise>
        </c:choose>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
