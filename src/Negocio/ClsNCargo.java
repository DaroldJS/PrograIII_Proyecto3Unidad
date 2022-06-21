/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Entidad.ClsECargo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClsNCargo {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public Iterable<ClsECargo> LlenarCargo() {
        try {
            String sql = "SELECT nombre FROM tbcargo";
            Connection con = ClsConexion.Conectar();
            PreparedStatement st = con.prepareCall(sql);
            ResultSet rs = st.executeQuery();
            ArrayList<ClsECargo> lista = new ArrayList<>();
            ClsECargo car;
            while (rs.next()) {
                car = new ClsECargo();
                car.setNombre(rs.getString("nombre"));
                lista.add(car);
            }
            return lista;
        } catch (SQLException e) {
            return null;
        }
    }

    public ClsECargo MtdBuscarCargo(int id) {
        ClsECargo car = null;
        try {
            String sql = "CALL USP_B_BuscarCargo(?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                car = new ClsECargo();
                car.setId_cargo(rs.getInt("id_cargo"));
                car.setNombre(rs.getString("nombre"));
            }
            return car;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
            return car;
        }
    }

}
