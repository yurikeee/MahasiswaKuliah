/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Yurike
 */
public class JDBC {
    Connection con;
    Statement stmt;
    public boolean isConnected; //apakah bisa konek
    public String message; //jika ada error
    
    public JDBC() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/test","root","");
            stmt = con.createStatement();
            isConnected = true;
            message = "DB connected";
        } catch (Exception e) {
            isConnected = false;
            message = e.getMessage();
        }
    }
    public void disconnect(){
        try {
            stmt.close();
            con.close();
            message = "DB disconnect";
        } catch (Exception e) {
            message = e.getMessage();
        }
    }
    public void runQuery(String query){
        try {
            int result = stmt.executeUpdate(query);
            message = "info: " + result + " rows affected";
        } catch (Exception e) {
            message = e.getMessage();
        }
    }
    public ResultSet getData(String query) {
        ResultSet rs = null;
        try {
            rs = stmt.executeQuery(query);
        } catch (Exception e) {
            message = e.getMessage();
        }
        return rs;
    }
    public ResultSet getDataP(String query, int offset, int max) {
        ResultSet rs = null;
        try {
            rs = stmt.executeQuery(query + " LIMIT " + offset + "," + max);
        } catch (Exception e) {
            message = e.getMessage();
        }
        return rs;
    }
    String message() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
