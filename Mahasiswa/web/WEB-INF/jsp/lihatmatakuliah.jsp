<%-- 
    Document   : lihatmatakuliah
    Created on : 21-Sep-2018, 20:51:16
    Author     : Yurike
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#F0FFFF">
    <center>
        <h1>Tabel Mahasiswa yang Mendaftar Mata Kuliah</h1>
            <table border="1" cellpadding="7">
                <tr>
                    <td>NIM</td>
                    <td>Nama Lengkap</td>
                    <td>Mata Kuliah</td>
                    <td>SKS</td>
                </tr>
                <%  ResultSet rs = (ResultSet) request.getAttribute("kodeMatkul");
                        while (rs.next()) {
                            out.print("<tr>");
                            out.print("<td>" + rs.getInt("kodeMatkul") + "</td>");
                            out.print("<td>" + rs.getString("nim") + "</td>");
                            out.print("<td>" + rs.getString("namaMhs") + "</td>");
                            out.print("<td>" + rs.getString("namaMatkul") + "</td>");
                            out.print("<td>" + rs.getInt("sksMatkul") + "</td>");
                            out.print("<td><a href='deletemk.net?kodeMatkul=" + rs.getInt("kodeMatkul") +"'>Hapus Mata Kuliah</a>"
                                    + "&nbsp; <a href='updatemk.net?kodeMatkul=" + rs.getInt("kodeMatkul") +"'>Update Mata Kuliah</a>" + "</td>");
                            out.print("</tr>");
                        }
                %>
                <input type="button" value="Kembali ke beranda" name="back" onclick="location.href='beranda.net'" />
            </table>
            <%
                int p = Integer.parseInt(request.getParameter("p"));
                if(p==1) {
                    out.print("<a href='beranda.net?p="+ (p+1) +"'> Next </a>");
                    
                } else if(p > 1){
                    out.print("<a href='beranda.net?p="+ (p+1) +"'> Next </a>");
                    out.print("<a href='beranda.net?p="+ (p-1) +"'> Previous </a>");
                }
            %>
    </center>
    </body>
</html>
