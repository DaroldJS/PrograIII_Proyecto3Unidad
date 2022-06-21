/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Entidad.ClsEVenta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class ClsNVenta {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public boolean MtdResgistrarVenta(ClsEVenta objEE) {
        try {
            String sql = "CALL USP_I_AgregarVenta(?,?,?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setDouble(1, objEE.getTotal());
            ps.setInt(2, objEE.getId_empleado());
            ps.setInt(3, objEE.getId_cliente());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public int MtdBuscarUltimaVenta() {
        int id_venta = 0;
        try {
            String sql = "CALL USP_B_BuscarUltimaVenta";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                id_venta = rs.getInt("id_venta");
            }
            return id_venta;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
            return id_venta;
        }
    }

}
