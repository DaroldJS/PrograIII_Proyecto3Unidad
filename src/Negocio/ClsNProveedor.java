/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Entidad.ClsEProveedor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class ClsNProveedor {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public ClsEProveedor MtdBuscarProveedor(int id) {
        ClsEProveedor pro = null;
        try {
            String sql = "CALL USP_B_BuscarProveedor(?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new ClsEProveedor();
                pro.setId_proveedor(rs.getInt("id_proveedor"));
                pro.setRuc(rs.getString("ruc"));
                pro.setRazon_social(rs.getString("razon_social"));
                pro.setDni(rs.getString("dni"));
                pro.setDireccion(rs.getString("direccion"));
                pro.setTelefono(rs.getString("telefono"));
                pro.setEmail(rs.getString("email"));
                pro.setEstado(rs.getBoolean("estado"));
            }
            return pro;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return pro;
        }
    }

    public boolean MtdResgistrarProveedor(ClsEProveedor objEP) {
        try {
            String sql = "CALL USP_I_AgregarProveedor(?,?,?,?,?,?,?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setString(1, objEP.getRuc());
            ps.setString(2, objEP.getRazon_social());
            ps.setString(3, objEP.getDni());
            ps.setString(4, objEP.getDireccion());
            ps.setString(5, objEP.getTelefono());
            ps.setString(6, objEP.getEmail());
            ps.setBoolean(7, objEP.isEstado());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean MtdModificarProveedor(ClsEProveedor objEP) {
        try {
            String sql = "CALL USP_U_ActualizarProveedor(?,?,?,?,?,?,?,?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setString(1, objEP.getRuc());
            ps.setString(2, objEP.getRazon_social());
            ps.setString(3, objEP.getDni());
            ps.setString(4, objEP.getDireccion());
            ps.setString(5, objEP.getTelefono());
            ps.setString(6, objEP.getEmail());
            ps.setBoolean(7, objEP.isEstado());
            ps.setInt(8, objEP.getId_proveedor());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public Iterable<ClsEProveedor> MtdListarProveedor() {
        try {
            String sql = "CALL USP_S_ListarProveedores()";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();
            ArrayList<ClsEProveedor> lista = new ArrayList<>();
            ClsEProveedor pro;

            while (rs.next()) {
                pro = new ClsEProveedor();
                pro.setId_proveedor(rs.getInt("id_proveedor"));
                pro.setRuc(rs.getString("ruc"));
                pro.setRazon_social(rs.getString("razon_social"));
                pro.setDni(rs.getString("dni"));
                pro.setDireccion(rs.getString("direccion"));
                pro.setTelefono(rs.getString("telefono"));
//                System.out.println(pro.get());
                pro.setEmail(rs.getString("email"));
                pro.setEstado(rs.getBoolean("estado"));
                lista.add(pro);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

}
