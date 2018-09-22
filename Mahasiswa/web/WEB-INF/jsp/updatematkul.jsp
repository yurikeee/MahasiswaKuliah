<%-- 
    Document   : updatematkul
    Created on : 21-Sep-2018, 21:40:02
    Author     : Yurike
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controller.JDBC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#F0FFFF">>
    <center>
        <%
            int kodeMatkul=0;
            String namaMatkul="";
            int sksMatkul=0;
            
            JDBC db = new JDBC();
            if (db.isConnected) {
                System.out.println("Cek DB");
                kodeMatkul = Integer.parseInt(request.getParameter("kodeMatkul"));
                ResultSet rs = db.getData("select * from matakuliah where kodeMatkul='"+ kodeMatkul +"'");
                while(rs.next()){
                    namaMatkul = rs.getString("namaMatkul");
                    sksMatkul = rs.getInt("sksMatkul");
                }
                db.disconnect();
            }else{
                out.print(db.message + "<br />");
            }  
        %>
        <form action="updatemat.net?kodeMatkul=<%=kodeMatkul%>" method="post">
            <h2>Update Mata Kuliah</h2>
            Ganti Nama Mata Kuliah <input type="text" name="namaMatkul" value="<%=namaMatkul%>"/>
            Ganti SKS Mata Kuliah <input type="text" name="sksMatkul" value="<%=sksMatkul%>"/>
            <input type="submit" name="Update" value="Update"/>
        </form>
    </center>
    </body>
</html>
