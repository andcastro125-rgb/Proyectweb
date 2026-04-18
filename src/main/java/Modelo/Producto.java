package Modelo;

public class Producto {
    private String nombre;
    private String categoria;
    private double precio;

    public Producto() {} //vacio
    public Producto(String nombre, String categoria, double precio) {//lleno
        this.nombre    = nombre;
        this.categoria = categoria;
        this.precio    = precio;
    }
    public String getNombre()    { return nombre; }
    public void setNombre(String n) { this.nombre = n; }
    public String getCategoria() { return categoria; }
    public void setCategoria(String c) { this.categoria = c; }
    public double getPrecio()    { return precio; }
    public void setPrecio(double p) { this.precio = p; }
}
