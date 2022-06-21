/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;

public class ClsEDetalleVenta {

    int id_detalle;
    int cantidad;
    double subtotal;
    ClsEVenta venta;
    ClsEProducto producto;

    public ClsEDetalleVenta() {
    }

    public ClsEDetalleVenta(int id_detalle, int cantidad, double subtotal, ClsEVenta venta, ClsEProducto producto) {
        this.id_detalle = id_detalle;
        this.cantidad = cantidad;
        this.subtotal = subtotal;
        this.venta = venta;
        this.producto = producto;
    }

    public int getId_detalle() {
        return id_detalle;
    }

    public void setId_detalle(int id_detalle) {
        this.id_detalle = id_detalle;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public ClsEVenta getVenta() {
        return venta;
    }

    public void setVenta(ClsEVenta venta) {
        this.venta = venta;
    }

    public ClsEProducto getProducto() {
        return producto;
    }

    public void setProducto(ClsEProducto producto) {
        this.producto = producto;
    }

}
