<%-- 
    Document   : header
    Created on : Jan 19, 2013, 5:40:34 PM
    Author     : Andres
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- LOGO -->
<div class="headTables">
<table width="80%" align="center" cellspacing="0">
    <tr class="backcolor">
        <td id="Logo" style="text-align:left">
            <img src="./Resources/Images/Logo.png" onclick="window.location='home'">
            <br/>
        </td>
        <td style="text-align:right" class="mainTheme">
            <%
                String unom = (String)this.getServletContext().getAttribute("Usuario");
                if(unom == null || unom.isEmpty()){
                    out.print("<span class=\"boton\"><a class=\"boton\" onclick=\"window.location='reg'\">Nuevo Usuario</a></span>");
                    out.print("<span class=\"boton\"><a class=\"boton\" onclick=\"callDialog()\">Iniciar Sesión</a></span>");
                } else {
                    out.print("<span class=\"boton\"><a class=\"boton\" onclick=\"callDialog()\">Cerrar Sesión</a></span>");
                }
            %>
        </td>
        <!-- Button Links -->
    </tr>
</table>
<table class="mainTheme" cellspacing="0" width="80%" align="center">
    <tr class="backcolor">
        <td width="100%" style="text-align:left">
            <span class="boton"><a class="boton" onclick="nVenta()">Crear venta</a></span>
            <span class="boton"><a class="boton" onclick="busca()">Buscar</a></span>
            <span class="boton"><a class="boton" onclick="nVenta()">Features</a></span>
            <span class="boton"><a class="boton" onclick="nVenta()">Blog</a></span>
        </td>
    </tr>
</table>
</div>
<div class="mainTheme" id="dialog-form" title="Sign In">
	<p class="validateTips">Todos los campos son necesarios</p>

	<form>
	<fieldset>
		<label for="name">Usuario</label>
		<input type="text" id="Username" class="text ui-widget-content ui-corner-all" />
		<label for="password">Contraseña</label>
		<input type="password" id="Password" value="" class="text ui-widget-content ui-corner-all" />
	</fieldset>
	</form>
</div>
        
<div class="mainTheme" id="dialog-form1" title="Busqueda">
	<form>
	<fieldset>
		<label for="Busca">Buscar: </label>
		<input type="text" id="Busca" class="text ui-widget-content ui-corner-all" />
	</fieldset>
	</form>
</div>

<hr class="hrstyle">