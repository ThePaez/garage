<%-- 
    Document   : header
    Created on : Jan 19, 2013, 5:40:34 PM
    Author     : Andres
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- LOGO -->
<table width="100%" class="backcolor" cellspacing="0">
    <tr>
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
<table width="100%" class="mainTheme" cellspacing="0">
    <tr class="backcolor">
        <td width="10%">
            <button class="UpperButtons" value="Register" name="Register" action="reg">Register</button>
        </td>
        <td width="10%">
            <button class="UpperButtons" value="Community" name="Community" action="comm">Community</button>
        </td>
        <td width="10%">
            <button class="UpperButtons" value="About Us" name="About Us" action="uberuns">About Us</button>
        </td>
        <td width="70%">
        </td>
    </tr>
</table>
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
<hr color="Blue">