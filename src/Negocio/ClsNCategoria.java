/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Entidad.ClsECategoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class ClsNCategoria {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    ClsECategoria MtdBuscarCategoria(int id) {
        ClsECategoria cat = null;
        try {
            String sql = "CALL USP_B_BuscarCategoria(?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                cat = new ClsECategoria();
                cat.setId_categoria(rs.getInt("id_categoria"));
                cat.setNombre(rs.getString("nombre"));
            }
            return cat;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
            return cat;
        }
    }
    
}
