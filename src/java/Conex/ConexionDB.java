/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Conex;

import java.sql.*;

/**
 *
 * @author gian_
 */
public class ConexionDB {
    
        public static Connection obtenerConexión(){
            Connection con = null;
            try{
                    String url = "jdbc:mysql://localhost:3306/san_martin";
                    String Driver = "com.mysql.jdbc.Driver";
                    String user = "root";
                    String clave = "";
                    Class.forName(Driver);
                    con = DriverManager.getConnection(url, user, clave);
            } catch (Exception e){
                System.out.println("Error: "+e);
            }
        return con;
        }
    
}
