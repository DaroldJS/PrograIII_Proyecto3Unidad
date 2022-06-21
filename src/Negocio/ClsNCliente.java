/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Entidad.ClsECliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClsNCliente {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public Iterable<ClsECliente> MtdListarCliente() {
        try {
            String sql = "CALL USP_S_ListarCliente()";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();
            ArrayList<ClsECliente> lista = new ArrayList<>();
            ClsECliente cli;

            while (rs.next()) {
                cli = new ClsECliente();
                cli.setId_cliente(rs.getInt("id_cliente"));
                cli.setDni(rs.getString("dni"));
                cli.setNombre(rs.getString("nombre"));
                System.out.println(cli.getDni());
                lista.add(cli);
            }
            System.out.println(lista.size());
            return lista;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    public ClsECliente MtdBuscarCliente(int id) {
        ClsECliente cli = null;
        try {
            String sql = "CALL USP_B_BuscarCliente(?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                cli = new ClsECliente();
                cli.setId_cliente(rs.getInt("id_cliente"));
                cli.setDni(rs.getString("dni"));
                cli.setNombre(rs.getString("nombre"));
            }
            return cli;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
            return cli;
        }
    }

}
