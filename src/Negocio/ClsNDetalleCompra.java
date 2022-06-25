/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Entidad.ClsEDetalleCompra;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Usuario
 */
public class ClsNDetalleCompra {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public boolean MtdResgistrarDetalle(ClsEDetalleCompra objED) {
        try {
            String sql = "CALL USP_I_AgregarDetalleCompra(?,?,?,?,?,?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            System.out.println(objED.getCantidad());
            System.out.println(objED.getProducto().getPrecio_unitario());
            System.out.println(objED.getSubtotal());
            System.out.println(objED.getProducto().getNombre());
            System.out.println(objED.getCompra().getId_compra());
            System.out.println(objED.getProducto().getId_producto());

            ps.setInt(1, objED.getCantidad());
            ps.setDouble(2, objED.getProducto().getPrecio_unitario());
            ps.setDouble(3, objED.getSubtotal());
            ps.setString(4, objED.getProducto().getNombre());
            ps.setInt(5, objED.getCompra().getId_compra());
            ps.setInt(6, objED.getProducto().getId_producto());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("ERROR:: " + e.getMessage());
            return false;
        }
    }

}
