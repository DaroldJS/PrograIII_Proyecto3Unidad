/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Entidad.ClsECategoria;
import Entidad.ClsEMarca;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class ClsNMarca {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    ClsEMarca MtdBuscarMarca(int id) {
        ClsEMarca mar = null;
        try {
            String sql = "CALL USP_B_BuscarMarca(?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                mar = new ClsEMarca();
                mar.setId_marca(rs.getInt("id_marca"));
                mar.setNombre(rs.getString("nombre"));
            }
            return mar;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
            return mar;
        }
    }

}
