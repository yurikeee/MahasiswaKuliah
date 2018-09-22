<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body bgcolor="#F0FFFF">
        <center>
            <h1>Tabel Mahasiswa yang Terdaftar</h1>
            <table border="1" cellpadding="7">
                <tr>
                    <td>NIM</td>
                    <td>Nama Lengkap</td>
                    <td>Alamat</td>
                    <td>Kode Jurusan</td>
                    <td>Kode Fakultas</td>
                </tr>
                <%  ResultSet rs = (ResultSet) request.getAttribute("mhs");
                        while (rs.next()) {
                            out.print("<tr>");
                            out.print("<td>" + rs.getString("nim") + "</td>");
                            out.print("<td>" + rs.getString("namaMhs") + "</td>");
                            out.print("<td>" + rs.getString("alamat") + "</td>");
                            out.print("<td>" + rs.getInt("kodeJurusan") + "</td>");
                            out.print("<td>" + rs.getInt("kodeFakultas") + "</td>");
                            out.print("<td><a href='deletemhs.net?nim=" + rs.getString("nim") +"'>Hapus Mahasiswa</a>"
                                    + "&nbsp; <a href='updatemhs.net?nim=" + rs.getString("nim") +"'>Ubah Data Mahasiswa</a>" + "</td>");
                            out.print("</tr>");
                        }
                %>
                <input type="button" value="Tambah Mahasiswa" name="insert" onclick="location.href='insert.net'" />
                <input type="button" value="Lihat Mata Kuliah" name="lihatmatkul" onclick="location.href='lihatmatkul.net'" />
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
