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
        <td id="Logo" width="10%">
            <img src="./Resources/Images/Logo.png" onclick="toHome()">
            <br/>
        </td>
        <td width="90%" style="text-align:right" class="mainTheme">
            <%
                String unom = (String)this.getServletContext().getAttribute("Usuario");
                if(unom == null || unom.isEmpty()){
                    out.print("<button id=\"LoginButton\">Sign in</button>");
                } else {
                    out.print("<button id=\"LoginButton\">Log out</button>");
                }
            %>
        </td>
        <!-- Button Links -->
    </tr>
</table>
<table class="mainTheme" cellspacing="0" width="80%" align="center">
    <tr class="backcolor">
        <td width="100%" style="text-align:left">
            <button class="UpperButtons" action="reg">Explore 3dHub</button>
            <button class="UpperButtons" action="comm">Search</button>
            <button class="UpperButtons" action="uberuns">Features</button>
            <button class="UpperButtons" action="uberuns">Blog</button>
        </td>
    </tr>
</table>
</div>
<div class="mainTheme" id="dialog-form" title="Sign In">
	<p class="validateTips">All form fields are required.</p>

	<form>
	<fieldset>
		<label for="name">Username</label>
		<input type="text" id="Username" class="text ui-widget-content ui-corner-all" />
		<label for="password">Password</label>
		<input type="password" id="Password" value="" class="text ui-widget-content ui-corner-all" />
	</fieldset>
	</form>
</div>

<hr class="hrstyle">