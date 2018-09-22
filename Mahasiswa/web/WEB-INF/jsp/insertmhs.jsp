<%-- 
    Document   : insertmhs
    Created on : 21-Sep-2018, 11:31:43
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
        <form method="post" action="insertmaha.net">
            <h2>Tambah Mahasiswa</h2>
            Nim Mahasiswa <input type="text" name="nim" placeholder="ex. 630111"/><br/>
            Nama Mahasiswa <input type="text" name="namaMhs" placeholder="ex. Santi"/><br/>
            Alamat <input type="text" name="alamat" placeholder="ex. Jalan Blimbing, Malang"/><br/>
            Jurusan <input type="radio" id="teknikkomputer" name="kodeJurusan" value="1" checked />
                    <label for="teknikkomputer">Teknik Komputer</label>
                    <input type="radio" id="manajemeninformatika" name="kodeJurusan" value="2" />
                    <label for="manajemeninformatika">Manajemen Informatika</label><br/>
            Fakultas <input type="radio" id="ilmuterapan" name="kodeFakultas" value="1" checked />
                     <label for="ilmuterapan">Ilmu Terapan</label>
                     <input type="radio" id="informatika" name="kodeFakultas" value="2" />
                     <label for="informatika">Informatika</label><br/>
            <input type="submit" name="Tambah" value="Tambah"/>
        </form>
    </center>
    </body>
</html>
