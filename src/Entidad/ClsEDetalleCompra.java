/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;

/**
 *
 * @author Usuario
 */
public class ClsEDetalleCompra {

    int id_detalle;
    int cantidad;
    double subtotal;
    ClsECompra compra;
    ClsEProducto producto;

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

    public ClsECompra getCompra() {
        return compra;
    }

    public void setCompra(ClsECompra compra) {
        this.compra = compra;
    }

    public ClsEProducto getProducto() {
        return producto;
    }

    public void setProducto(ClsEProducto producto) {
        this.producto = producto;
    }

}
