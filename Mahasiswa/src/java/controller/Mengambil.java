/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.ResultSet;
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
public class Mengambil {
   @RequestMapping("/lihatmatkul.net")
    public String LihatMataKuliah(ModelMap map, HttpSession sess, @RequestParam (value="p", required=false, defaultValue = "1") String pa) {
        JDBC db = new JDBC();
        ResultSet rs = null;
        int p = Integer.parseInt(pa);
        int maxdata = 5;
        if(db.isConnected) {
            rs = db.getDataP("SELECT kodeMatkul, nim, namaMhs, namaMatkul, sksMatkul FROM mengambil join mahasiswa using(nim) join matakuliah using(kodeMatkul)", maxdata*(p-1), maxdata);
            map.addAttribute("kodeMatkul", rs);
        } else{
            db.message();
        }
        return "lihatmatakuliah";
    }
//    @RequestMapping("/beranda1.net")
//    public String beranda(ModelMap map, HttpSession sess, @RequestParam (value="p", required=false, defaultValue = "1") String pa) {
//        JDBC db = new JDBC();
//        ResultSet rs = null;
////        int p = Integer.parseInt(pa);
////        int maxdata = 5;
//        if(db.isConnected) {
//            rs = db.getData("SELECT nim, namaMhs, namaMatkul FROM mengambil join mahasiswa using(nim) join matakuliah using(kodeMatkul)");
//            map.addAttribute("matkul", rs);
//        } else{
//            db.message();
//        }
//        return "mahasiswa";
//    }   
    @RequestMapping(value = "/deletemk.net")
    public String deleteMatkul(HttpSession sess, @RequestParam("kodeMatkul") String kodeMatkul){
        JDBC db = new JDBC();
        if (db.isConnected) {
            System.out.println("Cek DB");
            int kodeM = Integer.parseInt(kodeMatkul);
            db.runQuery("delete from matakuliah where kodeMatkul = '+ kodeM +'");
        }  
        return "redirect:beranda1.net?p=1";
    } 
    @RequestMapping("/updatemk.net")
    public String update() {
        return "updatematkul";
    }
    @RequestMapping(value = "/updatemat.net", method = RequestMethod.POST)
    public String updateMahasiswa(HttpSession sess,
            @RequestParam("kodeMatkul") String kodeMatkul,
            @RequestParam("namaMatkul") String namaMatkul,
            @RequestParam("sksMatkul") String sksMatkul){
        JDBC db = new JDBC();
        int kodeM = Integer.parseInt(kodeMatkul);
        String namaM = namaMatkul;
        int sksM = Integer.parseInt(sksMatkul);
        db.runQuery("update matakuliah set namaMatkul ='"+ namaM + "', sksMatkul =" + sksM +" where kodeMatkul = "+ kodeM +"");
        
        return "redirect:beranda1.net?p=1";
    } 
}
