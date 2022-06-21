/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entidad;

/**
 *
 * @author Usuario
 */
public class ClsEProducto {

    int id_producto;
    String codigo;
    String nombre;
    int cantidad;
    double precio;
    String descripcion;
    ClsEMarca marca = new ClsEMarca();
    ClsECategoria categoria = new ClsECategoria();
    boolean estado;

    public ClsEProducto() {
    }

    public ClsEProducto(int id_producto, String codigo, String nombre, int cantidad, double precio_unitario, String descripcion, boolean estado) {
        this.id_producto = id_producto;
        this.codigo = codigo;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.precio = precio_unitario;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio_unitario() {
        return precio;
    }

    public void setPrecio_unitario(double precio_unitario) {
        this.precio = precio_unitario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public ClsEMarca getMarca() {
        return marca;
    }

    public void setMarca(ClsEMarca marca) {
        this.marca = marca;
    }

    public ClsECategoria getCategoria() {
        return categoria;
    }

    public void setCategoria(ClsECategoria categoria) {
        this.categoria = categoria;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

}
