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
                        <span class="boton"><a class="boton" onclick="verImagen()">Ver imagen</a></span>
                        <span class="boton"><a class="boton" onclick="verLista()">Ver lista</a></span>
                        <span class="boton imgspan"><a id="TagButton" class="boton" onclick="toggleTagging()">
                                <img src="./Resources/Images/tag.png"></a></span>
                    </td>
                </tr>
                
                
                <tr>
                    <!-- Vista Imagen -->
                    <td width="70%" id="VistaImagen">
                        <form id="upload">
                        <fieldset id="frame">
                            <legend>Tus artículos</legend>
                            <input type="hidden" id="MAX_FILE_SIZE" name="MAX_FILE_SIZE" value="300000" />
                            <div>
                                    <label for="fileselect">Usa el botón para seleccionar las imágenes de tus artículos:</label>
                                    <input type="file" id="fileselect" name="fileselect[]" multiple="multiple" />
                                    <div id="filedrag">ó arrástralas aquí</div>
                            </div>
                            <div id="submitbutton">
                                    <button type="submit">Upload Files</button>
                            </div>
                        </fieldset>
                        </form>
                    </td>
                    <!-- Vista Lista -->
                    <td width="70%" id="VistaLista" hidden ="hidden">
                    </td>
                    <td width="30%">
                        <form id="upload1">
                        <fieldset id="frame1">   
                            <legend>Detalles del artículo seleccionado</legend>
                            <label>Nombre del artículo</label><br />
                            <input id="Nombre" style="font-weight: 900" /><br />
                            <label>Precio (MXN)</label><br />
                            <input type="text" id="Precio"/><br />
                            <label>Comentarios</label><br />
                            <textarea type="text" id="Comentarios" rows="25" cols="34"></textarea>
                        </fieldset>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div><label for="fondo">Cargar una imagen de fondo:</label>
                        <input type="file" id="fondo"/> </div>
                        <span class="boton"><a class="boton" onclick="vp()">Vista Previa</a></span>
                        <span class="boton"><a class="boton" onclick="listo()">Crear</a></span>
                    </td>
                </tr>
            </table>
        </c:otherwise>
        </c:choose>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
