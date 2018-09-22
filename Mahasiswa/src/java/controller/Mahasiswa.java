/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Yurike
 */
@Controller
public class Mahasiswa {
    @RequestMapping("/home.net")
    public String home(ModelMap map, HttpSession sess) {
        return "login_form"; //seperti forward
    }
    
    @RequestMapping(value = "/login.net", method = RequestMethod.POST)
    public String login(HttpSession sess, @RequestParam("username") String username,@RequestParam("password") String password) {
        JDBC db = new JDBC();
        if (db.isConnected) {
            try {
                System.out.println("CEK DB");
                String user = username;
                String pass = password;
                ResultSet rs = db.getData("select password from login where username = '" + user +"'");
                if (rs.next() && rs.getString("password").equals(pass)) {
                    sess.setAttribute("udah login", "apapun");
                    return "redirect:beranda.net?p=1";
                } else {
                    System.out.println("Gagal Login");
                    return "redirect:home.net";
                }
                
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
            
        } else {
            System.out.println(db.message);
        }
        return "beranda.net";
    }
    
    @RequestMapping("/beranda.net")
    public String beranda(ModelMap map, HttpSession sess, @RequestParam (value="p", required=false, defaultValue = "1") String pa) {
        JDBC db = new JDBC();
        ResultSet rs = null;
        int p = Integer.parseInt(pa);
        int maxdata = 5;
        if(db.isConnected) {
            rs = db.getDataP("select * from mahasiswa", maxdata*(p-1), maxdata);
            map.addAttribute("mhs", rs);
        } else{
            db.message();
        }
        return "mahasiswa";
    }
    @RequestMapping("/insert.net")
    public String insert() {
        return "insertmhs";
    }
    @RequestMapping(value = "/insertmaha.net", method = RequestMethod.POST)
    public String insertMahasiswa(HttpSession sess,
            @RequestParam("nim") String nim,
            @RequestParam("namaMhs") String namaMhs,
            @RequestParam("alamat") String alamat,
            @RequestParam("kodeJurusan") String kodeJurusan,
            @RequestParam("kodeFakultas") String kodeFakultas) throws ParseException{
        JDBC db = new JDBC();
        if (db.isConnected) {
            System.out.println("Cek DB");
            String n = nim;
            String nl = namaMhs;
            String alam = alamat;
            int kj = Integer.parseInt(kodeJurusan);
            int kf = Integer.parseInt(kodeFakultas);
            db.runQuery("insert into mahasiswa (nim, namaMhs, alamat, kodeJurusan, kodeFakultas) values ('" + n + "','" + nl + "','" + alam + "'," + kj + "," + kf +" )");
        }  
        return "redirect:beranda.net?p=1";
    }
    @RequestMapping(value = "/deletemhs.net")
    public String deleteMahasiswa(HttpSession sess, @RequestParam("nim") String nim){
        JDBC db = new JDBC();
        if (db.isConnected) {
            System.out.println("Cek DB");
            String n = nim;
            db.runQuery("delete from mahasiswa where nim = '"+ n +"'");
        }  
        return "redirect:beranda.net?p=1";
    } 
    @RequestMapping("/updatemhs.net")
    public String update() {
        return "updatemahasiswa";
    }
    @RequestMapping(value = "/updatemaha.net", method = RequestMethod.POST)
    public String updateMahasiswa(HttpSession sess,
            @RequestParam("nim") String nim,
            @RequestParam("namaMhs") String namaMhs,
            @RequestParam("alamat") String alamat) throws ParseException{
        JDBC db = new JDBC();
        String n = nim;
        String nl = namaMhs;
        String alam = alamat;
        db.runQuery("update mahasiswa set namaMhs ='"+ nl + "', alamat ='" +alam +"' where nim = '"+ n +"'");
        
        return "redirect:beranda.net?p=1";
    }
}
