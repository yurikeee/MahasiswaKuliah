<%-- 
    Document   : login_form
    Created on : 21-Sep-2018, 12:23:59
    Author     : Yurike
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#F0FFFF">
    <center>
        <h1>Login</h1>
        <form method="post" action="login.net">
            Username : <input type="text" name="username" required="" /> <br />
            Password : <input type="password" name="password" required=""/> <br />
            <input type="submit" value="Masuk" name="Masuk" />
        </form>
    </center>
    </body>
</html>
