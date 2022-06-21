/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Negocio;

import Entidad.ClsECargo;
import Entidad.ClsEEmpleado;
import Presentacion.FrmLogin;
import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Usuario
 */
public class ClsNEmpleado {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    ClsNCargo objNcar = new ClsNCargo();

    public boolean MtdLoguear(ClsEEmpleado objEE) {
        try {
            String sql = "CALL USP_S_Loguear(?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setString(1, objEE.getUsuario());
            rs = ps.executeQuery();

            if (rs.next()) {
                if (objEE.getClave().equals(rs.getString("clave"))) {
                    if (rs.getBoolean("estado")) {
                        JOptionPane.showMessageDialog(null,
                                "Ingreso correcto usuario "
                                + rs.getString("E.dni") + "\n"
                                + " " + rs.getString("E.nombre")
                                + " " + rs.getString("E.apellidos"));
                        FrmLogin.puente = rs.getString("E.dni");            // dni
                        FrmLogin.puente2 = rs.getString("C.nombre");        // cargo
                        FrmLogin.puente3 = rs.getString("E.nombre");        // nombre
                        FrmLogin.idempleado = rs.getString("E.id_empleado");// id
                        return true;
                    } else {
                        JOptionPane.showMessageDialog(null, "USUARIO INACTIVO");
                        return false;
                    }
                } else {
                    JOptionPane.showMessageDialog(null, "CLAVE INCORRECTA");
                    return false;
                }

            } else {
                JOptionPane.showMessageDialog(null, "ESTE USUARIO NO EXISTE");
                return false;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage());
            return false;
        }
    }

    public Iterable<ClsEEmpleado> MtdListarEmpleado() {
        try {
            String SQL = "CALL USP_S_ListarEmpleados()";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(SQL);
            rs = ps.executeQuery();
            ArrayList<ClsEEmpleado> lista = new ArrayList<>();
            ClsEEmpleado emp;
            while (rs.next()) {
                emp = new ClsEEmpleado();
                emp.setId_empleado(rs.getInt("id_empleado"));
                emp.setDni(rs.getString("dni"));
                emp.setNombre(rs.getString("nombre"));
                emp.setApellidos(rs.getString("apellidos"));
                emp.setSexo(rs.getString("sexo"));
                emp.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                emp.setDireccion(rs.getString("direccion"));
                emp.setTelefono(rs.getString("telefono"));
                emp.setFecha_ingreso(rs.getString("fecha_ingreso"));
                emp.setUsuario(rs.getString("usuario"));
                emp.setClave(rs.getString("clave"));
                emp.setEstado(rs.getBoolean("estado"));
                emp.setCargo(objNcar.MtdBuscarCargo(rs.getInt("id_cargo")));
                lista.add(emp);

            }
            return lista;
        } catch (SQLException e) {
            return null;
        }
    }

    public ClsEEmpleado MtdBuscarEmpleado(int id) {
        ClsEEmpleado emp = null;
        try {
            String sql = "CALL USP_B_BuscarEmpleado(?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                emp = new ClsEEmpleado();
                emp.setId_empleado(rs.getInt("id_empleado"));
                emp.setDni(rs.getString("dni"));
                emp.setNombre(rs.getString("nombre"));
                emp.setApellidos(rs.getString("apellidos"));
                emp.setSexo(rs.getString("sexo"));
                emp.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
                emp.setDireccion(rs.getString("direccion"));
                emp.setTelefono(rs.getString("telefono"));
                emp.setFecha_ingreso(rs.getString("fecha_ingreso"));
                emp.setUsuario(rs.getString("usuario"));
                emp.setClave(rs.getString("clave"));
                emp.setEstado(rs.getBoolean("estado"));
                emp.setCargo(objNcar.MtdBuscarCargo(rs.getInt("id_cargo")));
            }
            return emp;
        } catch (SQLException e) {
            System.out.println("error: " + e.getMessage());
            return emp;
        }
    }

    public boolean MtdResgistrarEmpleado(ClsEEmpleado objEE) {
        try {
            String SQL = "CALL USP_I_AgregarEmpleado(?,?,?,?,?,?,?,?,?,?,?,?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(SQL);
            ps.setString(1, objEE.getNombre());
            ps.setString(2, objEE.getApellidos());
            ps.setString(3, objEE.getFecha_nacimiento());
            ps.setString(4, objEE.getSexo());
            ps.setString(5, objEE.getDireccion());
            ps.setString(6, objEE.getTelefono());
            ps.setString(7, objEE.getDni());
            ps.setString(8, objEE.getFecha_ingreso());
            ps.setBoolean(9, objEE.isEstado());
            ps.setString(10, objEE.getUsuario());
            ps.setString(11, objEE.getClave());
            ps.setInt(12, objEE.getCargo().getId_cargo());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean MtdModificarEmpleado(ClsEEmpleado objEE) {
        try {
            String sql = "CALL USP_U_ActualizarEmpleado(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            con = ClsConexion.Conectar();
            ps = con.prepareCall(sql);
            ps.setInt(1, objEE.getId_empleado());
            ps.setString(2, objEE.getDni());
            ps.setString(3, objEE.getNombre());
            ps.setString(4, objEE.getApellidos());
            ps.setString(5, objEE.getSexo());
            ps.setString(6, objEE.getFecha_nacimiento());
            ps.setString(7, objEE.getFecha_ingreso());
            ps.setString(8, objEE.getDireccion());
            ps.setString(9, objEE.getTelefono());
            ps.setInt(10, objEE.getCargo().getId_cargo());
            ps.setString(11, objEE.getUsuario());
            ps.setString(12, objEE.getClave());
            ps.setBoolean(13, objEE.isEstado());
            System.out.println(objEE.getSexo());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

}
