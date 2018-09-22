<%-- 
    Document   : updatemahasiswa
    Created on : 21-Sep-2018, 12:28:58
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
    <body bgcolor="#F0FFFF">
    <center>
        <%
            String nim="";
            String namaMhs="";
            String alamat="";
            
            JDBC db = new JDBC();
            if (db.isConnected) {
                System.out.println("Cek DB");
                nim = request.getParameter("nim");
                ResultSet rs = db.getData("select * from mahasiswa where nim='"+ nim +"'");
                while(rs.next()){
                    namaMhs = rs.getString("namaMhs");
                    alamat = rs.getString("alamat");
                }
                db.disconnect();
            }else{
                out.print(db.message + "<br />");
            }  
        %>
        <form action="updatemaha.net?nim=<%=nim%>" method="post">
            <h2>Update Data Mahasiswa</h2>
            Ganti Nama Mahasiswa <input type="text" name="namaMhs" value="<%=namaMhs%>"/>
            Ganti Alamat <input type="text" name="alamat" value="<%=alamat%>"/>
            <input type="submit" name="Update" value="Update"/>
        </form>
    </center>
    </body>
</html>
