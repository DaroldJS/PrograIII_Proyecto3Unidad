/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Entidad.ClsEProducto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClsNProducto {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ClsNCategoria objNcat = new ClsNCategoria();
    ClsNMarca objNmar = new ClsNMarca();

    public ClsEProducto MtdBuscarProducto(int id) {
        ClsEProducto pro = null;
        try {
            String sql = "CALL USP_B_BuscarProducto(?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new ClsEProducto();
                pro.setId_producto(rs.getInt("id_producto"));
                pro.setCodigo(rs.getString("codigo"));
                pro.setNombre(rs.getString("nombre"));
                pro.setCantidad(rs.getInt("cantidad"));
                pro.setPrecio_unitario(rs.getDouble("precio_unitario"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setMarca(objNmar.MtdBuscarMarca(rs.getInt("id_marca")));
                pro.setCategoria(objNcat.MtdBuscarCategoria(rs.getInt("id_categoria")));
            }
            return pro;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
            return pro;
        }
    }

    public Iterable<ClsEProducto> MtdListarProducto() {
        try {
            String sql = "CALL USP_S_ListarProductos()";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();
            ArrayList<ClsEProducto> lista = new ArrayList<>();
            ClsEProducto pro;

            while (rs.next()) {
                pro = new ClsEProducto();
                pro.setId_producto(rs.getInt("id_producto"));
                pro.setCodigo(rs.getString("codigo"));
                pro.setNombre(rs.getString("nombre"));
                pro.setCantidad(rs.getInt("cantidad"));
                pro.setPrecio_unitario(rs.getDouble("precio_unitario"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setEstado(rs.getBoolean("estado"));
                pro.setMarca(objNmar.MtdBuscarMarca(rs.getInt("id_marca")));
                pro.setCategoria(objNcat.MtdBuscarCategoria(rs.getInt("id_categoria")));
                lista.add(pro);
            }
            return lista;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public ClsEProducto BuscarProductoPorCodigo(String codigo) {
        ClsEProducto pro = null;
        try {
            String sql = "CALL USP_B_BuscarProductoPorCodigo(?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setString(1, codigo);
            rs = ps.executeQuery();
            if (rs.next()) {
                pro = new ClsEProducto();
                pro.setId_producto(rs.getInt("id_producto"));
                pro.setNombre(rs.getString("nombre"));
                pro.setCodigo(rs.getString("codigo"));
                pro.setPrecio_unitario(rs.getDouble("precio_unitario"));
            }
            return pro;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
            return pro;
        }
    }

}
