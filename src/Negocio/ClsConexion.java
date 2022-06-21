/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class ClsConexion {

    public static Connection Conectar() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/dbdrashastore", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            return null;
        }
    }

}
