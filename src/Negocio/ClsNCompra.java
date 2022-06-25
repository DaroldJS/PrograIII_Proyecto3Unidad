/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Entidad.ClsECompra;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class ClsNCompra {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public boolean MtdResgistrarCompra(ClsECompra objEC) {
        try {
            String sql = "CALL USP_I_AgregarCompra(?,?,?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setDouble(1, objEC.getTotal());
            ps.setInt(2, objEC.getId_empleado());
            ps.setInt(3, objEC.getId_proveedor());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public int MtdBuscarUltimaCompra() {
        int id_compra = 0;
        try {
            String sql = "CALL USP_B_BuscarUltimaCompra";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                id_compra = rs.getInt("id_compra");
            }
            return id_compra;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
            return id_compra;
        }
    }

}
