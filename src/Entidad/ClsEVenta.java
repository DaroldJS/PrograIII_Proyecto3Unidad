/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;

/**
 *
 * @author Usuario
 */
public class ClsEVenta {

    int id_venta;
    double total;
    String fecha_creacion;
    boolean estado;
    int id_comprobante;
    int id_empleado;
    int id_cliente;

    public ClsEVenta() {
    }

    public ClsEVenta(int id_venta, double total, String fecha_creacion, boolean estado, int id_comprobante, int id_empleado, int id_cliente) {
        this.id_venta = id_venta;
        this.total = total;
        this.fecha_creacion = fecha_creacion;
        this.estado = estado;
        this.id_comprobante = id_comprobante;
        this.id_empleado = id_empleado;
        this.id_cliente = id_cliente;
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public int getId_comprobante() {
        return id_comprobante;
    }

    public void setId_comprobante(int id_comprobante) {
        this.id_comprobante = id_comprobante;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

}
